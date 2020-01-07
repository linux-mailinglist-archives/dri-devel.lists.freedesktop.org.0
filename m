Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9A3133CCE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DED6E858;
	Wed,  8 Jan 2020 08:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B968B89B00;
 Tue,  7 Jan 2020 11:30:03 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 07 Jan 2020 17:00:02 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 07 Jan 2020 17:00:01 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 10F832575; Tue,  7 Jan 2020 17:00:01 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Date: Tue,  7 Jan 2020 16:59:57 +0530
Message-Id: <1578396597-18324-3-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: sean@poorly.run, seanpaul@chromium.org,
 Harigovindan P <harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Visionox panel driver.

Changes in v1:
	-Split out panel driver patch from dsi config changes(Rob Clark).
	-Remove unrelated code(Stephen Boyd).
	-Remove static arrays to make regulator setup open coded
	in probe(Stephen Boyd).
	-Remove pre-assigning variables(Stephen Boyd).
	-Inline panel_add function into probe(Stephen Boyd).
	-Use mipi_dsi_dcs_write directly(Rob Clark).
	-Remove qcom_rm69299_1080p_panel_magic_cmds array(Rob Clark).
Changes in v2:
	-Dropping redundant space in Kconfig(Sam Ravnborg).
	-Changing structure for include files(Sam Ravnborg).
	-Removing backlight related code and functions(Sam Ravnborg).
	-Removing repeated printing of error message(Sam Ravnborg).
	-Adding drm_connector as an argument for get_modes function.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 drivers/gpu/drm/panel/Kconfig                  |   8 +
 drivers/gpu/drm/panel/Makefile                 |   1 +
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 370 +++++++++++++++++++++++++
 3 files changed, 379 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index f152bc4..123481f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -355,4 +355,12 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	help
 	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
 	  Video Mode panel
+
+config DRM_PANEL_VISIONOX_RM69299
+	tristate "Visionox RM69299"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for Visionox
+	  RM69299  DSI Video Mode panel.
 endmenu
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b6cd39f..6f1e4c6 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
+obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
new file mode 100644
index 0000000..3fa1cb4
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+struct rm69299_config {
+	unsigned long width_mm;
+	unsigned long height_mm;
+	const char *panel_name;
+	u32 num_on_cmds;
+	const struct drm_display_mode *dm;
+};
+
+struct visionox_rm69299 {
+	struct device *dev;
+	struct drm_panel panel;
+
+	struct regulator_bulk_data supplies[2];
+
+	struct gpio_desc *reset_gpio;
+
+	struct mipi_dsi_device *dsi;
+	const struct rm69299_config *config;
+	bool prepared;
+	bool enabled;
+};
+
+static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
+{
+	return container_of(panel, struct visionox_rm69299, panel);
+}
+
+static int visionox_35597_power_on(struct visionox_rm69299 *ctx)
+{
+	int ret;
+
+	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
+	if (ret)
+		return ret;
+
+	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
+	if (ret)
+		return ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Reset sequence of visionox panel requires the panel to be
+	 * out of reset for 10ms, followed by being held in reset
+	 * for 10ms and then out again
+	 */
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(10000, 20000);
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(10000, 20000);
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(10000, 20000);
+
+	return 0;
+}
+
+static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
+{
+	int ret;
+
+	gpiod_set_value(ctx->reset_gpio, 0);
+
+	ret = regulator_set_load(ctx->supplies[0].consumer, 80);
+
+	if (ret) {
+		DRM_DEV_ERROR(ctx->dev,
+			"regulator_set_load failed %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_set_load(ctx->supplies[1].consumer, 80);
+
+	if (ret) {
+		DRM_DEV_ERROR(ctx->dev,
+			"regulator_set_load failed %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret) {
+		DRM_DEV_ERROR(ctx->dev,
+			"regulator_bulk_disable failed %d\n", ret);
+	}
+	return ret;
+}
+
+static int visionox_rm69299_unprepare(struct drm_panel *panel)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ctx->dsi->mode_flags = 0;
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_OFF, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			"set_display_off cmd failed ret = %d\n",
+			ret);
+	}
+
+	/* 120ms delay required here as per DCS spec */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_ENTER_SLEEP_MODE, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			"enter_sleep cmd failed ret = %d\n", ret);
+	}
+
+	ret = visionox_rm69299_power_off(ctx);
+
+	ctx->prepared = false;
+	return ret;
+}
+
+static int visionox_rm69299_prepare(struct drm_panel *panel)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	int ret;
+	const struct rm69299_config *config;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = visionox_35597_power_on(ctx);
+	if (ret < 0)
+		return ret;
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	config = ctx->config;
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+		"cmd set tx 0 failed, ret = %d\n",
+		ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+		"cmd set tx 1 failed, ret = %d\n",
+		ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+		"cmd set tx 2 failed, ret = %d\n",
+		ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+		"cmd set tx 3 failed, ret = %d\n",
+		ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			"exit_sleep_mode cmd failed ret = %d\n",
+			ret);
+		goto power_off;
+	}
+
+	/* Per DSI spec wait 120ms after sending exit sleep DCS command */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_ON, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			"set_display_on cmd failed ret = %d\n", ret);
+		goto power_off;
+	}
+
+	/* Per DSI spec wait 120ms after sending set_display_on DCS command */
+	msleep(120);
+
+	ctx->prepared = true;
+
+	return 0;
+
+power_off:
+	ret = visionox_rm69299_power_off(ctx);
+	return ret;
+}
+
+static int visionox_rm69299_get_modes(struct drm_panel *panel,
+				      struct drm_connector *connector)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	struct drm_display_mode *mode;
+	const struct rm69299_config *config;
+
+	config = ctx->config;
+	mode = drm_mode_create(connector->dev);
+	if (!mode) {
+		DRM_DEV_ERROR(ctx->dev,
+			"failed to create a new display mode\n");
+		return 0;
+	}
+
+	connector->display_info.width_mm = config->width_mm;
+	connector->display_info.height_mm = config->height_mm;
+	drm_mode_copy(mode, config->dm);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs visionox_rm69299_drm_funcs = {
+	.unprepare = visionox_rm69299_unprepare,
+	.prepare = visionox_rm69299_prepare,
+	.get_modes = visionox_rm69299_get_modes,
+};
+
+static const struct drm_display_mode qcom_sc7180_mtp_1080p_mode = {
+	.name = "1080x2248",
+	.clock = 158695,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 26,
+	.hsync_end = 1080 + 26 + 2,
+	.htotal = 1080 + 26 + 2 + 36,
+	.vdisplay = 2248,
+	.vsync_start = 2248 + 56,
+	.vsync_end = 2248 + 56 + 4,
+	.vtotal = 2248 + 56 + 4 + 4,
+	.vrefresh = 60,
+	.flags = 0,
+};
+
+static const struct rm69299_config rm69299_dir = {
+	.width_mm = 74,
+	.height_mm = 131,
+	.panel_name = "qcom_sc7180_mtp_1080p_panel",
+	.dm = &qcom_sc7180_mtp_1080p_mode,
+};
+
+static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct device *device;
+	struct visionox_rm69299 *ctx;
+	const struct rm69299_config *config;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->config = device_get_match_data(dev);
+
+	if (!ctx->config) {
+		dev_err(dev, "missing device configuration\n");
+		return -ENODEV;
+	}
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ctx->dev = dev;
+	ctx->dsi = dsi;
+
+	device = ctx->dev;
+
+	config = ctx->config;
+	ctx->supplies[0].supply = "vdda";
+	ctx->supplies[1].supply = "vdd3p3";
+
+	ret = devm_regulator_bulk_get(device, ARRAY_SIZE(ctx->supplies),
+								ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(device, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
+					PTR_ERR(ctx->reset_gpio));
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	drm_panel_init(&ctx->panel);
+	ctx->panel.dev = device;
+	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
+	drm_panel_add(&ctx->panel);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
+		MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev,
+			"dsi attach failed ret = %d\n", ret);
+		goto err_dsi_attach;
+	}
+
+	return 0;
+
+err_dsi_attach:
+	drm_panel_remove(&ctx->panel);
+	return ret;
+}
+
+static int visionox_rm69299_remove(struct mipi_dsi_device *dsi)
+{
+	struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	if (ctx->dsi) {
+		mipi_dsi_detach(ctx->dsi);
+		mipi_dsi_device_unregister(ctx->dsi);
+	}
+
+	drm_panel_remove(&ctx->panel);
+	return 0;
+}
+
+static const struct of_device_id visionox_rm69299_of_match[] = {
+	{
+		.compatible = "visionox,rm69299-1080p-display",
+		.data = &rm69299_dir,
+	},
+	{ /* */ }
+};
+MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
+
+static struct mipi_dsi_driver visionox_rm69299_driver = {
+	.driver = {
+		.name = "panel-visionox-rm69299",
+		.of_match_table = visionox_rm69299_of_match,
+	},
+	.probe = visionox_rm69299_probe,
+	.remove = visionox_rm69299_remove,
+};
+module_mipi_dsi_driver(visionox_rm69299_driver);
+
+MODULE_DESCRIPTION("VISIONOX RM69299 DSI Panel Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
