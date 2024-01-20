Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C383367D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 22:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C796910E37E;
	Sat, 20 Jan 2024 21:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E438510E378
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 21:27:31 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id A0CFC86C5A;
 Sat, 20 Jan 2024 22:27:25 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Sat, 20 Jan 2024 22:26:43 +0100
Subject: [PATCH v3 1/3] leds: ktd2692: move ExpressWire code to library
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240120-ktd2801-v3-1-fe2cbafffb21@skole.hr>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
In-Reply-To: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=12703;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=C2X6yo7wrv17sg0OzEddeEO2QFSrulIh4ctqk9FgHBk=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlrDqXnBK/SVXS3c7VYyUHJuvmOZyaLHL444j7W
 LzCnp7hlZ+JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZaw6lwAKCRCaEZ6wQi2W
 4Rr3EACSyEfoq6tb3P0aKem/BEQopy73sC2cDOogwFss3JVhoaqisMb4Q76eqh705BKgOW1wfr9
 oOdtWd1tKP3zwfWi4ZZGZXptnsElWbS0rG9uJ5QflS++q5SmJLWxsZrt0faTpLUg2oKJDAFw8T5
 dpdHA1PerN0+Z1mm96EHjGWybmYbBk5qftY7bhyv3RF6RYxr3a2vtguFQtxD/0z0WK80QyeFyNa
 JlP+cPAR6poNxa17ZG00plPzTWYPTPYPKOHJ2LYdij6astRUJqYjZCTkrt+1RhO37xrdvkIwQFG
 M2xG6Zx1Rx5JpEesjMzfAf+LV74KifoxdqiQMJTH9rkbJalC9Z/u/LyugnBc6okBFZS8qf9pPSp
 9+48+EL7rAlNIPhto3zBpz24vJD0vP3CmXtjT8Olq315ZbtPoSfXFccaAHpU/1C1+3v6SnPGlHL
 k+YZUU4d6s4mmtqG1gifV+t4dUpTxB648bYBpQ9APQvn8nwxmv6T3u0g7CdGIWZRJ7SpA/p6tyM
 PsoH/2cU5j1CjyykyKQ95Qu7uSx7w+FPeOdCcpwOa718ogSplYBguyys1Mlh+yHo9/bkcYalULK
 d1BHJg+nYZ0aoKObOdjMPzTuWfP1AL08ZyLrNG9Eyw4oTyfhLqWESYP7L5djzqT6ygz6PBPdr1V
 NIbkT0aYxxUb9zA==
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

The ExpressWire protocol is shared between at least KTD2692 and KTD2801
with slight differences such as timings and the former not having a
defined set of pulses for enabling the protocol (possibly because it
does not support PWM unlike KTD2801). Despite these differences the
ExpressWire handling code can be shared between the two, so move it into
a library in preparation for adding KTD2801 support.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 MAINTAINERS                       |  7 +++
 drivers/leds/Kconfig              |  3 ++
 drivers/leds/Makefile             |  3 ++
 drivers/leds/flash/Kconfig        |  1 +
 drivers/leds/flash/leds-ktd2692.c | 91 +++++++++++----------------------------
 drivers/leds/leds-expresswire.c   | 59 +++++++++++++++++++++++++
 include/linux/leds-expresswire.h  | 35 +++++++++++++++
 7 files changed, 132 insertions(+), 67 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7c4cf8201e0..87b12d2448a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7902,6 +7902,13 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
 F:	fs/exfat/
 
+EXPRESSWIRE PROTOCOL LIBRARY
+M:	Duje Mihanović <duje.mihanovic@skole.hr>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	drivers/leds/leds-expresswire.c
+F:	include/linux/leds-expresswire.h
+
 EXT2 FILE SYSTEM
 M:	Jan Kara <jack@suse.com>
 L:	linux-ext4@vger.kernel.org
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6292fddcc55c..d29b6823e7d1 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -181,6 +181,9 @@ config LEDS_EL15203000
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-el15203000.
 
+config LEDS_EXPRESSWIRE
+	bool
+
 config LEDS_TURRIS_OMNIA
 	tristate "LED support for CZ.NIC's Turris Omnia"
 	depends on LEDS_CLASS_MULTICOLOR
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d7348e8bc019..a63a07d01c6f 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -89,6 +89,9 @@ obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
 
+# Kinetic ExpressWire Protocol
+obj-$(CONFIG_LEDS_EXPRESSWIRE)		+= leds-expresswire.o
+
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 4e08dbc05709..526c1d063cd8 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -24,6 +24,7 @@ config LEDS_KTD2692
 	tristate "LED support for Kinetic KTD2692 flash LED controller"
 	depends on OF
 	depends on GPIOLIB || COMPILE_TEST
+	select LEDS_EXPRESSWIRE
 	help
 	  This option enables support for Kinetic KTD2692 LED flash connected
 	  through ExpressWire interface.
diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 598eee5daa52..8c17de3d621f 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
+#include <linux/leds-expresswire.h>
 #include <linux/led-class-flash.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -48,11 +49,6 @@
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
@@ -71,7 +67,19 @@ struct ktd2692_led_config_data {
 	enum led_brightness max_brightness;
 };
 
+const struct expresswire_timing ktd2692_timing = {
+	.poweroff_us = KTD2692_TIME_RESET_US,
+	.data_start_us = KTD2692_TIME_DATA_START_TIME_US,
+	.end_of_data_low_us = KTD2692_TIME_LOW_END_OF_DATA_US,
+	.end_of_data_high_us = KTD2692_TIME_HIGH_END_OF_DATA_US,
+	.short_bitset_us = KTD2692_TIME_SHORT_BITSET_US,
+	.long_bitset_us = KTD2692_TIME_LONG_BITSET_US
+};
+
 struct ktd2692_context {
+	/* Common ExpressWire properties (ctrl GPIO and timing) */
+	struct expresswire_common_props props;
+
 	/* Related LED Flash class device */
 	struct led_classdev_flash fled_cdev;
 
@@ -80,7 +88,6 @@ struct ktd2692_context {
 	struct regulator *regulator;
 
 	struct gpio_desc *aux_gpio;
-	struct gpio_desc *ctrl_gpio;
 
 	enum ktd2692_led_mode mode;
 	enum led_brightness torch_brightness;
@@ -92,65 +99,14 @@ static struct ktd2692_context *fled_cdev_to_led(
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
 static void ktd2692_expresswire_write(struct ktd2692_context *led, u8 value)
 {
 	int i;
 
-	ktd2692_expresswire_start(led);
+	expresswire_start(&led->props);
 	for (i = 7; i >= 0; i--)
-		ktd2692_expresswire_set_bit(led, value & BIT(i));
-	ktd2692_expresswire_end(led);
+		expresswire_set_bit(&led->props, value & BIT(i));
+	expresswire_end(&led->props);
 }
 
 static int ktd2692_led_brightness_set(struct led_classdev *led_cdev,
@@ -163,7 +119,7 @@ static int ktd2692_led_brightness_set(struct led_classdev *led_cdev,
 
 	if (brightness == LED_OFF) {
 		led->mode = KTD2692_MODE_DISABLE;
-		gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
+		gpiod_direction_output(led->aux_gpio, 0);
 	} else {
 		ktd2692_expresswire_write(led, brightness |
 					KTD2692_REG_MOVIE_CURRENT_BASE);
@@ -191,10 +147,10 @@ static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 				| KTD2692_REG_FLASH_TIMEOUT_BASE);
 
 		led->mode = KTD2692_MODE_FLASH;
-		gpiod_direction_output(led->aux_gpio, KTD2692_HIGH);
+		gpiod_direction_output(led->aux_gpio, 1);
 	} else {
 		led->mode = KTD2692_MODE_DISABLE;
-		gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
+		gpiod_direction_output(led->aux_gpio, 0);
 	}
 
 	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
@@ -247,8 +203,8 @@ static void ktd2692_init_flash_timeout(struct led_classdev_flash *fled_cdev,
 static void ktd2692_setup(struct ktd2692_context *led)
 {
 	led->mode = KTD2692_MODE_DISABLE;
-	ktd2692_expresswire_reset(led);
-	gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
+	expresswire_power_off(&led->props);
+	gpiod_direction_output(led->aux_gpio, 0);
 
 	ktd2692_expresswire_write(led, (KTD2692_MM_MIN_CURR_THRESHOLD_SCALE - 1)
 				 | KTD2692_REG_MM_MIN_CURR_THRESHOLD_BASE);
@@ -277,8 +233,8 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 	if (!np)
 		return -ENXIO;
 
-	led->ctrl_gpio = devm_gpiod_get(dev, "ctrl", GPIOD_ASIS);
-	ret = PTR_ERR_OR_ZERO(led->ctrl_gpio);
+	led->props.ctrl_gpio = devm_gpiod_get(dev, "ctrl", GPIOD_ASIS);
+	ret = PTR_ERR_OR_ZERO(led->props.ctrl_gpio);
 	if (ret)
 		return dev_err_probe(dev, ret, "cannot get ctrl-gpios\n");
 
@@ -412,6 +368,7 @@ static struct platform_driver ktd2692_driver = {
 
 module_platform_driver(ktd2692_driver);
 
+MODULE_IMPORT_NS(EXPRESSWIRE);
 MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
 MODULE_DESCRIPTION("Kinetic KTD2692 LED driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/leds/leds-expresswire.c b/drivers/leds/leds-expresswire.c
new file mode 100644
index 000000000000..88e76c968cf0
--- /dev/null
+++ b/drivers/leds/leds-expresswire.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Shared library for Kinetic's ExpressWire protocol.
+ * This protocol works by pulsing the ExpressWire IC's control GPIO.
+ * ktd2692 and ktd2801 are known to use this protocol.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/leds-expresswire.h>
+
+void expresswire_power_off(struct expresswire_common_props *props)
+{
+	gpiod_set_value_cansleep(props->ctrl_gpio, 0);
+	usleep_range(props->timing.poweroff_us, props->timing.poweroff_us * 2);
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_power_off, EXPRESSWIRE);
+
+void expresswire_enable(struct expresswire_common_props *props)
+{
+	gpiod_set_value(props->ctrl_gpio, 1);
+	udelay(props->timing.detect_delay_us);
+	gpiod_set_value(props->ctrl_gpio, 0);
+	udelay(props->timing.detect_us);
+	gpiod_set_value(props->ctrl_gpio, 1);
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_enable, EXPRESSWIRE);
+
+void expresswire_start(struct expresswire_common_props *props)
+{
+	gpiod_set_value(props->ctrl_gpio, 1);
+	udelay(props->timing.data_start_us);
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_start, EXPRESSWIRE);
+
+void expresswire_end(struct expresswire_common_props *props)
+{
+	gpiod_set_value(props->ctrl_gpio, 0);
+	udelay(props->timing.end_of_data_low_us);
+	gpiod_set_value(props->ctrl_gpio, 1);
+	udelay(props->timing.end_of_data_high_us);
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_end, EXPRESSWIRE);
+
+void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
+{
+	if (bit) {
+		gpiod_set_value(props->ctrl_gpio, 0);
+		udelay(props->timing.short_bitset_us);
+		gpiod_set_value(props->ctrl_gpio, 1);
+		udelay(props->timing.long_bitset_us);
+	} else {
+		gpiod_set_value(props->ctrl_gpio, 0);
+		udelay(props->timing.long_bitset_us);
+		gpiod_set_value(props->ctrl_gpio, 1);
+		udelay(props->timing.short_bitset_us);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(expresswire_set_bit, EXPRESSWIRE);
diff --git a/include/linux/leds-expresswire.h b/include/linux/leds-expresswire.h
new file mode 100644
index 000000000000..b5aad0556cb8
--- /dev/null
+++ b/include/linux/leds-expresswire.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Shared library for Kinetic's ExpressWire protocol.
+ * This protocol works by pulsing the ExpressWire IC's control GPIO.
+ * ktd2692 and ktd2801 are known to use this protocol.
+ */
+
+#ifndef _LEDS_EXPRESSWIRE_H
+#define _LEDS_EXPRESSWIRE_H
+
+#include <linux/gpio/consumer.h>
+
+struct expresswire_timing {
+	unsigned long poweroff_us;
+	unsigned long detect_delay_us;
+	unsigned long detect_us;
+	unsigned long data_start_us;
+	unsigned long end_of_data_low_us;
+	unsigned long end_of_data_high_us;
+	unsigned long short_bitset_us;
+	unsigned long long_bitset_us;
+};
+
+struct expresswire_common_props {
+	struct gpio_desc *ctrl_gpio;
+	struct expresswire_timing timing;
+};
+
+extern void expresswire_power_off(struct expresswire_common_props *props);
+extern void expresswire_enable(struct expresswire_common_props *props);
+extern void expresswire_start(struct expresswire_common_props *props);
+extern void expresswire_end(struct expresswire_common_props *props);
+extern void expresswire_set_bit(struct expresswire_common_props *props, bool bit);
+
+#endif /* _LEDS_EXPRESSWIRE_H */

-- 
2.43.0


