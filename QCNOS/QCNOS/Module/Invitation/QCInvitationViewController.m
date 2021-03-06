//
//  QCInvitationViewController.m
//  QCNOS
//
//  Created by 量芯集团有限公司 on 2018/9/18.
//  Copyright © 2018年 量芯集团有限公司. All rights reserved.
//

#import "QCInvitationViewController.h"
#import "QCInvitaitionListModel.h"
#import "QCInvitaitionFiltrateCell.h"
#import "QCInvitaitionBaseListCell.h"
#import "QCInvitaitionChartCell.h"
#import "QCInvitationDetailsViewController.h"

@interface QCInvitationViewController ()
@property (nonatomic, strong) NSMutableArray<QCInvitaitionListModel *>* listArray;

@end

static NSString * const QCInvitaitionListCellId = @"QCInvitaitionListCellId";
static NSString * const QCInvitaitionChartCellId = @"QCInvitaitionChartCellId";
static NSString * const QCInvitaitionFiltrateCellId = @"QCInvitaitionFiltrateCellId";

@implementation QCInvitationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationController.navigationBarHidden = NO;
    [self setBaseInfo];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBaseInfo{
    
    self.navigationItem.title = @"邀约";
    
    [self addTableViewWithFrame:CGRectMake(0,0, SCREEN_WIDTH,SCREEN_HEIGHT - StatusBarAndNavigationBarHeight - TabbarHeight)];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QCInvitaitionBaseListCell class]) bundle:nil] forCellReuseIdentifier:QCInvitaitionListCellId];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QCInvitaitionChartCell class]) bundle:nil] forCellReuseIdentifier:QCInvitaitionChartCellId];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QCInvitaitionFiltrateCell class]) bundle:nil] forCellReuseIdentifier:QCInvitaitionFiltrateCellId];

}


#pragma mark - UITableViewDelegate/dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 7;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    if (section == 0) {
//
//        return 1;
//
//
//    }else if (section == 1){
//
//        return 1;
//
//    }
//    return self.listArray.count;
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        
        QCInvitaitionFiltrateCell * cell = [tableView dequeueReusableCellWithIdentifier:QCInvitaitionFiltrateCellId forIndexPath:indexPath];

        return cell;

        
    }else if (indexPath.section == 1){
        
        QCInvitaitionChartCell * cell = [tableView dequeueReusableCellWithIdentifier:QCInvitaitionChartCellId forIndexPath:indexPath];

        return cell;

    }
    
    QCInvitaitionBaseListCell * cell = [tableView dequeueReusableCellWithIdentifier:QCInvitaitionListCellId forIndexPath:indexPath];
//    QCInvitaitionListModel* model = self.listArray[indexPath.row];
//    cell.model = model;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    return 111;
    
    if (indexPath.section == 0) {
        
        return 100;
        
    }else if (indexPath.section == 1){
        
        return 257;
    }
    
    return 260;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    
    return 5;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return CGFLOAT_MIN;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    QCInvitationDetailsViewController* vc = [[QCInvitationDetailsViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 懒加载
-(NSMutableArray<QCInvitaitionListModel *> *)listArray{
    
    if (!_listArray) {
        
        _listArray = @[].mutableCopy;
    }
    
    return _listArray;
    
}
@end
