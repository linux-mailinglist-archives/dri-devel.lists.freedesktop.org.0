Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9057D83C6A4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 16:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15E110F906;
	Thu, 25 Jan 2024 15:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E638210F921
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:32:03 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 10732862B0;
 Thu, 25 Jan 2024 16:31:58 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Thu, 25 Jan 2024 16:30:56 +0100
Subject: [PATCH v5 4/4] backlight: Add Kinetic KTD2801 backlight support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240125-ktd2801-v5-4-e22da232a825@skole.hr>
References: <20240125-ktd2801-v5-0-e22da232a825@skole.hr>
In-Reply-To: <20240125-ktd2801-v5-0-e22da232a825@skole.hr>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6508;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=9oIB83pc/ZyTg66e328/z4fCGwof+pG+pI1cGESw4c0=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlsn7DzGjopG3zagxQdzO39RFkWfcgbL98E7cgE
 6mQxJ+xqCuJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZbJ+wwAKCRCaEZ6wQi2W
 4bK2EACrKqCjTzyf6knLrx0GBqRH1F4B3CAYyruA8cUQExJQWc5jI0nAF1hRrrfw3Z6OebH2Rmx
 mKQkFb9+2KL5Snf9cikzqHaIKj8ZyDhtUFqQKd4S0U8PRv+xWe8ieAb+rX/EoVnLZmDurNXTCnm
 vp/4PmXtd6swUY3Y0mge+QhwrBbmi3UQujerDHnDK+BoKnsTcdDFBqd20O+rFtsrXQeIqWIo8aY
 yhTHJCf1rvy3bTDg+s3jXxC9CRM7pyVhqpmfKSXnuvi24fobYkhMDB2EmiR0didy4CDlJavj3m+
 VvLZSlUyCMwlVy+eXj80A2KmsEf3RiaNZs7gxvaLjdTV8Z8+T3GEMa3/uPetlIApW4sEWiYKoDf
 ldHYX4m+Th2wIACdQbiDdclikspvaAGuzEluBgGT1DjeprvNfosTH5MRZLsN2Q0WIOYTh3suKPk
 HYLjnqaFZdYDkIkN0x4Pc8DQh5xLQ8Sl6OaRuajwDdy0hXLroFeLy0HSTpPiOW8UONZNA68XBCn
 wQadc/JfOJBQCgkwRiktmqAQgoUHsDufOpzWM+CpvI2HM7o9NpsMhRWd3gT8NuvMHjFTOfLGoue
 EvcvxhVf9phmwsSh1FErev7VBrRuTn1Lknu1sPpLD74CelV4mz3mwu4wcreCaPSvuxiCIQWHPBM
 7YZDuatn7GBvkhA==
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

KTD2801 is a LED backlight driver IC found in samsung,coreprimevelte.
The brightness can be set using PWM or the ExpressWire protocol. Add
support for the KTD2801.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 MAINTAINERS                                 |   6 ++
 drivers/video/backlight/Kconfig             |   7 ++
 drivers/video/backlight/Makefile            |   1 +
 drivers/video/backlight/ktd2801-backlight.c | 128 ++++++++++++++++++++++++++++
 4 files changed, 142 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1c83e0e837a..01cd1a460907 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12052,6 +12052,12 @@ S:	Maintained
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
index ea2d0d69bd8c..230bca07b09d 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -183,6 +183,13 @@ config BACKLIGHT_KTD253
 	  which is a 1-wire GPIO-controlled backlight found in some mobile
 	  phones.
 
+config BACKLIGHT_KTD2801
+	tristate "Backlight Driver for Kinetic KTD2801"
+	select LEDS_EXPRESSWIRE
+	help
+	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire
+	  GPIO-controlled backlight found in Samsung Galaxy Core Prime VE LTE.
+
 config BACKLIGHT_KTZ8866
 	tristate "Backlight Driver for Kinetic KTZ8866"
 	depends on I2C
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 06966cb20459..8d2cb252042d 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
 obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
 obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
 obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
+obj-$(CONFIG_BACKLIGHT_KTD2801)		+= ktd2801-backlight.o
 obj-$(CONFIG_BACKLIGHT_KTZ8866)		+= ktz8866.o
 obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
new file mode 100644
index 000000000000..c020acff40f1
--- /dev/null
+++ b/drivers/video/backlight/ktd2801-backlight.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Datasheet:
+ * https://www.kinet-ic.com/uploads/web/KTD2801/KTD2801-04b.pdf
+ */
+#include <linux/backlight.h>
+#include <linux/gpio/consumer.h>
+#include <linux/leds-expresswire.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#define KTD2801_DEFAULT_BRIGHTNESS	100
+#define KTD2801_MAX_BRIGHTNESS		255
+
+/* These values have been extracted from Samsung's driver. */
+const struct expresswire_timing ktd2801_timing = {
+	.poweroff_us = 2600,
+	.detect_delay_us = 150,
+	.detect_us = 270,
+	.data_start_us = 5,
+	.short_bitset_us = 5,
+	.long_bitset_us = 15,
+	.end_of_data_low_us = 10,
+	.end_of_data_high_us = 350
+};
+
+struct ktd2801_backlight {
+	struct expresswire_common_props props;
+	struct backlight_device *bd;
+	bool was_on;
+};
+
+static int ktd2801_update_status(struct backlight_device *bd)
+{
+	struct ktd2801_backlight *ktd2801 = bl_get_data(bd);
+	u8 brightness = (u8) backlight_get_brightness(bd);
+
+	if (backlight_is_blank(bd)) {
+		expresswire_power_off(&ktd2801->props);
+		ktd2801->was_on = false;
+		return 0;
+	}
+
+	if (!ktd2801->was_on) {
+		expresswire_enable(&ktd2801->props);
+		ktd2801->was_on = true;
+	}
+
+	expresswire_write_u8(&ktd2801->props, brightness);
+
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
+	ktd2801->was_on = true;
+	ktd2801->props.timing = ktd2801_timing;
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
+	ktd2801->props.ctrl_gpio = devm_gpiod_get(dev, "ctrl", GPIOD_OUT_HIGH);
+	if (IS_ERR(ktd2801->props.ctrl_gpio))
+		return dev_err_probe(dev, PTR_ERR(ktd2801->props.ctrl_gpio),
+				"failed to get backlight GPIO");
+	gpiod_set_consumer_name(ktd2801->props.ctrl_gpio, dev_name(dev));
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
+MODULE_IMPORT_NS(EXPRESSWIRE);
+MODULE_AUTHOR("Duje Mihanović <duje.mihanovic@skole.hr>");
+MODULE_DESCRIPTION("Kinetic KTD2801 Backlight Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


