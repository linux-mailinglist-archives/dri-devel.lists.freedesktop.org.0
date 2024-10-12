Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DB499B1A5
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 09:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08CC10E300;
	Sat, 12 Oct 2024 07:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DGtVcclc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2081.outbound.protection.outlook.com [40.107.103.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCCB10E300
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 07:37:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcxCbNRjohnwrhlg7NbyvRer3I4RqFcJ+6kvvITLO4MOU8ooIZ4/PxviOuYfxZwJvkMXlzzN8WnVYKZlALwqHEN9+pfXv7H+pgW44zNLBrE3Za0ZSvRU+XES1zaNT3IgbKpDSZi7Ioolx1TYZSVW+JjcIiHsHvI1QAs220uY4Ihyf9TgB1vdFNojcU6+tBih8Pb9uomCogc+5IiyD0axKkLXLFDe+HzjZ4eDH0NNIIU9YCsFBt4jGN3/VTPqhJg1gtGvEUyLRMGS1PhUAgjM0CFxe9nQL/VKSFHu8guD2ZQZg81bi7cRLjQXduV6hpcTHOd7jg4spp3ifZMPP02vhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txhMIYL2GZzyI1GvUUGUsBaJujCliB8cy+8lF5hstFg=;
 b=BByyd8RtWyyv7NEzC5q8ZL24+GNziHVRv15L+Afs1+oCZWzLNlmDl9IA0ZCapFpQHwYSlOTIoY3E2s9cIdyzk8ZWt9altl2+f8dRdvNwZd5e9L3p2vtJYkIoL40bV8//HnSCNkS/h/xs6bi/0AZe5n7A0aB5sJqGp989FT+Z+a0B7ilMWCIWPGioR25p8nVaStT7LVOUSX5hx9ZB8RTtqtpM2JAwSj4qQLgs6ZrNs3XqnMVaBRnn1zLZG2PX6j6A+84jDJQUm8C2Oe1q6AJTkpFYKt0tTMSCBZS6zo8KgPunzUndi+1khZHno9jpKW85kam5PrQ3P19X2DQTtv9FAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txhMIYL2GZzyI1GvUUGUsBaJujCliB8cy+8lF5hstFg=;
 b=DGtVcclc6dAF5lvWQBYsiIqXf3QSVG+W7PTk5Mbe2FP4zeGMVaX7ADoTH4scUkkDPifaiAPgReuV/bx4gsJvIiTDyLhqbtJrd0PAEXUG28cNly089hvw82zSfKKEfLIly6WsKvjzYCRqSkRljaUUbKIH1JO+SK8LrKKuHIdNIr4zqlCW3LvWJZU/fPb9XKc5jfDPX5v1q3MnIfGVPE3dF8IyaMzvBA+N3UkxFyUoLfQnUSX+ispcNJ3BMAMVSAk0Dox8l3iJEmlIQKs4bzL5TOrPJCM+kXqyoakIfg+nurPzw3ZurcjLFog9p1YhYzk760ZfQ3Ye7skJt2XW/wBV5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Sat, 12 Oct
 2024 07:37:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 07:37:19 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: [PATCH v2 4/9] drm/bridge: fsl-ldb: Use clk_round_rate() to validate
 "ldb" clock rate
Date: Sat, 12 Oct 2024 15:35:38 +0800
Message-Id: <20241012073543.1388069-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012073543.1388069-1-victor.liu@nxp.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f13943c-2a24-4651-97b6-08dcea90b3d7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9QspTKpptgPs3aJLdmSwFH61tDpxNJxjGwDrVfZ5YTIb8e2BHBKd+CWArOq1?=
 =?us-ascii?Q?IB/Xjqd+cm4SUE7GR8l3tj8aQnVlhJ7rkM4dJrZSCZdDDljJfVdXMTYYiWca?=
 =?us-ascii?Q?MpuLa3oM73R8bmlqu6eSukmokrItaqWdPKWmRN3+ORYD9xVSg0FSUnKYKyDG?=
 =?us-ascii?Q?BcBffIcIIO3vDF7/n24nciRlSFVLykEt3XYMxaLW9duJZMGvsJVhvufickjg?=
 =?us-ascii?Q?KGcaJSvKKErBdXpwxT9w3VewblvGeLuJjRXOoPgL6KXDLHm6WEuKiS/367jP?=
 =?us-ascii?Q?Xzj0tLFng4lFLnVRjjue9Gl0vkpO0YkyV+xrQvEfcYCKFQSfwqYz3dVt7Fy5?=
 =?us-ascii?Q?1XQxG8OHjgiwxbnUAsTvxIrJCd/NEkcAByp+e7w2fxWAyoTRqNsoR7vSfPnZ?=
 =?us-ascii?Q?MJIVfeOZsiAMbsBi+tBkc921J47XSKWdsYBMmqQVR3qjjLxyVKZj98vu9sCr?=
 =?us-ascii?Q?/Fq38s5einGncj08BwOwfNwOhL1cj/vdYGMLP7sA70GEzuztp4sJt/vk5SWK?=
 =?us-ascii?Q?1OhO1SST8rfrTew9IWgqdNARKg8IYecdUT71vmXlfcP4NtF2UM9XsECHcMwY?=
 =?us-ascii?Q?Uwh+FJhZQOsC2vYudkdG4fo/KsVaDZMKnVxeoLsoL+CSCLpTq5rb7nahUtWe?=
 =?us-ascii?Q?zrXYTcur0Bp5IHNSZw6dR0rBDmV+VuL1QY5roIbidM8OlTMguP8yPLZ41YQC?=
 =?us-ascii?Q?UJE5jBqHSNdvUsN3/9AEIhgw88xRd7S2ZSSDNmaN/+OEaBCyH2f/JFeI4S3c?=
 =?us-ascii?Q?RWz2+xbKL/rgnWC0IJm/kIDmeXDl0KHlew6EP43OhEzY6wu18BSoDpS/mit/?=
 =?us-ascii?Q?892ZytVLW+/1hVzicY4Yrzi9+ccyvmuhDRafunjwkubuB7io4ACEfO5kbD9+?=
 =?us-ascii?Q?eWu0DRjBksuG8Qdf4saDmQa/UQzvtnCAlOisWTqyrfkFuhLgCNh3yQyMHbfB?=
 =?us-ascii?Q?8FHiRL1Hh1DK4ELA9Mim7y+ei5EYGQ6ASptEZjsJC15nqsRHtWR25579U7Dq?=
 =?us-ascii?Q?y0IZUGuLm3GpHtc0eb4mAtbRywJt5emusLRlXyMIJelD771kbSfaBLEFszmW?=
 =?us-ascii?Q?CKwrUpebX0XIdPjPkl3r4mhX15GLVj8swARyz69FgwlOgwUAtKyIEvzEkdrw?=
 =?us-ascii?Q?7rjHY0vwI/pLG8NK+3k7t964kYt8GDQEe+xlqgfYE3WGOidjhgMfucULh9Xs?=
 =?us-ascii?Q?KDDwTZuM4sowj2/hT4iANT1Ov34SIH5bGt4hEsPOKTcUX9eVe/BYoj9EzS3b?=
 =?us-ascii?Q?sMHeWjAcetVGQiZfZD8BbcyCHfDyFoGz4VXAA/CglurXBA0KF144v60bzDaO?=
 =?us-ascii?Q?+7I0prYQtsJqmch50jYoM4dJqu6hi8ZYpx5CYDs2UVvA4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iMLaCIMEgWuCCASN1l7tDI8/8DLlezfml81MpJRZbI/ZVdkaXyw+6ejLs8DM?=
 =?us-ascii?Q?4nAR0mfq6BdQzmAk3c4uRsErvy3TCVLUUxrJsNfjTRblNJz58LhVeL+WycRB?=
 =?us-ascii?Q?lFfLpdVHrM5n2WUALs/wWWfy+vSeFNnaLemUcT0Li0vWuigqecux1JxeWRnC?=
 =?us-ascii?Q?Wi4d+8W+vKz7Eb8/moZ0YsItzvDIIG+ovnImf6Y8NiQ4go8z2yU8RbSBFj7v?=
 =?us-ascii?Q?rFEZ8Z2/Y1x0mZ9Qlij1WJUW5El9fpmZ5Dt7Fzvp8uAPhWQW5Tgw78uzg9mW?=
 =?us-ascii?Q?GgYxN9MQm5pLy/fGmoNhsJqvCYxqvdB0nxGDqPbALsJwnERnicqAdX6N4tsZ?=
 =?us-ascii?Q?06oZ7Ae3CXiW+ZWn9XdK/Q+BU4XQXswvwK+h+/McvpkaUBK3968cTkDQ1ulA?=
 =?us-ascii?Q?7aBmzgG9QBf2T4A5xjCTMYUe9NCvJ5G+aOCDC5E8bbbTZyZIhDura4PmGBuy?=
 =?us-ascii?Q?DM21ST/QIn0ZxBFGqr+urNPg1sbGWKqRIZCSX7IzOwh1EXOq+tyytvA5HtE9?=
 =?us-ascii?Q?YGAASxFHo30juR1e3mqp1ZrgkZTfstq6mUFXw9LrawKdnIZeFdD/bDNYERt1?=
 =?us-ascii?Q?6eRqFt5jaqQKgHs1YboP2VE6k/3bj0Mt7x/ZVEMocrIFFpdcK755d9hU4GCy?=
 =?us-ascii?Q?/5l77T0pmo+kJaZgEz/xwi0b3UjKFtA2LXQRWjfV29qAA+LWxiVfgyZc4ug6?=
 =?us-ascii?Q?J6T43aYDhjFZ4JipLYzZFeFBgyt8q7MG38MiH5+hvDrk2Ep3tX0VNQHOiyRy?=
 =?us-ascii?Q?EBr/5OOkh2i7mU4x7RXKI7KuT7xTd6htdUIBivhkZsO2meJHWDhLiy2xFe9j?=
 =?us-ascii?Q?GWG8DrDKsVwmyb7xhjsRN/bpbnVGGc5B6pCyTjp+BRrjhBrVmcNCm3Ucj8oV?=
 =?us-ascii?Q?xY7MUtjbcNKz4Bi+vJfYWpghr4MuTHsVOlvpo3Bi3vfNXgJLOUmg7uu5+nsx?=
 =?us-ascii?Q?UmVrc5VsJC91LT7F02rkvnIN6JslhBlenC8/lxBZEw4vAlb31oXPuGndkD7j?=
 =?us-ascii?Q?pTNIZNawEYokzZYzERuDcdVVZVHIw2I8MwqoWqmR/VJuPIzNBBgC4KndruwD?=
 =?us-ascii?Q?kujz95CDIH3Nn5p0EfTMXNLet2XGqmw50WEUyfediV4oGbAy7juam5rSbpeJ?=
 =?us-ascii?Q?mLasdeWyMCztbzp5ltfQF6MHd814LaJue+1scClMxr4VTFOwM/l2tuZohCPm?=
 =?us-ascii?Q?raXP/3f0ZvNNsjmCO6sGYax//jYPlDwSqYuof2GrjUle4G7GKT+okgB/+JNI?=
 =?us-ascii?Q?udmkkcptsl1+Ee7OK46ghy5P7k+o4C0XhNMD2Y9YjLd6ubZ7Qp8/huutKa9t?=
 =?us-ascii?Q?ByKbMbI/6uVgjuk5fnCz0tpjf3wAHHBfzsV2uQwaPD4byIPLpdLOzpY+29g4?=
 =?us-ascii?Q?O9gm1KKATyBV9dmDmZSNRhAFI9KoR/uC6WmZ1oFlKX9C1lDiksWNb0YjLI55?=
 =?us-ascii?Q?zmuh4jufVk5jhYiamwNaeUwA4Ca/6EUXu0yB75Jy0FiGc2h6J3GsMiy7ehvv?=
 =?us-ascii?Q?wWTCJDeUzR9Iw15V2wQwLnYK28Us4VdRCZ5mFDy9GFPnbCKcoPmIJh2wr8KY?=
 =?us-ascii?Q?QdqMfHByRRRl+NocRYwV0Za5mJJiebZ8iuF8wzHN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f13943c-2a24-4651-97b6-08dcea90b3d7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 07:37:19.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQdYeNYZrGRKRh+CoU7p9SQ6bmJvYrq7llft412JhBFYfAg+wlJry92QY+pFSIrBlChxPmhVZ04mKr4IhwyqEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986
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

