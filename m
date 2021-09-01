Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214FC3FE140
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 19:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1F56E219;
	Wed,  1 Sep 2021 17:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 459 seconds by postgrey-1.36 at gabe;
 Wed, 01 Sep 2021 17:39:00 UTC
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E726E218
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 17:39:00 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6A47E200D5;
 Wed,  1 Sep 2021 19:31:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: thierry.reding@gmail.com
Cc: sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 1/2] drm/panel: Add driver for Novatek NT35950 DSI DriverIC
 panels
Date: Wed,  1 Sep 2021 19:31:26 +0200
Message-Id: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
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

Add a driver for panels using the Novatek NT35950 Display Driver IC,
including support for the Sharp LS055D1SX04, found in some Sony Xperia
Z5 Premium and XZ Premium smartphones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 702 ++++++++++++++++++
 3 files changed, 714 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt35950.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ab5a52c71ec5..1cf064d597a2 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -271,6 +271,17 @@ config DRM_PANEL_NOVATEK_NT35510
 	  around the Novatek NT35510 display controller, such as some
 	  Hydis panels.
 
+config DRM_PANEL_NOVATEK_NT35950
+	tristate "Novatek NT35950 DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the panels built
+	  around the Novatek NT35950 display controller, such as some
+	  Sharp panels used in Sony Xperia Z5 Premium and XZ Premium
+	  mobile phones.
+
 config DRM_PANEL_NOVATEK_NT36672A
 	tristate "Novatek NT36672A DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 1b494d479ffd..190b5f90af4d 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
new file mode 100644
index 000000000000..d42c7af0d75c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -0,0 +1,702 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Novatek NT35950 DriverIC panels driver
+ *
+ * Copyright (c) 2021 AngeloGioacchino Del Regno
+ *                    <angelogioacchino.delregno@somainline.org>
+ */
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#define MCS_CMD_MAUCCTR			0xf0 /* Manufacturer command enable */
+#define MCS_PARAM_SCALER_FUNCTION	0x58 /* Scale-up function */
+#define MCS_PARAM_SCALEUP_MODE		0xc9
+ #define MCS_SCALEUP_SIMPLE		0x0
+ #define MCS_SCALEUP_BILINEAR		BIT(0)
+ #define MCS_SCALEUP_DUPLICATE		(BIT(0) | BIT(4))
+
+/* VESA Display Stream Compression param */
+#define MCS_PARAM_VESA_DSC_ON		0x03
+
+/* Data Compression mode */
+#define MCS_PARAM_DATA_COMPRESSION	0x90
+ #define MCS_DATA_COMPRESSION_NONE	0x00
+ #define MCS_DATA_COMPRESSION_FBC	0x02
+ #define MCS_DATA_COMPRESSION_DSC	0x03
+
+/* Display Output control */
+#define MCS_PARAM_DISP_OUTPUT_CTRL	0xb4
+ #define MCS_DISP_OUT_SRAM_EN		BIT(0)
+ #define MCS_DISP_OUT_VIDEO_MODE	BIT(4)
+
+/* VESA Display Stream Compression setting */
+#define MCS_PARAM_VESA_DSC_SETTING	0xc0
+
+/* SubPixel Rendering (SPR) */
+#define MCS_PARAM_SPR_EN		0xe3
+#define MCS_PARAM_SPR_MODE		0xef
+ #define MCS_SPR_MODE_YYG_RAINBOW_RGB	0x01
+
+#define NT35950_VREG_MAX		4
+
+struct nt35950 {
+	struct drm_panel panel;
+	struct drm_connector *connector;
+	struct mipi_dsi_device *dsi[2];
+	struct regulator_bulk_data vregs[NT35950_VREG_MAX];
+	struct gpio_desc *reset_gpio;
+	const struct nt35950_panel_desc *desc;
+
+	int cur_mode;
+	u8 last_page;
+	bool prepared;
+};
+
+struct nt35950_panel_mode {
+	const struct drm_display_mode mode;
+
+	bool enable_sram;
+	bool is_video_mode;
+	u8 scaler_on;
+	u8 scaler_mode;
+	u8 compression;
+	u8 spr_en;
+	u8 spr_mode;
+};
+
+struct nt35950_panel_desc {
+	const char *model_name;
+	const struct mipi_dsi_device_info dsi_info;
+	const struct nt35950_panel_mode *mode_data;
+
+	bool is_dual_dsi;
+	u8 num_lanes;
+	u8 num_modes;
+};
+
+static inline struct nt35950 *to_nt35950(struct drm_panel *panel)
+{
+	return container_of(panel, struct nt35950, panel);
+}
+
+#define dsi_dcs_write_seq(dsi, seq...) do {				\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+static void nt35950_reset(struct nt35950 *nt)
+{
+	gpiod_set_value_cansleep(nt->reset_gpio, 1);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(nt->reset_gpio, 0);
+	usleep_range(300, 400);
+	gpiod_set_value_cansleep(nt->reset_gpio, 1);
+	usleep_range(12000, 13000);
+}
+
+/*
+ * nt35950_set_cmd2_page - Select manufacturer control (CMD2) page
+ * @nt:   Main driver structure
+ * @page: Page number (0-7)
+ *
+ * Return: Number of transferred bytes or negative number on error
+ */
+static int nt35950_set_cmd2_page(struct nt35950 *nt, u8 page)
+{
+	const u8 mauc_cmd2_page[] = { MCS_CMD_MAUCCTR, 0x55, 0xaa, 0x52,
+				      0x08, page };
+	int ret;
+
+	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], mauc_cmd2_page,
+					ARRAY_SIZE(mauc_cmd2_page));
+	if (ret < 0)
+		return ret;
+
+	nt->last_page = page;
+	return 0;
+}
+
+/*
+ * nt35950_set_data_compression - Set data compression mode
+ * @nt:        Main driver structure
+ * @comp_mode: Compression mode
+ *
+ * Return: Number of transferred bytes or negative number on error
+ */
+static int nt35950_set_data_compression(struct nt35950 *nt, u8 comp_mode)
+{
+	u8 cmd_data_compression[] = { MCS_PARAM_DATA_COMPRESSION, comp_mode };
+	u8 cmd_vesa_dsc_on[] = { MCS_PARAM_VESA_DSC_ON, !!comp_mode };
+	u8 cmd_vesa_dsc_setting[] = { MCS_PARAM_VESA_DSC_SETTING, 0x03 };
+	u8 last_page = nt->last_page;
+	int ret;
+
+	/* Set CMD2 Page 0 if we're not there yet */
+	if (last_page != 0) {
+		ret = nt35950_set_cmd2_page(nt, 0);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_data_compression,
+					ARRAY_SIZE(cmd_data_compression));
+	if (ret < 0)
+		return ret;
+
+	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_vesa_dsc_on,
+					ARRAY_SIZE(cmd_vesa_dsc_on));
+	if (ret < 0)
+		return ret;
+
+	/* Set the vesa dsc setting on Page 4 */
+	ret = nt35950_set_cmd2_page(nt, 4);
+	if (ret < 0)
+		return ret;
+
+	/* Display Stream Compression setting, always 0x03 */
+	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_vesa_dsc_setting,
+					ARRAY_SIZE(cmd_vesa_dsc_setting));
+	if (ret < 0)
+		return ret;
+
+	/* Get back to the previously set page */
+	return nt35950_set_cmd2_page(nt, last_page);
+}
+
+/*
+ * nt35950_set_scaler - Enable/disable resolution upscaling
+ * @nt:        Main driver structure
+ * @scale_up:  Scale up function control
+ *
+ * Return: Number of transferred bytes or negative number on error
+ */
+static int nt35950_set_scaler(struct nt35950 *nt, u8 scale_up)
+{
+	u8 cmd_scaler[] = { MCS_PARAM_SCALER_FUNCTION, scale_up };
+
+	return mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_scaler,
+					 ARRAY_SIZE(cmd_scaler));
+}
+
+/*
+ * nt35950_set_scale_mode - Resolution upscaling mode
+ * @nt:   Main driver structure
+ * @mode: Scaler mode (MCS_DATA_COMPRESSION_*)
+ *
+ * Return: Number of transferred bytes or negative number on error
+ */
+static int nt35950_set_scale_mode(struct nt35950 *nt, u8 mode)
+{
+	u8 cmd_scaler[] = { MCS_PARAM_SCALEUP_MODE, mode };
+
+	return mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_scaler,
+					 ARRAY_SIZE(cmd_scaler));
+}
+
+/*
+ * nt35950_inject_black_image - Display a completely black image
+ * @nt:   Main driver structure
+ *
+ * After IC setup, the attached panel may show random data
+ * due to driveric behavior changes (resolution, compression,
+ * scaling, etc). This function, called after parameters setup,
+ * makes the driver ic to output a completely black image to
+ * the display.
+ * It makes sense to push a black image before sending the sleep-out
+ * and display-on commands.
+ *
+ * Return: Number of transferred bytes or negative number on error
+ */
+static int nt35950_inject_black_image(struct nt35950 *nt)
+{
+	const u8 cmd0_black_img[] = { 0x6f, 0x01 };
+	const u8 cmd1_black_img[] = { 0xf3, 0x10 };
+	u8 cmd_test[] = { 0xff, 0xaa, 0x55, 0xa5, 0x80 };
+	int ret;
+
+	/* Enable test command */
+	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_test, ARRAY_SIZE(cmd_test));
+	if (ret < 0)
+		return ret;
+
+	/* Send a black image */
+	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd0_black_img,
+					ARRAY_SIZE(cmd0_black_img));
+	if (ret < 0)
+		return ret;
+	ret = mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd1_black_img,
+					ARRAY_SIZE(cmd1_black_img));
+	if (ret < 0)
+		return ret;
+
+	/* Disable test command */
+	cmd_test[ARRAY_SIZE(cmd_test) - 1] = 0x00;
+	return mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_test, ARRAY_SIZE(cmd_test));
+}
+
+/*
+ * nt35950_set_dispout - Set Display Output register parameters
+ * @nt:    Main driver structure
+ *
+ * Return: Number of transferred bytes or negative number on error
+ */
+static int nt35950_set_dispout(struct nt35950 *nt)
+{
+	u8 cmd_dispout[] = { MCS_PARAM_DISP_OUTPUT_CTRL, 0x00 };
+	const struct nt35950_panel_mode *mode_data = nt->desc->mode_data;
+
+	if (mode_data[nt->cur_mode].is_video_mode)
+		cmd_dispout[1] |= MCS_DISP_OUT_VIDEO_MODE;
+	if (mode_data[nt->cur_mode].enable_sram)
+		cmd_dispout[1] |= MCS_DISP_OUT_SRAM_EN;
+
+	return mipi_dsi_dcs_write_buffer(nt->dsi[0], cmd_dispout,
+					 ARRAY_SIZE(cmd_dispout));
+}
+
+static int nt35950_get_current_mode(struct nt35950 *nt)
+{
+	struct drm_connector *connector = nt->connector;
+	struct drm_crtc_state *crtc_state;
+	int i;
+
+	/* Return the default (first) mode if no info available yet */
+	if (!connector->state || !connector->state->crtc)
+		return 0;
+
+	crtc_state = connector->state->crtc->state;
+
+	for (i = 0; i < nt->desc->num_modes; i++) {
+		if (drm_mode_match(&crtc_state->mode,
+				   &nt->desc->mode_data[i].mode,
+				   DRM_MODE_MATCH_TIMINGS | DRM_MODE_MATCH_CLOCK))
+			return i;
+	}
+
+	return 0;
+}
+
+static int nt35950_on(struct nt35950 *nt)
+{
+	const struct nt35950_panel_mode *mode_data = nt->desc->mode_data;
+	struct mipi_dsi_device *dsi = nt->dsi[0];
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	nt->cur_mode = nt35950_get_current_mode(nt);
+	nt->dsi[0]->mode_flags |= MIPI_DSI_MODE_LPM;
+	nt->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	ret = nt35950_set_cmd2_page(nt, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = nt35950_set_data_compression(nt, mode_data[nt->cur_mode].compression);
+	if (ret < 0)
+		return ret;
+
+	ret = nt35950_set_scale_mode(nt, mode_data[nt->cur_mode].scaler_mode);
+	if (ret < 0)
+		return ret;
+
+	ret = nt35950_set_scaler(nt, mode_data[nt->cur_mode].scaler_on);
+	if (ret < 0)
+		return ret;
+
+	ret = nt35950_set_dispout(nt);
+	if (ret < 0)
+		return ret;
+
+	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set tear on: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set tear scanline: %d\n", ret);
+		return ret;
+	}
+
+	/* CMD2 Page 1 */
+	ret = nt35950_set_cmd2_page(nt, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Unknown command */
+	dsi_dcs_write_seq(dsi, 0xd4, 0x88, 0x88);
+
+	/* CMD2 Page 7 */
+	ret = nt35950_set_cmd2_page(nt, 7);
+	if (ret < 0)
+		return ret;
+
+	/* Enable SubPixel Rendering */
+	dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_EN, 0x01);
+
+	/* SPR Mode: YYG Rainbow-RGB */
+	dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_MODE, MCS_SPR_MODE_YYG_RAINBOW_RGB);
+
+	/* CMD3 */
+	ret = nt35950_inject_black_image(nt);
+	if (ret < 0)
+		return ret;
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0)
+		return ret;
+	msleep(120);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0)
+		return ret;
+	msleep(120);
+
+	nt->dsi[0]->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	nt->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int nt35950_off(struct nt35950 *nt)
+{
+	struct device *dev = &nt->dsi[0]->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(nt->dsi[0]);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		goto set_lpm;
+	}
+	usleep_range(10000, 11000);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(nt->dsi[0]);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		goto set_lpm;
+	}
+	msleep(150);
+
+set_lpm:
+	nt->dsi[0]->mode_flags |= MIPI_DSI_MODE_LPM;
+	nt->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int nt35950_sharp_init_vregs(struct nt35950 *nt, struct device *dev)
+{
+	int ret;
+
+	nt->vregs[0].supply = "vddio";
+	nt->vregs[1].supply = "avdd";
+	nt->vregs[2].supply = "avee";
+	nt->vregs[3].supply = "dvdd";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(nt->vregs),
+				      nt->vregs);
+	if (ret < 0)
+		return ret;
+
+	ret = regulator_is_supported_voltage(nt->vregs[0].consumer,
+					     1750000, 1950000);
+	if (!ret)
+		return -EINVAL;
+	ret = regulator_is_supported_voltage(nt->vregs[1].consumer,
+					     5200000, 5900000);
+	if (!ret)
+		return -EINVAL;
+	/* AVEE is negative: -5.90V to -5.20V */
+	ret = regulator_is_supported_voltage(nt->vregs[2].consumer,
+					     5200000, 5900000);
+	if (!ret)
+		return -EINVAL;
+
+	ret = regulator_is_supported_voltage(nt->vregs[3].consumer,
+					     1300000, 1400000);
+	if (!ret)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int nt35950_prepare(struct drm_panel *panel)
+{
+	struct nt35950 *nt = to_nt35950(panel);
+	struct device *dev = &nt->dsi[0]->dev;
+	int ret;
+
+	if (nt->prepared)
+		return 0;
+
+	ret = regulator_enable(nt->vregs[0].consumer);
+	if (ret)
+		return ret;
+	usleep_range(2000, 5000);
+
+	ret = regulator_enable(nt->vregs[3].consumer);
+	if (ret)
+		goto end;
+	usleep_range(15000, 18000);
+
+	ret = regulator_enable(nt->vregs[1].consumer);
+	if (ret)
+		goto end;
+
+	ret = regulator_enable(nt->vregs[2].consumer);
+	if (ret)
+		goto end;
+	usleep_range(12000, 13000);
+
+	nt35950_reset(nt);
+
+	ret = nt35950_on(nt);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		goto end;
+	}
+	nt->prepared = true;
+
+end:
+	if (ret < 0) {
+		regulator_bulk_disable(ARRAY_SIZE(nt->vregs), nt->vregs);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int nt35950_unprepare(struct drm_panel *panel)
+{
+	struct nt35950 *nt = to_nt35950(panel);
+	struct device *dev = &nt->dsi[0]->dev;
+	int ret;
+
+	if (!nt->prepared)
+		return 0;
+
+	ret = nt35950_off(nt);
+	if (ret < 0)
+		dev_err(dev, "Failed to deinitialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(nt->reset_gpio, 0);
+	regulator_bulk_disable(ARRAY_SIZE(nt->vregs), nt->vregs);
+
+	nt->prepared = false;
+	return 0;
+}
+
+static int nt35950_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
+{
+	struct nt35950 *nt = to_nt35950(panel);
+	int i;
+
+	for (i = 0; i < nt->desc->num_modes; i++) {
+		struct drm_display_mode *mode;
+
+		mode = drm_mode_duplicate(connector->dev,
+					  &nt->desc->mode_data[i].mode);
+		if (!mode)
+			return -ENOMEM;
+
+		drm_mode_set_name(mode);
+
+		mode->type |= DRM_MODE_TYPE_DRIVER;
+		if (nt->desc->num_modes == 1)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(connector, mode);
+	}
+
+	connector->display_info.bpc = 8;
+	connector->display_info.height_mm = nt->desc->mode_data[0].mode.height_mm;
+	connector->display_info.width_mm = nt->desc->mode_data[0].mode.width_mm;
+	nt->connector = connector;
+
+	return nt->desc->num_modes;
+}
+
+static const struct drm_panel_funcs nt35950_panel_funcs = {
+	.prepare = nt35950_prepare,
+	.unprepare = nt35950_unprepare,
+	.get_modes = nt35950_get_modes,
+};
+
+static int nt35950_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct device_node *dsi_r;
+	struct mipi_dsi_host *dsi_r_host;
+	struct nt35950 *nt;
+	const struct mipi_dsi_device_info *info;
+	int i, num_dsis = 1, ret;
+
+	nt = devm_kzalloc(dev, sizeof(*nt), GFP_KERNEL);
+	if (!nt)
+		return -ENOMEM;
+
+	ret = nt35950_sharp_init_vregs(nt, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Regulator init failure.\n");
+
+	nt->desc = of_device_get_match_data(dev);
+	if (!nt->desc)
+		return -ENODEV;
+
+	nt->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(nt->reset_gpio)) {
+		return dev_err_probe(dev, PTR_ERR(nt->reset_gpio),
+				     "Failed to get reset gpio\n");
+	}
+
+	/* If the panel is connected on two DSIs then DSI0 left, DSI1 right */
+	if (nt->desc->is_dual_dsi) {
+		info = &nt->desc->dsi_info;
+		dsi_r = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
+		if (!dsi_r) {
+			dev_err(dev, "Cannot get secondary DSI node.\n");
+			return -ENODEV;
+		}
+		dsi_r_host = of_find_mipi_dsi_host_by_node(dsi_r);
+		of_node_put(dsi_r);
+		if (!dsi_r_host) {
+			dev_err(dev, "Cannot get secondary DSI host\n");
+			return -EPROBE_DEFER;
+		}
+
+		nt->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
+		if (!nt->dsi[1]) {
+			dev_err(dev, "Cannot get secondary DSI node\n");
+			return -ENODEV;
+		}
+		num_dsis++;
+	}
+
+	nt->dsi[0] = dsi;
+	mipi_dsi_set_drvdata(dsi, nt);
+
+	drm_panel_init(&nt->panel, dev, &nt35950_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&nt->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&nt->panel);
+
+	for (i = 0; i < num_dsis; i++) {
+		nt->dsi[i]->lanes = nt->desc->num_lanes;
+		nt->dsi[i]->format = MIPI_DSI_FMT_RGB888;
+
+		nt->dsi[i]->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
+					 MIPI_DSI_MODE_LPM;
+
+		if (nt->desc->mode_data[0].is_video_mode)
+			nt->dsi[i]->mode_flags |= MIPI_DSI_MODE_VIDEO;
+
+		ret = mipi_dsi_attach(nt->dsi[i]);
+		if (ret < 0) {
+			return dev_err_probe(dev, ret,
+					     "Cannot attach to DSI%d host.\n", i);
+		}
+	}
+
+	/* Make sure to set RESX LOW before starting the power-on sequence */
+	gpiod_set_value_cansleep(nt->reset_gpio, 0);
+	return 0;
+}
+
+static int nt35950_remove(struct mipi_dsi_device *dsi)
+{
+	struct nt35950 *nt = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(nt->dsi[0]);
+	if (ret < 0)
+		dev_err(&dsi->dev,
+			"Failed to detach from DSI0 host: %d\n", ret);
+
+	if (nt->dsi[1]) {
+		ret = mipi_dsi_detach(nt->dsi[1]);
+		if (ret < 0)
+			dev_err(&dsi->dev,
+				"Failed to detach from DSI1 host: %d\n", ret);
+		mipi_dsi_device_unregister(nt->dsi[1]);
+	};
+
+	drm_panel_remove(&nt->panel);
+
+	return 0;
+}
+
+static const struct nt35950_panel_mode sharp_ls055d1sx04_modes[] = {
+	{
+		/* 1920x1080 60Hz no compression */
+		.mode = {
+			.clock = 214537,
+			.hdisplay = 1080,
+			.hsync_start = 1080 + 400,
+			.hsync_end = 1080 + 400 + 40,
+			.htotal = 1080 + 400 + 40 + 300,
+			.vdisplay = 1920,
+			.vsync_start = 1920 + 12,
+			.vsync_end = 1920 + 12 + 2,
+			.vtotal = 1920 + 12 + 2 + 10,
+			.width_mm = 68,
+			.height_mm = 121,
+		},
+		.compression = MCS_DATA_COMPRESSION_NONE,
+		.enable_sram = true,
+		.is_video_mode = false,
+		.scaler_on = 1,
+		.scaler_mode = MCS_SCALEUP_DUPLICATE,
+	},
+	/* TODO: Add 2160x3840 60Hz when DSC is supported */
+};
+
+const struct nt35950_panel_desc sharp_ls055d1sx04 = {
+	.model_name = "Sharp LS055D1SX04",
+	.dsi_info = {
+		.type = "LS055D1SX04",
+		.channel = 0,
+		.node = NULL,
+	},
+	.mode_data = sharp_ls055d1sx04_modes,
+	.num_modes = ARRAY_SIZE(sharp_ls055d1sx04_modes),
+	.is_dual_dsi = true,
+	.num_lanes = 4,
+};
+
+static const struct of_device_id nt35950_of_match[] = {
+	{ .compatible = "sharp,ls055d1sx04", .data = &sharp_ls055d1sx04 },
+	{  }
+};
+MODULE_DEVICE_TABLE(of, nt35950_of_match);
+
+static struct mipi_dsi_driver nt35950_driver = {
+	.probe = nt35950_probe,
+	.remove = nt35950_remove,
+	.driver = {
+		.name = "panel-novatek-nt35950",
+		.of_match_table = nt35950_of_match,
+	},
+};
+module_mipi_dsi_driver(nt35950_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>");
+MODULE_DESCRIPTION("Novatek NT35950 DriverIC panels driver");
+MODULE_LICENSE("GPL v2");
-- 
2.32.0

