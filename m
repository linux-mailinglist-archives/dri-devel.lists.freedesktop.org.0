Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF97755B54
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E9E10E1D4;
	Mon, 17 Jul 2023 06:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2883210E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:14:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCmDeiXjwsXcFCGvP2w0ycitz7UrTeXDsU0xsHNinPqGTHLbPf+dMlL6qofGRhQIXwcJ3pYGQZnKfm0/wN6vO8HU5HoeBzO3uVgFLgea1V0cXiWQq3CvKO3RAe6tK8l+DHnRBOj8T566piMPESlF9peAwtb8DYnniCUmOdzfL/6ecI7rCdt7zSZ+8zWT2bnBKUqwfnRGdo6QItG7iZVAsC7IzI5ZfXXQ14mH7TEj76QyH5QR0Lv1ec6rapHmYOmHOD0hkYmtDFSiBFAFcCfSw8XOSEbJk+VFqGgkoDIlHS1UO+PZRKZwOYjJjgRHD4YqI7fPIYCCCcRk4OQ2mrdl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XxWByUmFftfO+2gtI9xfeJi0UP591S33JvTXJWqgMI=;
 b=XvWiWDsNkvtybCWoIIzwV3t3pskZSaYMBQjtKWzEXQjkN7KvSOGcpHfV1dIIYQID19vF6S4JfZgFmC8v/pmUKwRIO6zH7DGyIQFT3k7e0+sTdrHIw+I6UH5EkyiCSfK/K9ladp8dfmBTBtcVS0SBctnfRpJJzGsqLw0qk6MwaG44uhIUSDEULPomBOp0MAT4AipeRqbCrzBSFE0vOI3UBVmYt0Q2r5J8MKbA+FEBd6qA4EjHKFOYIhFdeY+QhNUsUrKTW04VqewLAuldd/hnwuSDjMvwHKfd/wvs24gf5y54d1gjuDA0Qge8LCPPTZHkp5zQkdNvuuGaCHgPcG65HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XxWByUmFftfO+2gtI9xfeJi0UP591S33JvTXJWqgMI=;
 b=OlzAMvNykzZfvaME2DRFm6Bsi09LaaJ50qYI6VI1N+YT+ZYQH8RBshhRjCrerPVmPpTf0HXhtLtglMV5xeBStVFJ8tTzElcsddAmbrtkmVe7HDIo+JDf8dKk8aRXQvlf5Tm1G/2rBdNO38EPcfIbdSVjadLVI1MAa/Y4fkheKMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:14:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:14:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Date: Mon, 17 Jul 2023 14:18:31 +0800
Message-Id: <20230717061831.1826878-10-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230717061831.1826878-1-victor.liu@nxp.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc11c6f-81a8-4375-f7a6-08db868d1891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sSXZW0Zlg/QC14hOTzVQ/lTXNM4ZCKLewin53ugRBfzdDjz3LsuIH/roGpVHD+zS2gWCb8fJ+eEFNuLRtI+sxcZAuZBgOuCD24ji+8A3ZTa03bjjZ0pOT3lWYer9MlupUA105yFebHaD99kAZznhf/mj5E1AI2cMtBqKbgyuh6a8wCyzWf5LOOHUmdgi0Qwmm/TDyw16LXboS3EaXI7NGNH0gDnFoIQjxBhsUwzQeq+SvjdahrLtPEYyLianBkudNfAVl8uHhvRDD0CNbHabtgrmaf612Ein45Nda3xajchz9WiMWepApOIjVOiPNXWT7Z78jpPYp9YZmyfAiP96ONbdJiQJudzGDuFuXO1gABGDcEYwN7eA/eoZStEerCWfL5QLjBxjJ/qzm/e2KfJsscnoyBlDC/cGWD7+VIrjlpEHtH/YrPJZps7qi8OkSCIw0RWizNB1zvYC1lFqPRDCGtOElCYUIKZCyeemLD63/xzKHV353yuxWjWhkQaHzSYxsd1pgAHFyLjKMODPMgz9stMzko9PdkfUeIaHJ9Qd1jufyuMo7veciGVR8SZY4NudWWbGGSsmDPZpkmd18qIgJYgJHgssumNj0LrUftU/SSdpMP/Ir5ZR/xHZzsv5BzhH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(6666004)(186003)(1076003)(6506007)(26005)(6512007)(2906002)(30864003)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E0vYyiYUBXORDouLrB5T/am8IYkLLFhgcSEcAQQ1BS8a4gmHIRysWyiGKyBA?=
 =?us-ascii?Q?LDsp21QrFL0V/W5w0H4x0zAhHFOeaezwZKU4lN0C37DiniFZuX8Csybk6Qti?=
 =?us-ascii?Q?WG4ycONqdg1QVkl3MTkMwAtRMkUHloDl0D5CzlTwAdPq5SVAMobYAxain/ID?=
 =?us-ascii?Q?Q1HhsBVgoe1Tp8JnT2XbE+ZkMVxM7pmqUEie8zrKqlw/XdifCnsBwppMAOlQ?=
 =?us-ascii?Q?RdZgrPUNeyOAjGoRNlo/4q8pAPrWjEM7T6EQM+lHtGSZy96NGDGGa7BvJVcd?=
 =?us-ascii?Q?6E52Ocd5t+bNhLdH7DzoENFySVyxhyKxaW7pd0enndPzC/HnJSv4ERpqi5YL?=
 =?us-ascii?Q?VQHPmiYwB2SkyDsZWzHafRVRdn6EfaL7sg9EqTShtnEYa1EKeKj7ANFw2d2s?=
 =?us-ascii?Q?Awch/TC6V+NHejQpP/lFBrZX3fQjLNnCJaZRO8xurqPw4SUQ6GlTWz2aHjsW?=
 =?us-ascii?Q?I7O9AFuvQmZtatQW7t4ecNevK1cRoS3Dx0QiTV0MF0NUAG+9I6tEUuq5JUyU?=
 =?us-ascii?Q?Cix5fuLN56R3YQ/woXQotCXW4Fn0ObatShLApZuEXybGaFZucVOM1wJ4fHUL?=
 =?us-ascii?Q?AQcx1gnFx8lgyicKvonTQEHkh5Fph6u/RPRjL/KyulsChliy/Pb+3OyS3DbR?=
 =?us-ascii?Q?dN3dlAO5mc08Ngr2VFEPQGQ34NiW2PGI54v+6VHeOaXdORQ7YVHorgpoPtbQ?=
 =?us-ascii?Q?xCK6/2J0Mv0dXJepvO/POm9fCrcp45rTutkp0ue9ETORUE1LYmOmuVIej6C+?=
 =?us-ascii?Q?RCYuHK7JcajEQ6K9LBDUfaLpSeSyaj1bXpcn/H9kKJVKVFbvInBR+qekc3wt?=
 =?us-ascii?Q?3og2aH1Y80m1NNuQRK2VK2keKQeOQMWtfN+/SWJYZdDLL1S3eN5/Uium+zzl?=
 =?us-ascii?Q?CGqClT70n7UhUiirW4eUmj1ZwSh4eBTku4rNrAOltBDCKlYxir7hphezasq6?=
 =?us-ascii?Q?2PIQH+ZkJBw/Sy583NDCinRegNvSH5ovJNwgOc6QJq1xNLClEMMon63QA46s?=
 =?us-ascii?Q?oSoROvmhY/N7hlpF0jYOZcd4luUt9QTQjzB1rcggy9t1rn27QiDFRXLvZfW9?=
 =?us-ascii?Q?X8iX0XKj0udcsUwYoZMKoY8fs3mjWqNfsOcUILEjq0gVUNbTacWkBDzNAILv?=
 =?us-ascii?Q?8c020Rn068RZ9Mg0s/7+iYQXyOob8rIVD3CRcMg96LNYG6Jly3vlc9LceVHB?=
 =?us-ascii?Q?EQMnu12zadgul7Km0aRK5JQO0HnpivXFtJTOWYlCzrtbQkqgHzYxibETaRBd?=
 =?us-ascii?Q?UJf0YaA6Z2KIaaJszWCiEulRxfT2EcHcZqnxL+kuzm2XdUyYA3IeMzO1GCPU?=
 =?us-ascii?Q?ZtN5nVHSeyzE/NKtbsKCsDJLcu2LwaQabtoW//Om9sS3erkhwkUR+BjTXllS?=
 =?us-ascii?Q?1+b6ZuX7jDuCDdBYlBF91Vscxh6B6JEG1p+nuJD8hGRe7GBtLrSdYYFXYhI+?=
 =?us-ascii?Q?lN4TneETIeGdhlVeMlM5Mg24UPcq7LMEuKgHpv+E++k4a7Zl3h6FJGRkfeP3?=
 =?us-ascii?Q?gDz1KOP+LPH/EvjQR9k9GY7hSYYA4i2WL4XoEmC3ssY3QyjpPzI97e2siLhV?=
 =?us-ascii?Q?A/AvKYy+XMs21pUGzDbyrgEZILFShlbqVc4hPKsi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc11c6f-81a8-4375-f7a6-08db868d1891
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:14:36.7829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaX0E3mNd3WQdkt6De3XBG3GMFPHPE5eJxREjeeCiojqwFRB6DCAvNphoEZKaU7ETRrSpvblUlZL3u0BeWxOPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
controller and a Synopsys Designware MIPI DPHY.  Some configurations
and extensions to them are controlled by i.MX93 media blk-ctrl.

Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
bridge helpers and implementing i.MX93 MIPI DSI specific extensions.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/Kconfig          |  10 +
 drivers/gpu/drm/bridge/imx/Makefile         |   1 +
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 934 ++++++++++++++++++++
 3 files changed, 945 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9fae28db6aa7..5182298c7182 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -49,4 +49,14 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
 	  Choose this to enable pixel link to display pixel interface(PXL2DPI)
 	  found in Freescale i.MX8qxp processor.
 
+config DRM_IMX93_MIPI_DSI
+	tristate "Freescale i.MX93 specific extensions for Synopsys DW MIPI DSI"
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_DW_MIPI_DSI
+	select GENERIC_PHY_MIPI_DPHY
+	help
+	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
+	  processor.
+
 endif # ARCH_MXC || COMPILE_TEST
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 8e2ebf3399a1..2b0c2e44aa1b 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
+obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
new file mode 100644
index 000000000000..77f59e3407a0
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -0,0 +1,934 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2022,2023 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/math.h>
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/bridge/dw_mipi_dsi.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_print.h>
+
+/* DPHY PLL configuration registers */
+#define DSI_REG				0x4c
+#define  CFGCLKFREQRANGE_MASK		GENMASK(5, 0)
+#define  CFGCLKFREQRANGE(x)		FIELD_PREP(CFGCLKFREQRANGE_MASK, (x))
+#define  CLKSEL_MASK			GENMASK(7, 6)
+#define  CLKSEL_STOP			FIELD_PREP(CLKSEL_MASK, 0)
+#define  CLKSEL_GEN			FIELD_PREP(CLKSEL_MASK, 1)
+#define  CLKSEL_EXT			FIELD_PREP(CLKSEL_MASK, 2)
+#define  HSFREQRANGE_MASK		GENMASK(14, 8)
+#define  HSFREQRANGE(x)			FIELD_PREP(HSFREQRANGE_MASK, (x))
+#define  UPDATE_PLL			BIT(17)
+#define  SHADOW_CLR			BIT(18)
+#define  CLK_EXT			BIT(19)
+
+#define DSI_WRITE_REG0			0x50
+#define  M_MASK				GENMASK(9, 0)
+#define  M(x)				FIELD_PREP(M_MASK, ((x) - 2))
+#define  N_MASK				GENMASK(13, 10)
+#define  N(x)				FIELD_PREP(N_MASK, ((x) - 1))
+#define  VCO_CTRL_MASK			GENMASK(19, 14)
+#define  VCO_CTRL(x)			FIELD_PREP(VCO_CTRL_MASK, (x))
+#define  PROP_CTRL_MASK			GENMASK(25, 20)
+#define  PROP_CTRL(x)			FIELD_PREP(PROP_CTRL_MASK, (x))
+#define  INT_CTRL_MASK			GENMASK(31, 26)
+#define  INT_CTRL(x)			FIELD_PREP(INT_CTRL_MASK, (x))
+
+#define DSI_WRITE_REG1			0x54
+#define  GMP_CTRL_MASK			GENMASK(1, 0)
+#define  GMP_CTRL(x)			FIELD_PREP(GMP_CTRL_MASK, (x))
+#define  CPBIAS_CTRL_MASK		GENMASK(8, 2)
+#define  CPBIAS_CTRL(x)			FIELD_PREP(CPBIAS_CTRL_MASK, (x))
+#define  PLL_SHADOW_CTRL		BIT(9)
+
+/* display mux control register */
+#define DISPLAY_MUX			0x60
+#define  MIPI_DSI_RGB666_MAP_CFG	GENMASK(7, 6)
+#define  RGB666_CONFIG1			FIELD_PREP(MIPI_DSI_RGB666_MAP_CFG, 0)
+#define  RGB666_CONFIG2			FIELD_PREP(MIPI_DSI_RGB666_MAP_CFG, 1)
+#define  MIPI_DSI_RGB565_MAP_CFG	GENMASK(5, 4)
+#define  RGB565_CONFIG1			FIELD_PREP(MIPI_DSI_RGB565_MAP_CFG, 0)
+#define  RGB565_CONFIG2			FIELD_PREP(MIPI_DSI_RGB565_MAP_CFG, 1)
+#define  RGB565_CONFIG3			FIELD_PREP(MIPI_DSI_RGB565_MAP_CFG, 2)
+#define  LCDIF_CROSS_LINE_PATTERN	GENMASK(3, 0)
+#define  RGB888_TO_RGB888		FIELD_PREP(LCDIF_CROSS_LINE_PATTERN, 0)
+#define  RGB888_TO_RGB666		FIELD_PREP(LCDIF_CROSS_LINE_PATTERN, 6)
+#define  RGB565_TO_RGB565		FIELD_PREP(LCDIF_CROSS_LINE_PATTERN, 7)
+
+#define MHZ(x)				((x) * 1000000UL)
+
+#define REF_CLK_RATE_MAX		MHZ(64)
+#define REF_CLK_RATE_MIN		MHZ(2)
+#define FOUT_MAX			MHZ(1250)
+#define FOUT_MIN			MHZ(40)
+#define FVCO_DIV_FACTOR			MHZ(80)
+
+#define MBPS(x)				((x) * 1000000UL)
+
+#define DATA_RATE_MAX_SPEED		MBPS(2500)
+#define DATA_RATE_MIN_SPEED		MBPS(80)
+
+#define M_MAX				625UL
+#define M_MIN				64UL
+
+#define N_MAX				16U
+#define N_MIN				1U
+
+struct imx93_dsi {
+	struct device *dev;
+	struct regmap *regmap;
+	struct clk *clk_pixel;
+	struct clk *clk_ref;
+	struct clk *clk_cfg;
+	struct dw_mipi_dsi *dmd;
+	struct dw_mipi_dsi_plat_data pdata;
+	union phy_configure_opts phy_cfg;
+	unsigned long ref_clk_rate;
+	u32 format;
+};
+
+struct dphy_pll_cfg {
+	u32 m;	/* PLL Feedback Multiplication Ratio */
+	u32 n;	/* PLL Input Frequency Division Ratio */
+};
+
+struct dphy_pll_vco_prop {
+	unsigned long max_fout;
+	u8 vco_cntl;
+	u8 prop_cntl;
+};
+
+struct dphy_pll_hsfreqrange {
+	unsigned long max_mbps;
+	u8 hsfreqrange;
+};
+
+/* DPHY Databook Table 3-13 Charge-pump Programmability */
+static const struct dphy_pll_vco_prop vco_prop_map[] = {
+	{   55, 0x3f, 0x0d },
+	{   82, 0x37, 0x0d },
+	{  110, 0x2f, 0x0d },
+	{  165, 0x27, 0x0d },
+	{  220, 0x1f, 0x0d },
+	{  330, 0x17, 0x0d },
+	{  440, 0x0f, 0x0d },
+	{  660, 0x07, 0x0d },
+	{ 1149, 0x03, 0x0d },
+	{ 1152, 0x01, 0x0d },
+	{ 1250, 0x01, 0x0e },
+};
+
+/* DPHY Databook Table 5-7 Frequency Ranges and Defaults */
+static const struct dphy_pll_hsfreqrange hsfreqrange_map[] = {
+	{   89, 0x00 },
+	{   99, 0x10 },
+	{  109, 0x20 },
+	{  119, 0x30 },
+	{  129, 0x01 },
+	{  139, 0x11 },
+	{  149, 0x21 },
+	{  159, 0x31 },
+	{  169, 0x02 },
+	{  179, 0x12 },
+	{  189, 0x22 },
+	{  204, 0x32 },
+	{  219, 0x03 },
+	{  234, 0x13 },
+	{  249, 0x23 },
+	{  274, 0x33 },
+	{  299, 0x04 },
+	{  324, 0x14 },
+	{  349, 0x25 },
+	{  399, 0x35 },
+	{  449, 0x05 },
+	{  499, 0x16 },
+	{  549, 0x26 },
+	{  599, 0x37 },
+	{  649, 0x07 },
+	{  699, 0x18 },
+	{  749, 0x28 },
+	{  799, 0x39 },
+	{  849, 0x09 },
+	{  899, 0x19 },
+	{  949, 0x29 },
+	{  999, 0x3a },
+	{ 1049, 0x0a },
+	{ 1099, 0x1a },
+	{ 1149, 0x2a },
+	{ 1199, 0x3b },
+	{ 1249, 0x0b },
+	{ 1299, 0x1b },
+	{ 1349, 0x2b },
+	{ 1399, 0x3c },
+	{ 1449, 0x0c },
+	{ 1499, 0x1c },
+	{ 1549, 0x2c },
+	{ 1599, 0x3d },
+	{ 1649, 0x0d },
+	{ 1699, 0x1d },
+	{ 1749, 0x2e },
+	{ 1799, 0x3e },
+	{ 1849, 0x0e },
+	{ 1899, 0x1e },
+	{ 1949, 0x2f },
+	{ 1999, 0x3f },
+	{ 2049, 0x0f },
+	{ 2099, 0x40 },
+	{ 2149, 0x41 },
+	{ 2199, 0x42 },
+	{ 2249, 0x43 },
+	{ 2299, 0x44 },
+	{ 2349, 0x45 },
+	{ 2399, 0x46 },
+	{ 2449, 0x47 },
+	{ 2499, 0x48 },
+	{ 2500, 0x49 },
+};
+
+static void dphy_pll_write(struct imx93_dsi *dsi, unsigned int reg, u32 value)
+{
+	int ret;
+
+	ret = regmap_write(dsi->regmap, reg, value);
+	if (ret < 0)
+		DRM_DEV_ERROR(dsi->dev,
+			      "failed to write 0x%08x to pll reg 0x%x: %d\n",
+			      value, reg, ret);
+}
+
+static inline unsigned long data_rate_to_fout(unsigned long data_rate)
+{
+	/* Fout is half of data rate */
+	return data_rate / 2;
+}
+
+static int
+dphy_pll_get_configure_from_opts(struct imx93_dsi *dsi,
+				 struct phy_configure_opts_mipi_dphy *dphy_opts,
+				 struct dphy_pll_cfg *cfg)
+{
+	struct device *dev = dsi->dev;
+	unsigned long fin = dsi->ref_clk_rate;
+	unsigned long fout;
+	unsigned long best_fout = 0;
+	unsigned int fvco_div;
+	unsigned int min_n, max_n, n, best_n;
+	unsigned long m, best_m;
+	unsigned long min_delta = ULONG_MAX;
+	unsigned long tmp, delta;
+
+	if (dphy_opts->hs_clk_rate < DATA_RATE_MIN_SPEED ||
+	    dphy_opts->hs_clk_rate > DATA_RATE_MAX_SPEED) {
+		DRM_DEV_DEBUG_DRIVER(dev, "invalid data rate per lane: %lu\n",
+				     dphy_opts->hs_clk_rate);
+		return -EINVAL;
+	}
+
+	fout = data_rate_to_fout(dphy_opts->hs_clk_rate);
+
+	/* DPHY Databook 3.3.6.1 Output Frequency */
+	/* Fout = Fvco / Fvco_div = (Fin * M) / (Fvco_div * N) */
+	/* Fvco_div could be 1/2/4/8 according to Fout range. */
+	fvco_div = 8UL / min(DIV_ROUND_UP(fout, FVCO_DIV_FACTOR), 8UL);
+
+	/* limitation: 2MHz <= Fin / N <= 8MHz */
+	min_n = DIV_ROUND_UP_ULL((u64)fin, MHZ(8));
+	max_n = DIV_ROUND_DOWN_ULL((u64)fin, MHZ(2));
+
+	/* clamp possible N(s) */
+	min_n = clamp(min_n, N_MIN, N_MAX);
+	max_n = clamp(max_n, N_MIN, N_MAX);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "Fout = %lu, Fvco_div = %u, n_range = [%u, %u]\n",
+			     fout, fvco_div, min_n, max_n);
+
+	for (n = min_n; n <= max_n; n++) {
+		/* M = (Fout * N * Fvco_div) / Fin */
+		tmp = fout * n * fvco_div;
+		m = DIV_ROUND_CLOSEST(tmp, fin);
+
+		/* check M range */
+		if (m < M_MIN || m > M_MAX)
+			continue;
+
+		/* calculate temporary Fout */
+		tmp = m * fin;
+		do_div(tmp, n * fvco_div);
+		if (tmp < FOUT_MIN || tmp > FOUT_MAX)
+			continue;
+
+		delta = abs(fout - tmp);
+		if (delta < min_delta) {
+			best_n = n;
+			best_m = m;
+			min_delta = delta;
+			best_fout = tmp;
+		}
+	}
+
+	if (best_fout) {
+		cfg->m = best_m;
+		cfg->n = best_n;
+		DRM_DEV_DEBUG_DRIVER(dev, "best Fout = %lu, m = %u, n = %u\n",
+				     best_fout, cfg->m, cfg->n);
+	} else {
+		DRM_DEV_DEBUG_DRIVER(dev, "failed to find best Fout\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void dphy_pll_clear_shadow(struct imx93_dsi *dsi)
+{
+	/* Reference DPHY Databook Figure 3-3 Initialization Timing Diagram. */
+	/* Select clock generation first. */
+	dphy_pll_write(dsi, DSI_REG, CLKSEL_GEN);
+
+	/* Clear shadow after clock selection is done a while. */
+	fsleep(1);
+	dphy_pll_write(dsi, DSI_REG, CLKSEL_GEN | SHADOW_CLR);
+
+	/* A minimum pulse of 5ns on shadow_clear signal. */
+	fsleep(1);
+	dphy_pll_write(dsi, DSI_REG, CLKSEL_GEN);
+}
+
+static unsigned long dphy_pll_get_cfgclkrange(struct imx93_dsi *dsi)
+{
+	/*
+	 * DPHY Databook Table 4-4 System Control Signals mentions an equation
+	 * for cfgclkfreqrange[5:0].
+	 */
+	return (clk_get_rate(dsi->clk_cfg) / MHZ(1) - 17) * 4;
+}
+
+static u8
+dphy_pll_get_hsfreqrange(struct phy_configure_opts_mipi_dphy *dphy_opts)
+{
+	unsigned long mbps = dphy_opts->hs_clk_rate / MHZ(1);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(hsfreqrange_map); i++)
+		if (mbps <= hsfreqrange_map[i].max_mbps)
+			return hsfreqrange_map[i].hsfreqrange;
+
+	return 0;
+}
+
+static u8 dphy_pll_get_vco(struct phy_configure_opts_mipi_dphy *dphy_opts)
+{
+	unsigned long fout = data_rate_to_fout(dphy_opts->hs_clk_rate) / MHZ(1);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vco_prop_map); i++)
+		if (fout <= vco_prop_map[i].max_fout)
+			return vco_prop_map[i].vco_cntl;
+
+	return 0;
+}
+
+static u8 dphy_pll_get_prop(struct phy_configure_opts_mipi_dphy *dphy_opts)
+{
+	unsigned long fout = data_rate_to_fout(dphy_opts->hs_clk_rate) / MHZ(1);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vco_prop_map); i++)
+		if (fout <= vco_prop_map[i].max_fout)
+			return vco_prop_map[i].prop_cntl;
+
+	return 0;
+}
+
+static int dphy_pll_update(struct imx93_dsi *dsi)
+{
+	int ret;
+
+	ret = regmap_update_bits(dsi->regmap, DSI_REG, UPDATE_PLL, UPDATE_PLL);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dsi->dev, "failed to set UPDATE_PLL: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * The updatepll signal should be asserted for a minimum of four clkin
+	 * cycles, according to DPHY Databook Figure 3-3 Initialization Timing
+	 * Diagram.
+	 */
+	fsleep(10);
+
+	ret = regmap_update_bits(dsi->regmap, DSI_REG, UPDATE_PLL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dsi->dev, "failed to clear UPDATE_PLL: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dphy_pll_configure(struct imx93_dsi *dsi, union phy_configure_opts *opts)
+{
+	struct dphy_pll_cfg cfg = { 0 };
+	u32 val;
+	int ret;
+
+	ret = dphy_pll_get_configure_from_opts(dsi, &opts->mipi_dphy, &cfg);
+	if (ret) {
+		DRM_DEV_ERROR(dsi->dev, "failed to get phy pll cfg %d\n", ret);
+		return ret;
+	}
+
+	dphy_pll_clear_shadow(dsi);
+
+	/* DSI_REG */
+	val = CLKSEL_GEN |
+	      CFGCLKFREQRANGE(dphy_pll_get_cfgclkrange(dsi)) |
+	      HSFREQRANGE(dphy_pll_get_hsfreqrange(&opts->mipi_dphy));
+	dphy_pll_write(dsi, DSI_REG, val);
+
+	/* DSI_WRITE_REG0 */
+	val = M(cfg.m) | N(cfg.n) | INT_CTRL(0) |
+	      VCO_CTRL(dphy_pll_get_vco(&opts->mipi_dphy)) |
+	      PROP_CTRL(dphy_pll_get_prop(&opts->mipi_dphy));
+	dphy_pll_write(dsi, DSI_WRITE_REG0, val);
+
+	/* DSI_WRITE_REG1 */
+	dphy_pll_write(dsi, DSI_WRITE_REG1, GMP_CTRL(1) | CPBIAS_CTRL(0x10));
+
+	ret = clk_prepare_enable(dsi->clk_ref);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dsi->dev, "failed to enable ref clock: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * At least 10 refclk cycles are required before updatePLL assertion,
+	 * according to DPHY Databook Figure 3-3 Initialization Timing Diagram.
+	 */
+	fsleep(10);
+
+	ret = dphy_pll_update(dsi);
+	if (ret < 0) {
+		clk_disable_unprepare(dsi->clk_ref);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void dphy_pll_clear_reg(struct imx93_dsi *dsi)
+{
+	dphy_pll_write(dsi, DSI_REG, 0);
+	dphy_pll_write(dsi, DSI_WRITE_REG0, 0);
+	dphy_pll_write(dsi, DSI_WRITE_REG1, 0);
+}
+
+static int dphy_pll_init(struct imx93_dsi *dsi)
+{
+	int ret;
+
+	ret = clk_prepare_enable(dsi->clk_cfg);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dsi->dev, "failed to enable config clock: %d\n", ret);
+		return ret;
+	}
+
+	dphy_pll_clear_reg(dsi);
+
+	return 0;
+}
+
+static void dphy_pll_uninit(struct imx93_dsi *dsi)
+{
+	dphy_pll_clear_reg(dsi);
+	clk_disable_unprepare(dsi->clk_cfg);
+}
+
+static void dphy_pll_power_off(struct imx93_dsi *dsi)
+{
+	dphy_pll_clear_reg(dsi);
+	clk_disable_unprepare(dsi->clk_ref);
+}
+
+static int imx93_dsi_get_phy_configure_opts(struct imx93_dsi *dsi,
+					    const struct drm_display_mode *mode,
+					    union phy_configure_opts *phy_cfg,
+					    u32 lanes, u32 format)
+{
+	struct device *dev = dsi->dev;
+	int bpp;
+	int ret;
+
+	bpp = mipi_dsi_pixel_format_to_bpp(format);
+	if (bpp < 0) {
+		DRM_DEV_DEBUG_DRIVER(dev, "failed to get bpp for pixel format %d\n",
+				     format);
+		return -EINVAL;
+	}
+
+	ret = phy_mipi_dphy_get_default_config(mode->clock * MSEC_PER_SEC, bpp,
+					       lanes, &phy_cfg->mipi_dphy);
+	if (ret < 0) {
+		DRM_DEV_DEBUG_DRIVER(dev, "failed to get default phy cfg %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static enum drm_mode_status
+imx93_dsi_validate_mode(struct imx93_dsi *dsi, const struct drm_display_mode *mode)
+{
+	struct drm_bridge *bridge = dw_mipi_dsi_get_bridge(dsi->dmd);
+
+	/* Get the last bridge */
+	while (drm_bridge_get_next_bridge(bridge))
+		bridge = drm_bridge_get_next_bridge(bridge);
+
+	if ((bridge->ops & DRM_BRIDGE_OP_DETECT) &&
+	    (bridge->ops & DRM_BRIDGE_OP_EDID)) {
+		unsigned long pixel_clock_rate = mode->clock * 1000;
+		unsigned long rounded_rate;
+
+		/* Allow +/-0.5% pixel clock rate deviation */
+		rounded_rate = clk_round_rate(dsi->clk_pixel, pixel_clock_rate);
+		if (rounded_rate < pixel_clock_rate * 995 / 1000 ||
+		    rounded_rate > pixel_clock_rate * 1005 / 1000) {
+			DRM_DEV_DEBUG_DRIVER(dsi->dev,
+					     "failed to round clock for mode " DRM_MODE_FMT "\n",
+					     DRM_MODE_ARG(mode));
+			return MODE_NOCLOCK;
+		}
+	}
+
+	return MODE_OK;
+}
+
+static enum drm_mode_status
+imx93_dsi_validate_phy(struct imx93_dsi *dsi, const struct drm_display_mode *mode,
+		       unsigned long mode_flags, u32 lanes, u32 format)
+{
+	union phy_configure_opts phy_cfg;
+	struct dphy_pll_cfg cfg = { 0 };
+	struct device *dev = dsi->dev;
+	int ret;
+
+	ret = imx93_dsi_get_phy_configure_opts(dsi, mode, &phy_cfg, lanes,
+					       format);
+	if (ret < 0) {
+		DRM_DEV_DEBUG_DRIVER(dev, "failed to get phy cfg opts %d\n", ret);
+		return MODE_ERROR;
+	}
+
+	ret = dphy_pll_get_configure_from_opts(dsi, &phy_cfg.mipi_dphy, &cfg);
+	if (ret < 0) {
+		DRM_DEV_DEBUG_DRIVER(dev, "failed to get phy pll cfg %d\n", ret);
+		return MODE_NOCLOCK;
+	}
+
+	return MODE_OK;
+}
+
+static enum drm_mode_status
+imx93_dsi_mode_valid(void *priv_data, const struct drm_display_mode *mode,
+		     unsigned long mode_flags, u32 lanes, u32 format)
+{
+	struct imx93_dsi *dsi = priv_data;
+	struct device *dev = dsi->dev;
+	enum drm_mode_status ret;
+
+	ret = imx93_dsi_validate_mode(dsi, mode);
+	if (ret != MODE_OK) {
+		DRM_DEV_DEBUG_DRIVER(dev, "failed to validate mode " DRM_MODE_FMT "\n",
+				     DRM_MODE_ARG(mode));
+		return ret;
+	}
+
+	ret = imx93_dsi_validate_phy(dsi, mode, mode_flags, lanes, format);
+	if (ret != MODE_OK) {
+		DRM_DEV_DEBUG_DRIVER(dev,
+				     "failed to validate phy for mode " DRM_MODE_FMT "\n",
+				     DRM_MODE_ARG(mode));
+		return ret;
+	}
+
+	return MODE_OK;
+}
+
+static bool imx93_dsi_mode_fixup(void *priv_data,
+				 const struct drm_display_mode *mode,
+				 struct drm_display_mode *adjusted_mode)
+{
+	struct imx93_dsi *dsi = priv_data;
+	unsigned long pixel_clock_rate;
+	unsigned long rounded_rate;
+
+	pixel_clock_rate = mode->clock * 1000;
+	rounded_rate = clk_round_rate(dsi->clk_pixel, pixel_clock_rate);
+
+	memcpy(adjusted_mode, mode, sizeof(*mode));
+	adjusted_mode->clock = rounded_rate / 1000;
+
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "adj clock %d for mode " DRM_MODE_FMT "\n",
+			     adjusted_mode->clock, DRM_MODE_ARG(mode));
+
+	return true;
+}
+
+static u32 *imx93_dsi_get_input_bus_fmts(void *priv_data,
+					 struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state,
+					 u32 output_fmt,
+					 unsigned int *num_input_fmts)
+{
+	u32 *input_fmts, input_fmt;
+
+	*num_input_fmts = 0;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		input_fmt = output_fmt;
+		break;
+	default:
+		return NULL;
+	}
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+	input_fmts[0] = input_fmt;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
+static int imx93_dsi_phy_init(void *priv_data)
+{
+	struct imx93_dsi *dsi = priv_data;
+	unsigned int fmt = 0;
+	int ret;
+
+	switch (dsi->format) {
+	case MIPI_DSI_FMT_RGB888:
+		fmt = RGB888_TO_RGB888;
+		break;
+	case MIPI_DSI_FMT_RGB666:
+		fmt = RGB888_TO_RGB666;
+		regmap_update_bits(dsi->regmap, DISPLAY_MUX,
+				   MIPI_DSI_RGB666_MAP_CFG, RGB666_CONFIG2);
+		break;
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		fmt = RGB888_TO_RGB666;
+		regmap_update_bits(dsi->regmap, DISPLAY_MUX,
+				   MIPI_DSI_RGB666_MAP_CFG, RGB666_CONFIG1);
+		break;
+	case MIPI_DSI_FMT_RGB565:
+		fmt = RGB565_TO_RGB565;
+		regmap_update_bits(dsi->regmap, DISPLAY_MUX,
+				   MIPI_DSI_RGB565_MAP_CFG, RGB565_CONFIG1);
+		break;
+	}
+
+	regmap_update_bits(dsi->regmap, DISPLAY_MUX, LCDIF_CROSS_LINE_PATTERN, fmt);
+
+	ret = dphy_pll_init(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dsi->dev, "failed to init phy: %d\n", ret);
+		return ret;
+	}
+
+	ret = dphy_pll_configure(dsi, &dsi->phy_cfg);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dsi->dev, "failed to configure phy: %d\n", ret);
+		dphy_pll_uninit(dsi);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void imx93_dsi_phy_power_off(void *priv_data)
+{
+	struct imx93_dsi *dsi = priv_data;
+
+	dphy_pll_power_off(dsi);
+	dphy_pll_uninit(dsi);
+}
+
+static int
+imx93_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
+			unsigned long mode_flags, u32 lanes, u32 format,
+			unsigned int *lane_mbps)
+{
+	struct imx93_dsi *dsi = priv_data;
+	union phy_configure_opts phy_cfg;
+	struct device *dev = dsi->dev;
+	int ret;
+
+	ret = imx93_dsi_get_phy_configure_opts(dsi, mode, &phy_cfg, lanes,
+					       format);
+	if (ret < 0) {
+		DRM_DEV_DEBUG_DRIVER(dev, "failed to get phy cfg opts %d\n", ret);
+		return ret;
+	}
+
+	*lane_mbps = DIV_ROUND_UP(phy_cfg.mipi_dphy.hs_clk_rate, USEC_PER_SEC);
+
+	memcpy(&dsi->phy_cfg, &phy_cfg, sizeof(phy_cfg));
+
+	DRM_DEV_DEBUG_DRIVER(dev, "get lane_mbps %u for mode " DRM_MODE_FMT "\n",
+			     *lane_mbps, DRM_MODE_ARG(mode));
+
+	return 0;
+}
+
+/* High-Speed Transition Times */
+struct hstt {
+	unsigned int maxfreq;
+	struct dw_mipi_dsi_dphy_timing timing;
+};
+
+#define HSTT(_maxfreq, _c_lp2hs, _c_hs2lp, _d_lp2hs, _d_hs2lp)	\
+{								\
+	.maxfreq = (_maxfreq),					\
+	.timing = {						\
+		.clk_lp2hs = (_c_lp2hs),			\
+		.clk_hs2lp = (_c_hs2lp),			\
+		.data_lp2hs = (_d_lp2hs),			\
+		.data_hs2lp = (_d_hs2lp),			\
+	}							\
+}
+
+/* DPHY Databook Table A-4 High-Speed Transition Times */
+static const struct hstt hstt_table[] = {
+	HSTT(80,    21,  17,  15, 10),
+	HSTT(90,    23,  17,  16, 10),
+	HSTT(100,   22,  17,  16, 10),
+	HSTT(110,   25,  18,  17, 11),
+	HSTT(120,   26,  20,  18, 11),
+	HSTT(130,   27,  19,  19, 11),
+	HSTT(140,   27,  19,  19, 11),
+	HSTT(150,   28,  20,  20, 12),
+	HSTT(160,   30,  21,  22, 13),
+	HSTT(170,   30,  21,  23, 13),
+	HSTT(180,   31,  21,  23, 13),
+	HSTT(190,   32,  22,  24, 13),
+	HSTT(205,   35,  22,  25, 13),
+	HSTT(220,   37,  26,  27, 15),
+	HSTT(235,   38,  28,  27, 16),
+	HSTT(250,   41,  29,  30, 17),
+	HSTT(275,   43,  29,  32, 18),
+	HSTT(300,   45,  32,  35, 19),
+	HSTT(325,   48,  33,  36, 18),
+	HSTT(350,   51,  35,  40, 20),
+	HSTT(400,   59,  37,  44, 21),
+	HSTT(450,   65,  40,  49, 23),
+	HSTT(500,   71,  41,  54, 24),
+	HSTT(550,   77,  44,  57, 26),
+	HSTT(600,   82,  46,  64, 27),
+	HSTT(650,   87,  48,  67, 28),
+	HSTT(700,   94,  52,  71, 29),
+	HSTT(750,   99,  52,  75, 31),
+	HSTT(800,  105,  55,  82, 32),
+	HSTT(850,  110,  58,  85, 32),
+	HSTT(900,  115,  58,  88, 35),
+	HSTT(950,  120,  62,  93, 36),
+	HSTT(1000, 128,  63,  99, 38),
+	HSTT(1050, 132,  65, 102, 38),
+	HSTT(1100, 138,  67, 106, 39),
+	HSTT(1150, 146,  69, 112, 42),
+	HSTT(1200, 151,  71, 117, 43),
+	HSTT(1250, 153,  74, 120, 45),
+	HSTT(1300, 160,  73, 124, 46),
+	HSTT(1350, 165,  76, 130, 47),
+	HSTT(1400, 172,  78, 134, 49),
+	HSTT(1450, 177,  80, 138, 49),
+	HSTT(1500, 183,  81, 143, 52),
+	HSTT(1550, 191,  84, 147, 52),
+	HSTT(1600, 194,  85, 152, 52),
+	HSTT(1650, 201,  86, 155, 53),
+	HSTT(1700, 208,  88, 161, 53),
+	HSTT(1750, 212,  89, 165, 53),
+	HSTT(1800, 220,  90, 171, 54),
+	HSTT(1850, 223,  92, 175, 54),
+	HSTT(1900, 231,  91, 180, 55),
+	HSTT(1950, 236,  95, 185, 56),
+	HSTT(2000, 243,  97, 190, 56),
+	HSTT(2050, 248,  99, 194, 58),
+	HSTT(2100, 252, 100, 199, 59),
+	HSTT(2150, 259, 102, 204, 61),
+	HSTT(2200, 266, 105, 210, 62),
+	HSTT(2250, 269, 109, 213, 63),
+	HSTT(2300, 272, 109, 217, 65),
+	HSTT(2350, 281, 112, 225, 66),
+	HSTT(2400, 283, 115, 226, 66),
+	HSTT(2450, 282, 115, 226, 67),
+	HSTT(2500, 281, 118, 227, 67),
+};
+
+static int imx93_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
+				    struct dw_mipi_dsi_dphy_timing *timing)
+{
+	struct imx93_dsi *dsi = priv_data;
+	struct device *dev = dsi->dev;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(hstt_table); i++)
+		if (lane_mbps <= hstt_table[i].maxfreq)
+			break;
+
+	if (i == ARRAY_SIZE(hstt_table)) {
+		DRM_DEV_ERROR(dev, "failed to get phy timing for lane_mbps %u\n",
+			      lane_mbps);
+		return -EINVAL;
+	}
+
+	*timing = hstt_table[i].timing;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "get phy timing for %u <= %u (lane_mbps)\n",
+			     lane_mbps, hstt_table[i].maxfreq);
+
+	return 0;
+}
+
+static const struct dw_mipi_dsi_phy_ops imx93_dsi_phy_ops = {
+	.init = imx93_dsi_phy_init,
+	.power_off = imx93_dsi_phy_power_off,
+	.get_lane_mbps = imx93_dsi_get_lane_mbps,
+	.get_timing = imx93_dsi_phy_get_timing,
+};
+
+static int imx93_dsi_host_attach(void *priv_data, struct mipi_dsi_device *device)
+{
+	struct imx93_dsi *dsi = priv_data;
+
+	dsi->format = device->format;
+
+	return 0;
+}
+
+static const struct dw_mipi_dsi_host_ops imx93_dsi_host_ops = {
+	.attach = imx93_dsi_host_attach,
+};
+
+static int imx93_dsi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct imx93_dsi *dsi;
+	int ret;
+
+	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
+
+	dsi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ctrl");
+	if (IS_ERR(dsi->regmap)) {
+		ret = PTR_ERR(dsi->regmap);
+		DRM_DEV_ERROR(dev, "failed to get block ctrl regmap: %d\n", ret);
+		return ret;
+	}
+
+	dsi->clk_pixel = devm_clk_get(dev, "pix");
+	if (IS_ERR(dsi->clk_pixel)) {
+		ret = PTR_ERR(dsi->clk_pixel);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get pixel clock: %d\n", ret);
+		return ret;
+	}
+
+	dsi->clk_cfg = devm_clk_get(dev, "phy_cfg");
+	if (IS_ERR(dsi->clk_cfg)) {
+		ret = PTR_ERR(dsi->clk_cfg);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get phy cfg clock: %d\n", ret);
+		return ret;
+	}
+
+	dsi->clk_ref = devm_clk_get(dev, "phy_ref");
+	if (IS_ERR(dsi->clk_ref)) {
+		ret = PTR_ERR(dsi->clk_ref);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get phy ref clock: %d\n", ret);
+		return ret;
+	}
+
+	dsi->ref_clk_rate = clk_get_rate(dsi->clk_ref);
+	if (dsi->ref_clk_rate < REF_CLK_RATE_MIN ||
+	    dsi->ref_clk_rate > REF_CLK_RATE_MAX) {
+		DRM_DEV_ERROR(dev, "invalid phy ref clock rate %lu\n",
+			      dsi->ref_clk_rate);
+		return -EINVAL;
+	}
+	DRM_DEV_DEBUG_DRIVER(dev, "phy ref clock rate: %lu\n", dsi->ref_clk_rate);
+
+	dsi->dev = dev;
+	dsi->pdata.max_data_lanes = 4;
+	dsi->pdata.mode_valid = imx93_dsi_mode_valid;
+	dsi->pdata.mode_fixup = imx93_dsi_mode_fixup;
+	dsi->pdata.get_input_bus_fmts = imx93_dsi_get_input_bus_fmts;
+	dsi->pdata.phy_ops = &imx93_dsi_phy_ops;
+	dsi->pdata.host_ops = &imx93_dsi_host_ops;
+	dsi->pdata.priv_data = dsi;
+	platform_set_drvdata(pdev, dsi);
+
+	dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
+	if (IS_ERR(dsi->dmd)) {
+		ret = PTR_ERR(dsi->dmd);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to probe dw_mipi_dsi: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void imx93_dsi_remove(struct platform_device *pdev)
+{
+	struct imx93_dsi *dsi = platform_get_drvdata(pdev);
+
+	dw_mipi_dsi_remove(dsi->dmd);
+}
+
+static const struct of_device_id imx93_dsi_dt_ids[] = {
+	{ .compatible = "fsl,imx93-mipi-dsi", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx93_dsi_dt_ids);
+
+static struct platform_driver imx93_dsi_driver = {
+	.probe	= imx93_dsi_probe,
+	.remove_new = imx93_dsi_remove,
+	.driver	= {
+		.of_match_table = imx93_dsi_dt_ids,
+		.name = "imx93_mipi_dsi",
+	},
+};
+module_platform_driver(imx93_dsi_driver);
+
+MODULE_DESCRIPTION("Freescale i.MX93 MIPI DSI driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
-- 
2.37.1

