Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2849767F46C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 04:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE4B10E1D3;
	Sat, 28 Jan 2023 03:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870F110E1D3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 03:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuoB+qqylHE9G9KgWHadXnauM4R3BgmPzWkfCPyqodm9KLNBrsXfFSE/7N0pKlDwFEW3wf73ku1Plfuq/NuX7Z6F7TzcGgy1srn0QK1PkVgGyR8vHFWYCsla0vjTwy3flrqMY65T/02FOuvbVBHznMDXRYwn5WernN/QKLcpUZrJV9abH5bHTQjLhl6aaDFvQSe7HCHEkaslqB1WG78mSOccyiWaw1P4S7I5s8q27AEKsdjW8Fn+gIo3WH6FGmiFQ2E6Lmm2nSzb7ap9T6HKSuxIiTKAeD4DuFkCA29bllz+0o0mzyyuccOQLpwzAWlLKZiWIO1ajl8cPiITZa/8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+j8tmRGL2OR+I/QSXpdMl/m+O3C/9A+ffi0C2+j5zAY=;
 b=kc4iU8Wl5wfOK94TL9JOmD9iM63B2qQZ2or6p3tVy8LppJJER9WTfD2p/0qFymjPLuhQnya2GH9a4waI07cvcBUn4paMukAgDmWyaDyl5jeoNnCxMqYbSkboaMv514yw944FBGqo1eVjkOw3mZ8D87Z1gMoheV4/ZJgkPI7Y7KUH4PfjJPyQBbq7JpU2HkitBuWjJx0Kv2rEaL7AHKUU083sQNu/8a7dGIWY9RDeu/uTk5CJ8e5EdsqJjgY82Od4XU1Ejw4QKXYPhGnXI9B/vrnIt3VcbpcpjNtSasUGamUasmmZI5TlfhkpvxjfPRLgMfIfx/kQixnuEvPZUxbAeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j8tmRGL2OR+I/QSXpdMl/m+O3C/9A+ffi0C2+j5zAY=;
 b=HwwRmDSjF8uvyVDB+AaH9MB+Q1f/lY5//DTVpQqgYHq/ip1tUZWjyPzAwn0czROuwUIH/0yYcxw2dVne7PPQHe5eOm6TLSE2eWe6Yv/mhJcsfcEAd3y1QpM2Z0iBy+loR/OkEgApnrPuL4/3U2ttc/nv1TxKMHK9gVq7T4feMdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9203.eurprd04.prod.outlook.com (2603:10a6:102:222::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Sat, 28 Jan
 2023 03:46:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%8]) with mapi id 15.20.6043.023; Sat, 28 Jan 2023
 03:46:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Sat, 28 Jan 2023 11:47:13 +0800
Message-Id: <20230128034713.1530218-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230128034713.1530218-1-victor.liu@nxp.com>
References: <20230128034713.1530218-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 78dce08b-8365-4d9b-e9e0-08db00e23fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jUkeJxrgNoJuHiuJqE/JXn6LSX/anO2ue1wpnGP1MBoWVVUJDIDfjmEL+xR0uRdURbCd7yEON1liw3xASox/wjKn1eR4d74ro5wv/fPgI7OUHDCPqcmyyLMnd43fWGTRe+0y3trfeYPji9PB63/gtDCqotYj3rT6DPqCTW3QAhxEWwC8XBxKE/eN2UDYgCEt8X65SK4F3HdeM5IZIaM438YDnhmwwSwGOoK+Zs+RYLhYr2yCr5yyAan2YbRqkeZIPWkQ8XQcrXr7MtrIgjMFzH45E6BT28vCjOvZAdMYLgYw2iyyf4EhKkO6FELp/EyMy4oZrttN0GxJ4ZT6AmEcF4sftYKFqtQ+P70zw81u70je/vynGrAM53T3hrGVaB2XWG+4Iv2T4uvLbCWNiVBgC3BiJfhronr04WAk8k3fe4pgVfkuE+U38d76ja/eE7wsPVTrIK0Z5v/dpAlz45k53F6e5SfXpqiZRT3/g/1lip0wwxFOe/2ZsaDmwaYLX7ueRJagCjUUqRPz80Uj3JZG+29bXH4OwjVs33HcXwSC0Ch852GilgA4YFw06s9Ro8/uVVGQni1kXYFY3uShy4jnZQ7dyR1Y1aW/hd76g+sB7S5aHTqvgrzZkLXgRvTNJefk0dSD43G8ZHo2EY942VG565dC9FZ9j+5WE1XdUWLX1wH+S/PxeDW0x2Eckg0L/8+dcRIXbylZ0AHmtSKi+daUgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199018)(186003)(36756003)(6506007)(1076003)(6512007)(26005)(38350700002)(5660300002)(7416002)(38100700002)(2906002)(6486002)(6666004)(52116002)(86362001)(2616005)(83380400001)(4326008)(66946007)(478600001)(66476007)(66556008)(316002)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?luhCbWHG0nm4FPoG3l8Ck803Qcsvr2rP0WOlJSjUIwwHQ5AQC11j6lRzTOtO?=
 =?us-ascii?Q?ac1iwe8kTSj+6cBal3cnI8puqkxfeQE/lVuBTmao7HeSAUBomzXsGDUNymTl?=
 =?us-ascii?Q?lRnz3/YgxBFm3tVd4ZPh3GAFliBMMygXK2ALHbbGVAFTiWw7cH5SFggmJdmn?=
 =?us-ascii?Q?A76GcNRN8plaE7zupCvFZn4Mgp9DsrOxkQzoUa3uGVWFglMMBaPxVN+8BLQI?=
 =?us-ascii?Q?ryuwajPuekLLR08bjMiKVjvs3zsLcLLZZLWSea8RwHNVqK5nQiOyUXPg7eVK?=
 =?us-ascii?Q?wGaDIxpF40uoBOps12dj4ynCk5Mmgm5oOfy7L5fgqr0AScJ7mPUBQtZB+iPN?=
 =?us-ascii?Q?Q+O+QuwX9Xl6w1rXVc61HCrtKgv1GCAuFJbjOtKXDZ8tKlRz2lWnq3ukoXCf?=
 =?us-ascii?Q?R/g86ncjpYeLyuo4JuNDCfPaJ+WsLdKyjacgMVyMjM7ImImeXrOyNjU3d0Rl?=
 =?us-ascii?Q?ClDs0y4wwhc0yDbisLlmZyljmLagF79eYCAGjcbVDs8RcjmYWk4NbxEXHU0l?=
 =?us-ascii?Q?8D7k9cT1EmhetFTB5CapTA28ARqhS5DFs7GC+8XBPFnot8C3Z97xvlpIiGAg?=
 =?us-ascii?Q?kGH4Mts8hGC/FIRsv/fzNqAfH10HxtE4/Uy7FGuxk6FyNYFlUupvuNiLLPWl?=
 =?us-ascii?Q?IXkFwCqZm71weu5+CAZ/hoEq4zyLuhSrR3n51d6pqr2/gl36h7PDObVqiKrC?=
 =?us-ascii?Q?0SYYqY3OL8ojruAYsLwZLvbVrGTlLxhFTQewSfN/pSH7uluWd5y80petIFzx?=
 =?us-ascii?Q?iRTeNGr3gUWRYJBGUI263b1SPEqNIxmxSyV+GhHIJFT5Db+t1j+0O25n04we?=
 =?us-ascii?Q?gJwJyCCmQNZuwSopFWUq+T8P7NKF7GLNRJe/gbAdAqL6wTABT1lglFuKeJjE?=
 =?us-ascii?Q?mkYNuiEy+/rKcRvZQ/Jrv7UiO1v8RnH07hi4uCWIlUFxXy8FfQgV9ZK6mg1w?=
 =?us-ascii?Q?T3YHvpGRuFr297xEGsn3YUK2fR2/Q74GWDQjBcTByw9qLas6gGyQvKb61CNO?=
 =?us-ascii?Q?VTBaegGqpdntRGQD1WseKCej2jBixUTxbxgRr4zTEWaw+A3CPUYsQ1/eczgm?=
 =?us-ascii?Q?iyQEMTafiH0XVpTUG2c7n5X7OHbVKO11WlejcbTtMYTkAFF+2j6DBizrd8lc?=
 =?us-ascii?Q?EaB69DZhxX0P5lqoToiaxHEmZD8obW0ZZnUmnznnwVcUre3RouMzHmkhVvgY?=
 =?us-ascii?Q?1pdi+J4rxt+LhYb/KKErARWm5W6ZGTfFVvNeePBCcKF/c0VzXi9btoVwCBbf?=
 =?us-ascii?Q?piPDfSsVTj2rDSBZEXJlJ2jIUi59bYvpHfGw2Cyl//4S5jTdy0Utk01Ng24k?=
 =?us-ascii?Q?JohZnrWXiUfBz9r4uslPkt6Ob2da1ZMbFVHSkvDHtqGpJrRwLTB/cr1p7gF3?=
 =?us-ascii?Q?swoyvzViP5h980Au8YNvjN/yuYRb+9KaDrkQYm3YfAoEcDr7YvrisokeHstz?=
 =?us-ascii?Q?iA9w4dJg4D+R1wjtjoQSZSmBtXL/seg2dmMPWS16F6NlLPzO2rDDaoyuWFCE?=
 =?us-ascii?Q?MFB4KG8cxCG2nfijQQP/DO4efjLJNmhns/pTktPjPgYA1CqaMZ6UYWZwq7Fh?=
 =?us-ascii?Q?ujO1HYVfBFxOyGE01pPZg1Lnz7kw0eGR5eqtgdQY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dce08b-8365-4d9b-e9e0-08db00e23fc9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 03:46:33.7582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cxr2ii8SMzpRK8BpS4HMZ7CFtMBmTJxgg9rQn5FlG+I5ccf9wH2rTEH2+4/eHz/TQ7SMc9S8k9a9ybJYp2lhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9203
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
Cc: neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-imx@nxp.com, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, kernel@pengutronix.de,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Add a DRM bridge driver to support the display format configuration.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/Kconfig      |   8 +
 drivers/gpu/drm/bridge/imx/Makefile     |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 209 ++++++++++++++++++++++++
 3 files changed, 218 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 608f47f41bcd..adbd75a924d1 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -44,4 +44,12 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
 	  Choose this to enable pixel link to display pixel interface(PXL2DPI)
 	  found in Freescale i.MX8qxp processor.
 
+config DRM_IMX93_PARALLEL_DISP_FMT_CONFIG
+	tristate "NXP i.MX93 parallel display format configuration"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable parallel display format configuration
+	  found in NXP i.MX93 processor.
+
 endif # ARCH_MXC || COMPILE_TEST
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index aa90ec8d5433..e88821733770 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
+obj-$(CONFIG_DRM_IMX93_PARALLEL_DISP_FMT_CONFIG) += imx93-pdfc.o
diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
new file mode 100644
index 000000000000..a891b1f6743a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2022,2023 NXP
+ */
+
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+#define DRIVER_NAME		"imx93_pdfc"
+
+#define DISPLAY_MUX		0x60
+#define  PARALLEL_DISP_FORMAT	0x700
+
+enum imx93_pdfc_format {
+	RGB888_TO_RGB888 = 0x0,
+	RGB888_TO_RGB666 = 0x1 << 8,
+	RGB565_TO_RGB565 = 0x2 << 8,
+};
+
+struct imx93_pdfc {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+	struct regmap *regmap;
+	u32 format;
+};
+
+static int imx93_pdfc_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct imx93_pdfc *pdfc = bridge->driver_private;
+
+	return drm_bridge_attach(bridge->encoder, pdfc->next_bridge, bridge, flags);
+}
+
+static void
+imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
+{
+	struct imx93_pdfc *pdfc = bridge->driver_private;
+
+	regmap_update_bits(pdfc->regmap, DISPLAY_MUX, PARALLEL_DISP_FORMAT,
+			   pdfc->format);
+}
+
+static const u32 imx93_pdfc_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB666_1X18,
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_FIXED
+};
+
+static bool imx93_pdfc_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
+		if (imx93_pdfc_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    u32 output_fmt,
+					    unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		input_fmts[0] = output_fmt;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	}
+
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
+static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct imx93_pdfc *pdfc = bridge->driver_private;
+
+	switch (bridge_state->output_bus_cfg.format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		pdfc->format = RGB888_TO_RGB888;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		pdfc->format = RGB888_TO_RGB666;
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		pdfc->format = RGB565_TO_RGB565;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(pdfc->dev, "Unsupported output bus format: 0x%x\n",
+				     bridge_state->output_bus_cfg.format);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs imx93_pdfc_bridge_funcs = {
+	.attach			= imx93_pdfc_bridge_attach,
+	.atomic_enable		= imx93_pdfc_bridge_atomic_enable,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts	= imx93_pdfc_bridge_atomic_get_input_bus_fmts,
+	.atomic_check		= imx93_pdfc_bridge_atomic_check,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+};
+
+static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx93_pdfc *pdfc;
+	int ret;
+
+	pdfc = devm_kzalloc(dev, sizeof(*pdfc), GFP_KERNEL);
+	if (!pdfc)
+		return -ENOMEM;
+
+	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(pdfc->regmap)) {
+		ret = PTR_ERR(pdfc->regmap);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
+		return ret;
+	}
+
+	pdfc->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(pdfc->next_bridge)) {
+		ret = PTR_ERR(pdfc->next_bridge);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get next bridge: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pdfc);
+
+	pdfc->dev = dev;
+	pdfc->bridge.driver_private = pdfc;
+	pdfc->bridge.funcs = &imx93_pdfc_bridge_funcs;
+	pdfc->bridge.of_node = dev->of_node;
+
+	drm_bridge_add(&pdfc->bridge);
+
+	return 0;
+}
+
+static int imx93_pdfc_bridge_remove(struct platform_device *pdev)
+{
+	struct imx93_pdfc *pdfc = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pdfc->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id imx93_pdfc_dt_ids[] = {
+	{ .compatible = "nxp,imx93-pdfc", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx93_pdfc_dt_ids);
+
+static struct platform_driver imx93_pdfc_bridge_driver = {
+	.probe	= imx93_pdfc_bridge_probe,
+	.remove = imx93_pdfc_bridge_remove,
+	.driver	= {
+		.of_match_table = imx93_pdfc_dt_ids,
+		.name = DRIVER_NAME,
+	},
+};
+module_platform_driver(imx93_pdfc_bridge_driver);
+
+MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.37.1

