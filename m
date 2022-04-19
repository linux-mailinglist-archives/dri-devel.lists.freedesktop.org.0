Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A8507383
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB0310F112;
	Tue, 19 Apr 2022 16:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E58110F0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:44:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3D9E61899;
 Tue, 19 Apr 2022 16:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DF2C385AB;
 Tue, 19 Apr 2022 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386644;
 bh=dqIJ/cXf0VPjwidEepmxEeZMiI7iN357W1VgCgckmDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SgAVx6hkZdaHv3CD8CN9Q7eFkd1WUAxX4YYUeFf05mJNMCnPu3lsKbjbIJb+nrCSH
 MbRo2uS1vlrWa6T8ShtJWreZbTLJrb3dXDPHBc25PMNa0XNB4hScmCRsBeQkEkqSCv
 +D1EK+XAc5braLuQb46aOEU3+7YIhdjNAW0N5PZNZrplKGnsuxTJ6x799OQOgfgMbW
 sbEfJMfJtKirlg5dW3FA+g0LbZALwv1CD2pNQ8XdFMVqsxpox+u5NY6tYIKKBroYh4
 rdb9urn3q2CZRyIE88jk1iLQ4cIwwCb8rIZ4FbWkBX8VTcNRrzaU+7vSzuv+G4IMMQ
 4B9UEXBmi+xuw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 40/48] ARM: pxa: tosa: use gpio lookup for battery
Date: Tue, 19 Apr 2022 18:38:02 +0200
Message-Id: <20220419163810.2118169-41-arnd@kernel.org>
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
 Sebastian Reichel <sre@kernel.org>, alsa-devel@alsa-project.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The battery driver uses a lot of GPIO lines, hardcoded from a
machine header file.

Change it to use a gpiod lookup table instead.

Reviewed-by: Sebastian Reichel <sre@kernel.org>
Acked-by: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/tosa.c            |  23 +++++
 drivers/power/supply/tosa_battery.c | 147 ++++++++++++++++------------
 2 files changed, 109 insertions(+), 61 deletions(-)

diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 5a16a025192c..19fe79518aaf 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -366,6 +366,28 @@ static struct pxaficp_platform_data tosa_ficp_platform_data = {
 	.shutdown		= tosa_irda_shutdown,
 };
 
+static struct gpiod_lookup_table tosa_battery_gpio_table = {
+	.dev_id = "wm97xx-battery",
+	.table = {
+		GPIO_LOOKUP("tc6393xb", TOSA_GPIO_CHARGE_OFF - TOSA_TC6393XB_GPIO_BASE,    "main charge off", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("tc6393xb", TOSA_GPIO_CHARGE_OFF_JC - TOSA_TC6393XB_GPIO_BASE, "jacket charge off", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT_SW_ON - TOSA_TC6393XB_GPIO_BASE,     "battery switch", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT0_V_ON - TOSA_TC6393XB_GPIO_BASE,     "main battery", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT1_V_ON - TOSA_TC6393XB_GPIO_BASE,     "jacket battery", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT1_TH_ON - TOSA_TC6393XB_GPIO_BASE,    "main battery temp", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT0_TH_ON - TOSA_TC6393XB_GPIO_BASE,    "jacket battery temp", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BU_CHRG_ON - TOSA_TC6393XB_GPIO_BASE,    "backup battery", GPIO_ACTIVE_HIGH ),
+
+		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_BAT0_CRG,      "main battery full", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_BAT1_CRG,      "jacket battery full", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_BAT0_LOW,      "main battery low", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_BAT1_LOW,      "jacket battery low", GPIO_ACTIVE_HIGH ),
+		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_JACKET_DETECT, "jacket detect", GPIO_ACTIVE_HIGH ),
+		{ },
+	},
+};
+
+
 /*
  * Tosa AC IN
  */
@@ -954,6 +976,7 @@ static void __init tosa_init(void)
 	/* enable batt_fault */
 	PMCR = 0x01;
 
+	gpiod_add_lookup_table(&tosa_battery_gpio_table);
 	gpiod_add_lookup_table(&tosa_mci_gpio_table);
 	gpiod_add_lookup_table(&tosa_audio_gpio_table);
 	pxa_set_mci_info(&tosa_mci_platform_data);
diff --git a/drivers/power/supply/tosa_battery.c b/drivers/power/supply/tosa_battery.c
index b26b0eca33e1..d10320f348d0 100644
--- a/drivers/power/supply/tosa_battery.c
+++ b/drivers/power/supply/tosa_battery.c
@@ -15,11 +15,16 @@
 #include <linux/gpio.h>
 
 #include <asm/mach-types.h>
-#include <mach/tosa.h>
 
 static DEFINE_MUTEX(bat_lock); /* protects gpio pins */
 static struct work_struct bat_work;
 
+struct tosa_gpio {
+	const char *con;
+	enum gpiod_flags flags;
+	struct gpio_desc *desc;
+};
+
 struct tosa_bat {
 	int status;
 	struct power_supply *psy;
@@ -28,38 +33,42 @@ struct tosa_bat {
 	struct mutex work_lock; /* protects data */
 
 	bool (*is_present)(struct tosa_bat *bat);
-	int gpio_full;
-	int gpio_charge_off;
+	struct tosa_gpio gpio_full;
+	struct tosa_gpio gpio_charge_off;
 
 	int technology;
 
-	int gpio_bat;
+	struct tosa_gpio gpio_bat;
 	int adc_bat;
 	int adc_bat_divider;
 	int bat_max;
 	int bat_min;
 
-	int gpio_temp;
+	struct tosa_gpio gpio_temp;
 	int adc_temp;
 	int adc_temp_divider;
 };
 
 static struct tosa_bat tosa_bat_main;
 static struct tosa_bat tosa_bat_jacket;
+static struct tosa_gpio gpiod_jacket_det = { "jacket detect", GPIOD_IN };
+static struct tosa_gpio gpiod_battery_switch = { "battery switch", GPIOD_OUT_LOW };
+static struct tosa_gpio gpiod_main_battery_low = { "main battery low", GPIOD_IN };
+static struct tosa_gpio gpiod_jacket_battery_low = { "jacket battery low", GPIOD_IN };
 
 static unsigned long tosa_read_bat(struct tosa_bat *bat)
 {
 	unsigned long value = 0;
 
-	if (bat->gpio_bat < 0 || bat->adc_bat < 0)
+	if (!bat->gpio_bat.desc || bat->adc_bat < 0)
 		return 0;
 
 	mutex_lock(&bat_lock);
-	gpio_set_value(bat->gpio_bat, 1);
+	gpiod_set_value(bat->gpio_bat.desc, 1);
 	msleep(5);
 	value = wm97xx_read_aux_adc(dev_get_drvdata(bat->psy->dev.parent),
 			bat->adc_bat);
-	gpio_set_value(bat->gpio_bat, 0);
+	gpiod_set_value(bat->gpio_bat.desc, 0);
 	mutex_unlock(&bat_lock);
 
 	value = value * 1000000 / bat->adc_bat_divider;
@@ -71,15 +80,15 @@ static unsigned long tosa_read_temp(struct tosa_bat *bat)
 {
 	unsigned long value = 0;
 
-	if (bat->gpio_temp < 0 || bat->adc_temp < 0)
+	if (!bat->gpio_temp.desc || bat->adc_temp < 0)
 		return 0;
 
 	mutex_lock(&bat_lock);
-	gpio_set_value(bat->gpio_temp, 1);
+	gpiod_set_value(bat->gpio_temp.desc, 1);
 	msleep(5);
 	value = wm97xx_read_aux_adc(dev_get_drvdata(bat->psy->dev.parent),
 			bat->adc_temp);
-	gpio_set_value(bat->gpio_temp, 0);
+	gpiod_set_value(bat->gpio_temp.desc, 0);
 	mutex_unlock(&bat_lock);
 
 	value = value * 10000 / bat->adc_temp_divider;
@@ -136,7 +145,7 @@ static int tosa_bat_get_property(struct power_supply *psy,
 
 static bool tosa_jacket_bat_is_present(struct tosa_bat *bat)
 {
-	return gpio_get_value(TOSA_GPIO_JACKET_DETECT) == 0;
+	return gpiod_get_value(gpiod_jacket_det.desc) == 0;
 }
 
 static void tosa_bat_external_power_changed(struct power_supply *psy)
@@ -166,23 +175,23 @@ static void tosa_bat_update(struct tosa_bat *bat)
 		bat->full_chrg = -1;
 	} else if (power_supply_am_i_supplied(psy)) {
 		if (bat->status == POWER_SUPPLY_STATUS_DISCHARGING) {
-			gpio_set_value(bat->gpio_charge_off, 0);
+			gpiod_set_value(bat->gpio_charge_off.desc, 0);
 			mdelay(15);
 		}
 
-		if (gpio_get_value(bat->gpio_full)) {
+		if (gpiod_get_value(bat->gpio_full.desc)) {
 			if (old == POWER_SUPPLY_STATUS_CHARGING ||
 					bat->full_chrg == -1)
 				bat->full_chrg = tosa_read_bat(bat);
 
-			gpio_set_value(bat->gpio_charge_off, 1);
+			gpiod_set_value(bat->gpio_charge_off.desc, 1);
 			bat->status = POWER_SUPPLY_STATUS_FULL;
 		} else {
-			gpio_set_value(bat->gpio_charge_off, 0);
+			gpiod_set_value(bat->gpio_charge_off.desc, 0);
 			bat->status = POWER_SUPPLY_STATUS_CHARGING;
 		}
 	} else {
-		gpio_set_value(bat->gpio_charge_off, 1);
+		gpiod_set_value(bat->gpio_charge_off.desc, 1);
 		bat->status = POWER_SUPPLY_STATUS_DISCHARGING;
 	}
 
@@ -251,18 +260,18 @@ static struct tosa_bat tosa_bat_main = {
 	.full_chrg = -1,
 	.psy = NULL,
 
-	.gpio_full = TOSA_GPIO_BAT0_CRG,
-	.gpio_charge_off = TOSA_GPIO_CHARGE_OFF,
+	.gpio_full = { "main battery full", GPIOD_IN },
+	.gpio_charge_off = { "main charge off" , GPIOD_OUT_HIGH },
 
 	.technology = POWER_SUPPLY_TECHNOLOGY_LIPO,
 
-	.gpio_bat = TOSA_GPIO_BAT0_V_ON,
+	.gpio_bat = { "main battery", GPIOD_OUT_LOW },
 	.adc_bat = WM97XX_AUX_ID3,
 	.adc_bat_divider = 414,
 	.bat_max = 4310000,
 	.bat_min = 1551 * 1000000 / 414,
 
-	.gpio_temp = TOSA_GPIO_BAT1_TH_ON,
+	.gpio_temp = { "main battery temp", GPIOD_OUT_LOW },
 	.adc_temp = WM97XX_AUX_ID2,
 	.adc_temp_divider = 10000,
 };
@@ -273,18 +282,18 @@ static struct tosa_bat tosa_bat_jacket = {
 	.psy = NULL,
 
 	.is_present = tosa_jacket_bat_is_present,
-	.gpio_full = TOSA_GPIO_BAT1_CRG,
-	.gpio_charge_off = TOSA_GPIO_CHARGE_OFF_JC,
+	.gpio_full = { "jacket battery full", GPIOD_IN },
+	.gpio_charge_off = { "jacket charge off", GPIOD_OUT_HIGH },
 
 	.technology = POWER_SUPPLY_TECHNOLOGY_LIPO,
 
-	.gpio_bat = TOSA_GPIO_BAT1_V_ON,
+	.gpio_bat = { "jacket battery", GPIOD_OUT_LOW },
 	.adc_bat = WM97XX_AUX_ID3,
 	.adc_bat_divider = 414,
 	.bat_max = 4310000,
 	.bat_min = 1551 * 1000000 / 414,
 
-	.gpio_temp = TOSA_GPIO_BAT0_TH_ON,
+	.gpio_temp = { "jacket battery temp", GPIOD_OUT_LOW },
 	.adc_temp = WM97XX_AUX_ID2,
 	.adc_temp_divider = 10000,
 };
@@ -294,36 +303,16 @@ static struct tosa_bat tosa_bat_bu = {
 	.full_chrg = -1,
 	.psy = NULL,
 
-	.gpio_full = -1,
-	.gpio_charge_off = -1,
-
 	.technology = POWER_SUPPLY_TECHNOLOGY_LiMn,
 
-	.gpio_bat = TOSA_GPIO_BU_CHRG_ON,
+	.gpio_bat = { "backup battery", GPIOD_OUT_LOW },
 	.adc_bat = WM97XX_AUX_ID4,
 	.adc_bat_divider = 1266,
 
-	.gpio_temp = -1,
 	.adc_temp = -1,
 	.adc_temp_divider = -1,
 };
 
-static struct gpio tosa_bat_gpios[] = {
-	{ TOSA_GPIO_CHARGE_OFF,	   GPIOF_OUT_INIT_HIGH, "main charge off" },
-	{ TOSA_GPIO_CHARGE_OFF_JC, GPIOF_OUT_INIT_HIGH, "jacket charge off" },
-	{ TOSA_GPIO_BAT_SW_ON,	   GPIOF_OUT_INIT_LOW,	"battery switch" },
-	{ TOSA_GPIO_BAT0_V_ON,	   GPIOF_OUT_INIT_LOW,	"main battery" },
-	{ TOSA_GPIO_BAT1_V_ON,	   GPIOF_OUT_INIT_LOW,	"jacket battery" },
-	{ TOSA_GPIO_BAT1_TH_ON,	   GPIOF_OUT_INIT_LOW,	"main battery temp" },
-	{ TOSA_GPIO_BAT0_TH_ON,	   GPIOF_OUT_INIT_LOW,	"jacket battery temp" },
-	{ TOSA_GPIO_BU_CHRG_ON,	   GPIOF_OUT_INIT_LOW,	"backup battery" },
-	{ TOSA_GPIO_BAT0_CRG,	   GPIOF_IN,		"main battery full" },
-	{ TOSA_GPIO_BAT1_CRG,	   GPIOF_IN,		"jacket battery full" },
-	{ TOSA_GPIO_BAT0_LOW,	   GPIOF_IN,		"main battery low" },
-	{ TOSA_GPIO_BAT1_LOW,	   GPIOF_IN,		"jacket battery low" },
-	{ TOSA_GPIO_JACKET_DETECT, GPIOF_IN,		"jacket detect" },
-};
-
 #ifdef CONFIG_PM
 static int tosa_bat_suspend(struct platform_device *dev, pm_message_t state)
 {
@@ -343,6 +332,21 @@ static int tosa_bat_resume(struct platform_device *dev)
 #define tosa_bat_resume NULL
 #endif
 
+static int tosa_bat_gpio_get(struct device *dev, struct tosa_gpio *gpio)
+{
+	int ret;
+
+	if (!gpio->con)
+		return 0;
+
+	gpio->desc = devm_gpiod_get(dev, gpio->con, gpio->flags);
+	ret = PTR_ERR_OR_ZERO(gpio->desc);
+	if (ret)
+		dev_warn(dev, "failed to get gpio \"%s\"\n", gpio->con);
+
+	return ret;
+}
+
 static int tosa_power_supply_register(struct device *dev,
 			struct tosa_bat *bat,
 			const struct power_supply_desc *desc)
@@ -350,6 +354,23 @@ static int tosa_power_supply_register(struct device *dev,
 	struct power_supply_config cfg = {
 		.drv_data = bat,
 	};
+	int ret;
+
+	ret = tosa_bat_gpio_get(dev, &bat->gpio_full);
+	if (ret)
+		return ret;
+
+	ret = tosa_bat_gpio_get(dev, &bat->gpio_charge_off);
+	if (ret)
+		return ret;
+
+	ret = tosa_bat_gpio_get(dev, &bat->gpio_bat);
+	if (ret)
+		return ret;
+
+	ret = tosa_bat_gpio_get(dev, &bat->gpio_temp);
+	if (ret)
+		return ret;
 
 	mutex_init(&bat->work_lock);
 	bat->psy = power_supply_register(dev, desc, &cfg);
@@ -358,49 +379,55 @@ static int tosa_power_supply_register(struct device *dev,
 }
 
 
-static int tosa_bat_probe(struct platform_device *dev)
+static int tosa_bat_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	int ret;
 
 	if (!machine_is_tosa())
 		return -ENODEV;
 
-	ret = gpio_request_array(tosa_bat_gpios, ARRAY_SIZE(tosa_bat_gpios));
+	ret = tosa_bat_gpio_get(dev, &gpiod_jacket_det);
 	if (ret)
 		return ret;
 
+	/* these are not used anywhere, continue on failure */
+	tosa_bat_gpio_get(dev, &gpiod_battery_switch);
+	tosa_bat_gpio_get(dev, &gpiod_main_battery_low);
+	tosa_bat_gpio_get(dev, &gpiod_jacket_battery_low);
+
 	INIT_WORK(&bat_work, tosa_bat_work);
 
-	ret = tosa_power_supply_register(&dev->dev, &tosa_bat_main,
+	ret = tosa_power_supply_register(dev, &tosa_bat_main,
 					 &tosa_bat_main_desc);
 	if (ret)
 		goto err_psy_reg_main;
 
-	ret = tosa_power_supply_register(&dev->dev, &tosa_bat_jacket,
+	ret = tosa_power_supply_register(dev, &tosa_bat_jacket,
 					 &tosa_bat_jacket_desc);
 	if (ret)
 		goto err_psy_reg_jacket;
 
-	ret = tosa_power_supply_register(&dev->dev, &tosa_bat_bu,
+	ret = tosa_power_supply_register(dev, &tosa_bat_bu,
 					 &tosa_bat_bu_desc);
 	if (ret)
 		goto err_psy_reg_bu;
 
-	ret = request_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG),
+	ret = request_irq(gpiod_to_irq(tosa_bat_main.gpio_full.desc),
 				tosa_bat_gpio_isr,
 				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
 				"main full", &tosa_bat_main);
 	if (ret)
 		goto err_req_main;
 
-	ret = request_irq(gpio_to_irq(TOSA_GPIO_BAT1_CRG),
+	ret = request_irq(gpiod_to_irq(tosa_bat_jacket.gpio_full.desc),
 				tosa_bat_gpio_isr,
 				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
 				"jacket full", &tosa_bat_jacket);
 	if (ret)
 		goto err_req_jacket;
 
-	ret = request_irq(gpio_to_irq(TOSA_GPIO_JACKET_DETECT),
+	ret = request_irq(gpiod_to_irq(gpiod_jacket_det.desc),
 				tosa_bat_gpio_isr,
 				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
 				"jacket detect", &tosa_bat_jacket);
@@ -409,9 +436,9 @@ static int tosa_bat_probe(struct platform_device *dev)
 		return 0;
 	}
 
-	free_irq(gpio_to_irq(TOSA_GPIO_BAT1_CRG), &tosa_bat_jacket);
+	free_irq(gpiod_to_irq(tosa_bat_jacket.gpio_full.desc), &tosa_bat_jacket);
 err_req_jacket:
-	free_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG), &tosa_bat_main);
+	free_irq(gpiod_to_irq(tosa_bat_main.gpio_full.desc), &tosa_bat_main);
 err_req_main:
 	power_supply_unregister(tosa_bat_bu.psy);
 err_psy_reg_bu:
@@ -423,15 +450,14 @@ static int tosa_bat_probe(struct platform_device *dev)
 	/* see comment in tosa_bat_remove */
 	cancel_work_sync(&bat_work);
 
-	gpio_free_array(tosa_bat_gpios, ARRAY_SIZE(tosa_bat_gpios));
 	return ret;
 }
 
 static int tosa_bat_remove(struct platform_device *dev)
 {
-	free_irq(gpio_to_irq(TOSA_GPIO_JACKET_DETECT), &tosa_bat_jacket);
-	free_irq(gpio_to_irq(TOSA_GPIO_BAT1_CRG), &tosa_bat_jacket);
-	free_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG), &tosa_bat_main);
+	free_irq(gpiod_to_irq(gpiod_jacket_det.desc), &tosa_bat_jacket);
+	free_irq(gpiod_to_irq(tosa_bat_jacket.gpio_full.desc), &tosa_bat_jacket);
+	free_irq(gpiod_to_irq(tosa_bat_main.gpio_full.desc), &tosa_bat_main);
 
 	power_supply_unregister(tosa_bat_bu.psy);
 	power_supply_unregister(tosa_bat_jacket.psy);
@@ -443,7 +469,6 @@ static int tosa_bat_remove(struct platform_device *dev)
 	 * unregistered now.
 	 */
 	cancel_work_sync(&bat_work);
-	gpio_free_array(tosa_bat_gpios, ARRAY_SIZE(tosa_bat_gpios));
 	return 0;
 }
 
-- 
2.29.2

