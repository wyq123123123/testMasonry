//
//  ViewController.m
//  testMasonry
//
//  Created by yanqi wang on 2024/9/24.
//

#import "ViewController.h"
#import <Masonry.h>
@interface ViewController ()
@property(strong,nonatomic) UIView *container;
@property(nonatomic,strong) UIButton *phoneLoginButton;
@property(nonatomic,strong) UIButton *primaryButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.container = [[UIView alloc]init];
    [self.view addSubview:self.container];
    
    UIImageView *logoView= [[UIImageView alloc]init];
    logoView.image = [UIImage imageNamed:@"Logo"];
    [self.container addSubview:logoView];
    
    self.phoneLoginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //设置标题
    [self.phoneLoginButton setTitle:@"手机号登陆" forState:UIControlStateNormal];
    
    //设置点击事件
    [self.phoneLoginButton addTarget:self action:@selector(phoneLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.phoneLoginButton.backgroundColor = [UIColor redColor];
    
    self.phoneLoginButton.layer.cornerRadius = 5;
    
    [self.phoneLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //按下文本颜色
    [self.phoneLoginButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.container addSubview:self.phoneLoginButton];
    
#pragma mark - 登陆按钮
    self.primaryButton=[UIButton buttonWithType:UIButtonTypeSystem];
    
    //设置标题
    [self.primaryButton setTitle:@"用户名和密码登陆" forState:UIControlStateNormal];
    [self.primaryButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    //设置点击事件
    [self.primaryButton addTarget:self action:@selector(primaryClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.primaryButton.backgroundColor = [UIColor clearColor];
    self.primaryButton.layer.cornerRadius = 21;
    self.primaryButton.layer.borderWidth = 1;
    self.primaryButton.layer.borderColor = [UIColor redColor].CGColor;
    [self.container addSubview:self.primaryButton];
    
    #pragma mark - 协议
    //创建控件，如果要实现居中，那就要手动计算获取用自动布局
    UILabel *agrementLabelView = [[UILabel alloc] init];
    
    //设置标题
    agrementLabelView.text=@"登录即表示你同意《用户协议》和《隐私政策》";
    
    agrementLabelView.font = [UIFont systemFontOfSize:12];
    agrementLabelView.textColor=[UIColor grayColor];
    
    [self.container addSubview:agrementLabelView];
    //添加约束
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(16);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-16);
        make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft).offset(16);
        make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight).offset(-16);
    }];
    
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
        make.top.mas_equalTo(100);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    ///asdasdasdasds
    #pragma mark - 协议
    [agrementLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        //距离底部
        make.bottom.mas_equalTo(0);
        
        //水平居中
        make.centerX.equalTo(self.view.mas_centerX);
    }];
#pragma mark - 登陆按钮
    [self.primaryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽和父窗体一样
        make.width.equalTo(self.container.mas_width);
        make.height.mas_equalTo(42);
        
        //底部
        make.bottom.equalTo(agrementLabelView.mas_top).offset(-30);
    }];
    
    
    
    
}

@end
