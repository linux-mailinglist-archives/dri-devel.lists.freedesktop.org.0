Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC03B9C52AE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5631810E5A1;
	Tue, 12 Nov 2024 10:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="P6F8pc26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8389710E5A1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2LkA78cP7IFtJdtsavQsWSJv3GbCIzInSEHYhu4bJrUBG/ixVNsrAOGVStv5jWHgz9H9iUMjVNfdXs9c5ADcPpooOwgRS+0EtQw3urwlHjo5lRa43YtKku+qbmuqGsYgKUq+ynAxnncsGwbJ7haf//bEvOrt/YwlxnGSFfyV7f4so6bab60Ye+saLGsOiB1WemPmjUF0+WHgyCuQUPT2hGWi2JVi1wTFNI5OYh0PBbIz+YKPNku0MSwFpWbNiyeQzqT7NRw4lo4KexoqERWIvfxmSTwGqrz/7tQjH8e5p39fqk4GYthuDK2m0X74k3izyyLnxioRzakCCjnxFiWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVq4WTIZEOvtLEM4VG8GmR/3IxEaIULs8rknSzC85r8=;
 b=EJ7DjTnKJTl9FqdrmF/XaBokvcYKETihXf0Nck8RRmZAXijiW+yPNNv+2HZCUnzNCOgBsfEeUTHtFpTrghHd0nEYGGq64QTeKq5iHQ0YppUWoNmYZaGoOpQfrnupiWcj0vfJII5TiD9HyQDDKQL6PxqJQt9C80O2P9+/rwYTh/l2cUFqGD19IcaQAixjE7p6NUpBRrK2gzVBuzaxIaxk/Ib2Mwylkoxm8NyQgS7UZxHJPX97LPD6CEzg6zPoCGK43et+aA4AR3H8eSL+wMUyJZsv1A2KJ3wnq2sbQ+2tjYA6X+tgRHfOIfPw6PlRBNDpxVYhyC6suONDR2CTvdgkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVq4WTIZEOvtLEM4VG8GmR/3IxEaIULs8rknSzC85r8=;
 b=P6F8pc26tjlUULbUn5a7PH5++tP1BxlmBq6e1xiIWlkFRKa38vEYKolIwsxPfJKqq8g+j93yaS1EwDz/rG787iMO0lzZhhrkNM51PjH3Tw+Oli6TPGxTra3WZN0cL0veIeS6VVkkoQCxLPtdWCgIGU8x6Qx3paAUeCwezb1LyW3q7R63jhnQCcE5KBvjOlKTtSOwZvIhioAJGOj7yQ30wFp2qIxe2fHl4csfDVhfbQbPNjYV25VmbT7A5d3Bv5OENu/4aaaFfibEgiWuz0SdM+G/E549kK3P0l4mkNrNhFfxoiLlXIK/sS6siY+WvCPi5KmN7URIGRKNXKpUPQTZLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7879.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 10:06:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:06:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: [PATCH v6 5/7] drm/bridge: fsl-ldb: Use clk_round_rate() to validate
 "pix" clock rate
Date: Tue, 12 Nov 2024 18:05:45 +0800
Message-Id: <20241112100547.2908497-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112100547.2908497-1-victor.liu@nxp.com>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:3:18::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d9f606-ab08-4baa-e834-08dd0301ae42
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vo4aYelIc+pmkTPKoYDKNgr+KtD51hDFP8cr2COg0KOfxwhsaQceBXEoxslo?=
 =?us-ascii?Q?C4xRmpp6vBiJcjtYgkZFvqUu/LNJx7v5fD/8dJ9Z23nSkyru/oPtAX8dap/h?=
 =?us-ascii?Q?y8h+IM/s20/uSNvbVGNR1AihvLdwoFea4jALp9kwXN8Jo2RBFMHTXaWx7wjm?=
 =?us-ascii?Q?XRKk4NSSNKoeajNj62CHWIV1lnl8sthpux+Xe2RcTZ2j7w/cxKHjt0RiEOoS?=
 =?us-ascii?Q?Rj++zJrK3Dp3O9JBsGjEoBhc0h6t5/Je3KHSXiPxo80ku3khdQ+OCq2rYQHV?=
 =?us-ascii?Q?shN8aGfkkhBWPoSqGMDPA50mJ54KWxWI3BGaBo0CZJcvKssP4dhlS+I5bI38?=
 =?us-ascii?Q?miQIk3Mtrs3eCTmyrK/Ha0H8UOOHxFPOu1RmtKjH/z5iqcw07SDSDJy9LIRG?=
 =?us-ascii?Q?vTCrS+xYkrc2kEQ3s7VVI83zsQgYmuHN+v8TkA0H6Wqjx4NRGUtogR6bfmVu?=
 =?us-ascii?Q?sSZYOGFQgqvbb4NX15qM4LMVym6BW/5VgmPY7SoOdEy/m2vIKS/mnEBn88NI?=
 =?us-ascii?Q?IuvboOJn5+8y6oKAJRXIxvwXaHHSGmmxhpiyO9qUdLFywfviBWc1edV/7PEe?=
 =?us-ascii?Q?uKGzAZvky+Yn3C5dxlNxKfPv4gFQ6v7yxgjD/RpjIgy0ibauj3cIuqWY48nJ?=
 =?us-ascii?Q?6m5YE14CA057sUEheVGWjhvyan/Fg+5ojhu/kyW1Rpdw7zg3x4pllgz27SqE?=
 =?us-ascii?Q?/Sleq4wIM31K9zA1nVrsFSD6UfFtO78n9bX4fTvcyBd5elTrDiRzzBjXBhpI?=
 =?us-ascii?Q?38AYZLLZmWIY3CdbjISGXdyRptrUDtEadjG4B42o7e4dAs24kppNc84Ly64O?=
 =?us-ascii?Q?OXqGyMi2mU4gPnqomrjUxDmfrrWwjQEhmWiDFGV+FLsDGqFm3ujZlUemfkwV?=
 =?us-ascii?Q?wAcADZXjuglOnxolg3YOULZG26sQIn23JwE9Ge68IkLVnQFNeUw12Y9gAqIt?=
 =?us-ascii?Q?vTm3GHnsYQHJs3tNqoI9RgTIUCOisB35UIVCYlOf14aMWwKl8NX0icT/H7M5?=
 =?us-ascii?Q?1GK/rPszX201fFK6ZT7EZ2UaLcJEy+2egDpxTgpX7M+MjZ/Ri7FEoP6pgssQ?=
 =?us-ascii?Q?49j5wMa6AhJbMbeuMUIRq8LYNLKpC7dKrHDy4b7Iz/T6mtH5D9qESy/DqTDw?=
 =?us-ascii?Q?EbYG9mJRF8cy4hQpYIdLEahkrd2QWriE35mVbP8tmZ+X421/G4HRoO7XPhuI?=
 =?us-ascii?Q?YscB9Ricj+S9DZ0Gg2dSGQF1e55IchkUm9MLBBXLW61PvJYfYNltfI6QkyxG?=
 =?us-ascii?Q?7OUenD8B9yaTB2pYN1spmsCuUDHcLG4Wful/6b4c3pXd0jHJmN8C5DUp1R9j?=
 =?us-ascii?Q?iFNlSbcPN37s8S2G4uO3GmNoPwJZSTHjy4J9+VReMHUR8FSb9jEiX2m1j9N3?=
 =?us-ascii?Q?SAwqSzo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5G7NEnP2aQabAny+atjNYXOHwQk+ngWlznSW3WOZAQeMKf7BqerxbPNVWV4p?=
 =?us-ascii?Q?tkDW6P9iiBrlgq1dTFuF0yQOYpyOhDTOdCWDobPzZr9xD3ad2MF6mKuEjejq?=
 =?us-ascii?Q?N88Yc+KscAXc19tSrPoboU97K2Mm+9MTQdr9Ud+G87lUPkZo6Oe25t/J63AN?=
 =?us-ascii?Q?XJfUdZHyigAXbZy+X92l8wK6ZZmZqjFDDKcGEWVBOFbBzMTvDvWYLyzAofO+?=
 =?us-ascii?Q?LTEmadIaoz78TlVSsCPuHPhf5S44Ma6OcP922C9byk4c/Ygt9ziZVhbp9rQN?=
 =?us-ascii?Q?3nrsFQl7W6RAk1xtrxjE1yVUMQt4+DSXxjj9Ta450oyXbv8aQA/wroFBzqjC?=
 =?us-ascii?Q?tEUhRfdH6uHIYRkRtioX3X6+8//lKX+d8uewjmZBrYKayAvf+DbpZfW6k4gF?=
 =?us-ascii?Q?Fmm2SEhq0zD0QZiGg20+Jqmrn3/p+DLEQx9rwdO1Rk5lAK67P7nEXdddq99R?=
 =?us-ascii?Q?mDlAVb+7snb3qxnIPrjiFikQnC84HPh/u4Ce66wKPFvJ7jfFoVKvzRMgacoT?=
 =?us-ascii?Q?GjYj6HD48haoG0cx5A82qAAK2NqbROlM7GL6VYRv6EsxQg0yKUbS3EOjC4ws?=
 =?us-ascii?Q?BGSDECifuuRwAtAEAcQ6v1Fike1epkjWyrsPiPs4TfEPlYWNaGDyvZowNZg/?=
 =?us-ascii?Q?sN/qoMkPKKt2UX2N+p5zxxyh8vYcadPvi4/6hPiBsOgJ89Wpc/eU6yycmc88?=
 =?us-ascii?Q?b9U0V9RsTN/UNvv+VdV4kptdKRHHIxxWZ2btaRpI3pzrzXhnKUpcDvbj95nr?=
 =?us-ascii?Q?5TcAdJeggAnB614a4c/BuqS9LXifPTes1YBQnX4hUS+bJVMhaA9icCe5WpLs?=
 =?us-ascii?Q?EWnEs00kmHv+/RvdvJvvTgxkQIBLTeHFYVR1xn3TndXmswquzC03G+QXYaXO?=
 =?us-ascii?Q?D1+Yyru1QzIQModIGqMcU6zYTqDM4I6Jip+dd6zOwXMTjICcBx4y5/42zg7d?=
 =?us-ascii?Q?iTf2oFH24DHI6PrV7sPfo/GmYtKF2T7PNh/B4bdOgOpyvap/wbSQ/zhymTtU?=
 =?us-ascii?Q?PL5f9+IxUYGitweBCwfl5pN/TievXatvwjWj6DZEdjBgKpNuB5SUXBDNgJTg?=
 =?us-ascii?Q?ifEIZXFZKc7FHoV+WQE2LxgXHHVz1kaQwDBccXDr1JgT0e+crJOV1x/p70IV?=
 =?us-ascii?Q?29cOnGktG1+/YZUO7/oY2bwskFec3RvKNo1FfSUL/wEwGgEayFXkd7IT21Qx?=
 =?us-ascii?Q?8+tnZPrBb3Ns8j+4NBAzogQg7U8JiMuoOHZQJ3NktOOBTdrsqN0SLdvrujoC?=
 =?us-ascii?Q?t6bBV/CHfTWLdWM5qPdDM5Hg70rgFw3GKFUYkDHz8PEHuUUfj+KrDfDTD5ZV?=
 =?us-ascii?Q?p9lPFdNZRLVaTeLKOxcL8UMn6xbupe7uVLmo+yNYKLoHUT1bI8vom0JAS8dS?=
 =?us-ascii?Q?4ht1/tEEhpYrt+lCk6jWsZZbOT3YO8XbCJfupsl7fAYdjRXd8x1x1AaADHSH?=
 =?us-ascii?Q?mar1S+5ajB1X+wqYi5aGJMbP3IA3hQQ96Ofttv+oBjkN7+LIdz6W//neR6sZ?=
 =?us-ascii?Q?ksI+b1XMvg2qq2yhmra4DnBCpsnUZ+Pn46C4A2tzx6D/gE0e3B5hTbXkVgvB?=
 =?us-ascii?Q?bHq+jUnUEk4HT71IqN+sBwvCPsWMi+doVzk3sEGM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d9f606-ab08-4baa-e834-08dd0301ae42
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:06:31.3887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHnYoxrG4c6uYNEKEMVayIlwx2xN3WsFgmCb5vOEJI3d7I+4e1UrFZIGZBvmdb+V045gl+7GJxpDLxwCR5vBWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7879
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

Same to "ldb" clock rate validation, call clk_round_rate() to validate
"pix"(pixel clock) rate too.  This may filter modes out whose pixel
clock rates cannot be supported by the pixel clock tree.  For example,
when the pixel clock is derived from the i.MX8MP video_pll1_out clock
and video_pll1_out clock rate is 1.0395GHz, mode 720x576p@50Hz with
27MHz pixel clock rate will be filtered out in LDB split mode because
the PLL clock rate does satisfy the "ldb" clock rate(27MHz * 3.5 = 94.5MHz)
with 11 division ratio while it cannot satisfy the "pix" clock rate
with 38.5 division ratio(only integer division ratio is supported).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6:
* New patch.

 drivers/gpu/drm/bridge/fsl-ldb.c | 38 +++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index d9436ff9ccc3..035a3ffb4b3b 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -86,7 +87,8 @@ struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
-	struct clk *clk;
+	struct clk *clk_ldb;
+	struct clk *clk_pixel;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
 	bool ch0_enabled;
@@ -176,15 +178,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	mode = &crtc_state->adjusted_mode;
 
 	requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
-	clk_set_rate(fsl_ldb->clk, requested_link_freq);
+	clk_set_rate(fsl_ldb->clk_ldb, requested_link_freq);
 
-	configured_link_freq = clk_get_rate(fsl_ldb->clk);
+	configured_link_freq = clk_get_rate(fsl_ldb->clk_ldb);
 	if (configured_link_freq != requested_link_freq)
 		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
 			 configured_link_freq,
 			 requested_link_freq);
 
-	clk_prepare_enable(fsl_ldb->clk);
+	clk_prepare_enable(fsl_ldb->clk_ldb);
 
 	/* Program LDB_CTRL */
 	reg =	(fsl_ldb->ch0_enabled ? LDB_CTRL_CH0_ENABLE : 0) |
@@ -237,7 +239,7 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
 	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
 
-	clk_disable_unprepare(fsl_ldb->clk);
+	clk_disable_unprepare(fsl_ldb->clk_ldb);
 }
 
 #define MAX_INPUT_SEL_FORMATS 1
@@ -269,15 +271,21 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_info *info,
 		   const struct drm_display_mode *mode)
 {
+	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
-	unsigned long link_freq;
 
 	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
 		return MODE_CLOCK_HIGH;
 
 	/* Validate "ldb" clock rate. */
 	link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
-	if (link_freq != clk_round_rate(fsl_ldb->clk, link_freq))
+	if (link_freq != clk_round_rate(fsl_ldb->clk_ldb, link_freq))
+		return MODE_NOCLOCK;
+
+	/* Validate pixel clock rate. */
+	pclk_rate = mode->clock * HZ_PER_KHZ;
+	rounded_pclk_rate = clk_round_rate(fsl_ldb->clk_pixel, pclk_rate);
+	if (rounded_pclk_rate != pclk_rate)
 		return MODE_NOCLOCK;
 
 	return MODE_OK;
@@ -297,7 +305,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *remote1, *remote2;
+	struct device_node *remote0, *remote1, *remote2;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -313,9 +321,16 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	fsl_ldb->bridge.funcs = &funcs;
 	fsl_ldb->bridge.of_node = dev->of_node;
 
-	fsl_ldb->clk = devm_clk_get(dev, "ldb");
-	if (IS_ERR(fsl_ldb->clk))
-		return PTR_ERR(fsl_ldb->clk);
+	fsl_ldb->clk_ldb = devm_clk_get(dev, "ldb");
+	if (IS_ERR(fsl_ldb->clk_ldb))
+		return PTR_ERR(fsl_ldb->clk_ldb);
+
+	/* Get pixel clock from display controller's OF node. */
+	remote0 = of_graph_get_remote_node(dev->of_node, 0, 0);
+	fsl_ldb->clk_pixel = of_clk_get_by_name(remote0, "pix");
+	of_node_put(remote0);
+	if (IS_ERR(fsl_ldb->clk_pixel))
+		return PTR_ERR(fsl_ldb->clk_pixel);
 
 	fsl_ldb->regmap = syscon_node_to_regmap(dev->of_node->parent);
 	if (IS_ERR(fsl_ldb->regmap))
@@ -375,6 +390,7 @@ static void fsl_ldb_remove(struct platform_device *pdev)
 	struct fsl_ldb *fsl_ldb = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&fsl_ldb->bridge);
+	clk_put(fsl_ldb->clk_pixel);
 }
 
 static const struct of_device_id fsl_ldb_match[] = {
-- 
2.34.1

