Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E860507374
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6995C10F0C0;
	Tue, 19 Apr 2022 16:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F7710F0C0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:42:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5004D60FAC;
 Tue, 19 Apr 2022 16:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553D4C385B2;
 Tue, 19 Apr 2022 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386543;
 bh=6Eb0nGTaa7inf2nC5qlMl31pJtmtNV3Kf+5eTPa8gHA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CO7rCBuiK9AhgJ1IN4juEhgPNA30YC1p9bh8jWaUqHGuF4U7X5oPW4dLW8Qx7dH/V
 jvdLKFa39OvNa7NZiQZbpgXdY+4Y0fqRg3TgoutA+QCdu2NJzIaHcruOhT9c3p1SDy
 3KlM2qB9EABeNVlsHNOzcPl2/Lnre9Pp72kx4xJWxjfgCC05fTm6GM4XpLJuyyFN7h
 yMNiNpSV8C2fa04ZvzNIZlUIWviLtB4PbO9u6GRPuJD4EH8ktQOkKpk8PSuyFz+kwt
 5PbzTtheQR4cPnNU0VxZP6tU2sx1Pr8qNnC/9Jq0pXnEmKBR6/jlL/DmG5xx/wjiXz
 T4Z3ivbgbNP9A==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 27/48] input: touchscreen: mainstone: sync with zylonite driver
Date: Tue, 19 Apr 2022 18:37:49 +0200
Message-Id: <20220419163810.2118169-28-arnd@kernel.org>
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

The two drivers are almost identical and can work on a variety
of hardware in principle. The mainstone driver supports additional
hardware, and the zylonite driver has a few cleanup patches.

Sync the two by adding the zylonite changes into the mainstone
one, and checking for the zylonite board to order to keep the
default behavior (interrupt enabled) there.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/mainstone-wm97xx.c | 59 ++++++++++----------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 618c80847d9f..940d3c92b1f8 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -24,9 +24,9 @@
 #include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-#include <linux/wm97xx.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/soc/pxa/cpu.h>
+#include <linux/wm97xx.h>
 
 #include <mach/regs-ac97.h>
 
@@ -42,23 +42,22 @@ struct continuous {
 #define WM_READS(sp) ((sp / HZ) + 1)
 
 static const struct continuous cinfo[] = {
-	{WM9705_ID2, 0, WM_READS(94), 94},
-	{WM9705_ID2, 1, WM_READS(188), 188},
-	{WM9705_ID2, 2, WM_READS(375), 375},
-	{WM9705_ID2, 3, WM_READS(750), 750},
-	{WM9712_ID2, 0, WM_READS(94), 94},
-	{WM9712_ID2, 1, WM_READS(188), 188},
-	{WM9712_ID2, 2, WM_READS(375), 375},
-	{WM9712_ID2, 3, WM_READS(750), 750},
-	{WM9713_ID2, 0, WM_READS(94), 94},
-	{WM9713_ID2, 1, WM_READS(120), 120},
-	{WM9713_ID2, 2, WM_READS(154), 154},
-	{WM9713_ID2, 3, WM_READS(188), 188},
+	{ WM9705_ID2, 0, WM_READS(94),  94  },
+	{ WM9705_ID2, 1, WM_READS(188), 188 },
+	{ WM9705_ID2, 2, WM_READS(375), 375 },
+	{ WM9705_ID2, 3, WM_READS(750), 750 },
+	{ WM9712_ID2, 0, WM_READS(94),  94  },
+	{ WM9712_ID2, 1, WM_READS(188), 188 },
+	{ WM9712_ID2, 2, WM_READS(375), 375 },
+	{ WM9712_ID2, 3, WM_READS(750), 750 },
+	{ WM9713_ID2, 0, WM_READS(94),  94  },
+	{ WM9713_ID2, 1, WM_READS(120), 120 },
+	{ WM9713_ID2, 2, WM_READS(154), 154 },
+	{ WM9713_ID2, 3, WM_READS(188), 188 },
 };
 
 /* continuous speed index */
 static int sp_idx;
-static u16 last, tries;
 static struct gpio_desc *gpiod_irq;
 
 /*
@@ -102,7 +101,7 @@ static void wm97xx_acc_pen_up(struct wm97xx *wm)
 {
 	unsigned int count;
 
-	schedule_timeout_uninterruptible(1);
+	msleep(1);
 
 	if (cpu_is_pxa27x()) {
 		while (MISR & (1 << 2))
@@ -117,13 +116,14 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 {
 	u16 x, y, p = 0x100 | WM97XX_ADCSEL_PRES;
 	int reads = 0;
+	static u16 last, tries;
 
 	/* When the AC97 queue has been drained we need to allow time
 	 * to buffer up samples otherwise we end up spinning polling
 	 * for samples.  The controller can't have a suitably low
 	 * threshold set to use the notifications it gives.
 	 */
-	schedule_timeout_uninterruptible(1);
+	msleep(1);
 
 	if (tries > 5) {
 		tries = 0;
@@ -193,6 +193,8 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 		/* There is some obscure mutant of WM9712 interbred with WM9713
 		 * used on Palm HW */
 		wm->variant = WM97xx_WM1613;
+	} else if (machine_is_zylonite()) {
+		pen_int = 1;
 	}
 
 	if (pen_int) {
@@ -253,13 +255,13 @@ static void wm97xx_irq_enable(struct wm97xx *wm, int enable)
 }
 
 static struct wm97xx_mach_ops mainstone_mach_ops = {
-	.acc_enabled = 1,
-	.acc_pen_up = wm97xx_acc_pen_up,
-	.acc_pen_down = wm97xx_acc_pen_down,
-	.acc_startup = wm97xx_acc_startup,
-	.acc_shutdown = wm97xx_acc_shutdown,
-	.irq_enable = wm97xx_irq_enable,
-	.irq_gpio = WM97XX_GPIO_2,
+	.acc_enabled	= 1,
+	.acc_pen_up	= wm97xx_acc_pen_up,
+	.acc_pen_down	= wm97xx_acc_pen_down,
+	.acc_startup	= wm97xx_acc_startup,
+	.acc_shutdown	= wm97xx_acc_shutdown,
+	.irq_enable	= wm97xx_irq_enable,
+	.irq_gpio	= WM97XX_GPIO_2,
 };
 
 static int mainstone_wm97xx_probe(struct platform_device *pdev)
@@ -274,14 +276,15 @@ static int mainstone_wm97xx_remove(struct platform_device *pdev)
 	struct wm97xx *wm = platform_get_drvdata(pdev);
 
 	wm97xx_unregister_mach_ops(wm);
+
 	return 0;
 }
 
 static struct platform_driver mainstone_wm97xx_driver = {
-	.probe = mainstone_wm97xx_probe,
-	.remove = mainstone_wm97xx_remove,
-	.driver = {
-		.name = "wm97xx-touch",
+	.probe	= mainstone_wm97xx_probe,
+	.remove	= mainstone_wm97xx_remove,
+	.driver	= {
+		.name	= "wm97xx-touch",
 	},
 };
 module_platform_driver(mainstone_wm97xx_driver);
-- 
2.29.2

