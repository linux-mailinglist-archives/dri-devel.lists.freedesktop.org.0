Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC3D1A9F94
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 14:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943B76E1D8;
	Wed, 15 Apr 2020 12:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F876E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:17:00 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r7so3351011ljg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 05:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ad60j8Gtj4fIlixhTAvardkqdLx6oG1rYvkVZA0T7NA=;
 b=p3sHGb1CakOl7CSez2eNx9kXTsV+W2Tww5xgYV6wePvS8+FeVaRnTsKs5vx4leAC8b
 jXlBCAn90NjkYf5DC9e12GWQR1FYrv7lBkKC2DBKfNfmcEF5+yDYsgJzhRz0c+WbYODC
 tgg8YnJsCPaxKPXqkKbsPiYPLIHRUpR/nxdTdHiYqUjJfjnBuUzWfGMDAOlQtWLNJaT0
 BDitGJUPJ0vlnmF2UZbJ0KuXXBHvOAddybHCM+wLhqTZSb8Tr4zI/RmhjwzsIhdsk7lg
 FDXLnFNBVedKx2CrYXdL3TBn7gwawzQIvaCkE5Mj8SYuxa9BOWaQJk9gM7xaCwVNq9wV
 Uk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ad60j8Gtj4fIlixhTAvardkqdLx6oG1rYvkVZA0T7NA=;
 b=V8hOZrr1kz651v+RGwibEoKlsADETvSYHE3d8O+9FuYvHK36q7LCyLqz2269YsmYza
 XtW30n1qTKWgCqMpdawnbfJvPz1d/mSQPMZJR3txWtmLbaqXCI5ugS6tDuYrzdl09iix
 ij2Lr8Yt7oqgalx8VOLBXVwZCl04AMcy4yxpXNtcGnekuACtwI9DOxheeARexbZgZEy6
 hwtHm26me0RhMdGknaw+3uJpI+hqvRYXqRtMGqYHvsKn7OFyrcIGoKoJyJed17OED/5E
 7cAnbU1Quyw9oYfkkLlf3UDbYdGARJSIrgoFtk0F5kiMVMCA8ii7vKpsMZuQzg9Y3Ugw
 smOw==
X-Gm-Message-State: AGi0PuZ9Acy6jXRbr57a6eb2adUR2nHgna49NcXkobopBMgnAg976Xuv
 eKiTodgHcdyMjIdR28nq5/BErw==
X-Google-Smtp-Source: APiQypJI/jNYX6qdlR8FiCF0alKrskzVggLzxeqWPQGboL99vh92NpYhuFZ+ARMpr8Q9oAZGxvEtQw==
X-Received: by 2002:a2e:9193:: with SMTP id f19mr3296496ljg.47.1586953018453; 
 Wed, 15 Apr 2020 05:16:58 -0700 (PDT)
Received: from localhost.localdomain
 (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
 by smtp.gmail.com with ESMTPSA id u7sm12601436lfb.84.2020.04.15.05.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 05:16:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: l4f00242t03: Convert to GPIO descriptors
Date: Wed, 15 Apr 2020 14:14:49 +0200
Message-Id: <20200415121449.111043-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
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
Cc: Alberto Panizzo <maramaopercheseimorto@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This converts the l4f00242t03 backlight driver to use GPIO
descriptors and switches the two Freescale i.MX boards over
to passing descriptors instead of global GPIO numbers.

We use the typical names "enable" and "reset" as found in
the device tree bindings for panel GPIOs.

This saves a lot of code in the driver and makes it possible
to get rid of the platform data header altogether.

Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Alberto Panizzo <maramaopercheseimorto@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
i.MX folks: please test if you can or at least ACK so Lee
knows if this is OK for you.
---
 arch/arm/mach-imx/mach-mx27_3ds.c     | 21 +++++++++----
 arch/arm/mach-imx/mach-mx31_3ds.c     | 24 +++++++++++---
 drivers/video/backlight/l4f00242t03.c | 45 +++++++++++----------------
 include/linux/spi/l4f00242t03.h       | 17 ----------
 4 files changed, 52 insertions(+), 55 deletions(-)
 delete mode 100644 include/linux/spi/l4f00242t03.h

diff --git a/arch/arm/mach-imx/mach-mx27_3ds.c b/arch/arm/mach-imx/mach-mx27_3ds.c
index 7b8325fb5b41..1da5f07952ac 100644
--- a/arch/arm/mach-imx/mach-mx27_3ds.c
+++ b/arch/arm/mach-imx/mach-mx27_3ds.c
@@ -13,6 +13,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/irq.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/ulpi.h>
@@ -20,8 +21,6 @@
 #include <linux/mfd/mc13783.h>
 #include <linux/spi/spi.h>
 #include <linux/regulator/machine.h>
-#include <linux/spi/l4f00242t03.h>
-
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -351,9 +350,19 @@ static const struct imx_fb_platform_data mx27_3ds_fb_data __initconst = {
 };
 
 /* LCD */
-static struct l4f00242t03_pdata mx27_3ds_lcd_pdata = {
-	.reset_gpio		= LCD_RESET,
-	.data_enable_gpio	= LCD_ENABLE,
+static struct gpiod_lookup_table mx27_3ds_lcd_gpiod_table = {
+	.dev_id = "spi0.0", /* Bus 0 chipselect 0 */
+	.table = {
+		/*
+		 * The i.MX27 has the i.MX21 GPIO controller, the GPIOs
+		 * numbered IMX_GPIO_NR(1, 3) and IMX_GPIO_NR(1, 31)
+		 * are in "bank 1" which is subtracted by one in the macro
+		 * so these are actually bank 0 on "imx21-gpio.0".
+		 */
+		GPIO_LOOKUP("imx21-gpio.0", 3, "reset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("imx21-gpio.0", 31, "enable", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct spi_board_info mx27_3ds_spi_devs[] __initdata = {
@@ -370,7 +379,6 @@ static struct spi_board_info mx27_3ds_spi_devs[] __initdata = {
 		.max_speed_hz	= 5000000,
 		.bus_num	= 0,
 		.chip_select	= 0, /* SS0 */
-		.platform_data	= &mx27_3ds_lcd_pdata,
 	},
 };
 
@@ -416,6 +424,7 @@ static void __init mx27pdk_late_init(void)
 	if (!otg_mode_host)
 		imx27_add_fsl_usb2_udc(&otg_device_pdata);
 
+	gpiod_add_lookup_table(&mx27_3ds_lcd_gpiod_table);
 	mx27_3ds_spi_devs[0].irq = gpio_to_irq(PMIC_INT);
 	spi_register_board_info(mx27_3ds_spi_devs,
 				ARRAY_SIZE(mx27_3ds_spi_devs));
diff --git a/arch/arm/mach-imx/mach-mx31_3ds.c b/arch/arm/mach-imx/mach-mx31_3ds.c
index 716d2ad51103..e81386190479 100644
--- a/arch/arm/mach-imx/mach-mx31_3ds.c
+++ b/arch/arm/mach-imx/mach-mx31_3ds.c
@@ -10,10 +10,10 @@
 #include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/mc13783.h>
 #include <linux/spi/spi.h>
-#include <linux/spi/l4f00242t03.h>
 #include <linux/regulator/machine.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/ulpi.h>
@@ -160,9 +160,23 @@ static struct mx3fb_platform_data mx3fb_pdata __initdata = {
 };
 
 /* LCD */
-static struct l4f00242t03_pdata mx31_3ds_l4f00242t03_pdata = {
-	.reset_gpio		= IOMUX_TO_GPIO(MX31_PIN_LCS1),
-	.data_enable_gpio	= IOMUX_TO_GPIO(MX31_PIN_SER_RS),
+static struct gpiod_lookup_table mx31_3ds_lcd_gpiod_table = {
+	.dev_id = "spi0.2", /* Bus 0 chipselect 2 */
+	.table = {
+		/*
+		 * "reset" has IOMUX_TO_GPIO(IOMUX_PIN(88, 28)).
+		 * The macro only shifts 88 to bits 9..16 and then
+		 * mask it and shift it back. The GPIO number is 88.
+		 * 88 is 2*32+24
+		 */
+		GPIO_LOOKUP("imx31-gpio.2", 24, "reset", GPIO_ACTIVE_HIGH),
+		/*
+		 * Same reasoning as above for
+		 * IOMUX_TO_GPIO(IOMUX_PIN(89, 27), pin 89 is 2*32+25.
+		 */
+		GPIO_LOOKUP("imx31-gpio.2", 25, "enable", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 /*
@@ -387,7 +401,6 @@ static struct spi_board_info mx31_3ds_spi_devs[] __initdata = {
 		.max_speed_hz	= 5000000,
 		.bus_num	= 0,
 		.chip_select	= 2, /* SS2 */
-		.platform_data	= &mx31_3ds_l4f00242t03_pdata,
 	},
 };
 
@@ -566,6 +579,7 @@ static void __init mx31_3ds_init(void)
 
 static void __init mx31_3ds_late(void)
 {
+	gpiod_add_lookup_table(&mx31_3ds_lcd_gpiod_table);
 	mx31_3ds_spi_devs[0].irq = gpio_to_irq(IOMUX_TO_GPIO(MX31_PIN_GPIO1_3));
 	spi_register_board_info(mx31_3ds_spi_devs,
 				ARRAY_SIZE(mx31_3ds_spi_devs));
diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
index 8554b4aa980c..46f97d1c3d21 100644
--- a/drivers/video/backlight/l4f00242t03.c
+++ b/drivers/video/backlight/l4f00242t03.c
@@ -14,13 +14,11 @@
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/lcd.h>
 #include <linux/slab.h>
 #include <linux/regulator/consumer.h>
-
 #include <linux/spi/spi.h>
-#include <linux/spi/l4f00242t03.h>
 
 struct l4f00242t03_priv {
 	struct spi_device	*spi;
@@ -28,16 +26,18 @@ struct l4f00242t03_priv {
 	int lcd_state;
 	struct regulator *io_reg;
 	struct regulator *core_reg;
+	struct gpio_desc *reset;
+	struct gpio_desc *enable;
 };
 
-static void l4f00242t03_reset(unsigned int gpio)
+static void l4f00242t03_reset(struct gpio_desc *gpiod)
 {
 	pr_debug("l4f00242t03_reset.\n");
-	gpio_set_value(gpio, 1);
+	gpiod_set_value(gpiod, 1);
 	mdelay(100);
-	gpio_set_value(gpio, 0);
+	gpiod_set_value(gpiod, 0);
 	mdelay(10);	/* tRES >= 100us */
-	gpio_set_value(gpio, 1);
+	gpiod_set_value(gpiod, 1);
 	mdelay(20);
 }
 
@@ -45,7 +45,6 @@ static void l4f00242t03_reset(unsigned int gpio)
 
 static void l4f00242t03_lcd_init(struct spi_device *spi)
 {
-	struct l4f00242t03_pdata *pdata = dev_get_platdata(&spi->dev);
 	struct l4f00242t03_priv *priv = spi_get_drvdata(spi);
 	const u16 cmd[] = { 0x36, param(0), 0x3A, param(0x60) };
 	int ret;
@@ -76,21 +75,20 @@ static void l4f00242t03_lcd_init(struct spi_device *spi)
 		return;
 	}
 
-	l4f00242t03_reset(pdata->reset_gpio);
+	l4f00242t03_reset(priv->reset);
 
-	gpio_set_value(pdata->data_enable_gpio, 1);
+	gpiod_set_value(priv->enable, 1);
 	msleep(60);
 	spi_write(spi, (const u8 *)cmd, ARRAY_SIZE(cmd) * sizeof(u16));
 }
 
 static void l4f00242t03_lcd_powerdown(struct spi_device *spi)
 {
-	struct l4f00242t03_pdata *pdata = dev_get_platdata(&spi->dev);
 	struct l4f00242t03_priv *priv = spi_get_drvdata(spi);
 
 	dev_dbg(&spi->dev, "Powering down LCD\n");
 
-	gpio_set_value(pdata->data_enable_gpio, 0);
+	gpiod_set_value(priv->enable, 0);
 
 	regulator_disable(priv->io_reg);
 	regulator_disable(priv->core_reg);
@@ -168,13 +166,6 @@ static struct lcd_ops l4f_ops = {
 static int l4f00242t03_probe(struct spi_device *spi)
 {
 	struct l4f00242t03_priv *priv;
-	struct l4f00242t03_pdata *pdata = dev_get_platdata(&spi->dev);
-	int ret;
-
-	if (pdata == NULL) {
-		dev_err(&spi->dev, "Uninitialized platform data.\n");
-		return -EINVAL;
-	}
 
 	priv = devm_kzalloc(&spi->dev, sizeof(struct l4f00242t03_priv),
 				GFP_KERNEL);
@@ -187,21 +178,21 @@ static int l4f00242t03_probe(struct spi_device *spi)
 
 	priv->spi = spi;
 
-	ret = devm_gpio_request_one(&spi->dev, pdata->reset_gpio,
-			GPIOF_OUT_INIT_HIGH, "lcd l4f00242t03 reset");
-	if (ret) {
+	priv->reset = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset)) {
 		dev_err(&spi->dev,
 			"Unable to get the lcd l4f00242t03 reset gpio.\n");
-		return ret;
+		return PTR_ERR(priv->reset);
 	}
+	gpiod_set_consumer_name(priv->reset, "lcd l4f00242t03 reset");
 
-	ret = devm_gpio_request_one(&spi->dev, pdata->data_enable_gpio,
-			GPIOF_OUT_INIT_LOW, "lcd l4f00242t03 data enable");
-	if (ret) {
+	priv->enable = devm_gpiod_get(&spi->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->enable)) {
 		dev_err(&spi->dev,
 			"Unable to get the lcd l4f00242t03 data en gpio.\n");
-		return ret;
+		return PTR_ERR(priv->enable);
 	}
+	gpiod_set_consumer_name(priv->enable, "lcd l4f00242t03 data enable");
 
 	priv->io_reg = devm_regulator_get(&spi->dev, "vdd");
 	if (IS_ERR(priv->io_reg)) {
diff --git a/include/linux/spi/l4f00242t03.h b/include/linux/spi/l4f00242t03.h
deleted file mode 100644
index 831a5de7a0e2..000000000000
--- a/include/linux/spi/l4f00242t03.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * l4f00242t03.h -- Platform glue for Epson L4F00242T03 LCD
- *
- * Copyright (c) 2009 Alberto Panizzo <maramaopercheseimorto@gmail.com>
- * Based on Marek Vasut work in lms283gf05.h
-*/
-
-#ifndef _INCLUDE_LINUX_SPI_L4F00242T03_H_
-#define _INCLUDE_LINUX_SPI_L4F00242T03_H_
-
-struct l4f00242t03_pdata {
-	unsigned int	reset_gpio;
-	unsigned int	data_enable_gpio;
-};
-
-#endif /* _INCLUDE_LINUX_SPI_L4F00242T03_H_ */
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
