Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108674D752
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E77010E12C;
	Mon, 10 Jul 2023 13:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2129.outbound.protection.outlook.com [40.107.117.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4297910E296
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 13:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jivIK3E35MfKd3UUJKReIwrHcXvOfjb2FhKWBA3FzO/t9KYUHktzZo7BN7VNYfaOo/bGnW2G5IV2BkKp/aJXaI4NOLYeYynOFfIG/NZrOmmkQ5WwtB3I6Eo7BTBideUYocFhN2nU8zBgme2QCC3oVfS3DBRDcjiO6mRPxpq7zcCU68IZWwx0ADUiBe9tOVzmgbkP4o/CCw0vQfz2NvrYzKGb8vacLTkZfyu+uZUTNJnh7Q37ynUnUB6WoSrdludhuGh0Bc5kL39usD+UnX/QnwaR4jXd25ITbPjZ+Y/qBALcBvXaYhMp51OARZHtBSMuF827EgmRcXZ2bN8Qgn1Ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3wMfQC2CGe5m7FMGneONO0IFk/KCAXfyyrwnKJ0Gtk=;
 b=bsueGKnxpaiJd0sWBapIs01TNCvUpyaeVgnwgLW6W7g/W4FGML1iC/wpFMKwlLo5rBXReHYi2+GIkOETp7nX7KUDv8lpUf/JCV8mJkZXpCa2m26j5ioe7bi02BPCZhoZt9BrPOjI5v/QP8BRvgpiaqzd2/kNWV9qYnbs4ptaH01Gl7zIMoDO9FSXjD5cycYChq1RV1pfygEnDWAUnzjvxeUtBmquUqy4PxPwjwSaE3PMDftP/No87dnSp0NxgZAOYiTDcBFSU73+zF1I4is7FCbRiR2p7jKmJ+YS6i1r+UHVz4gqveIan0Q2gbNHhOVYYAuHr7NTdgvSxn08M2OgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3wMfQC2CGe5m7FMGneONO0IFk/KCAXfyyrwnKJ0Gtk=;
 b=FgEZBzupginCJ3uP+xdqOP1RVmSJD8Q50XiK4iK/mfhPoj1agnVoncUoxjG+JYxu73C3V8UUQIsUVyD+BsByDiiWHK0f19f6FSu2VXvaWmFIqDzX8rgg63DGhwnBkCXInvMXmoly5kxnAJ9H2bzEzM763uRT3hWGBIz3tsz5Zmv8Kq9C+I/kQL2PsUjnSlPlP1LzVrpBBMZbVGHtaiYAI7EB9OuunWSOI+NhtgWHJKXnjse5hedjgwaV1RtTQiBhZ40aT3nOw2XrVIS2qELqbPAHJO9C/jVMNOFjWBPhNic5v/o1rrWnlfe4VlvEXH8S5z4Ybeg8HH4+SpGFBMsx5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5930.apcprd06.prod.outlook.com (2603:1096:400:336::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Mon, 10 Jul
 2023 13:20:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 13:20:18 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Helge Deller <deller@gmx.de>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v2 4/4] fbdev: imxfb: remove unneeded lable
Date: Mon, 10 Jul 2023 21:20:01 +0800
Message-Id: <20230710132001.50764-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710132001.50764-1-frank.li@vivo.com>
References: <20230710132001.50764-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::17)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: c1314334-f83e-42dc-c20a-08db814867e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ziZtKuS1Jbo4j6qyj5+QQj3ygDaRXXSQkwivuituYMGJstAOjOHUolq+3h0N9rF6z7YJrfYx0wVfn2/ry9blE5tEUgnalQ0Xu2XKCVInrfrBJP0jWg1ql51v9ZX8JBx797++NmphLgUyj2CM2k9rfByZPTAmCVbRALZuMvlnnJQi9RkmDscNTq6JTvrouBi8ykcsOd1vCpnd6TuBeqRMeI45P9UCnfKUYyEw5OnuOC0fc0ArvM61xYc5ohHbUcgrdah2GVx9Y6vfE+nsir7Sk95veSGvt7KI26LRzMmriXTZc4tPxWvGxbRZ4GS4ttW6nW36iZVPpJm8Vh//Hsw+91GArOy8isjfbWGIe6qF3B0I9REnPNV6JuCd1pEoC2LLapbCHIJY252Z18G6n4EEZ870HCtLvXE6M2t7VpEsnLLcU5V0GxYRPgXbVFaf/2eEuyOQsEawQLPNUSSrUR+iARFkP7EN/ZGJ+HC6AIzs97g02mP8Y5mvgG14Y9GdMTUZRSKvZro8v4/iYxQeVfYcwThy99UAdgjaTbgUWknJ4jAEU72Fcc+mroTWFvk673suv1eabvCInO5s4xjFQTcLx28qf4Pk4Wg/PIg/v2eknDmzefVFDkpyHYHvEJ/wyOyM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(41300700001)(5660300002)(7416002)(110136005)(316002)(2906002)(8676002)(8936002)(66899021)(6512007)(6486002)(4326008)(66556008)(66476007)(66946007)(6666004)(52116002)(36756003)(478600001)(186003)(86362001)(38100700002)(38350700002)(2616005)(83380400001)(26005)(6506007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TVs+iFl6xRLKk7+cbGsv95uCfomV8fLK65gUTsSgv4hnzflCUw7eq3jKwzw2?=
 =?us-ascii?Q?a3tapY4ED3cySLIhOcwXIyfHHWmAi/Nx9CGD2K1HjjM94y35pCKEyhT5Nfoh?=
 =?us-ascii?Q?QaDfEnV5LlOk8RopeOKNZPV1DZBYTm3Un/1NJScWGymRkU+5s2Z+P3L5idzv?=
 =?us-ascii?Q?HSfVcZEbOly/VmRkOVFdFCOQTm65m5qL011V5kBYVXXEuj3+XMLZeb/ffngq?=
 =?us-ascii?Q?7Tw0W0mRFWGrfhFWTxTTGUnvwbED6eKK+UvAsIvYMBghDe7psHUbLHxk2Gyy?=
 =?us-ascii?Q?cHykSqiofH7REPSECBrk79XTm8f67uquVrq2MsFIBO9QePLacI2xZf+NWQeT?=
 =?us-ascii?Q?cK5KZNl18GcLp37TjUyNx1dts9A4w5Eo9KC+thaPA7R5wsHDEiG58GA63v55?=
 =?us-ascii?Q?GbwAWJPJoXjbpdkVj8PSz/Xae6NC1aomRWwYha45eCjfAVBA8fSGoe0mhDfu?=
 =?us-ascii?Q?ldPT25tkeP28MYVw36VxwysAXf2zzMTpdANcy//M/8V9QVnZR03wOLQAMJdt?=
 =?us-ascii?Q?gIF5AUSdOXq0g5Z4laKnijMR37itRKInkHU2MTSEhwpg0mm8nwe0UD5tQ0RF?=
 =?us-ascii?Q?3IEPiB1ovY2Xa09hfF4mBUKnk6RraP9eRVBanYNH2u6BTIEGQwA1njAcPcCv?=
 =?us-ascii?Q?fUP5/6uKwrNnBHulKE6XU1/UxyF7lMnEEZ1hf+UAz4x7/mdvn3mH+nN59j6h?=
 =?us-ascii?Q?22jHcCEi4hS5x15Jf/2MJZUm7tLJKrswDayF3Cm2zlrUVLVzf188oVExZK44?=
 =?us-ascii?Q?itQ0rhwJxGqx9zFs/nifhr0mw4/R9Na5a4cqbvETgqwfe8ohsoUWl3BMgSvg?=
 =?us-ascii?Q?v/zep6iN8w35qYTV5gNXNQCF6/ioYpNe5UWi9JKO3p6Dv7cKSRdMmvwpta+4?=
 =?us-ascii?Q?Ci3MCSiHdOxmdb3Gd6gp95Lq2rP3DfrAqAk7r+rYYujx1fuY+A7gsy9q2sCE?=
 =?us-ascii?Q?ZgsuNWbCBIbMshYjNUh7fWUnyF/kzXRNF8gjb+UEEejbWWnSFPAhsdgrjfcV?=
 =?us-ascii?Q?dPxAbMTb09gqAQf8su3lGvAhlW3ukX2U3jWGcXHMExYjFm+U5Zz8nNtFKXyr?=
 =?us-ascii?Q?1ivM/MUVWGnwGdCsmTNOfOcEOrfo1Rw2ptEfdK9Mr4bfwIml9G9oWvo6SZSm?=
 =?us-ascii?Q?CDdaoiunGTK+/pAaCCkwxg9W+/h6XjWtnOMMaE8uvPCPnyl2o7zaEDjFYdeT?=
 =?us-ascii?Q?mpwQB2zXcCy9QURCES/Pn0O46K8V+NtWwBPEodO0a+6m9pUf82p1Zc8QHd1l?=
 =?us-ascii?Q?qFh88RmtxGRlwpcUyjQts+YaeLA1yZ/o1cyYKRfYbkWVQHMipbis1HgKuw0k?=
 =?us-ascii?Q?cTdvzvgUXbIlBXJ8NXHimKaFhpV+vjEbGcsJ3dQ6D2B+CcuUY73KMy1MSYGF?=
 =?us-ascii?Q?poNNbbKPPlhDSHVVrCOPa6Rt1vmh0aNdGABfo8kxD0Jgaq/RZpzWu1yn8HSx?=
 =?us-ascii?Q?PClCoT1LgEJjPI0RZ19LMmbUtzfxlzh0zs5fznOOmYLknup6XefnuUkyyXc0?=
 =?us-ascii?Q?8DPnfdCc8mSkj4eH6L/PORU9sHIrRKt0KV2wta9uCuvtBkdwYXn8h2+OlDz/?=
 =?us-ascii?Q?K62MxviN+k8VjEhjTBq21yDOm9O3g8ulKCmQzeHB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1314334-f83e-42dc-c20a-08db814867e1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 13:20:18.4777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmOES3Wq5S78FLq7RoE0wG8oc48oAAD5UnoemoQdVHDs4UaI3MPnTPq9waxYs8vnojarPXX7dflAEQaSnbWcCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5930
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
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These lables are redundant and don't do anything, let's remove it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/video/fbdev/imxfb.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 4582ea801121..77dedd2c05fd 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -903,7 +903,7 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (!display_np) {
 		dev_err(&pdev->dev, "No display defined in devicetree\n");
 		ret = -EINVAL;
-		goto failed_of_parse;
+		goto failed_init;
 	}
 
 	/*
@@ -917,13 +917,13 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (!fbi->mode) {
 		ret = -ENOMEM;
 		of_node_put(display_np);
-		goto failed_of_parse;
+		goto failed_init;
 	}
 
 	ret = imxfb_of_read_mode(&pdev->dev, display_np, fbi->mode);
 	of_node_put(display_np);
 	if (ret)
-		goto failed_of_parse;
+		goto failed_init;
 
 	/* Calculate maximum bytes used per pixel. In most cases this should
 	 * be the same as m->bpp/8 */
@@ -936,7 +936,7 @@ static int imxfb_probe(struct platform_device *pdev)
 	fbi->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
 	if (IS_ERR(fbi->clk_ipg)) {
 		ret = PTR_ERR(fbi->clk_ipg);
-		goto failed_getclock;
+		goto failed_init;
 	}
 
 	/*
@@ -951,25 +951,25 @@ static int imxfb_probe(struct platform_device *pdev)
 	 */
 	ret = clk_prepare_enable(fbi->clk_ipg);
 	if (ret)
-		goto failed_getclock;
+		goto failed_init;
 	clk_disable_unprepare(fbi->clk_ipg);
 
 	fbi->clk_ahb = devm_clk_get(&pdev->dev, "ahb");
 	if (IS_ERR(fbi->clk_ahb)) {
 		ret = PTR_ERR(fbi->clk_ahb);
-		goto failed_getclock;
+		goto failed_init;
 	}
 
 	fbi->clk_per = devm_clk_get(&pdev->dev, "per");
 	if (IS_ERR(fbi->clk_per)) {
 		ret = PTR_ERR(fbi->clk_per);
-		goto failed_getclock;
+		goto failed_init;
 	}
 
 	fbi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(fbi->regs)) {
 		ret = PTR_ERR(fbi->regs);
-		goto failed_ioremap;
+		goto failed_init;
 	}
 
 	fbi->map_size = PAGE_ALIGN(info->fix.smem_len);
@@ -978,7 +978,7 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (!info->screen_buffer) {
 		dev_err(&pdev->dev, "Failed to allocate video RAM\n");
 		ret = -ENOMEM;
-		goto failed_map;
+		goto failed_init;
 	}
 
 	info->fix.smem_start = fbi->map_dma;
@@ -1030,16 +1030,11 @@ static int imxfb_probe(struct platform_device *pdev)
 
 failed_lcd:
 	unregister_framebuffer(info);
-
 failed_register:
 	fb_dealloc_cmap(&info->cmap);
 failed_cmap:
 	dma_free_wc(&pdev->dev, fbi->map_size, info->screen_buffer,
 		    fbi->map_dma);
-failed_map:
-failed_ioremap:
-failed_getclock:
-failed_of_parse:
 failed_init:
 	framebuffer_release(info);
 	return ret;
-- 
2.39.0

