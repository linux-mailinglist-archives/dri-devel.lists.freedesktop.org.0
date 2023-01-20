Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C4675CA5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B8010EABC;
	Fri, 20 Jan 2023 18:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAB410EA52
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:39:12 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 y3-20020a17090a390300b00229add7bb36so4751992pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbrTw8q0FYWcgyqiGLW/S6PKzzVmyAxVa5ipE2Zw0iw=;
 b=cD/lNMUjPMBxUVzQDFEF2mim04zKBppR051Qicl7OaEe2twsixhdOhmV53N8HVoTbn
 XOe5YLFaKXRyMQ/g1NlfIafSC7FPlh59Xq8ko34riY9g5gZQXJiphi5ELxlaItwshQaE
 jIE4yLK0q/xepm4GaH4vLVJ+LuzckjhwY+2MbMHryTvZo8PuCt9l9a2v2GKtYB/OPu8w
 WrT6SfVSFBSXaMip2hR3bQ2ldwONob/puUUW67sM40ZforgjIR0JRHq7pWkdSp4BIulI
 8gele0EwMLiFO2H+9vgYDm14hgYeNZmHu2p8HrdjCorJYHzL9kVsv8oqJAygteBpfJj0
 LPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbrTw8q0FYWcgyqiGLW/S6PKzzVmyAxVa5ipE2Zw0iw=;
 b=kVjqneUsmuMeVxmyXeNw344AlUBrOSk1OiLUa56ykELQMROgLtwP6koGcd2ty82hP4
 lwN5ki/ywmM55znvQdBwJsH30ddxc6iwXd2My9ZPwjae7qdfS3/Jzvz+ZM9YG3SqNJTa
 3FftGcXyRDQL2T3IiyRquctHs/TJuRN8gAqQjmoYtMr0n3H+5jKqRDO0YbN31+xuCdXv
 kozSFAZNV/jEXLKD/OjmIvgpqwaIbETCakGO+5pn5MoR24vLNcY67M72nSjaujUbs4cq
 94wDpIWb+j0CkRvb+oJh99k3NhXtF7KmRoLJLsTsmDOX6pNLVFOyafiNQeY2wPAmwiVN
 nbHw==
X-Gm-Message-State: AFqh2kp6mgKlWWIpY1Uq964YRxauo3fhqPGh7UIO8f1mLq5IZq0u0sys
 YHIRIYWuYskc2EhzeiKlOFA=
X-Google-Smtp-Source: AMrXdXvn5FWoGnUPfZD9Nj1BMQyZeHI2km0g9KQnN5hq4QTbRl7ZVK+CxfZpSDb7j3MfdFjWl0Dnww==
X-Received: by 2002:a17:90a:1285:b0:229:679b:bf9c with SMTP id
 g5-20020a17090a128500b00229679bbf9cmr16065577pja.9.1674218352446; 
 Fri, 20 Jan 2023 04:39:12 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 p23-20020a17090a0e5700b002271b43e528sm1131044pja.33.2023.01.20.04.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:39:12 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v8 2/2] backlight: ktz8866: Add support for Kinetic KTZ8866
 backlight
Date: Fri, 20 Jan 2023 20:38:57 +0800
Message-Id: <20230120123857.16124-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120123857.16124-1-lujianhua000@gmail.com>
References: <20230120123857.16124-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 18:19:29 +0000
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
 Jianhua Lu <lujianhua000@gmail.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Kinetic KTZ8866 backlight, which is used in
Xiaomi tablet, Mi Pad 5 series. This driver lightly based on
downstream implementation [1].
[1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/video/backlight/ktz8866.c

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v2:
  - Add missing staitc modifier to ktz8866_write function.

Changes in v3:
  - Add 2022 to Copyright line.
  - Sort headers.
  - Remove meaningless comment.
  - Use definitions instead of hardcoding.
  - Add missing maintainer info.

Changes in v4:
  - Change 2022 to 2023.
  - Remove useless macro and enum.
  - Describe settings by devicetree.
  - Move header file to C file.

Changes in v5:
  - Change "2023" to "2022, 2023" in Copyright line.
  - Set scale property for backlight.

Changes in v6:
  - Correct devicetree property name.

Changes in v7:
  - Remove unnecessary sleep statement.
  - Fix code style.
  - Add vddpos and vddneg supply devicetree parse.
  - Add enabel-gpio devicetree parse.

Changes in v8:
  - Modify devicetree parse according to dt bindings.

 MAINTAINERS                       |   6 +
 drivers/video/backlight/Kconfig   |   8 ++
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/ktz8866.c | 209 ++++++++++++++++++++++++++++++
 4 files changed, 224 insertions(+)
 create mode 100644 drivers/video/backlight/ktz8866.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 42fc47c6edfd..2084e74e1b58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11674,6 +11674,12 @@ M:	John Hawley <warthog9@eaglescrag.net>
 S:	Maintained
 F:	tools/testing/ktest
 
+KTZ8866 BACKLIGHT DRIVER
+M:	Jianhua Lu <lujianhua000@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
+F:	drivers/video/backlight/ktz8866.c
+
 L3MDEV
 M:	David Ahern <dsahern@kernel.org>
 L:	netdev@vger.kernel.org
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 936ba1e4d35e..f7113ceb264a 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -190,6 +190,14 @@ config BACKLIGHT_KTD253
 	  which is a 1-wire GPIO-controlled backlight found in some mobile
 	  phones.
 
+config BACKLIGHT_KTZ8866
+	tristate "Backlight Driver for Kinetic KTZ8866"
+	depends on I2C
+	select REGMAP_I2C
+	help
+		Say Y to enable the backlight driver for the Kinetic KTZ8866
+		found in Xiaomi Mi Pad 5 series.
+
 config BACKLIGHT_LM3533
 	tristate "Backlight Driver for LM3533"
 	depends on MFD_LM3533
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index e815f3f1deff..f70a819c304c 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
 obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
 obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
 obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
+obj-$(CONFIG_BACKLIGHT_KTZ8866)		+= ktz8866.o
 obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
new file mode 100644
index 000000000000..97b723719e13
--- /dev/null
+++ b/drivers/video/backlight/ktz8866.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Backlight driver for the Kinetic KTZ8866
+ *
+ * Copyright (C) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define DEFAULT_BRIGHTNESS 1500
+#define MAX_BRIGHTNESS 2047
+#define REG_MAX 0x15
+
+/* reg */
+#define DEVICE_ID 0x01
+#define BL_CFG1 0x02
+#define BL_CFG2 0x03
+#define BL_BRT_LSB 0x04
+#define BL_BRT_MSB 0x05
+#define BL_EN 0x08
+#define LCD_BIAS_CFG1 0x09
+#define LCD_BIAS_CFG2 0x0A
+#define LCD_BIAS_CFG3 0x0B
+#define LCD_BOOST_CFG 0x0C
+#define OUTP_CFG 0x0D
+#define OUTN_CFG 0x0E
+#define FLAG 0x0F
+#define BL_OPTION1 0x10
+#define BL_OPTION2 0x11
+#define PWM2DIG_LSBs 0x12
+#define PWM2DIG_MSBs 0x13
+#define BL_DIMMING 0x14
+#define PWM_RAMP_TIME 0x15
+
+/* definition */
+#define BL_EN_BIT BIT(6)
+#define LCD_BIAS_EN 0x9F
+#define PWM_HYST 0x5
+
+struct ktz8866 {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	bool led_on;
+	struct gpio_desc *enable_gpio;
+};
+
+static const struct regmap_config ktz8866_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_MAX,
+};
+
+static int ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
+			 unsigned int val)
+{
+	return regmap_write(ktz->regmap, reg, val);
+}
+
+static int ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
+			       unsigned int mask, unsigned int val)
+{
+	return regmap_update_bits(ktz->regmap, reg, mask, val);
+}
+
+static int ktz8866_backlight_update_status(struct backlight_device *backlight_dev)
+{
+	struct ktz8866 *ktz = bl_get_data(backlight_dev);
+	unsigned int brightness = backlight_get_brightness(backlight_dev);
+
+	if (!ktz->led_on && brightness > 0) {
+		ktz8866_update_bits(ktz, BL_EN, BL_EN_BIT, BL_EN_BIT);
+		ktz->led_on = true;
+	} else if (brightness == 0) {
+		ktz8866_update_bits(ktz, BL_EN, BL_EN_BIT, 0);
+		ktz->led_on = false;
+	}
+
+	/* Set brightness */
+	ktz8866_write(ktz, BL_BRT_LSB, brightness & 0x7);
+	ktz8866_write(ktz, BL_BRT_MSB, (brightness >> 3) & 0xFF);
+
+	return 0;
+}
+
+static const struct backlight_ops ktz8866_backlight_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = ktz8866_backlight_update_status,
+};
+
+static void ktz8866_init(struct ktz8866 *ktz)
+{
+	unsigned int val = 0;
+
+	if (of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))
+		ktz8866_write(ktz, BL_EN, BIT(val) - 1);
+	else
+		/* Enable all 6 current sinks if the number of current sinks isn't specified. */
+		ktz8866_write(ktz, BL_EN, BIT(6) - 1);
+
+	if (of_property_read_u32(ktz->client->dev.of_node, "kinetic,current-ramp-delay-ms", &val)) {
+		if (val <= 128)
+			ktz8866_write(ktz, BL_CFG2, BIT(7) | (ilog2(val) << 3) | PWM_HYST);
+		else
+			ktz8866_write(ktz, BL_CFG2, BIT(7) | ((5 + val / 64) << 3) | PWM_HYST);
+	}
+
+	if (of_property_read_u32(ktz->client->dev.of_node, "kinetic,led-enable-ramp-delay-ms", &val)) {
+		if (val == 0)
+			ktz8866_write(ktz, BL_DIMMING, 0);
+		else {
+			unsigned int ramp_off_time = ilog2(val) + 1;
+			unsigned int ramp_on_time = ramp_off_time << 4;
+			ktz8866_write(ktz, BL_DIMMING, ramp_on_time | ramp_off_time);
+		}
+	}
+
+	if (of_property_read_bool(ktz->client->dev.of_node, "kinetic,enable-lcd-bias"))
+		ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
+}
+
+static int ktz8866_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct backlight_device *backlight_dev;
+	struct backlight_properties props;
+	struct ktz8866 *ktz;
+	int ret = 0;
+
+	ktz = devm_kzalloc(&client->dev, sizeof(*ktz), GFP_KERNEL);
+	if (!ktz)
+		return -ENOMEM;
+
+	ktz->client = client;
+	ktz->regmap = devm_regmap_init_i2c(client, &ktz8866_regmap_config);
+	if (IS_ERR(ktz->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(ktz->regmap), "failed to init regmap\n");
+
+	ret = devm_regulator_get_enable(&client->dev, "vddpos");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "get regulator vddpos failed\n");
+	ret = devm_regulator_get_enable(&client->dev, "vddneg");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "get regulator vddneg failed\n");
+
+	ktz->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(ktz->enable_gpio))
+		return PTR_ERR(ktz->enable_gpio);
+
+	memset(&props, 0, sizeof(props));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = MAX_BRIGHTNESS;
+	props.brightness = DEFAULT_BRIGHTNESS;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+
+	backlight_dev = devm_backlight_device_register(&client->dev, "ktz8866-backlight",
+					&client->dev, ktz, &ktz8866_backlight_ops, &props);
+	if (IS_ERR(backlight_dev))
+		return dev_err_probe(&client->dev, PTR_ERR(backlight_dev),
+				"failed to register backlight device\n");
+
+	ktz8866_init(ktz);
+
+	i2c_set_clientdata(client, backlight_dev);
+	backlight_update_status(backlight_dev);
+
+	return 0;
+}
+
+static void ktz8866_remove(struct i2c_client *client)
+{
+	struct backlight_device *backlight_dev = i2c_get_clientdata(client);
+	backlight_dev->props.brightness = 0;
+	backlight_update_status(backlight_dev);
+}
+
+static const struct i2c_device_id ktz8866_ids[] = {
+	{ "ktz8866", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, ktz8866_ids);
+
+static const struct of_device_id ktz8866_match_table[] = {
+	{
+		.compatible = "kinetic,ktz8866",
+	},
+	{},
+};
+
+static struct i2c_driver ktz8866_driver = {
+	.driver = {
+		.name = "ktz8866",
+		.of_match_table = ktz8866_match_table,
+	},
+	.probe = ktz8866_probe,
+	.remove = ktz8866_remove,
+	.id_table = ktz8866_ids,
+};
+
+module_i2c_driver(ktz8866_driver);
+
+MODULE_DESCRIPTION("Kinetic KTZ8866 Backlight Driver");
+MODULE_AUTHOR("Jianhua Lu <lujianhua000@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.39.1

