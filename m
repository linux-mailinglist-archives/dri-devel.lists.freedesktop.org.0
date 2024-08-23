Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957C295D47E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 19:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8D610EC9B;
	Fri, 23 Aug 2024 17:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="qUPstVKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2048.outbound.protection.outlook.com [40.107.215.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484ED10E058
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 12:30:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cP+KUOn8cXTj0LnlIrofZoOOH3i+C/9rJT2Bpr2AebBJli1MqtIansZOKmQko6g1W4EfEKf9MEVUKnwDmVE7KcXex7JgSlf9rb9y6M+pQH7keyXtH6+BpmZ3p7WOlfKUqIaxe5Wkw8+qkXwm08UijjSjDx+GNVw4eqYyJgH7KujrodqNoHgdo3haxxVNwVnOLoYPblU1JbtYivSdeVItilrlZu7gxCxFVEnftwN5LVGsFKAirpu79rGi4RefDNaWQSjgHT48+53LbnyX4U02rBvajRaKD7MmNITZHbbXbYMnbKMFWNQS+Kc1vkvIB7dqQyKWovdKyUsQ0pySA0qJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7bpAQ7cupdvEUiLMqx9JD8lyHyWFdLB7t/mchCwnAo=;
 b=uZxpqL/Ol5ihUscpfl1CI2w4OsF5qpm/XKqIcO5lninZZEpW+piXoGDGI1/5aRmxu3Zd7gFRNqeiOhpFrAemSMuZc0STL8Y2wj89AUyhxNGDWjtzx/x0wQUt8dAg7qkKXvwxHJ+FwxgRdr3VkAbV1LCJwoAe4zZ72rIwOq0wd597O7x1sfNtLbtm+B9GOEwXme/ksPCRrM/Nsz/VPnXnFIy9flfB4KY8n+3kPM2piicB52cwujGcMLwqox6J7tTGFkPrxyDkYWFki/nkjp/8oyqBbhExB+/xKEbhwC7phvx4DijtKtVAh5a0CKMMcysWJ2wMKHZxFpPRYJX/tMmoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7bpAQ7cupdvEUiLMqx9JD8lyHyWFdLB7t/mchCwnAo=;
 b=qUPstVKw3Xaz8MvZdr73xOsCToHZczuQqNl1i7zYVYQJC3NavUtTAeW7SkPGeJsD6802Wqk8H3t4NpZH/tDGJUN6PNnIEt9BMcdKAfMjb8pqPe2FoCno268tDnkj6hNz0IrlB+p/Gq49cGOPEjqe1GpFzs6+sye8RDcfj11Zi/YlJGfnL9Sg2vTK42R1DhbNSnnQQ6/g3CjQW+RRO28Z59TEIOXa5IiclVRJPgLZe1nsl2PyUJCwNmJiC5yWnV0wnny7P9KG3us3dY1wuQirL6j0FcHQaBEa0aEkXZm32LNSa78//yU1tqkltHMcPMZpqJrlNcD67FRX37/Dzouhuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB6332.apcprd06.prod.outlook.com (2603:1096:101:123::11)
 by TY0PR06MB5529.apcprd06.prod.outlook.com (2603:1096:400:27b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 12:30:38 +0000
Received: from SEZPR06MB6332.apcprd06.prod.outlook.com
 ([fe80::6b3f:3bee:4364:6919]) by SEZPR06MB6332.apcprd06.prod.outlook.com
 ([fe80::6b3f:3bee:4364:6919%4]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 12:30:37 +0000
From: ying zuxin <yingzuxin@vivo.com>
To: Helge Deller <deller@gmx.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, yang.yang@vivo.com,
 ying zuxin <yingzuxin@vivo.com>
Subject: [PATCH] fbdev: mmp: Use devm_clk_get_enabled() helpers
Date: Fri, 23 Aug 2024 20:29:57 +0800
Message-Id: <20240823123027.5753-1-yingzuxin@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) To SEZPR06MB6332.apcprd06.prod.outlook.com
 (2603:1096:101:123::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB6332:EE_|TY0PR06MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: 94be780e-5b6c-4caa-b6b7-08dcc36f6497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?exNZgJHnelyKQQK+pDBj3PnIVpJyTuCVtRLYTX4TM17S8I87QXfORd4BvTwd?=
 =?us-ascii?Q?bTwQEGZFqvbiMxOBBpQ/4hbS+gpG8+X3aOptzp9dTEcuRE+6jj/gyI+aKyKu?=
 =?us-ascii?Q?DQU0IZ0//hCO0EI+S3qjoh4Go7CqWpAQflNgwE+Z4p063smSPCmTaNBk8tf2?=
 =?us-ascii?Q?ZtMbAIT1M1xBNd4c68e+n4SsANNiJO/JmZs+BeCyNFtWcJ5rL2OTEioo0cY8?=
 =?us-ascii?Q?aCKZK14Gz4Sye2jcOEDg36CfxkdolTxz94+mlZEyBm9i2UBEkYRq8ew3yQSJ?=
 =?us-ascii?Q?YYZ6dO+bQ9TWoqVaNZ0PBSQpfSEmq5glaHZfXXKe6fBALujUK9Cffgf6R74k?=
 =?us-ascii?Q?fLIea/NOWztB0LeB+LrsP/b/2KL357r8bvVU3o3Do176yaPz9UI+rYqANV4j?=
 =?us-ascii?Q?F6uF11pDUht3bugUfUPl7HFcOeFLRpAX2nMOLRryTSHGAkNpr/g1wfqH7blK?=
 =?us-ascii?Q?sy3CpAMF+VY9JNXHm8ufkMxDiTuPT/hNvolCsNLAu3iKbMn/sHfwZV6qnO/s?=
 =?us-ascii?Q?Za/BpXtTQkaXKuyGKsfG0t+RHSelM1RR/Bi7MsGZel2UMtzmDN6LL4FISt6E?=
 =?us-ascii?Q?h0Q6UMgsNejfijy+EyUljJpEMW9wa51Pm/SCMNizS2bXfwac8uznWGM7wwRq?=
 =?us-ascii?Q?UnoH/UenS6F5fqEQSfWL29ked6j5mNwfinTqhEgiJxOBrdkOj/y+/xpuJmQJ?=
 =?us-ascii?Q?GvdHFQwbOEXPd/Ejx80z07DAKhOUb7DZZKt4UbPQfCTSEwXIsbCVE0hAbc5o?=
 =?us-ascii?Q?tZ3kQW3bCaMMlNdTIU9w6A24Qk27MpcIUnH05fkP3o1d+lb70mJr17nWlH6v?=
 =?us-ascii?Q?6xVfdhi+ya9T5aEpjG+sxqQK7TDlltH1yQ5fu9Cc6e3ShxxRWK4TUqc81NdK?=
 =?us-ascii?Q?/h3O07OhVmA7DHNzt/eNtUKz6YmNiaux1c8SBhyA2HOyDTSblspB3LBkUGtd?=
 =?us-ascii?Q?r1oBwPHAayj7BEzprIhoxRCdGoex+bkze7H9P4WzYV8FKdO1vwesk+nneTQY?=
 =?us-ascii?Q?MTZRduiebrtbF/Kw/27gnBzUIrQpRmmtcKyzf7Gkv1DWCuM/ouK6dgXEZ7QD?=
 =?us-ascii?Q?pFTD8rjK8Vqm+ZGJVUIwySZlLixxZgmYlLHe2D3SsIvfQcdih/m5pk9E4ZwR?=
 =?us-ascii?Q?WJV9tzBN2I8hNsB9tYvkhh/IyvliAoG+HOt7EnjVc/EKenuHo+whj2QWPpl3?=
 =?us-ascii?Q?QKbcgJ2xI/6bUFFN424EgBefGoQ3L4Sq/BD1Sd6DKJi+KRoC1ORMV2lqDIro?=
 =?us-ascii?Q?mYOUVGhDtYaXNlEJ/eSHNGZYqzRVvM6zKmxkkf/W1Vh06GiwjiC6Xh/jp7Tc?=
 =?us-ascii?Q?MHP1FEBn3QbkO4EEeGk1xoCnEFksXENcq3UMl+0HMpxZPNnoHDF2Vc/9dhVk?=
 =?us-ascii?Q?2tlh32puH1w4X0tv5GWWbN7HStwvw1F1ptHsMywCcji6YjjEng=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB6332.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+gSqx12Wpm+p+ScQLoJf348zO7DacvVe8DcpRULlUbEvFT5pjAM15hS/sajB?=
 =?us-ascii?Q?yl1D6TzrN5+lvot4Nt4f1RsSlhUP7X/PnKjVZ7wAtB5ZPb29TPP3VzJQcXvZ?=
 =?us-ascii?Q?QoQkA5s/t1O5hKf5HQ+e9ix00oiGPRDjgJl11iUDLC0ShkJKuhCE8GPoso8t?=
 =?us-ascii?Q?Fr83HyYNCXDfJyN3kQcCSFB2Holwo0SLZTqmgV26ihoGlPmstLThBaRxn8TP?=
 =?us-ascii?Q?3BaXk7s+jaXWGKtQw9C4SbGAi4DLMbV0ijhx69a/Er/tQ9vEyZIwS6I93pGq?=
 =?us-ascii?Q?+d5mkjDU0k6dNOcO2azAX13UViH5Sl1mQ7KRKmVtd6s+UpplsmPlln1TRGDu?=
 =?us-ascii?Q?+Pt7ePvrENJls6A9rjZF0HAKO7B9JcC9B/54rOUR07PRqC+XArcwqumBobK8?=
 =?us-ascii?Q?f+X3nTuTbbyhc4EwuFsgDAYZjM9g5lluVGGV6gURige/HAXmoonXCtimabcu?=
 =?us-ascii?Q?O7aPtID+yfOqP4thOStXmQ9SKHKyqZ8MAifz9nyLI1eYo+w/HDNn6Xym7CRi?=
 =?us-ascii?Q?4jDJWY4qfTXsyjD5Vp1f8lDJAN3QGSxW0Cpq/MhGa2rFM6mKoFAQCnxyMh2S?=
 =?us-ascii?Q?FtVKsj2iKaSPTcfhhXn2P15se1mt4A4xpUjmDG79G+2PcvJd1BAYBfKbahCy?=
 =?us-ascii?Q?aNZOC3R7lwFVK0mzRtLzmkyTy/k071rImD9bE/i2uKN4fqTsmZbsTeOgcVev?=
 =?us-ascii?Q?Vl8FKNSFRFYlgHaC3FksGZDrFqtsLVYmrAqUy6iWPhAfy2MDRx5/b/2lNkmU?=
 =?us-ascii?Q?hRQCT4qrtZNWEb6UCCG2il+mKjBuUG29OE/J5LfboO2KcU8JVyCgEbC5+P8Z?=
 =?us-ascii?Q?VlTTHnoWw0uv4z8+7CQ/vtuRhL/TcWOTCqBGgYXnrDLc5/z0YArNGR2q+1mj?=
 =?us-ascii?Q?NSKOX0yRrcj2oMayONu3Sm24fUelW81OhDQEGTTwVxoMjbY8duWtSAu+cc9E?=
 =?us-ascii?Q?ArI+bwjeVB96sRtIwVuzvUijO653QNnPDVJMUvx6vKVZNU4fnDfeVYKPGlsg?=
 =?us-ascii?Q?AmtC7y6hbM0l5rlBs78QFVc3jD3ycgMAXRlYi4Uo679a8fRmJd7fLGqAxxEh?=
 =?us-ascii?Q?HvdKIUOxDxbMvDgGN/pc31v8ekMvbLla5crVXoeRxb7CKgACiKcxk5dhX4wu?=
 =?us-ascii?Q?FXIRwcYvz3kLwUVcmkaPdO/qXRyWM0fUYTGRNoneycSGgZJTNE9EcpysHioa?=
 =?us-ascii?Q?RpXmOXhIc2BC6hRdT1eNtYR/44ckJ9BTi7wpITRNlVDT7JjIAnwEZQDDp+sq?=
 =?us-ascii?Q?6NTt/5/+0GlkaLdIKZwzt8nEtDRh05vSshrL4WssphAr8f6NFaRpbI3tCpI4?=
 =?us-ascii?Q?afoEncCS2ybVmKUH3L0Irzj+tUkgm8tHwQgFhx/rndEkeXD1mMVFc1hK8Sb1?=
 =?us-ascii?Q?0ts9NDJfIwRn6JtLQICjGyCjFbxtvWAhYFttjs5sZV4zc4sf/8rBtfHCF7ek?=
 =?us-ascii?Q?4njfjgd0LnbVvtyPMSqA6CCPNfU1/hEodp3o15XHuBP1Ms84FHqJuW96EZ+S?=
 =?us-ascii?Q?iXDYO8HxVWNizCJVLFCGgQFcAS2sP/Y6ltdxHxwCq8gDKgXfPTFaJq6uXC8R?=
 =?us-ascii?Q?AgW0MFH579TeVADAzhn2hdly6+hGRZhlfU1iUT8j?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94be780e-5b6c-4caa-b6b7-08dcc36f6497
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6332.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 12:30:37.7418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 787Gb8ihiFYEEAfQjt1RXXBagpc+EEXaYYZJlJ4JjfEGyP8NatedIHJ3VX8974rGYaPaqDU+QnnsSjztqoIKng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5529
X-Mailman-Approved-At: Fri, 23 Aug 2024 17:39:52 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

Signed-off-by: ying zuxin <yingzuxin@vivo.com>
---
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
index a20a2c408127..03e23173198c 100644
--- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
+++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
@@ -512,16 +512,13 @@ static int mmphw_probe(struct platform_device *pdev)
 	}
 
 	/* get clock */
-	ctrl->clk = devm_clk_get(ctrl->dev, mi->clk_name);
+	ctrl->clk = devm_clk_get_enabled(ctrl->dev, mi->clk_name);
 	if (IS_ERR(ctrl->clk)) {
 		ret = PTR_ERR(ctrl->clk);
 		dev_err_probe(ctrl->dev, ret,
 			      "unable to get clk %s\n", mi->clk_name);
 		goto failed;
 	}
-	ret = clk_prepare_enable(ctrl->clk);
-	if (ret)
-		goto failed;
 
 	/* init global regs */
 	ctrl_set_default(ctrl);
@@ -556,7 +553,6 @@ static int mmphw_probe(struct platform_device *pdev)
 		path_deinit(path_plat);
 	}
 
-	clk_disable_unprepare(ctrl->clk);
 failed:
 	dev_err(&pdev->dev, "device init failed\n");
 
-- 
2.39.0

