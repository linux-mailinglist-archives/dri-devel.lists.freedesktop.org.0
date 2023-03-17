Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB2F6BF10C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 19:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7851210E108;
	Fri, 17 Mar 2023 18:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F3010E108
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 18:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679079111; x=1710615111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QrJv/rtBQ3bz415zpJxJeuw0At5q2bvQAoJvRLSgw1g=;
 b=f3E+9tZpQPhi+kATcvBZb8+8DeWQ7OUf9/aYB8Xu3xf8/+4dpQd/iPZH
 lViwtflxKzwNnX42zGjPaWFw8oG0dH0g4IqX+AIuJxLE1/7g/F2Hnx3Tt
 C25ngG9O19Td/xz+qSZeS4zru3jgB1jXhaAKX4R/nacdrlcr36lYF5RPc
 Eojs4YDn3d/fD85F/n+6IUh26Isel/UsyO+z5TCrzj889ZTE/bMtnqejf
 IKWgPwwpt2adOD4JHzroFhdJ3pf38JEvuR+qagH1Leo+MR/1BoA36Xnvy
 oYJaR8E3hra3fW6AdFhI72xwEzjicv3f1asKNaNbFacPlvfkYuvC3+jO4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326700218"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="326700218"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 11:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="712848563"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="712848563"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 17 Mar 2023 11:51:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A084F1CC; Fri, 17 Mar 2023 20:52:32 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v1 1/1] backlight: hx8357: Convert to agnostic GPIO API
Date: Fri, 17 Mar 2023 20:52:30 +0200
Message-Id: <20230317185230.46189-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 Helge Deller <deller@gmx.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The of_gpio.h is going to be removed. In preparation of that convert
the driver to the agnostic API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-of.c        |  4 +-
 drivers/video/backlight/hx8357.c | 74 ++++++++++----------------------
 2 files changed, 24 insertions(+), 54 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 1436cdb5fa26..cdd536a391be 100644
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
@@ -452,7 +452,7 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		 */
 		const char *compatible;
 	} gpios[] = {
-#if !IS_ENABLED(CONFIG_LCD_HX8357)
+#if IS_ENABLED(CONFIG_LCD_HX8357)
 		/* Himax LCD controllers used "gpios-reset" */
 		{ "reset",	"gpios-reset",	"himax,hx8357" },
 		{ "reset",	"gpios-reset",	"himax,hx8369" },
diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index 9b50bc96e00f..d7298376cf74 100644
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
 
-	if (of_find_property(spi->dev.of_node, "im-gpios", NULL)) {
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
2.39.2

