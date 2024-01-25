Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52E383C6AD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 16:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A0310E4F6;
	Thu, 25 Jan 2024 15:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A6B10F929
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:32:03 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id D76F2861FB;
 Thu, 25 Jan 2024 16:31:56 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Thu, 25 Jan 2024 16:30:54 +0100
Subject: [PATCH v5 2/4] leds: ktd2692: convert to use ExpressWire library
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240125-ktd2801-v5-2-e22da232a825@skole.hr>
References: <20240125-ktd2801-v5-0-e22da232a825@skole.hr>
In-Reply-To: <20240125-ktd2801-v5-0-e22da232a825@skole.hr>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8331;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=kkFVHvkdEMlrMk1Pdy+6LMKQ0RaGip86dJw2W639SpM=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlsn7DcNYwR3737nbubVZ5v4DHUMslfShveGUby
 bSzzVmaHxKJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZbJ+wwAKCRCaEZ6wQi2W
 4d9vD/wKATHZFjiz5XDYltCyAjq3JP0ZArksF5gCQFZJnV2b2zNZPXIdBQzpCNTihu2+s9qj6yx
 YX5OMTeq8AbxFzClh1gwjm+tLAixju0eg2HoEUYj1bbkI7CMxI6kL3EmWTX/dLG8rawn8LHHXJT
 eBViVHcnu8Tuz/eOG0BPOHif4SWe/s+cSBcCRAwfgCpW3X1YZM4cCK56UhNWI58Pu8syY3mW/RN
 /BDUlImfOwSCsQ1SuZvzPiNJKOi3BIgLoipHWGUfDvIpg8HD2Jj4ZMwTN5E1WAGLPqTErhD3qeP
 oT0C6woUjhSloUMxZBGFVY0D0zcRerVd09bkzOb3CNGk/EhCMnqJgSz2VMsZcue+1FGS8EnbDhu
 1yQ6jVCOnP92QAkm5njSgphVPVOLLiykIwaxDb7P89tq2e1ED0iF/xix4h/Zw1Bk6+ej5unzwwl
 Jq++acESBlXtQ47kpC1UdmnKLCR/S6v1ZbcMfHQl697lBrv2bEKrh3x4jkGX9dR+iwLBIQPz/Se
 +VOeLXsg13GcPDdNaMGR+5D1pDTgXQWjPDyoAZJQI82aF3Tjh2mEzu6LX3e6dKmjL/IElz9f2D5
 tYgN2DDP91d161ruoDnErbCOZjoZDfs8Re4O3REc8gMvUD6pL3hLN+4mEt4+IdMOHRwbvpdUCHU
 HPUgvQGl1xPE6hA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The KTD2692 uses the ExpressWire protocol implemented in the newly
introduced ExpressWire library. Convert the driver to use the library.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/leds/flash/Kconfig        |   2 +-
 drivers/leds/flash/leds-ktd2692.c | 116 +++++++++-----------------------------
 2 files changed, 28 insertions(+), 90 deletions(-)

diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 4e08dbc05709..a0fb755b58dc 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -23,7 +23,7 @@ config LEDS_AS3645A
 config LEDS_KTD2692
 	tristate "LED support for Kinetic KTD2692 flash LED controller"
 	depends on OF
-	depends on GPIOLIB || COMPILE_TEST
+	select LEDS_EXPRESSWIRE
 	help
 	  This option enables support for Kinetic KTD2692 LED flash connected
 	  through ExpressWire interface.
diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 598eee5daa52..7bb0aa2753e3 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -6,9 +6,9 @@
  * Ingi Kim <ingi2.kim@samsung.com>
  */
 
-#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
+#include <linux/leds-expresswire.h>
 #include <linux/led-class-flash.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -37,22 +37,9 @@
 #define KTD2692_REG_FLASH_CURRENT_BASE		0x80
 #define KTD2692_REG_MODE_BASE			0xA0
 
-/* Set bit coding time for expresswire interface */
-#define KTD2692_TIME_RESET_US			700
-#define KTD2692_TIME_DATA_START_TIME_US		10
-#define KTD2692_TIME_HIGH_END_OF_DATA_US	350
-#define KTD2692_TIME_LOW_END_OF_DATA_US		10
-#define KTD2692_TIME_SHORT_BITSET_US		4
-#define KTD2692_TIME_LONG_BITSET_US		12
-
 /* KTD2692 default length of name */
 #define KTD2692_NAME_LENGTH			20
 
-enum ktd2692_bitset {
-	KTD2692_LOW = 0,
-	KTD2692_HIGH,
-};
-
 /* Movie / Flash Mode Control */
 enum ktd2692_led_mode {
 	KTD2692_MODE_DISABLE = 0,	/* default */
@@ -71,7 +58,19 @@ struct ktd2692_led_config_data {
 	enum led_brightness max_brightness;
 };
 
+const struct expresswire_timing ktd2692_timing = {
+	.poweroff_us = 700,
+	.data_start_us = 10,
+	.end_of_data_low_us = 10,
+	.end_of_data_high_us = 350,
+	.short_bitset_us = 4,
+	.long_bitset_us = 12
+};
+
 struct ktd2692_context {
+	/* Common ExpressWire properties (ctrl GPIO and timing) */
+	struct expresswire_common_props props;
+
 	/* Related LED Flash class device */
 	struct led_classdev_flash fled_cdev;
 
@@ -80,7 +79,6 @@ struct ktd2692_context {
 	struct regulator *regulator;
 
 	struct gpio_desc *aux_gpio;
-	struct gpio_desc *ctrl_gpio;
 
 	enum ktd2692_led_mode mode;
 	enum led_brightness torch_brightness;
@@ -92,67 +90,6 @@ static struct ktd2692_context *fled_cdev_to_led(
 	return container_of(fled_cdev, struct ktd2692_context, fled_cdev);
 }
 
-static void ktd2692_expresswire_start(struct ktd2692_context *led)
-{
-	gpiod_direction_output(led->ctrl_gpio, KTD2692_HIGH);
-	udelay(KTD2692_TIME_DATA_START_TIME_US);
-}
-
-static void ktd2692_expresswire_reset(struct ktd2692_context *led)
-{
-	gpiod_direction_output(led->ctrl_gpio, KTD2692_LOW);
-	udelay(KTD2692_TIME_RESET_US);
-}
-
-static void ktd2692_expresswire_end(struct ktd2692_context *led)
-{
-	gpiod_direction_output(led->ctrl_gpio, KTD2692_LOW);
-	udelay(KTD2692_TIME_LOW_END_OF_DATA_US);
-	gpiod_direction_output(led->ctrl_gpio, KTD2692_HIGH);
-	udelay(KTD2692_TIME_HIGH_END_OF_DATA_US);
-}
-
-static void ktd2692_expresswire_set_bit(struct ktd2692_context *led, bool bit)
-{
-	/*
-	 * The Low Bit(0) and High Bit(1) is based on a time detection
-	 * algorithm between time low and time high
-	 * Time_(L_LB) : Low time of the Low Bit(0)
-	 * Time_(H_LB) : High time of the LOW Bit(0)
-	 * Time_(L_HB) : Low time of the High Bit(1)
-	 * Time_(H_HB) : High time of the High Bit(1)
-	 *
-	 * It can be simplified to:
-	 * Low Bit(0) : 2 * Time_(H_LB) < Time_(L_LB)
-	 * High Bit(1) : 2 * Time_(L_HB) < Time_(H_HB)
-	 * HIGH  ___           ____    _..     _________    ___
-	 *          |_________|    |_..  |____|         |__|
-	 * LOW        <L_LB>  <H_LB>     <L_HB>  <H_HB>
-	 *          [  Low Bit (0) ]     [  High Bit(1) ]
-	 */
-	if (bit) {
-		gpiod_direction_output(led->ctrl_gpio, KTD2692_LOW);
-		udelay(KTD2692_TIME_SHORT_BITSET_US);
-		gpiod_direction_output(led->ctrl_gpio, KTD2692_HIGH);
-		udelay(KTD2692_TIME_LONG_BITSET_US);
-	} else {
-		gpiod_direction_output(led->ctrl_gpio, KTD2692_LOW);
-		udelay(KTD2692_TIME_LONG_BITSET_US);
-		gpiod_direction_output(led->ctrl_gpio, KTD2692_HIGH);
-		udelay(KTD2692_TIME_SHORT_BITSET_US);
-	}
-}
-
-static void ktd2692_expresswire_write(struct ktd2692_context *led, u8 value)
-{
-	int i;
-
-	ktd2692_expresswire_start(led);
-	for (i = 7; i >= 0; i--)
-		ktd2692_expresswire_set_bit(led, value & BIT(i));
-	ktd2692_expresswire_end(led);
-}
-
 static int ktd2692_led_brightness_set(struct led_classdev *led_cdev,
 				       enum led_brightness brightness)
 {
@@ -163,14 +100,14 @@ static int ktd2692_led_brightness_set(struct led_classdev *led_cdev,
 
 	if (brightness == LED_OFF) {
 		led->mode = KTD2692_MODE_DISABLE;
-		gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
+		gpiod_direction_output(led->aux_gpio, 0);
 	} else {
-		ktd2692_expresswire_write(led, brightness |
+		expresswire_write_u8(&led->props, brightness |
 					KTD2692_REG_MOVIE_CURRENT_BASE);
 		led->mode = KTD2692_MODE_MOVIE;
 	}
 
-	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
+	expresswire_write_u8(&led->props, led->mode | KTD2692_REG_MODE_BASE);
 	mutex_unlock(&led->lock);
 
 	return 0;
@@ -187,17 +124,17 @@ static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 
 	if (state) {
 		flash_tm_reg = GET_TIMEOUT_OFFSET(timeout->val, timeout->step);
-		ktd2692_expresswire_write(led, flash_tm_reg
+		expresswire_write_u8(&led->props, flash_tm_reg
 				| KTD2692_REG_FLASH_TIMEOUT_BASE);
 
 		led->mode = KTD2692_MODE_FLASH;
-		gpiod_direction_output(led->aux_gpio, KTD2692_HIGH);
+		gpiod_direction_output(led->aux_gpio, 1);
 	} else {
 		led->mode = KTD2692_MODE_DISABLE;
-		gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
+		gpiod_direction_output(led->aux_gpio, 0);
 	}
 
-	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
+	expresswire_write_u8(&led->props, led->mode | KTD2692_REG_MODE_BASE);
 
 	fled_cdev->led_cdev.brightness = LED_OFF;
 	led->mode = KTD2692_MODE_DISABLE;
@@ -247,12 +184,12 @@ static void ktd2692_init_flash_timeout(struct led_classdev_flash *fled_cdev,
 static void ktd2692_setup(struct ktd2692_context *led)
 {
 	led->mode = KTD2692_MODE_DISABLE;
-	ktd2692_expresswire_reset(led);
-	gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
+	expresswire_power_off(&led->props);
+	gpiod_direction_output(led->aux_gpio, 0);
 
-	ktd2692_expresswire_write(led, (KTD2692_MM_MIN_CURR_THRESHOLD_SCALE - 1)
+	expresswire_write_u8(&led->props, (KTD2692_MM_MIN_CURR_THRESHOLD_SCALE - 1)
 				 | KTD2692_REG_MM_MIN_CURR_THRESHOLD_BASE);
-	ktd2692_expresswire_write(led, KTD2692_FLASH_MODE_CURR_PERCENT(45)
+	expresswire_write_u8(&led->props, KTD2692_FLASH_MODE_CURR_PERCENT(45)
 				 | KTD2692_REG_FLASH_CURRENT_BASE);
 }
 
@@ -277,8 +214,8 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 	if (!np)
 		return -ENXIO;
 
-	led->ctrl_gpio = devm_gpiod_get(dev, "ctrl", GPIOD_ASIS);
-	ret = PTR_ERR_OR_ZERO(led->ctrl_gpio);
+	led->props.ctrl_gpio = devm_gpiod_get(dev, "ctrl", GPIOD_ASIS);
+	ret = PTR_ERR_OR_ZERO(led->props.ctrl_gpio);
 	if (ret)
 		return dev_err_probe(dev, ret, "cannot get ctrl-gpios\n");
 
@@ -412,6 +349,7 @@ static struct platform_driver ktd2692_driver = {
 
 module_platform_driver(ktd2692_driver);
 
+MODULE_IMPORT_NS(EXPRESSWIRE);
 MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
 MODULE_DESCRIPTION("Kinetic KTD2692 LED driver");
 MODULE_LICENSE("GPL v2");

-- 
2.43.0


