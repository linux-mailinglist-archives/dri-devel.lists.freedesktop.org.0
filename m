Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B52717BE2
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A7810E4A2;
	Wed, 31 May 2023 09:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF72110E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:27:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvARm8RvkSKSV+QDr5/t53T85nmBHRZMx9JdyguLQWSqqx/K51mZNbu835lqi/smNpQ32dolBVx95IEOsueC595oLH7hyGQZ4zBNWZEddRH7fa24uTNSm5km24R+FanCdYlcrFnywI3NAGOHD0g8GzUg3QdkmNAUlVKV2Tv8UaTBwNoHsLWmWIvtlLjU1ovLNc6zbPfr8vfZIzLIsHXnxuFLY93Dn9kqaJjZ610TkEAvmO3ALlYKsX89UWO+ZZ1ZEsuHzKXpEhFUU4E6nYSsN7W+I+KBz1Lgqia84XCOVuxVU4Tu9ZK9lkN3bAAdlJL8T8QjpIRdJDZacown7sCsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jV67x0u3CRXId5a4UGz5uA5pK2DAatzEUP3ASj9Wf/8=;
 b=KnsppTs/YJeZxzlQyZ9LULUwOptvugMjPZwF2FGTLgdXaKPQedI8+4J46+TrZ/hKbbQ8XhShHt+ZXDx2GB1ssFMI+N4TxRJGp/4aZQ2gquhVY+RuWNugd3jCHHDv4vIRNEHaaGbpwuDS3mNhzhmHLsv7PY9yu3vpznJJUsSint8rx5m+Zz7yk3ahtLRvhfygPZ8y3+rtCzRXOJeRYwC2Tln34Oa1YU7EWxy9sLM/CE7ONx78R5PjPeev5b7O7C38XwuxDWPKPj+YxpEeXet7ZjZgJij41y9Sb9HK3YpJNGLybyBnTnUZxKF59GTZfRe9cxVgRBGHcI2VeQqxx3Uofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jV67x0u3CRXId5a4UGz5uA5pK2DAatzEUP3ASj9Wf/8=;
 b=YTMwjxxmwXOxUv8st9kA7MgTAyATrnbHfnykZvxBbhbuCL+ounmHdhVpzZ/N70ij6dpt2n/Yo7IEVyT9EDtJEaYJAHyuyDN9qfQ4SeKiwKgiER1xVzPavGX6uXLOc9Eqy/ZtF+LF9IyhuxArnQ9JLW8EWClJKF+n0yXRUzVpQw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7859.eurprd04.prod.outlook.com (2603:10a6:20b:24c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 09:27:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 09:27:28 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Wed, 31 May 2023 17:32:06 +0800
Message-Id: <20230531093206.3893469-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230531093206.3893469-1-victor.liu@nxp.com>
References: <20230531093206.3893469-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 2557ad54-543d-46aa-7ca2-08db61b94062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rE3g1urzfGRyE3NTuEQaVeMIND8SNv/L3+/DAS4IiMviwopx3/nM8T4ubUaFM32aZ2tYRngg8AvoqTcxdpx/1dG5uWKUg/cHusCIGIPDrhUIVPY02FkMuCHovyEERdMpNTZlNjOsIXVpVPIIBXQYDe787ebV9x+asSHAUSsjg+iqlf+zQ2RSmaFymV3D29JiSk2IKwdU0XcWaIJnaDhNsAYRq67/AHGtwpxUXDWo1hDHHH6aDPaujAA6pHjUVDwlh/vufWt3psfw5CGCkTqlBtxbP0G1kc6tf2JO0+8qwFaEZhHLa3IGXpFTiAWHDK7VjTxxQhh08E0vgv+EHZfRCiRRMm1Fy0iCPTmTKlMMyAeCGCsFkKaTaRvPuCRSSMR/pIBAdaf1+FqGd70K+0pUJJOYSNzhdQW9mBLTcOKOpXH9F1wHUMwHSZweKUiDxUecVFFGknPSQwkT9ABVM1nAG+tuAzxipcDHADDfP9PLbHVShLJNBmeECoOirnT+uS7IL3VK+Rw2BqetO0UqpElbiGI1j1SkoEkztbBFOanzq5PCYh33xxn/QdVG/nkB2pg9ijvIoVJHXtpc3qRXX7YDJWMv3TDXZ6sxVf9BHpg7AiyivzcyKQEusQzJ1EKLnfPN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(7416002)(41300700001)(38350700002)(38100700002)(26005)(6506007)(66476007)(6512007)(36756003)(186003)(316002)(4326008)(66946007)(66556008)(86362001)(83380400001)(1076003)(478600001)(52116002)(6486002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PWOseKU3SOTS64ReOVLzSsNJ48f93lrx8nKPJh/FmUrsTFw8C3wdqlK+cwrY?=
 =?us-ascii?Q?Kr7C0AB/MVYIIwhaffwGKiDGpcWM99eLvPRiK65uwLG/gyXPgnWIjD9hceSt?=
 =?us-ascii?Q?xw+3uzg4QYTZOrdA4wI4qAv2kWRdRlJgVAyCm93AQ1C/+vjyn9FtgjbvtYdh?=
 =?us-ascii?Q?2UrjABVIoHAhyuCjEhbgoFbiEUHBh8z5qM6q0Fvde1YmIobEsLM4tI2os7kR?=
 =?us-ascii?Q?cjZ4RMjJSx02StnbhCiXw1LyPtRG7gOv2D0MQdqHDkGk6slTmigaAn4HFd90?=
 =?us-ascii?Q?cs7YyFDyQw9gGwRv/T9QU9GcrPaV5G9zMY2kHGQaZbxMRG5S1KcBZqvxfPYz?=
 =?us-ascii?Q?jOKclReyyVpd4nD60s7gwEtOCZm0fjn50Hnl/X6nIkWQU26VkNb5uDmzquBS?=
 =?us-ascii?Q?1QqWEFM3YvczRqlW3pPbvT+HDBPlVp+11LPPvH8IAhhDVaUjgWcB3Q8p10M6?=
 =?us-ascii?Q?lCNs4EHpuhLtS789lDynhWI045bk7vql9jr7TC5RRxB0Y0+nE1fKSeXs3fAv?=
 =?us-ascii?Q?pUgJ4dOqNuaZFR8Bm9JUgO4gz6tzb1b7ckh66PVhJU20l98Nou9iLVWAQxVg?=
 =?us-ascii?Q?baBk4C9AmsV9LaW+7I34pFniIltXKUEtP8A+VJvG+ByDTYQRk3pSKNnEMvl0?=
 =?us-ascii?Q?uCulgNweq042BWLrpQ1Rup/zo81K9cdWDJO0WPfNEHAfAdcnfrUTqQkFohew?=
 =?us-ascii?Q?P1WJTJdci7KSRAII2MyLHRUcCbh3GTyA6S81fmFe6nHw6WzYWU8bguuC1xaD?=
 =?us-ascii?Q?uIgTdGTcbQ+pgMUkCpyJPRMULhPojj3LtSaYronMQaASbu4SRR3cdkddZ9We?=
 =?us-ascii?Q?+RpyZZD66SP4A38clyKaU5DwrDmzQiNxu+3SSGQ7OEXJIIQFR4eKi9DSeFHP?=
 =?us-ascii?Q?cYnNThQwv7e9JhVLdEdrzLMIz6xdOquq2nYalapk0EI58JaG7BFjmaF3SeMP?=
 =?us-ascii?Q?9WTBMvO4eW0QTwOy/7/1X/G6qmqlgdXvhNWynX5Q4Qvp7SxZgA8GCI9QyRjc?=
 =?us-ascii?Q?/O3DQ/Fwej1VlLQZJeAZjigOOy1AkGioVzxX58ZvhvfJtcun4sBYiF8rAap6?=
 =?us-ascii?Q?KTMxB0VmJlQ+Ihr7DJYJM6Ah+mLj1zGDFFZPd714tHX1wgUPZqz5QHr0e8h2?=
 =?us-ascii?Q?ciyCUtoVrLa/2M8otBKYs2gvbwK0AQZlLPOy6zvr4xmmxrOIjPFwlc1OKoiC?=
 =?us-ascii?Q?hWxNNWfKp90wm0RqBmaxtB6QBcwjznQWa10N30UKLOPKC2IS4PPmucQTcpIM?=
 =?us-ascii?Q?bfbNhvIRC7hI5r4SmSo0cpOyD7EX8jBSGkb8SKZFF9GkhN/YTjCtdME2W5QZ?=
 =?us-ascii?Q?tR66QD1cKyFSl4b6rJG1KjqhJk3LhjPtXvDazG9Fw8AMSsfJvNGEq4siiRw4?=
 =?us-ascii?Q?gGT2h/8y3mNfeBWBA3mbwy4+hQ4WdvK1ygWS/0J5uoAtqZMitpx+PFVIf7EJ?=
 =?us-ascii?Q?21kdY94Ja6j1kyFVSpGP/jpVdmBfOHte5GoK2uw8GEWni7pTYmBauCemnsdM?=
 =?us-ascii?Q?urTLMX4qzY2IKnL0eqqOblG2jnnOs3/qt1qALFttOJhsT+OvNuoM+HDL0vTk?=
 =?us-ascii?Q?Y2G1laEBmMalwWAK/5yftT3TCOIbD10a/n/h1fa8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2557ad54-543d-46aa-7ca2-08db61b94062
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 09:27:28.2052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apqZ9uT2/XthlQ5D2iltKVZm4G/g5zdON/dBkHHiF3i8pciy/8UwQryp4SMFnkvPUsniZUtslwad5fnDHpN4Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7859
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

NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Add a DRM bridge driver to support the display format configuration.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

