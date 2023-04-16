Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F06E40A5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E8810E370;
	Mon, 17 Apr 2023 07:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA2710E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:16:42 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94f32588c13so43569566b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681651001; x=1684243001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Q6rE3PfNCPLK1OsLiKp0cQzaJ0RGZfM7mv5Hv8SmKU=;
 b=F8tEvyzIvpzbjYr6Q1/q7uWYtVNIqmUV/GgLrzZUzklH7tEo0/xsNFQ33Qgb4rInw7
 ZjyDGWYXoMa6bFboaR5G2CdLh+fuxs/E7kJSWn06G8ibN8UOaiGZXNvpbDkJz0OTniH7
 5hQqoBOwno3DrCRHO0wzy4Lj0eqh1Sl44xAH8Ah4uH+srSmuJWMr+ngs2WyKqWVPNVPE
 jkt9PsjkgUhmlgHhxYC9PDLNEnydpUDCG3vJXMUlAcyfuL5tsdx+ZaGwu1tplghzeQwc
 r6SlvZpDiJqr2pNyXTu61VUJ1DZiw6005Rnj6bpiNB3Do5r9fXf/tKI66Ja70JKOOcNG
 p9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681651001; x=1684243001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Q6rE3PfNCPLK1OsLiKp0cQzaJ0RGZfM7mv5Hv8SmKU=;
 b=ZgIwDcPBxxlRlQ8xTgaQKG4g5pUUpSecehpafqZp/6bsxwB4k9aCPq8xYkgV0/j6TD
 qmpdeF1FBYdm2EUoxQvGbbUNhTf8Fmcm5ZMbLD4VELPAgKtahRE/Dcy9nhWNfWmuOs69
 bdRITY4Fngh/Rl4SjMciaW9JCj2urnO26AC5q8MMBrd0lWzp14kHC0cxEDJeLmnmULnc
 n/aZ4gqZLLCgUBIlvHCyyIOdcQQ4vBmZ3F/bmm6b/L2b7Y02Wli/pkE+qgQSg0lvd7DP
 LKfmi37DAkIrRPFNZ/clpAKQfc0lj3RFhGJRqtQPzfIYS+Ug27PkWN11SR1nabskC/O0
 Gedw==
X-Gm-Message-State: AAQBX9eGwH2ZVW/cJTMnXF9A4mmgx/rP0Eq62FRwCtHBUCgyDY1CQrr2
 mAzQPeQ2JnJzaTLd/nkGTDE=
X-Google-Smtp-Source: AKy350awq4W4Ph+ZFJtXPJSrRs3pkJU433dsRLlg5bL2fqgFm+g9OAaCXaD3g2M5XG09xP+kBDZsog==
X-Received: by 2002:aa7:c907:0:b0:504:78aa:4f2d with SMTP id
 b7-20020aa7c907000000b0050478aa4f2dmr12890319edt.0.1681651000610; 
 Sun, 16 Apr 2023 06:16:40 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05640204c900b005068d7ccfb0sm2396594edw.83.2023.04.16.06.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 06:16:40 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v3 2/3] drm/panel: Add Samsung S6D7AA0 panel controller driver
Date: Sun, 16 Apr 2023 15:16:31 +0200
Message-Id: <20230416131632.31673-3-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416131632.31673-1-aweber.kernel@gmail.com>
References: <20230416131632.31673-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org,
 Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initial driver for S6D7AA0-controlled panels, currently only for the
LSL080AL02 panel used in the Samsung Galaxy Tab 3 8.0 family of tablets.

It should be possible to extend this driver to work with other panels
using this IC.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changed in v2:
 - Removed unused panel_name property from desc struct
---
 drivers/gpu/drm/panel/Kconfig                 |   7 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 395 ++++++++++++++++++
 3 files changed, 403 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 8eeee71c0000..2ce9d1a45625 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -532,6 +532,13 @@ config DRM_PANEL_SAMSUNG_S6D27A1
 	  This panel can be found in Samsung Galaxy Ace 2
 	  GT-I8160 mobile phone.
 
+config DRM_PANEL_SAMSUNG_S6D7AA0
+	tristate "Samsung S6D7AA0 MIPI-DSI video mode panel controller"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DSI
+	select VIDEOMODE_HELPERS
+
 config DRM_PANEL_SAMSUNG_S6E3HA2
 	tristate "Samsung S6E3HA2 DSI video mode panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index c05aa9e23907..193f3067865d 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
new file mode 100644
index 000000000000..408e4082de74
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung S6D7AA0 MIPI-DSI TFT LCD controller drm_panel driver.
+ *
+ * Copyright (C) 2022 Artur Weber <aweber.kernel@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+
+#include <video/mipi_display.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+/* Manufacturer command set */
+#define CMD_BL_CTL		0xc3
+#define CMD_OTP_RELOAD		0xd0
+#define CMD_PASSWD1		0xf0
+#define CMD_PASSWD2		0xf1
+#define CMD_PASSWD3		0xfc
+
+struct s6d7aa0 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator *enable_supply;
+	const struct s6d7aa0_panel_desc *desc;
+	bool prepared;
+};
+
+struct s6d7aa0_panel_desc {
+	int (*init_func)(struct s6d7aa0 *ctx);
+	const struct drm_display_mode drm_mode;
+	unsigned long mode_flags;
+	u32 bus_flags;
+	bool use_passwd3;
+};
+
+static inline struct s6d7aa0 *panel_to_s6d7aa0(struct drm_panel *panel)
+{
+	return container_of(panel, struct s6d7aa0, panel);
+}
+
+static void s6d7aa0_reset(struct s6d7aa0 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(50);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	msleep(50);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(50);
+}
+
+static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+
+	if (lock) {
+		mipi_dsi_dcs_write_seq(dsi, CMD_PASSWD1, 0xa5, 0xa5);
+		mipi_dsi_dcs_write_seq(dsi, CMD_PASSWD2, 0xa5, 0xa5);
+		if (ctx->desc->use_passwd3)
+			mipi_dsi_dcs_write_seq(dsi, CMD_PASSWD3, 0x5a, 0x5a);
+	} else {
+		mipi_dsi_dcs_write_seq(dsi, CMD_PASSWD1, 0x5a, 0x5a);
+		mipi_dsi_dcs_write_seq(dsi, CMD_PASSWD2, 0x5a, 0x5a);
+		if (ctx->desc->use_passwd3)
+			mipi_dsi_dcs_write_seq(dsi, CMD_PASSWD3, 0xa5, 0xa5);
+	}
+
+	return 0;
+}
+
+static int s6d7aa0_bl_ctl_on(struct s6d7aa0 *ctx, bool enable)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+
+	if (enable)
+		mipi_dsi_dcs_write_seq(dsi, CMD_BL_CTL, 0x40, 0x00, 0x28);
+	else
+		mipi_dsi_dcs_write_seq(dsi, CMD_BL_CTL, 0x40, 0x00, 0x20);
+
+	return 0;
+}
+
+static int s6d7aa0_on(struct s6d7aa0 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	s6d7aa0_reset(ctx);
+
+	ret = ctx->desc->init_func(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s6d7aa0_off(struct s6d7aa0 *ctx)
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
+	msleep(64);
+
+	ret = s6d7aa0_bl_ctl_on(ctx, false);
+	if (ret < 0) {
+		dev_err(dev, "Failed to disable backlight control: %d\n", ret);
+		return ret;
+	}
+	usleep_range(1000, 1500);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(120);
+
+	return 0;
+}
+
+static int s6d7aa0_prepare(struct drm_panel *panel)
+{
+	struct s6d7aa0 *ctx = panel_to_s6d7aa0(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_enable(ctx->enable_supply);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = s6d7aa0_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	ctx->prepared = true;
+	return 0;
+}
+
+static int s6d7aa0_disable(struct drm_panel *panel)
+{
+	struct s6d7aa0 *ctx = panel_to_s6d7aa0(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = s6d7aa0_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	return 0;
+}
+
+static int s6d7aa0_unprepare(struct drm_panel *panel)
+{
+	struct s6d7aa0 *ctx = panel_to_s6d7aa0(panel);
+
+	if (!ctx->prepared)
+		return 0;
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_disable(ctx->enable_supply);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+/* Initialization code and structures for LSL080AL02 panel */
+
+static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	usleep_range(20000, 25000);
+
+	ret = s6d7aa0_lock(ctx, false);
+	if (ret < 0) {
+		dev_err(dev, "Failed to unlock registers: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, CMD_OTP_RELOAD, 0x00, 0x10);
+	usleep_range(1000, 1500);
+
+	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x10); /* SEQ_B6_PARAM_8_R01 */
+
+	ret = s6d7aa0_bl_ctl_on(ctx, true);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable backlight control: %d\n", ret);
+		return ret;
+	}
+	usleep_range(5000, 6000);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x04);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+
+	msleep(120);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+
+	ret = s6d7aa0_lock(ctx, true);
+	if (ret < 0) {
+		dev_err(dev, "Failed to lock registers: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+};
+
+static const struct drm_display_mode s6d7aa0_lsl080al02_mode = {
+	.clock = (800 + 16 + 4 + 140) * (1280 + 8 + 4 + 4) * 60 / 1000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 16,
+	.hsync_end = 800 + 16 + 4,
+	.htotal = 800 + 16 + 4 + 140,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 8,
+	.vsync_end = 1280 + 8 + 4,
+	.vtotal = 1280 + 8 + 4 + 4,
+	.width_mm = 108,
+	.height_mm = 173,
+};
+
+static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
+	.init_func = s6d7aa0_lsl080al02_init,
+	.drm_mode = s6d7aa0_lsl080al02_mode,
+	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.use_passwd3 = false,
+};
+
+static int s6d7aa0_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	struct s6d7aa0 *ctx;
+
+	ctx = container_of(panel, struct s6d7aa0, panel);
+	if (!ctx)
+		return -EINVAL;
+
+	mode = drm_mode_duplicate(connector->dev, &ctx->desc->drm_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bus_flags = ctx->desc->bus_flags;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs s6d7aa0_panel_funcs = {
+	.disable = s6d7aa0_disable,
+	.prepare = s6d7aa0_prepare,
+	.unprepare = s6d7aa0_unprepare,
+	.get_modes = s6d7aa0_get_modes,
+};
+
+static int s6d7aa0_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct s6d7aa0 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->desc = of_device_get_match_data(dev);
+	if (!ctx->desc)
+		return -ENODEV;
+
+	ctx->enable_supply = devm_regulator_get(dev, "enable");
+	if (IS_ERR(ctx->enable_supply))
+		return dev_err_probe(dev, PTR_ERR(ctx->enable_supply),
+				     "Failed to get enable supply\n");
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
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
+		| ctx->desc->mode_flags;
+
+	drm_panel_init(&ctx->panel, dev, &s6d7aa0_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret) {
+		dev_err_probe(dev, ret, "Could not find backlight\n");
+		return ret;
+	}
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
+static void s6d7aa0_remove(struct mipi_dsi_device *dsi)
+{
+	struct s6d7aa0 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id s6d7aa0_of_match[] = {
+	{
+		.compatible = "samsung,s6d7aa0-lsl080al02",
+		.data = &s6d7aa0_lsl080al02_desc
+	},
+	{ /* sentinel */ }
+};
+
+static struct mipi_dsi_driver s6d7aa0_driver = {
+	.probe = s6d7aa0_probe,
+	.remove = s6d7aa0_remove,
+	.driver = {
+		.name = "panel-samsung-s6d7aa0",
+		.of_match_table = s6d7aa0_of_match,
+	},
+};
+module_mipi_dsi_driver(s6d7aa0_driver);
+
+MODULE_AUTHOR("Artur Weber <aweber.kernel@gmail.com>");
+MODULE_DESCRIPTION("Samsung S6D7AA0 MIPI-DSI LCD controller driver");
+MODULE_LICENSE("GPL");
-- 
2.40.0

