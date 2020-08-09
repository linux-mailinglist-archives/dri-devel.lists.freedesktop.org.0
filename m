Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA02402D9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EF36E3C1;
	Mon, 10 Aug 2020 07:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A3E6E02F
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 10:59:51 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BPbhk0SBxz1rs2p;
 Sun,  9 Aug 2020 12:59:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BPbhj73GZz1qy5j;
 Sun,  9 Aug 2020 12:59:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id d5jbLWVlQO9G; Sun,  9 Aug 2020 12:59:48 +0200 (CEST)
X-Auth-Info: r4yvAkp/dqPvZ7oNZHghJp37y1SgF70ZT0OUP0e75So=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  9 Aug 2020 12:59:48 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] regulator: rpi-panel: Add regulator/backlight driver for
 RPi panel
Date: Sun,  9 Aug 2020 12:59:38 +0200
Message-Id: <20200809105938.6388-2-marex@denx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809105938.6388-1-marex@denx.de>
References: <20200809105938.6388-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
Cc: Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This regulator/backlight driver handles the ATTINY88 present on the
RPi 7" touchscreen panel and exposes the power/backlight interfaces.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Mark Brown <broonie@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 .../regulator/rpi-panel-attiny-regulator.c    | 214 ++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 drivers/regulator/rpi-panel-attiny-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index de17ef7e18f0..439cc5226bae 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -864,6 +864,16 @@ config REGULATOR_QCOM_USB_VBUS
 	  Say M here if you want to include support for enabling the VBUS output
 	  as a module. The module will be named "qcom_usb_vbus_regulator".
 
+config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
+	tristate "Raspberry Pi 7-inch touchscreen panel ATTINY regulator"
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  This driver supports ATTINY regulator on the Raspberry Pi 7-inch
+	  touchscreen unit. The regulator is used to enable power to the
+	  TC358762, display and to control backlight.
+
 config REGULATOR_RC5T583
 	tristate "RICOH RC5T583 Power regulators"
 	depends on MFD_RC5T583
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index d8d3ecf526a8..6e39ea87901e 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,6 +107,7 @@ obj-$(CONFIG_REGULATOR_TPS51632) += tps51632-regulator.o
 obj-$(CONFIG_REGULATOR_PBIAS) += pbias-regulator.o
 obj-$(CONFIG_REGULATOR_PCAP) += pcap-regulator.o
 obj-$(CONFIG_REGULATOR_PCF50633) += pcf50633-regulator.o
+obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY)  += rpi-panel-attiny-regulator.o
 obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
 obj-$(CONFIG_REGULATOR_RK808)   += rk808-regulator.o
 obj-$(CONFIG_REGULATOR_RN5T618) += rn5t618-regulator.o
diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
new file mode 100644
index 000000000000..ee46bfbf5eee
--- /dev/null
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Marek Vasut <marex@denx.de>
+ *
+ * Based on rpi_touchscreen.c by Eric Anholt <eric@anholt.net>
+ */
+
+#include <linux/backlight.h>
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/slab.h>
+
+/* I2C registers of the Atmel microcontroller. */
+#define REG_ID		0x80
+#define REG_PORTA	0x81
+#define REG_PORTA_HF	BIT(2)
+#define REG_PORTA_VF	BIT(3)
+#define REG_PORTB	0x82
+#define REG_POWERON	0x85
+#define REG_PWM		0x86
+
+static const struct regmap_config attiny_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_PWM,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int attiny_lcd_power_enable(struct regulator_dev *rdev)
+{
+	unsigned int data;
+
+	regmap_write(rdev->regmap, REG_POWERON, 1);
+	/* Wait for nPWRDWN to go low to indicate poweron is done. */
+	regmap_read_poll_timeout(rdev->regmap, REG_PORTB, data,
+					data & BIT(0), 10, 1000000);
+
+	/* Default to the same orientation as the closed source
+	 * firmware used for the panel.  Runtime rotation
+	 * configuration will be supported using VC4's plane
+	 * orientation bits.
+	 */
+	regmap_write(rdev->regmap, REG_PORTA, BIT(2));
+
+	return 0;
+}
+
+static int attiny_lcd_power_disable(struct regulator_dev *rdev)
+{
+	regmap_write(rdev->regmap, REG_PWM, 0);
+	regmap_write(rdev->regmap, REG_POWERON, 0);
+	udelay(1);
+	return 0;
+}
+
+static int attiny_lcd_power_is_enabled(struct regulator_dev *rdev)
+{
+	unsigned int data;
+	int ret;
+
+	ret = regmap_read(rdev->regmap, REG_POWERON, &data);
+	if (ret < 0)
+		return ret;
+
+	if (!(data & BIT(0)))
+		return 0;
+
+	ret = regmap_read(rdev->regmap, REG_PORTB, &data);
+	if (ret < 0)
+		return ret;
+
+	return data & BIT(0);
+}
+
+static const struct regulator_init_data attiny_regulator_default = {
+	.constraints = {
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+};
+
+static const struct regulator_ops attiny_regulator_ops = {
+	.enable = attiny_lcd_power_enable,
+	.disable = attiny_lcd_power_disable,
+	.is_enabled = attiny_lcd_power_is_enabled,
+};
+
+static const struct regulator_desc attiny_regulator = {
+	.name	= "tc358762-power",
+	.ops	= &attiny_regulator_ops,
+	.type	= REGULATOR_VOLTAGE,
+	.owner	= THIS_MODULE,
+};
+
+static int attiny_update_status(struct backlight_device *bl)
+{
+	struct regmap *regmap = bl_get_data(bl);
+	int brightness = bl->props.brightness;
+
+	if (bl->props.power != FB_BLANK_UNBLANK ||
+	    bl->props.fb_blank != FB_BLANK_UNBLANK)
+		brightness = 0;
+
+	return regmap_write(regmap, REG_PWM, brightness);
+}
+
+static int attiny_get_brightness(struct backlight_device *bl)
+{
+	struct regmap *regmap = bl_get_data(bl);
+	int ret, brightness;
+
+	ret = regmap_read(regmap, REG_PWM, &brightness);
+	if (ret)
+		return ret;
+
+	return brightness;
+}
+
+static const struct backlight_ops attiny_bl = {
+	.update_status	= attiny_update_status,
+	.get_brightness	= attiny_get_brightness,
+};
+
+/*
+ * I2C driver interface functions
+ */
+static int attiny_i2c_probe(struct i2c_client *i2c,
+		const struct i2c_device_id *id)
+{
+	struct backlight_properties props = { };
+	struct regulator_config config = { };
+	struct backlight_device *bl;
+	struct regulator_dev *rdev;
+	struct regmap *regmap;
+	unsigned int data;
+	int ret;
+
+	regmap = devm_regmap_init_i2c(i2c, &attiny_regmap_config);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = regmap_read(regmap, REG_ID, &data);
+	if (ret < 0) {
+		dev_err(&i2c->dev, "Failed to read REG_ID reg: %d\n", ret);
+		return ret;
+	}
+
+	switch (data) {
+	case 0xde: /* ver 1 */
+	case 0xc3: /* ver 2 */
+		break;
+	default:
+		dev_err(&i2c->dev, "Unknown Atmel firmware revision: 0x%02x\n", data);
+		return -ENODEV;
+	}
+
+	regmap_write(regmap, REG_POWERON, 0);
+	mdelay(1);
+
+	config.dev = &i2c->dev;
+	config.regmap = regmap;
+	config.of_node = i2c->dev.of_node;
+	config.init_data = &attiny_regulator_default;
+
+	rdev = devm_regulator_register(&i2c->dev, &attiny_regulator, &config);
+	if (IS_ERR(rdev)) {
+		dev_err(&i2c->dev, "Failed to register ATTINY regulator\n");
+		return PTR_ERR(rdev);
+	}
+
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = 0xff;
+	bl = devm_backlight_device_register(&i2c->dev,
+					    "7inch-touchscreen-panel-bl",
+					    &i2c->dev, regmap, &attiny_bl,
+					    &props);
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
+
+	bl->props.brightness = 0xff;
+
+	return 0;
+}
+
+static const struct of_device_id attiny_dt_ids[] = {
+	{ .compatible = "raspberrypi,7inch-touchscreen-panel-regulator" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, attiny_dt_ids);
+
+static struct i2c_driver attiny_regulator_driver = {
+	.driver = {
+		.name = "rpi_touchscreen_attiny",
+		.of_match_table = of_match_ptr(attiny_dt_ids),
+	},
+	.probe = attiny_i2c_probe,
+};
+
+module_i2c_driver(attiny_regulator_driver);
+
+MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
+MODULE_DESCRIPTION("Regulator device driver for Raspberry Pi 7-inch touchscreen");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
