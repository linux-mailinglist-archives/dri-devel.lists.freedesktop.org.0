Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F277262B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 15:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D3210E0E1;
	Mon,  7 Aug 2023 13:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 404 seconds by postgrey-1.36 at gabe;
 Mon, 07 Aug 2023 13:40:12 UTC
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [IPv6:2001:690:2100:1::15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDCE10E0E1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 13:40:10 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id B68676002420;
 Mon,  7 Aug 2023 14:33:25 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id tgviFq1c23Hb; Mon,  7 Aug 2023 14:33:22 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 622076001436;
 Mon,  7 Aug 2023 14:33:22 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1691415202;
 bh=PotKgHf1AzMMOBUZ/2UOzMK1yEOXYegf+Ck4KMitzw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=nqVonMphE0MKqpc/P2NqIElrpPinHmdfhvtJr98hrPam8X7A1pwKrO82EY1VgVLcA
 njbjMO/140vF8ULkjNFYN68kh3uqS1RhwNGKHmlfwk37TURKdSC9TnyuRtUNdQQ0Os
 4f0J3IHYd8i74rOtSgkr5X66mnJVun1hEtFe9fCM=
Received: from diogo-gram.Home (unknown
 [IPv6:2001:8a0:fbe7:6700:e50a:b22:79be:5827])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 31746360077;
 Mon,  7 Aug 2023 14:33:22 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/panel: Add driver for JDI LPM102A188A
Date: Mon,  7 Aug 2023 14:33:02 +0100
Message-ID: <20230807133307.27456-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The JDI LPM102A188A is a 2560x1800 IPS panel found in the Google Pixel C.
This driver is based on the downstream GPLv2 driver released by Google
written by Sean Paul [1], which was then adapted to the newer kernel APIs.

[1]: https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra-dragon-3.18-oreo/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v2:
 - tuned backlight delays

Changed in v3:
 - removed "-dsi" from driver name, renamed "control"->"command" (Rayyan Ansari)
 - fix error handling
 - remove enabled/prepared booleans
 - add dc/dc setting function

 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 551 ++++++++++++++++++
 3 files changed, 563 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 203c0ef0bbfd..787e6ac6f1e7 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -244,6 +244,17 @@ config DRM_PANEL_JDI_LT070ME05000
 	  The panel has a 1200(RGB)×1920 (WUXGA) resolution and uses
 	  24 bit per pixel.
 
+config DRM_PANEL_JDI_LPM102A188A
+	tristate "JDI LPM102A188A DSI panel"
+	depends on OF && GPIOLIB
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for JDI LPM102A188A DSI
+	  command mode panel as found in Google Pixel C devices.
+	  The panel has a 2560×1800 resolution. It provides a MIPI DSI interface
+	  to the host.
+
 config DRM_PANEL_JDI_R63452
 	tristate "JDI R63452 Full HD DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 30cf553c8d1d..e5a235017c86 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
 obj-$(CONFIG_DRM_PANEL_JADARD_JD9365DA_H3) += panel-jadard-jd9365da-h3.o
 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
+obj-$(CONFIG_DRM_PANEL_JDI_LPM102A188A) += panel-jdi-lpm102a188a.o
 obj-$(CONFIG_DRM_PANEL_JDI_R63452) += panel-jdi-fhd-r63452.o
 obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
 obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) += panel-kingdisplay-kd097d04.o
diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
new file mode 100644
index 000000000000..5b5082efb282
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -0,0 +1,551 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2014 Google, Inc.
+ *
+ * Copyright (C) 2022 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
+ *
+ * Adapted from the downstream Pixel C driver written by Sean Paul
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
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+#define MCS_CMD_ACS_PROT			0xB0
+#define MCS_CMD_ACS_PROT_OFF			(0 << 0)
+
+#define MCS_PWR_CTRL_FUNC			0xD0
+#define MCS_PWR_CTRL_PARAM1_DEFAULT		(2 << 0)
+#define MCS_PWR_CTRL_PARAM1_VGH_210_DIV		(1 << 4)
+#define MCS_PWR_CTRL_PARAM1_VGH_240_DIV		(2 << 4)
+#define MCS_PWR_CTRL_PARAM1_VGH_280_DIV		(3 << 4)
+#define MCS_PWR_CTRL_PARAM1_VGH_330_DIV		(4 << 4)
+#define MCS_PWR_CTRL_PARAM1_VGH_410_DIV		(5 << 4)
+#define MCS_PWR_CTRL_PARAM2_DEFAULT		(9 << 4)
+#define MCS_PWR_CTRL_PARAM2_VGL_210_DIV		(1 << 0)
+#define MCS_PWR_CTRL_PARAM2_VGL_240_DIV		(2 << 0)
+#define MCS_PWR_CTRL_PARAM2_VGL_280_DIV		(3 << 0)
+#define MCS_PWR_CTRL_PARAM2_VGL_330_DIV		(4 << 0)
+#define MCS_PWR_CTRL_PARAM2_VGL_410_DIV		(5 << 0)
+
+struct jdi_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *link1;
+	struct mipi_dsi_device *link2;
+
+	struct regulator *supply;
+	struct regulator *ddi_supply;
+	struct backlight_device *backlight;
+
+	struct gpio_desc *enable_gpio;
+	struct gpio_desc *reset_gpio;
+
+	const struct drm_display_mode *mode;
+};
+
+static inline struct jdi_panel *to_panel_jdi(struct drm_panel *panel)
+{
+	return container_of(panel, struct jdi_panel, base);
+}
+
+static void jdi_wait_frames(struct jdi_panel *jdi, unsigned int frames)
+{
+	unsigned int refresh = drm_mode_vrefresh(jdi->mode);
+
+	if (WARN_ON(frames > refresh))
+		return;
+
+	msleep(1000 / (refresh / frames));
+}
+
+static int jdi_panel_disable(struct drm_panel *panel)
+{
+	struct jdi_panel *jdi = to_panel_jdi(panel);
+
+	backlight_disable(jdi->backlight);
+
+	jdi_wait_frames(jdi, 2);
+
+	return 0;
+}
+
+static int jdi_panel_unprepare(struct drm_panel *panel)
+{
+	struct jdi_panel *jdi = to_panel_jdi(panel);
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(jdi->link1);
+	if (ret < 0)
+		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+
+	ret = mipi_dsi_dcs_set_display_off(jdi->link2);
+	if (ret < 0)
+		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+
+	/* Specified by JDI @ 50ms, subject to change */
+	msleep(50);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
+	if (ret < 0)
+		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
+	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
+	if (ret < 0)
+		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
+
+	/* Specified by JDI @ 150ms, subject to change */
+	msleep(150);
+
+	gpiod_set_value(jdi->reset_gpio, 1);
+
+	/* T4 = 1ms */
+	usleep_range(1000, 3000);
+
+	gpiod_set_value(jdi->enable_gpio, 0);
+
+	/* T5 = 2ms */
+	usleep_range(2000, 4000);
+
+	regulator_disable(jdi->ddi_supply);
+
+	/* T6 = 2ms plus some time to discharge capacitors */
+	usleep_range(7000, 9000);
+
+	regulator_disable(jdi->supply);
+	/* Specified by JDI @ 20ms, subject to change */
+	msleep(20);
+
+	return ret;
+}
+
+static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
+				       struct mipi_dsi_device *right,
+				       const struct drm_display_mode *mode)
+{
+	int err;
+
+	err = mipi_dsi_dcs_set_column_address(left, 0, mode->hdisplay / 2 - 1);
+	if (err < 0) {
+		dev_err(&left->dev, "failed to set column address: %d\n", err);
+		return err;
+	}
+
+	err = mipi_dsi_dcs_set_column_address(right, 0, mode->hdisplay / 2 - 1);
+	if (err < 0) {
+		dev_err(&right->dev, "failed to set column address: %d\n", err);
+		return err;
+	}
+
+	err = mipi_dsi_dcs_set_page_address(left, 0, mode->vdisplay - 1);
+	if (err < 0) {
+		dev_err(&left->dev, "failed to set page address: %d\n", err);
+		return err;
+	}
+
+	err = mipi_dsi_dcs_set_page_address(right, 0, mode->vdisplay - 1);
+	if (err < 0) {
+		dev_err(&right->dev, "failed to set page address: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
+{
+	/* Clear the manufacturer command access protection */
+	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
+				   MCS_CMD_ACS_PROT_OFF);
+	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
+				   MCS_CMD_ACS_PROT_OFF);
+	/*
+	 * Change the VGH/VGL divide rations to move the noise generated by the
+	 * TCONN. This should hopefully avoid interaction with the backlight
+	 * controller.
+	 */
+	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
+				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
+				   MCS_PWR_CTRL_PARAM1_DEFAULT,
+				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
+				   MCS_PWR_CTRL_PARAM2_DEFAULT);
+
+	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
+				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
+				   MCS_PWR_CTRL_PARAM1_DEFAULT,
+				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
+				   MCS_PWR_CTRL_PARAM2_DEFAULT);
+
+	return 0;
+}
+
+static int jdi_panel_prepare(struct drm_panel *panel)
+{
+	struct jdi_panel *jdi = to_panel_jdi(panel);
+	int err;
+
+	/* Disable backlight to avoid showing random pixels
+	 * with a conservative delay for it to take effect.
+	 */
+	backlight_disable(jdi->backlight);
+	jdi_wait_frames(jdi, 3);
+
+	jdi->link1->mode_flags |= MIPI_DSI_MODE_LPM;
+	jdi->link2->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	err = regulator_enable(jdi->supply);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to enable supply: %d\n", err);
+		return err;
+	}
+	/* T1 = 2ms */
+	usleep_range(2000, 4000);
+
+	err = regulator_enable(jdi->ddi_supply);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to enable ddi_supply: %d\n", err);
+		goto supply_off;
+	}
+	/* T2 = 1ms */
+	usleep_range(1000, 3000);
+
+	gpiod_set_value(jdi->enable_gpio, 1);
+	/* T3 = 10ms */
+	usleep_range(10000, 15000);
+
+	gpiod_set_value(jdi->reset_gpio, 0);
+	/* Specified by JDI @ 3ms, subject to change */
+	usleep_range(3000, 5000);
+
+	/*
+	 * TODO: The device supports both left-right and even-odd split
+	 * configurations, but this driver currently supports only the left-
+	 * right split. To support a different mode a mechanism needs to be
+	 * put in place to communicate the configuration back to the DSI host
+	 * controller.
+	 */
+	err = jdi_setup_symmetrical_split(jdi->link1, jdi->link2,
+					  jdi->mode);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to set up symmetrical split: %d\n",
+			err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_set_tear_scanline(jdi->link1,
+					     jdi->mode->vdisplay - 16);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_set_tear_scanline(jdi->link2,
+					     jdi->mode->vdisplay - 16);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_set_tear_on(jdi->link1,
+				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to set tear on: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_set_tear_on(jdi->link2,
+				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to set tear on: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_set_pixel_format(jdi->link1, MIPI_DCS_PIXEL_FMT_24BIT);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_set_pixel_format(jdi->link2, MIPI_DCS_PIXEL_FMT_24BIT);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link1);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link2);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
+		goto poweroff;
+	}
+
+	err = jdi_write_dcdc_registers(jdi);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to write dcdc registers: %d\n", err);
+		goto poweroff;
+	}
+	/*
+	 * We need to wait 150ms between mipi_dsi_dcs_exit_sleep_mode() and
+	 * mipi_dsi_dcs_set_display_on().
+	 */
+	msleep(150);
+
+	err = mipi_dsi_dcs_set_display_on(jdi->link1);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to set display on: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_set_display_on(jdi->link2);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to set display on: %d\n", err);
+		goto poweroff;
+	}
+
+	jdi->link1->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	jdi->link2->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	return 0;
+
+poweroff:
+	regulator_disable(jdi->ddi_supply);
+
+	/* T6 = 2ms plus some time to discharge capacitors */
+	usleep_range(7000, 9000);
+supply_off:
+	regulator_disable(jdi->supply);
+	/* Specified by JDI @ 20ms, subject to change */
+	msleep(20);
+
+	return err;
+}
+
+static int jdi_panel_enable(struct drm_panel *panel)
+{
+	struct jdi_panel *jdi = to_panel_jdi(panel);
+
+	/*
+	 * Ensure we send image data before turning the backlight
+	 * on, to avoid the display showing random pixels.
+	 */
+	jdi_wait_frames(jdi, 3);
+
+	backlight_enable(jdi->backlight);
+
+	return 0;
+}
+
+static const struct drm_display_mode default_mode = {
+	.clock = (2560 + 80 + 80 + 80) * (1800 + 4 + 4 + 4) * 60 / 1000,
+	.hdisplay = 2560,
+	.hsync_start = 2560 + 80,
+	.hsync_end = 2560 + 80 + 80,
+	.htotal = 2560 + 80 + 80 + 80,
+	.vdisplay = 1800,
+	.vsync_start = 1800 + 4,
+	.vsync_end = 1800 + 4 + 4,
+	.vtotal = 1800 + 4 + 4 + 4,
+	.flags = 0,
+};
+
+static int jdi_panel_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	struct jdi_panel *jdi = to_panel_jdi(panel);
+	struct device *dev = &jdi->link1->dev;
+
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	if (!mode) {
+		dev_err(dev, "failed to add mode %ux%ux@%u\n",
+			default_mode.hdisplay, default_mode.vdisplay,
+			drm_mode_vrefresh(&default_mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = 211;
+	connector->display_info.height_mm = 148;
+	connector->display_info.bpc = 8;
+
+	return 1;
+}
+
+static const struct drm_panel_funcs jdi_panel_funcs = {
+	.prepare = jdi_panel_prepare,
+	.enable = jdi_panel_enable,
+	.disable = jdi_panel_disable,
+	.unprepare = jdi_panel_unprepare,
+	.get_modes = jdi_panel_get_modes,
+};
+
+static const struct of_device_id jdi_of_match[] = {
+	{ .compatible = "jdi,lpm102a188a", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, jdi_of_match);
+
+static int jdi_panel_add(struct jdi_panel *jdi)
+{
+	struct device *dev = &jdi->link1->dev;
+
+	jdi->mode = &default_mode;
+
+	jdi->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(jdi->supply))
+		return dev_err_probe(dev, PTR_ERR(jdi->supply),
+				     "failed to get power regulator\n");
+
+	jdi->ddi_supply = devm_regulator_get(dev, "ddi");
+	if (IS_ERR(jdi->ddi_supply))
+		return dev_err_probe(dev, PTR_ERR(jdi->ddi_supply),
+				     "failed to get ddi regulator\n");
+
+	jdi->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(jdi->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(jdi->reset_gpio),
+				     "failed to get reset gpio\n");
+	/* T4 = 1ms */
+	usleep_range(1000, 3000);
+
+	jdi->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(jdi->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(jdi->enable_gpio),
+				     "failed to get enable gpio\n");
+	/* T5 = 2ms */
+	usleep_range(2000, 4000);
+
+	jdi->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(jdi->backlight))
+		return dev_err_probe(dev, PTR_ERR(jdi->backlight),
+				     "failed to create backlight\n");
+
+	drm_panel_init(&jdi->base, &jdi->link1->dev, &jdi_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	drm_panel_add(&jdi->base);
+
+	return 0;
+}
+
+static void jdi_panel_del(struct jdi_panel *jdi)
+{
+	if (jdi->base.dev)
+		drm_panel_remove(&jdi->base);
+
+	if (jdi->link2)
+		put_device(&jdi->link2->dev);
+}
+
+static int jdi_panel_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_device *secondary = NULL;
+	struct jdi_panel *jdi;
+	struct device_node *np;
+	int err;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = 0;
+
+	/* Find DSI-LINK1 */
+	np = of_parse_phandle(dsi->dev.of_node, "link2", 0);
+	if (np) {
+		secondary = of_find_mipi_dsi_device_by_node(np);
+		of_node_put(np);
+
+		if (!secondary)
+			return -EPROBE_DEFER;
+	}
+
+	/* register a panel for only the DSI-LINK1 interface */
+	if (secondary) {
+		jdi = devm_kzalloc(&dsi->dev, sizeof(*jdi), GFP_KERNEL);
+		if (!jdi) {
+			put_device(&secondary->dev);
+			return -ENOMEM;
+		}
+
+		mipi_dsi_set_drvdata(dsi, jdi);
+
+		jdi->link1 = dsi;
+		jdi->link2 = secondary;
+
+		err = jdi_panel_add(jdi);
+		if (err < 0) {
+			put_device(&secondary->dev);
+			return err;
+		}
+	}
+
+	err = mipi_dsi_attach(dsi);
+	if (err < 0) {
+		if (secondary)
+			jdi_panel_del(jdi);
+
+		return err;
+	}
+
+	return 0;
+}
+
+static void jdi_panel_dsi_remove(struct mipi_dsi_device *dsi)
+{
+	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
+	int err;
+
+	/* only detach from host for the DSI-LINK2 interface */
+	if (!jdi)
+		mipi_dsi_detach(dsi);
+
+	err = jdi_panel_disable(&jdi->base);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+
+	err = mipi_dsi_detach(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
+
+	jdi_panel_del(jdi);
+}
+
+static void jdi_panel_dsi_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
+
+	if (!jdi)
+		return;
+
+	jdi_panel_disable(&jdi->base);
+}
+
+static struct mipi_dsi_driver jdi_panel_dsi_driver = {
+	.driver = {
+		.name = "panel-jdi-lpm102a188a",
+		.of_match_table = jdi_of_match,
+	},
+	.probe = jdi_panel_dsi_probe,
+	.remove = jdi_panel_dsi_remove,
+	.shutdown = jdi_panel_dsi_shutdown,
+};
+module_mipi_dsi_driver(jdi_panel_dsi_driver);
+
+MODULE_AUTHOR("Sean Paul <seanpaul@chromium.org>");
+MODULE_AUTHOR("Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>");
+MODULE_DESCRIPTION("DRM Driver for JDI LPM102A188A DSI panel, command mode");
+MODULE_LICENSE("GPL");
-- 
2.41.0

