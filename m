Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AA7808D56
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017C010E080;
	Thu,  7 Dec 2023 16:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A662B10E080
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701966201; x=1733502201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8+BxMMeY/Dw2CxqFJw7s1TVTKBcrVitZzQXCsmGEH6Y=;
 b=a6U9kvS4uAO0MrJcUy/gNVpI0EcDt5XXao9SYfqimmxt515fzarnqiCb
 5IiuSnj6Ts2T6DBPOr/HGGOC73ghkkKkW0EE4mCykpbwlRnncq/kHsnB6
 K3T8U7VK/jbAF5+uxWRAC0eT0OSdDhdB2vqXHrRGOmsoG1rcKCZV0Kuij
 fI2O5dlNpwUVjGZa/bWhKjDP0P92iSb5PGE9J6hB9IRA63ojNTj9AJr5G
 5OOr5cMppqCqJ3p9/CZI5viD/b7KwQh0c+qjzo9qaFpmxIQ05zQsNmFV+
 qPDcgZw3D1hXkfKQL5N0799w5GYqyHO2isbJN9taX0VZa4HNWy2SiWDaD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="397049187"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="397049187"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:23:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765154385"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765154385"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Dec 2023 08:23:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 783B6591; Thu,  7 Dec 2023 18:15:25 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v2 1/1] backlight: hx8357: Convert to agnostic GPIO API
Date: Thu,  7 Dec 2023 18:14:32 +0200
Message-ID: <20231207161513.3195509-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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
Cc: Andy Shevchenko <andy@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The of_gpio.h is going to be removed. In preparation of that convert
the driver to the agnostic API.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines with legacy bindings")
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: collected tags (Linus, Daniel), added Fixes tag (Linus)
 drivers/gpio/gpiolib-of.c        |  4 +-
 drivers/video/backlight/hx8357.c | 74 ++++++++++----------------------
 2 files changed, 24 insertions(+), 54 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 402f7d99b0c1..e7770eedd146 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -184,7 +184,7 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		const char *propname;
 		bool active_high;
 	} gpios[] = {
-#if !IS_ENABLED(CONFIG_LCD_HX8357)
+#if IS_ENABLED(CONFIG_LCD_HX8357)
 		/*
 		 * Himax LCD controllers used incorrectly named
 		 * "gpios-reset" property and also specified wrong
@@ -478,7 +478,7 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		 */
 		const char *compatible;
 	} gpios[] = {
-#if !IS_ENABLED(CONFIG_LCD_HX8357)
+#if IS_ENABLED(CONFIG_LCD_HX8357)
 		/* Himax LCD controllers used "gpios-reset" */
 		{ "reset",	"gpios-reset",	"himax,hx8357" },
 		{ "reset",	"gpios-reset",	"himax,hx8369" },
diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index f76d2469d490..d7298376cf74 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -6,11 +6,11 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/spi/spi.h>
 
 #define HX8357_NUM_IM_PINS	3
@@ -83,11 +83,10 @@
 #define HX8369_SET_GAMMA_CURVE_RELATED		0xe0
 
 struct hx8357_data {
-	unsigned		im_pins[HX8357_NUM_IM_PINS];
-	unsigned		reset;
+	struct gpio_descs	*im_pins;
+	struct gpio_desc	*reset;
 	struct spi_device	*spi;
 	int			state;
-	bool			use_im_pins;
 };
 
 static u8 hx8357_seq_power[] = {
@@ -321,11 +320,11 @@ static void hx8357_lcd_reset(struct lcd_device *lcdev)
 	struct hx8357_data *lcd = lcd_get_data(lcdev);
 
 	/* Reset the screen */
-	gpio_set_value(lcd->reset, 1);
+	gpiod_set_value(lcd->reset, 0);
 	usleep_range(10000, 12000);
-	gpio_set_value(lcd->reset, 0);
+	gpiod_set_value(lcd->reset, 1);
 	usleep_range(10000, 12000);
-	gpio_set_value(lcd->reset, 1);
+	gpiod_set_value(lcd->reset, 0);
 
 	/* The controller needs 120ms to recover from reset */
 	msleep(120);
@@ -340,10 +339,10 @@ static int hx8357_lcd_init(struct lcd_device *lcdev)
 	 * Set the interface selection pins to SPI mode, with three
 	 * wires
 	 */
-	if (lcd->use_im_pins) {
-		gpio_set_value_cansleep(lcd->im_pins[0], 1);
-		gpio_set_value_cansleep(lcd->im_pins[1], 0);
-		gpio_set_value_cansleep(lcd->im_pins[2], 1);
+	if (lcd->im_pins) {
+		gpiod_set_value_cansleep(lcd->im_pins->desc[0], 1);
+		gpiod_set_value_cansleep(lcd->im_pins->desc[1], 0);
+		gpiod_set_value_cansleep(lcd->im_pins->desc[2], 1);
 	}
 
 	ret = hx8357_spi_write_array(lcdev, hx8357_seq_power,
@@ -580,6 +579,7 @@ MODULE_DEVICE_TABLE(of, hx8357_dt_ids);
 
 static int hx8357_probe(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
 	struct lcd_device *lcdev;
 	struct hx8357_data *lcd;
 	const struct of_device_id *match;
@@ -601,49 +601,19 @@ static int hx8357_probe(struct spi_device *spi)
 	if (!match || !match->data)
 		return -EINVAL;
 
-	lcd->reset = of_get_named_gpio(spi->dev.of_node, "gpios-reset", 0);
-	if (!gpio_is_valid(lcd->reset)) {
-		dev_err(&spi->dev, "Missing dt property: gpios-reset\n");
-		return -EINVAL;
-	}
+	lcd->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(lcd->reset))
+		return dev_err_probe(dev, PTR_ERR(lcd->reset), "failed to request reset GPIO\n");
+	gpiod_set_consumer_name(lcd->reset, "hx8357-reset");
 
-	ret = devm_gpio_request_one(&spi->dev, lcd->reset,
-				    GPIOF_OUT_INIT_HIGH,
-				    "hx8357-reset");
-	if (ret) {
-		dev_err(&spi->dev,
-			"failed to request gpio %d: %d\n",
-			lcd->reset, ret);
-		return -EINVAL;
-	}
+	lcd->im_pins = devm_gpiod_get_array_optional(dev, "im", GPIOD_OUT_LOW);
+	if (IS_ERR(lcd->im_pins))
+		return dev_err_probe(dev, PTR_ERR(lcd->im_pins), "failed to request im GPIOs\n");
+	if (lcd->im_pins->ndescs < HX8357_NUM_IM_PINS)
+		return dev_err_probe(dev, -EINVAL, "not enough im GPIOs\n");
 
-	if (of_property_present(spi->dev.of_node, "im-gpios")) {
-		lcd->use_im_pins = 1;
-
-		for (i = 0; i < HX8357_NUM_IM_PINS; i++) {
-			lcd->im_pins[i] = of_get_named_gpio(spi->dev.of_node,
-							    "im-gpios", i);
-			if (lcd->im_pins[i] == -EPROBE_DEFER) {
-				dev_info(&spi->dev, "GPIO requested is not here yet, deferring the probe\n");
-				return -EPROBE_DEFER;
-			}
-			if (!gpio_is_valid(lcd->im_pins[i])) {
-				dev_err(&spi->dev, "Missing dt property: im-gpios\n");
-				return -EINVAL;
-			}
-
-			ret = devm_gpio_request_one(&spi->dev, lcd->im_pins[i],
-						    GPIOF_OUT_INIT_LOW,
-						    "im_pins");
-			if (ret) {
-				dev_err(&spi->dev, "failed to request gpio %d: %d\n",
-					lcd->im_pins[i], ret);
-				return -EINVAL;
-			}
-		}
-	} else {
-		lcd->use_im_pins = 0;
-	}
+	for (i = 0; i < HX8357_NUM_IM_PINS; i++)
+		gpiod_set_consumer_name(lcd->im_pins->desc[i], "im_pins");
 
 	lcdev = devm_lcd_device_register(&spi->dev, "mxsfb", &spi->dev, lcd,
 					&hx8357_ops);
-- 
2.43.0.rc1.1.gbec44491f096

