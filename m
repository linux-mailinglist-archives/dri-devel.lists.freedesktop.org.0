Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB053B3963
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 00:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914D36E0C6;
	Thu, 24 Jun 2021 22:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83566E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 22:47:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u2so4653763ljo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i4dvRXIGa3XnHtxkrv5kX8z4dsXDtAlvxqX0HycKbyo=;
 b=tODqIHAOYM/leDijOqBHhC6+Y1avJ978lXEF7x6hyxL+4vu3LpmHpy+iKWHg0UohVh
 Pn94OtIkobnmWWP9UmpHS0EYT9sy2YW1FnRnaoKZDGz2EbtpTx5uKiXxclvrdNqwOprM
 sUvu70+MWKmZW6r4ERT+DFeb27bJLGwdtHU/Zem4ZLY2sUDI1EskxPvufhCmV1L1MEPZ
 Kxz3ChmFMdS0BuGBERjRf0QqlspwEKpFlq50V1Kn/fTo1NtDzValRKtbHRSRRsTAUELq
 4MEiRdED8Z8NPvKz3anPWvC1+3f6hfDv/xcPhCVD7m1/qy/V+1pqVbF3wZHEKh87QNJF
 YT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i4dvRXIGa3XnHtxkrv5kX8z4dsXDtAlvxqX0HycKbyo=;
 b=n1mjK1G6bvLXmxp9PrfEZ5e69L+JZLFUCuyxtvfaUnbeEinAFci3n48X2GYgaGiBvE
 7aC6FfpPcWvMJKjH/AcTcbp7lIJUMwPIsKIQ3DO/EfnoC3Q56iRGQz2LmKJtWt8ldgIU
 IVRvEjM90Iu9zfI1JohasW+sDibJ2ENxyKMFShJjCZXKMC8+0ExkqwJjiqYc/VKqI389
 wnuDpDDNg6f7pyAHB5YFYD0Ti+cfXCuB5LOQtqVpxS6KANDzDxugt+/vB5oE2lmYYAu7
 RElJFVD7Pse6QRYLmCiGOOF+yYCL6FRz6XNSa+Nl/hNUE1tjhMcSuAEKsDeOdBzt/dAM
 Lyew==
X-Gm-Message-State: AOAM532dD532iFzuA+6ouCRyTWczT1qQaWmzkA8pSQ7EYL3VAB8SfI2s
 ZbDY8YzvQnWTBbjT/wyiR8m0Rw==
X-Google-Smtp-Source: ABdhPJw4acXsC6/mzFk2rAep5f4QJbJHT7KdsPMtIdkvgxlQnVUTgh1sXnQyigXflePJoBc6cil3wA==
X-Received: by 2002:a05:651c:210b:: with SMTP id
 a11mr5569593ljq.240.1624574825016; 
 Thu, 24 Jun 2021 15:47:05 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id n27sm344120lfq.198.2021.06.24.15.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 15:47:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: ws2401: Add driver for WideChips WS2401
Date: Fri, 25 Jun 2021 00:44:58 +0200
Message-Id: <20210624224458.2486701-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: phone-devel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a driver for panels based on the WideChips WS2401 display
controller. This display controller is used in the Samsung LMS380KF01
display found in the Samsung GT-I8160 (Codina) mobile phone and
possibly others.

As is common with Samsung displays manufacturer commands are necessary
to configure the display to a working state.

The display optionally supports internal backlight control, but can
also use an external backlight.

This driver re-uses the DBI infrastructure to communicate with the
display.

Cc: phone-devel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-widechips-ws2401.c    | 404 ++++++++++++++++++
 4 files changed, 421 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-widechips-ws2401.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..8bfa89f61220 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5946,6 +5946,13 @@ S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/vboxvideo/
 
+DRM DRIVER FOR WIDECHIPS WS2401 PANELS
+M:	Linus Walleij <linus.walleij@linaro.org>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
+F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c
+
 DRM DRIVER FOR VMWARE VIRTUAL GPU
 M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
 M:	Roland Scheidegger <sroland@vmware.com>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4894913936e9..f4fe1dba9912 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -552,6 +552,15 @@ config DRM_PANEL_VISIONOX_RM69299
 	  Say Y here if you want to enable support for Visionox
 	  RM69299  DSI Video Mode panel.
 
+config DRM_PANEL_WIDECHIPS_WS2401
+	tristate "Widechips WS2401 DPI panel driver"
+	depends on OF && SPI && GPIOLIB
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DBI
+	help
+	  Say Y here if you want to enable support for the Widechips
+	  WS2401 DPI 480x800 display controller.
+
 config DRM_PANEL_XINPENG_XPP055C272
 	tristate "Xinpeng XPP055C272 panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index cae4d976c069..d94c27df17aa 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -58,4 +58,5 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
+obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
 obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
diff --git a/drivers/gpu/drm/panel/panel-widechips-ws2401.c b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
new file mode 100644
index 000000000000..d15870301174
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Panel driver for the WideChips WS2401 480x800 DPI RGB panel, used in
+ * the Samsung Mobile Display (SMD) LMS380KF01.
+ * Found in the Samsung Galaxy Ace 2 GT-I8160 mobile phone.
+ * Linus Walleij <linus.walleij@linaro.org>
+ * Inspired by code and know-how in the vendor driver by Gareth Phillips.
+ */
+#include <drm/drm_modes.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_panel.h>
+
+#include <linux/backlight.h>
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
+#define WS2401_RESCTL			0xb8 /* Resolution select control */
+#define WS2401_PSMPS			0xbd /* SMPS positive control */
+#define WS2401_NSMPS			0xbe /* SMPS negative control */
+#define WS2401_SMPS			0xbf
+#define WS2401_BCMODE			0xc1 /* Backlight control mode */
+#define WS2401_WRBLCTL			0xc3 /* Backlight control */
+#define WS2401_WRDISBV			0xc4 /* Write manual brightness */
+#define WS2401_WRCTRLD			0xc6 /* Write BL control */
+#define WS2401_WRMIE			0xc7 /* Write MIE mode */
+#define WS2401_READ_ID1			0xda /* Read panel ID 1 */
+#define WS2401_READ_ID2			0xdb /* Read panel ID 2 */
+#define WS2401_READ_ID3			0xdc /* Read panel ID 3 */
+#define WS2401_PASSWD1			0xf0 /* Password command for level 2 */
+#define WS2401_DISCTL			0xf2 /* Display control */
+#define WS2401_PWRCTL			0xf3 /* Power control */
+#define WS2401_VCOMCTL			0xf4 /* VCOM control */
+#define WS2401_SRCCTL			0xf5 /* Source control */
+#define WS2401_PANELCTL			0xf6 /* Panel control */
+
+static const u8 ws2401_dbi_read_commands[] = {
+	WS2401_READ_ID1,
+	WS2401_READ_ID2,
+	WS2401_READ_ID3,
+	0, /* sentinel */
+};
+
+/**
+ * struct ws2401 - state container for a panel controlled by the WS2401
+ * controller
+ */
+struct ws2401 {
+	/** @dev: the container device */
+	struct device *dev;
+	/** @dbi: the DBI bus abstraction handle */
+	struct mipi_dbi dbi;
+	/** @panel: the DRM panel instance for this device */
+	struct drm_panel panel;
+	/** @width: the width of this panel in mm */
+	u32 width;
+	/** @height: the height of this panel in mm */
+	u32 height;
+	/** @reset: reset GPIO line */
+	struct gpio_desc *reset;
+	/** @regulators: VCCIO and VIO supply regulators */
+	struct regulator_bulk_data regulators[2];
+	/** @bl: Backlight, if using internal backlight */
+	struct backlight_device *bl;
+};
+
+static const struct drm_display_mode lms380kf01_480_800_mode = {
+	/*
+	 * The vendor driver states that the "SMD panel" has a clock
+	 * frequency of 49920000 Hz / 2 = 24960000 Hz.
+	 */
+	.clock = 24960,
+	.hdisplay = 480,
+	.hsync_start = 480 + 8,
+	.hsync_end = 480 + 8 + 10,
+	.htotal = 480 + 8 + 10 + 8,
+	.vdisplay = 800,
+	.vsync_start = 800 + 8,
+	.vsync_end = 800 + 8 + 2,
+	.vtotal = 800 + 8 + 2 + 18,
+	.width_mm = 50,
+	.height_mm = 84,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static inline struct ws2401 *to_ws2401(struct drm_panel *panel)
+{
+	return container_of(panel, struct ws2401, panel);
+}
+
+#define ws2401_command(ws, cmd, seq...) \
+({ \
+	struct mipi_dbi *dbi = &ws->dbi; \
+	int ret; \
+	ret = mipi_dbi_command(dbi, cmd, seq);	\
+	if (ret) { \
+		dev_err(ws->dev, "failure in writing command %02x\n", cmd); \
+	} \
+})
+
+static void ws2401_read_mtp_id(struct ws2401 *ws)
+{
+	struct mipi_dbi *dbi = &ws->dbi;
+	u8 id1, id2, id3;
+	int ret;
+
+	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID1, &id1);
+	if (ret) {
+		dev_err(ws->dev, "unable to read MTP ID 1\n");
+		return;
+	}
+	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID2, &id1);
+	if (ret) {
+		dev_err(ws->dev, "unable to read MTP ID 2\n");
+		return;
+	}
+	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID3, &id1);
+	if (ret) {
+		dev_err(ws->dev, "unable to read MTP ID 3\n");
+		return;
+	}
+	dev_info(ws->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
+}
+
+static int ws2401_power_on(struct ws2401 *ws)
+{
+	int ret;
+
+	/* Power up */
+	ret = regulator_bulk_enable(ARRAY_SIZE(ws->regulators),
+				    ws->regulators);
+	if (ret) {
+		dev_err(ws->dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+	msleep(10);
+
+	/* Assert reset >=1 ms */
+	gpiod_set_value_cansleep(ws->reset, 1);
+	usleep_range(1000, 5000);
+	/* De-assert reset */
+	gpiod_set_value_cansleep(ws->reset, 0);
+	/* Wait >= 10 ms */
+	msleep(10);
+	dev_dbg(ws->dev, "de-asserted RESET\n");
+
+	/*
+	 * Exit sleep mode and initialize display - some hammering is
+	 * necessary.
+	 */
+	ws2401_command(ws, MIPI_DCS_EXIT_SLEEP_MODE);
+	ws2401_command(ws, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(50);
+
+	/* Magic to unlock level 2 control of the display */
+	ws2401_command(ws, WS2401_PASSWD1, 0x5a, 0x5a);
+	/* Configure resolution to 480RGBx800 */
+	ws2401_command(ws, WS2401_RESCTL, 0x12);
+	/*
+	 * Set addressing mode Flip V(d0), Flip H(d1) RGB/BGR(d3)
+	 * The vendor driver has 0x09 here setting d3 and resulting in
+	 * inverted colors when used with DRM.
+	 */
+	ws2401_command(ws, MIPI_DCS_SET_ADDRESS_MODE, 0x01);
+	/* Set pixel format: 24 bpp */
+	ws2401_command(ws, MIPI_DCS_SET_PIXEL_FORMAT, 0x70);
+	ws2401_command(ws, WS2401_PSMPS, 0x06, 0x01, /* DDVDH: 4.6v */
+		       0x78, 0x06, 0x10, 0x37);
+	ws2401_command(ws, WS2401_NSMPS, 0x06, 0x01, /* DDVDH: -4.6v */
+		       0x78, 0x06, 0x12, 0x37);
+	ws2401_command(ws, WS2401_SMPS, 0x02, 0x0d);
+	ws2401_command(ws, WS2401_PWRCTL, 0x10, 0xA9, 0x00, 0x01, 0x44,
+		       0xF4,	/* VGH:16.1v, VGL:-13.8v */
+		       0x50,	/* GREFP:4.2v(dft) */
+		       0x50,	/* GREFN:-4.2v(dft) */
+		       0x00,
+		       0x3C);	/* VOUTL:-10v(dft) */
+	ws2401_command(ws, WS2401_SRCCTL, 0x03, 0x0C, 0x00, 0x00, 0x00,
+		       0x01,	/* 2 dot inversion */
+		       0x01, 0x06, 0x00);
+	ws2401_command(ws, WS2401_PANELCTL, 0x14, 0x00, 0x80, 0x00, 0x00);
+
+	if (ws->bl)
+		ws2401_command(ws, WS2401_WRCTRLD, 0x2c);
+	else
+		ws2401_command(ws, WS2401_WRCTRLD, 0x00);
+
+	ws2401_read_mtp_id(ws);
+
+	return 0;
+}
+
+static int ws2401_power_off(struct ws2401 *ws)
+{
+	/* Disable backlight */
+	if (ws->bl)
+		ws2401_command(ws, WS2401_WRCTRLD, 0x00);
+	/* Go into RESET and disable regulators */
+	gpiod_set_value_cansleep(ws->reset, 1);
+	return regulator_bulk_disable(ARRAY_SIZE(ws->regulators),
+				      ws->regulators);
+}
+
+static int ws2401_unprepare(struct drm_panel *panel)
+{
+	struct ws2401 *ws = to_ws2401(panel);
+
+	ws2401_command(ws, MIPI_DCS_ENTER_SLEEP_MODE);
+	msleep(120);
+	return ws2401_power_off(to_ws2401(panel));
+}
+
+static int ws2401_disable(struct drm_panel *panel)
+{
+	struct ws2401 *ws = to_ws2401(panel);
+
+	ws2401_command(ws, MIPI_DCS_SET_DISPLAY_OFF);
+	msleep(25);
+
+	return 0;
+}
+
+static int ws2401_prepare(struct drm_panel *panel)
+{
+	return ws2401_power_on(to_ws2401(panel));
+}
+
+static int ws2401_enable(struct drm_panel *panel)
+{
+	struct ws2401 *ws = to_ws2401(panel);
+
+	ws2401_command(ws, MIPI_DCS_SET_DISPLAY_ON);
+
+	return 0;
+}
+
+/**
+ * ws2401_get_modes() - return the mode
+ * @panel: the panel to get the mode for
+ * @connector: reference to the central DRM connector control structure
+ */
+static int ws2401_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
+{
+	struct ws2401 *ws = to_ws2401(panel);
+	struct drm_display_mode *mode;
+	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	/*
+	 * We just support the LMS380KF01 so far, if we implement more panels
+	 * this mode, the following connector display_info settings and
+	 * probably the custom DCS sequences needs to selected based on what
+	 * the target panel needs.
+	 */
+	mode = drm_mode_duplicate(connector->dev, &lms380kf01_480_800_mode);
+	if (!mode) {
+		dev_err(ws->dev, "failed to add mode\n");
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
+static const struct drm_panel_funcs ws2401_drm_funcs = {
+	.disable = ws2401_disable,
+	.unprepare = ws2401_unprepare,
+	.prepare = ws2401_prepare,
+	.enable = ws2401_enable,
+	.get_modes = ws2401_get_modes,
+};
+
+static int ws2401_set_brightness(struct backlight_device *bl)
+{
+	struct ws2401 *ws = bl_get_data(bl);
+	u8 brightness = bl->props.brightness;
+
+	ws2401_command(ws, WS2401_WRDISBV, brightness);
+
+	return 0;
+}
+
+static const struct backlight_ops ws2401_bl_ops = {
+	.update_status = ws2401_set_brightness,
+};
+
+const struct backlight_properties ws2401_bl_props = {
+	.type = BACKLIGHT_PLATFORM,
+	.brightness = 120,
+	.max_brightness = U8_MAX,
+};
+
+static int ws2401_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct ws2401 *ws;
+	int ret;
+
+	ws = devm_kzalloc(dev, sizeof(*ws), GFP_KERNEL);
+	if (!ws)
+		return -ENOMEM;
+	ws->dev = dev;
+
+	/*
+	 * VCI   is the analog voltage supply
+	 * VCCIO is the digital I/O voltage supply
+	 */
+	ws->regulators[0].supply = "vci";
+	ws->regulators[1].supply = "vccio";
+	ret = devm_regulator_bulk_get(dev,
+				      ARRAY_SIZE(ws->regulators),
+				      ws->regulators);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ws->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ws->reset)) {
+		ret = PTR_ERR(ws->reset);
+		return dev_err_probe(dev, ret, "no RESET GPIO\n");
+	}
+
+	ret = mipi_dbi_spi_init(spi, &ws->dbi, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
+	ws->dbi.read_commands = ws2401_dbi_read_commands;
+
+	drm_panel_init(&ws->panel, dev, &ws2401_drm_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	ret = drm_panel_of_backlight(&ws->panel);
+	if (ret) {
+		dev_info(dev, "no external backlight, using internal backlight\n");
+		ws->bl = devm_backlight_device_register(dev, "ws2401", dev, ws,
+							&ws2401_bl_ops, &ws2401_bl_props);
+		if (IS_ERR(ws->bl)) {
+			ret = PTR_ERR(ws->bl);
+			return dev_err_probe(dev, ret,
+					     "failed to register backlight device\n");
+		}
+		ws->panel.backlight = ws->bl;
+	} else {
+		dev_info(dev, "using external backlight\n");
+	}
+
+	spi_set_drvdata(spi, ws);
+
+	drm_panel_add(&ws->panel);
+	dev_dbg(dev, "added panel\n");
+
+	return 0;
+}
+
+static int ws2401_remove(struct spi_device *spi)
+{
+	struct ws2401 *ws = spi_get_drvdata(spi);
+
+	drm_panel_remove(&ws->panel);
+	return 0;
+}
+
+/*
+ * Samsung LMS380KF01 is the one instance of this display controller that we
+ * know about, but if more are found, the controller can be parameterized
+ * here and used for other configurations.
+ */
+static const struct of_device_id ws2401_match[] = {
+	{ .compatible = "samsung,lms380kf01", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ws2401_match);
+
+static struct spi_driver ws2401_driver = {
+	.probe		= ws2401_probe,
+	.remove		= ws2401_remove,
+	.driver		= {
+		.name	= "ws2401-panel",
+		.of_match_table = ws2401_match,
+	},
+};
+module_spi_driver(ws2401_driver);
+
+MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
+MODULE_DESCRIPTION("Samsung WS2401 panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.31.1

