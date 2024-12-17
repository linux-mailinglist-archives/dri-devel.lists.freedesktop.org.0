Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C50AC9F4CBA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 14:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25910E227;
	Tue, 17 Dec 2024 13:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="gNtOATAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2024 13:47:20 UTC
Received: from mta-65-226.siemens.flowmailer.net
 (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0537E10E227
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 13:47:20 +0000 (UTC)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id
 20241217133716f9995a34c08381a93b
 for <dri-devel@lists.freedesktop.org>;
 Tue, 17 Dec 2024 14:37:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=bkaxCQ1VvrATV0IoWG6hYfk3L75ihaQK7/Cv5ACeB8o=;
 b=gNtOATACwkUPXyRvqU3zKj5J/RTPS33/NLaiOmlm0uf2dTLgNjW9Cwqx9PPtZVIAz1AlhB
 YOrBvXEyv7hQztMr3ddRUlzysq+tD3R3ta/hMFLsKfKv8SJbPw2PDwf0yPFwj3ru7UEmS2c2
 hKnTkTkgYwrslbaiqlHzbk6KzHGBoWrzLb6LR4MupG3cQt3dslD1rRikgAzbDLeB6V/iH3eR
 lKh3yIlLOXHxIUPBeWPuvkiGWqU9ANeZZmMSzo03opMSxTOkfLNjUBsDDm7vrw+F57QBDhBf
 4r2r1OvT+QbY4TNO6tPii0s5YsrK1+BQZEBZvls7yT4bRMAZElt0TPjg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v4 2/2] leds: lp8864: New driver
Date: Tue, 17 Dec 2024 14:37:10 +0100
Message-ID: <20241217133713.326853-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20241217133713.326853-1-alexander.sverdlin@siemens.com>
References: <20241217133713.326853-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add driver for TI LP8864, LP8864S, LP8866 4/6 channel LED-backlight drivers
with I2C interface.

Link: https://www.ti.com/lit/gpn/lp8864-q1
Link: https://www.ti.com/lit/gpn/lp8864s-q1
Link: https://www.ti.com/lit/gpn/lp8866-q1
Link: https://www.ti.com/lit/gpn/lp8866s-q1
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v4:
- better separated comments from register defines
- removed NULL from fault text arrays for two regs with odd-even structure
- changed HW fault printf from errors to warnings
- renamed "buf" -> "val"
- reflowed the code with up to 100 symbols per line
- added comments for 8<->16-bit linear scaling in set/get callbacks
- removed register names from error messages
v3:
- dropped lp8864_init(), REGCACHE_NONE, %pe in dev_err_probe(),
  i2c_set_clientdata()
- added devm_add_action_or_reset() return value check, dev_err_probe() after
  devm_regmap_init_i2c()
v2: no changes

 MAINTAINERS                |   7 +
 drivers/leds/Kconfig       |  12 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-lp8864.c | 296 +++++++++++++++++++++++++++++++++++++
 4 files changed, 316 insertions(+)
 create mode 100644 drivers/leds/leds-lp8864.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b332995b3350..d4268a3bbc5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23322,6 +23322,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
+TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
+M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
+F:	drivers/leds/leds-lp8864.c
+
 TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
 M:	Nishanth Menon <nm@ti.com>
 M:	Tero Kristo <kristo@kernel.org>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 3bf51a4e01d7..5dde8f46100c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -513,6 +513,18 @@ config LEDS_LP8860
 	  on the LP8860 4 channel LED driver using the I2C communication
 	  bus.
 
+config LEDS_LP8864
+	tristate "LED support for the TI LP8864/LP8866 4/6 channel LED drivers"
+	depends on LEDS_CLASS && I2C && OF
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for the TI LP8864-Q1,
+	  LP8864S-Q1, LP8866-Q1, LP8866S-Q1 4/6 channel LED backlight
+	  drivers with I2C interface.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called leds-lp8864.
+
 config LEDS_CLEVO_MAIL
 	tristate "Mail LED on Clevo notebook"
 	depends on LEDS_CLASS && BROKEN
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index e7982938ddc1..8a2caa48343b 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
 obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
 obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
+obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
diff --git a/drivers/leds/leds-lp8864.c b/drivers/leds/leds-lp8864.c
new file mode 100644
index 000000000000..9ee9e5e0df3c
--- /dev/null
+++ b/drivers/leds/leds-lp8864.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TI LP8864/LP8866 4/6 Channel LED Driver
+ *
+ * Copyright (C) 2024 Siemens AG
+ *
+ * Based on LP8860 driver by Dan Murphy <dmurphy@ti.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#define LP8864_BRT_CONTROL		0x00
+#define LP8864_USER_CONFIG1		0x04
+#define   LP8864_BRT_MODE_MASK		GENMASK(9, 8)
+#define   LP8864_BRT_MODE_REG		BIT(9)		/* Brightness control by DISPLAY_BRT reg */
+#define LP8864_SUPPLY_STATUS		0x0e
+#define LP8864_BOOST_STATUS		0x10
+#define LP8864_LED_STATUS		0x12
+#define   LP8864_LED_STATUS_WR_MASK	GENMASK(14, 9	/* Writeable bits in the LED_STATUS reg */
+
+/* Textual meaning for status bits, starting from bit 1 */
+static const char *const lp8864_supply_status_msg[] = {
+	"Vin under-voltage fault",
+	"Vin over-voltage fault",
+	"Vdd under-voltage fault",
+	"Vin over-current fault",
+	"Missing charge pump fault",
+	"Charge pump fault",
+	"Missing boost sync fault",
+	"CRC error fault ",
+};
+
+/* Textual meaning for status bits, starting from bit 1 */
+static const char *const lp8864_boost_status_msg[] = {
+	"Boost OVP low fault",
+	"Boost OVP high fault",
+	"Boost over-current fault",
+	"Missing boost FSET resistor fault",
+	"Missing MODE SEL resistor fault",
+	"Missing LED resistor fault",
+	"ISET resistor short to ground fault",
+	"Thermal shutdown fault",
+};
+
+/* Textual meaning for every register bit */
+static const char *const lp8864_led_status_msg[] = {
+	"LED 1 fault",
+	"LED 2 fault",
+	"LED 3 fault",
+	"LED 4 fault",
+	"LED 5 fault",
+	"LED 6 fault",
+	"LED open fault",
+	"LED internal short fault",
+	"LED short to GND fault",
+	NULL, NULL, NULL,
+	"Invalid string configuration fault",
+	NULL,
+	"I2C time out fault",
+};
+
+/**
+ * struct lp8864_led
+ * @client: Pointer to the I2C client
+ * @led_dev: led class device pointer
+ * @regmap: Devices register map
+ * @led_status_mask: Helps to report LED fault only once
+ */
+struct lp8864_led {
+	struct i2c_client *client;
+	struct led_classdev led_dev;
+	struct regmap *regmap;
+	u16 led_status_mask;
+};
+
+static int lp8864_fault_check(struct lp8864_led *led)
+{
+	int ret, i;
+	unsigned int val;
+
+	ret = regmap_read(led->regmap, LP8864_SUPPLY_STATUS, &val);
+	if (ret)
+		goto err;
+
+	/* Odd bits are status bits, even bits are clear bits */
+	for (i = 0; i < ARRAY_SIZE(lp8864_supply_status_msg); i++)
+		if (val & BIT(i * 2 + 1))
+			dev_warn(&led->client->dev, "%s\n", lp8864_supply_status_msg[i]);
+
+	/*
+	 * Clear bits have an index preceding the corresponding Status bits;
+	 * both have to be written "1" simultaneously to clear the corresponding
+	 * Status bit.
+	 */
+	if (val)
+		ret = regmap_write(led->regmap, LP8864_SUPPLY_STATUS, val >> 1 | val);
+	if (ret)
+		goto err;
+
+	ret = regmap_read(led->regmap, LP8864_BOOST_STATUS, &val);
+	if (ret)
+		goto err;
+
+	/* Odd bits are status bits, even bits are clear bits */
+	for (i = 0; i < ARRAY_SIZE(lp8864_boost_status_msg); i++)
+		if (val & BIT(i * 2 + 1))
+			dev_warn(&led->client->dev, "%s\n", lp8864_boost_status_msg[i]);
+
+	if (val)
+		ret = regmap_write(led->regmap, LP8864_BOOST_STATUS, val >> 1 | val);
+	if (ret)
+		goto err;
+
+	ret = regmap_read(led->regmap, LP8864_LED_STATUS, &val);
+	if (ret)
+		goto err;
+
+	/*
+	 * Clear already reported faults that maintain their value until device
+	 * power-down
+	 */
+	val &= ~led->led_status_mask;
+
+	for (i = 0; i < ARRAY_SIZE(lp8864_led_status_msg); i++)
+		if (lp8864_led_status_msg[i] && val & BIT(i))
+			dev_warn(&led->client->dev, "%s\n", lp8864_led_status_msg[i]);
+
+	/*
+	 * Mark those which maintain their value until device power-down as
+	 * "already reported"
+	 */
+	led->led_status_mask |= val & ~LP8864_LED_STATUS_WR_MASK;
+
+	/*
+	 * Only bits 14, 12, 10 have to be cleared here, but others are RO,
+	 * we don't care what we write to them.
+	 */
+	if (val & LP8864_LED_STATUS_WR_MASK)
+		ret = regmap_write(led->regmap, LP8864_LED_STATUS, val >> 1 | val);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	dev_err(&led->client->dev, "Failed to read/clear faults (%pe)\n", ERR_PTR(ret));
+
+	return ret;
+}
+
+static int lp8864_brightness_set(struct led_classdev *led_cdev,
+				 enum led_brightness brt_val)
+{
+	struct lp8864_led *led = container_of(led_cdev, struct lp8864_led, led_dev);
+	/* Scale 0..LED_FULL into 16-bit HW brightness */
+	unsigned int val = brt_val * 0xffff / LED_FULL;
+	int ret;
+
+	ret = lp8864_fault_check(led);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(led->regmap, LP8864_BRT_CONTROL, val);
+	if (ret)
+		dev_err(&led->client->dev, "Failed to write brightness value\n");
+
+	return ret;
+}
+
+static enum led_brightness lp8864_brightness_get(struct led_classdev *led_cdev)
+{
+	struct lp8864_led *led = container_of(led_cdev, struct lp8864_led, led_dev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(led->regmap, LP8864_BRT_CONTROL, &val);
+	if (ret) {
+		dev_err(&led->client->dev, "Failed to read brightness value\n");
+		return ret;
+	}
+
+	/* Scale 16-bit HW brightness into 0..LED_FULL */
+	return val * LED_FULL / 0xffff;
+}
+
+static const struct regmap_config lp8864_regmap_config = {
+	.reg_bits		= 8,
+	.val_bits		= 16,
+	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
+};
+
+static void lp8864_disable_gpio(void *data)
+{
+	struct gpio_desc *gpio = data;
+
+	gpiod_set_value(gpio, 0);
+}
+
+static int lp8864_probe(struct i2c_client *client)
+{
+	int ret;
+	struct lp8864_led *led;
+	struct device_node *np = dev_of_node(&client->dev);
+	struct device_node *child_node;
+	struct led_init_data init_data = {};
+	struct gpio_desc *enable_gpio;
+
+	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	child_node = of_get_next_available_child(np, NULL);
+	if (!child_node) {
+		dev_err(&client->dev, "No LED function defined\n");
+		return -EINVAL;
+	}
+
+	ret = devm_regulator_get_enable_optional(&client->dev, "vled");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(&client->dev, ret, "Failed to enable vled regulator\n");
+
+	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(enable_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
+				     "Failed to get enable GPIO\n");
+
+	ret = devm_add_action_or_reset(&client->dev, lp8864_disable_gpio, enable_gpio);
+	if (ret)
+		return ret;
+
+	led->client = client;
+	led->led_dev.brightness_set_blocking = lp8864_brightness_set;
+	led->led_dev.brightness_get = lp8864_brightness_get;
+
+	led->regmap = devm_regmap_init_i2c(client, &lp8864_regmap_config);
+	if (IS_ERR(led->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(led->regmap),
+				     "Failed to allocate regmap\n");
+
+	/* Control brightness by DISPLAY_BRT register */
+	ret = regmap_update_bits(led->regmap, LP8864_USER_CONFIG1, LP8864_BRT_MODE_MASK,
+								   LP8864_BRT_MODE_REG);
+	if (ret) {
+		dev_err(&led->client->dev, "Failed to set brightness control mode\n");
+		return ret;
+	}
+
+	ret = lp8864_fault_check(led);
+	if (ret)
+		return ret;
+
+	init_data.fwnode = of_fwnode_handle(child_node);
+	init_data.devicename = "lp8864";
+	init_data.default_label = ":display_cluster";
+
+	ret = devm_led_classdev_register_ext(&client->dev, &led->led_dev, &init_data);
+	if (ret)
+		dev_err(&client->dev, "Failed to register LED device (%pe)\n", ERR_PTR(ret));
+
+	return ret;
+}
+
+static const struct i2c_device_id lp8864_id[] = {
+	{ "lp8864" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, lp8864_id);
+
+static const struct of_device_id of_lp8864_leds_match[] = {
+	{ .compatible = "ti,lp8864" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_lp8864_leds_match);
+
+static struct i2c_driver lp8864_driver = {
+	.driver = {
+		.name	= "lp8864",
+		.of_match_table = of_lp8864_leds_match,
+	},
+	.probe		= lp8864_probe,
+	.id_table	= lp8864_id,
+};
+module_i2c_driver(lp8864_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LP8864/LP8866 LED driver");
+MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@siemens.com>");
+MODULE_LICENSE("GPL");
-- 
2.47.1

