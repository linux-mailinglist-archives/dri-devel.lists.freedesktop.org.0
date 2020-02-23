Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1043416983C
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 16:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55046E02E;
	Sun, 23 Feb 2020 15:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CCF6E02E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 15:07:31 +0000 (UTC)
Received: from p508fd060.dip0.t-ipconnect.de ([80.143.208.96]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1j5sqt-0003if-EM; Sun, 23 Feb 2020 16:07:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/panel: add panel driver for Elida KD35T133 panels
Date: Sun, 23 Feb 2020 16:07:11 +0100
Message-Id: <20200223150711.194482-3-heiko@sntech.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200223150711.194482-1-heiko@sntech.de>
References: <20200223150711.194482-1-heiko@sntech.de>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robin.murphy@arm.com,
 robh+dt@kernel.org, linux-rockchip@lists.infradead.org,
 thierry.reding@gmail.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Panel driver for the KD35T133 display from Elida, used for example
in the rk3326-based Odroid Go Advance handheld.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 drivers/gpu/drm/panel/Kconfig                |  10 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 352 +++++++++++++++++++
 3 files changed, 363 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-elida-kd35t133.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index db7ba062027e..56149fdbdf53 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -50,6 +50,16 @@ config DRM_PANEL_SIMPLE
 	  that it can be automatically turned off when the panel goes into a
 	  low power state.
 
+config DRM_PANEL_ELIDA_KD35T133
+	tristate "Elida KD35T133 panel driver"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Elida
+	  KD35T133 controller for 320x480 LCD panels with MIPI-DSI
+	  system interfaces.
+
 config DRM_PANEL_FEIYANG_FY07024DI26A30D
 	tristate "Feiyang FY07024DI26A30-D MIPI-DSI LCD panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 276907410a45..63189c015ba5 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
 obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
+obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
new file mode 100644
index 000000000000..b1a38d7d0dd6
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Elida kd35t133 5.5" MIPI-DSI panel driver
+ * Copyright (C) 2020 Theobroma Systems Design und Consulting GmbH
+ *
+ * based on
+ *
+ * Rockteck jh057n00900 5.5" MIPI-DSI panel driver
+ * Copyright (C) Purism SPC 2019
+ */
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+#include <video/display_timing.h>
+#include <video/mipi_display.h>
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+/* Manufacturer specific Commands send via DSI */
+#define KD35T133_CMD_INTERFACEMODECTRL		0xb0
+#define KD35T133_CMD_FRAMERATECTRL		0xb1
+#define KD35T133_CMD_DISPLAYINVERSIONCTRL	0xb4
+#define KD35T133_CMD_DISPLAYFUNCTIONCTRL	0xb6
+#define KD35T133_CMD_POWERCONTROL1		0xc0
+#define KD35T133_CMD_POWERCONTROL2		0xc1
+#define KD35T133_CMD_VCOMCONTROL		0xc5
+#define KD35T133_CMD_POSITIVEGAMMA		0xe0
+#define KD35T133_CMD_NEGATIVEGAMMA		0xe1
+#define KD35T133_CMD_SETIMAGEFUNCTION		0xe9
+#define KD35T133_CMD_ADJUSTCONTROL3		0xf7
+
+struct kd35t133 {
+	struct device *dev;
+	struct drm_panel panel;
+	struct gpio_desc *reset_gpio;
+	struct regulator *vdd;
+	struct regulator *iovcc;
+	bool prepared;
+};
+
+static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
+{
+	return container_of(panel, struct kd35t133, panel);
+}
+
+#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+static int kd35t133_init_sequence(struct kd35t133 *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct device *dev = ctx->dev;
+
+	/*
+	 * Init sequence was supplied by the panel vendor with minimal
+	 * documentation.
+	 */
+	dsi_generic_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
+			      0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
+			      0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
+			      0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
+			      0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
+	dsi_generic_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
+	dsi_generic_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
+			      0x20, 0x02);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
+	dsi_generic_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
+			      0xa9, 0x51, 0x2c, 0x82);
+	mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
+	return 0;
+}
+
+static int kd35t133_unprepare(struct drm_panel *panel)
+{
+	struct kd35t133 *ctx = panel_to_kd35t133(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(ctx->dev, "failed to set display off: %d\n",
+			      ret);
+
+	mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev, "failed to enter sleep mode: %d\n",
+			      ret);
+		return ret;
+	}
+
+	regulator_disable(ctx->iovcc);
+	regulator_disable(ctx->vdd);
+
+	ctx->prepared = false;
+
+	return 0;
+}
+
+static int kd35t133_prepare(struct drm_panel *panel)
+{
+	struct kd35t133 *ctx = panel_to_kd35t133(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Resetting the panel\n");
+	ret = regulator_enable(ctx->vdd);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			      "Failed to enable vdd supply: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(ctx->iovcc);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			      "Failed to enable iovcc supply: %d\n", ret);
+		goto disable_vdd;
+	}
+
+	msleep(20);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10, 20);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+
+	msleep(20);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
+		goto disable_iovcc;
+	}
+
+	msleep(250);
+
+	ret = kd35t133_init_sequence(ctx);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev, "Panel init sequence failed: %d\n",
+			      ret);
+		goto disable_iovcc;
+	}
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev, "Failed to set display on: %d\n", ret);
+		goto disable_iovcc;
+	}
+
+	msleep(50);
+
+	ctx->prepared = true;
+
+	return 0;
+
+disable_iovcc:
+	regulator_disable(ctx->iovcc);
+disable_vdd:
+	regulator_disable(ctx->vdd);
+	return ret;
+}
+
+static const struct drm_display_mode default_mode = {
+	.hdisplay	= 320,
+	.hsync_start	= 320 + 130,
+	.hsync_end	= 320 + 130 + 4,
+	.htotal		= 320 + 130 + 4 + 130,
+	.vdisplay	= 480,
+	.vsync_start	= 480 + 2,
+	.vsync_end	= 480 + 2 + 1,
+	.vtotal		= 480 + 2 + 1 + 2,
+	.vrefresh	= 60,
+	.clock		= 17000,
+	.width_mm	= 42,
+	.height_mm	= 82,
+};
+
+static int kd35t133_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	struct kd35t133 *ctx = panel_to_kd35t133(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	if (!mode) {
+		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u\n",
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
+static const struct drm_panel_funcs kd35t133_funcs = {
+	.unprepare	= kd35t133_unprepare,
+	.prepare	= kd35t133_prepare,
+	.get_modes	= kd35t133_get_modes,
+};
+
+static int kd35t133_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct kd35t133 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		DRM_DEV_ERROR(dev, "cannot get reset gpio\n");
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	ctx->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(ctx->vdd)) {
+		ret = PTR_ERR(ctx->vdd);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "Failed to request vdd regulator: %d\n",
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
+	dsi->lanes = 1;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
+
+	drm_panel_init(&ctx->panel, &dsi->dev, &kd35t133_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
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
+static void kd35t133_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
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
+static int kd35t133_remove(struct mipi_dsi_device *dsi)
+{
+	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	kd35t133_shutdown(dsi);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(&dsi->dev, "Failed to detach from DSI host: %d\n",
+			      ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id kd35t133_of_match[] = {
+	{ .compatible = "elida,kd35t133" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, kd35t133_of_match);
+
+static struct mipi_dsi_driver kd35t133_driver = {
+	.driver = {
+		.name = "panel-elida-kd35t133",
+		.of_match_table = kd35t133_of_match,
+	},
+	.probe	= kd35t133_probe,
+	.remove = kd35t133_remove,
+	.shutdown = kd35t133_shutdown,
+};
+module_mipi_dsi_driver(kd35t133_driver);
+
+MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@theobroma-systems.com>");
+MODULE_DESCRIPTION("DRM driver for Elida kd35t133 MIPI DSI panel");
+MODULE_LICENSE("GPL v2");
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
