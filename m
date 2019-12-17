Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F91239F8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 23:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9576E101;
	Tue, 17 Dec 2019 22:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064EA6E143
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 22:28:24 +0000 (UTC)
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]
 helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ihLKI-0001H9-AA; Tue, 17 Dec 2019 23:28:22 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/panel: add panel driver for Leadtek LTK500HD1829
Date: Tue, 17 Dec 2019 23:28:12 +0100
Message-Id: <20191217222812.19872-3-heiko@sntech.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191217222812.19872-1-heiko@sntech.de>
References: <20191217222812.19872-1-heiko@sntech.de>
MIME-Version: 1.0
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The LTK500HD1829 is 5.5" DSI display.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-leadtek-ltk500hd1829.c    | 533 ++++++++++++++++++
 3 files changed, 545 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index fb1ded47677e..2ba8f4241680 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -98,6 +98,17 @@ config DRM_PANEL_KINGDISPLAY_KD097D04
 	  24 bit RGB per pixel. It provides a MIPI DSI interface to
 	  the host and has a built-in LED backlight.
 
+config DRM_PANEL_LEADTEK_LTK500HD1829
+	tristate "Leadtek LTK500HD1829 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Kingdisplay kd097d04
+	  TFT-LCD modules. The panel has a 1536x2048 resolution and uses
+	  24 bit RGB per pixel. It provides a MIPI DSI interface to
+	  the host and has a built-in LED backlight.
+
 config DRM_PANEL_SAMSUNG_LD9040
 	tristate "Samsung LD9040 RGB/SPI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 71d7722146a7..42d6679b156d 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
 obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) += panel-kingdisplay-kd097d04.o
+obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
new file mode 100644
index 000000000000..e3b4fce357e1
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -0,0 +1,533 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2019 Theobroma Systems Design und Consulting GmbH
+ *
+ * base on panel-kingdisplay-kd097d04.c
+ * Copyright (c) 2017, Fuzhou Rockchip Electronics Co., Ltd
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
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+struct ltk500hd1829 {
+	struct device *dev;
+	struct drm_panel panel;
+	struct gpio_desc *reset_gpio;
+	struct regulator *vcc;
+	struct regulator *iovcc;
+	bool prepared;
+};
+
+struct ltk500hd1829_cmd {
+	char cmd;
+	char data;
+};
+
+/*
+ * There is no description in the Reference Manual about these commands.
+ * We received them from the vendor, so just use them as is.
+ */
+static const struct ltk500hd1829_cmd init_code[] = {
+	{ 0xE0, 0x00 },
+	{ 0xE1, 0x93 },
+	{ 0xE2, 0x65 },
+	{ 0xE3, 0xF8 },
+	{ 0x80, 0x03 },
+	{ 0xE0, 0x04 },
+	{ 0x2D, 0x03 },
+	{ 0xE0, 0x01 },
+	{ 0x00, 0x00 },
+	{ 0x01, 0xB6 },
+	{ 0x03, 0x00 },
+	{ 0x04, 0xC5 },
+	{ 0x17, 0x00 },
+	{ 0x18, 0xBF },
+	{ 0x19, 0x01 },
+	{ 0x1A, 0x00 },
+	{ 0x1B, 0xBF },
+	{ 0x1C, 0x01 },
+	{ 0x1F, 0x7C },
+	{ 0x20, 0x26 },
+	{ 0x21, 0x26 },
+	{ 0x22, 0x4E },
+	{ 0x37, 0x09 },
+	{ 0x38, 0x04 },
+	{ 0x39, 0x08 },
+	{ 0x3A, 0x1F },
+	{ 0x3B, 0x1F },
+	{ 0x3C, 0x78 },
+	{ 0x3D, 0xFF },
+	{ 0x3E, 0xFF },
+	{ 0x3F, 0x00 },
+	{ 0x40, 0x04 },
+	{ 0x41, 0xA0 },
+	{ 0x43, 0x0F },
+	{ 0x44, 0x0A },
+	{ 0x45, 0x24 },
+	{ 0x55, 0x01 },
+	{ 0x56, 0x01 },
+	{ 0x57, 0xA5 },
+	{ 0x58, 0x0A },
+	{ 0x59, 0x4A },
+	{ 0x5A, 0x38 },
+	{ 0x5B, 0x10 },
+	{ 0x5C, 0x19 },
+	{ 0x5D, 0x7C },
+	{ 0x5E, 0x64 },
+	{ 0x5F, 0x54 },
+	{ 0x60, 0x48 },
+	{ 0x61, 0x44 },
+	{ 0x62, 0x35 },
+	{ 0x63, 0x3A },
+	{ 0x64, 0x24 },
+	{ 0x65, 0x3B },
+	{ 0x66, 0x39 },
+	{ 0x67, 0x37 },
+	{ 0x68, 0x56 },
+	{ 0x69, 0x41 },
+	{ 0x6A, 0x47 },
+	{ 0x6B, 0x2F },
+	{ 0x6C, 0x23 },
+	{ 0x6D, 0x13 },
+	{ 0x6E, 0x02 },
+	{ 0x6F, 0x08 },
+	{ 0x70, 0x7C },
+	{ 0x71, 0x64 },
+	{ 0x72, 0x54 },
+	{ 0x73, 0x48 },
+	{ 0x74, 0x44 },
+	{ 0x75, 0x35 },
+	{ 0x76, 0x3A },
+	{ 0x77, 0x22 },
+	{ 0x78, 0x3B },
+	{ 0x79, 0x39 },
+	{ 0x7A, 0x38 },
+	{ 0x7B, 0x52 },
+	{ 0x7C, 0x41 },
+	{ 0x7D, 0x47 },
+	{ 0x7E, 0x2F },
+	{ 0x7F, 0x23 },
+	{ 0x80, 0x13 },
+	{ 0x81, 0x02 },
+	{ 0x82, 0x08 },
+	{ 0xE0, 0x02 },
+	{ 0x00, 0x57 },
+	{ 0x01, 0x77 },
+	{ 0x02, 0x44 },
+	{ 0x03, 0x46 },
+	{ 0x04, 0x48 },
+	{ 0x05, 0x4A },
+	{ 0x06, 0x4C },
+	{ 0x07, 0x4E },
+	{ 0x08, 0x50 },
+	{ 0x09, 0x55 },
+	{ 0x0A, 0x52 },
+	{ 0x0B, 0x55 },
+	{ 0x0C, 0x55 },
+	{ 0x0D, 0x55 },
+	{ 0x0E, 0x55 },
+	{ 0x0F, 0x55 },
+	{ 0x10, 0x55 },
+	{ 0x11, 0x55 },
+	{ 0x12, 0x55 },
+	{ 0x13, 0x40 },
+	{ 0x14, 0x55 },
+	{ 0x15, 0x55 },
+	{ 0x16, 0x57 },
+	{ 0x17, 0x77 },
+	{ 0x18, 0x45 },
+	{ 0x19, 0x47 },
+	{ 0x1A, 0x49 },
+	{ 0x1B, 0x4B },
+	{ 0x1C, 0x4D },
+	{ 0x1D, 0x4F },
+	{ 0x1E, 0x51 },
+	{ 0x1F, 0x55 },
+	{ 0x20, 0x53 },
+	{ 0x21, 0x55 },
+	{ 0x22, 0x55 },
+	{ 0x23, 0x55 },
+	{ 0x24, 0x55 },
+	{ 0x25, 0x55 },
+	{ 0x26, 0x55 },
+	{ 0x27, 0x55 },
+	{ 0x28, 0x55 },
+	{ 0x29, 0x41 },
+	{ 0x2A, 0x55 },
+	{ 0x2B, 0x55 },
+	{ 0x2C, 0x57 },
+	{ 0x2D, 0x77 },
+	{ 0x2E, 0x4F },
+	{ 0x2F, 0x4D },
+	{ 0x30, 0x4B },
+	{ 0x31, 0x49 },
+	{ 0x32, 0x47 },
+	{ 0x33, 0x45 },
+	{ 0x34, 0x41 },
+	{ 0x35, 0x55 },
+	{ 0x36, 0x53 },
+	{ 0x37, 0x55 },
+	{ 0x38, 0x55 },
+	{ 0x39, 0x55 },
+	{ 0x3A, 0x55 },
+	{ 0x3B, 0x55 },
+	{ 0x3C, 0x55 },
+	{ 0x3D, 0x55 },
+	{ 0x3E, 0x55 },
+	{ 0x3F, 0x51 },
+	{ 0x40, 0x55 },
+	{ 0x41, 0x55 },
+	{ 0x42, 0x57 },
+	{ 0x43, 0x77 },
+	{ 0x44, 0x4E },
+	{ 0x45, 0x4C },
+	{ 0x46, 0x4A },
+	{ 0x47, 0x48 },
+	{ 0x48, 0x46 },
+	{ 0x49, 0x44 },
+	{ 0x4A, 0x40 },
+	{ 0x4B, 0x55 },
+	{ 0x4C, 0x52 },
+	{ 0x4D, 0x55 },
+	{ 0x4E, 0x55 },
+	{ 0x4F, 0x55 },
+	{ 0x50, 0x55 },
+	{ 0x51, 0x55 },
+	{ 0x52, 0x55 },
+	{ 0x53, 0x55 },
+	{ 0x54, 0x55 },
+	{ 0x55, 0x50 },
+	{ 0x56, 0x55 },
+	{ 0x57, 0x55 },
+	{ 0x58, 0x40 },
+	{ 0x59, 0x00 },
+	{ 0x5A, 0x00 },
+	{ 0x5B, 0x10 },
+	{ 0x5C, 0x09 },
+	{ 0x5D, 0x30 },
+	{ 0x5E, 0x01 },
+	{ 0x5F, 0x02 },
+	{ 0x60, 0x30 },
+	{ 0x61, 0x03 },
+	{ 0x62, 0x04 },
+	{ 0x63, 0x06 },
+	{ 0x64, 0x6A },
+	{ 0x65, 0x75 },
+	{ 0x66, 0x0F },
+	{ 0x67, 0xB3 },
+	{ 0x68, 0x0B },
+	{ 0x69, 0x06 },
+	{ 0x6A, 0x6A },
+	{ 0x6B, 0x10 },
+	{ 0x6C, 0x00 },
+	{ 0x6D, 0x04 },
+	{ 0x6E, 0x04 },
+	{ 0x6F, 0x88 },
+	{ 0x70, 0x00 },
+	{ 0x71, 0x00 },
+	{ 0x72, 0x06 },
+	{ 0x73, 0x7B },
+	{ 0x74, 0x00 },
+	{ 0x75, 0xBC },
+	{ 0x76, 0x00 },
+	{ 0x77, 0x05 },
+	{ 0x78, 0x2E },
+	{ 0x79, 0x00 },
+	{ 0x7A, 0x00 },
+	{ 0x7B, 0x00 },
+	{ 0x7C, 0x00 },
+	{ 0x7D, 0x03 },
+	{ 0x7E, 0x7B },
+	{ 0xE0, 0x04 },
+	{ 0x09, 0x10 },
+	{ 0x2B, 0x2B },
+	{ 0x2E, 0x44 },
+	{ 0xE0, 0x00 },
+	{ 0xE6, 0x02 },
+	{ 0xE7, 0x02 },
+	{ 0x35, 0x00 },
+};
+
+static inline
+struct ltk500hd1829 *panel_to_ltk500hd1829(struct drm_panel *panel)
+{
+	return container_of(panel, struct ltk500hd1829, panel);
+}
+
+static int ltk500hd1829_unprepare(struct drm_panel *panel)
+{
+	struct ltk500hd1829 *ctx = panel_to_ltk500hd1829(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(panel->dev, "failed to set display off: %d\n",
+			      ret);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(panel->dev, "failed to enter sleep mode: %d\n",
+			      ret);
+	}
+
+	/* 120ms to enter sleep mode */
+	msleep(120);
+
+	regulator_disable(ctx->iovcc);
+	regulator_disable(ctx->vcc);
+
+	ctx->prepared = false;
+
+	return 0;
+}
+
+static int ltk500hd1829_prepare(struct drm_panel *panel)
+{
+	struct ltk500hd1829 *ctx = panel_to_ltk500hd1829(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	unsigned int i;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_enable(ctx->vcc);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			      "Failed to enable vci supply: %d\n", ret);
+		return ret;
+	}
+	ret = regulator_enable(ctx->iovcc);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			      "Failed to enable iovcc supply: %d\n", ret);
+		goto disable_vcc;
+	}
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	/* tRW: 10us */
+	usleep_range(10, 20);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+
+	/* tRT: >= 5ms */
+	usleep_range(5000, 6000);
+
+	for (i = 0; i < ARRAY_SIZE(init_code); i++) {
+		ret = mipi_dsi_generic_write(dsi, &init_code[i],
+					sizeof(struct ltk500hd1829_cmd));
+		if (ret < 0) {
+			DRM_DEV_ERROR(panel->dev, "failed towrite init cmds: %d\n",
+				      ret);
+			goto disable_iovcc;
+		}
+	}
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(panel->dev, "failed to exit sleep mode: %d\n",
+			      ret);
+		goto disable_iovcc;
+	}
+
+	/* 120ms to exit sleep mode */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(panel->dev, "failed to set display on: %d\n",
+			      ret);
+		goto disable_iovcc;
+	}
+
+	ctx->prepared = true;
+
+	return 0;
+
+disable_iovcc:
+	regulator_disable(ctx->iovcc);
+disable_vcc:
+	regulator_disable(ctx->vcc);
+	return ret;
+}
+
+static const struct drm_display_mode default_mode = {
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 50,
+	.hsync_end	= 720 + 50 + 50,
+	.htotal		= 720 + 50 + 50 + 50,
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 30,
+	.vsync_end	= 1280 + 30 + 4,
+	.vtotal		= 1280 + 30 + 4 + 12,
+	.vrefresh	= 60,
+	.clock		= 41600,
+	.width_mm	= 62,
+	.height_mm	= 110,
+};
+
+static int ltk500hd1829_get_modes(struct drm_panel *panel,
+				  struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	if (!mode) {
+		DRM_DEV_ERROR(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+			      default_mode.hdisplay, default_mode.vdisplay,
+			      default_mode.vrefresh);
+		return -ENOMEM;
+	}
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
+static const struct drm_panel_funcs ltk500hd1829_funcs = {
+	.unprepare = ltk500hd1829_unprepare,
+	.prepare = ltk500hd1829_prepare,
+	.get_modes = ltk500hd1829_get_modes,
+};
+
+static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
+{
+	struct ltk500hd1829 *ctx;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+							   GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		DRM_DEV_ERROR(dev, "cannot get reset gpio\n");
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	ctx->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ctx->vcc)) {
+		ret = PTR_ERR(ctx->vcc);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "Failed to request vcc regulator: %d\n",
+				      ret);
+		return ret;
+	}
+
+	ctx->iovcc = devm_regulator_get(dev, "iovcc");
+	if (IS_ERR(ctx->iovcc)) {
+		ret = PTR_ERR(ctx->iovcc);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "Failed to request iovcc regulator: %d\n",
+				      ret);
+		return ret;
+	}
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ctx->dev = dev;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
+
+	drm_panel_init(&ctx->panel, &dsi->dev, &ltk500hd1829_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "Failed to find backlight: %d\n", ret);
+		return ret;
+	}
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "mipi_dsi_attach failed: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ltk500hd1829_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct ltk500hd1829 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = drm_panel_unprepare(&ctx->panel);
+	if (ret < 0)
+		DRM_DEV_ERROR(&dsi->dev, "Failed to unprepare panel: %d\n",
+			      ret);
+
+	ret = drm_panel_disable(&ctx->panel);
+	if (ret < 0)
+		DRM_DEV_ERROR(&dsi->dev, "Failed to disable panel: %d\n",
+			      ret);
+}
+
+static int ltk500hd1829_remove(struct mipi_dsi_device *dsi)
+{
+	struct ltk500hd1829 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ltk500hd1829_shutdown(dsi);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(&dsi->dev, "failed to detach from DSI host: %d\n",
+			      ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id ltk500hd1829_of_match[] = {
+	{ .compatible = "leadtek,ltk500hd1829", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ltk500hd1829_of_match);
+
+static struct mipi_dsi_driver ltk500hd1829_driver = {
+	.driver = {
+		.name = "panel-leadtek-ltk500hd1829",
+		.of_match_table = ltk500hd1829_of_match,
+	},
+	.probe = ltk500hd1829_probe,
+	.remove = ltk500hd1829_remove,
+	.shutdown = ltk500hd1829_shutdown,
+};
+module_mipi_dsi_driver(ltk500hd1829_driver);
+
+MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@theobroma-systems.com>");
+MODULE_DESCRIPTION("Leadtek LTK500HD1829 panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
