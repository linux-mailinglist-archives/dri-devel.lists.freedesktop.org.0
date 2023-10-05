Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D587BAB30
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 22:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A060E10E4A6;
	Thu,  5 Oct 2023 20:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BB810E483
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 18:57:12 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 1A9D58635B;
 Thu,  5 Oct 2023 20:49:48 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Thu, 05 Oct 2023 20:49:09 +0200
Subject: [PATCH 2/2] backlight: Add Kinetic KTD2801 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231005-ktd2801-v1-2-43cd85b0629a@skole.hr>
References: <20231005-ktd2801-v1-0-43cd85b0629a@skole.hr>
In-Reply-To: <20231005-ktd2801-v1-0-43cd85b0629a@skole.hr>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6777;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=aBBnS1XZnXv76Hv6XBS+QCbv+h+s/Wh7qXIwLBioodk=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlHwVCHOlK47dVdMIuw8iHIb9VR7ioJlIpKVkcF
 sp+p1BaZv+JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZR8FQgAKCRCaEZ6wQi2W
 4Qb3D/9XJX34c37Ey93a56OrsyQXnw0RkbolK6On8eELGebAItBFIgAY00gXbAU/ktEcX9bJxQB
 NvqToszGEDBlwoBGBVULzIBaeUpeCgrIlxiJ3ULkG2MSNtEAuvp4g72OReHBKEo5V7eJzavze2j
 KL0uM1f1jwvNHZ3Hzu6f+FnduxmB024+6Tvb6NaWNhZAvTXPWHi3JHe/cHI7RbJP/AC33tTKgz0
 WxaEhoFiRLeZz9kaQpwnYKRb0eB1rk5GRoS6cWVeWVEv9NJEUpG7M7+JSsycQVzhD4tIUOF/f4b
 t9HXUHKJAs1FN4I/vkbdsq23RgBTZvmj3+76uc4mI+kZQkLD1ZAVksvMaX8OsJpHPkKzJ1zbmj+
 5TqQR4XxGUXcWvvas9PWx0C29jXghHpgt3dVpVvYquAb5PWXMWLMbUXKPhzZobMJK4KnO/j6MVt
 dLPmUTcL0Rkh5ysrZX0YWtcitawtRrscLOxvJy1uObdxqk8iT9ZdUgcH8hpfh6xMaOHEQ7kGCdI
 uKuGui2O4vc2rYlmWJ1ZTK8Pc16Y0l09LcHoz0GVEuwcnJSRLlpz269CS2if06s4MXucwSBMr84
 8hsUqmpz/9rT4Gtzl5vDls4e10ZZZWNEiXAiNhC76MR1r3vUc5JR2y9Qwo/yIFTcH1xD8OJPJ77
 dIVWNGgdPgmLfjA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Mailman-Approved-At: Thu, 05 Oct 2023 20:01:19 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add driver for the Kinetic KTD2801 backlight driver.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 MAINTAINERS                                 |   6 ++
 drivers/video/backlight/Kconfig             |   7 ++
 drivers/video/backlight/Makefile            |   1 +
 drivers/video/backlight/ktd2801-backlight.c | 151 ++++++++++++++++++++++++++++
 4 files changed, 165 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 35977b269d5e..7da78f06a65d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11777,6 +11777,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
 F:	drivers/video/backlight/ktd253-backlight.c
 
+KTD2801 BACKLIGHT DRIVER
+M:	Duje Mihanović <duje.mihanovic@skole.hr>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml
+F:	drivers/video/backlight/ktd2801-backlight.c
+
 KTEST
 M:	Steven Rostedt <rostedt@goodmis.org>
 M:	John Hawley <warthog9@eaglescrag.net>
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 51387b1ef012..a2b268293345 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -183,6 +183,13 @@ config BACKLIGHT_KTD253
 	  which is a 1-wire GPIO-controlled backlight found in some mobile
 	  phones.
 
+config BACKLIGHT_KTD2801
+	tristate "Backlight Driver for Kinetic KTD2801"
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire
+	  GPIO-controlled backlight found in Samsung Galaxy Core Prime VE LTE.
+
 config BACKLIGHT_KTZ8866
 	tristate "Backlight Driver for Kinetic KTZ8866"
 	depends on I2C
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index f72e1c3c59e9..b33b647f31ca 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
 obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
 obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
 obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
+obj-$(CONFIG_BACKLIGHT_KTD2801)		+= ktd2801-backlight.o
 obj-$(CONFIG_BACKLIGHT_KTZ8866)		+= ktz8866.o
 obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
new file mode 100644
index 000000000000..24a5f9e5d606
--- /dev/null
+++ b/drivers/video/backlight/ktd2801-backlight.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#define EW_DELAY	150
+#define EW_DET		270
+#define LOW_BIT_HIGH	5
+#define LOW_BIT_LOW	(4 * HIGH_BIT_LOW)
+#define HIGH_BIT_LOW	5
+#define HIGH_BIT_HIGH	(4 * HIGH_BIT_LOW)
+#define DS		5
+#define EOD_L		10
+#define EOD_H		350
+#define PWR_DOWN_DELAY	2600
+
+#define KTD2801_DEFAULT_BRIGHTNESS	100
+#define KTD2801_MAX_BRIGHTNESS		255
+
+struct ktd2801_backlight {
+	struct device *dev;
+	struct backlight_device *bd;
+	struct gpio_desc *desc;
+	bool was_on;
+};
+
+static int ktd2801_update_status(struct backlight_device *bd)
+{
+	struct ktd2801_backlight *ktd2801 = bl_get_data(bd);
+	u8 brightness = (u8) backlight_get_brightness(bd);
+
+	if (backlight_is_blank(bd)) {
+		gpiod_set_value(ktd2801->desc, 1);
+		udelay(PWR_DOWN_DELAY);
+		ktd2801->was_on = false;
+		return 0;
+	}
+
+	if (!ktd2801->was_on) {
+		gpiod_set_value(ktd2801->desc, 0);
+		udelay(EW_DELAY);
+		gpiod_set_value(ktd2801->desc, 1);
+		udelay(EW_DET);
+		gpiod_set_value(ktd2801->desc, 0);
+		ktd2801->was_on = true;
+	}
+
+	gpiod_set_value(ktd2801->desc, 0);
+	udelay(DS);
+
+	for (int i = 0; i < 8; i++) {
+		u8 next_bit = (brightness & 0x80) >> 7;
+
+		if (!next_bit) {
+			gpiod_set_value(ktd2801->desc, 1);
+			udelay(LOW_BIT_LOW);
+			gpiod_set_value(ktd2801->desc, 0);
+			udelay(LOW_BIT_HIGH);
+		} else {
+			gpiod_set_value(ktd2801->desc, 1);
+			udelay(HIGH_BIT_LOW);
+			gpiod_set_value(ktd2801->desc, 0);
+			udelay(HIGH_BIT_HIGH);
+		}
+		brightness <<= 1;
+	}
+	gpiod_set_value(ktd2801->desc, 1);
+	udelay(EOD_L);
+	gpiod_set_value(ktd2801->desc, 0);
+	udelay(EOD_H);
+	return 0;
+}
+
+static const struct backlight_ops ktd2801_backlight_ops = {
+	.update_status = ktd2801_update_status,
+};
+
+static int ktd2801_backlight_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct backlight_device *bd;
+	struct ktd2801_backlight *ktd2801;
+	u32 brightness, max_brightness;
+	int ret;
+
+	ktd2801 = devm_kzalloc(dev, sizeof(*ktd2801), GFP_KERNEL);
+	if (!ktd2801)
+		return -ENOMEM;
+	ktd2801->dev = dev;
+	ktd2801->was_on = true;
+
+	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
+	if (ret)
+		max_brightness = KTD2801_MAX_BRIGHTNESS;
+	if (max_brightness > KTD2801_MAX_BRIGHTNESS) {
+		dev_err(dev, "illegal max brightness specified\n");
+		max_brightness = KTD2801_MAX_BRIGHTNESS;
+	}
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = KTD2801_DEFAULT_BRIGHTNESS;
+	if (brightness > max_brightness) {
+		dev_err(dev, "default brightness exceeds max\n");
+		brightness = max_brightness;
+	}
+
+	ktd2801->desc = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(ktd2801->desc))
+		return dev_err_probe(dev, PTR_ERR(ktd2801->desc),
+				"failed to get backlight GPIO");
+	gpiod_set_consumer_name(ktd2801->desc, dev_name(dev));
+
+	bd = devm_backlight_device_register(dev, dev_name(dev), dev, ktd2801,
+			&ktd2801_backlight_ops, NULL);
+	if (IS_ERR(bd))
+		return dev_err_probe(dev, PTR_ERR(bd),
+				"failed to register backlight");
+
+	bd->props.max_brightness = max_brightness;
+	bd->props.brightness = brightness;
+
+	ktd2801->bd = bd;
+	platform_set_drvdata(pdev, bd);
+	backlight_update_status(bd);
+
+	return 0;
+}
+
+static const struct of_device_id ktd2801_of_match[] = {
+	{ .compatible = "kinetic,ktd2801" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ktd2801_of_match);
+
+static struct platform_driver ktd2801_backlight_driver = {
+	.driver = {
+		.name = "ktd2801-backlight",
+		.of_match_table = ktd2801_of_match,
+	},
+	.probe = ktd2801_backlight_probe,
+};
+module_platform_driver(ktd2801_backlight_driver);
+
+MODULE_AUTHOR("Duje Mihanović <duje.mihanovic@skole.hr>");
+MODULE_DESCRIPTION("Kinetic KTD2801 Backlight Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ktd2801-backlight");

-- 
2.42.0


