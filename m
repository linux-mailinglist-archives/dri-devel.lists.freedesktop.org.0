Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5937C3B3
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 17:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81BB6EC32;
	Wed, 12 May 2021 15:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA9B6EC32
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 15:21:49 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id b21so11654938pft.10
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gc9ynDymCC3a3vz7FumAB7zqjSZEd+eT6DKBS2/xfx8=;
 b=m0YTHqaNUr7GcmGW2dUX6ZoLKX0BoXFa0ClP86ygRp6wVtqVbxIR5MvgXbjb4DOChU
 why/lx0uTHYR0zMJQSj0onlwTA7S2miXSR/NqROL+BbpGYQKszTGfWtbpWa8wG2+UaFG
 Wbf3VWY+QFfB2gKjbjD04mhHLKRsSdyOvyOH8vkZerw3CqkJsE6JLcWb24lihuUyQfqf
 bywmfvsEwxTSAWs3iovDu4FwQ3Yi0jB4uy93rw1jv+U3Nvm73W1mG6w4BTVT13cUn9tK
 dZDlwGfSsYaI7CG2Yia6kh0UPjOCjHUSptT/fe7/7GXyyacl03XxIA7TfZtxOGSTcjcJ
 zBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gc9ynDymCC3a3vz7FumAB7zqjSZEd+eT6DKBS2/xfx8=;
 b=ZB8bQUPoCQcBZc1S/ShNGUg1jbIFKryw4XIT2axrK7hKc+mx+1IE23a2NZaZAHIkUr
 1vh7crRV58fu4DlN0uAEh3pCKm8/tOSgKPuGWAtkzPSPNsR6Uu6W3ZzcZjza6GatConO
 2mzHnaKhroUwH2urkmF79XtS5+iRGTeJPJsHME9kVjoNXgK+T0YbzNqfl0njpajZkEOu
 2akKAUBIlxRAQS4b9oxlplCBnQReA4nhWksC7d0gwZxe1HEJ/NblyCg/AMKho0W8TUOP
 lmQBy11I2zWrhgsez7XxE6FC3sDGbWcNpoMqa6QW/HVCAJbkA2AB/mvXmYvdTpxBCGVS
 hdUA==
X-Gm-Message-State: AOAM533VA4cZAqJ20qEQonyr6z66xqUwMozodZAIJZioS/hps7udoYds
 ikVY2jq3IrRBjh+nfRP+cNk=
X-Google-Smtp-Source: ABdhPJwkYp4C0XK96/4okfdd1KKEBv9s1paeAchmnWIeAIAO5YJy/AjlVz2PhvXaLnurS1zVsegb8g==
X-Received: by 2002:a05:6a00:b96:b029:2aa:d8a8:cd4d with SMTP id
 g22-20020a056a000b96b02902aad8a8cd4dmr27409146pfj.36.1620832909182; 
 Wed, 12 May 2021 08:21:49 -0700 (PDT)
Received: from localhost.localdomain (1-171-3-209.dynamic-ip.hinet.net.
 [1.171.3.209])
 by smtp.gmail.com with ESMTPSA id t133sm228633pgb.0.2021.05.12.08.21.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 08:21:48 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com,
 pavel@ucw.cz, robh+dt@kernel.org
Subject: [PATCH v7 1/4] mfd: rt4831: Adds support for Richtek RT4831
Date: Wed, 12 May 2021 23:21:37 +0800
Message-Id: <1620832900-8347-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
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
 cy_huang@richtek.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

This adds support Richtek RT4831 core. It includes four channel WLED driver
and Display Bias Voltage outputs.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
The RT4831 regulator patches are already on main stream, and can be referred to
9351ab8b0cb6 regulator: rt4831: Adds support for Richtek RT4831 DSV regulator
934b05e81862 regulator: rt4831: Adds DT binding document for Richtek RT4831 DSV regulator

since v6
- Respin the date from 2020 to 2021.
- Rmove the shutdown routine.
- Change the macro OF_MFD_CELL to MFD_CELL_OF.

since v5
- Rename file name from rt4831-core.c to rt4831.c
- Change RICHTEK_VID to RICHTEK_VENDOR_ID.
- Change gpio_desc nameing from 'enable' to 'enable_gpio' in probe.
- Change variable 'val' to the meaningful name 'chip_id'.
- Refine the error log when vendor id is not matched.
- Remove of_match_ptr.

since v2
- Refine Kconfig descriptions.
- Add copyright.
- Refine error logs in probe.
- Refine comment lines in remove and shutdown.
---
 drivers/mfd/Kconfig  |  10 +++++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/rt4831.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/mfd/rt4831.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 5c7f2b1..49e57c9 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1076,6 +1076,16 @@ config MFD_RDC321X
 	  southbridge which provides access to GPIOs and Watchdog using the
 	  southbridge PCI device configuration space.
 
+config MFD_RT4831
+	tristate "Richtek RT4831 four channel WLED and Display Bias Voltage"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  This enables support for the Richtek RT4831 that includes 4 channel
+	  WLED driving and Display Bias Voltage. It's commonly used to provide
+	  power to the LCD display and LCD backlight.
+
 config MFD_RT5033
 	tristate "Richtek RT5033 Power Management IC"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 4f6d2b8..eb42bd4 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -234,6 +234,7 @@ obj-$(CONFIG_MFD_MENF21BMC)	+= menf21bmc.o
 obj-$(CONFIG_MFD_HI6421_PMIC)	+= hi6421-pmic-core.o
 obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
 obj-$(CONFIG_MFD_DLN2)		+= dln2.o
+obj-$(CONFIG_MFD_RT4831)	+= rt4831.o
 obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
 obj-$(CONFIG_MFD_SKY81452)	+= sky81452.o
 
diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
new file mode 100644
index 00000000..b169781
--- /dev/null
+++ b/drivers/mfd/rt4831.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021 Richtek Technology Corp.
+ *
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define RT4831_REG_REVISION	0x01
+#define RT4831_REG_ENABLE	0x08
+#define RT4831_REG_I2CPROT	0x15
+
+#define RICHTEK_VENDOR_ID	0x03
+#define RT4831_VID_MASK		GENMASK(1, 0)
+#define RT4831_RESET_MASK	BIT(7)
+#define RT4831_I2CSAFETMR_MASK	BIT(0)
+
+static const struct mfd_cell rt4831_subdevs[] = {
+	MFD_CELL_OF("rt4831-backlight", NULL, NULL, 0, 0, "richtek,rt4831-backlight"),
+	MFD_CELL_NAME("rt4831-regulator")
+};
+
+static bool rt4831_is_accessible_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= RT4831_REG_REVISION && reg <= RT4831_REG_I2CPROT)
+		return true;
+	return false;
+}
+
+static const struct regmap_config rt4831_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = RT4831_REG_I2CPROT,
+
+	.readable_reg = rt4831_is_accessible_reg,
+	.writeable_reg = rt4831_is_accessible_reg,
+};
+
+static int rt4831_probe(struct i2c_client *client)
+{
+	struct gpio_desc *enable_gpio;
+	struct regmap *regmap;
+	unsigned int chip_id;
+	int ret;
+
+	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(enable_gpio)) {
+		dev_err(&client->dev, "Failed to get 'enable' GPIO\n");
+		return PTR_ERR(enable_gpio);
+	}
+
+	regmap = devm_regmap_init_i2c(client, &rt4831_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(&client->dev, "Failed to initialize regmap\n");
+		return PTR_ERR(regmap);
+	}
+
+	ret = regmap_read(regmap, RT4831_REG_REVISION, &chip_id);
+	if (ret) {
+		dev_err(&client->dev, "Failed to get H/W revision\n");
+		return ret;
+	}
+
+	if ((chip_id & RT4831_VID_MASK) != RICHTEK_VENDOR_ID) {
+		dev_err(&client->dev, "Chip vendor ID 0x%02x not matched\n", chip_id);
+		return -ENODEV;
+	}
+
+	/*
+	 * Used to prevent the abnormal shutdown.
+	 * If SCL/SDA both keep low for one second to reset HW.
+	 */
+	ret = regmap_update_bits(regmap, RT4831_REG_I2CPROT, RT4831_I2CSAFETMR_MASK,
+				 RT4831_I2CSAFETMR_MASK);
+	if (ret) {
+		dev_err(&client->dev, "Failed to enable I2C safety timer\n");
+		return ret;
+	}
+
+	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO, rt4831_subdevs,
+				    ARRAY_SIZE(rt4831_subdevs), NULL, 0, NULL);
+}
+
+static int rt4831_remove(struct i2c_client *client)
+{
+	struct regmap *regmap = dev_get_regmap(&client->dev, NULL);
+
+	/* Disable WLED and DSV outputs */
+	return regmap_update_bits(regmap, RT4831_REG_ENABLE, RT4831_RESET_MASK, RT4831_RESET_MASK);
+}
+
+static const struct of_device_id __maybe_unused rt4831_of_match[] = {
+	{ .compatible = "richtek,rt4831", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt4831_of_match);
+
+static struct i2c_driver rt4831_driver = {
+	.driver = {
+		.name = "rt4831",
+		.of_match_table = rt4831_of_match,
+	},
+	.probe_new = rt4831_probe,
+	.remove = rt4831_remove,
+};
+module_i2c_driver(rt4831_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

