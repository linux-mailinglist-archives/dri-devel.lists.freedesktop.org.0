Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2E76EB9B7
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 16:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E14610E311;
	Sat, 22 Apr 2023 14:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C4D89CC1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 15:43:33 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso1224450f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682091811; x=1684683811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGmx6aas+6lrsSGcmDihsoNQav0yXnIFp4ZHfNMih4U=;
 b=XQEqrB7D4+hRhJ027yGJ0HWt4zxFwVBNJOCWW9a4Ko9jNlTXsoHqfatnnZv4KbmSUv
 NFMw2xzj3dClFWKHUE7WkWyGapw66EovCOK5s4LFrrqxnOUiQhzv7ZIifMpHFFAoqqeC
 4jONrwQmvTA72ZsmzBxh06VFtTXkQ00KzGLqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682091811; x=1684683811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGmx6aas+6lrsSGcmDihsoNQav0yXnIFp4ZHfNMih4U=;
 b=FIIGRn8j4kA2TDBtTxRO5zN0CLNfn+G6oKQkvqkgfLBwPluHSXUsRJFqIfYPY56wlB
 mlxS1CSrxZRcGdGbwUI/g0vQ1hQC6MA+8t0SmHCn6DxRGr7pm3KQ9tqp8dNVCCLJ/RFc
 2cK2g/l5W0wog8yZOiSG7sawOco57M4DDyH/00MP2EeC/gH03ZXKYdBDbtfDFIwrjFtw
 oQ7yon13cASjOiNtojBM8M8r2fqSBx89aefBHrJLXPnfFOaZT/4Wv9WOzYKXZ1c84IgK
 nPn8q+meNEEds6MUtVfRXpbTv3HHfPfyM+7eGg2lidnFH94lX4xhRfVJt94dlcCbH50q
 /D2Q==
X-Gm-Message-State: AAQBX9fiC5dRgmZ36D9GKFdriamp+43/BLAQ8p7kvcXFSnKwAGNtb3Gm
 GBMlBQey3bClRvaBVn1jYktCgQ==
X-Google-Smtp-Source: AKy350aGGULBOGUdPrSSkCcZp8QgQ6rXi1cHh9ZGg+Qa7OjS9eijChMRWNq5t6UygaFMYn59hftNTg==
X-Received: by 2002:a5d:4692:0:b0:2cf:edf0:f8c with SMTP id
 u18-20020a5d4692000000b002cfedf00f8cmr3821038wrq.29.1682091811269; 
 Fri, 21 Apr 2023 08:43:31 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.127.129])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b002e51195a3e2sm4651609wrw.79.2023.04.21.08.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 08:43:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] drm/panel: Add Synaptics R63353 panel driver
Date: Fri, 21 Apr 2023 17:43:03 +0200
Message-Id: <20230421154308.527128-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
References: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Apr 2023 14:45:29 +0000
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 michael@amarulasolutions.com, Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Trimarchi <michael@amarulasolutions.com>

The LS068B3SX02 panel is based on the Synaptics R63353 Controller.
Add a driver for it.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-synaptics-r63353.c    | 376 ++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-synaptics-r63353.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d2fbd0e261d..cfe4f5013632 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6682,6 +6682,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ste,mcde.yaml
 F:	drivers/gpu/drm/mcde/
 
+DRM DRIVER FOR SYNAPTICS R63353 PANELS
+M:	Michael Trimarchi <michael@amarulasolutions.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
+F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
+
 DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 8eeee71c0000..e6c4ec4f0cab 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -677,6 +677,14 @@ config DRM_PANEL_SITRONIX_ST7789V
 	  Say Y here if you want to enable support for the Sitronix
 	  ST7789V controller for 240x320 LCD panels
 
+config DRM_PANEL_SYNAPTICS_R63353
+	tristate "Synaptics R63353-based panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y if you want to enable support for panels based on the
+	  Synaptics R63353 controller.
+
 config DRM_PANEL_SONY_ACX565AKM
 	tristate "Sony ACX565AKM panel"
 	depends on GPIOLIB && OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index c05aa9e23907..dea6177e3d95 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) += panel-sharp-ls060t1sx01.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
+obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
 obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
new file mode 100644
index 000000000000..a288ba3e211f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synaptics R63353 Controller driver
+ *
+ * Copyright (C) 2020 BSH Hausgerate GmbH
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/fb.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/media-bus-format.h>
+
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+#define R63353_INSTR(...) { \
+		.len = sizeof((u8[]) {__VA_ARGS__}), \
+		.data = (u8[]){__VA_ARGS__} \
+	}
+
+struct r63353_instr {
+	size_t len;
+	const u8 *data;
+};
+
+static const struct r63353_instr sharp_ls068b3sx02_init[] = {
+	R63353_INSTR(0x51, 0xff),
+	R63353_INSTR(0x53, 0x0c),
+	R63353_INSTR(0x55, 0x00),
+	R63353_INSTR(0x84, 0x00),
+	R63353_INSTR(0x29),
+};
+
+struct r63353_desc {
+	const char *name;
+	const struct r63353_instr *init;
+	const size_t init_length;
+	const struct drm_display_mode *mode;
+	u32 width_mm;
+	u32 height_mm;
+};
+
+struct r63353_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *dsi;
+
+	struct gpio_desc *reset_gpio;
+	struct regulator *dvdd;
+	struct regulator *avdd;
+
+	bool prepared;
+	struct r63353_desc *pdata;
+};
+
+static inline struct r63353_panel *to_r63353_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct r63353_panel, base);
+}
+
+static int r63353_panel_power_on(struct r63353_panel *rpanel)
+{
+	struct mipi_dsi_device *dsi = rpanel->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = regulator_enable(rpanel->avdd);
+	if (ret) {
+		dev_err(dev, "Failed to enable avdd regulator (%d)\n", ret);
+		return ret;
+	}
+
+	usleep_range(1000, 2000);
+
+	ret = regulator_enable(rpanel->dvdd);
+	if (ret) {
+		dev_err(dev, "Failed to enable dvdd regulator (%d)\n", ret);
+		regulator_disable(rpanel->avdd);
+		return ret;
+	}
+
+	gpiod_set_value(rpanel->reset_gpio, 0);
+	usleep_range(5000, 10000);
+	gpiod_set_value(rpanel->reset_gpio, 1);
+	msleep(120);
+
+	return 0;
+}
+
+static int r63353_panel_power_off(struct r63353_panel *rpanel)
+{
+	gpiod_set_value(rpanel->reset_gpio, 0);
+	regulator_disable(rpanel->dvdd);
+	regulator_disable(rpanel->avdd);
+
+	return 0;
+}
+
+static int r63353_panel_activate(struct r63353_panel *rpanel)
+{
+	struct mipi_dsi_device *dsi = rpanel->dsi;
+	struct device *dev = &dsi->dev;
+	int i, ret;
+
+	ret = mipi_dsi_dcs_soft_reset(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
+		goto fail;
+	}
+
+	usleep_range(15000, 17000);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
+		goto fail;
+	}
+
+	for (i = 0; i < rpanel->pdata->init_length; i++) {
+		const struct r63353_instr *instr = &rpanel->pdata->init[i];
+
+		ret = mipi_dsi_dcs_write_buffer(dsi, instr->data, instr->len);
+		if (ret < 0)
+			return ret;
+	}
+
+	msleep(120);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
+		goto fail;
+	}
+
+	usleep_range(5000, 10000);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display ON (%d)\n", ret);
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	gpiod_set_value(rpanel->reset_gpio, 0);
+
+	return ret;
+}
+
+static int r63353_panel_prepare(struct drm_panel *panel)
+{
+	struct r63353_panel *rpanel = to_r63353_panel(panel);
+	struct mipi_dsi_device *dsi = rpanel->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (rpanel->prepared)
+		return 0;
+
+	dev_dbg(dev, "Preparing\n");
+
+	ret = r63353_panel_power_on(rpanel);
+	if (ret)
+		return ret;
+
+	ret = r63353_panel_activate(rpanel);
+	if (ret) {
+		r63353_panel_power_off(rpanel);
+		return ret;
+	}
+
+	rpanel->prepared = true;
+
+	dev_dbg(dev, "Prepared\n");
+	return 0;
+}
+
+static int r63353_panel_deactivate(struct r63353_panel *rpanel)
+{
+	struct mipi_dsi_device *dsi = rpanel->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display OFF (%d)\n", ret);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int r63353_panel_unprepare(struct drm_panel *panel)
+{
+	struct r63353_panel *rpanel = to_r63353_panel(panel);
+
+	if (!rpanel->prepared)
+		return 0;
+
+	r63353_panel_deactivate(rpanel);
+	r63353_panel_power_off(rpanel);
+
+	rpanel->prepared = false;
+
+	return 0;
+}
+
+static const struct drm_display_mode sharp_ls068b3sx02_timing = {
+	.clock = 70000,
+	.hdisplay = 640,
+	.hsync_start = 640 + 35,
+	.hsync_end = 640 + 35 + 2,
+	.htotal = 640 + 35 + 2 + 150,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 2,
+	.vsync_end = 1280 + 2 + 4,
+	.vtotal = 1280 + 2 + 4 + 0,
+};
+
+static int r63353_panel_get_modes(struct drm_panel *panel,
+				  struct drm_connector *connector)
+{
+	struct r63353_panel *rpanel = to_r63353_panel(panel);
+	struct drm_display_mode *mode;
+	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	mode = drm_mode_duplicate(connector->dev, rpanel->pdata->mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = rpanel->pdata->width_mm;
+	connector->display_info.height_mm = rpanel->pdata->height_mm;
+
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &bus_format, 1);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs r63353_panel_funcs = {
+	.prepare = r63353_panel_prepare,
+	.unprepare = r63353_panel_unprepare,
+	.get_modes = r63353_panel_get_modes,
+};
+
+static int r63353_panel_probe(struct mipi_dsi_device *dsi)
+{
+	int ret = 0;
+	struct device *dev = &dsi->dev;
+	struct r63353_panel *panel;
+
+	panel = devm_kzalloc(&dsi->dev, sizeof(*panel), GFP_KERNEL);
+	if (!panel)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, panel);
+	panel->dsi = dsi;
+	panel->pdata = (struct r63353_desc *)of_device_get_match_data(dev);
+
+	dev_info(dev, "Panel %s\n", panel->pdata->name);
+
+	dsi->lanes = 2;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM |
+			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	panel->dvdd = devm_regulator_get(dev, "dvdd");
+	if (IS_ERR(panel->dvdd))
+		return PTR_ERR(panel->dvdd);
+	panel->avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(panel->avdd))
+		return PTR_ERR(panel->avdd);
+
+	panel->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(panel->reset_gpio)) {
+		dev_err(dev, "failed to get RESET GPIO\n");
+		return PTR_ERR(panel->reset_gpio);
+	}
+	gpiod_set_value(panel->reset_gpio, 0);
+
+	drm_panel_init(&panel->base, dev, &r63353_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	panel->base.prepare_prev_first = true;
+	ret = drm_panel_of_backlight(&panel->base);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&panel->base);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
+		drm_panel_remove(&panel->base);
+		return ret;
+	}
+
+	return ret;
+}
+
+static void r63353_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct r63353_panel *rpanel = mipi_dsi_get_drvdata(dsi);
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(dev, "Failed to detach from host (%d)\n", ret);
+
+	drm_panel_remove(&rpanel->base);
+}
+
+static void r63353_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct r63353_panel *rpanel = mipi_dsi_get_drvdata(dsi);
+
+	r63353_panel_unprepare(&rpanel->base);
+}
+
+static const struct r63353_desc sharp_ls068b3sx02_data = {
+	.name = "Sharp LS068B3SX02",
+	.mode = &sharp_ls068b3sx02_timing,
+	.init = sharp_ls068b3sx02_init,
+	.init_length = ARRAY_SIZE(sharp_ls068b3sx02_init),
+	.width_mm = 68,
+	.height_mm = 159,
+};
+
+static const struct of_device_id r63353_of_match[] = {
+	{ .compatible = "sharp,ls068b3sx02", .data = &sharp_ls068b3sx02_data },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, r63353_of_match);
+
+static struct mipi_dsi_driver r63353_panel_driver = {
+	.driver = {
+		   .name = "r63353-dsi",
+		   .of_match_table = r63353_of_match,
+	},
+	.probe = r63353_panel_probe,
+	.remove = r63353_panel_remove,
+	.shutdown = r63353_panel_shutdown,
+};
+
+module_mipi_dsi_driver(r63353_panel_driver);
+
+MODULE_AUTHOR("Matthias Proske <Matthias.Proske@bshg.com>");
+MODULE_AUTHOR("Michael Trimarchi <michael@amarulasolutions.com>");
+MODULE_DESCRIPTION("Synaptics R63353 Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.32.0

