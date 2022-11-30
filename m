Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805BE63D776
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3318A10E465;
	Wed, 30 Nov 2022 14:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C028610E462
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1+4tiiGkBI4RPpaWUUmEgGwOEOr+zTYEmkZmVO79xEM5cIXwG9Z3W+xh8MH83T5g3pm4xbCnK65ydFbDNBPjGVGiBxPcWFq8o8OSO1oAXZ3KXPl2vERjLapjydwBs7/AAoY7ar1r93frWGSxmDRE1/KJA5VmWInToGZLRoi4lpE1wBGKuf4PsS4l7O7kHVUgNIFF3C1RRlZ+Fumxz1wkRhgrC/g0zZ4V54wZD7+CfuunL3P3C2AWXu4NBIFGcVohCZH7aCeOCVuaXtcE5M15gKCcOVJX3dkTmSWCC3xxN2UpQY1P6b1K9YbF5qDNyUuKfiVln852iQKZYK7ySKTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cDyi0OTsNQOIgW/SJKknwhnPQ0UTKsEknXjOztyylU=;
 b=h0lMtUfe8OQDO5ahYN0kk0Bhq58hggC7Hf7AdKLQtbNbdlAuN0rQdD8DZcT1Vhc7kFonVteRuNp38Ouf1MFV97pAU0Zx5F4N7fMVRQgFTTM4pQhw2ZrdeY1xnbXSL3Exv4/LHHHwFRIlC6SYkGrgKxDLlxk9N9cv7DkFu1zBtr1tl3AhF0KXUJJ3TFVL7aEzl5a6Dg86g6442GE7SO+7MAaxZ0txwClzBhTNJ7pB6WKzYQOy8xTbUPNk3QqWa6Ghpq4qsWufgQGGr30vXb01nR+/BxkxS6Nmcl/jMZu5tGk/U/gjPHW/x0BNd0CDK5T3WEoP75gBdcLN5fmf65M4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cDyi0OTsNQOIgW/SJKknwhnPQ0UTKsEknXjOztyylU=;
 b=QE3ZFpMyCWSiIApjr2D198mPOYpAb9j0xeQCG+g4HldUUyMInso1Rsr9HRdOsa/q51BVRaB4TvP3G1iYxqsEnrUWa4hgAOzEiR5eVdQGFZXBFhcHYVYtxUT5feEBX5iRKjJMC8GB28NR3GIwzMVFZk457LKGgvTHDzw4B3Nv9b4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8695.eurprd08.prod.outlook.com (2603:10a6:20b:55e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 14:02:54 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637%2]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 14:02:54 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/rockchip: vop2: add support for the rgb output block
Date: Wed, 30 Nov 2022 15:02:16 +0100
Message-Id: <20221130140217.3196414-5-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
References: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 717d083a-cace-4fab-15ba-08dad2db9317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SC+QDAgmDW+xl0jl0dF9L18C1Y41kwANkHMd7Fdd/i8FvkztEEmTRp8ATZiDy+yOBSmdLq4Qyu6vmqFXWBtBs1WAdxtQzOGSCQx/K2Zd3CWlTZd7OP2zOVBnyDujKx06qMw00rIOMDvanf9zeGKKm7XHREEtnRDS1XORak0wYpsBiYqup1EqqL/rjZu/Hu0VlPxpJLsq6tM0Ud/2rG6/Mmsc3Zf54i+tpaUeg4SyzdE47K2GUKkw5aSezpo8vrT7t2gEckZwa1570prZR6HI4ha5rQOPijM7yQcLS4v8EjBDBMAmlRj5YlxuBso0LSKypupvLLNJ+b3/sleq1n1riWvh1mHjQUJrqOPLR2GeoIoMbvnk/SnyIkqWjNhFqKp6xL7vOnMqkfeUFz8Tu0yThcsgaeYpK3n0nyg/J/+KMzrWe05uS2qQMiRREfeOSbgwrf2QIStASJGAuNbsqg+UBOP+8dC55lkWxJroQtE1xY2W5TUynuMBFejU+t3yMYmrKBsU4fUbVwB4ZwE9Qo+1Svu6cYb3epG8NmhpPmTHtNbY9RAuOf5lpaUhP64qoyzZ2ekQX06TwYDEaIKJb6sYfjQL+QNwFb/5CRyZ79jYSLgQ4HEJV2KUTQ1VZj+bVbn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(451199015)(38100700002)(6486002)(54906003)(478600001)(316002)(8936002)(2906002)(41300700001)(83380400001)(1076003)(2616005)(86362001)(6512007)(107886003)(6666004)(36756003)(52116002)(6506007)(66556008)(7416002)(186003)(8676002)(66476007)(44832011)(5660300002)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3uf6Qzhbk6TPykBonLg4JnUHp88CwgX4jFbaZjn5pRFSZB+BU4y3aCaTfqSx?=
 =?us-ascii?Q?2YC6BtG6Jm2U7ZWMMzp8InEc0/pNxv19Df4jF1J7jHwpmJ6Ze1k9vbAZRBmY?=
 =?us-ascii?Q?SF6RBt5smDHxayRp5/kFoz9bQEHUv6kQU2G1ojiAKMpzJOO4AyqhToEquk7T?=
 =?us-ascii?Q?GzMOUPwr4tvpOEDkWYcTC3plOulBnA62e5ymhWOAMZ1S7FbTRDrRyQ6hGioz?=
 =?us-ascii?Q?hM4wQDC+rCCqdN6RpZOfxZaxun//pWgmWoY52hYBMytIvXCewkpYSDrxs6rV?=
 =?us-ascii?Q?lFC3jbu2yLcLBouyR3ZErhAjPqSd43CU51J77NC1KYgWLBzFL9MLjYcjhiRN?=
 =?us-ascii?Q?GEJfkxuPdkeaR+Ty7Jk8Yt30mYuHwRDdfyhl7Sr62LKCOE+/tMkfYd2OtO/R?=
 =?us-ascii?Q?LqG1zu8UPduhLkEA819c/5YuOBA1f0ga2DdijQLfj300g7/tnUOU9bihwE1/?=
 =?us-ascii?Q?R+jaHJf1il3iEjSa0doSS712ma/tXDDe6OdxKnLepOfcNkhYPYzgOrtZxFhQ?=
 =?us-ascii?Q?c0E+MjbmIFLXm7tB1sszBFCMU9lJy/xHUIydxbe8abRXC1CJbfpZQIm8rpsZ?=
 =?us-ascii?Q?/aI8tdYbknSE1tmSXxqnpAaPCkTrCQ+vcZFqJqWME1BHwu/oH49kPGO7ez1J?=
 =?us-ascii?Q?8wxYfPALpkvqDcyeDh3JWMNJQurpQc6/D4AuGalZMY8ZwvhNKCDdSyPTP1zi?=
 =?us-ascii?Q?rX35YiHLbyrAEPFhq2NmSW5SoVu6PCfwXkScCXiuke0IuSTfZCwzafq4Cf/7?=
 =?us-ascii?Q?4ir6+HZqzUYhSIvOKBuXYcp8RYl73z6nq3aCBfjfvNyqT6JsaSf1AJAw1Wqn?=
 =?us-ascii?Q?aktiCkUYwedsomzwaBoXIlzuAkxVEmV6IX0oz0DZTKdqoK0MwxRuu+pskbyY?=
 =?us-ascii?Q?N1g1wXnZNu2wD0ypc0DlYf7aYxY4+34ac0VdRY5xULpSDG9Ci1xH2IbEg290?=
 =?us-ascii?Q?XQtjdvcD19GQG7lozlK7jrunLfg7WBNAZRj1jurPN0sdoRgolZz2cCsokE73?=
 =?us-ascii?Q?THjtLrDuwAtC6tRgvP5C7z4JTUDwSYZY0mBctngrczCmNhJFVsMecTv/tVZS?=
 =?us-ascii?Q?B6iu9wglyBkUGa0YuH2qz8e/T2MUlira6O5TRYvE6pLCPjw+Zkukvt9YMg4H?=
 =?us-ascii?Q?nkPpI4/eS1kKFii/nqL23gaxOXuCacpIqexE5TWcWV9kpwSOYwM0wXbZlxFe?=
 =?us-ascii?Q?/9/9m32KHgnCpn7WjyIMSTHjUuq2DTQlu0VSoPhAL9QLg3Id34LPvkuYlluf?=
 =?us-ascii?Q?ODqsHZ+zfV7bgHEX/m0d2Q75wMFwpIygJ20YADl4hoHxPa42nqopxTg0QpLm?=
 =?us-ascii?Q?ajsHA73s9u1mQg+k+NtS67tDqplqyWq6zHqOT9tuZu4Z2UlLh8dN4bPtsXLL?=
 =?us-ascii?Q?jNRrdvvUQwFVYZGheHBRYOylN2flicg6yKGAR+pp8BmmZu56EJFirgmG0KWw?=
 =?us-ascii?Q?OZ3X7XHPxX1sB7H7EkdQHr4CisS+5gvLRAYtXTu0E/NKX26A8pNLcqfBASkV?=
 =?us-ascii?Q?3VuKI/JcxGQJr4MP+XsIhmSRU17DTzv08+wNErPenNuHewk7wO51qQWbBWDG?=
 =?us-ascii?Q?RjUevxZPo7fz01N5HJmVu1IgEeZlMIADHiBJ4R529W454SEexs6sGbswpLUy?=
 =?us-ascii?Q?heMP52XU9K6wu98/SpeF7vvuf0UL2GRNcvsyFfAEFl4FI1Mtd7FKI2Yrq2PC?=
 =?us-ascii?Q?fsg/aw=3D=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 717d083a-cace-4fab-15ba-08dad2db9317
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 14:02:53.4717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dJhy4tidPGgn77tE9SAlfrzdooUayq/J+JR8BE/TkGY4rFoR9BH4WjHLGk2Yj2u/4YT86+6DRSCA6+sCNGFOxZ27soK54Unwd3baxUAMG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8695
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip VOP2 features an internal RGB output block, which can be
attached to the video port 2 of the VOP2. Add support for this output
block.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 94fddbf70ff6..16041c79d228 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -39,6 +39,7 @@
 #include "rockchip_drm_gem.h"
 #include "rockchip_drm_fb.h"
 #include "rockchip_drm_vop2.h"
+#include "rockchip_rgb.h"
 
 /*
  * VOP2 architecture
@@ -212,6 +213,9 @@ struct vop2 {
 	struct clk *hclk;
 	struct clk *aclk;
 
+	/* optional internal rgb encoder */
+	struct rockchip_rgb *rgb;
+
 	/* must be put at the end of the struct */
 	struct vop2_win win[];
 };
@@ -2697,11 +2701,25 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	vop2->rgb = rockchip_rgb_init(dev, &vop2->vps[2].crtc, vop2->drm, 2);
+	if (IS_ERR(vop2->rgb)) {
+		if (PTR_ERR(vop2->rgb) == -EPROBE_DEFER) {
+			ret = PTR_ERR(vop2->rgb);
+			goto err_crtcs;
+		}
+		vop2->rgb = NULL;
+	}
+
 	rockchip_drm_dma_init_device(vop2->drm, vop2->dev);
 
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
+
+err_crtcs:
+	vop2_destroy_crtcs(vop2);
+
+	return ret;
 }
 
 static void vop2_unbind(struct device *dev, struct device *master, void *data)
@@ -2710,6 +2728,9 @@ static void vop2_unbind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_disable(dev);
 
+	if (vop2->rgb)
+		rockchip_rgb_fini(vop2->rgb);
+
 	vop2_destroy_crtcs(vop2);
 }
 
-- 
2.30.2

