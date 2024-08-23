Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94B95D47D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 19:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F0510EC97;
	Fri, 23 Aug 2024 17:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Hv/jKEvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2053.outbound.protection.outlook.com [40.107.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD8910E45F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 10:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STqf6POCfLAzy/P81SObHfTzL9TOTE8o/vAgt4FnXsxaLfCWaloRhm3phsYyTh3E0tnb8k78YW5JVSuxrR7rqlQ/qeo5xLBxWr1fvY9efzSpLAW6ZXQD7gRUDzn7nEd+T1kRriqh4G2I7TE1t1OEr799KKSsEMeKaoFv61rwr09wJjKSGlzyKSgvaY994Xk+B/bR/fnL5mYVcFyXdHLx8C1bzfendlfu7Fzz+7azADYTDfSE2JM9ZfYucsEqPxemQD+XVq/jv1umPKogVy6CrBS4EElFsiA2rnnNo+xoFAFUchsjAuc698WnRnfQBrBhSBCa+2lOdE1RbSuCaZBOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyRMXxtRAusDDxAqwEfoylIRLh2FgMA0HoKYMuW3n+U=;
 b=VW2Ms1Pkug5XkkfZmahX3lG71Z/8+qIbm/fwq2JozkIuRpcNxdJKmJEeL4INgwQj0pgCTq0ZFfu9PG5MNR4mRE3rGb0PfYW5jsKYjIRtFFNt/g5DcKFjo/S2vikzpPZIxcDmj9DFAECMDB916WUlcJONU0z3zulhnnhm4qdxOZ8jqvl2FfF6z59OV8YuRsRjO3VcxxMIQRoZ0oafBTe8iCsglrjQlGygWaGuQRnjHKyOxJfzUeCm7mpuHOGrh7Ltkkvj62IPHZdRsN9ICXQEUdNiSOrWF/MyrrMPKy3Nx8ShHjPq5qYvmI8QgmNdrzevB0Cg00qGJDwbgziyC2ftLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyRMXxtRAusDDxAqwEfoylIRLh2FgMA0HoKYMuW3n+U=;
 b=Hv/jKEvgEhi0T6Vx4DeBZlJ5GQwghPgkWXrfzcSCpKbpIGHuNpXV6DMvsjPmlJUXcT4rzoaJOaXQOj4GzdblidyZEq0SeCJ7bXdTsMEvEadlTwllRS0fAKNhH226aiLstGOhSMGz6pxFJtpHCkXBO9Q8AW933rdEry39qx1lhjBG9GZJclUw1Fcx4oaWaqyaaAEgoPF3B2HavqglDKFEce0NRYTJQZ/HWDnTpvjet9Uwal2KCgz2PWu5AIiZyGeUbrf0xQ4T4qfTHyLPkqW5b7UuWG4VQXR2OzUVH+Fjpy3QyfFqAiPnrqhwP+wkVFYOji7fumiteH4/u3x8kS2dmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by TY0PR06MB5281.apcprd06.prod.outlook.com (2603:1096:400:206::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 10:02:40 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 10:02:39 +0000
From: Chunhai Guo <guochunhai@vivo.com>
To: joel@jms.id.au, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Chunhai Guo <guochunhai@vivo.com>
Subject: [PATCH] drm/aspeed: use devm_clk_get_enabled() helpers
Date: Fri, 23 Aug 2024 04:17:32 -0600
Message-Id: <20240823101732.2180381-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::31)
 To TYZPR06MB7096.apcprd06.prod.outlook.com
 (2603:1096:405:b5::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB7096:EE_|TY0PR06MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d718902-5a6c-4c3d-5231-08dcc35ab8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F32v2N9HI8/APXpvz4Oh8Nq6g44SGFGA98waZd26YzfFce9S9Dc+IyRsII4o?=
 =?us-ascii?Q?16YMX+TP99pXRlKGWNxzCIuSXGzO2WYHxBjHS6/rE27wVzjI7g8T3qzF8pDG?=
 =?us-ascii?Q?EQeocV4Y3lE5PBWgkeMBL5wntwhQToesv/2D/Qy4lkHK9c221dDHu7DjWHSG?=
 =?us-ascii?Q?NBNOJJzsRWnOvY4edgDRInNEtTt6qn6WBT2GOJ6xmXyIEku32v/4E/a+UD+P?=
 =?us-ascii?Q?74UTZZhpJxtPVEPKbgciq0FVbWuGLPX7FsdRPGdXkX/rjYAs+8erQYjg+Cjf?=
 =?us-ascii?Q?c3LkCnstQtDrPPdT/yMJxRxDxbLtTza+QF09L34ekTz1n9Zl+n6YyKFrfA1v?=
 =?us-ascii?Q?vYtis9F3MHaNqm4PD0sJL3/pajERZwk3VVgthk+7TN/JmPHyQu37rqZmTQc2?=
 =?us-ascii?Q?V5F96a4+tlDm9vqQv8JZunhp9av8R5BS0cMtli+WVHRDuU5z434uSjbDvpPl?=
 =?us-ascii?Q?IAsXzowWILcRPJEaqMMyLYtZf3ReFNVdc6KJdrXrGQWNM8FG2EmKiSvu99XN?=
 =?us-ascii?Q?iXWI0zncjlrtIeiVY0d6TvYpq5fLDISD/aFDOPlCi8lG5BElTI/+mIl37bML?=
 =?us-ascii?Q?/aXKYqi7W8ua0l12iRv+ebcBb4Hzr4huglw5cPvUu1SZL6IndPjSeB15YDVJ?=
 =?us-ascii?Q?33Opt6xKysu8Hr++wDDbfTamcjgxXiL8O31uWkCrDTRdaTpU3j5w4VHiGuuR?=
 =?us-ascii?Q?JrzcxLH8+jqDzEwN8BvLu2sMOQt9Iibj0/C6wczNXaFtM39MXbqogpCyNsN4?=
 =?us-ascii?Q?xlFyY1kh6oiHYDBXWNjd59EQVayFOHlGmNjsliadE1gDlaYp0AAJczVERhaF?=
 =?us-ascii?Q?QIXsuGZETr+xmktHES63Nl79GzM/byHnV7J93aVK+SE96m4GiT3YHTJp/wst?=
 =?us-ascii?Q?S2s3oVpArc7Iy9yImLlCyxywJOEDcB8TWMbQ6iNMMtES8SP+dmxKHpUBelE3?=
 =?us-ascii?Q?/vJc9WXQEk9Rm63wCFQFwghZiZZEP12Mv30nydNXvmGReo9b4MV9cUpF9ZSs?=
 =?us-ascii?Q?p7O/8E68woC39c+bMzFVMlF9S/7zBi4L9uybEqiYRYC0bv9wtc4oJQvMmYTW?=
 =?us-ascii?Q?dFZGHGnp3nXlRaSieYXBzhiKml4t8oB7IiuslBDyIn2naXaAqZ3wqeIw8krg?=
 =?us-ascii?Q?YouXpOMvLIcqI4DCLYya+qgvRfH3+KrU/7yy84gU12HsdJpAU+JL8tzpa541?=
 =?us-ascii?Q?xBAc323EHkfk8JfujhZBX0QPO/bqriDXCfukMBWkErOt3EDXfeOAdYbfxJ5h?=
 =?us-ascii?Q?WAaHwXgV1D/eeqBNo0698camBaqT1lG408jK5oXwFsh/Pq9+MPe8nWRJsWfF?=
 =?us-ascii?Q?C6CReBvkZ+XErJPjHfbfa588l3DH8RrQd79Kk/7U71xDrg6wNV/aOlRzxAGk?=
 =?us-ascii?Q?weAko3JkdjIq0MtWGoCBMYUsumAS8MLH+AEW0yPrRqmlnE8PYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BqZLowX8knXJzYRaaHjIcXr8VuGYLuwo8ti+fF7XrPdbI6dy8wS1V8QSsKk0?=
 =?us-ascii?Q?EhDdW4yDoQAKoFh9nMOpXamWNnBIjBm3eiJLVRMIFw9Y+amM3DDlDPFgIKVb?=
 =?us-ascii?Q?QDKP7Em5Op+vPQY/UkRUNc7lgjTIlpQ6H9+wSCw5KsylLFogvfA29clI0vUx?=
 =?us-ascii?Q?gjEl962MmuH8Z1r70Fn47GwyP0ZrMu5Y2m6e3OsBW/JJTSqSfUKaPwEm2CRf?=
 =?us-ascii?Q?wztGFTDYjrLJu0Zzr/W2j+1GN3RqgmFMx9yqhYQOxQhTtod6vfWtxaTvDYkL?=
 =?us-ascii?Q?4m9U/chHMLpAkq1SwbGW/aakB/ysekjY5SjFUUIPnPfNPB2JBkyfWoltA0WJ?=
 =?us-ascii?Q?USObEvMEEhvRNOUjlaff8IQIBL5XOVDiu9/83Ucn+yc8j3pq7Z/YpiiT3irP?=
 =?us-ascii?Q?lbEIM2BKFH1pQS+Q8BMRuYY1Q04ZcbzRLO3KOxdvHh0wmgJfb0HjKAZ5PI77?=
 =?us-ascii?Q?yCsBnW3uDHZAZEjyivU//Ptn9pKGDI/IZ72oDzS1SQalgzBhc8SuXlvLOreQ?=
 =?us-ascii?Q?Jty+FNmT7ZwDGioLSuZU+pIaYbTWIQBa0jDZdGA73BJXTuHRJWTzYc/rN6+8?=
 =?us-ascii?Q?IrswIXd+NL/I8U5MdPGQrEc9Xty4jL4z0VuRRdDcnATFn1Sswis+AyGoA6Fo?=
 =?us-ascii?Q?QIM0cDzTyB4DYLYfmf8ciB3HopfiSJQTenWWemMOxaENW3GS0RCMKCjhGRfJ?=
 =?us-ascii?Q?tejz0uNAK+fukpBT8vwuosegnpmSFg0HLBN+s/2iTB6VU0tf4wh4HBmrYwls?=
 =?us-ascii?Q?pQMTaf/YCid1bmM51EWB3lRR30xoTGiLOORrOte5QXPGz9zzhcXF/TQdVCi/?=
 =?us-ascii?Q?FQVLw9qhIYl2z1i5GOoEovdCHmYN/Nz/k28ibvDmT5Sx+M3WmWN1ZY4YyBj3?=
 =?us-ascii?Q?gQSdTyyjRTV9WGXKBQ1Sj+wEBGgVf6yiCIOxSEcHExhqm8ELEUZCUs0Iv3PX?=
 =?us-ascii?Q?uUWm0heXq/dswvzXS7esR6rsZsOI2lzHDQFTHtQfrn1GTRjTH9h0noXaMzGw?=
 =?us-ascii?Q?D2DswHh4KC/ed7kalUfWdgl1xBSQVJM9uMrLlbQruqBCnHjFXbnmlr/Pu+Cg?=
 =?us-ascii?Q?IbGdvzGS+fv5gYJCVyDqC653vkvZ1oHVU1ptyV2RzPHEFMnbWfg4lhtKfGUo?=
 =?us-ascii?Q?mkU7yNyBkCRAAijWkZuHjagg+AYbb/AKveabh+qa3C8EiaPS5ca0tc0hpB8t?=
 =?us-ascii?Q?M+VvQLAVXFAGINEChgaGWKsgBFjh5/2zsqd04EG8+5t9XhCmbche/N8lFx0k?=
 =?us-ascii?Q?ShdilheRJm7+xk66l1CDhRo0jHrgDLeTEchR7hXXQJq8yIjco6UMku3zNknm?=
 =?us-ascii?Q?uFy6L4boGMK+pdv4K+1vtna/9pNeI0j2zSMAofdRhn+RvHfRpj5pZD6U77g6?=
 =?us-ascii?Q?naGBNpp3jHYq699wnWpagxHMtAesX2vSpPljZgvLnZ9uJXNYMzK1hmnnljK4?=
 =?us-ascii?Q?19EPmClbsb+hchk4m1Mb5QJhGx+wJ5FVjNYhuze/Yla/XAwXOPxQ9gTxu9Tt?=
 =?us-ascii?Q?7yvipkC3UgqF6cttqAlCSMeeRyoHq++1pKtI8HDSFCvjs+Pk4zVHcKTd3Wgp?=
 =?us-ascii?Q?XT58B1BANUQDPTlQWHjJbTTqANzgBN7L3pCLdiSq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d718902-5a6c-4c3d-5231-08dcc35ab8f1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 10:02:39.8982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GCm6LL5KZ+Yf4L45/ct1VlQ5qh8UQ5cOideCmJ8a1hk5rDPjIayB2xavosPVBBiWtUfSQjGNDcdkT6hlk6uNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5281
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

Simplify the code by replacing devm_clk_get() and clk_prepare_enable()
with devm_clk_get_enabled().

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index a7a6b70220eb..7f4ef85a12a9 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -191,13 +191,12 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	}
 	reset_control_deassert(priv->rst);
 
-	priv->clk = devm_clk_get(drm->dev, NULL);
+	priv->clk = devm_clk_get_enabled(drm->dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(&pdev->dev,
 			"missing or invalid clk device tree entry");
 		return PTR_ERR(priv->clk);
 	}
-	clk_prepare_enable(priv->clk);
 
 	/* Sanitize control registers */
 	writel(0, priv->base + CRT_CTRL1);
-- 
2.25.1

