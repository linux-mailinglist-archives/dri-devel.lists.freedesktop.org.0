Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7659BAB4C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CA910E35C;
	Mon,  4 Nov 2024 03:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BzHLl5Ac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2054.outbound.protection.outlook.com [40.107.103.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A7810E35C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:28:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=craCX7O25P99hQbyM1Sqsm+Yd/ZZ7xdZwLX0x3oxuKkF9RCmKcQ05ym68297Pn/NvDhiJEKROsIT0oaBuNSfpA+k1BEql49LQvHVyinkIyRNFtuH1HJnqsj7CELJD17ExuswO+P60xBkOdpL1NyQszYvKPrv/jOzFZQOeldy4JalK8K/A7hOsLvjL7/WuDfv4rpyAUYL8noN5ju3eVCI7du/r86N0JmGzZptL06ay4DhCaAtarG6fp3HYWai7Yrgyp79dgBgWt3OKO+JgO0Eltk8FzfaXI654OGCoxly82eBZ+eCMprqZ6SjNeQuOJ3T5O6LRv84PiG7CzPMrW1ijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wzuYfHAB/fAnW+5qZ02m/Gz0jUvIP6voowq0JnbWD8=;
 b=ClAA3IT90WuEeSrfEP/pgHNEcufwUQVZEmfnifL0Lx3RpIP1EF/A7wovduYW53+opyD1xXV3asuzYn02vcLhjPo9p5FySvO/eBB79fKCPssK6qhsd3LyxafMPMC8RzEpgLvDq2ttCqStYZeS9hv+KQcb6CQgXrkN+0p1l6ktFzC7WFH8hcpg61ntGW6ovyHCMUvEXbPm1HIEFrrbPDtMHiASg6fWEAUfBVOrOYEjvbfS3wmUXCOQ+M48dSgDUStA/WbcH/9CbO4DLD+AXXMTi8ldJe5bgWvTUeGCHkWVV3NQrto/IYr469cCGfXy5ilzhosL0VXJpgwWE06/pq5TRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wzuYfHAB/fAnW+5qZ02m/Gz0jUvIP6voowq0JnbWD8=;
 b=BzHLl5Ac1OotNb6TnrIZghcbcQRQaAVL/wA1oT5eu1m0HUGogfwcDvLlhfH4w66qNqQqmHvYQzPxSq6F5mff8M+VOzxN4rYZHbptOC5UlbasxTyRdr5QqzGREmi8VDNuNqkZlPTZgOQXgnhV7Sr9lBKYn2yz7P/lknjC4m0fsABEs+3S2LvyZ1hKh4aibDoengfRCoxz6+G35tI6YMHpgzbTdxf4dOMpenzdU3kFb2Z7PRivpoET1OfuqnCesiUoEtHf45pe63aKFKYU7CApXTTOcGAcurYI4PdklC99iXBoYi7hw6LBQd0BXTdl4J9+RO/oQVzy7CUEQO5lyWdJ1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:28:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:28:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v5 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
Date: Mon,  4 Nov 2024 11:27:56 +0800
Message-Id: <20241104032806.611890-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: 27766e03-015c-43e7-cde9-08dcfc80cfd6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ukf1BBH2szBsdF4EToK1HPsakg8kdbODHrt7j3RNIDMRW6RkooLguKDY8zYX?=
 =?us-ascii?Q?sxbxnD7dYq6EUMR+Pk7EKdYWKMmQ8IvXquA8olHZQt6cnuxFIvXPZ5FCb5Ss?=
 =?us-ascii?Q?vAtobSW2laUPZy2B5CZRNnFVt5uIyl17s8A2vOz0v80vUtBNusQILwlk/6LV?=
 =?us-ascii?Q?fODmANIBzxkSz0deR5zqiYf+/yziDXSGus/FHpG1lpXAGptAhWHhkXDQGMc5?=
 =?us-ascii?Q?tcXSDrXghOoLDCV+jQzDP3YfM/hm5JDTUpggm/htR4qFZAaebagVmdi8S3q3?=
 =?us-ascii?Q?jsIIGeg2oPBL39m//sZEbrp5RGgJVb7p6n+47y9YM/Hy3/97M8XQmLtV8cjw?=
 =?us-ascii?Q?4Cj1WkV8UqGEGAhJtOOGpaMOF/Qs+yn+Spk8SkOn7/OkzKUrQQcUJpfAPwl+?=
 =?us-ascii?Q?dOS6knrnJmeXvhww19JZaFJPMhjtSmSsWwfSK1R85O7Dv0xGlzYsftNLNj+P?=
 =?us-ascii?Q?qxK+t5VWddqsxVMuPWNWYDEF48fnoWdr64i1jMjIuA19zvHU0jGkThvXIGJp?=
 =?us-ascii?Q?Bf3fW/qPR9seD9KtYusjSWLqGgIefQk0GiZ3A9s4L9ZpI2Mve2iMiU1cxOtZ?=
 =?us-ascii?Q?M44gS5X3yPhg5mNhSZPNP4cprj6Ew/ONs79fu9jJjEgcsAompDp9WC2EEDIO?=
 =?us-ascii?Q?Stsd7Y9AfFJUl0JaM3B5NUyV87KgjKEDVBh4hqzX7Dp13UQp74H4wUZB2/ZJ?=
 =?us-ascii?Q?geIVKq/xTXvmhHdSN3Vnw3fhDsGSoCITWGWLCipRPY/1ymAB1cmKIxJCGZOE?=
 =?us-ascii?Q?EdumPeP6N2C4iLrXCjNRcqCK1qmZV2ncDevzQjDlM+i6JN73THkLSmV03cCf?=
 =?us-ascii?Q?Ux2H41gIk7s/YLQO/ktB8DlyeRpeSeCUuYR0laliNuM+7yC83qjvP9lixqPI?=
 =?us-ascii?Q?9cpGU0bYt2h6WMbiqfIgSOOk1apTiNnrhFMm4tBrVLCnqj3j2KYa8y2HJHfK?=
 =?us-ascii?Q?EGXX0kJkVCpwTL6GVIY0MSJzjbA10jdu1iS+AxYa3Kzf8wZZuxtpNrclRaoD?=
 =?us-ascii?Q?3gBKVAY8jF6WWnO283KCNJ1sFpOPcB1ydTEyzn+Bne1bREVbfaPGzq8jhkaL?=
 =?us-ascii?Q?8WzV5rgQju9bgAM/06Szj6O7VIkEkgiZ5HMl8wE/hAJHj0DV8a/bH33iO0ql?=
 =?us-ascii?Q?Lu0h0wMWCAkv5k9B8GC+Gt4TeSEFdvgWktd3B2FG9zk7PdcrhJE2VrgBLhuF?=
 =?us-ascii?Q?JinYmp+9Sn/3bBrKGRyxFS/9NHAte8cC85vPkrHFcWFjSXabEv4xo4pGlzU1?=
 =?us-ascii?Q?ZNAngIFTb+KyreGQ2nsppQWT/6jgNsht19tdV3VwOjGwWkWNrpTw+XoP9gXN?=
 =?us-ascii?Q?wYwdBFjBkTiacBAYfKO4fgo5cCRL5JefQwGgAUygcN3+g8GooArCvSocms0K?=
 =?us-ascii?Q?SoEZT3q1xMVwoYq85YvowwUjDP9Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+u5T4q8vn8YfEkHi5lqeUy65Kiaq4amr2kzaJeCxn6mS0zwd6RoucSnEh6fu?=
 =?us-ascii?Q?ERXehFjW9QpeLvCSCMF1kuI90+0CP+fnp8LsiSMyLSlClWtMmoJYZ264T4nO?=
 =?us-ascii?Q?LnzI8QqX+aJt8NF0XFtjZzQrxWUYDXis/3rX/QC5L23ifa9AuuBBT84OXVKJ?=
 =?us-ascii?Q?GLa62rSPfFEzVAkn5tJfiroOPzIbPlvbIRuV8+8No3dRn81CL1zesO7F3INH?=
 =?us-ascii?Q?vU2KkA8jQRvhyQnEmCF2kaMXvXZwNM4foVna91Bh9rTq5wEFh3WeJ7pMBzHK?=
 =?us-ascii?Q?ySdk6y68+OEAOAThkYMRYvvpoNeU+Jz0rxxq940501z0tLBicx1bLHu8Yxr3?=
 =?us-ascii?Q?W0fAJkG7WVKddGr6dKCDhZKaBm6898Bwz5jeMW3uzNzyJcqvI4588tBkt3M8?=
 =?us-ascii?Q?D9yX6HdOzTbJS7G+ACQMK0KpB+aUeCc/3KsUMullgDGJ8Opl0MJQYf0eHe0C?=
 =?us-ascii?Q?z8B4Kd9uQDS6h/456BjonhvATtVGz2tLINM8/dRrR0Od9ebpHgVYm6mwHJl/?=
 =?us-ascii?Q?uIi+JZAvOYFpRNBhF0t8+IbuHtfLOj8YyozbXKOVZ7JFzjl7elIWsL5ZI+Y+?=
 =?us-ascii?Q?HohFBktTA7HMWf41k/fA+Ou4v947aHLtmyxpwQ1ZLsCaN50CCBc2EwbgYg7F?=
 =?us-ascii?Q?dHrNIIYv1YNktIr13y2BuIfwPbo17zX7wHB+PjGV0qKSU6hYGrUK4eApUUws?=
 =?us-ascii?Q?g8HhDmDP/yCORXGbJORy5BR6B2lt86aNjNFRjOaUoZS382+EX0pgwqP6BTAR?=
 =?us-ascii?Q?amqcDwUxiR6ZJqHYax/rsllxlVOD9vBOrg1lQT70c6pi1IVqEx/Z5CD4aE5z?=
 =?us-ascii?Q?7XXbCtj/dAfKCI0rLaDqLTSB70PpYqhC7wRh9nooiUN7CzVhDfNu1pYvrMtl?=
 =?us-ascii?Q?XJysC2Svj+77WjY/rNc8/2QjmE298EYUC88peYpjGRscpWWeRz8CYZnavtM8?=
 =?us-ascii?Q?K6P209QuKicnATfSPpkNpBGXqQn/pizNJ6/eYa+FzAnW0Kyp3rrI58lhHXKy?=
 =?us-ascii?Q?9fb85xnCZVJa6D5n9ZeWEoEinZ3kD7v2zhqij8jxaFfU2yhU4Oy4JxtqCJxw?=
 =?us-ascii?Q?G4sKFUrC5PVLvsS1IjiaDxTnni6t8uEOI+So1k/p/kBxJ0kH5+XpDtxzWxt8?=
 =?us-ascii?Q?SM4VhaC8ATvjsFLQjCaGBaL8LFP+hXx/oJKm8ycUG9UTWFq+bi1ezcEBuoWi?=
 =?us-ascii?Q?c64mvzD94i6Ki2YxY+bGY+Iq0iI9ai3uGvtxw1GGnofg6jbGN2ZKfTyV/imk?=
 =?us-ascii?Q?+OWZ9UN64N5eRRKFjxc4breoGhQi5m/HdREsfkXiQpX6BaMdfpcWQgcLBtq2?=
 =?us-ascii?Q?HreMQrDIqnYfBqHVTqQG8pXOJcSdcfdphFoFtHjNr2p6biF8kac+sA2NZyKd?=
 =?us-ascii?Q?OUmF71U8E3SO9Ic+cyOwCk8aHobEgcZh3KIar3ZafY1LzGbPr+P3wptV9pT3?=
 =?us-ascii?Q?JeIJQcnSBSwsRX6/SADSytBl1/Mtn6T6fZVtRm+BTo86zeQxMs7zyrChKA6n?=
 =?us-ascii?Q?iqt6E2Gex0Pcq71IdeGHaQ7BNDGFJInhNM5CcPJ4coNesJPaArn0vmM7UMFJ?=
 =?us-ascii?Q?wPQ070z6X0tfwAjnu07dPdfPi5mopnddENhdkeai?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27766e03-015c-43e7-cde9-08dcfc80cfd6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:28:55.4808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PTwBDjZPd748WPoiHWzqa6XvwB/TZKBwbWJJbSHXdRypr+mQudfcHHpSqr3C0P+ZKoUH/ApZRbGib43unOyoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602
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

Multiple display modes could be read from a display device's EDID.
Use clk_round_rate() to validate the "ldb" clock rate for each mode
in drm_bridge_funcs::mode_valid() to filter unsupported modes out.

Also, since this driver doesn't directly reference pixel clock, use
clk_round_rate() to validate the pixel clock rate against the "ldb"
clock if the "ldb" clock and the pixel clock are sibling in clock
tree.  This is not done in display controller driver because
drm_crtc_helper_funcs::mode_valid() may not decide to do the
validation or not if multiple encoders are connected to the CRTC,
e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
parallel display output simultaneously.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this patch depends on a patch in shawnguo/imx/fixes:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* Add more comments in fsl-ldb.c and commit message about pixel clock
  rate validation.  (Maxime)

 drivers/gpu/drm/bridge/fsl-ldb.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index b559f3e0bef6..77afc169f0d3 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -64,6 +65,7 @@ struct fsl_ldb_devdata {
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
+	bool ldb_clk_pixel_clk_sibling;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
@@ -74,11 +76,13 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
+		.ldb_clk_pixel_clk_sibling = true,
 	},
 	[IMX93_LDB] = {
 		.ldb_ctrl = 0x20,
 		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
+		.ldb_clk_pixel_clk_sibling = true,
 	},
 };
 
@@ -269,11 +273,31 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_info *info,
 		   const struct drm_display_mode *mode)
 {
+	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
 	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
 		return MODE_CLOCK_HIGH;
 
+	/* Validate "ldb" clock rate. */
+	link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
+	if (link_freq != clk_round_rate(fsl_ldb->clk, link_freq))
+		return MODE_NOCLOCK;
+
+	/*
+	 * Since this driver doesn't directly reference pixel clock and
+	 * display controller driver cannot validate pixel clock due to
+	 * multiple types of encoders connected, use "ldb" clock to
+	 * validate pixel clock rate, if the two clocks are sibling.
+	 */
+	if (fsl_ldb->devdata->ldb_clk_pixel_clk_sibling) {
+		pclk_rate = mode->clock * HZ_PER_KHZ;
+
+		rounded_pclk_rate = clk_round_rate(fsl_ldb->clk, pclk_rate);
+		if (rounded_pclk_rate != pclk_rate)
+			return MODE_NOCLOCK;
+	}
+
 	return MODE_OK;
 }
 
-- 
2.34.1

