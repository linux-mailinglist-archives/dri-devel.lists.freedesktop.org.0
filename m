Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F2339C78C
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 12:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C496E4C4;
	Sat,  5 Jun 2021 10:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C8E6E4C4
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 10:49:54 +0000 (UTC)
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl
 [83.6.168.161])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id 398BF3EBCE;
 Sat,  5 Jun 2021 12:49:50 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 2/2] drm/panel: Add support for SONY JDI Synaptics panel
Date: Sat,  5 Jun 2021 12:49:41 +0200
Message-Id: <20210605104942.39487-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605104942.39487-1-konrad.dybcio@somainline.org>
References: <20210605104942.39487-1-konrad.dybcio@somainline.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

This commit adds support for Synaptics+JDI display panels
used in SONY Xperia X, X Compact, X Performance, XZ and XZs
smartphones.

Due to the nature of phone manufacturing, it is impossible
to retrieve the actual panel names, hence the replacement
ones, detailing the devices they are used on.

Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-sony-synaptics-jdi.c  | 511 ++++++++++++++++++
 3 files changed, 522 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-sony-synaptics-jdi.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 47a3348acfc6..ac76cca2947e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -514,6 +514,16 @@ config DRM_PANEL_SONY_ACX565AKM
 	  Say Y here if you want to enable support for the Sony ACX565AKM
 	  800x600 3.5" panel (found on the Nokia N900).
 
+config DRM_PANEL_SONY_SYNAPTICS_JDI
+	tristate "SONY Synaptics JDI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Synaptics+JDI hybrid
+	  in-cell 720x1280/1080x1920 up-to 120Hz panels found in some SONY
+	  Xperia X, X Performance, X Compact, XZ and XZs devices.
+
 config DRM_PANEL_TDO_TL070WSH30
 	tristate "TDO TL070WSH30 DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 2fca73ba06cb..70ad719ec712 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) += panel-sony-acx424akp.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
+obj-$(CONFIG_DRM_PANEL_SONY_SYNAPTICS_JDI) += panel-sony-synaptics-jdi.o
 obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
diff --git a/drivers/gpu/drm/panel/panel-sony-synaptics-jdi.c b/drivers/gpu/drm/panel/panel-sony-synaptics-jdi.c
new file mode 100644
index 000000000000..2b1972dea58a
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-sony-synaptics-jdi.c
@@ -0,0 +1,511 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+ * Copyright (C) 2021 Konrad Dybcio <konrad.dybcio@somainline.org>
+ *
+ * Parameters from dsi-panel-somc-synaptics-jdi-1080p-cmd.dtsi
+ * and dsi-panel-somc-synaptics-jdi-720p-cmd.dtsi from SONY stock kernel.
+ */
+
+#include <linux/backlight.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_mipi_dsi.h>
+#include <linux/delay.h>
+
+enum synaptics_jdi_type {
+	TYPE_FHD60HZ_SONY_KAGURA,
+	TYPE_FHD60HZ_SONY_SUZU,
+	TYPE_HD60HZ_SONY_KUGO,
+};
+
+struct synaptics_jdi_panel_desc {
+	const struct drm_display_mode *mode;
+	enum synaptics_jdi_type type;
+};
+
+struct synaptics_jdi_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *dsi;
+
+	struct backlight_device *backlight;
+
+	struct regulator_bulk_data supplies[5];
+
+	struct gpio_desc *pan_reset_gpio;
+	struct gpio_desc *ts_reset_gpio;
+
+	bool prepared;
+	bool enabled;
+
+	const struct synaptics_jdi_panel_desc *desc;
+};
+
+/* FHD panel initialization sequences */
+static const u8 cmd_on1[2] = {0xB0, 0x00};
+static const u8 cmd_on2[2] = {0xD6, 0x01};
+static const u8 cmd_on3[3] = {0xC4, 0x70, 0x03};
+static const u8 cmd_on4[27] = {
+	0xED, 0x27, 0x31, 0x2F, 0x13, 0x00, 0x6A, 0x99,
+	0x03, 0x17, 0x91, 0xF2, 0x00, 0x00, 0x03, 0x14,
+	0x17, 0x3F, 0x14, 0x12, 0x26, 0x23, 0x00, 0x20,
+	0x00, 0x00, 0x57
+};
+static const u8 cmd_on5[27] = {
+	0xEE, 0x13, 0x61, 0x5F, 0x09, 0x00, 0x6A, 0x99,
+	0x03, 0x00, 0x01, 0xB2, 0x00, 0x00, 0x03, 0x00,
+	0x00, 0x33, 0x14, 0x12, 0x00, 0x21, 0x00, 0x20,
+	0x00, 0x00, 0x57
+};
+static const u8 cmd_on6[27] = {
+	0xEF, 0x27, 0x31, 0x2F, 0x13, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x14,
+	0x17, 0x0F, 0x14, 0x00, 0x00, 0x20, 0x00, 0x00,
+	0x00, 0x00, 0xA6
+};
+static const u8 cmd_on7[27] = {
+	0xF0, 0xE3, 0x07, 0x73, 0xDF, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xE3, 0x00,
+	0x00, 0x03, 0x14, 0x00, 0x00, 0x20, 0x00, 0x00,
+	0x00, 0x00, 0xA7
+};
+static const u8 cmd_on8[2] = {0x35, 0x00};
+static const u8 cmd_on9[2] = {0x36, 0x00};
+static const u8 cmd_on10[2] = {0x3A, 0x77};
+static const u8 cmd_on11[5] = {0x2A, 0x00, 0x00, 0x04, 0x37};
+static const u8 cmd_on12[5] = {0x2B, 0x00, 0x00, 0x07, 0x7F};
+static const u8 cmd_on13[3] = {0x44, 0x00, 0x00};
+static const u8 cmd_off_unk4[14] = {
+	0xEC, 0x64, 0xDC, 0x7A, 0x7A, 0x3D, 0x00, 0x0B,
+	0x0B, 0x13, 0x15, 0x68, 0x0B, 0x95,
+};
+
+/* HD panel initialization sequences */
+static const u8 cmd_on4_hd[14] = {
+	0xEC, 0x64, 0xDC, 0x7A, 0x7A, 0x3D, 0x00, 0x0B,
+	0x0B, 0x13, 0x15, 0x68, 0x0B, 0xB5,
+};
+static const u8 cmd_on5_hd[2] = {0xB0, 0x03};
+static const u8 cmd_on6_hd[2] = {0x35, 0x00};
+static const u8 cmd_on7_hd[2] = {0x36, 0x00};
+static const u8 cmd_on8_hd[2] = {0x3A, 0x77};
+static const u8 cmd_on9_hd[5] = {0x2A, 0x00, 0x00, 0x02, 0xCF};
+static const u8 cmd_on10_hd[5] = {0x2B, 0x00, 0x00, 0x04, 0xFF};
+static const u8 cmd_on11_hd[3] = {0x44, 0x00, 0x00};
+
+static inline struct synaptics_jdi_panel *to_synaptics_jdi_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct synaptics_jdi_panel, base);
+}
+
+static int synaptics_jdi_panel_enable(struct drm_panel *panel)
+{
+	struct synaptics_jdi_panel *synaptics_jdi_panel = to_synaptics_jdi_panel(panel);
+
+	if (synaptics_jdi_panel->enabled)
+		return 0;
+
+	synaptics_jdi_panel->enabled = true;
+
+	return 0;
+}
+
+static int synaptics_jdi_panel_init(struct synaptics_jdi_panel *synaptics_jdi_panel)
+{
+	synaptics_jdi_panel->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on1, sizeof(cmd_on1));
+	mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on2, sizeof(cmd_on2));
+	mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on3, sizeof(cmd_on3));
+
+	if (synaptics_jdi_panel->desc->type == TYPE_HD60HZ_SONY_KUGO) {
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on4_hd, sizeof(cmd_on4_hd));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on5_hd, sizeof(cmd_on5_hd));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on6_hd, sizeof(cmd_on6_hd));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on7_hd, sizeof(cmd_on7_hd));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on8_hd, sizeof(cmd_on8_hd));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on9_hd, sizeof(cmd_on9_hd));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on10_hd, sizeof(cmd_on10_hd));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on11_hd, sizeof(cmd_on11_hd));
+	} else {
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on4, sizeof(cmd_on4));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on5, sizeof(cmd_on5));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on6, sizeof(cmd_on6));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on7, sizeof(cmd_on7));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on8, sizeof(cmd_on8));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on9, sizeof(cmd_on9));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on10, sizeof(cmd_on10));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on11, sizeof(cmd_on11));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on12, sizeof(cmd_on12));
+		mipi_dsi_generic_write(synaptics_jdi_panel->dsi, cmd_on13, sizeof(cmd_on13));
+	}
+
+	mipi_dsi_dcs_exit_sleep_mode(synaptics_jdi_panel->dsi);
+
+	msleep(120);
+
+	return 0;
+}
+
+static int synaptics_jdi_panel_on(struct synaptics_jdi_panel *synaptics_jdi_panel)
+{
+	struct device *dev = &synaptics_jdi_panel->dsi->dev;
+	int ret = 0;
+
+	ret = mipi_dsi_dcs_set_display_on(synaptics_jdi_panel->dsi);
+	if (ret < 0) {
+		dev_err(dev, "Cannot send disp on cmd: %d\n", ret);
+		return ret;
+	}
+
+	msleep(120);
+
+	return ret;
+}
+
+static int synaptics_jdi_panel_disable(struct drm_panel *panel)
+{
+	struct synaptics_jdi_panel *synaptics_jdi_panel = to_synaptics_jdi_panel(panel);
+
+	if (!synaptics_jdi_panel->enabled)
+		return 0;
+
+	synaptics_jdi_panel->enabled = false;
+
+	return 0;
+}
+
+static int synaptics_jdi_panel_off(struct synaptics_jdi_panel *synaptics_jdi_panel)
+{
+	struct device *dev = &synaptics_jdi_panel->dsi->dev;
+	int ret = 0;
+
+	synaptics_jdi_panel->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(synaptics_jdi_panel->dsi);
+	if (ret < 0)
+		dev_err(dev, "Cannot set display off: %d\n", ret);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(synaptics_jdi_panel->dsi);
+	if (ret < 0)
+		dev_err(dev, "Cannot enter sleep mode: %d\n", ret);
+
+	msleep(100);
+
+	return ret;
+}
+
+static int synaptics_jdi_panel_unprepare(struct drm_panel *panel)
+{
+	struct synaptics_jdi_panel *synaptics_jdi_panel = to_synaptics_jdi_panel(panel);
+
+	if (!synaptics_jdi_panel->prepared)
+		return 0;
+
+	if (synaptics_jdi_panel->ts_reset_gpio) {
+		gpiod_set_value(synaptics_jdi_panel->ts_reset_gpio, 0);
+		usleep_range(10000, 11000);
+	}
+
+	synaptics_jdi_panel_off(synaptics_jdi_panel);
+
+	regulator_bulk_disable(ARRAY_SIZE(synaptics_jdi_panel->supplies),
+			synaptics_jdi_panel->supplies);
+
+	if (synaptics_jdi_panel->pan_reset_gpio) {
+		gpiod_set_value(synaptics_jdi_panel->pan_reset_gpio, 0);
+		usleep_range(10000, 11000);
+	}
+
+	synaptics_jdi_panel->prepared = false;
+
+	return 0;
+}
+
+static int synaptics_jdi_panel_prepare(struct drm_panel *panel)
+{
+	struct synaptics_jdi_panel *synaptics_jdi_panel = to_synaptics_jdi_panel(panel);
+	struct device *dev = &synaptics_jdi_panel->dsi->dev;
+	int ret = 0;
+
+	if (synaptics_jdi_panel->prepared)
+		return 0;
+
+	/* Power rail VDDIO -> in-cell panel main */
+	ret = regulator_enable(synaptics_jdi_panel->supplies[0].consumer);
+	if (ret < 0)
+		return ret;
+
+	msleep(80);
+
+	/* Power rail AVDD -> in-cell touch-controller main */
+	ret = regulator_enable(synaptics_jdi_panel->supplies[1].consumer);
+	if (ret < 0)
+		dev_err(dev, "Cannot enable AVDD: %d\n", ret);
+	else
+		usleep_range(1000, 1100);
+
+	ret = regulator_enable(synaptics_jdi_panel->supplies[3].consumer);
+	if (ret < 0) {
+		dev_err(dev, "Cannot enable VSP: %d\n", ret);
+		goto poweroff_s1;
+	}
+
+	ret = regulator_enable(synaptics_jdi_panel->supplies[4].consumer);
+	if (ret < 0) {
+		dev_err(dev, "Cannot enable VSN: %d\n", ret);
+		goto poweroff_s1;
+	}
+
+	/* Enable the in-cell supply to panel */
+	ret = regulator_enable(synaptics_jdi_panel->supplies[2].consumer);
+	if (ret < 0) {
+		dev_err(dev, "Cannot enable TVDD: %d\n", ret);
+		goto poweroff_s1;
+	} else {
+		usleep_range(1000, 1100);
+	}
+
+	if (synaptics_jdi_panel->ts_reset_gpio)
+		gpiod_set_value(synaptics_jdi_panel->ts_reset_gpio, 1);
+
+	if (synaptics_jdi_panel->pan_reset_gpio) {
+		gpiod_set_value(synaptics_jdi_panel->pan_reset_gpio, 0);
+		usleep_range(10000, 11000);
+		gpiod_set_value(synaptics_jdi_panel->pan_reset_gpio, 1);
+		usleep_range(10000, 11000);
+	};
+
+	ret = synaptics_jdi_panel_init(synaptics_jdi_panel);
+	if (ret < 0) {
+		dev_err(dev, "Cannot initialize panel: %d\n", ret);
+		goto poweroff_s2;
+	}
+
+	ret = synaptics_jdi_panel_on(synaptics_jdi_panel);
+	if (ret < 0) {
+		dev_err(dev, "Cannot poweron panel: %d\n", ret);
+		goto poweroff_s2;
+	}
+
+	synaptics_jdi_panel->prepared = true;
+
+	return 0;
+
+poweroff_s2:
+	/* Disable tvdd to avoid current/voltage spikes in the enable path */
+	regulator_disable(synaptics_jdi_panel->supplies[2].consumer);
+poweroff_s1:
+	regulator_disable(synaptics_jdi_panel->supplies[1].consumer);
+	regulator_disable(synaptics_jdi_panel->supplies[0].consumer);
+
+	return ret;
+}
+
+static const struct drm_display_mode fhd60hz_suzu_mode = {
+	.clock = 149506,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 56,
+	.hsync_end = 1080 + 56 + 8,
+	.htotal = 1080 + 56 + 8 + 8,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 227,
+	.vsync_end = 1920 + 227 + 8,
+	.vtotal = 1920 + 227 + 8 + 8,
+	.width_mm = 61,
+	.height_mm = 110,
+};
+
+static const struct synaptics_jdi_panel_desc fhd60hz_suzu = {
+	.mode = &fhd60hz_suzu_mode,
+	.type = TYPE_FHD60HZ_SONY_SUZU,
+};
+
+static const struct drm_display_mode fhd60hz_kagura_mode = {
+	.clock = 149506,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 56,
+	.hsync_end = 1080 + 56 + 8,
+	.htotal = 1080 + 56 + 8 + 8,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 227,
+	.vsync_end = 1920 + 227 + 8,
+	.vtotal = 1920 + 227 + 8 + 8,
+	.width_mm = 64,
+	.height_mm = 114,
+};
+
+static const struct synaptics_jdi_panel_desc fhd60hz_kagura = {
+	.mode = &fhd60hz_kagura_mode,
+	.type = TYPE_FHD60HZ_SONY_KAGURA,
+};
+
+static const struct drm_display_mode hd60hz_kugo_mode = {
+	.clock = 149506,
+	.hdisplay = 720,
+	.hsync_start = 720 + 20,
+	.hsync_end = 720 + 20 + 8,
+	.htotal = 720 + 20 + 8 + 8,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 2000,
+	.vsync_end = 1280 + 2000 + 8,
+	.vtotal = 1280 + 2000 + 8 + 8,
+	.width_mm = 56,
+	.height_mm = 100,
+};
+
+static const struct synaptics_jdi_panel_desc hd60hz_kugo = {
+	.mode = &hd60hz_kugo_mode,
+	.type = TYPE_HD60HZ_SONY_KUGO,
+};
+
+static int synaptics_jdi_panel_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	struct synaptics_jdi_panel *ctx = container_of(panel, struct synaptics_jdi_panel, base);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
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
+static const struct drm_panel_funcs synaptics_jdi_panel_funcs = {
+	.disable = synaptics_jdi_panel_disable,
+	.unprepare = synaptics_jdi_panel_unprepare,
+	.prepare = synaptics_jdi_panel_prepare,
+	.enable = synaptics_jdi_panel_enable,
+	.get_modes = synaptics_jdi_panel_get_modes,
+};
+
+static const struct of_device_id synaptics_jdi_of_match[] = {
+	{ .compatible = "sony,synaptics-jdi-dora", .data = &fhd60hz_suzu },
+	{ .compatible = "sony,synaptics-jdi-kagura", .data = &fhd60hz_kagura },
+	{ .compatible = "sony,synaptics-jdi-keyaki", .data = &fhd60hz_kagura },
+	{ .compatible = "sony,synaptics-jdi-kugo", .data = &hd60hz_kugo },
+	{ .compatible = "sony,synaptics-jdi-suzu", .data = &fhd60hz_suzu },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, synaptics_jdi_of_match);
+
+static int synaptics_jdi_panel_add(struct synaptics_jdi_panel *synaptics_jdi_panel)
+{
+	struct device *dev = &synaptics_jdi_panel->dsi->dev;
+	int ret = 0;
+
+	synaptics_jdi_panel->supplies[0].supply = "vddio";
+	synaptics_jdi_panel->supplies[1].supply = "avdd";
+	synaptics_jdi_panel->supplies[2].supply = "tvdd";
+	synaptics_jdi_panel->supplies[3].supply = "vsp";
+	synaptics_jdi_panel->supplies[4].supply = "vsn";
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(synaptics_jdi_panel->supplies),
+			synaptics_jdi_panel->supplies);
+
+	synaptics_jdi_panel->pan_reset_gpio = devm_gpiod_get(dev, "preset", GPIOD_ASIS);
+	if (IS_ERR(synaptics_jdi_panel->pan_reset_gpio)) {
+		dev_err(dev, "cannot get preset-gpio: %ld\n",
+			PTR_ERR(synaptics_jdi_panel->pan_reset_gpio));
+		synaptics_jdi_panel->pan_reset_gpio = NULL;
+	}
+
+	synaptics_jdi_panel->ts_reset_gpio = devm_gpiod_get(dev, "treset", GPIOD_ASIS);
+	if (IS_ERR(synaptics_jdi_panel->ts_reset_gpio)) {
+		dev_err(dev, "cannot get treset-gpio: %ld\n",
+			PTR_ERR(synaptics_jdi_panel->ts_reset_gpio));
+		synaptics_jdi_panel->ts_reset_gpio = NULL;
+	}
+
+	drm_panel_init(&synaptics_jdi_panel->base, &synaptics_jdi_panel->dsi->dev,
+				&synaptics_jdi_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	drm_panel_add(&synaptics_jdi_panel->base);
+
+	return ret;
+}
+
+static void synaptics_jdi_panel_del(struct synaptics_jdi_panel *synaptics_jdi_panel)
+{
+	if (synaptics_jdi_panel->base.dev)
+		drm_panel_remove(&synaptics_jdi_panel->base);
+}
+
+static int synaptics_jdi_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct synaptics_jdi_panel *synaptics_jdi_panel;
+	int ret;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	synaptics_jdi_panel = devm_kzalloc(&dsi->dev, sizeof(*synaptics_jdi_panel), GFP_KERNEL);
+	if (!synaptics_jdi_panel)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, synaptics_jdi_panel);
+	synaptics_jdi_panel->dsi = dsi;
+	synaptics_jdi_panel->desc = of_device_get_match_data(&dsi->dev);
+
+	ret = synaptics_jdi_panel_add(synaptics_jdi_panel);
+	if (ret < 0)
+		return ret;
+
+	return mipi_dsi_attach(dsi);
+}
+
+static int synaptics_jdi_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct synaptics_jdi_panel *synaptics_jdi_panel = mipi_dsi_get_drvdata(dsi);
+	struct device *dev = &synaptics_jdi_panel->dsi->dev;
+	int ret;
+
+	ret = synaptics_jdi_panel_disable(&synaptics_jdi_panel->base);
+	if (ret < 0)
+		dev_err(dev, "failed to disable panel: %d\n", ret);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(dev, "Cannot detach from DSI host: %d\n", ret);
+
+	synaptics_jdi_panel_del(synaptics_jdi_panel);
+
+	return 0;
+}
+
+static void synaptics_jdi_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct synaptics_jdi_panel *synaptics_jdi_panel = mipi_dsi_get_drvdata(dsi);
+
+	synaptics_jdi_panel_disable(&synaptics_jdi_panel->base);
+}
+
+static struct mipi_dsi_driver synaptics_jdi_panel_driver = {
+	.driver = {
+		.name = "panel-sony-synaptics-jdi",
+		.of_match_table = synaptics_jdi_of_match,
+	},
+	.probe = synaptics_jdi_panel_probe,
+	.remove = synaptics_jdi_panel_remove,
+	.shutdown = synaptics_jdi_panel_shutdown,
+};
+module_mipi_dsi_driver(synaptics_jdi_panel_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>");
+MODULE_AUTHOR("Konrad Dybcio <konrad.dybcio@somainline.org>");
+MODULE_DESCRIPTION("SONY Synaptics JDI panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.31.1

