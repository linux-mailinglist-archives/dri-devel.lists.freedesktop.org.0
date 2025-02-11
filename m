Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A693A30606
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E74910E445;
	Tue, 11 Feb 2025 08:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="CKVjOCW8";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oioSF1zv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0824110E445
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1739263317; x=1770799317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OhSb1tB8jCUL48/3XaVTpcvYnCAj5JE9StseCDeaZIA=;
 b=CKVjOCW8XgtOgmjZYp1hhA6fbLGpVxdqv1ZAnHdX33mtOGw0UWbpHRLa
 KZN+q8HQ+jfaIuiQ51982Dg0i06g9I8hXhZ+OQ7CmwOiu2JQMhompxIQc
 h/lO0qJhkUwRVso4zWsMdegYGpI5EDJFdhq1Np0OkJmtgyWTfpZa+fOoM
 KBvM52JB1mdk2adHHPdTJFxIdTf0zrHYdbnbftSlDPYqphhVbTAgdbSne
 uHVVGB+hoanfRQTuDWbftbsTq3JYNSKjYpAouYLgvHki1S4lcRTUuXLud
 r5IGX/J7r6iSk+93fYZf2JgqLfs7b7nYob7+xiWnjBEWngnkUFmO2sB2z Q==;
X-CSE-ConnectionGUID: ZAb/Hh4+RO2kUZc8Yp1qgQ==
X-CSE-MsgGUID: jf7sDxqcREWATS8YJ25E8Q==
X-IronPort-AV: E=Sophos;i="6.13,277,1732575600"; d="scan'208";a="41744845"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 11 Feb 2025 09:41:55 +0100
X-CheckPoint: {67AB0D53-8-B8541F8F-E50F9B0E}
X-MAIL-CPID: 05BF5E78B9110FE624A9C1CBE99E2503_2
X-Control-Analysis: str=0001.0A006366.67AB0D53.00B7, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 99B2B169CCC; Tue, 11 Feb 2025 09:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1739263310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhSb1tB8jCUL48/3XaVTpcvYnCAj5JE9StseCDeaZIA=;
 b=oioSF1zveThtEiwKm6nQi8VaDyrGjhMrWGhuApyNoOSKXt6GohUI3DRaFlGAMwMppJV5aj
 CrGpktuavqWZUADAYWSmLAwvtQTXiR7tkRv2YPw9M5xTGLpYd2zsUbEE7Im6pT9S0NlhH8
 u6uVUXzch5+f5wnbQCANWv17bI94yWynzQLpKNiQKK0x7lqS9LXPn62fkbcTXCduKt5riq
 CYfeSW+FLV68kbJ1jht/cow4AdB1gnPY0waUNvHs21O7/3Lj/mr9FHMQzxpXLL/TTzfs/R
 8Pgxd6zpRXFjgyRgKjUgxCP2MHeeuG4H7xj/uEWhrUzmNsDzBq3lx+sPZHlFow==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm: bridge: imx9-parallel-disp-fmt: add i.MX91/93
 parallel display bridge
Date: Tue, 11 Feb 2025 09:41:19 +0100
Message-Id: <20250211084119.849324-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
References: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

i.MX91/93 have a single register specifying parallel display output
format. Add a bridge driver for setting the corresponding format.
Currently only RGB565, RGB666 and RGB888 output is supported.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../gpu/drm/bridge/imx9-parallel-disp-fmt.c   | 213 ++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 6b4664d91faa8..8b69977787883 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,6 +90,16 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_IMX9_PARALLEL_DISPLAY_FORMAT
+	tristate "Support for i.MX93 parallel display format"
+	depends on OF && MFD_SYSCON
+	depends on ARCH_MXC || COMPILE_TEST
+	select DRM_KMS_HELPER
+	select DRM_PANEL_BRIDGE
+	help
+	  Support for internal parallel display format configuration
+	  found on i.MX91 and i.MX93 processors.
+
 config DRM_ITE_IT6263
 	tristate "ITE IT6263 LVDS/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 97304b429a530..ee3406fed880f 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+obj-$(CONFIG_DRM_IMX9_PARALLEL_DISPLAY_FORMAT) += imx9-parallel-disp-fmt.o
 obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
diff --git a/drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c b/drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c
new file mode 100644
index 0000000000000..c37bdda53377c
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2022 NXP
+ * Copyright (c) 2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+
+#define DISPLAY_MUX_CTRL		0x60
+#define  PARALLEL_DISP_FORMAT		GENMASK(10, 8)
+#define  FORMAT_RGB888_TO_RGB888	FIELD_PREP(PARALLEL_DISP_FORMAT, 0)
+#define  FORMAT_RGB888_TO_RGB666	FIELD_PREP(PARALLEL_DISP_FORMAT, 1)
+#define  FORMAT_RGB565_TO_RGB565	FIELD_PREP(PARALLEL_DISP_FORMAT, 2)
+#define  FORMAT_RGB555_TO_RGB555	FIELD_PREP(PARALLEL_DISP_FORMAT, 3)
+#define  FORMAT_YUV_TO_YCBCR24		FIELD_PREP(PARALLEL_DISP_FORMAT, 4)
+#define  FORMAT_YUV_TO_YUV444		FIELD_PREP(PARALLEL_DISP_FORMAT, 5)
+
+struct imx9_pdf {
+	struct device *dev;
+	struct drm_bridge bridge;
+	struct drm_bridge *panel_bridge;
+	struct regmap *regmap;
+};
+
+static inline struct imx9_pdf *to_imx9_pdf(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct imx9_pdf, bridge);
+}
+
+static int imx9_pdf_attach(struct drm_bridge *bridge,
+	enum drm_bridge_attach_flags flags)
+{
+	struct imx9_pdf *pdf = to_imx9_pdf(bridge);
+
+	return drm_bridge_attach(bridge->encoder, pdf->panel_bridge,
+	       			 bridge, flags);
+}
+
+static void imx9_pdf_atomic_enable(struct drm_bridge *bridge,
+				   struct drm_bridge_state *old_bridge_state)
+{
+	struct imx9_pdf *pdf = to_imx9_pdf(bridge);
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	const struct drm_bridge_state *bridge_state;
+	u32 format;
+
+	/* Get the bus format from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+
+	switch (bridge_state->output_bus_cfg.format) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		format = FORMAT_RGB565_TO_RGB565;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		format = FORMAT_RGB888_TO_RGB666;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		format = FORMAT_RGB888_TO_RGB888;
+		break;
+	default:
+		/*
+		 * Some bridges still don't set the correct bus format.
+		 * Just print a warning.
+		 */
+		dev_warn(pdf->dev,
+			 "Unsupported bus format 0x%04x, please check output bridge driver\n",
+			 bridge_state->output_bus_cfg.format);
+		return;
+	}
+
+	regmap_update_bits(pdf->regmap, DISPLAY_MUX_CTRL, PARALLEL_DISP_FORMAT,
+			   format);
+}
+
+#define MAX_INPUT_SEL_FORMATS 2
+static u32 *
+imx9_pdf_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state,
+				   u32 output_fmt,
+				   unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	input_fmts[1] = MEDIA_BUS_FMT_RGB565_1X16;
+	*num_input_fmts = MAX_INPUT_SEL_FORMATS;
+
+	return input_fmts;
+}
+
+#define MAX_OUTPUT_SEL_FORMATS 3
+static u32 *
+imx9_pdf_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+				    struct drm_bridge_state *bridge_state,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state,
+				    unsigned int *num_output_fmts)
+{
+	u32 *output_fmts;
+
+	*num_output_fmts = 0;
+
+	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
+			     GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+
+	output_fmts[0] = MEDIA_BUS_FMT_RGB565_1X16;
+	output_fmts[1] = MEDIA_BUS_FMT_RGB666_1X18;
+	output_fmts[2] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_output_fmts = MAX_OUTPUT_SEL_FORMATS;
+
+	return output_fmts;
+}
+
+static enum drm_mode_status
+imx9_pdf_mode_valid(struct drm_bridge *bridge,
+		   const struct drm_display_info *info,
+		   const struct drm_display_mode *mode)
+{
+	if (mode->clock > 80000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs funcs = {
+	.attach = imx9_pdf_attach,
+	.atomic_enable = imx9_pdf_atomic_enable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts = imx9_pdf_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts = imx9_pdf_atomic_get_output_bus_fmts,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.mode_valid = imx9_pdf_mode_valid,
+};
+
+static int imx9_pdf_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *remote;
+	struct drm_panel *panel;
+	struct imx9_pdf *pdf;
+
+	pdf = devm_kzalloc(dev, sizeof(*pdf), GFP_KERNEL);
+	if (!pdf)
+		return -ENOMEM;
+
+	pdf->dev = &pdev->dev;
+	pdf->bridge.funcs = &funcs;
+	pdf->bridge.of_node = dev->of_node;
+	pdf->bridge.type = DRM_MODE_CONNECTOR_DPI;
+
+	pdf->regmap = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(pdf->regmap))
+		return dev_err_probe(dev, PTR_ERR(pdf->regmap),
+				     "failed to get regmap\n");
+
+	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
+	panel = of_drm_find_panel(remote);
+	of_node_put(remote);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
+
+	pdf->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(pdf->panel_bridge))
+		return PTR_ERR(pdf->panel_bridge);
+
+	platform_set_drvdata(pdev, pdf);
+
+	devm_drm_bridge_add(dev, &pdf->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id imx9_pdf_dt_ids[] = {
+	{ .compatible = "fsl,imx9-parallel-display-format", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx9_pdf_dt_ids);
+
+static struct platform_driver imx9_pdf_driver = {
+	.probe		= imx9_pdf_probe,
+	.driver		= {
+		.name		= "imx9-parallel-display-format",
+		.of_match_table	= imx9_pdf_dt_ids,
+	},
+};
+module_platform_driver(imx9_pdf_driver);
+
+MODULE_AUTHOR("Alexander Stein <alexander.stein@ew.tq-group.com>");
+MODULE_DESCRIPTION("i.MX91/i.MX93 parallel display format driver");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

