Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E4F1659B3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 10:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E396ED03;
	Thu, 20 Feb 2020 09:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470286ED03
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 09:00:41 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id x7so3397286ljc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 01:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xQyUcIJAmYsjiIqOU8ZLyJusSsvw01fJTs4gZ/wbdSI=;
 b=DhW8sVyA2Gy3MObMiY0VfSS90Qmm7alw6x/6MJLu/o+DkrHDOHawx6OCsAy7zpwPOn
 FzI7OLbb33FwWJvNy7q2Lq/QB8OpGeYuscMK89k3vN6PGUUVQhu0Cq3/Uq/AhQOaZbMQ
 yn4NHGHNV3kjlYL0xJg+Ep7gk1HYp7C3aU4wNsdPNYgETPB4NExpHYMuiS6p/t+O62dA
 1ZPkkmWqs0eUMQKv3Qz496uhuek9qfMYdohhpYAdzgMuljdk6uO/77BH/TIsUI9cg7j9
 YPHCcJ8rSJqJ5lFfFzo0/gmtrBPpg9qIX8dP8auaf4huKIZTJUsSTpmyRtaO8wiB7hPv
 hd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xQyUcIJAmYsjiIqOU8ZLyJusSsvw01fJTs4gZ/wbdSI=;
 b=FwW0dwBSvGSucKExqTTfv4UbWh4yjE4lQ8+guuVAer3FRx/HsfjnjLWz/AXMnTywIO
 rXJwnX6zlEBmXV9xQiYES2BmxEpOzHWY57hWqvTxjbsLQWd2JwJKA56+DfhO2z/tnzyO
 CYQ1G3x+dNxx2CbzNcLiwYQen+P5v8syEhKCFdZXCx1g+z/98p0liVHXCrPy5nLEBe6o
 3KIQ3AMVJyqyYzXI3TIh4uPGDq7u2NI1OIxfaLRmZTRWV2RKX6ZYwqnsUHdnov+1VFX0
 Vh3Ky3tHi8/1zvgm65YHwBB79d5FKQ/gnpCkV/wSjkSn8ft+tYRIBuKuMrK4F/MDdw+1
 hwhA==
X-Gm-Message-State: APjAAAUGwXTT+QamlBknyftlterl0nhnSDVPbqHEtd4Mq/WNaZd1yxIs
 IGbRMHgzvKlY1dSvespSwhZNdA==
X-Google-Smtp-Source: APXvYqw4A0CT9CtyProq+7yzdDXTKnvw0o8i6wDUSCD7YpxDhT9dP8XLiq59k/r1kzW2JiE89rlKxA==
X-Received: by 2002:a05:651c:414:: with SMTP id
 20mr17320946lja.165.1582189239193; 
 Thu, 20 Feb 2020 01:00:39 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id y14sm1321049ljk.46.2020.02.20.01.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 01:00:38 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] backlight: corgi: Convert to use GPIO descriptors
Date: Thu, 20 Feb 2020 10:00:32 +0100
Message-Id: <20200220090032.6635-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
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
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Andrea Adami <andrea.adami@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code in the Corgi backlight driver can be considerably
simplified by moving to GPIO descriptors and lookup tables
from the board files instead of passing GPIO numbers using
the old API.

Make sure to encode inversion semantics for the Akita and
Spitz platforms inside the GPIO lookup table and drop the
custom inversion semantics from the driver.

All in-tree users are converted in this patch.

Cc: Andrea Adami <andrea.adami@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Switch the SPI bus name to "spi1.1" rather than "spi0.1" for
  Corgi and "spi2.1" rather than "spi0.1" for Spitz, as
  pxa2xx_set_spi_info() sets the bus number to 1 and 2
  respectively.
ChangeLog v1->v2:
- Collect Robert's ACK.
---
 arch/arm/mach-pxa/corgi.c           | 12 ++++-
 arch/arm/mach-pxa/spitz.c           | 34 +++++++++++----
 drivers/video/backlight/corgi_lcd.c | 68 ++++++++---------------------
 include/linux/spi/corgi_lcd.h       |  3 --
 4 files changed, 54 insertions(+), 63 deletions(-)

diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
index f2d73289230f..593c7f793da5 100644
--- a/arch/arm/mach-pxa/corgi.c
+++ b/arch/arm/mach-pxa/corgi.c
@@ -563,13 +563,20 @@ static void corgi_bl_kick_battery(void)
 	}
 }
 
+static struct gpiod_lookup_table corgi_lcdcon_gpio_table = {
+	.dev_id = "spi1.1",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", CORGI_GPIO_BACKLIGHT_CONT,
+			    "BL_CONT", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct corgi_lcd_platform_data corgi_lcdcon_info = {
 	.init_mode		= CORGI_LCD_MODE_VGA,
 	.max_intensity		= 0x2f,
 	.default_intensity	= 0x1f,
 	.limit_mask		= 0x0b,
-	.gpio_backlight_cont	= CORGI_GPIO_BACKLIGHT_CONT,
-	.gpio_backlight_on	= -1,
 	.kick_battery		= corgi_bl_kick_battery,
 };
 
@@ -609,6 +616,7 @@ static struct spi_board_info corgi_spi_devices[] = {
 static void __init corgi_init_spi(void)
 {
 	pxa2xx_set_spi_info(1, &corgi_spi_info);
+	gpiod_add_lookup_table(&corgi_lcdcon_gpio_table);
 	spi_register_board_info(ARRAY_AND_SIZE(corgi_spi_devices));
 }
 #else
diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index a4fdc399d152..371008e9bb02 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -525,13 +525,33 @@ static void spitz_bl_kick_battery(void)
 	}
 }
 
+static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
+	.dev_id = "spi2.1",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_CONT,
+			    "BL_CONT", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_ON,
+			    "BL_ON", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table akita_lcdcon_gpio_table = {
+	.dev_id = "spi2.1",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_CONT,
+			    "BL_CONT", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_ON,
+			    "BL_ON", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct corgi_lcd_platform_data spitz_lcdcon_info = {
 	.init_mode		= CORGI_LCD_MODE_VGA,
 	.max_intensity		= 0x2f,
 	.default_intensity	= 0x1f,
 	.limit_mask		= 0x0b,
-	.gpio_backlight_cont	= SPITZ_GPIO_BACKLIGHT_CONT,
-	.gpio_backlight_on	= SPITZ_GPIO_BACKLIGHT_ON,
 	.kick_battery		= spitz_bl_kick_battery,
 };
 
@@ -574,12 +594,10 @@ static struct pxa2xx_spi_controller spitz_spi_info = {
 
 static void __init spitz_spi_init(void)
 {
-	struct corgi_lcd_platform_data *lcd_data = &spitz_lcdcon_info;
-
-	if (machine_is_akita()) {
-		lcd_data->gpio_backlight_cont = AKITA_GPIO_BACKLIGHT_CONT;
-		lcd_data->gpio_backlight_on = AKITA_GPIO_BACKLIGHT_ON;
-	}
+	if (machine_is_akita())
+		gpiod_add_lookup_table(&akita_lcdcon_gpio_table);
+	else
+		gpiod_add_lookup_table(&spitz_lcdcon_gpio_table);
 
 	pxa2xx_set_spi_info(2, &spitz_spi_info);
 	spi_register_board_info(ARRAY_AND_SIZE(spitz_spi_devices));
diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
index 68f7592c5060..25ef0cbd7583 100644
--- a/drivers/video/backlight/corgi_lcd.c
+++ b/drivers/video/backlight/corgi_lcd.c
@@ -15,7 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/fb.h>
 #include <linux/lcd.h>
 #include <linux/spi/spi.h>
@@ -90,9 +90,8 @@ struct corgi_lcd {
 	int	mode;
 	char	buf[2];
 
-	int	gpio_backlight_on;
-	int	gpio_backlight_cont;
-	int	gpio_backlight_cont_inverted;
+	struct gpio_desc *backlight_on;
+	struct gpio_desc *backlight_cont;
 
 	void (*kick_battery)(void);
 };
@@ -403,13 +402,13 @@ static int corgi_bl_set_intensity(struct corgi_lcd *lcd, int intensity)
 	corgi_ssp_lcdtg_send(lcd, DUTYCTRL_ADRS, intensity);
 
 	/* Bit 5 via GPIO_BACKLIGHT_CONT */
-	cont = !!(intensity & 0x20) ^ lcd->gpio_backlight_cont_inverted;
+	cont = !!(intensity & 0x20);
 
-	if (gpio_is_valid(lcd->gpio_backlight_cont))
-		gpio_set_value_cansleep(lcd->gpio_backlight_cont, cont);
+	if (lcd->backlight_cont)
+		gpiod_set_value_cansleep(lcd->backlight_cont, cont);
 
-	if (gpio_is_valid(lcd->gpio_backlight_on))
-		gpio_set_value_cansleep(lcd->gpio_backlight_on, intensity);
+	if (lcd->backlight_on)
+		gpiod_set_value_cansleep(lcd->backlight_on, intensity);
 
 	if (lcd->kick_battery)
 		lcd->kick_battery();
@@ -482,48 +481,17 @@ static int setup_gpio_backlight(struct corgi_lcd *lcd,
 				struct corgi_lcd_platform_data *pdata)
 {
 	struct spi_device *spi = lcd->spi_dev;
-	int err;
-
-	lcd->gpio_backlight_on = -1;
-	lcd->gpio_backlight_cont = -1;
-
-	if (gpio_is_valid(pdata->gpio_backlight_on)) {
-		err = devm_gpio_request(&spi->dev, pdata->gpio_backlight_on,
-					"BL_ON");
-		if (err) {
-			dev_err(&spi->dev,
-				"failed to request GPIO%d for backlight_on\n",
-				pdata->gpio_backlight_on);
-			return err;
-		}
-
-		lcd->gpio_backlight_on = pdata->gpio_backlight_on;
-		gpio_direction_output(lcd->gpio_backlight_on, 0);
-	}
 
-	if (gpio_is_valid(pdata->gpio_backlight_cont)) {
-		err = devm_gpio_request(&spi->dev, pdata->gpio_backlight_cont,
-					"BL_CONT");
-		if (err) {
-			dev_err(&spi->dev,
-				"failed to request GPIO%d for backlight_cont\n",
-				pdata->gpio_backlight_cont);
-			return err;
-		}
-
-		lcd->gpio_backlight_cont = pdata->gpio_backlight_cont;
-
-		/* spitz and akita use both GPIOs for backlight, and
-		 * have inverted polarity of GPIO_BACKLIGHT_CONT
-		 */
-		if (gpio_is_valid(lcd->gpio_backlight_on)) {
-			lcd->gpio_backlight_cont_inverted = 1;
-			gpio_direction_output(lcd->gpio_backlight_cont, 1);
-		} else {
-			lcd->gpio_backlight_cont_inverted = 0;
-			gpio_direction_output(lcd->gpio_backlight_cont, 0);
-		}
-	}
+	lcd->backlight_on = devm_gpiod_get_optional(&spi->dev,
+						    "BL_ON", GPIOD_OUT_LOW);
+	if (IS_ERR(lcd->backlight_on))
+		return PTR_ERR(lcd->backlight_on);
+
+	lcd->backlight_cont = devm_gpiod_get_optional(&spi->dev, "BL_CONT",
+						      GPIOD_OUT_LOW);
+	if (IS_ERR(lcd->backlight_cont))
+		return PTR_ERR(lcd->backlight_cont);
+
 	return 0;
 }
 
diff --git a/include/linux/spi/corgi_lcd.h b/include/linux/spi/corgi_lcd.h
index edf4beccdadb..0b857616919c 100644
--- a/include/linux/spi/corgi_lcd.h
+++ b/include/linux/spi/corgi_lcd.h
@@ -11,9 +11,6 @@ struct corgi_lcd_platform_data {
 	int	default_intensity;
 	int	limit_mask;
 
-	int	gpio_backlight_on;	/* -1 if n/a */
-	int	gpio_backlight_cont;	/* -1 if n/a */
-
 	void (*notify)(int intensity);
 	void (*kick_battery)(void);
 };
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
