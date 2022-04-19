Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9D2507371
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677B010F09A;
	Tue, 19 Apr 2022 16:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF1B10F09A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:42:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92706B819DE;
 Tue, 19 Apr 2022 16:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A17C385AE;
 Tue, 19 Apr 2022 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386520;
 bh=vkbNMot1HaZLmF1XKNGCizpp67huD2tFJl0uD4gcruA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FSCbZpV1Dc9c7lTc/j0AP0FhjBo0afHIiy8rSFm4J/COwse/hlE0MWtRdvFHeiMXM
 4ksw2hp7kEcEo4tbc46HfPt8ZVavi3JNqVWlbeyRH559HmFG+FH+7d9mnWOqfvDYZM
 HN+N3F3N13povD3AscGRy7ycI594O9fAs0HfDIxVJbBSXoHKMaeZruEjL1amcbSbrI
 J9jkxz9AnOTZDgxht0kvzZJsFNe3GuYjqehOo7xje4o0kHt9NgweFyW0d+C0dKADlu
 BgMJln0qIyDqp4gJ2N6G44SYtjHA+7UbS+mSA0MqYyNc/qyiJmB+yOhR9A6R35UYyb
 3Yf66fWoNuKNA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 24/48] ARM: pxa: mainstone-wm97xx: use gpio lookup table
Date: Tue, 19 Apr 2022 18:37:46 +0200
Message-Id: <20220419163810.2118169-25-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This driver hardcodes gpio numbers without a header file.
Use lookup tables instead.

Cc: Marek Vasut <marek.vasut@gmail.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mainstone.c                |  9 +++++
 arch/arm/mach-pxa/palmld.c                   |  9 +++++
 arch/arm/mach-pxa/palmt5.c                   |  9 +++++
 arch/arm/mach-pxa/palmtx.c                   |  9 +++++
 drivers/input/touchscreen/mainstone-wm97xx.c | 35 ++++++++------------
 5 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index f0072e63b456..599736c93163 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -548,6 +548,14 @@ static struct gpiod_lookup_table mainstone_pcmcia_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table mainstone_wm97xx_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 4, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init mainstone_init(void)
 {
 	int SW7 = 0;  /* FIXME: get from SCR (Mst doc section 3.2.1.1) */
@@ -562,6 +570,7 @@ static void __init mainstone_init(void)
 		      "mst-pcmcia1", MST_PCMCIA_INPUTS, 0, NULL,
 		      NULL, mst_pcmcia1_irqs);
 	gpiod_add_lookup_table(&mainstone_pcmcia_gpio_table);
+	gpiod_add_lookup_table(&mainstone_wm97xx_gpio_table);
 
 	pxa_set_ffuart_info(NULL);
 	pxa_set_btuart_info(NULL);
diff --git a/arch/arm/mach-pxa/palmld.c b/arch/arm/mach-pxa/palmld.c
index d821606ce0b5..32308c63884e 100644
--- a/arch/arm/mach-pxa/palmld.c
+++ b/arch/arm/mach-pxa/palmld.c
@@ -347,6 +347,14 @@ static struct gpiod_lookup_table palmld_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmld_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmld_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmld_pin_config));
@@ -355,6 +363,7 @@ static void __init palmld_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmld_mci_gpio_table);
+	gpiod_add_lookup_table(&palmld_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMLD_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_irda_init(GPIO_NR_PALMLD_IR_DISABLE);
diff --git a/arch/arm/mach-pxa/palmt5.c b/arch/arm/mach-pxa/palmt5.c
index 460a8b1043a5..463b62ec1b01 100644
--- a/arch/arm/mach-pxa/palmt5.c
+++ b/arch/arm/mach-pxa/palmt5.c
@@ -190,6 +190,14 @@ static struct gpiod_lookup_table palmt5_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmt5_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmt5_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmt5_pin_config));
@@ -198,6 +206,7 @@ static void __init palmt5_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmt5_mci_gpio_table);
+	gpiod_add_lookup_table(&palmt5_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMT5_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_udc_init(GPIO_NR_PALMT5_USB_DETECT_N,
diff --git a/arch/arm/mach-pxa/palmtx.c b/arch/arm/mach-pxa/palmtx.c
index 86460d6ea721..c0d0762540ab 100644
--- a/arch/arm/mach-pxa/palmtx.c
+++ b/arch/arm/mach-pxa/palmtx.c
@@ -345,6 +345,14 @@ static struct gpiod_lookup_table palmtx_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmtx_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmtx_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmtx_pin_config));
@@ -353,6 +361,7 @@ static void __init palmtx_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmtx_mci_gpio_table);
+	gpiod_add_lookup_table(&palmtx_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMTX_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_udc_init(GPIO_NR_PALMTX_USB_DETECT_N,
diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index f8564b398eb3..87655105ef3a 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -21,6 +21,7 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/wm97xx.h>
@@ -58,7 +59,7 @@ static const struct continuous cinfo[] = {
 /* continuous speed index */
 static int sp_idx;
 static u16 last, tries;
-static int irq;
+static struct gpio_desc *gpiod_irq;
 
 /*
  * Pen sampling frequency (Hz) in continuous mode.
@@ -194,28 +195,21 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 	/* IRQ driven touchscreen is used on Palm hardware */
 	if (machine_is_palmt5() || machine_is_palmtx() || machine_is_palmld()) {
 		pen_int = 1;
-		irq = 27;
 		/* There is some obscure mutant of WM9712 interbred with WM9713
 		 * used on Palm HW */
 		wm->variant = WM97xx_WM1613;
-	} else if (machine_is_mainstone() && pen_int)
-		irq = 4;
-
-	if (irq) {
-		ret = gpio_request(irq, "Touchscreen IRQ");
-		if (ret)
-			goto out;
-
-		ret = gpio_direction_input(irq);
-		if (ret) {
-			gpio_free(irq);
-			goto out;
-		}
+	}
+
+	if (pen_int) {
+		gpiod_irq = gpiod_get(wm->dev, "touch", GPIOD_IN);
+		if (IS_ERR(gpiod_irq))
+			pen_int = 0;
+	}
 
-		wm->pen_irq = gpio_to_irq(irq);
+	if (pen_int) {
+		wm->pen_irq = gpiod_to_irq(gpiod_irq);
 		irq_set_irq_type(wm->pen_irq, IRQ_TYPE_EDGE_BOTH);
-	} else /* pen irq not supported */
-		pen_int = 0;
+	}
 
 	/* codec specific irq config */
 	if (pen_int) {
@@ -242,7 +236,6 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 		}
 	}
 
-out:
 	return ret;
 }
 
@@ -250,8 +243,8 @@ static void wm97xx_acc_shutdown(struct wm97xx *wm)
 {
 	/* codec specific deconfig */
 	if (pen_int) {
-		if (irq)
-			gpio_free(irq);
+		if (gpiod_irq)
+			gpiod_put(gpiod_irq);
 		wm->pen_irq = 0;
 	}
 }
-- 
2.29.2

