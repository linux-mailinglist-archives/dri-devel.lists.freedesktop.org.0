Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E41CC3FF95
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 13:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B0E10E1C5;
	Fri,  7 Nov 2025 12:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MH/51Lu0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B95410EAB0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D8384463E;
 Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBBD3C116B1;
 Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762519812;
 bh=EaQSUFPiPNhGt6rUZNQxHBo2ySBhByFnrIu8PjDVVCM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=MH/51Lu0+iaDLXpmSUF1VkQHEWQ19Rcpii5E2w55ejbcSi0V6eYytgmLUuDc9W+o0
 Wk9MTub2gQLapcXSeNG4JQ9lFQ3bV88cVenrJEPncHafJvsZpp8x42SqGrRTnokauC
 AHWYSmjO8ML596wlTSyifxabII0ccuHBDPaFhXLk7qD30N97XhHs5opY3qxhgW1njE
 gWrfsF8Rpv/TNAjpqVqfN0KFD8E7Clday7561Rs0ZKWRthdPplSNcseNwfavshW+wq
 2VZ0uwfSZfiw+dfsZ2u7W1N1Vu/4ikCs0qlzs8G4pmb9R9mzZSDsNMY/DHbXJvou4N
 +ryW21Rne6JQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C0BE1CCFA05;
 Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 07 Nov 2025 13:49:59 +0100
Subject: [PATCH v5 2/4] backlight: add max25014atg backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
In-Reply-To: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762519811; l=13699;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=lBcuHkBU5T0rW8OniQor+wUrm3ufVe7/uYodhHCQcAU=;
 b=yGNPETf7+H0iwbZJSr9mgSoumF7Nd5nuf6kNYbaMCqQLIQbPsEF/OttHz2TLcWfeJq4jgdJAO
 QhFMNgUyEwMANKXMGxy2inILLyrl3ehJpwVYg53iSLxShtb8zCk8xhx
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maudspierings@gocontroll.com>

The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
with integrated boost controller.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS                        |   1 +
 drivers/video/backlight/Kconfig    |   7 +
 drivers/video/backlight/Makefile   |   1 +
 drivers/video/backlight/max25014.c | 409 +++++++++++++++++++++++++++++++++++++
 4 files changed, 418 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 606ce086f758..d082d3f8cfae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15265,6 +15265,7 @@ MAX25014 BACKLIGHT DRIVER
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
+F:	drivers/video/backlight/max25014.c
 
 MAX31335 RTC DRIVER
 M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d9374d208cee..d3bb6ccd4185 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -262,6 +262,13 @@ config BACKLIGHT_DA9052
 	help
 	  Enable the Backlight Driver for DA9052-BC and DA9053-AA/Bx PMICs.
 
+config BACKLIGHT_MAX25014
+	tristate "Backlight driver for the Maxim MAX25014 chip"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you are using a MAX25014 chip as a backlight driver say Y to enable it.
+
 config BACKLIGHT_MAX8925
 	tristate "Backlight driver for MAX8925"
 	depends on MFD_MAX8925
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index dfbb169bf6ea..1170d9ec40b8 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_BACKLIGHT_LOCOMO)		+= locomolcd.o
 obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
 obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
+obj-$(CONFIG_BACKLIGHT_MAX25014)	+= max25014.o
 obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
 obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c.o
 obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
new file mode 100644
index 000000000000..36bae508697e
--- /dev/null
+++ b/drivers/video/backlight/max25014.c
@@ -0,0 +1,409 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Backlight driver for Maxim MAX25014
+ *
+ * Copyright (C) 2025 GOcontroll B.V.
+ * Author: Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define MAX25014_ISET_DEFAULT_100 11
+#define MAX_BRIGHTNESS            100
+#define MIN_BRIGHTNESS            0
+#define TON_MAX                   130720 /* @153Hz */
+#define TON_STEP                  1307 /* @153Hz */
+#define TON_MIN                   0
+
+#define MAX25014_DEV_ID           0x00
+#define MAX25014_REV_ID           0x01
+#define MAX25014_ISET             0x02
+#define MAX25014_IMODE            0x03
+#define MAX25014_TON1H            0x04
+#define MAX25014_TON1L            0x05
+#define MAX25014_TON2H            0x06
+#define MAX25014_TON2L            0x07
+#define MAX25014_TON3H            0x08
+#define MAX25014_TON3L            0x09
+#define MAX25014_TON4H            0x0A
+#define MAX25014_TON4L            0x0B
+#define MAX25014_TON_1_4_LSB      0x0C
+#define MAX25014_SETTING          0x12
+#define MAX25014_DISABLE          0x13
+#define MAX25014_BSTMON           0x14
+#define MAX25014_IOUT1            0x15
+#define MAX25014_IOUT2            0x16
+#define MAX25014_IOUT3            0x17
+#define MAX25014_IOUT4            0x18
+#define MAX25014_OPEN             0x1B
+#define MAX25014_SHORT_GND        0x1C
+#define MAX25014_SHORT_LED        0x1D
+#define MAX25014_MASK             0x1E
+#define MAX25014_DIAG             0x1F
+
+#define MAX25014_IMODE_HDIM       BIT(2)
+#define MAX25014_ISET_ENABLE      BIT(5)
+#define MAX25014_ISET_PSEN        BIT(4)
+#define MAX25014_DIAG_HW_RST      BIT(2)
+#define MAX25014_SETTING_FPWM     GENMASK(6, 4)
+
+struct max25014 {
+	struct i2c_client *client;
+	struct backlight_device *bl;
+	struct regmap *regmap;
+	struct gpio_desc *enable;
+	struct regulator *vin; /* regulator for boost converter Vin rail */
+	uint32_t iset;
+	uint8_t strings_mask;
+};
+
+static const struct regmap_config max25014_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX25014_DIAG,
+};
+
+/**
+ * @brief control the brightness with i2c registers
+ *
+ * @param regmap trivial
+ * @param brt brightness
+ * @return int
+ */
+static int max25014_register_control(struct regmap *regmap, uint32_t brt)
+{
+	uint32_t reg = TON_STEP * brt;
+	int ret;
+	/*
+	 * 18 bit number lowest, 2 bits in first register,
+	 * next lowest 8 in the L register, next 8 in the H register
+	 * Seemingly setting the strength of only one string controls all of
+	 * them, individual settings don't affect the outcome.
+	 */
+
+	ret = regmap_write(regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
+	if (ret != 0)
+		return ret;
+	ret = regmap_write(regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
+	if (ret != 0)
+		return ret;
+	return regmap_write(regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
+}
+
+static int max25014_check_errors(struct max25014 *maxim)
+{
+	uint8_t i;
+	int ret;
+	uint32_t val;
+
+	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
+	if (ret != 0)
+		return ret;
+	if (val > 0) {
+		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
+		for (i = 0; i < 4; i++) {
+			if (val & 1 << i)
+				dev_err(&maxim->client->dev, "string %d\n", i + 1);
+		}
+		return -EIO;
+	}
+
+	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
+	if (ret != 0)
+		return ret;
+	if (val > 0) {
+		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
+		for (i = 0; i < 4; i++) {
+			if (val & 1 << i)
+				dev_err(&maxim->client->dev, "string %d\n", i + 1);
+		}
+		return -EIO;
+	}
+
+	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
+	if (ret != 0)
+		return ret;
+	if (val > 0) {
+		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
+		for (i = 0; i < 4; i++) {
+			if (val & 1 << i)
+				dev_err(&maxim->client->dev, "string %d\n", i + 1);
+		}
+		return -EIO;
+	}
+
+	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
+	if (ret != 0)
+		return ret;
+	/*
+	 * The HW_RST bit always starts at 1 after power up.
+	 * It is reset on first read, does not indicate an error.
+	 */
+	if (val > 0 && val != MAX25014_DIAG_HW_RST) {
+		if (val & 0b1)
+			dev_err(&maxim->client->dev,
+				"Overtemperature shutdown\n");
+		if (val & 0b10)
+			dev_err(&maxim->client->dev,
+				 "Chip is getting too hot (>125C)\n");
+		if (val & 0b1000)
+			dev_err(&maxim->client->dev,
+				"Boost converter overvoltage\n");
+		if (val & 0b10000)
+			dev_err(&maxim->client->dev,
+				"Boost converter undervoltage\n");
+		if (val & 0b100000)
+			dev_err(&maxim->client->dev, "IREF out of range\n");
+		return -EIO;
+	}
+	return 0;
+}
+
+/*
+ * 1. disable unused strings
+ * 2. set dim mode
+ * 3. set initial brightness
+ * 4. set setting register
+ * 5. enable the backlight
+ */
+static int max25014_configure(struct max25014 *maxim)
+{
+	int ret;
+	uint32_t val;
+
+	ret = regmap_write(maxim->regmap, MAX25014_DISABLE,
+			   maxim->strings_mask);
+	if (ret != 0)
+		return ret;
+
+	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
+	if (ret != 0)
+		return ret;
+
+	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
+	if (ret != 0)
+		return ret;
+
+	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
+			   val & ~MAX25014_SETTING_FPWM);
+	if (ret != 0)
+		return ret;
+
+	ret = regmap_write(maxim->regmap, MAX25014_ISET,
+			   maxim->iset | MAX25014_ISET_ENABLE |
+			   MAX25014_ISET_PSEN);
+	return ret;
+}
+
+static int max25014_update_status(struct backlight_device *bl_dev)
+{
+	struct max25014 *maxim = bl_get_data(bl_dev);
+
+	if (backlight_is_blank(maxim->bl))
+		bl_dev->props.brightness = 0;
+
+	return max25014_register_control(maxim->regmap,
+					 bl_dev->props.brightness);
+}
+
+static const struct backlight_ops max25014_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = max25014_update_status,
+};
+
+static int max25014_parse_dt(struct max25014 *maxim,
+			     uint32_t *initial_brightness)
+{
+	struct device *dev = &maxim->client->dev;
+	struct device_node *node = dev->of_node;
+	struct fwnode_handle *child;
+	uint32_t strings[4];
+	int res, i;
+
+	if (!node) {
+		dev_err(dev, "no platform data\n");
+		return -EINVAL;
+	}
+
+	child = device_get_next_child_node(dev, NULL);
+	if (child) {
+		res = fwnode_property_count_u32(child, "led-sources");
+		if (res > 0) {
+			fwnode_property_read_u32_array(child, "led-sources",
+						       strings, res);
+
+			/* set all strings as disabled, then enable those in led-sources*/
+			maxim->strings_mask = 0xf;
+			for (i = 0; i < res; i++) {
+				if (strings[i] <= 4)
+					maxim->strings_mask &= ~BIT(strings[i]);
+			}
+		}
+
+		fwnode_property_read_u32(child, "default-brightness",
+					 initial_brightness);
+
+		fwnode_handle_put(child);
+	}
+
+	maxim->iset = MAX25014_ISET_DEFAULT_100;
+	of_property_read_u32(node, "maxim,iset", &maxim->iset);
+
+	if (maxim->iset < 0 || maxim->iset > 15) {
+		dev_err(dev,
+			"Invalid iset, should be a value from 0-15, entered was %d\n",
+			maxim->iset);
+		return -EINVAL;
+	}
+
+	if (*initial_brightness < 0 || *initial_brightness > 100) {
+		dev_err(dev,
+			"Invalid initial brightness, should be a value from 0-100, entered was %d\n",
+			*initial_brightness);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int max25014_probe(struct i2c_client *cl)
+{
+	struct backlight_device *bl;
+	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
+	struct max25014 *maxim;
+	struct backlight_properties props;
+	int ret;
+	uint32_t initial_brightness = 50;
+
+	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
+	if (!maxim)
+		return -ENOMEM;
+
+	maxim->client = cl;
+
+	ret = max25014_parse_dt(maxim, &initial_brightness);
+	if (ret < 0)
+		return ret;
+
+	maxim->vin = devm_regulator_get_optional(&maxim->client->dev, "power");
+	if (IS_ERR(maxim->vin)) {
+		if (PTR_ERR(maxim->vin) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		maxim->vin = NULL;
+	}
+
+	if (maxim->vin) {
+		ret = regulator_enable(maxim->vin);
+		if (ret < 0) {
+			dev_err(&maxim->client->dev,
+				"failed to enable Vin: %d\n", ret);
+			return ret;
+		}
+	}
+
+	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
+						GPIOD_ASIS);
+	if (IS_ERR(maxim->enable)) {
+		ret = PTR_ERR(maxim->enable);
+		dev_err(&maxim->client->dev, "failed to get enable gpio: %d\n",
+			ret);
+		goto disable_vin;
+	}
+
+	if (maxim->enable)
+		gpiod_set_value_cansleep(maxim->enable, 1);
+
+	/* Enable can be tied to vin rail wait if either is available */
+	if (maxim->enable || maxim->vin) {
+		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
+		usleep_range(2000, 2500);
+	}
+
+	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
+	if (IS_ERR(maxim->regmap)) {
+		ret = PTR_ERR(maxim->regmap);
+		dev_err(&maxim->client->dev,
+			"failed to initialize the i2c regmap: %d\n", ret);
+		goto disable_full;
+	}
+
+	i2c_set_clientdata(cl, maxim);
+
+	ret = max25014_check_errors(maxim);
+	if (ret) { /* error is already reported in the above function */
+		goto disable_full;
+	}
+
+	ret = max25014_configure(maxim);
+	if (ret) {
+		dev_err(&maxim->client->dev, "device config err: %d", ret);
+		goto disable_full;
+	}
+
+	memset(&props, 0, sizeof(props));
+	props.type = BACKLIGHT_PLATFORM;
+	props.max_brightness = MAX_BRIGHTNESS;
+	props.brightness = initial_brightness;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+
+	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
+					    &maxim->client->dev, maxim,
+					    &max25014_bl_ops, &props);
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
+
+	maxim->bl = bl;
+
+	return 0;
+
+disable_full:
+	if (maxim->enable)
+		gpiod_set_value_cansleep(maxim->enable, 0);
+disable_vin:
+	if (maxim->vin)
+		regulator_disable(maxim->vin);
+	return ret;
+}
+
+static void max25014_remove(struct i2c_client *cl)
+{
+	struct max25014 *maxim = i2c_get_clientdata(cl);
+
+	maxim->bl->props.brightness = 0;
+	max25014_update_status(maxim->bl);
+	if (maxim->enable)
+		gpiod_set_value_cansleep(maxim->enable, 0);
+	if (maxim->vin)
+		regulator_disable(maxim->vin);
+}
+
+static const struct of_device_id max25014_dt_ids[] = {
+	{ .compatible = "maxim,max25014", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max25014_dt_ids);
+
+static const struct i2c_device_id max25014_ids[] = {
+	{ "max25014" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max25014_ids);
+
+static struct i2c_driver max25014_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = of_match_ptr(max25014_dt_ids),
+	},
+	.probe = max25014_probe,
+	.remove = max25014_remove,
+	.id_table = max25014_ids,
+};
+module_i2c_driver(max25014_driver);
+
+MODULE_DESCRIPTION("Maxim MAX25014 backlight driver");
+MODULE_AUTHOR("Maud Spierings <maudspierings@gocontroll.com>");
+MODULE_LICENSE("GPL");

-- 
2.51.2


