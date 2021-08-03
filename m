Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C33DF3E5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 19:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3176E8A4;
	Tue,  3 Aug 2021 17:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD636E8A3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 17:25:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y34so40991046lfa.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mXaWfCBJ15QkkxOL37ql3IzMIyK5Ar2gtetOmCZgwyA=;
 b=KWMW7mCYEw1voGvv4a+mwkTa09OVWeawTceZ/yFz2Z5f8F8RvD07gJ03MY7vc2Hux3
 un15tOYhrLvMQKk8VqxSqoVHWNxU85Qwg8Z2Tg2t+EFDe59oFyWZUNxte3qK1wpwyq4N
 hb0Q7le1VxFi22b4Ps42pB+AzKCCe0hLiyS//sfStWga1fBcVqO0LD6Fb15DlmyK8fLc
 uFBmQ8Ip0BuriyTyRdDzAodlF8ptgfQlkQy+tFeAQNfLjZ5gLDrtkgAc2OKfrTdSMUjP
 tksxrHyTFUu0vrIZ5r+4HGWRm4OVtP/1oA2XPGiALuA2TCVSElwLdI/POVMcLMPqRop0
 t/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mXaWfCBJ15QkkxOL37ql3IzMIyK5Ar2gtetOmCZgwyA=;
 b=fvLdel7sGAa/V5JSyA1jAGHypUujzpICwIPoYO9tiUQSR4EujKsvl7SkdM2ytb4jGW
 FH6ZyBI/OvnD4M7nAg51/gtl+o9FE9QpBYaWbOTdad+92Cqoi8jJrMq0RV6iEdeFHiII
 AzIw9a2OczevuJB4BHpWvsT7AcmudxEQ751LaBGgNV/5aDOnUl20T9qwwXY8JrWc881d
 PYoV0vnUZkfR8nile4DyrXvm27SLyRfpg++Rvs2KaulLJs4ry8PweLutjJkQl6ZO0g3+
 3Bi/3HUlnB2vQ0+BVXiRZXvWiFM25nMNeKWoxOHf/bidqlwydDl5ciO/jf7ZkylmECVk
 D5AA==
X-Gm-Message-State: AOAM53168dDxtEuaLhX4cepnhmXAd+5OXUiAOGzfRvLt3RJ6NJQ6LWko
 x83NujiydzjYtLqwpfp26xE=
X-Google-Smtp-Source: ABdhPJwKcG7oFk2MQThYkSj+PhWyNTzT8d1DwypcJWkqkO1SJjCKV1NcJzhbsx4gz0R3BuF1YvcSTQ==
X-Received: by 2002:ac2:484c:: with SMTP id 12mr8732399lfy.31.1628011541066;
 Tue, 03 Aug 2021 10:25:41 -0700 (PDT)
Received: from nergzd-desktop.localdomain ([62.122.67.26])
 by smtp.gmail.com with ESMTPSA id g11sm1147618ljl.139.2021.08.03.10.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 10:25:40 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, phone-devel@vger.kernel.org,
 Markuss Broks <markuss.broks@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel: s6d27a1: Add driver for Samsung S6D27A1 display
 panel
Date: Tue,  3 Aug 2021 20:24:50 +0300
Message-Id: <20210803172458.10971-1-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <YQlWk5yoAAe4SRZX@ravnborg.org>
References: <YQlWk5yoAAe4SRZX@ravnborg.org>
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

This adds a driver for Samsung S6D27A1 display controller and panel.
This panel is found in the Samsung GT-I8160 mobile phone,
and possibly some other mobile phones.

This display needs manufacturer commands to configure it to a working state;
the commands used in this driver were taken from downstream driver
by Gareth Phillips; sadly, there is almost no documentation on what they
actually do.

This driver re-uses the DBI infrastructure to communicate with the display.

This driver is heavily based on WideChips WS2401 display controller
driver by Linus Walleij and on other panel drivers for reference.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c | 323 ++++++++++++++++++
 3 files changed, 332 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index f4fe1dba99..21007b2032 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -348,6 +348,14 @@ config DRM_PANEL_SAMSUNG_S6D16D0
 	depends on DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_SAMSUNG_S6D27A1
+	tristate "Samsung S6D27A1 DPI panel driver"
+	depends on OF && SPI && GPIOLIB
+	select DRM_MIPI_DBI
+	help
+	  Say Y here if you want to enable support for the Samsung
+	  S6D27A1 DPI 480x800 panel.
+
 config DRM_PANEL_SAMSUNG_S6E3HA2
 	tristate "Samsung S6E3HA2 DSI video mode panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index d94c27df17..d2a6fe81e9 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c b/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
new file mode 100644
index 0000000000..073454349d
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Panel driver for the Samsung S6D27A1 480x800 DPI RGB panel.
+ * Found in the Samsung Galaxy Ace 2 GT-I8160 mobile phone.
+ */
+
+#include <drm/drm_modes.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_panel.h>
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+
+#include <video/mipi_display.h>
+
+#define S6D27A1_PASSWD_L2	0xF0	/* Password Command for Level 2 Control */
+#define S6D27A1_RESCTL		0xB3	/* Resolution Select Control */
+#define S6D27A1_PANELCTL2	0xB4	/* ASG Signal Control */
+#define S6D27A1_READID1		0xDA	/* Read panel ID 1 */
+#define S6D27A1_READID2		0xDB	/* Read panel ID 2 */
+#define S6D27A1_READID3		0xDC	/* Read panel ID 3 */
+#define S6D27A1_DISPCTL		0xF2	/* Display Control */
+#define S6D27A1_MANPWR		0xF3	/* Manual Control */
+#define S6D27A1_PWRCTL1		0xF4	/* Power Control */
+#define S6D27A1_SRCCTL		0xF6	/* Source Control */
+#define S6D27A1_PANELCTL	0xF7	/* Panel Control*/
+
+static const u8 s6d27a1_dbi_read_commands[] = {
+	S6D27A1_READID1,
+	S6D27A1_READID2,
+	S6D27A1_READID3,
+	0, /* sentinel */
+};
+
+struct s6d27a1 {
+	struct device *dev;
+	struct mipi_dbi dbi;
+	struct drm_panel panel;
+	struct gpio_desc *reset;
+	struct regulator_bulk_data regulators[2];
+};
+
+static const struct drm_display_mode s6d27a1_480_800_mode = {
+	/*
+	 * The vendor driver states that the S6D27A1 panel
+	 * has a pixel clock frequency of 49920000 Hz / 2 = 24960000 Hz.
+	 */
+	.clock = 24960,
+	.hdisplay = 480,
+	.hsync_start = 480 + 63,
+	.hsync_end = 480 + 63 + 2,
+	.htotal = 480 + 63 + 2 + 63,
+	.vdisplay = 800,
+	.vsync_start = 800 + 11,
+	.vsync_end = 800 + 11 + 2,
+	.vtotal = 800 + 11 + 2 + 10,
+	.width_mm = 50,
+	.height_mm = 84,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static inline struct s6d27a1 *to_s6d27a1(struct drm_panel *panel)
+{
+	return container_of(panel, struct s6d27a1, panel);
+}
+
+#define s6d27a1_command(ctx, cmd, seq...) \
+({ \
+	struct mipi_dbi *dbi = &ctx->dbi; \
+	int ret; \
+	ret = mipi_dbi_command(dbi, cmd, seq);	\
+	if (ret) { \
+		dev_err(ctx->dev, "failure in writing command %02x\n", cmd); \
+	} \
+})
+
+static void s6d27a1_read_mtp_id(struct s6d27a1 *ctx)
+{
+	struct mipi_dbi *dbi = &ctx->dbi;
+	u8 id1, id2, id3;
+	int ret;
+
+	ret = mipi_dbi_command_read(dbi, S6D27A1_READID1, &id1);
+	if (ret) {
+		dev_err(ctx->dev, "unable to read MTP ID 1\n");
+		return;
+	}
+	ret = mipi_dbi_command_read(dbi, S6D27A1_READID2, &id2);
+	if (ret) {
+		dev_err(ctx->dev, "unable to read MTP ID 2\n");
+		return;
+	}
+	ret = mipi_dbi_command_read(dbi, S6D27A1_READID3, &id3);
+	if (ret) {
+		dev_err(ctx->dev, "unable to read MTP ID 3\n");
+		return;
+	}
+	dev_info(ctx->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
+}
+
+static int s6d27a1_power_on(struct s6d27a1 *ctx)
+{
+	int ret;
+
+	/* Power up */
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->regulators),
+				    ctx->regulators);
+	if (ret) {
+		dev_err(ctx->dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	msleep(20);
+
+	/* Assert reset >=1 ms */
+	gpiod_set_value_cansleep(ctx->reset, 1);
+	usleep_range(1000, 5000);
+	/* De-assert reset */
+	gpiod_set_value_cansleep(ctx->reset, 0);
+	/* Wait >= 10 ms */
+	msleep(20);
+
+	/*
+	 * Exit sleep mode and initialize display - some hammering is
+	 * necessary.
+	 */
+	s6d27a1_command(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
+	s6d27a1_command(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(50);
+
+	/* Magic to unlock level 2 control of the display */
+	s6d27a1_command(ctx, S6D27A1_PASSWD_L2, 0x5A, 0x5A);
+
+	/* Configure resolution to 480RGBx800 */
+	s6d27a1_command(ctx, S6D27A1_RESCTL, 0x22);
+
+	s6d27a1_command(ctx, S6D27A1_PANELCTL2, 0x00, 0x02, 0x03, 0x04, 0x05, 0x08, 0x00, 0x0c);
+
+	s6d27a1_command(ctx, S6D27A1_MANPWR, 0x01, 0x00, 0x00, 0x08, 0x08, 0x02, 0x00);
+
+	s6d27a1_command(ctx, S6D27A1_DISPCTL, 0x19, 0x00, 0x08, 0x0D, 0x03, 0x41, 0x3F);
+
+	s6d27a1_command(ctx, S6D27A1_PWRCTL1, 0x00, 0x00, 0x00, 0x00, 0x55,
+						0x44, 0x05, 0x88, 0x4B, 0x50);
+
+	s6d27a1_command(ctx, S6D27A1_SRCCTL, 0x03, 0x09, 0x8A, 0x00, 0x01, 0x16);
+
+	s6d27a1_command(ctx, S6D27A1_PANELCTL, 0x00, 0x05, 0x06, 0x07, 0x08,
+						0x01, 0x09, 0x0D, 0x0A, 0x0E,
+						0x0B, 0x0F, 0x0C, 0x10, 0x01,
+						0x11, 0x12, 0x13, 0x14, 0x05,
+						0x06, 0x07, 0x08, 0x01, 0x09,
+						0x0D, 0x0A, 0x0E, 0x0B, 0x0F,
+						0x0C, 0x10, 0x01, 0x11, 0x12,
+						0x13, 0x14);
+
+	/* lock the level 2 control */
+	s6d27a1_command(ctx, S6D27A1_PASSWD_L2, 0xA5, 0xA5);
+
+	s6d27a1_read_mtp_id(ctx);
+
+	return 0;
+}
+
+static int s6d27a1_power_off(struct s6d27a1 *ctx)
+{
+	/* Go into RESET and disable regulators */
+	gpiod_set_value_cansleep(ctx->reset, 1);
+	return regulator_bulk_disable(ARRAY_SIZE(ctx->regulators),
+				      ctx->regulators);
+}
+
+static int s6d27a1_unprepare(struct drm_panel *panel)
+{
+	struct s6d27a1 *ctx = to_s6d27a1(panel);
+
+	s6d27a1_command(ctx, MIPI_DCS_ENTER_SLEEP_MODE);
+	msleep(120);
+	return s6d27a1_power_off(to_s6d27a1(panel));
+}
+
+static int s6d27a1_disable(struct drm_panel *panel)
+{
+	struct s6d27a1 *ctx = to_s6d27a1(panel);
+
+	s6d27a1_command(ctx, MIPI_DCS_SET_DISPLAY_OFF);
+	msleep(25);
+
+	return 0;
+}
+
+static int s6d27a1_prepare(struct drm_panel *panel)
+{
+	return s6d27a1_power_on(to_s6d27a1(panel));
+}
+
+static int s6d27a1_enable(struct drm_panel *panel)
+{
+	struct s6d27a1 *ctx = to_s6d27a1(panel);
+
+	s6d27a1_command(ctx, MIPI_DCS_SET_DISPLAY_ON);
+
+	return 0;
+}
+
+static int s6d27a1_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
+{
+	struct s6d27a1 *ctx = to_s6d27a1(panel);
+	struct drm_display_mode *mode;
+	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	mode = drm_mode_duplicate(connector->dev, &s6d27a1_480_800_mode);
+	if (!mode) {
+		dev_err(ctx->dev, "failed to add mode\n");
+		return -ENOMEM;
+	}
+
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bus_flags =
+		DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &bus_format, 1);
+
+	drm_mode_set_name(mode);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs s6d27a1_drm_funcs = {
+	.disable = s6d27a1_disable,
+	.unprepare = s6d27a1_unprepare,
+	.prepare = s6d27a1_prepare,
+	.enable = s6d27a1_enable,
+	.get_modes = s6d27a1_get_modes,
+};
+
+static int s6d27a1_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct s6d27a1 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = dev;
+
+	/*
+	 * VCI   is the analog voltage supply
+	 * VCCIO is the digital I/O voltage supply
+	 */
+	ctx->regulators[0].supply = "vci";
+	ctx->regulators[1].supply = "vccio";
+	ret = devm_regulator_bulk_get(dev,
+				      ARRAY_SIZE(ctx->regulators),
+				      ctx->regulators);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ctx->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset)) {
+		ret = PTR_ERR(ctx->reset);
+		return dev_err_probe(dev, ret, "no RESET GPIO\n");
+	}
+
+	ret = mipi_dbi_spi_init(spi, &ctx->dbi, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
+
+	ctx->dbi.read_commands = s6d27a1_dbi_read_commands;
+
+	drm_panel_init(&ctx->panel, dev, &s6d27a1_drm_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	spi_set_drvdata(spi, ctx);
+
+	drm_panel_add(&ctx->panel);
+	dev_dbg(dev, "added panel\n");
+
+	return 0;
+}
+
+static int s6d27a1_remove(struct spi_device *spi)
+{
+	struct s6d27a1 *ctx = spi_get_drvdata(spi);
+
+	drm_panel_remove(&ctx->panel);
+	return 0;
+}
+
+static const struct of_device_id s6d27a1_match[] = {
+	{ .compatible = "samsung,s6d27a1", },
+    { /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, s6d27a1_match);
+
+static struct spi_driver s6d27a1_driver = {
+	.probe		= s6d27a1_probe,
+	.remove		= s6d27a1_remove,
+	.driver		= {
+		.name	= "s6d27a1-panel",
+		.of_match_table = s6d27a1_match,
+	},
+};
+module_spi_driver(s6d27a1_driver);
+
+MODULE_AUTHOR("Markuss Broks <markuss.broks@gmail.com>");
+MODULE_DESCRIPTION("Samsung S6D27A1 panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.32.0

