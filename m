Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BB81BDC94
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 14:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B196ED58;
	Wed, 29 Apr 2020 12:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AA66ED58
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:46:02 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 188so1516649lfa.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gl7N0ERh7srhdbo/BNAvneumnav4LyDNbZ9Qv4o9gLw=;
 b=g1a/p9upo2UEs+y5DQd1BKwWa7LeEAItrfE2QbyHgRMLw6UJnOd5J+/qjBWgmWKTMC
 83RWGsg8Grnb86dsqmnR+by7NodaHwiE/8tOqKma0xi+9pZOQhX6kvd3FKoxuwuNwFfj
 Cvjj7pKyPNW690ER3ehQiwSHicba+K/J4NxhBWlyrUx9kEEsp5gKrei3j49LzT8LvB6A
 B8NUw8d0a8D1LNYHf0aFpP7sMv6KvL1yZa+GEq+IMS6ESNByd4/y5sVKy4himnEK42WX
 mpcjSP3usQ2vxB1ki2uvefFpBbtNZjt1VqhUuC25OMgeG/ObC+TLfqXP6GU18S9DPj3V
 x2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gl7N0ERh7srhdbo/BNAvneumnav4LyDNbZ9Qv4o9gLw=;
 b=GqwbFAa2PuaTsGsJ8CSVRBriIqfYWVuGVzByxcnZ9aIxXHvJkACFL0O+Vd/VQgxWdH
 GDU6CSWS381Qzn6RR3oC8kljEZb+uhnvi28dP/3hBoU/VOhFMC2rCaXa4fwLM6Y/kXgu
 C3dF1lCeqYVTQ4r/doS+aAyTiE5UXpC2EN7Q+M5ERSLJuofJkezjjHvYDMnmn8p+Xald
 t3UpzdbRpp6oXQpE/Oeqq2hsuMQHefcE6P79+qWj+loSQrot8yw/FTTzzDn2UNcC2EDt
 oakJtFLFfdE2VKXQqN9TSZED2bu4YOThtgeBPQy35bpj84AIpKe5VeP7402zkAiWc+nr
 pzPg==
X-Gm-Message-State: AGi0PuYoO07lJokWhhdiAZWkBZmkn7VujozkPHYKgin+rh+QT03avvxH
 cwfPySMESDA1BDqRbELszM8pzQ==
X-Google-Smtp-Source: APiQypIgN4IUd+YJCnUO3U8CppBqxjZ9Ws4RutbYqbfiOHb1/K6HuvP8BjA/Bkr/Jm9Hc7kKbZcSRw==
X-Received: by 2002:a05:6512:308e:: with SMTP id
 z14mr22873450lfd.110.1588164360986; 
 Wed, 29 Apr 2020 05:46:00 -0700 (PDT)
Received: from localhost.localdomain
 (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
 by smtp.gmail.com with ESMTPSA id w11sm2246357ljo.39.2020.04.29.05.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 05:46:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] backlight: lms283gf05: Convert to GPIO descriptors
Date: Wed, 29 Apr 2020 14:43:54 +0200
Message-Id: <20200429124354.946167-1-linus.walleij@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This converts the lms283gf05 backlight driver to use GPIO
descriptors and switches the single PXA Palm Z2 device
over to defining these.

Since the platform data was only used to convey GPIO
information we can delete the platform data header.

Notice that we define the proper active low semantics in
the board file GPIO descriptor table (active low) and
assert the reset line by bringing it to "1" (asserted).

Cc: Marek Vasut <marex@denx.de>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Fix a use-before-allocated bug discovered by compile tests.
- Remove unused ret variable as autobuilders complained.
ChangeLog v1->v2:
- Bring up the GPIO de-asserted in probe()

Marek: I saw this was written by you, are you regularly
testing the Z2 device?
---
 arch/arm/mach-pxa/z2.c               | 12 +++++---
 drivers/video/backlight/lms283gf05.c | 42 +++++++++++-----------------
 include/linux/spi/lms283gf05.h       | 16 -----------
 3 files changed, 24 insertions(+), 46 deletions(-)
 delete mode 100644 include/linux/spi/lms283gf05.h

diff --git a/arch/arm/mach-pxa/z2.c b/arch/arm/mach-pxa/z2.c
index 21fd76bb09cd..89eb5243c85f 100644
--- a/arch/arm/mach-pxa/z2.c
+++ b/arch/arm/mach-pxa/z2.c
@@ -20,7 +20,6 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/pxa2xx_spi.h>
 #include <linux/spi/libertas_spi.h>
-#include <linux/spi/lms283gf05.h>
 #include <linux/power_supply.h>
 #include <linux/mtd/physmap.h>
 #include <linux/gpio.h>
@@ -578,8 +577,13 @@ static struct pxa2xx_spi_chip lms283_chip_info = {
 	.gpio_cs	= GPIO88_ZIPITZ2_LCD_CS,
 };
 
-static const struct lms283gf05_pdata lms283_pdata = {
-	.reset_gpio	= GPIO19_ZIPITZ2_LCD_RESET,
+static struct gpiod_lookup_table lms283_gpio_table = {
+	.dev_id = "spi2.0", /* SPI bus 2 chip select 0 */
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO19_ZIPITZ2_LCD_RESET,
+			    "reset", GPIO_ACTIVE_LOW),
+		{ },
+	},
 };
 
 static struct spi_board_info spi_board_info[] __initdata = {
@@ -595,7 +599,6 @@ static struct spi_board_info spi_board_info[] __initdata = {
 {
 	.modalias		= "lms283gf05",
 	.controller_data	= &lms283_chip_info,
-	.platform_data		= &lms283_pdata,
 	.max_speed_hz		= 400000,
 	.bus_num		= 2,
 	.chip_select		= 0,
@@ -615,6 +618,7 @@ static void __init z2_spi_init(void)
 {
 	pxa2xx_set_spi_info(1, &pxa_ssp1_master_info);
 	pxa2xx_set_spi_info(2, &pxa_ssp2_master_info);
+	gpiod_add_lookup_table(&lms283_gpio_table);
 	spi_register_board_info(spi_board_info, ARRAY_SIZE(spi_board_info));
 }
 #else
diff --git a/drivers/video/backlight/lms283gf05.c b/drivers/video/backlight/lms283gf05.c
index 0e45685bcc1c..529c415eb03b 100644
--- a/drivers/video/backlight/lms283gf05.c
+++ b/drivers/video/backlight/lms283gf05.c
@@ -9,16 +9,16 @@
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/lcd.h>
 
 #include <linux/spi/spi.h>
-#include <linux/spi/lms283gf05.h>
 #include <linux/module.h>
 
 struct lms283gf05_state {
 	struct spi_device	*spi;
 	struct lcd_device	*ld;
+	struct gpio_desc	*reset;
 };
 
 struct lms283gf05_seq {
@@ -90,13 +90,13 @@ static const struct lms283gf05_seq disp_pdwnseq[] = {
 };
 
 
-static void lms283gf05_reset(unsigned long gpio, bool inverted)
+static void lms283gf05_reset(struct gpio_desc *gpiod)
 {
-	gpio_set_value(gpio, !inverted);
+	gpiod_set_value(gpiod, 0); /* De-asserted */
 	mdelay(100);
-	gpio_set_value(gpio, inverted);
+	gpiod_set_value(gpiod, 1); /* Asserted */
 	mdelay(20);
-	gpio_set_value(gpio, !inverted);
+	gpiod_set_value(gpiod, 0); /* De-asserted */
 	mdelay(20);
 }
 
@@ -125,18 +125,15 @@ static int lms283gf05_power_set(struct lcd_device *ld, int power)
 {
 	struct lms283gf05_state *st = lcd_get_data(ld);
 	struct spi_device *spi = st->spi;
-	struct lms283gf05_pdata *pdata = dev_get_platdata(&spi->dev);
 
 	if (power <= FB_BLANK_NORMAL) {
-		if (pdata)
-			lms283gf05_reset(pdata->reset_gpio,
-					pdata->reset_inverted);
+		if (st->reset)
+			lms283gf05_reset(st->reset);
 		lms283gf05_toggle(spi, disp_initseq, ARRAY_SIZE(disp_initseq));
 	} else {
 		lms283gf05_toggle(spi, disp_pdwnseq, ARRAY_SIZE(disp_pdwnseq));
-		if (pdata)
-			gpio_set_value(pdata->reset_gpio,
-					pdata->reset_inverted);
+		if (st->reset)
+			gpiod_set_value(st->reset, 1); /* Asserted */
 	}
 
 	return 0;
@@ -150,24 +147,17 @@ static struct lcd_ops lms_ops = {
 static int lms283gf05_probe(struct spi_device *spi)
 {
 	struct lms283gf05_state *st;
-	struct lms283gf05_pdata *pdata = dev_get_platdata(&spi->dev);
 	struct lcd_device *ld;
-	int ret = 0;
-
-	if (pdata != NULL) {
-		ret = devm_gpio_request_one(&spi->dev, pdata->reset_gpio,
-				GPIOF_DIR_OUT | (!pdata->reset_inverted ?
-				GPIOF_INIT_HIGH : GPIOF_INIT_LOW),
-				"LMS283GF05 RESET");
-		if (ret)
-			return ret;
-	}
 
 	st = devm_kzalloc(&spi->dev, sizeof(struct lms283gf05_state),
 				GFP_KERNEL);
 	if (st == NULL)
 		return -ENOMEM;
 
+	st->reset = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
+	if (st->reset)
+		gpiod_set_consumer_name(st->reset, "LMS283GF05 RESET");
+
 	ld = devm_lcd_device_register(&spi->dev, "lms283gf05", &spi->dev, st,
 					&lms_ops);
 	if (IS_ERR(ld))
@@ -179,8 +169,8 @@ static int lms283gf05_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, st);
 
 	/* kick in the LCD */
-	if (pdata)
-		lms283gf05_reset(pdata->reset_gpio, pdata->reset_inverted);
+	if (st->reset)
+		lms283gf05_reset(st->reset);
 	lms283gf05_toggle(spi, disp_initseq, ARRAY_SIZE(disp_initseq));
 
 	return 0;
diff --git a/include/linux/spi/lms283gf05.h b/include/linux/spi/lms283gf05.h
deleted file mode 100644
index f237b2d062e9..000000000000
--- a/include/linux/spi/lms283gf05.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * lms283gf05.h - Platform glue for Samsung LMS283GF05 LCD
- *
- * Copyright (C) 2009 Marek Vasut <marek.vasut@gmail.com>
-*/
-
-#ifndef _INCLUDE_LINUX_SPI_LMS283GF05_H_
-#define _INCLUDE_LINUX_SPI_LMS283GF05_H_
-
-struct lms283gf05_pdata {
-	unsigned long	reset_gpio;
-	bool		reset_inverted;
-};
-
-#endif /* _INCLUDE_LINUX_SPI_LMS283GF05_H_ */
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
