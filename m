Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB43958F0
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 12:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0E26E061;
	Mon, 31 May 2021 10:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A903B6E061
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 10:30:43 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id o8so14455300ljp.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gx9e8uC2cFWgRG+UVJhRCSuLf6NH9t31W3jQE8zoP2c=;
 b=Cer3kJPMpT7mkeCgL5H1FJT9n3h16SxZdKI8GTXEUEXd1M2n9gDOCjQXmG8zChSlr9
 tbB+3JJKek3PqnBNZoCgaa88A2JMea6gpNU91moN7nr4gz0YW1fMvkDTJZxUcM+Vn/6R
 efW+Mj1rJgap7yWLoruCpix6EeDUpMQ3jV3VCeTq7ZXb4Y33exSb2CcwT/YGyV4tP6bF
 i309voGBoZmdUpKlvg6336YOrGGWEdkbWgKwrR6HTbTHzOjBsmTvwqWv5yih+q9KQcJ9
 Vbv1P4P8n9x5kcwmwUDLQLELYE1EjqnMs7VpO76YPcQuMY+hTiUUBgnkQ6x27r6wCg9G
 JgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gx9e8uC2cFWgRG+UVJhRCSuLf6NH9t31W3jQE8zoP2c=;
 b=JWnqu5mSLQR5lAanWf9My99ZHeQObxyifwrsvRKmDmVUOu9pQIR2Dwze7pI37E4Krz
 gflve6umw/9m1hTE8/LSach3/DwtL5zV4JbUWpGmCamD1Fhc08shfnS7qkxXrwzA7X/U
 olSYdQy55TF8+KSFQMf1u1Dp/8YdETaUT+FLS0j6W/xhHzGHvsWjPkxCNL0RPBivFBJW
 Q9gimZv0xVTUhP7al6fYgpJWJCfTugzbdQrfjSwFpy4+lYxjo5qEdKVkYdDWKQM6ByG6
 ykTmCxk9uLZ2PFsYH+Uj5y3mSCHBvNRtlqYVB2h3f1UMmFGCPz4fZzZNJQ64T37NpMZg
 tLGg==
X-Gm-Message-State: AOAM533YUwnShQdylieVg+519899cMKQVWmGoywlmmlOIj6nH3Fx0y0W
 /BktnmaIc9CmuzaEiFiFIE1u8w==
X-Google-Smtp-Source: ABdhPJxgh6yLoWV4oeCDhQaE7LThipvDBbt6/CrfotOpHRrKpMMMiANc2unlNug4Px4HVh4w1xAAjA==
X-Received: by 2002:a2e:bc24:: with SMTP id b36mr16392468ljf.35.1622457041882; 
 Mon, 31 May 2021 03:30:41 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id u12sm1298596lfc.75.2021.05.31.03.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 03:30:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel: db7430: Add driver for Samsung DB7430
Date: Mon, 31 May 2021 12:28:38 +0200
Message-Id: <20210531102838.2423918-1-linus.walleij@linaro.org>
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
Cc: Doug Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a new driver for the Samsung DB7430 DPI display
controller as controlled over SPI.

Right now the only panel product we know that is using this
display controller is the LMS397KF04 but there may be more.

Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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
 drivers/gpu/drm/panel/Kconfig                |   9 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-samsung-db7430.c | 395 +++++++++++++++++++
 4 files changed, 412 insertions(+)
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
index 4894913936e9..e72e1c069456 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -342,6 +342,15 @@ config DRM_PANEL_RONBO_RB070D30
 	  Say Y here if you want to enable support for Ronbo Electronics
 	  RB070D30 1024x600 DSI panel.
 
+config DRM_PANEL_SAMSUNG_DB7430
+	tristate "Samsung DB7430-based DPI panels"
+	depends on OF && SPI && GPIOLIB
+	depends on BACKLIGHT_CLASS_DEVICE
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
index 000000000000..e951aa133925
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Panel driver for the Samsung LMS397KF04 480x800 DPI RGB panel.
+ * According to the data sheet the display controller is called DB7430.
+ * Found in the Samsung Galaxy Beam GT-I8350 mobile phone.
+ * Linus Walleij <linus.walleij@linaro.org>
+ */
+#include <drm/drm_modes.h>
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
+ * struct db7430 - state container for the Db7430 panel
+ */
+struct db7430 {
+	/** @dev: the container device */
+	struct device *dev;
+	/** @spi: the corresponding SPI device */
+	struct spi_device *spi;
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
+static const struct drm_display_mode db7430_mode = {
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
+static int db7430_write_word(struct db7430 *lms, u16 data)
+{
+	/* SPI buffers are always in CPU order */
+	return spi_write(lms->spi, &data, 2);
+}
+
+static int db7430_dcs_write(struct db7430 *lms, const u8 *data, size_t len)
+{
+	int ret;
+
+	dev_dbg(lms->dev, "SPI writing dcs seq: %*ph\n", (int)len, data);
+
+	/*
+	 * This sends 9 bits with the first bit (bit 8) set to 0
+	 * This indicates that this is a command. Anything after the
+	 * command is data.
+	 */
+	ret = db7430_write_word(lms, *data);
+
+	while (!ret && --len) {
+		++data;
+		/* This sends 9 bits with the first bit (bit 8) set to 1 */
+		ret = db7430_write_word(lms, *data | DATA_MASK);
+	}
+
+	if (ret) {
+		dev_err(lms->dev, "SPI error %d writing dcs seq: %*ph\n", ret,
+			(int)len, data);
+	}
+
+	return ret;
+}
+
+#define db7430_dcs_write_seq_static(ctx, seq ...) \
+	({ \
+		static const u8 d[] = { seq }; \
+		db7430_dcs_write(ctx, d, ARRAY_SIZE(d)); \
+	})
+
+static int db7430_power_on(struct db7430 *lms)
+{
+	int ret;
+
+	/* Power up */
+	ret = regulator_bulk_enable(ARRAY_SIZE(lms->regulators),
+				    lms->regulators);
+	if (ret) {
+		dev_err(lms->dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+	msleep(50);
+
+	/* Assert reset >=1 ms */
+	gpiod_set_value_cansleep(lms->reset, 1);
+	usleep_range(1000, 5000);
+	/* De-assert reset */
+	gpiod_set_value_cansleep(lms->reset, 0);
+	/* Wait >= 10 ms */
+	msleep(10);
+	dev_dbg(lms->dev, "de-asserted RESET\n");
+
+	/*
+	 * This is set to 0x0a (RGB/BGR order + horizontal flip) in order
+	 * to make the display behave normally. If this is not set the displays
+	 * normal output behaviour is horizontally flipped and BGR ordered. Do
+	 * it twice because the first message doesn't always "take".
+	 */
+	db7430_dcs_write_seq_static(lms, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	db7430_dcs_write_seq_static(lms, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	/* Called "Access protection off" in vendor code */
+	db7430_dcs_write_seq_static(lms, DB7430_ACCESS_PROT_OFF, 0x00);
+	db7430_dcs_write_seq_static(lms, DB7430_PANEL_DRIVING, 0x28, 0x08);
+	db7430_dcs_write_seq_static(lms, DB7430_SOURCE_CONTROL,
+				    0x01, 0x30, 0x15, 0x05, 0x22);
+	db7430_dcs_write_seq_static(lms, DB7430_GATE_INTERFACE,
+				    0x10, 0x01, 0x00);
+	db7430_dcs_write_seq_static(lms, DB7430_DISPLAY_H_TIMING,
+				    0x06, 0x55, 0x03, 0x07, 0x0b,
+				    0x33, 0x00, 0x01, 0x03);
+	/*
+	 * 0x00 in datasheet 0x01 in vendor code 0x00, it seems 0x01 means
+	 * DE active high and 0x00 means DE active low.
+	 */
+	db7430_dcs_write_seq_static(lms, DB7430_RGB_SYNC_OPTION, 0x01);
+	db7430_dcs_write_seq_static(lms, DB7430_GAMMA_SET_RED,
+		/* R positive gamma */ 0x00,
+		0x0A, 0x31, 0x3B, 0x4E, 0x58, 0x59, 0x5B, 0x58, 0x5E, 0x62,
+		0x60, 0x61, 0x5E, 0x62, 0x55, 0x55, 0x7F, 0x08,
+		/* R negative gamma */ 0x00,
+		0x0A, 0x31, 0x3B, 0x4E, 0x58, 0x59, 0x5B, 0x58, 0x5E, 0x62,
+		0x60, 0x61, 0x5E, 0x62, 0x55, 0x55, 0x7F, 0x08);
+	db7430_dcs_write_seq_static(lms, DB7430_GAMMA_SET_GREEN,
+		/* G positive gamma */ 0x00,
+		0x25, 0x15, 0x28, 0x3D, 0x4A, 0x48, 0x4C, 0x4A, 0x52, 0x59,
+		0x59, 0x5B, 0x56, 0x60, 0x5D, 0x55, 0x7F, 0x0A,
+		/* G negative gamma */ 0x00,
+		0x25, 0x15, 0x28, 0x3D, 0x4A, 0x48, 0x4C, 0x4A, 0x52, 0x59,
+		0x59, 0x5B, 0x56, 0x60, 0x5D, 0x55, 0x7F, 0x0A);
+	db7430_dcs_write_seq_static(lms, DB7430_GAMMA_SET_BLUE,
+		/* B positive gamma */ 0x00,
+		0x48, 0x10, 0x1F, 0x2F, 0x35, 0x38, 0x3D, 0x3C, 0x45, 0x4D,
+		0x4E, 0x52, 0x51, 0x60, 0x7F, 0x7E, 0x7F, 0x0C,
+		/* B negative gamma */ 0x00,
+		0x48, 0x10, 0x1F, 0x2F, 0x35, 0x38, 0x3D, 0x3C, 0x45, 0x4D,
+		0x4E, 0x52, 0x51, 0x60, 0x7F, 0x7E, 0x7F, 0x0C);
+	db7430_dcs_write_seq_static(lms, DB7430_BIAS_CURRENT_CTRL,
+				    0x33, 0x13);
+	db7430_dcs_write_seq_static(lms, DB7430_DDV_CTRL,
+				    0x11, 0x00, 0x00);
+	db7430_dcs_write_seq_static(lms, DB7430_GAMMA_CTRL_REF,
+				    0x50, 0x50);
+	db7430_dcs_write_seq_static(lms, DB7430_DCDC_CTRL,
+				    0x2f, 0x11, 0x1e, 0x46);
+	db7430_dcs_write_seq_static(lms, DB7430_VCL_CTRL,
+				    0x11, 0x0a);
+
+	return 0;
+}
+
+static int db7430_power_off(struct db7430 *lms)
+{
+	/* Go into RESET and disable regulators */
+	gpiod_set_value_cansleep(lms->reset, 1);
+	return regulator_bulk_disable(ARRAY_SIZE(lms->regulators),
+				      lms->regulators);
+}
+
+static int db7430_unprepare(struct drm_panel *panel)
+{
+	return db7430_power_off(to_db7430(panel));
+}
+
+static int db7430_disable(struct drm_panel *panel)
+{
+	struct db7430 *lms = to_db7430(panel);
+
+	db7430_dcs_write_seq_static(lms, MIPI_DCS_SET_DISPLAY_OFF);
+	msleep(25);
+	db7430_dcs_write_seq_static(lms, MIPI_DCS_ENTER_SLEEP_MODE);
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
+	struct db7430 *lms = to_db7430(panel);
+
+	/* Exit sleep mode */
+	db7430_dcs_write_seq_static(lms, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(20);
+
+	/* NVM (non-volatile memory) load sequence */
+	db7430_dcs_write_seq_static(lms, DB7430_UNKNOWN_D4,
+				    0x52, 0x5e);
+	db7430_dcs_write_seq_static(lms, DB7430_UNKNOWN_F8,
+				    0x01, 0xf5, 0xf2, 0x71, 0x44);
+	db7430_dcs_write_seq_static(lms, DB7430_UNKNOWN_FC,
+				    0x00, 0x08);
+	msleep(150);
+
+	/* CABC turn on sequence (BC = backlight control) */
+	db7430_dcs_write_seq_static(lms, DB7430_UNKNOWN_B4,
+				    0x0f, 0x00, 0x50);
+	db7430_dcs_write_seq_static(lms, DB7430_USER_SELECT, 0x80);
+	db7430_dcs_write_seq_static(lms, DB7430_UNKNOWN_B7, 0x24);
+	db7430_dcs_write_seq_static(lms, DB7430_UNKNOWN_B8, 0x01);
+
+	/* Turn on display */
+	db7430_dcs_write_seq_static(lms, MIPI_DCS_SET_DISPLAY_ON);
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
+	struct db7430 *lms = to_db7430(panel);
+	struct drm_display_mode *mode;
+	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	mode = drm_mode_duplicate(connector->dev, &db7430_mode);
+	if (!mode) {
+		dev_err(lms->dev, "failed to add mode\n");
+		return -ENOMEM;
+	}
+
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
+	struct db7430 *lms;
+	int ret;
+
+	lms = devm_kzalloc(dev, sizeof(*lms), GFP_KERNEL);
+	if (!lms)
+		return -ENOMEM;
+	lms->dev = dev;
+
+	/*
+	 * VCI   is the analog voltage supply
+	 * VCCIO is the digital I/O voltage supply
+	 */
+	lms->regulators[0].supply = "vci";
+	lms->regulators[1].supply = "vccio";
+	ret = devm_regulator_bulk_get(dev,
+				      ARRAY_SIZE(lms->regulators),
+				      lms->regulators);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	/* This asserts the RESET signal, putting the display into reset */
+	lms->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(lms->reset)) {
+		ret = PTR_ERR(lms->reset);
+		return dev_err_probe(dev, ret, "no RESET GPIO\n");
+	}
+
+	spi->bits_per_word = 9;
+	/* Preserve e.g. SPI_3WIRE setting */
+	spi->mode |= SPI_MODE_3;
+	ret = spi_setup(spi);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "spi setup failed\n");
+	lms->spi = spi;
+
+	drm_panel_init(&lms->panel, dev, &db7430_drm_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	/* FIXME: if no external backlight, use internal backlight */
+	ret = drm_panel_of_backlight(&lms->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add backlight\n");
+
+	spi_set_drvdata(spi, lms);
+
+	drm_panel_add(&lms->panel);
+	dev_dbg(dev, "added panel\n");
+
+	return 0;
+}
+
+static int db7430_remove(struct spi_device *spi)
+{
+	struct db7430 *lms = spi_get_drvdata(spi);
+
+	drm_panel_remove(&lms->panel);
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

