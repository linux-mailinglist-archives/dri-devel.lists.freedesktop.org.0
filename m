Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD64D1CEDB0
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AE56E84A;
	Tue, 12 May 2020 07:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015566E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:04:12 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x77so5950462pfc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Efx+sIhHlblK0zWP7LM5IxCVDvW+AW2kVkUj5zSYNbo=;
 b=lj1Phi9G5UJxvav/7MlP6x0A5EKbynShM/x+tiNUyFhQyKS5MiEXoPJW7rBeI/USk3
 7WzboI5pl5HB3Y28cJklk7Xv9mO2Su4Mbj3mQ4LfRWL5cuqnaGu0+3HquQSIMcUEEN1K
 FJuqHM5a4PHnP6DEAxTizLmtNST16/6P4ps+jXs5NTCJNDg7NXIib1AwdUZ4B/khSv4Y
 GeASQh8x3hbDAZwHggMEMQko3MBdFTpvJWIP70ajn74FAyDM0EE54UXKfSEzNff1aDqe
 NAe7188sVWpH6E0lk1PjoTSQPustuxUlbUCw0ZfKnoUTqeIf3viCIfX9dkqhRNoE8yDO
 nQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Efx+sIhHlblK0zWP7LM5IxCVDvW+AW2kVkUj5zSYNbo=;
 b=MXilAbOs7b2yvcdVAfOHe9w9vxSk9R20S+rTi+G48jgVhEQzh3pEoEpo3V+yq7ayT+
 mLzWbKhHNc2pcAVwNaKkT+49bfx5QLaaJuZG6woOmNDjTXsCDvFzzbEYWcODi0VJU0Sp
 nK5QupPQYCylQ8/QslTfJ8VIrfwU+7iu/+WUGYFyPSXF9q702ahwL+Xv2ijDDlktVpd6
 tcHyymHBA1N3+e4kYQs1rruonVzcfyh7rGS8d1yV2N49dn5bXgvgtHRu+EQ7FYFTtyqC
 iGWA+tjz1F8P6WFnWbY61nveCeYY31d7hd6tj6rnI/Ffogef9mhIjj8ebPEXabXOr6A6
 R+XA==
X-Gm-Message-State: AGi0PubuajV0YdBtqoIS7z05jQQZuUeCnnqMsKkVHl0px4PG72BT3yQB
 +aFo+ocY/wry/jv5s+Dhe4s=
X-Google-Smtp-Source: APiQypKd3dI6cBbS28h33cGiHSfhcmqSUdHmF9oktsyordbeXxuc6I1RJD0ePyRrXDYWf43YwzO2rw==
X-Received: by 2002:a63:1d4a:: with SMTP id d10mr18870170pgm.188.1589267052359; 
 Tue, 12 May 2020 00:04:12 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 62sm11016369pfu.181.2020.05.12.00.04.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:04:11 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 5/5] drm/panel: Add ilitek ili9341 driver
Date: Tue, 12 May 2020 15:03:37 +0800
Message-Id: <1589267017-17294-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

Currently, we can use tinydrm ili9341 driver to drive ili9341 panel
by spi interface (both register configuration and video)

ili9341 have parallel and mcu interface as well, we extend the
support to parallel rgb interface with DRM_MODE_CONNECTOR_DPI

this driver can work as parallel rgb or serial spi mode by
different dts binding.
for serial spi interface dts binding configuration, refer to:
Documentation/devicetree/bindings/display/ilitek,ili9341.txt

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Changes:

V3:
    1 Add support for original dts binding "adafruit,yx240qv29",
      merged from tiny/ili9341.c, which is serial spi interface
      for register configuration and video trasfer.
    2 change the dts binding to st,sf-tc240t-9370-t for parallel
      rgb interface.

V2:
    none

V1:
    Add support for parallel rgb interface

 drivers/gpu/drm/panel/Kconfig                |  12 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 700 +++++++++++++++++++++++++++
 3 files changed, 713 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a1723c1..c938bee 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -95,6 +95,18 @@ config DRM_PANEL_ILITEK_IL9322
 	  Say Y here if you want to enable support for Ilitek IL9322
 	  QVGA (320x240) RGB, YUV and ITU-T BT.656 panels.
 
+config DRM_PANEL_ILITEK_ILI9341
+	tristate "Ilitek ILI9341 240x320 QVGA panels"
+	depends on OF && SPI
+	depends on DRM_KMS_HELPER
+	depends on DRM_KMS_CMA_HELPER
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DBI
+	help
+	  Say Y here if you want to enable support for Ilitek IL9341
+	  QVGA (240x320) RGB panels. support serial & parallel rgb
+	  interface.
+
 config DRM_PANEL_ILITEK_ILI9881C
 	tristate "Ilitek ILI9881C-based panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 96a883c..16947d7 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
new file mode 100644
index 0000000..17339db
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -0,0 +1,700 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Ilitek ILI9341 TFT LCD drm_panel driver.
+ *
+ * This panel can be configured to support:
+ * - 16-bit parallel RGB interface
+ * - 18-bit parallel RGB interface
+ *
+ * Copyright (C) 2020 Dillon Min <dillon.minfei@gmail.com>
+ * Derived from drivers/drm/gpu/panel/panel-ilitek-ili9322.c
+ */
+
+#include <linux/bitops.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+#include <linux/delay.h>
+#include <video/mipi_display.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_atomic_helper.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+#define ILI9341_SLEEP_OUT            0x11   /* Sleep out register */
+#define ILI9341_GAMMA                0x26   /* Gamma register */
+#define ILI9341_DISPLAY_OFF          0x28   /* Display off register */
+#define ILI9341_DISPLAY_ON           0x29   /* Display on register */
+#define ILI9341_COLUMN_ADDR          0x2a   /* Colomn address register */
+#define ILI9341_PAGE_ADDR            0x2b   /* Page address register */
+#define ILI9341_GRAM                 0x2c   /* GRAM register */
+#define ILI9341_MAC                  0x36   /* Memory Access Control register*/
+#define ILI9341_PIXEL_FORMAT         0x3A   /* Pixel Format register */
+#define ILI9341_RGB_INTERFACE        0xb0   /* RGB Interface Signal Control */
+#define ILI9341_FRC                  0xb1   /* Frame Rate Control register */
+#define ILI9341_DFC                  0xb6   /* Display Function Control
+					     * register
+					     */
+#define ILI9341_POWER1               0xc0   /* Power Control 1 register */
+#define ILI9341_POWER2               0xc1   /* Power Control 2 register */
+#define ILI9341_VCOM1                0xc5   /* VCOM Control 1 register */
+#define ILI9341_VCOM2                0xc7   /* VCOM Control 2 register */
+#define ILI9341_POWERA               0xcb   /* Power control A register */
+#define ILI9341_POWERB               0xcf   /* Power control B register */
+#define ILI9341_PGAMMA               0xe0   /* Positive Gamma Correction
+					     * register
+					     */
+#define ILI9341_NGAMMA               0xe1   /* Negative Gamma Correction
+					     * register
+					     */
+#define ILI9341_DTCA                 0xe8   /* Driver timing control A */
+#define ILI9341_DTCB                 0xea   /* Driver timing control B */
+#define ILI9341_POWER_SEQ            0xed   /* Power on sequence register */
+#define ILI9341_3GAMMA_EN            0xf2   /* 3 Gamma enable register */
+#define ILI9341_INTERFACE            0xf6   /* Interface control register */
+#define ILI9341_PRC                  0xf7   /* Pump ratio control register */
+#define ILI9341_ETMOD		     0xb7
+
+#define ILI9341_MADCTL_BGR	BIT(3)
+#define ILI9341_MADCTL_MV	BIT(5)
+#define ILI9341_MADCTL_MX	BIT(6)
+#define ILI9341_MADCTL_MY	BIT(7)
+
+/**
+ * ili9341_command - ili9341 command with optional parameter(s)
+ * @ili: struct ili9341
+ * @cmd: Command
+ * @seq...: Optional parameter(s)
+ *
+ * Send command to the controller.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+#define ili9341_command(ili, cmd, seq...) \
+({ \
+	u8 d[] = { seq }; \
+	_ili9341_command(ili, cmd, d, ARRAY_SIZE(d)); \
+})
+
+/**
+ * enum ili9341_input - the format of the incoming signal to the panel
+ *
+ * The panel can be connected to various input streams and four of them can
+ * be selected by electronic straps on the display. However it is possible
+ * to select another mode or override the electronic default with this
+ * setting.
+ */
+enum ili9341_input {
+	ILI9341_INPUT_PRGB_18_BITS = 0x0,
+	ILI9341_INPUT_PRGB_16_BITS = 0x1,
+	ILI9341_INPUT_UNKNOWN = 0xf,
+};
+
+/**
+ * struct ili9341_config - the system specific ILI9341 configuration
+ * @max_spi_speed: 10000000
+ * @input: the input/entry type used in this system, can be 16 or 18 bits
+ * @dclk_active_high: data/pixel clock active high, data will be clocked
+ * in on the rising edge of the DCLK (this is usually the case).
+ * @de_active_high: DE (data entry) is active high
+ * @hsync_active_high: HSYNC is active high
+ * @vsync_active_high: VSYNC is active high
+ */
+struct ili9341_config {
+	u32 max_spi_speed;
+	enum ili9341_input input;
+	bool dclk_active_high;
+	bool de_active_high;
+	bool hsync_active_high;
+	bool vsync_active_high;
+};
+
+struct ili9341 {
+	struct device *dev;
+	const struct ili9341_config *conf;
+	struct drm_panel panel;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *dc_gpio;
+	enum ili9341_input input;
+	u32 max_spi_speed;
+	struct regulator *vcc;
+};
+
+static inline struct ili9341 *panel_to_ili9341(struct drm_panel *panel)
+{
+	return container_of(panel, struct ili9341, panel);
+}
+
+int ili9341_spi_transfer(struct spi_device *spi, u32 speed_hz,
+			  u8 bpw, const void *buf, size_t len)
+{
+	size_t max_chunk = spi_max_transfer_size(spi);
+	struct spi_transfer tr = {
+		.bits_per_word = bpw,
+		.speed_hz = speed_hz,
+		.len = len,
+	};
+	struct spi_message m;
+	size_t chunk;
+	int ret;
+
+	spi_message_init_with_transfers(&m, &tr, 1);
+
+	while (len) {
+		chunk = min(len, max_chunk);
+
+		tr.tx_buf = buf;
+		tr.len = chunk;
+		buf += chunk;
+		len -= chunk;
+
+		ret = spi_sync(spi, &m);
+		if (ret) {
+			dev_err(&spi->dev, "spi_sync error: %d\n", ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int _ili9341_command(struct ili9341 *ili, u8 cmd, const void *data,
+				    size_t count)
+{
+	struct spi_device *spi = to_spi_device(ili->dev);
+	int ret = 0;
+
+	gpiod_set_value_cansleep(ili->dc_gpio, 0);
+
+	ret = ili9341_spi_transfer(spi, ili->max_spi_speed, 8,
+					(const void *)&cmd, 1);
+	if (ret || data == NULL || count == 0)
+		return ret;
+
+	gpiod_set_value_cansleep(ili->dc_gpio, 1);
+
+	return ili9341_spi_transfer(spi, ili->max_spi_speed, 8,
+		data, count);
+}
+
+static int ili9341_dpi_init(struct ili9341 *ili)
+{
+	ili9341_command(ili, 0xca, 0xc3, 0x08, 0x50);
+	ili9341_command(ili, ILI9341_POWERB, 0x00, 0xc1, 0x30);
+	ili9341_command(ili, ILI9341_POWER_SEQ, 0x64, 0x03, 0x12, 0x81);
+	ili9341_command(ili, ILI9341_DTCA, 0x85, 0x00, 0x78);
+	ili9341_command(ili, ILI9341_POWERA, 0x39, 0x2c, 0x00, 0x34, 0x02);
+	ili9341_command(ili, ILI9341_PRC, 0x20);
+	ili9341_command(ili, ILI9341_DTCB, 0x00, 0x00);
+	ili9341_command(ili, ILI9341_FRC, 0x00, 0x1b);
+	ili9341_command(ili, ILI9341_DFC, 0x0a, 0xa2);
+	ili9341_command(ili, ILI9341_POWER1, 0x10);
+	ili9341_command(ili, ILI9341_POWER2, 0x10);
+	ili9341_command(ili, ILI9341_VCOM1, 0x45, 0x15);
+	ili9341_command(ili, ILI9341_VCOM2, 0x90);
+	ili9341_command(ili, ILI9341_MAC, 0xc8);
+	ili9341_command(ili, ILI9341_3GAMMA_EN, 0x00);
+	ili9341_command(ili, ILI9341_RGB_INTERFACE, 0xc2);
+	ili9341_command(ili, ILI9341_DFC, 0x0a, 0xa7, 0x27, 0x04);
+	ili9341_command(ili, ILI9341_COLUMN_ADDR, 0x00, 0x00, 0x00, 0xef);
+	ili9341_command(ili, ILI9341_PAGE_ADDR, 0x00, 0x00, 0x01, 0x3f);
+	ili9341_command(ili, ILI9341_INTERFACE, 0x01, 0x00, 0x06);
+	if (ili->input == ILI9341_INPUT_PRGB_18_BITS)
+		ili9341_command(ili, ILI9341_PIXEL_FORMAT, 0x66);
+	else
+		ili9341_command(ili, ILI9341_PIXEL_FORMAT, 0x56);
+	ili9341_command(ili, ILI9341_GRAM);
+	msleep(200);
+	ili9341_command(ili, ILI9341_GAMMA, 0x01);
+	ili9341_command(ili, ILI9341_PGAMMA, 0x0f, 0x29, 0x24, 0x0c, 0x0e,
+						0x09, 0x4e, 0x78, 0x3c, 0x09,
+						0x13, 0x05, 0x17, 0x11, 0x00);
+	ili9341_command(ili, ILI9341_NGAMMA, 0x00, 0x16, 0x1b, 0x04, 0x11,
+						0x07, 0x31, 0x33, 0x42, 0x05,
+						0x0c, 0x0a, 0x28, 0x2f, 0x0f);
+	ili9341_command(ili, ILI9341_SLEEP_OUT);
+	msleep(200);
+	ili9341_command(ili, ILI9341_DISPLAY_ON);
+	ili9341_command(ili, ILI9341_GRAM);
+
+	dev_info(ili->dev, "initialized display rgb interface\n");
+
+	return 0;
+}
+
+static int ili9341_dpi_power_on(struct ili9341 *ili)
+{
+	int ret = 0;
+
+	/* Assert RESET */
+	gpiod_set_value(ili->reset_gpio, 1);
+
+	/* Enable power */
+	if (!IS_ERR(ili->vcc)) {
+		ret = regulator_enable(ili->vcc);
+		if (ret < 0) {
+			dev_err(ili->dev, "unable to enable vcc\n");
+			return ret;
+		}
+	}
+	msleep(20);
+
+	/* De-assert RESET */
+	gpiod_set_value(ili->reset_gpio, 0);
+	msleep(10);
+
+	return 0;
+}
+
+static int ili9341_dpi_power_off(struct ili9341 *ili)
+{
+	/* Disable power */
+	if (!IS_ERR(ili->vcc))
+		return regulator_disable(ili->vcc);
+
+	return 0;
+}
+
+static int ili9341_dpi_disable(struct drm_panel *panel)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+
+	ili9341_command(ili, ILI9341_DISPLAY_OFF);
+
+	return 0;
+}
+
+static int ili9341_dpi_unprepare(struct drm_panel *panel)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+
+	return ili9341_dpi_power_off(ili);
+}
+
+static int ili9341_dpi_prepare(struct drm_panel *panel)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+	int ret;
+
+	ret = ili9341_dpi_power_on(ili);
+	if (ret < 0)
+		return ret;
+
+	ret = ili9341_dpi_init(ili);
+	if (ret < 0)
+		ili9341_dpi_unprepare(panel);
+
+	return ret;
+}
+
+static int ili9341_dpi_enable(struct drm_panel *panel)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+
+	ili9341_command(ili, ILI9341_DISPLAY_ON);
+
+	return 0;
+}
+
+/* This is the only mode listed for parallel RGB in the datasheet */
+static const struct drm_display_mode rgb_240x320_mode = {
+	.clock = 6100,
+	.hdisplay = 240,
+	.hsync_start = 240 + 10,
+	.hsync_end = 240 + 10 + 10,
+	.htotal = 240 + 10 + 10 + 20,
+	.vdisplay = 320,
+	.vsync_start = 320 + 4,
+	.vsync_end = 320 + 4 + 2,
+	.vtotal = 320 + 4 + 2 + 2,
+	.vrefresh = 60,
+	.flags = 0,
+	.width_mm = 65,
+	.height_mm = 50,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int ili9341_dpi_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+	struct drm_device *drm = connector->dev;
+	struct drm_display_mode *mode;
+	struct drm_display_info *info;
+
+	info = &connector->display_info;
+	info->width_mm = rgb_240x320_mode.width_mm;
+	info->height_mm = rgb_240x320_mode.height_mm;
+
+	if (ili->conf->dclk_active_high)
+		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
+	else
+		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
+
+	if (ili->conf->de_active_high)
+		info->bus_flags |= DRM_BUS_FLAG_DE_HIGH;
+	else
+		info->bus_flags |= DRM_BUS_FLAG_DE_LOW;
+
+	mode = drm_mode_duplicate(drm, &rgb_240x320_mode);
+	if (!mode) {
+		DRM_ERROR("bad mode or failed to add mode\n");
+		return -EINVAL;
+	}
+	drm_mode_set_name(mode);
+
+	/* Set up the polarity */
+	if (ili->conf->hsync_active_high)
+		mode->flags |= DRM_MODE_FLAG_PHSYNC;
+	else
+		mode->flags |= DRM_MODE_FLAG_NHSYNC;
+
+	if (ili->conf->vsync_active_high)
+		mode->flags |= DRM_MODE_FLAG_PVSYNC;
+	else
+		mode->flags |= DRM_MODE_FLAG_NVSYNC;
+
+	drm_mode_probed_add(connector, mode);
+
+	return 1; /* Number of modes */
+}
+
+static const struct drm_panel_funcs ili9341_dpi_funcs = {
+	.disable = ili9341_dpi_disable,
+	.unprepare = ili9341_dpi_unprepare,
+	.prepare = ili9341_dpi_prepare,
+	.enable = ili9341_dpi_enable,
+	.get_modes = ili9341_dpi_get_modes,
+};
+
+static int ili9341_dpi_probe(struct spi_device *spi)
+{
+	int ret;
+	struct device *dev = &spi->dev;
+	struct ili9341 *ili;
+
+	ili = devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
+	if (!ili)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, ili);
+
+	ili->dev = dev;
+	/*
+	 * Every new incarnation of this display must have a unique
+	 * data entry for the system in this driver.
+	 */
+	ili->conf = of_device_get_match_data(dev);
+	if (!ili->conf) {
+		dev_err(dev, "missing device configuration\n");
+		return -ENODEV;
+	}
+
+	ili->vcc = devm_regulator_get_optional(dev, "vcc");
+	if (IS_ERR(ili->vcc))
+		dev_err(dev, "get optional vcc failed\n");
+
+	ili->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(ili->reset_gpio)) {
+		dev_err(dev, "failed to get RESET GPIO\n");
+		return PTR_ERR(ili->reset_gpio);
+	}
+
+	ili->dc_gpio = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(ili->dc_gpio)) {
+		dev_err(dev, "failed to get DC GPIO\n");
+		return PTR_ERR(ili->dc_gpio);
+	}
+
+	spi->bits_per_word = 8;
+	ret = spi_setup(spi);
+	if (ret < 0) {
+		dev_err(dev, "spi setup failed.\n");
+		return ret;
+	}
+
+	ili->input = ili->conf->input;
+	ili->max_spi_speed = ili->conf->max_spi_speed;
+
+	drm_panel_init(&ili->panel, dev, &ili9341_dpi_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	return drm_panel_add(&ili->panel);
+}
+
+
+
+static void ili9341_dbi_enable(struct drm_simple_display_pipe *pipe,
+			     struct drm_crtc_state *crtc_state,
+			     struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	u8 addr_mode;
+	int ret, idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	ret = mipi_dbi_poweron_conditional_reset(dbidev);
+	if (ret < 0)
+		goto out_exit;
+	if (ret == 1)
+		goto out_enable;
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
+
+	mipi_dbi_command(dbi, ILI9341_POWERB, 0x00, 0xc1, 0x30);
+	mipi_dbi_command(dbi, ILI9341_POWER_SEQ, 0x64, 0x03, 0x12, 0x81);
+	mipi_dbi_command(dbi, ILI9341_DTCA, 0x85, 0x00, 0x78);
+	mipi_dbi_command(dbi, ILI9341_POWERA, 0x39, 0x2c, 0x00, 0x34, 0x02);
+	mipi_dbi_command(dbi, ILI9341_PRC, 0x20);
+	mipi_dbi_command(dbi, ILI9341_DTCB, 0x00, 0x00);
+
+	/* Power Control */
+	mipi_dbi_command(dbi, ILI9341_POWER1, 0x23);
+	mipi_dbi_command(dbi, ILI9341_POWER2, 0x10);
+	/* VCOM */
+	mipi_dbi_command(dbi, ILI9341_VCOM1, 0x3e, 0x28);
+	mipi_dbi_command(dbi, ILI9341_VCOM2, 0x86);
+
+	/* Memory Access Control */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
+				MIPI_DCS_PIXEL_FMT_16BIT);
+
+	/* Frame Rate */
+	mipi_dbi_command(dbi, ILI9341_FRC, 0x00, 0x1b);
+
+	/* Gamma */
+	mipi_dbi_command(dbi, ILI9341_3GAMMA_EN, 0x00);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, 0x01);
+	mipi_dbi_command(dbi, ILI9341_PGAMMA,
+			 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1,
+			 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00);
+	mipi_dbi_command(dbi, ILI9341_NGAMMA,
+			 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1,
+			 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f);
+
+	/* DDRAM */
+	mipi_dbi_command(dbi, ILI9341_ETMOD, 0x07);
+
+	/* Display */
+	mipi_dbi_command(dbi, ILI9341_DFC, 0x08, 0x82, 0x27, 0x00);
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(100);
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+	msleep(100);
+
+out_enable:
+	switch (dbidev->rotation) {
+	default:
+		addr_mode = ILI9341_MADCTL_MX;
+		break;
+	case 90:
+		addr_mode = ILI9341_MADCTL_MV;
+		break;
+	case 180:
+		addr_mode = ILI9341_MADCTL_MY;
+		break;
+	case 270:
+		addr_mode = ILI9341_MADCTL_MV | ILI9341_MADCTL_MY |
+			    ILI9341_MADCTL_MX;
+		break;
+	}
+	addr_mode |= ILI9341_MADCTL_BGR;
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+	DRM_DEBUG_KMS("initialized display serial interface\n");
+out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs ili9341_dbi_funcs = {
+	.enable = ili9341_dbi_enable,
+	.disable = mipi_dbi_pipe_disable,
+	.update = mipi_dbi_pipe_update,
+	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_display_mode ili9341_dbi_mode = {
+	DRM_SIMPLE_MODE(240, 320, 37, 49),
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(ili9341_dbi_fops);
+
+static struct drm_driver ili9341_dbi_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &ili9341_dbi_fops,
+	.release		= mipi_dbi_release,
+	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.name			= "ili9341",
+	.desc			= "Ilitek ILI9341",
+	.date			= "20180514",
+	.major			= 1,
+	.minor			= 0,
+};
+static int ili9341_dbi_probe(struct spi_device *spi)
+{
+	struct mipi_dbi_dev *dbidev;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	struct device *dev = &spi->dev;
+	u32 rotation = 0;
+	int ret;
+
+	dbidev = kzalloc(sizeof(*dbidev), GFP_KERNEL);
+	if (!dbidev)
+		return -ENOMEM;
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+	ret = devm_drm_dev_init(dev, drm, &ili9341_dbi_driver);
+	if (ret) {
+		kfree(dbidev);
+		return ret;
+	}
+
+	drm_mode_config_init(drm);
+
+	dbi->reset = devm_gpiod_get_optional(dev, "reset",
+					GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
+		return PTR_ERR(dbi->reset);
+	}
+
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
+		return PTR_ERR(dc);
+	}
+
+	dbidev->regulator = devm_regulator_get_optional(dev, "vcc");
+	if (IS_ERR(dbidev->regulator))
+		dev_err(dev, "get optional vcc failed\n");
+
+	dbidev->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(dbidev->backlight))
+		return PTR_ERR(dbidev->backlight);
+
+	device_property_read_u32(dev, "rotation", &rotation);
+
+	ret = mipi_dbi_spi_init(spi, dbi, dc);
+	if (ret)
+		return ret;
+
+	ret = mipi_dbi_dev_init(dbidev, &ili9341_dbi_funcs,
+					&ili9341_dbi_mode, rotation);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, drm);
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+static int ili9341_probe(struct spi_device *spi)
+{
+	const struct spi_device_id *id = spi_get_device_id(spi);
+
+	if (!strcmp(id->name, "sf-tc240t-9370-t"))
+		return ili9341_dpi_probe(spi);
+	else if (!strcmp(id->name, "yx240qv29"))
+		return ili9341_dbi_probe(spi);
+
+	return -1;
+}
+
+static int ili9341_remove(struct spi_device *spi)
+{
+	const struct spi_device_id *id = spi_get_device_id(spi);
+	struct ili9341 *ili = spi_get_drvdata(spi);
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	if (!strcmp(id->name, "sf-tc240t-9370-t")) {
+		ili9341_dpi_power_off(ili);
+		drm_panel_remove(&ili->panel);
+	} else if (!strcmp(id->name, "yx240qv29")) {
+		drm_dev_unplug(drm);
+		drm_atomic_helper_shutdown(drm);
+	}
+	return 0;
+}
+
+static void ili9341_shutdown(struct spi_device *spi)
+{
+	const struct spi_device_id *id = spi_get_device_id(spi);
+
+	if (!strcmp(id->name, "yx240qv29"))
+		drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+/*
+ * The Stm32f429-disco board has a panel ili9341 connected to ltdc controller
+ */
+static const struct ili9341_config ili9341_stm32f429_disco_data = {
+	.dclk_active_high = true,
+	.de_active_high = false,
+	.hsync_active_high = false,
+	.vsync_active_high = false,
+	.max_spi_speed = 10000000,
+	.input = ILI9341_INPUT_PRGB_16_BITS,
+};
+
+static const struct of_device_id ili9341_of_match[] = {
+	{
+		.compatible = "st,sf-tc240t-9370-t",
+		.data = &ili9341_stm32f429_disco_data,
+	},
+	{
+		/* porting from tiny/ili9341.c
+		 * for original mipi dbi compitable
+		 */
+		.compatible = "adafruit,yx240qv29",
+		.data = NULL,
+	},
+};
+MODULE_DEVICE_TABLE(of, ili9341_of_match);
+
+static const struct spi_device_id ili9341_id[] = {
+	{ "yx240qv29", 0 },
+	{ "sf-tc240t-9370-t", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, ili9341_id);
+
+static struct spi_driver ili9341_driver = {
+	.probe = ili9341_probe,
+	.remove = ili9341_remove,
+	.shutdown = ili9341_shutdown,
+	.id_table = ili9341_id,
+	.driver = {
+		.name = "panel-ilitek-ili9341",
+		.of_match_table = ili9341_of_match,
+	},
+};
+module_spi_driver(ili9341_driver);
+
+MODULE_AUTHOR("Dillon Min <dillon.minfei@gmail.com>");
+MODULE_DESCRIPTION("ILI9341 LCD panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
