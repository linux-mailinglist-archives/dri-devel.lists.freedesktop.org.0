Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95550736A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16F610F06F;
	Tue, 19 Apr 2022 16:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFC110F06C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:41:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4DF5B818E6;
 Tue, 19 Apr 2022 16:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23064C385A5;
 Tue, 19 Apr 2022 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386473;
 bh=UmyAEDevE+rFHmIeeKFFlzSBscHHSEtR+AtXVKUZXjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VBOATLbRuYChK3MBgRX8mPip9VFQsTd4uM6E3FKAYou3P3IZa9nmev0mrBBoYpVGs
 Nl+voA7jYEZWdMuLiO7BEMPH+MVsDjnXXGALSLYw1w1AX0WnSQTPUBDuRtK63hpICj
 8+5p1J7vvcJkBz7CuQogkh9GDU2SBWlcgjibaorUtjAG4DdHSgFg+dieu5I1H5UTwe
 yODr+X/HyGXAHTGbi4Lq4APNxVx4sfb3QJu3sbtv29oNO8I1LDZpvn7U0jmcS7bSjQ
 9f0xIKo83CR6rz6qWgvk3LUsWMEix8qqKI0I+7fX418R/bEF9m0lgtwSh1l4J0GIYp
 y51mpx0B4pZoQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
Date: Tue, 19 Apr 2022 18:37:40 +0200
Message-Id: <20220419163810.2118169-19-arnd@kernel.org>
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

The audio driver should not use a hardwired gpio number
from the header. Change it to use a lookup table.

Cc: Philipp Zabel <philipp.zabel@gmail.com>
Cc: Paul Parsons <lost.distance@yahoo.com>
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/hx4700-pcmcia.c             |  2 +-
 arch/arm/mach-pxa/hx4700.c                    | 16 ++++++++-
 arch/arm/mach-pxa/{include/mach => }/hx4700.h |  2 +-
 sound/soc/pxa/hx4700.c                        | 34 ++++++++-----------
 4 files changed, 31 insertions(+), 23 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/hx4700.h (99%)

diff --git a/arch/arm/mach-pxa/hx4700-pcmcia.c b/arch/arm/mach-pxa/hx4700-pcmcia.c
index e8acbfc9ef6c..e2331dfe427d 100644
--- a/arch/arm/mach-pxa/hx4700-pcmcia.c
+++ b/arch/arm/mach-pxa/hx4700-pcmcia.c
@@ -10,7 +10,7 @@
 #include <linux/irq.h>
 
 #include <asm/mach-types.h>
-#include <mach/hx4700.h>
+#include "hx4700.h"
 
 #include <pcmcia/soc_common.h>
 
diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
index 140a44cb2989..2b7f37172725 100644
--- a/arch/arm/mach-pxa/hx4700.c
+++ b/arch/arm/mach-pxa/hx4700.c
@@ -41,7 +41,7 @@
 
 #include "pxa27x.h"
 #include "addr-map.h"
-#include <mach/hx4700.h>
+#include "hx4700.h"
 #include <linux/platform_data/irda-pxaficp.h>
 
 #include <sound/ak4641.h>
@@ -834,6 +834,19 @@ static struct i2c_board_info i2c_board_info[] __initdata = {
 	},
 };
 
+static struct gpiod_lookup_table hx4700_audio_gpio_table = {
+	.dev_id = "hx4700-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
+			    "earphone-ndet", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", GPIO92_HX4700_HP_DRIVER,
+			    "hp-driver", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", GPIO107_HX4700_SPK_nSD,
+			    "spk-nsd", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct platform_device audio = {
 	.name	= "hx4700-audio",
 	.id	= -1,
@@ -895,6 +908,7 @@ static void __init hx4700_init(void)
 
 	gpiod_add_lookup_table(&bq24022_gpiod_table);
 	gpiod_add_lookup_table(&gpio_vbus_gpiod_table);
+	gpiod_add_lookup_table(&hx4700_audio_gpio_table);
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 	pwm_add_table(hx4700_pwm_lookup, ARRAY_SIZE(hx4700_pwm_lookup));
 
diff --git a/arch/arm/mach-pxa/include/mach/hx4700.h b/arch/arm/mach-pxa/hx4700.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/hx4700.h
rename to arch/arm/mach-pxa/hx4700.h
index 0c30e6d9c660..ce2db33989e1 100644
--- a/arch/arm/mach-pxa/include/mach/hx4700.h
+++ b/arch/arm/mach-pxa/hx4700.h
@@ -10,7 +10,7 @@
 
 #include <linux/gpio.h>
 #include <linux/mfd/asic3.h>
-#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
+#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */
 
 #define HX4700_ASIC3_GPIO_BASE	PXA_NR_BUILTIN_GPIO
 #define HX4700_EGPIO_BASE	(HX4700_ASIC3_GPIO_BASE + ASIC3_NUM_GPIOS)
diff --git a/sound/soc/pxa/hx4700.c b/sound/soc/pxa/hx4700.c
index 7334fac758de..e70dc38d9892 100644
--- a/sound/soc/pxa/hx4700.c
+++ b/sound/soc/pxa/hx4700.c
@@ -10,7 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/jack.h>
@@ -18,10 +18,10 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
-#include <mach/hx4700.h>
 #include <asm/mach-types.h>
 #include "pxa2xx-i2s.h"
 
+static struct gpio_desc *gpiod_hp_driver, *gpiod_spk_nsd;
 static struct snd_soc_jack hs_jack;
 
 /* Headphones jack detection DAPM pin */
@@ -40,9 +40,8 @@ static struct snd_soc_jack_pin hs_jack_pin[] = {
 
 /* Headphones jack detection GPIO */
 static struct snd_soc_jack_gpio hs_jack_gpio = {
-	.gpio		= GPIO75_HX4700_EARPHONE_nDET,
 	.invert		= true,
-	.name		= "hp-gpio",
+	.name		= "earphone-ndet",
 	.report		= SND_JACK_HEADPHONE,
 	.debounce_time	= 200,
 };
@@ -81,14 +80,14 @@ static const struct snd_soc_ops hx4700_ops = {
 static int hx4700_spk_power(struct snd_soc_dapm_widget *w,
 			    struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(GPIO107_HX4700_SPK_nSD, !!SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value(gpiod_spk_nsd, !!SND_SOC_DAPM_EVENT_ON(event));
 	return 0;
 }
 
 static int hx4700_hp_power(struct snd_soc_dapm_widget *w,
 			   struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(GPIO92_HX4700_HP_DRIVER, !!SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value(gpiod_hp_driver, !!SND_SOC_DAPM_EVENT_ON(event));
 	return 0;
 }
 
@@ -162,11 +161,6 @@ static struct snd_soc_card snd_soc_card_hx4700 = {
 	.fully_routed		= true,
 };
 
-static struct gpio hx4700_audio_gpios[] = {
-	{ GPIO107_HX4700_SPK_nSD, GPIOF_OUT_INIT_HIGH, "SPK_POWER" },
-	{ GPIO92_HX4700_HP_DRIVER, GPIOF_OUT_INIT_LOW, "EP_POWER" },
-};
-
 static int hx4700_audio_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -174,26 +168,26 @@ static int hx4700_audio_probe(struct platform_device *pdev)
 	if (!machine_is_h4700())
 		return -ENODEV;
 
-	ret = gpio_request_array(hx4700_audio_gpios,
-				ARRAY_SIZE(hx4700_audio_gpios));
+	gpiod_hp_driver = devm_gpiod_get(&pdev->dev, "hp-driver", GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(gpiod_hp_driver);
+	if (ret)
+		return ret;
+	gpiod_spk_nsd = devm_gpiod_get(&pdev->dev, "spk-nsd", GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(gpiod_spk_nsd);
 	if (ret)
 		return ret;
 
+	hs_jack_gpio.gpiod_dev = &pdev->dev;
 	snd_soc_card_hx4700.dev = &pdev->dev;
 	ret = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_hx4700);
-	if (ret)
-		gpio_free_array(hx4700_audio_gpios,
-				ARRAY_SIZE(hx4700_audio_gpios));
 
 	return ret;
 }
 
 static int hx4700_audio_remove(struct platform_device *pdev)
 {
-	gpio_set_value(GPIO92_HX4700_HP_DRIVER, 0);
-	gpio_set_value(GPIO107_HX4700_SPK_nSD, 0);
-
-	gpio_free_array(hx4700_audio_gpios, ARRAY_SIZE(hx4700_audio_gpios));
+	gpiod_set_value(gpiod_hp_driver, 0);
+	gpiod_set_value(gpiod_spk_nsd, 0);
 	return 0;
 }
 
-- 
2.29.2

