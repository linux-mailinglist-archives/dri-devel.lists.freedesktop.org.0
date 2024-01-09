Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BDE827F92
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2359B10E371;
	Tue,  9 Jan 2024 07:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2040.outbound.protection.partner.outlook.cn [139.219.17.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D036810E35B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 07:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IisVBVwVCo/++08g3i5VHvwbDtOWZUMHLKjyf+J8VH+WedNbIx9nziC0zuiaC5bDu0e2ZO1VmffJ51VuBFctonJ4gPOWcWsKqcFXzYK9ExQR1mk4SNxRb8m0ovaQAodgN3mxCE6NduIQutxRJ0Dm/T2UtoclSbwr1m78d4X5OFmYNh+fVofswcMVa+xEbraCyPoiL7pGvbe/ID38Dq5X4QTa5MFR+obukVAfwB7TR5GYMqgw9DKKlTtdk1SpN+3KG8wnttBK0DHicQr+d0Xvx1kCO97F4A31WND2it97Pkl4ANm2tAzwBfViTGDyCyANMKWsyEs0SoHoLvPNReKKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyBNE/c5ohK97c6vvQAsxO3Nu5hkH4bde+VEnNwEOa0=;
 b=BPpzzxH8SxYpCW4xQ0qx6K13BrqMZS98wdSWYDp2eL3YkpDDkONgg2EiqH2AHoRytE6jl3MSIusK91YxTNmd9jSCosaQt9OppTrCNtQexuQmxo0HVqG0EqXsHyCU4jiVv817mfufzDvR417wx5Xo1RGbLX3aR8NbK9QEP95+zK9OusJZqaNYpEDMfMfWQ6RoEj5zgnfm7vK4wFuw0M1ZvCti4COol5SgnyQcKxKu0GT41AnSZ0CE62o9KIBBb/ZB7Gr+Os3QbOShshcJ86xJs0YQGXpGNTA2ScGbFrRqrt1Yld+9CQ2mSUOg2GkgnD4vXWL185LL3k5zaxuUJPVZbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1231.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.32; Tue, 9 Jan
 2024 07:25:27 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::85fc:7fb9:8b00:dd88]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::85fc:7fb9:8b00:dd88%3])
 with mapi id 15.20.7135.019; Tue, 9 Jan 2024 07:25:27 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] gpu: drm: bridge: cadence: Add a driver and platform
 ops for StarFive JH7110 SoC
Date: Tue,  9 Jan 2024 15:25:16 +0800
Message-Id: <20240109072516.24328-3-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240109072516.24328-1-shengyang.chen@starfivetech.com>
References: <20240109072516.24328-1-shengyang.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::13) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB1231:EE_
X-MS-Office365-Filtering-Correlation-Id: 1871c946-213e-4eb4-f41f-08dc10e426c8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bCm187VP5pnl8t5Sc7ONQN24ZH1BIN8sUUTYcK1oIXwraQxYK9evC76lUv3nPSyjxvhq040lYuIkO/giBNc8ZNq1ajSpCpPeWlddA/tLM9LjI4SNLMhfJxA8GCqQOpCnfXnQ2b0+anbRSa4wX63NdE4wN3HDWnpv0XqDpy3yomZJ374iKQyCOak5MwL2NMMXR+nxPzPJ9dOoGpHWGWiayEgVV7mtyFyVPLzPA7hbBMqqb5uzkF0TV3M7sWSXiFAxe+JJ/1gLL267yacUXRTqk767CuojXBP4+N2vqLjcsZqExD2Ywrt6H+KQhu390+VEpt3Yj3cPj6gJROpIHxaKmvJTZ6YAoiNhKE/bjqHRbT6g6OiOLEN01Ugwl0DeE1MauNnmifkRL6+y3EkQuHgwZQiZWkvKMhj6+9GgnZuXlNmOtTY52IHyc8YE+/oXnWwra+5Ypgec/c6QSTkjurhqeEY+o+sJvp9Xmea/VCWo9whH5egPFHkKW7cmf3biCZudnj2tyHEdaHOYLRBfNb3eVj+uVSI69PYYmG1wx9GhDeviLUZ8dFH7SiLA6VLHATLg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39830400003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(86362001)(66946007)(40160700002)(36756003)(40180700001)(38100700002)(83380400001)(1076003)(38350700005)(508600001)(52116002)(6666004)(7416002)(8676002)(8936002)(2906002)(66556008)(4326008)(44832011)(5660300002)(66476007)(30864003)(26005)(41300700001)(2616005)(41320700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CrJE1grbSG18oq9ytGs0xx4cX2ufDljgJkpUfGDKkImcy/bYJhwh8s6bn4zU?=
 =?us-ascii?Q?BjSeQqUztZejbw9XpPQJVA5re2ctoJx//e9ONUh7VaCrfxoHZSL9WJ/wVke9?=
 =?us-ascii?Q?ddVzJ1JqG+GrFpSgUMVTLwWOuSzC4G+4otBFZJizILd0H1Gke4En3f7Wf20D?=
 =?us-ascii?Q?TtqfX6Bi3ZTJVh8TLF5oD+Oq3Y6J/bSrrH14cv+yCeRO3+QS7hSb04qytOy0?=
 =?us-ascii?Q?frp5mIxtLUKuWrEO/hnIh7SpFQ9V9gPI/3KtvtUsYzjTMg4pvFykKtWG1CIP?=
 =?us-ascii?Q?vGKcUVZu08ZMifs4dUAajYlXJQ1SJx7X3b1Oi/5IcDWge2kDRYyUDB5yUvP1?=
 =?us-ascii?Q?a0JhZQ6Yea9BF+k1Tzdu4kdqy9eEJCTRsVjrNcE7kVa7U0k06L21455G/SlY?=
 =?us-ascii?Q?NxapKFQZkoiVsqu1e9aDr981O78T+c+TqVfoQ1Ktnc3f2vWXNKM0SUu/G6qB?=
 =?us-ascii?Q?v2djMK/RvfQUNwS6qkS9b/H9SdWBZYgGVSwN6qhOX3A1lGCTdcPCrCrvtUYY?=
 =?us-ascii?Q?MZ7MxbcAbpJuT9N28LbjhEzAPs0n8XKJYTO2SOiKnTuCIS4atSdaHdk2kIAF?=
 =?us-ascii?Q?pykzEF1PVVm8d23ZNU4LgS5vu1efp+7BPxzI6OPjBsEr1BHj/c4GlXsT5fPG?=
 =?us-ascii?Q?+j4fCfM58btEgtMFMy7/8+rQGjqPHu7hXRM8g+ocXgUFf8ZB031CO8/LaOa9?=
 =?us-ascii?Q?V9iKPVz3FQfN/kPpwhMXGaJYJCsoMM21omwhLkYhqzse05L7fGsI9dQwOFWL?=
 =?us-ascii?Q?ImqfBDIHDnDL0TZsMsTfnRIxTrZxoUdWA8AJvsM6R1jXYaVIWJ37H6rS5S83?=
 =?us-ascii?Q?Eaq1Nkqw2c9Pt0wK+NVC6YtZf2gyQY1BZvuxr5KAM/xFUIOU5zn91gAIacEl?=
 =?us-ascii?Q?QhuRNm0jTl7m2k8VD3l68R7ju1NYdV26DqlVRP807KHVEuuHU2X/ucORDCJf?=
 =?us-ascii?Q?vbQT+Ss0uyWE1L+3IZBXFDJpiYmySFNFNLbLSB2oXoB5FzQLJdJXNbrkOYdg?=
 =?us-ascii?Q?kthJkbr9zyeduX7z5gLVQMHoiS//bULJikl/MV8m2eonqFRqFa3jkHu+/555?=
 =?us-ascii?Q?oeF4Mcx6LOXlOXCLwVT65MwUAsFmYJaKlKKNBZCxJxChm/0YxJxYcmLsbl41?=
 =?us-ascii?Q?4pcPQM2jLFHfRad0IIlsEZouxySG9dt4TUwrDdqEcd571FxM2HBAYQrgWDI6?=
 =?us-ascii?Q?Oe1FB4BKVYNzIhKVTxM+Aosw+w3Izz38qG1E3q0OZonxXctEmPjkWIUjmOFM?=
 =?us-ascii?Q?r1Q9PFqwxkjTj4O+bAN/kvHDlhS9dj1bUGgwGaSXIC2For0QSTAnOqfhol2J?=
 =?us-ascii?Q?kKfrkl6+aRV3VYInK83o3qii4KDixcvoHiVB+WZ+ZrOScDxBOe+wQ8vQDlC7?=
 =?us-ascii?Q?mRukx304Plo2MbOfohu0jn4Weto2QTTbmtqjNGwvr16XimF9bQj9Bw9WV+wp?=
 =?us-ascii?Q?7Z/XNEaPdZD6XbAmhf4qSKk5pnzF9LpzlZAHd+62ZMwiKyPhhmARW1DGWZvO?=
 =?us-ascii?Q?iPVLh/o0NhI2Nze2cOjvXzfHTh1PDH2pPZDhU5kz9raPZgKm6PQzBsYrLBMI?=
 =?us-ascii?Q?3Vvt3GtyDMK4GCeEoyPJ+r+QRRJFghV92TyaqQ/b2zFHn1vn9g/4d7SoU/bG?=
 =?us-ascii?Q?NDnvbnriZ+tGEHsPwphSGIM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1871c946-213e-4eb4-f41f-08dc10e426c8
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:25:27.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMFlPADzGlDKts0BLOrlrxw8sLPImz+TpPVawgTso3xBNCWPeJpGlRVdF+6yCpDO4GZScIEnIQGQ9NP4tpkb+rVa7zapBI1NUQOj9qC8tJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1231
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 r-ravikumar@ti.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 u.kleine-koenig@pengutronix.de, shengyang.chen@starfivetech.com,
 conor+dt@kernel.org, jonas@kwiboo.se, mripard@kernel.org, robh+dt@kernel.org,
 aford173@gmail.com, neil.armstrong@linaro.org, keith.zhao@starfivetech.com,
 bbrezillon@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Keith Zhao <keith.zhao@starfivetech.com>

In order to fit CDNS DSI module in StarFive JH7110 SoC,
The mainly modification is followed:

1.Add driver for StarFive JH7110 SoC to drive its CDNS DSI module.
2.Add platform ops in cdns-dsi.c for StarFive JH7110 SoC probing.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   7 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  29 ++-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  21 ++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.c  | 193 ++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.h  |  16 ++
 7 files changed, 274 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d32920dd943f..a220ea04f5c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6847,6 +6847,14 @@ F:	Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 F:	Documentation/devicetree/bindings/display/solomon,ssd13*.yaml
 F:	drivers/gpu/drm/solomon/ssd130x*
 
+DRM DRIVERS FOR STARFIVE
+M:	Keith Zhao <keith.zhao@starfivetech.com>
+M:	Shengyang Chen <shengyang.chen@starfivetech.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110*
+
 DRM DRIVER FOR ST-ERICSSON MCDE
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index cced81633ddc..ad9f572f4720 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -19,6 +19,13 @@ config DRM_CDNS_DSI_J721E
 	help
 	  Support J721E Cadence DSI wrapper. The wrapper manages
 	  the routing of the DSS DPI signal to the Cadence DSI.
+
+config DRM_CDNS_DSI_JH7110
+	bool "JH7110 SOC Cadence DSI support"
+	default n
+	help
+	  Cadence DPI to DSI bridge which is embedded in the
+	  StarFive JH7110 SoC.
 endif
 
 config DRM_CDNS_MHDP8546
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index c95fd5b81d13..87f603a9f4ad 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 cdns-dsi-y := cdns-dsi-core.o
 cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
+cdns-dsi-$(CONFIG_DRM_CDNS_DSI_JH7110) += cdns-dsi-jh7110.o
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
 cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 7457d38622b0..a8f976f9eeed 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -27,6 +27,10 @@
 #include "cdns-dsi-j721e.h"
 #endif
 
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+#include "cdns-dsi-jh7110.h"
+#endif
+
 #define IP_CONF				0x0
 #define SP_HS_FIFO_DEPTH(x)		(((x) & GENMASK(30, 26)) >> 26)
 #define SP_LP_FIFO_DEPTH(x)		(((x) & GENMASK(25, 21)) >> 21)
@@ -552,6 +556,10 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	/* data rate was in bytes/sec, convert to bits/sec. */
 	phy_cfg->hs_clk_rate = dlane_bps * 8;
 
+	if (dsi->platform_ops && dsi->platform_ops->update)
+		adj_dsi_htotal = dsi->platform_ops->update(dsi, dsi_cfg, phy_cfg,
+							   dpi_hz, dpi_htotal, dsi_htotal);
+
 	dsi_hfp_ext = adj_dsi_htotal - dsi_htotal;
 	dsi_cfg->hfp += dsi_hfp_ext;
 	dsi_cfg->htotal = dsi_htotal + dsi_hfp_ext;
@@ -683,7 +691,7 @@ static void cdns_dsi_bridge_post_disable(struct drm_bridge *bridge)
 	pm_runtime_put(dsi->base.dev);
 }
 
-static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
+void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	u32 status;
@@ -1026,6 +1034,14 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
 
 	cdns_dsi_init_link(dsi);
 
+	/*
+	 * on JH7110 SoC , when transfer dsi command ,
+	 * cdns_dsi_hs_init is needed.
+	 * or the final ret will be error value.
+	 */
+	if (dsi->platform_ops && dsi->platform_ops->transfer)
+		dsi->platform_ops->transfer(dsi);
+
 	ret = mipi_dsi_create_packet(&packet, msg);
 	if (ret)
 		goto out;
@@ -1142,6 +1158,9 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
 	clk_prepare_enable(dsi->dsi_p_clk);
 	clk_prepare_enable(dsi->dsi_sys_clk);
 
+	if (dsi->platform_ops && dsi->platform_ops->resume)
+		dsi->platform_ops->resume(dsi);
+
 	return 0;
 }
 
@@ -1152,6 +1171,10 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 	clk_disable_unprepare(dsi->dsi_sys_clk);
 	clk_disable_unprepare(dsi->dsi_p_clk);
 	reset_control_assert(dsi->dsi_p_rst);
+
+	if (dsi->platform_ops && dsi->platform_ops->suspend)
+		dsi->platform_ops->suspend(dsi);
+
 	dsi->link_initialized = false;
 	return 0;
 }
@@ -1294,6 +1317,10 @@ static const struct of_device_id cdns_dsi_of_match[] = {
 #ifdef CONFIG_DRM_CDNS_DSI_J721E
 	{ .compatible = "ti,j721e-dsi", .data = &dsi_ti_j721e_ops, },
 #endif
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+	{ .compatible = "starfive,jh7110-dsi", .data = &dsi_ti_jh7110_ops, },
+#endif
+
 	{ },
 };
 MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
index ca7ea2da635c..f4491009c977 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
@@ -53,12 +53,22 @@ struct cdns_dsi;
  * @deinit: Called in the CDNS DSI remove
  * @enable: Called at the beginning of CDNS DSI bridge enable
  * @disable: Called at the end of CDNS DSI bridge disable
+ * @resume: Called at the resume of CDNS DSI
+ * @suspend: Called at the suspend of CDNS DSI
+ * @update: Called at the middle of CDNS DSI bridge enable
  */
 struct cdns_dsi_platform_ops {
 	int (*init)(struct cdns_dsi *dsi);
 	void (*deinit)(struct cdns_dsi *dsi);
 	void (*enable)(struct cdns_dsi *dsi);
 	void (*disable)(struct cdns_dsi *dsi);
+	void (*resume)(struct cdns_dsi *dsi);
+	void (*suspend)(struct cdns_dsi *dsi);
+	int (*update)(struct cdns_dsi *dsi, struct cdns_dsi_cfg *dsi_cfg,
+		      struct phy_configure_opts_mipi_dphy *phy_cfg,
+		      unsigned long dpi_hz, unsigned long dpi_htotal,
+		      unsigned long dsi_htotal);
+	void (*transfer)(struct cdns_dsi *dsi);
 };
 
 struct cdns_dsi {
@@ -79,6 +89,17 @@ struct cdns_dsi {
 	bool link_initialized;
 	bool phy_initialized;
 	struct phy *dphy;
+
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+	struct clk *apb_clk;
+	struct clk *txesc_clk;
+	struct reset_control *dpi_rst;
+	struct reset_control *apb_rst;
+	struct reset_control *txesc_rst;
+	struct reset_control *txbytehs_rst;
+#endif
 };
 
+void cdns_dsi_hs_init(struct cdns_dsi *dsi);
+
 #endif /* !__CDNS_DSI_H__ */
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
new file mode 100644
index 000000000000..654d083f49e1
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * JH7110 SoC Cadence DSI wrapper
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "cdns-dsi-jh7110.h"
+
+static int cdns_dsi_clock_enable(struct cdns_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	ret = clk_prepare_enable(dsi->apb_clk);
+	if (ret) {
+		dev_err(dev, "Failed to prepare/enable apb_clk\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(dsi->txesc_clk);
+	if (ret) {
+		dev_err(dev, "Failed to prepare/enable txesc_clk\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static void cdns_dsi_clock_disable(struct cdns_dsi *dsi)
+{
+	clk_disable_unprepare(dsi->apb_clk);
+	clk_disable_unprepare(dsi->txesc_clk);
+}
+
+static int cdns_dsi_resets_deassert(struct cdns_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	ret = reset_control_deassert(dsi->apb_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert apb_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_deassert(dsi->txesc_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert txesc_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_deassert(dsi->dpi_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert dpi_rst\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int cdns_dsi_resets_assert(struct cdns_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	ret = reset_control_assert(dsi->apb_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to assert apb_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_assert(dsi->txesc_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to assert txesc_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_assert(dsi->dpi_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to assert dpi_rst\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int cdns_dsi_get_clock(struct device *dev, struct cdns_dsi *dsi)
+{
+	dsi->apb_clk = devm_clk_get(dev, "apb");
+	if (IS_ERR(dsi->apb_clk))
+		return PTR_ERR(dsi->apb_clk);
+
+	dsi->txesc_clk = devm_clk_get(dev, "txesc");
+	if (IS_ERR(dsi->txesc_clk))
+		return PTR_ERR(dsi->txesc_clk);
+
+	return 0;
+}
+
+static int cdns_dsi_get_reset(struct device *dev, struct cdns_dsi *dsi)
+{
+	dsi->dpi_rst = devm_reset_control_get(dev, "dpi");
+	if (IS_ERR(dsi->dpi_rst))
+		return PTR_ERR(dsi->dpi_rst);
+
+	dsi->apb_rst = devm_reset_control_get(dev, "apb");
+	if (IS_ERR(dsi->apb_rst))
+		return PTR_ERR(dsi->apb_rst);
+
+	dsi->txesc_rst = devm_reset_control_get(dev, "txesc");
+	if (IS_ERR(dsi->txesc_rst))
+		return PTR_ERR(dsi->txesc_rst);
+
+	dsi->txbytehs_rst = devm_reset_control_get(dev, "txbytehs");
+	if (IS_ERR(dsi->txbytehs_rst))
+		return PTR_ERR(dsi->txbytehs_rst);
+
+	return 0;
+}
+
+static int cdns_dsi_jh7110_init(struct cdns_dsi *dsi)
+{
+	int ret;
+
+	ret = cdns_dsi_get_clock(dsi->base.dev, dsi);
+	if (ret)
+		return ret;
+
+	return cdns_dsi_get_reset(dsi->base.dev, dsi);
+}
+
+static void cdns_dsi_jh7110_resume(struct cdns_dsi *dsi)
+{
+	int ret;
+
+	ret = cdns_dsi_clock_enable(dsi, dsi->base.dev);
+	if (ret) {
+		dev_err(dsi->base.dev, "failed to enable clock\n");
+		return;
+	}
+	ret = cdns_dsi_resets_deassert(dsi, dsi->base.dev);
+	if (ret < 0) {
+		dev_err(dsi->base.dev, "failed to deassert reset\n");
+		return;
+	}
+}
+
+static void cdns_dsi_jh7110_suspend(struct cdns_dsi *dsi)
+{
+	int ret;
+
+	ret = cdns_dsi_resets_assert(dsi, dsi->base.dev);
+	if (ret < 0) {
+		dev_err(dsi->base.dev, "failed to deassert reset\n");
+		return;
+	}
+
+	cdns_dsi_clock_disable(dsi);
+}
+
+static int cdns_dsi_jh7110_update(struct cdns_dsi *dsi, struct cdns_dsi_cfg *dsi_cfg,
+				  struct phy_configure_opts_mipi_dphy *phy_cfg,
+				  unsigned long dpi_hz, unsigned long dpi_htotal,
+				  unsigned long dsi_htotal)
+{
+	unsigned long long dlane_bps;
+	unsigned long adj_dsi_htotal;
+	unsigned int lanes = dsi->output.dev->lanes;
+
+	phy_cfg->hs_clk_rate = phy_cfg->hs_clk_rate - (phy_cfg->hs_clk_rate % 10000000);
+	phy_cfg->hs_clk_rate = phy_cfg->hs_clk_rate + 40000000;
+	dlane_bps = phy_cfg->hs_clk_rate * lanes * dpi_htotal / 8;
+	adj_dsi_htotal = dlane_bps / dpi_hz;
+
+	return adj_dsi_htotal;
+}
+
+static void jh7110_cdns_dsi_hs_init(struct cdns_dsi *dsi)
+{
+	cdns_dsi_hs_init(dsi);
+	reset_control_deassert(dsi->txbytehs_rst);
+}
+
+const struct cdns_dsi_platform_ops dsi_ti_jh7110_ops = {
+	.init = cdns_dsi_jh7110_init,
+	.resume = cdns_dsi_jh7110_resume,
+	.suspend = cdns_dsi_jh7110_suspend,
+	.update = cdns_dsi_jh7110_update,
+	.transfer = jh7110_cdns_dsi_hs_init,
+};
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h
new file mode 100644
index 000000000000..15d6a766b502
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * JH7110 Cadence DSI
+ *
+ * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
+ * Author: keith.zhao <keith.zhao@starfivetech.com>
+ */
+
+#ifndef __CDNS_DSI_JH7110_H__
+#define __CDNS_DSI_JH7110_H__
+
+#include "cdns-dsi-core.h"
+
+extern const struct cdns_dsi_platform_ops dsi_ti_jh7110_ops;
+
+#endif /* !__CDNS_DSI_JH7110_H__ */
-- 
2.17.1

