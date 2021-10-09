Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B6427D5F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 22:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FEB6E02B;
	Sat,  9 Oct 2021 20:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8D16E1AA
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 20:38:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m3so54725130lfu.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Oct 2021 13:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpF9Xx7xR4+38VJoGN57YNwQ36S3/2L1gngIwIhNZF8=;
 b=mqZhzn7wg/oKpy+bLPPcw3nhRiTJACpEBBROCKKyP1U1+I7tlioT+DIQoPdkscWQRv
 JpQnyU1yGQ7/m6BPBjs5zSh7rdgoZD/V6kczlNEiujXgGvdpdpz60BXsrvpdnFlApo5Q
 7T75sBe+gyrsPYr4a0o3D11fdzbD5dI2MkoMaKN3Zu/UZWf2QEEj5Avzip6PZmz5Arjp
 Tydn6p4lro3oimCb8BwuTrsCpcFpWp1afbB9zSHf3UkffVBSLYiewucJdUF5HFyuelAC
 ZsNwdrxwEmWlvRwWtjW4+orynSIjPx3GMeHDTLuZlJmXaSWZSOgxyzLGRJuXj8h7kvnV
 gFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpF9Xx7xR4+38VJoGN57YNwQ36S3/2L1gngIwIhNZF8=;
 b=M+gxT4RQumzupxmp2idjG3KiNQcldadLGnljn8ZMFm7mclgVznXqlAF+/7NHW2B7zc
 OPtwvnF+t9m34HKJKiVectafOBGhn4J15/HyNYDMfslHEWyR/NCm0cKeutOpOBH3zpGr
 BVf2fv7Bh1JJ9goEc66C6gb6w4QlIshJXgVe4QTG3gSCXLeQ44mfIUXj5fJtRLcamr8/
 8wuLfhDmMtgAEumfFbsSg0D5Watce0j9EXAcJGr6KlvIF1jeg8uatNVInbf4a9viZhO3
 o7UDW1MW7yaOANmfXsgoivJo4cq0X2oO4xx/p/eyv93rdZW5KyMjLFNZEDe6RB4WnwgM
 aCaQ==
X-Gm-Message-State: AOAM530bVo/75Nc50unBhr5jIKCPwNGjeLRRrEZGKtcxiJTEiJbhDOKs
 ATbCuMLgb97MIyK/vQ8nb3eL1FzAx4fm/g==
X-Google-Smtp-Source: ABdhPJwnnuPpIOaHTpI7yDZXJA7PPvwrUWdFbJ9FVJpFCRAgjhpJ8JRfimo0Ya2hF/nTGyHIuxkJEQ==
X-Received: by 2002:a05:6512:1592:: with SMTP id
 bp18mr8234153lfb.122.1633811889946; 
 Sat, 09 Oct 2021 13:38:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q187sm303794ljb.6.2021.10.09.13.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:38:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 2/2] drm/panel: Add support for Sharp LS060T1SX01 panel
Date: Sat,  9 Oct 2021 23:38:06 +0300
Message-Id: <20211009203806.56821-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009203806.56821-1-dmitry.baryshkov@linaro.org>
References: <20211009203806.56821-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add driver to support Sharp LS06T1SX01 FullHD panel. The panel uses
nt35695 driver IC. For example this LCD module can be found in the
kwaek.ca Dragonboard Display Adapter Bundle.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 333 ++++++++++++++++++
 3 files changed, 344 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 369cb76512fe..eb01549a6ccb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -519,6 +519,16 @@ config DRM_PANEL_SHARP_LS043T1LE01
 	  Say Y here if you want to enable support for Sharp LS043T1LE01 qHD
 	  (540x960) DSI panel as found on the Qualcomm APQ8074 Dragonboard
 
+config DRM_PANEL_SHARP_LS060T1SX01
+	tristate "Sharp LS060T1SX01 FullHD video mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Sharp LS060T1SX01 6.0"
+	  FullHD (1080x1920) DSI panel as found in Dragonboard Display Adapter
+	  Bundle.
+
 config DRM_PANEL_SITRONIX_ST7701
 	tristate "Sitronix ST7701 panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 6e30640b9099..bca4cc1f2715 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) += panel-sharp-ls043t1le01.o
+obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) += panel-sharp-ls060t1sx01.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
new file mode 100644
index 000000000000..e12570561629
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2021 Linaro Ltd.
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ *   Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct sharp_ls060 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator *vddi_supply;
+	struct regulator *vddh_supply;
+	struct regulator *avdd_supply;
+	struct regulator *avee_supply;
+	struct gpio_desc *reset_gpio;
+	bool prepared;
+};
+
+static inline struct sharp_ls060 *to_sharp_ls060(struct drm_panel *panel)
+{
+	return container_of(panel, struct sharp_ls060, panel);
+}
+
+#define dsi_dcs_write_seq(dsi, seq...) ({				\
+		static const u8 d[] = { seq };				\
+									\
+		mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
+	})
+
+static void sharp_ls060_reset(struct sharp_ls060 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int sharp_ls060_on(struct sharp_ls060 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	ret = dsi_dcs_write_seq(dsi, 0xbb, 0x13);
+	if (ret < 0) {
+		dev_err(dev, "Failed to send command: %d\n", ret);
+		return ret;
+	}
+
+	ret = dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
+	if (ret < 0) {
+		dev_err(dev, "Failed to send command: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(120);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+	msleep(50);
+
+	return 0;
+}
+
+static int sharp_ls060_off(struct sharp_ls060 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+	usleep_range(2000, 3000);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(121);
+
+	return 0;
+}
+
+static int sharp_ls060_prepare(struct drm_panel *panel)
+{
+	struct sharp_ls060 *ctx = to_sharp_ls060(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_enable(ctx->vddi_supply);
+	if (ret < 0)
+		return ret;
+
+	ret = regulator_enable(ctx->avdd_supply);
+	if (ret < 0)
+		goto err_avdd;
+
+	usleep_range(1000, 2000);
+
+	ret = regulator_enable(ctx->avee_supply);
+	if (ret < 0)
+		goto err_avee;
+
+	usleep_range(10000, 11000);
+
+	ret = regulator_enable(ctx->vddh_supply);
+	if (ret < 0)
+		goto err_vddh;
+
+	usleep_range(10000, 11000);
+
+	sharp_ls060_reset(ctx);
+
+	ret = sharp_ls060_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		goto err_on;
+	}
+
+	ctx->prepared = true;
+
+	return 0;
+
+err_on:
+	regulator_disable(ctx->vddh_supply);
+
+	usleep_range(10000, 11000);
+
+err_vddh:
+	regulator_disable(ctx->avee_supply);
+
+err_avee:
+	regulator_disable(ctx->avdd_supply);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+err_avdd:
+	regulator_disable(ctx->vddi_supply);
+
+	return ret;
+}
+
+static int sharp_ls060_unprepare(struct drm_panel *panel)
+{
+	struct sharp_ls060 *ctx = to_sharp_ls060(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = sharp_ls060_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	regulator_disable(ctx->vddh_supply);
+
+	usleep_range(10000, 11000);
+
+	regulator_disable(ctx->avee_supply);
+	regulator_disable(ctx->avdd_supply);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_disable(ctx->vddi_supply);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode sharp_ls060_mode = {
+	.clock = (1080 + 96 + 16 + 64) * (1920 + 4 + 1 + 16) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 96,
+	.hsync_end = 1080 + 96 + 16,
+	.htotal = 1080 + 96 + 16 + 64,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 4,
+	.vsync_end = 1920 + 4 + 1,
+	.vtotal = 1920 + 4 + 1 + 16,
+	.width_mm = 75,
+	.height_mm = 132,
+};
+
+static int sharp_ls060_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &sharp_ls060_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs sharp_ls060_panel_funcs = {
+	.prepare = sharp_ls060_prepare,
+	.unprepare = sharp_ls060_unprepare,
+	.get_modes = sharp_ls060_get_modes,
+};
+
+static int sharp_ls060_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct sharp_ls060 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->vddi_supply = devm_regulator_get(dev, "vddi");
+	if (IS_ERR(ctx->vddi_supply))
+		return PTR_ERR(ctx->vddi_supply);
+
+	ctx->vddh_supply = devm_regulator_get(dev, "vddh");
+	if (IS_ERR(ctx->vddh_supply))
+		return PTR_ERR(ctx->vddh_supply);
+
+	ctx->avdd_supply = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(ctx->avdd_supply))
+		return PTR_ERR(ctx->avdd_supply);
+
+	ctx->avee_supply = devm_regulator_get(dev, "avee");
+	if (IS_ERR(ctx->avee_supply))
+		return PTR_ERR(ctx->avee_supply);
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &sharp_ls060_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sharp_ls060_remove(struct mipi_dsi_device *dsi)
+{
+	struct sharp_ls060 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id sharp_ls060t1sx01_of_match[] = {
+	{ .compatible = "sharp,ls060t1sx01" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sharp_ls060t1sx01_of_match);
+
+static struct mipi_dsi_driver sharp_ls060_driver = {
+	.probe = sharp_ls060_probe,
+	.remove = sharp_ls060_remove,
+	.driver = {
+		.name = "panel-sharp-ls060t1sx01",
+		.of_match_table = sharp_ls060t1sx01_of_match,
+	},
+};
+module_mipi_dsi_driver(sharp_ls060_driver);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("DRM driver for Sharp LS060T1SX01 1080p video mode dsi panel");
+MODULE_LICENSE("GPL v2");
-- 
2.33.0

