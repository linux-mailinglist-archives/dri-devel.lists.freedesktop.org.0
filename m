Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4010D3A2CF6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3529D6ED11;
	Thu, 10 Jun 2021 13:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FE66ED11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:27:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id n12so3240538lft.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 06:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4QEP3A/eh2Lcpmaz1OafJAywMZLP55ZdFmXuQCmgJs=;
 b=j85ZuZ8o/iLl6QOnU4pD9Xd+HUaJI9o/pe1PDQYr1j2iRSwZxtDP3U5SXquaJCRCXc
 XBIylVZX46UtBAjL1rTOhRyeXffSEka3SlhUkQm0kYbcspu9cSw7zWjB1IYHeWf0v3nh
 uyJuD7Dl+xULZa58Ond8h082veY7u7xBUK8kz1badBCHTHamU4siPkQUu89ZWcpu4t22
 bCbqoX0Jp+SdJnppXGE9uZ7sexXsr/CkZMzhkjSVPW0ylaFACqb+ZyfSB9sYW7niBJWX
 gNQqYqALm6BwNL0AYNJjBFrFvT01HL4rZH/550xNiYuNcJ9v3ox4CS07ZjndspQpUSAN
 2TpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4QEP3A/eh2Lcpmaz1OafJAywMZLP55ZdFmXuQCmgJs=;
 b=CCfrpw0SBEpqUQo4vbWkc1mc6SjyzAEAvfhtTIujVQEBVSQu2Y+SSlmUuSqQFCYYR6
 foVJtQlz5lJjELSv4cKamYM75ypuX6VoRS21LWTi6L7d9X9KqXrhjDCp1cSRPgBMvDjG
 oCVtFkLmAbturyKPabQ9k5ecMytV6fXdZApAH2OpfsdcoXf8U6PsW92XTNqxwTWxEex9
 eIhRjy/qGKa5JPCzVOxNhK6A9g9vFeQMbcTORywI5fe+2kgt8o2wGX4Fz3MJw8+FDNcD
 Ocj+WXlaWUCfNgbsiSo+RYHYcBCFEKH7VXt8QOSLor3yI3b5pQ6mOQy1Yms4t+6wO4Vg
 SecQ==
X-Gm-Message-State: AOAM532O9cYJaiRRx5lNoTuuI2ypD0W5fN5gPWFFOT3CtlKeN6nIUm1/
 O4euIsUzpIRd/RNgcdI6Tw8S6Q==
X-Google-Smtp-Source: ABdhPJyOHvEXMUxihAsaqH5/F29uceJFajZM1pQV0SYQAA8cyPj5Igl+G/M0q/ZQPwGbi7m3EK7JGg==
X-Received: by 2002:a05:6512:3602:: with SMTP id
 f2mr1974028lfs.14.1623331625913; 
 Thu, 10 Jun 2021 06:27:05 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id x1sm337957ljm.132.2021.06.10.06.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:27:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/panel: db7430: Add driver for Samsung DB7430
Date: Thu, 10 Jun 2021 15:25:01 +0200
Message-Id: <20210610132501.315086-1-linus.walleij@linaro.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Doug Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a new driver for the Samsung DB7430 DPI display
controller as controlled over SPI.

Right now the only panel product we know that is using this
display controller is the LMS397KF04 but there may be more.

This is the first regular panel driver making use of the
MIPI DBI helper library. The DBI "device" portions can not
be used because that code assumes the use of a single
regulator and specific timings around the reset pulse that
do not match the DB7430 datasheet.

Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Managed to make use of the in-kernel DBI support to
  conjure and send 9bit DBI SPI messages.
- This cuts out a bit of overhead.
- Deeper integration with the DBI library is not done, as
  assumes too much about the device, such as being used
  as a stand-alone framebuffer (this device is not).
ChangeLog v2->v3:
- Fix some minor comments and formatting.
- Print an error if the DCS sequence write fails.
- Set BPC (bits per color) to 8 on the display_info. Some
  drivers may need this.
ChangeLog v1->v2:
- Rename driver and variables with the db7430_* prefix instead
  of lms397kf04 as there may be more display products out there
  using this display controller. Also change Kconfig symbol.
- Push doc comments together on one line where possible.
- Rename DB7430_MANUFACTURER_CMD to DB7430_ACCESS_PROT_OFF
- Return error from regulator_bulk_disable() down to
  db7430_unprepare() and propagate.
- Use usleep_range(1000, 5000) instead of msleep(1)
- Shorten prepare/unprepare callbacks by more compact code.
- Use devm_err_probe() and provide proper probe errors all
  the way through the probe() function.
---
 MAINTAINERS                                  |   7 +
 drivers/gpu/drm/panel/Kconfig                |  10 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-samsung-db7430.c | 354 +++++++++++++++++++
 4 files changed, 372 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-db7430.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..6ff4777b1018 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5857,6 +5857,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
 
+DRM DRIVER FOR SAMSUNG DB7430 PANELS
+M:	Linus Walleij <linus.walleij@linaro.org>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-db7430.c
+
 DRM DRIVER FOR SITRONIX ST7703 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
 R:	Purism Kernel Team <kernel@puri.sm>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4894913936e9..6d1b90f4f2bb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -342,6 +342,16 @@ config DRM_PANEL_RONBO_RB070D30
 	  Say Y here if you want to enable support for Ronbo Electronics
 	  RB070D30 1024x600 DSI panel.
 
+config DRM_PANEL_SAMSUNG_DB7430
+	tristate "Samsung DB7430-based DPI panels"
+	depends on OF && SPI && GPIOLIB
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DBI
+	help
+	  Say Y here if you want to enable support for the Samsung
+	  DB7430 DPI display controller used in such devices as the
+	  LMS397KF04 480x800 DPI panel.
+
 config DRM_PANEL_SAMSUNG_S6D16D0
 	tristate "Samsung S6D16D0 DSI video mode panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index cae4d976c069..a350e0990d17 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-db7430.c b/drivers/gpu/drm/panel/panel-samsung-db7430.c
new file mode 100644
index 000000000000..c11b3da65896
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Panel driver for the Samsung LMS397KF04 480x800 DPI RGB panel.
+ * According to the data sheet the display controller is called DB7430.
+ * Found in the Samsung Galaxy Beam GT-I8350 mobile phone.
+ * Linus Walleij <linus.walleij@linaro.org>
+ */
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
+#define DB7430_ACCESS_PROT_OFF		0xb0
+#define DB7430_UNKNOWN_B4		0xb4
+#define DB7430_USER_SELECT		0xb5
+#define DB7430_UNKNOWN_B7		0xb7
+#define DB7430_UNKNOWN_B8		0xb8
+#define DB7430_PANEL_DRIVING		0xc0
+#define DB7430_SOURCE_CONTROL		0xc1
+#define DB7430_GATE_INTERFACE		0xc4
+#define DB7430_DISPLAY_H_TIMING		0xc5
+#define DB7430_RGB_SYNC_OPTION		0xc6
+#define DB7430_GAMMA_SET_RED		0xc8
+#define DB7430_GAMMA_SET_GREEN		0xc9
+#define DB7430_GAMMA_SET_BLUE		0xca
+#define DB7430_BIAS_CURRENT_CTRL	0xd1
+#define DB7430_DDV_CTRL			0xd2
+#define DB7430_GAMMA_CTRL_REF		0xd3
+#define DB7430_UNKNOWN_D4		0xd4
+#define DB7430_DCDC_CTRL		0xd5
+#define DB7430_VCL_CTRL			0xd6
+#define DB7430_UNKNOWN_F8		0xf8
+#define DB7430_UNKNOWN_FC		0xfc
+
+#define DATA_MASK	0x100
+
+/**
+ * struct db7430 - state container for a panel controlled by the DB7430
+ * controller
+ */
+struct db7430 {
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
+};
+
+static const struct drm_display_mode db7430_480_800_mode = {
+	/*
+	 * 31 ns period min (htotal*vtotal*vrefresh)/1000
+	 * gives a Vrefresh of ~71 Hz.
+	 */
+	.clock = 32258,
+	.hdisplay = 480,
+	.hsync_start = 480 + 10,
+	.hsync_end = 480 + 10 + 4,
+	.htotal = 480 + 10 + 4 + 40,
+	.vdisplay = 800,
+	.vsync_start = 800 + 6,
+	.vsync_end = 800 + 6 + 1,
+	.vtotal = 800 + 6 + 1 + 7,
+	.width_mm = 53,
+	.height_mm = 87,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static inline struct db7430 *to_db7430(struct drm_panel *panel)
+{
+	return container_of(panel, struct db7430, panel);
+}
+
+static int db7430_power_on(struct db7430 *db)
+{
+	struct mipi_dbi *dbi = &db->dbi;
+	int ret;
+
+	/* Power up */
+	ret = regulator_bulk_enable(ARRAY_SIZE(db->regulators),
+				    db->regulators);
+	if (ret) {
+		dev_err(db->dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+	msleep(50);
+
+	/* Assert reset >=1 ms */
+	gpiod_set_value_cansleep(db->reset, 1);
+	usleep_range(1000, 5000);
+	/* De-assert reset */
+	gpiod_set_value_cansleep(db->reset, 0);
+	/* Wait >= 10 ms */
+	msleep(10);
+	dev_dbg(db->dev, "de-asserted RESET\n");
+
+	/*
+	 * This is set to 0x0a (RGB/BGR order + horizontal flip) in order
+	 * to make the display behave normally. If this is not set the displays
+	 * normal output behaviour is horizontally flipped and BGR ordered. Do
+	 * it twice because the first message doesn't always "take".
+	 */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	mipi_dbi_command(dbi, DB7430_ACCESS_PROT_OFF, 0x00);
+	mipi_dbi_command(dbi, DB7430_PANEL_DRIVING, 0x28, 0x08);
+	mipi_dbi_command(dbi, DB7430_SOURCE_CONTROL,
+			 0x01, 0x30, 0x15, 0x05, 0x22);
+	mipi_dbi_command(dbi, DB7430_GATE_INTERFACE,
+			 0x10, 0x01, 0x00);
+	mipi_dbi_command(dbi, DB7430_DISPLAY_H_TIMING,
+			 0x06, 0x55, 0x03, 0x07, 0x0b,
+			 0x33, 0x00, 0x01, 0x03);
+	/*
+	 * 0x00 in datasheet 0x01 in vendor code 0x00, it seems 0x01 means
+	 * DE active high and 0x00 means DE active low.
+	 */
+	mipi_dbi_command(dbi, DB7430_RGB_SYNC_OPTION, 0x01);
+	mipi_dbi_command(dbi, DB7430_GAMMA_SET_RED,
+		/* R positive gamma */ 0x00,
+		0x0A, 0x31, 0x3B, 0x4E, 0x58, 0x59, 0x5B, 0x58, 0x5E, 0x62,
+		0x60, 0x61, 0x5E, 0x62, 0x55, 0x55, 0x7F, 0x08,
+		/* R negative gamma */ 0x00,
+		0x0A, 0x31, 0x3B, 0x4E, 0x58, 0x59, 0x5B, 0x58, 0x5E, 0x62,
+		0x60, 0x61, 0x5E, 0x62, 0x55, 0x55, 0x7F, 0x08);
+	mipi_dbi_command(dbi, DB7430_GAMMA_SET_GREEN,
+		/* G positive gamma */ 0x00,
+		0x25, 0x15, 0x28, 0x3D, 0x4A, 0x48, 0x4C, 0x4A, 0x52, 0x59,
+		0x59, 0x5B, 0x56, 0x60, 0x5D, 0x55, 0x7F, 0x0A,
+		/* G negative gamma */ 0x00,
+		0x25, 0x15, 0x28, 0x3D, 0x4A, 0x48, 0x4C, 0x4A, 0x52, 0x59,
+		0x59, 0x5B, 0x56, 0x60, 0x5D, 0x55, 0x7F, 0x0A);
+	mipi_dbi_command(dbi, DB7430_GAMMA_SET_BLUE,
+		/* B positive gamma */ 0x00,
+		0x48, 0x10, 0x1F, 0x2F, 0x35, 0x38, 0x3D, 0x3C, 0x45, 0x4D,
+		0x4E, 0x52, 0x51, 0x60, 0x7F, 0x7E, 0x7F, 0x0C,
+		/* B negative gamma */ 0x00,
+		0x48, 0x10, 0x1F, 0x2F, 0x35, 0x38, 0x3D, 0x3C, 0x45, 0x4D,
+		0x4E, 0x52, 0x51, 0x60, 0x7F, 0x7E, 0x7F, 0x0C);
+	mipi_dbi_command(dbi, DB7430_BIAS_CURRENT_CTRL, 0x33, 0x13);
+	mipi_dbi_command(dbi, DB7430_DDV_CTRL, 0x11, 0x00, 0x00);
+	mipi_dbi_command(dbi, DB7430_GAMMA_CTRL_REF, 0x50, 0x50);
+	mipi_dbi_command(dbi, DB7430_DCDC_CTRL, 0x2f, 0x11, 0x1e, 0x46);
+	mipi_dbi_command(dbi, DB7430_VCL_CTRL, 0x11, 0x0a);
+
+	return 0;
+}
+
+static int db7430_power_off(struct db7430 *db)
+{
+	/* Go into RESET and disable regulators */
+	gpiod_set_value_cansleep(db->reset, 1);
+	return regulator_bulk_disable(ARRAY_SIZE(db->regulators),
+				      db->regulators);
+}
+
+static int db7430_unprepare(struct drm_panel *panel)
+{
+	return db7430_power_off(to_db7430(panel));
+}
+
+static int db7430_disable(struct drm_panel *panel)
+{
+	struct db7430 *db = to_db7430(panel);
+	struct mipi_dbi *dbi = &db->dbi;
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
+	msleep(25);
+	mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
+	msleep(120);
+
+	return 0;
+}
+
+static int db7430_prepare(struct drm_panel *panel)
+{
+	return db7430_power_on(to_db7430(panel));
+}
+
+static int db7430_enable(struct drm_panel *panel)
+{
+	struct db7430 *db = to_db7430(panel);
+	struct mipi_dbi *dbi = &db->dbi;
+
+	/* Exit sleep mode */
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(20);
+
+	/* NVM (non-volatile memory) load sequence */
+	mipi_dbi_command(dbi, DB7430_UNKNOWN_D4, 0x52, 0x5e);
+	mipi_dbi_command(dbi, DB7430_UNKNOWN_F8, 0x01, 0xf5, 0xf2, 0x71, 0x44);
+	mipi_dbi_command(dbi, DB7430_UNKNOWN_FC, 0x00, 0x08);
+	msleep(150);
+
+	/* CABC turn on sequence (BC = backlight control) */
+	mipi_dbi_command(dbi, DB7430_UNKNOWN_B4, 0x0f, 0x00, 0x50);
+	mipi_dbi_command(dbi, DB7430_USER_SELECT, 0x80);
+	mipi_dbi_command(dbi, DB7430_UNKNOWN_B7, 0x24);
+	mipi_dbi_command(dbi, DB7430_UNKNOWN_B8, 0x01);
+
+	/* Turn on display */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+
+	return 0;
+}
+
+/**
+ * db7430_get_modes() - return the mode
+ * @panel: the panel to get the mode for
+ * @connector: reference to the central DRM connector control structure
+ */
+static int db7430_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
+{
+	struct db7430 *db = to_db7430(panel);
+	struct drm_display_mode *mode;
+	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	mode = drm_mode_duplicate(connector->dev, &db7430_480_800_mode);
+	if (!mode) {
+		dev_err(db->dev, "failed to add mode\n");
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
+static const struct drm_panel_funcs db7430_drm_funcs = {
+	.disable = db7430_disable,
+	.unprepare = db7430_unprepare,
+	.prepare = db7430_prepare,
+	.enable = db7430_enable,
+	.get_modes = db7430_get_modes,
+};
+
+static int db7430_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct db7430 *db;
+	int ret;
+
+	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
+	if (!db)
+		return -ENOMEM;
+	db->dev = dev;
+
+	/*
+	 * VCI   is the analog voltage supply
+	 * VCCIO is the digital I/O voltage supply
+	 */
+	db->regulators[0].supply = "vci";
+	db->regulators[1].supply = "vccio";
+	ret = devm_regulator_bulk_get(dev,
+				      ARRAY_SIZE(db->regulators),
+				      db->regulators);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	db->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(db->reset)) {
+		ret = PTR_ERR(db->reset);
+		return dev_err_probe(dev, ret, "no RESET GPIO\n");
+	}
+
+	spi->bits_per_word = 9;
+	/* Preserve e.g. SPI_3WIRE setting */
+	spi->mode |= SPI_MODE_3;
+	ret = spi_setup(spi);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "spi setup failed\n");
+
+	ret = mipi_dbi_spi_init(spi, &db->dbi, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
+
+	drm_panel_init(&db->panel, dev, &db7430_drm_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	/* FIXME: if no external backlight, use internal backlight */
+	ret = drm_panel_of_backlight(&db->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add backlight\n");
+
+	spi_set_drvdata(spi, db);
+
+	drm_panel_add(&db->panel);
+	dev_dbg(dev, "added panel\n");
+
+	return 0;
+}
+
+static int db7430_remove(struct spi_device *spi)
+{
+	struct db7430 *db = spi_get_drvdata(spi);
+
+	drm_panel_remove(&db->panel);
+	return 0;
+}
+
+/*
+ * The DB7430 display controller may be used in several display products,
+ * so list the different variants here and add per-variant data if needed.
+ */
+static const struct of_device_id db7430_match[] = {
+	{ .compatible = "samsung,lms397kf04", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, db7430_match);
+
+static struct spi_driver db7430_driver = {
+	.probe		= db7430_probe,
+	.remove		= db7430_remove,
+	.driver		= {
+		.name	= "db7430-panel",
+		.of_match_table = db7430_match,
+	},
+};
+module_spi_driver(db7430_driver);
+
+MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
+MODULE_DESCRIPTION("Samsung DB7430 panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.31.1

