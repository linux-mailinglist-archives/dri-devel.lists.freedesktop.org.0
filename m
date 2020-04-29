Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4038B1BD744
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 10:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D876EA8A;
	Wed, 29 Apr 2020 08:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AF66EA8A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 08:28:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j14so905609lfg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRXlJVSWrZ1m71YnEL7WYSBIeUOt3ITHocN/HUFLSS0=;
 b=DfiQAH4BhrMoQ5dTgJx1ZZAW9GNB9unkn5qawPeu39wBNtOearm7xGVniQK3zwx0Zg
 3Adj4N2CpLlkfWaWkcVgL9M3HjvpJGreRnMXeI7elOZru/pOoRdapbw1Sprh5mRfg0by
 6Yq/YjCOUnJbUtwlwulRXlrKRSoJEoNCr66SrcAUXTW5qU5zIL63PylgxPapTB7yBKE+
 c+ejRbpZRkdqTCiLTCfSeJZmjgD1FUj6Z/As0XTFFvituuokOzSBb80J3pz3j5d+/CcS
 kBbaYS4dUPnYBeskkWiobYETI3RFyrYJiejJOvxbEAsi1oj7U9usS45CLy+nd/R9PJUU
 Jb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRXlJVSWrZ1m71YnEL7WYSBIeUOt3ITHocN/HUFLSS0=;
 b=HIOL7aHm6VQXsoL+fMs5P+hs3dKISXLRLqL6emDb/E2iIixNoyHcCmg92clxIwkvAP
 qQYyta3y/A7VIvuaPMVNGAwutxGR1JUsDSprKfbazKW+SBrj4RMBEdDTA8xtne8SLRAe
 yqSU3TigR+2oke41mVAmPofCI4pNObuwxmKyXl0Ebj3KtpqgGFU2l2ModlZuhl/aegsq
 IyRM1VrQTTyc/V7Uz8hhlCLZyGbxhI2ONUooQ3t0g3CKCVKvTFoUC0QOe2HeEz8eP+Uo
 3Du9uaHpCGz6TCgxzDmQWJKCDpkVYufj9dmgZuqbR9PFoSk5xb25MoBPO/awIp25KWfa
 zWmQ==
X-Gm-Message-State: AGi0PubHaHwLqjr/1sIrkjVM7JM2XILDDAtCiNzPSofpeq3YJ3YJ1WUh
 OxnLQp6/yAyBtk9jHF3ZrDzhs8wuLwE=
X-Google-Smtp-Source: APiQypIaom3hZevaDX4sbUpkOTpksOYbIAGkJsdK/YarQ7OTlEYrvJQtFNUJIIcvznkjWtVtSgBGiw==
X-Received: by 2002:a19:c216:: with SMTP id l22mr20628545lfc.172.1588148915384; 
 Wed, 29 Apr 2020 01:28:35 -0700 (PDT)
Received: from localhost.localdomain
 (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
 by smtp.gmail.com with ESMTPSA id d23sm1848312ljg.90.2020.04.29.01.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 01:28:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: lms283gf05: Convert to GPIO descriptors
Date: Wed, 29 Apr 2020 10:26:31 +0200
Message-Id: <20200429082631.925461-1-linus.walleij@linaro.org>
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
Marek: I saw this was written by you, are you regularly
testing the Z2 device?
---
 arch/arm/mach-pxa/z2.c               | 12 ++++++---
 drivers/video/backlight/lms283gf05.c | 39 +++++++++++-----------------
 include/linux/spi/lms283gf05.h       | 16 ------------
 3 files changed, 23 insertions(+), 44 deletions(-)
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
index 0e45685bcc1c..71a26b8b7d3f 100644
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
@@ -150,18 +147,12 @@ static struct lcd_ops lms_ops = {
 static int lms283gf05_probe(struct spi_device *spi)
 {
 	struct lms283gf05_state *st;
-	struct lms283gf05_pdata *pdata = dev_get_platdata(&spi->dev);
 	struct lcd_device *ld;
 	int ret = 0;
 
-	if (pdata != NULL) {
-		ret = devm_gpio_request_one(&spi->dev, pdata->reset_gpio,
-				GPIOF_DIR_OUT | (!pdata->reset_inverted ?
-				GPIOF_INIT_HIGH : GPIOF_INIT_LOW),
-				"LMS283GF05 RESET");
-		if (ret)
-			return ret;
-	}
+	st->reset = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_HIGH);
+	if (st->reset)
+		gpiod_set_consumer_name(st->reset, "LMS283GF05 RESET");
 
 	st = devm_kzalloc(&spi->dev, sizeof(struct lms283gf05_state),
 				GFP_KERNEL);
@@ -179,8 +170,8 @@ static int lms283gf05_probe(struct spi_device *spi)
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
