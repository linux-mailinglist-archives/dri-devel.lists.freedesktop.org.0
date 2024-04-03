Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD16896325
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 05:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A688510F8ED;
	Wed,  3 Apr 2024 03:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RO6Nb7p3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB64110F8ED
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 03:44:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-515a81928faso7274355e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 20:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712115840; x=1712720640; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VEllE0JxY/kWG3UyhjYtfiI+8grBVB/qzOVHLfoOelc=;
 b=RO6Nb7p3fkf70T6QX4CmVOF7LFEwvWFMCU6bzaTQqQsdy43V9wge04heHVFF3Embox
 F1rLo/W+ndK2/L7Yc8ssE1sTMYztYpo8txn+j4vsbEEy6K4FH1HxkvK4U51VNeC0KbbY
 oqncGp7SOFIPh7ViJksLNSIv2HQm8vWJgLnRdAs/KWYQAUZLnJWkm9evM96l4C+Rya3M
 YSkImgDlxbP1/Ukni8M0ixrplkGxzlbcYlXFVCrM3+MTG4M0egPXfGGzOyjUXVZeqmRo
 GNN95+mmPI0K6oRqDQW5H75AfEpmaIHGVj0LkdBSUZoo274ZdZtXeeHRuAJhxwCeOeol
 aBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712115840; x=1712720640;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEllE0JxY/kWG3UyhjYtfiI+8grBVB/qzOVHLfoOelc=;
 b=SzRHB6fXeSx1r/STchZAq0zSQpoeGY7rhwFZxVNgbtJnEnomX3OkMNljAXM/ZilG/Z
 3oMt8ZtHCR3ChYXL5z7OvFO3SSIM7ugog0pEcZeTZCb11oLnlbI7rcdMOq0mP81m1v6h
 yHtmxNJ+8OFxa55kmkmW27DUfn8xwvhKuIMOH00ML5jRhE108ryS6MqrSh2UI6Y75PLp
 FjuHYhc1mtkuUW3utXNWTBK3/4TNO3yQ1nxKzXsJcs6TH/V+XSbVR8Bb0kc036h+SXeC
 vXM+Y91bgmV2EcwKUDrzQ8NsTiSCJfKl7G3xMKS8RvsiUjpAPUJFAyj31LcrlUmg8BZN
 6BYw==
X-Gm-Message-State: AOJu0YxGYvYrubULmpyz6MGJK5VP31ug8qxb6TBpcSJEPTejmo45GIVR
 tj+LmBfd5dRQ2u8RdcI6aP5II4mQ1qZPpt2HA44rjs+79JTkegYeBgbTFcw2Obf2C1W2VyoebyL
 B
X-Google-Smtp-Source: AGHT+IEfIPCrrPgC5ZFLX497AE4CvsNKnGXOrqFIYnp2nyQ7u1ZNPXjK9PFY8RWN3ASmBmVsJXV55w==
X-Received: by 2002:ac2:4e94:0:b0:515:bee6:5e8c with SMTP id
 o20-20020ac24e94000000b00515bee65e8cmr746256lfr.40.1712115840618; 
 Tue, 02 Apr 2024 20:44:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 br31-20020a056512401f00b00516a69b1dcbsm940985lfb.78.2024.04.02.20.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 20:44:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 03 Apr 2024 06:43:58 +0300
Subject: [PATCH v4 4/4] drm: panel: Add LG sw43408 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-lg-sw43408-panel-v4-4-a386d5d3b0c6@linaro.org>
References: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
In-Reply-To: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12287;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RUV+Dk+/80GpPXHjLxLRCSIqIHDkECObEjPjG6mQQz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDNB7FbyKMbLG3zClJcH1OsnRrXOOu27dNGear
 jOwqW3U3UqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzQewAKCRCLPIo+Aiko
 1dDVCACL69rdnEE8PIJX88qc7+xTy7DBdvssN2vwlwAf48Txyr0m7LHMEPos6c24etB+iKBm1JH
 xDeNaX86zlqi1KtahuW49W1y9104vvQUNNPcRYHje4N8PX96hPxws9rUH1uHWbkM5ujt+YbC/2U
 Qm40mRlR2M82r4nV8WVNWMIC0VbBjiFYx8xLrgeY9wVF68XtMMml9YMxNRUoqUWAf9K2mls98+y
 hmCJh2nkY3t6e2f8gmPO7rETqf4/WRSU821tUbzQmM/GirNrA1zjZmyXbK82SR2dXNUwvZ2JKql
 77LtF6qBcuEyN6PXXW7yZE9HWtuZIWfXsDfcixtUM+b8ycF4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Sumit Semwal <sumit.semwal@linaro.org>

LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel, used in some Pixel3
phones.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
[vinod: Add DSC support]
Signed-off-by: Vinod Koul <vkoul@kernel.org>
[caleb: cleanup and support turning off the panel]
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
[DB: partially rewrote the driver and fixed DSC programming]
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS                              |   8 +
 drivers/gpu/drm/panel/Kconfig            |  11 ++
 drivers/gpu/drm/panel/Makefile           |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 323 +++++++++++++++++++++++++++++++
 4 files changed, 343 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d36c19c1bf81..4cc43c16e07e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6789,6 +6789,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
 F:	drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
 
+DRM DRIVER FOR LG SW43408 PANELS
+M:	Sumit Semwal <sumit.semwal@linaro.org>
+M:	Caleb Connolly <caleb.connolly@linaro.org>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
+F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
+
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
 S:	Supported
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 6dc451f58a3e..a55e9437c8cf 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -335,6 +335,17 @@ config DRM_PANEL_LG_LG4573
 	  Say Y here if you want to enable support for LG4573 RGB panel.
 	  To compile this driver as a module, choose M here.
 
+config DRM_PANEL_LG_SW43408
+	tristate "LG SW43408 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for LG sw43408 panel.
+	  The panel has a 1080x2160 resolution and uses
+	  24 bit RGB per pixel. It provides a MIPI DSI interface to
+	  the host and has a built-in LED backlight.
+
 config DRM_PANEL_MAGNACHIP_D53E6EA8966
 	tristate "Magnachip D53E6EA8966 DSI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 24a02655d726..0b40b010e8e7 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
+obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
new file mode 100644
index 000000000000..6fcdaa5cf6c5
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019-2024 Linaro Ltd
+ * Author: Sumit Semwal <sumit.semwal@linaro.org>
+ *	 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+
+#define NUM_SUPPLIES 2
+
+struct sw43408_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *link;
+
+	struct regulator_bulk_data supplies[NUM_SUPPLIES];
+
+	struct gpio_desc *reset_gpio;
+
+	struct drm_dsc_config dsc;
+};
+
+static inline struct sw43408_panel *to_panel_info(struct drm_panel *panel)
+{
+	return container_of(panel, struct sw43408_panel, base);
+}
+
+static int sw43408_unprepare(struct drm_panel *panel)
+{
+	struct sw43408_panel *ctx = to_panel_info(panel);
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(ctx->link);
+	if (ret < 0)
+		dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->link);
+	if (ret < 0)
+		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
+
+	msleep(100);
+
+	gpiod_set_value(ctx->reset_gpio, 1);
+
+	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+}
+
+static int sw43408_program(struct drm_panel *panel)
+{
+	struct sw43408_panel *ctx = to_panel_info(panel);
+	struct drm_dsc_picture_parameter_set pps;
+
+	mipi_dsi_dcs_write_seq(ctx->link, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
+
+	mipi_dsi_dcs_set_tear_on(ctx->link, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_dcs_write_seq(ctx->link, 0x53, 0x0c, 0x30);
+	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x00, 0x70, 0xdf, 0x00, 0x70, 0xdf);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xf7, 0x01, 0x49, 0x0c);
+
+	mipi_dsi_dcs_exit_sleep_mode(ctx->link);
+
+	msleep(135);
+
+	/* COMPRESSION_MODE moved after setting the PPS */
+
+	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xac);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xe5,
+			       0x00, 0x3a, 0x00, 0x3a, 0x00, 0x0e, 0x10);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xb5,
+			       0x75, 0x60, 0x2d, 0x5d, 0x80, 0x00, 0x0a, 0x0b,
+			       0x00, 0x05, 0x0b, 0x00, 0x80, 0x0d, 0x0e, 0x40,
+			       0x00, 0x0c, 0x00, 0x16, 0x00, 0xb8, 0x00, 0x80,
+			       0x0d, 0x0e, 0x40, 0x00, 0x0c, 0x00, 0x16, 0x00,
+			       0xb8, 0x00, 0x81, 0x00, 0x03, 0x03, 0x03, 0x01,
+			       0x01);
+	msleep(85);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xcd,
+			       0x00, 0x00, 0x00, 0x19, 0x19, 0x19, 0x19, 0x19,
+			       0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19,
+			       0x16, 0x16);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xcb, 0x80, 0x5c, 0x07, 0x03, 0x28);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xc0, 0x02, 0x02, 0x0f);
+	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
+	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xca);
+
+	mipi_dsi_dcs_set_display_on(ctx->link);
+
+	msleep(50);
+
+	ctx->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	drm_dsc_pps_payload_pack(&pps, ctx->link->dsc);
+	mipi_dsi_picture_parameter_set(ctx->link, &pps);
+
+	ctx->link->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	/*
+	 * This panel uses PPS selectors with offset:
+	 * PPS 1 if pps_identifier is 0
+	 * PPS 2 if pps_identifier is 1
+	 */
+	mipi_dsi_compression_mode_ext(ctx->link, true,
+				      MIPI_DSI_COMPRESSION_DSC, 1);
+
+
+	return 0;
+}
+
+static int sw43408_prepare(struct drm_panel *panel)
+{
+	struct sw43408_panel *ctx = to_panel_info(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(5000, 6000);
+
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(9000, 10000);
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(9000, 10000);
+
+	ret = sw43408_program(panel);
+	if (ret)
+		goto poweroff;
+
+	return 0;
+
+poweroff:
+	gpiod_set_value(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	return ret;
+}
+
+static const struct drm_display_mode sw43408_mode = {
+	.clock = (1080 + 20 + 32 + 20) * (2160 + 20 + 4 + 20) * 60 / 1000,
+
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 20,
+	.hsync_end = 1080 + 20 + 32,
+	.htotal = 1080 + 20 + 32 + 20,
+
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 20,
+	.vsync_end = 2160 + 20 + 4,
+	.vtotal = 2160 + 20 + 4 + 20,
+
+	.width_mm = 62,
+	.height_mm = 124,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int sw43408_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &sw43408_mode);
+}
+
+static int sw43408_backlight_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	uint16_t brightness = backlight_get_brightness(bl);
+
+	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+}
+
+const struct backlight_ops sw43408_backlight_ops = {
+	.update_status = sw43408_backlight_update_status,
+};
+
+static int sw43408_backlight_init(struct sw43408_panel *ctx)
+{
+	struct device *dev = &ctx->link->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_PLATFORM,
+		.brightness = 255,
+		.max_brightness = 255,
+	};
+
+	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
+							ctx->link,
+							&sw43408_backlight_ops,
+							&props);
+
+	if (IS_ERR(ctx->base.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->base.backlight),
+				     "Failed to create backlight\n");
+
+	return 0;
+}
+
+static const struct drm_panel_funcs sw43408_funcs = {
+	.unprepare = sw43408_unprepare,
+	.prepare = sw43408_prepare,
+	.get_modes = sw43408_get_modes,
+};
+
+static const struct of_device_id sw43408_of_match[] = {
+	{ .compatible = "lg,sw43408", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sw43408_of_match);
+
+static int sw43408_add(struct sw43408_panel *ctx)
+{
+	struct device *dev = &ctx->link->dev;
+	int ret;
+
+	ctx->supplies[0].supply = "vddi"; /* 1.88 V */
+	ctx->supplies[0].init_load_uA = 62000;
+	ctx->supplies[1].supply = "vpnl"; /* 3.0 V */
+	ctx->supplies[1].init_load_uA = 857000;
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		dev_err(dev, "cannot get reset gpio %ld\n",
+			      PTR_ERR(ctx->reset_gpio));
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	ret = sw43408_backlight_init(ctx);
+	if (ret < 0)
+		return ret;
+
+	ctx->base.prepare_prev_first = true;
+
+	drm_panel_init(&ctx->base, dev, &sw43408_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	drm_panel_add(&ctx->base);
+	return ret;
+}
+
+static int sw43408_probe(struct mipi_dsi_device *dsi)
+{
+	struct sw43408_panel *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	dsi->mode_flags = MIPI_DSI_MODE_LPM;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->lanes = 4;
+
+	ctx->link = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ret = sw43408_add(ctx);
+	if (ret < 0)
+		return ret;
+
+	/* The panel is DSC panel only, set the dsc params */
+	ctx->dsc.dsc_version_major = 0x1;
+	ctx->dsc.dsc_version_minor = 0x1;
+
+	/* slice_count * slice_width == width */
+	ctx->dsc.slice_height = 16;
+	ctx->dsc.slice_width = 540;
+	ctx->dsc.slice_count = 2;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4;
+	ctx->dsc.block_pred_enable = true;
+
+	dsi->dsc = &ctx->dsc;
+
+	return mipi_dsi_attach(dsi);
+}
+
+static void sw43408_remove(struct mipi_dsi_device *dsi)
+{
+	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = sw43408_unprepare(&ctx->base);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to unprepare panel: %d\n",
+			      ret);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->base);
+}
+
+static struct mipi_dsi_driver sw43408_driver = {
+	.driver = {
+		.name = "panel-lg-sw43408",
+		.of_match_table = sw43408_of_match,
+	},
+	.probe = sw43408_probe,
+	.remove = sw43408_remove,
+};
+module_mipi_dsi_driver(sw43408_driver);
+
+MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
+MODULE_DESCRIPTION("LG SW436408 MIPI-DSI LED panel");
+MODULE_LICENSE("GPL");

-- 
2.39.2

