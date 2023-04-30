Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840426F2830
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 11:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A2110E009;
	Sun, 30 Apr 2023 09:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763B410E092
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 09:22:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ec8148f73eso1832010e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682846542; x=1685438542;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9UX6W3UfSa5ZRp8RtlXOP3rbOwpTJRUHBAtacedapPA=;
 b=K49pIBACcTBJG+8wY+XctIYgz9m7hvVAvkXHtirsNX1ThzYgORxbx9rX9y7bDg627F
 mMW0TZh+HkrJYpQd/8zq04wIXaEtOWBVeIM4rn3TJpDH2yhr3bdhyiJyEh0qSVHqzi6d
 2zs4vO4b+FCDUt5qIku+KLEstriZcrdvZc5AbUuu1WV9UdovzGC3PFvs+t3i6seXaqnY
 p0sQi4CwZkttlYGoa39lFp5VY8koR9AYKxXsRiSE6t8MRXXVPyLT9ALlm51k6z0Bx7ly
 FwwJ198X1DrVW3P1xrYn15boUZNNeZcFV7xIERKC4JRjleyhnWFOw55+3ygY3FV+5GEw
 PhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682846542; x=1685438542;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9UX6W3UfSa5ZRp8RtlXOP3rbOwpTJRUHBAtacedapPA=;
 b=TeopAwpQ5ZUoGFaW97rAbyTeSn0Qao3szrtsr04c2+4Bm6FEXdyBjObGXK/Vs0m6P8
 OyQ2qRZtAnLOPpj3TE1chj+7Zj3M8MRilJS95PJpqF5r3gv42ZeSeLweGxG4Al0oeOVU
 +VfR/5plG3NCjsqEUzKJrOIra5H6SPwja4sJRgih8onExQWIyCT3gyceucZaZJIMfMpt
 lkcWVUNXDSxOLP9SRhZbvy98mgbEI/nU97wxBH2xXbGrCpGqNSLoHScy9b9o6IAVbGVI
 2oefSQa7tlCBBltwSXVPfcKT8qjsjS0xjltdF6+5+SzH7CkVSQ7LuEv105vgLwKq8QeX
 YxjQ==
X-Gm-Message-State: AC+VfDwd2YTaR3kYIsp+43bogKzbZbflBpvUxCNcDGkBumyp3M17l1Xc
 /3om3LouiLWPJyWdsOtwB7Pujg==
X-Google-Smtp-Source: ACHHUZ5i1Hj12zld7832+ke0HKZEkcsm8zXYiACzaklV8NXfluT1ZrnmFfA5iGMDU41OJkgYcqf1fQ==
X-Received: by 2002:ac2:51ae:0:b0:4ea:fabb:4db1 with SMTP id
 f14-20020ac251ae000000b004eafabb4db1mr2646875lfk.1.1682846542681; 
 Sun, 30 Apr 2023 02:22:22 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05651238a200b004ec62d9a7f9sm4077327lft.62.2023.04.30.02.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 02:22:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Apr 2023 11:22:19 +0200
Subject: [PATCH 4/4] ARM: omap1: Fix up the Nokia 770 board device IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230430-nokia770-regression-v1-4-97704e36b094@linaro.org>
References: <20230430-nokia770-regression-v1-0-97704e36b094@linaro.org>
In-Reply-To: <20230430-nokia770-regression-v1-0-97704e36b094@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andreas Kemnade <andreas@kemnade.info>, Helge Deller <deller@gmx.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: linux-fbdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform devices on the Nokia 770 is using some
board-specific IRQs that get statically assigned to platform
devices in the boardfile.

This does not work with dynamic IRQ chip bases.

Utilize the NULL device to define some board-specific
GPIO lookups and use these to immediately look up the
same GPIOs, convert to IRQ numbers and pass as resources
to the devices. This is ugly but should work.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-nokia770.c | 58 +++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 53a4a44d5f4a..18a63c5a3dee 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -6,8 +6,8 @@
  */
 #include <linux/clkdev.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/mutex.h>
@@ -227,21 +227,28 @@ static struct i2c_board_info nokia770_i2c_board_info_2[] __initdata = {
 
 static void __init nokia770_cbus_init(void)
 {
-	const int retu_irq_gpio = 62;
-	const int tahvo_irq_gpio = 40;
-
-	if (gpio_request_one(retu_irq_gpio, GPIOF_IN, "Retu IRQ"))
-		return;
-	if (gpio_request_one(tahvo_irq_gpio, GPIOF_IN, "Tahvo IRQ")) {
-		gpio_free(retu_irq_gpio);
-		return;
+	struct gpio_desc *d;
+	int irq;
+
+	d = gpiod_get(NULL, "retu_irq", GPIOD_IN);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get CBUS Retu IRQ GPIO descriptor\n");
+	} else {
+		irq = gpiod_to_irq(d);
+		irq_set_irq_type(irq, IRQ_TYPE_EDGE_RISING);
+		nokia770_i2c_board_info_2[0].irq = irq;
+	}
+	d = gpiod_get(NULL, "tahvo_irq", GPIOD_IN);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get CBUS Tahvo IRQ GPIO descriptor\n");
+	} else {
+		irq = gpiod_to_irq(d);
+		irq_set_irq_type(irq, IRQ_TYPE_EDGE_RISING);
+		nokia770_i2c_board_info_2[1].irq = irq;
 	}
-	irq_set_irq_type(gpio_to_irq(retu_irq_gpio), IRQ_TYPE_EDGE_RISING);
-	irq_set_irq_type(gpio_to_irq(tahvo_irq_gpio), IRQ_TYPE_EDGE_RISING);
-	nokia770_i2c_board_info_2[0].irq = gpio_to_irq(retu_irq_gpio);
-	nokia770_i2c_board_info_2[1].irq = gpio_to_irq(tahvo_irq_gpio);
 	i2c_register_board_info(2, nokia770_i2c_board_info_2,
 				ARRAY_SIZE(nokia770_i2c_board_info_2));
+
 	gpiod_add_lookup_table(&nokia770_cbus_gpio_table);
 	platform_device_register(&nokia770_cbus_device);
 }
@@ -251,8 +258,25 @@ static void __init nokia770_cbus_init(void)
 }
 #endif /* CONFIG_I2C_CBUS_GPIO */
 
+static struct gpiod_lookup_table nokia770_irq_gpio_table = {
+	.dev_id = NULL,
+	.table = {
+		/* GPIO used by SPI device 1 */
+		GPIO_LOOKUP("gpio-0-15", 15, "ads7846_irq",
+			    GPIO_ACTIVE_HIGH),
+		/* GPIO used for retu IRQ */
+		GPIO_LOOKUP("gpio-48-63", 15, "retu_irq",
+			    GPIO_ACTIVE_HIGH),
+		/* GPIO used for tahvo IRQ */
+		GPIO_LOOKUP("gpio-32-47", 8, "tahvo_irq",
+			    GPIO_ACTIVE_HIGH),
+	},
+};
+
 static void __init omap_nokia770_init(void)
 {
+	struct gpio_desc *d;
+
 	/* On Nokia 770, the SleepX signal is masked with an
 	 * MPUIO line by default.  It has to be unmasked for it
 	 * to become functional */
@@ -262,9 +286,15 @@ static void __init omap_nokia770_init(void)
 	/* Unmask SleepX signal */
 	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
 
+	gpiod_add_lookup_table(&nokia770_irq_gpio_table);
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
 	gpiod_add_lookup_table(&nokia770_ads7846_gpio_table);
-	nokia770_spi_board_info[1].irq = gpio_to_irq(15);
+
+	d = gpiod_get(NULL, "ads7846_irq", GPIOD_IN);
+	if (IS_ERR(d))
+		pr_err("Unable to get ADS7846 IRQ GPIO descriptor\n");
+	else
+		nokia770_spi_board_info[1].irq = gpiod_to_irq(d);
 	spi_register_board_info(nokia770_spi_board_info,
 				ARRAY_SIZE(nokia770_spi_board_info));
 	omap_serial_init();

-- 
2.34.1

