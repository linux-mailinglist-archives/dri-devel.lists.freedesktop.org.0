Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA23F721DF2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 08:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCD910E17D;
	Mon,  5 Jun 2023 06:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3337210E17D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 06:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzBO1aLWkv2V44f8DTgADYs7e2eJ3ydiggzQXNLIOSiYlphtGoymlbZ95za3CtOYbFt9NlfjYckhqKLKPF8VXgAZduAvENCiX8t36pdmbt25ACnjnficrkM+WWkKa3hS/fSlppgYCdMMSxuU48H5vVObUWNKfU9OybjyUvEN25GQs5Sv7sWyekd+MH6hB0CCado0ijMckYUdcfnT7s38AGX9uRNMEeoPDHTMH1HIxsewvMPCsTF3IJZ3O/q0S4CgEjqVh1+nSwDmz7vPt3TZmlBXXU1GjkdazHiEMuIWbBA7Bj/q6sdhOkW+K8xX1g0JdTS4C2smCENh5HYRsOR9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VakjUWFETSvVtl/79p76W7XQ7Evafr+iNfzrtJ6sH6M=;
 b=f5OruUzv6ahMaMA3QUsTKK2HW9yxQ35QI77bheVnvzd9yFqzDZ1kwxjAoaHPqY5s992KypdUsFxHxxkQw2lxGQ7H5Dfy2S1dz5UcOZ1KiXdJLFBGfHsWu4PpqG8AmThXZAOm/YPcKxzOPkv03ZME7g9MtYEYurc/mAY1J1hfh3i2YIQDQv69GR4m5MnVEh6m5XL5T8Vqq8wJTECw1LHE8qX/K4j1+jpgrQ9mDLfHkWCT3hGEWZJN6+oDZY+XelXLJ9C2IPVhMlEFHQqKrvfEUHHgieoo62uHGKDNCsvFTG9j4QIHQ9YC5Sn4F7ayEyW0LpWE+6x/ImhhJWUwEUL3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VakjUWFETSvVtl/79p76W7XQ7Evafr+iNfzrtJ6sH6M=;
 b=DyCg/U6XJSmEvQtBkIyuyDisLnMeKNvk115EOGB4iqF2IITJdIW4XTeIrV6uyz/1Scvd+jZ7ncN/O7hByNLm29VDLtxxKu86E6ipSkBh0bTlipIF6ijGTf3jP7GXdkQaEpD8hC4l2mng1NReVwG2uzihHC6wMEd8JSbOZgShSVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 06:17:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 06:17:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Mon,  5 Jun 2023 14:22:17 +0800
Message-Id: <20230605062217.3716328-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230605062217.3716328-1-victor.liu@nxp.com>
References: <20230605062217.3716328-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM0PR04MB7041.eurprd04.prod.outlook.com
 (2603:10a6:208:19a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 17937315-57b3-45dd-44d8-08db658c92ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2w0McSNpiKT/zctyLS/3zg1yQjPRTTvaFQAKlsQatusR9IEoFDUSWkNfN/eCeOT1EOnh2ttDOTSpB//arqroefnQLxSCKfwkLGMsQSlKZ5BNT0wlggcm1gTvG4Isp5fJ76Rh6FoAxdroe8KLnslsIz/MijtqqR/ZO9Y+QnCPUoxcGZ+/sBBLq0GBJEjUf+T03w25a+RAFB0zdrHITyyyVjYVjc+3GlGuuD6o+/ms9FrsnbCyC/xfxn0fy8JLC31gljnqadsfI29eP1f4vQe+k0+8CywpkUVXVbk8F/ICMfB2hmsxNW30idtZo6pRjSdZaUegpwlnyHbPekHbL4mPuA9CCzNsX6KLLmiU6wcFiwFLKhgSvCpzOOVKq8kF/5+whqBDgiHyMvsz7263Aq9611CrjPRcYikcv3W2huR8r6hC9x3zD+9JNL1BPiZ3qRMxblaI8INmc0JMIo+zWVvRaQVeVPkCEdNz0dBkSYZ1g9wNiep0T/HJQ2CPCx2x3J9p1YPuVnvR79nWbbaHo4Qia0RVadl56NsO+5p/shicBZZBE8ALIllbsbI2uetgAWos7DgzJX9FDp87QfopOYMuumy+i9VM5hf9lRzSdEKaRyZU7zSE2sQQLCRRSfxYMyW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(2616005)(26005)(6512007)(1076003)(6506007)(38100700002)(83380400001)(38350700002)(41300700001)(52116002)(6486002)(6666004)(186003)(478600001)(4326008)(66476007)(66556008)(316002)(66946007)(7416002)(8936002)(8676002)(5660300002)(2906002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TOaND8Z6ppoNUYVpg15PidCICV+tVgobg6qX5Jn2h0822VQDjHT1voPnZ9u4?=
 =?us-ascii?Q?M70SYRFbq11Ql3uItyEfz0vtQsIKjwL2mEL/3gnuc/xoUTE+EBTlY9pbUZBf?=
 =?us-ascii?Q?3vMe+GbLRW3vjCXUnDyU2xmH2flF80zN116pq111fod06930t7m1Iu5a+W5H?=
 =?us-ascii?Q?4YkFsNy95zhJKqtZoc+l0u1eQ2Rj3YtiiT109bvlTtxJGmPe17bahOXkJRey?=
 =?us-ascii?Q?b/H4ygg/S0AGWs+4nfihW5KTzvNJBbfYBwnwipOn96knVcN19HW1285SrPFF?=
 =?us-ascii?Q?YMzAn0F+fRCOnwItNuQhEygQblx2mrO+nWmHcVbqkwOAUoWo7/7OFrjiASjx?=
 =?us-ascii?Q?mKRMVje4TlqOzjt7mBzdngRhU6doLscstmWvr1sAgzxMr/mGB5Bho9n8pEKS?=
 =?us-ascii?Q?GZem/zUogjLzrEKCdoFYUP0axX5knWFoC1t7Dfiq8cDHpm9WDi/Ec5t/9zid?=
 =?us-ascii?Q?502QrEujn4EFWl8K89DZ6Yu7SQ7c766wFf/kzNdkH1UqeVdjHk4NNzDo1XPl?=
 =?us-ascii?Q?Ay+0MTXHgD7hR9tcEDkRhdnd4GV7xVxEYddHCtRQEw1pkg86qt1TFeapcxaU?=
 =?us-ascii?Q?F2XDkIk1Odk4C1kM75hub1bYK2mM5QOiZHyl3kei92zna5BpWsJM5ljIQO6D?=
 =?us-ascii?Q?yPzeH2sCY4NXzC+mGxh1JFIYDn0/byVPlIgGvdSfkaLbur2t+RB3UOY0ePyl?=
 =?us-ascii?Q?aShboFszzInj08BZ2xtsfs8ESCxdTG9PUW1NwvSP6Zn5T+UI7S73BLDi1cCD?=
 =?us-ascii?Q?KeueVZXAmZz3kOiKchGetHyHOmPAR5XZgM2uRDMQS9g03lhZCCZ9xxnnVqRp?=
 =?us-ascii?Q?m0bbds3EiBJm9h5HeLFCFn4D0f50Nhtw4rIWDoxGPuhhnDG1yelaF0AKiHPv?=
 =?us-ascii?Q?z1YEYyv38UlZEwCH2LetXtSMVXlSRgRxyF/bZTDf7DbRDehfw6KtSh6e23Me?=
 =?us-ascii?Q?7+hXo0EVzdYWC7KSiFatxzTzYT8r4I/JMdFO6mxGGSg/vX1P77DWL93rwd+y?=
 =?us-ascii?Q?TeGEPrOW2LDqGb/OFLYR4oVwimSeWjSjHlZ6wlmfKnPIwGNmetdTHHCXl5hS?=
 =?us-ascii?Q?UbPDCURujFGSEcn928l1j5dPrst3LGC9BXYw0qQbGu7SL+YVvKYZLc3pBE5d?=
 =?us-ascii?Q?zCm8yJjXv1EkY8jyXtpEt+sSkch+1N3q24uhkSCIDjrb/M7z3VJRRtTGb/jU?=
 =?us-ascii?Q?IdWvlaLgFvNmK+ofn/BEKiMS7q5b6s1NlAd53UUkMNW15z2tkFDuVB1PYd/2?=
 =?us-ascii?Q?yF/Ej1NkTmCjY809qInX84s2X0bUf5/Nm6Izee1JNidK2DJrj+AuIjyvy1JC?=
 =?us-ascii?Q?66mkRRA9UlPuvYdhp/a+REfi4thoffZEYTz3L0/mBBe4+ZrBL9Wegfwc6Vwl?=
 =?us-ascii?Q?/C9k32EQTbx7a1zWkQSCba15HOclD28goY2vnEw31Ac2uB1VIyiOTpmGoW05?=
 =?us-ascii?Q?nUa3OzFuVQnxq+rvn0rGAqdnOlyudHcpzx1oWmKfOXdKIrnNbheT4H3HCL+9?=
 =?us-ascii?Q?21ao0VowuIujStaAWXhOxMCX8/H8N50JoVFmRPrzfiEOWrQvzPbk9ydA87m2?=
 =?us-ascii?Q?MCWlq00GoWtb43UMlgA/XqNQKIsYBrMrh22Y1hgH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17937315-57b3-45dd-44d8-08db658c92ca
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 06:17:44.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+Eng4OOcPK2une3N3h5RjzR+jNnVfZ8zuXlgeI01sXb4GS30g3jmjIBqM7/bXJIz12mR47+QomqVzPwy9Nr2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545
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
Cc: marex@denx.de, neil.armstrong@linaro.org, conor+dt@kernel.org,
 rfoss@kernel.org, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 s.hauer@pengutronix.de, peng.fan@nxp.com, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Add a DRM bridge driver to support the display format configuration.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* No change.

v1->v2:
* Set *num_input_fmts to zero in case
  imx93_pdfc_bridge_atomic_get_input_bus_fmts() returns NULL.
* Replace .remove callback with .remove_new callback in
  imx93_pdfc_bridge_driver.

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
index 000000000000..61e01b503be5
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
+	*num_input_fmts = 0;
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
+static void imx93_pdfc_bridge_remove(struct platform_device *pdev)
+{
+	struct imx93_pdfc *pdfc = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pdfc->bridge);
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
+	.remove_new = imx93_pdfc_bridge_remove,
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

