Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F057DFD6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 12:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9D112BA96;
	Fri, 22 Jul 2022 10:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11E78AFD0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 10:25:41 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 x24-20020a17090ab01800b001f21556cf48so7758597pjq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 03:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SmT4tk5CvET3/UmAAcvAh5ZO+ivhSEGgzHAanm8NBI=;
 b=YviFzn/J4+NZu2ZegFy+pZ1aaHb4xeRX4DvlcijevAJ29+aNgfWHDrPjmfVqcy0XWZ
 ov6mwts1t1+CJKoDHtFqX69M+Mku0fwZtyB0KAXoaC/3CwoqwCApAJHpPPCKeaQ/t7rP
 mzjUgcWR5/FLUQIITLZH5ssqGIOGxa/uYzf3eEpZ/SThX+hrMlhXVSC/R+QWgStAIELa
 UMCxJ6taj3Q3UwuKauYsefBKkgNdURBDPTopGua7NVAR1YoY46axKZjk0m/G5d77Bufl
 dVNl48kB686aIhBpIKbTeaJsLyYCyCF4N72w8qqKURbV7ZR1RugsGRyXh8luIgra3AdR
 HUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SmT4tk5CvET3/UmAAcvAh5ZO+ivhSEGgzHAanm8NBI=;
 b=rSjyhitvoxtbq43DbHyq58x23G9jM6Tf+/p1dL4/t2ClwSxnRDdKA7sASE5iKJh4xp
 OhBtSSvz2OCvBfOsAoZN31k7w3WPo2oJ8H+hEIMlZTmpp5BtFwn1/2Q/q2J5mX5H+goc
 yJBjgH9Fj/yKpWvwWmjq0nJOdixG/oFlifg3cjZNLe1b6qJzsPYABSDg1kIiW/XZEkR3
 EGmf9ckt0psAmHyyj0cvksxP1FY8nh7sam3pUIgOPdM4dXiF2N2GhDcWWWMUJlgpRIlh
 thX/5ajbPHpdWWvLES5uXZniZUZKB6RFo/LsUTB6/vbgfWPNqoxNrbKpHyZaRm51xicu
 shXw==
X-Gm-Message-State: AJIora9yeh8sRGtTV1muv1y/HCEvEmPpC3suonkvimcOjhDjN1kEaxO6
 TDyz+OQb/PhECu/XYlERnaA=
X-Google-Smtp-Source: AGRyM1s1RcVVtts8xXklGCq3AEwBlSPGWpa1vHU9V10pGWoDMpD/heAfpdJyfuipKlIqkF41cIAvLQ==
X-Received: by 2002:a17:902:f78b:b0:168:faff:d6a5 with SMTP id
 q11-20020a170902f78b00b00168faffd6a5mr2885978pln.76.1658485540960; 
 Fri, 22 Jul 2022 03:25:40 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net.
 [42.73.82.239]) by smtp.gmail.com with ESMTPSA id
 h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:25:40 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370 flashlight
 support
Date: Fri, 22 Jul 2022 18:24:06 +0800
Message-Id: <20220722102407.2205-13-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722102407.2205-1-peterwu.pub@gmail.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alice Chen <alice_chen@richtek.com>

The MediaTek MT6370 is a highly-integrated smart power management IC,
which includes a single cell Li-Ion/Li-Polymer switching battery
charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
LED current sources, a RGB LED driver, a backlight WLED driver,
a display bias driver and a general LDO for portable devices.

The Flash LED in MT6370 has 2 channels and support torch/strobe mode.
Add the support of MT6370 FLASH LED.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
---

v6
- Use 'GENMASK' instead of 'BIT'.
- Use dev_err_probe to decrease LOC.
- Use 'dev' variable to make probe function more clean.
- Refine the return of _mt6370_flash_brightness_set function.
- Refine the descriptions.
- Use mt6370_clamp() instead of clamp_align().
- Use device resource managed API for v4l2 flash_release.
---
 drivers/leds/flash/Kconfig             |  12 +
 drivers/leds/flash/Makefile            |   1 +
 drivers/leds/flash/leds-mt6370-flash.c | 633 +++++++++++++++++++++++++++++++++
 3 files changed, 646 insertions(+)
 create mode 100644 drivers/leds/flash/leds-mt6370-flash.c

diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index d3eb689..d5761ed 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -90,4 +90,16 @@ config LEDS_SGM3140
 	  This option enables support for the SGM3140 500mA Buck/Boost Charge
 	  Pump LED Driver.
 
+config LEDS_MT6370_FLASHLIGHT
+	tristate "Flash LED Support for MediaTek MT6370 PMIC"
+	depends on LEDS_CLASS
+	depends on MFD_MT6370
+	help
+	  Support 2 channels and torch/strobe mode.
+	  Say Y here to enable support for
+	  MT6370_FLASH_LED device.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called "leds-mt6370-flash".
+
 endif # LEDS_CLASS_FLASH
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 0acbddc..4c4c171 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
 obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
 obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
+obj-$(CONFIG_LEDS_MT6370_FLASHLIGHT)	+= leds-mt6370-flash.o
diff --git a/drivers/leds/flash/leds-mt6370-flash.c b/drivers/leds/flash/leds-mt6370-flash.c
new file mode 100644
index 0000000..fe439ee
--- /dev/null
+++ b/drivers/leds/flash/leds-mt6370-flash.c
@@ -0,0 +1,633 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Richtek Technology Corp.
+ *
+ * Author: Alice Chen <alice_chen@richtek.com
+ */
+
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/led-class-flash.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include <media/v4l2-flash-led-class.h>
+
+enum {
+	MT6370_LED_FLASH1,
+	MT6370_LED_FLASH2,
+	MT6370_MAX_LEDS
+};
+
+/* Virtual definition for multicolor */
+
+#define MT6370_REG_FLEDEN		0x17E
+#define MT6370_REG_STRBTO		0x173
+#define MT6370_REG_CHGSTAT2		0x1D1
+#define MT6370_REG_FLEDSTAT1		0x1D9
+#define	MT6370_REG_FLEDISTRB(_id)	(0x174 + 4 * _id)
+#define MT6370_REG_FLEDITOR(_id)	(0x175 + 4 * _id)
+#define MT6370_ITORCH_MASK		GENMASK(4, 0)
+#define MT6370_ISTROBE_MASK		GENMASK(6, 0)
+#define MT6370_STRBTO_MASK		GENMASK(6, 0)
+#define MT6370_TORCHEN_MASK		BIT(3)
+#define MT6370_STROBEN_MASK		BIT(2)
+#define MT6370_FLCSEN_MASK(_id)		BIT(MT6370_LED_FLASH2 - _id)
+#define MT6370_FLCSEN_MASK_ALL		GENMASK(1, 0)
+#define MT6370_FLEDCHGVINOVP_MASK	BIT(3)
+#define MT6370_FLED1STRBTO_MASK		BIT(11)
+#define MT6370_FLED2STRBTO_MASK		BIT(10)
+#define MT6370_FLED1STRB_MASK		BIT(9)
+#define MT6370_FLED2STRB_MASK		BIT(8)
+#define MT6370_FLED1SHORT_MASK		BIT(7)
+#define MT6370_FLED2SHORT_MASK		BIT(6)
+#define MT6370_FLEDLVF_MASK		BIT(3)
+
+#define MT6370_LED_JOINT		2
+#define MT6370_RANGE_FLED_REG		4
+#define MT6370_ITORCH_MIN_UA		25000
+#define MT6370_ITORCH_STEP_UA		12500
+#define MT6370_ITORCH_MAX_UA		400000
+#define MT6370_ITORCH_DOUBLE_MAX_UA	800000
+#define MT6370_ISTRB_MIN_UA		50000
+#define MT6370_ISTRB_STEP_UA		12500
+#define MT6370_ISTRB_MAX_UA		1500000
+#define MT6370_ISTRB_DOUBLE_MAX_UA	3000000
+#define MT6370_STRBTO_MIN_US		64000
+#define MT6370_STRBTO_STEP_US		32000
+#define MT6370_STRBTO_MAX_US		2432000
+
+#define STATE_OFF			0
+#define STATE_KEEP			1
+#define STATE_ON			2
+
+#define to_mt6370_led(ptr, member) container_of(ptr, struct mt6370_led, member)
+
+struct mt6370_led {
+	struct led_classdev_flash flash;
+	struct v4l2_flash *v4l2_flash;
+	struct mt6370_priv *priv;
+	u32 led_no;
+	u32 default_state;
+};
+
+struct mt6370_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex lock;
+	unsigned int fled_strobe_used;
+	unsigned int fled_torch_used;
+	unsigned int leds_active;
+	unsigned int leds_count;
+	struct mt6370_led leds[];
+};
+
+static int mt6370_torch_brightness_set(struct led_classdev *lcdev,
+				       enum led_brightness level)
+{
+	struct mt6370_led *led = to_mt6370_led(lcdev, flash.led_cdev);
+	struct mt6370_priv *priv = led->priv;
+	u32 led_enable_mask = (led->led_no == MT6370_LED_JOINT) ?
+			      MT6370_FLCSEN_MASK_ALL :
+			      MT6370_FLCSEN_MASK(led->led_no);
+	u32 enable_mask = MT6370_TORCHEN_MASK | led_enable_mask;
+	u32 val = level ? led_enable_mask : 0;
+	u32 prev = priv->fled_torch_used, curr;
+	int ret, i;
+
+	mutex_lock(&priv->lock);
+
+	/*
+	 * Only one set of flash control logic,
+	 * use the flag to avoid strobe is currently used.
+	 */
+	if (priv->fled_strobe_used) {
+		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n",
+			 priv->fled_strobe_used);
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (level)
+		curr = prev | BIT(led->led_no);
+	else
+		curr = prev & ~BIT(led->led_no);
+
+	if (curr)
+		val |= MT6370_TORCHEN_MASK;
+
+	if (level) {
+		level -= 1;
+		if (led->led_no == MT6370_LED_JOINT) {
+			int flevel[MT6370_MAX_LEDS];
+
+			flevel[0] = level / 2;
+			flevel[1] = level - flevel[0];
+			for (i = 0; i < MT6370_MAX_LEDS; i++) {
+				ret = regmap_update_bits(priv->regmap,
+						MT6370_REG_FLEDITOR(i),
+						MT6370_ITORCH_MASK, flevel[i]);
+				if (ret)
+					goto unlock;
+			}
+		} else {
+			ret = regmap_update_bits(priv->regmap,
+					MT6370_REG_FLEDITOR(led->led_no),
+					MT6370_ITORCH_MASK, level);
+			if (ret)
+				goto unlock;
+		}
+	}
+
+	ret = regmap_update_bits(priv->regmap, MT6370_REG_FLEDEN,
+				 enable_mask, val);
+	if (ret)
+		goto unlock;
+
+	priv->fled_torch_used = curr;
+
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int mt6370_flash_brightness_set(struct led_classdev_flash *fl_cdev,
+				       u32 brightness)
+{
+	/*
+	 * Due to the current spike when turning on flash,
+	 * let brightness be kept by the framework.
+	 * This empty function is used to
+	 * prevent led_classdev_flash register ops check failure.
+	 */
+	return 0;
+}
+
+static int _mt6370_flash_brightness_set(struct led_classdev_flash *fl_cdev,
+					u32 brightness)
+{
+	struct mt6370_led *led = to_mt6370_led(fl_cdev, flash);
+	struct mt6370_priv *priv = led->priv;
+	struct led_flash_setting *s = &fl_cdev->brightness;
+	u32 val = (brightness - s->min) / s->step;
+	int ret, i;
+
+	if (led->led_no == MT6370_LED_JOINT) {
+		int flevel[MT6370_MAX_LEDS];
+
+		flevel[0] = val / 2;
+		flevel[1] = val - flevel[0];
+		for (i = 0; i < MT6370_MAX_LEDS; i++) {
+			ret = regmap_update_bits(priv->regmap,
+						 MT6370_REG_FLEDISTRB(i),
+						 MT6370_ISTROBE_MASK, flevel[i]);
+			if (ret)
+				return ret;
+		}
+	} else {
+		return regmap_update_bits(priv->regmap,
+					  MT6370_REG_FLEDISTRB(led->led_no),
+					  MT6370_ISTROBE_MASK, val);
+	}
+
+	return 0;
+}
+
+static int mt6370_strobe_set(struct led_classdev_flash *fl_cdev, bool state)
+{
+	struct mt6370_led *led = to_mt6370_led(fl_cdev, flash);
+	struct mt6370_priv *priv = led->priv;
+	struct led_classdev *lcdev = &fl_cdev->led_cdev;
+	struct led_flash_setting *s = &fl_cdev->brightness;
+	u32 led_enable_mask = (led->led_no == MT6370_LED_JOINT) ?
+			      MT6370_FLCSEN_MASK_ALL :
+			      MT6370_FLCSEN_MASK(led->led_no);
+	u32 enable_mask = MT6370_STROBEN_MASK | led_enable_mask;
+	u32 val = state ? led_enable_mask : 0;
+	u32 prev = priv->fled_strobe_used, curr;
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	/*
+	 * Only one set of flash control logic,
+	 * use the flag to avoid torch is currently used
+	 */
+	if (priv->fled_torch_used) {
+		dev_warn(lcdev->dev, "Please disable torch first [0x%x]\n",
+				      priv->fled_torch_used);
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (state)
+		curr = prev | BIT(led->led_no);
+	else
+		curr = prev & ~BIT(led->led_no);
+
+	if (curr)
+		val |= MT6370_STROBEN_MASK;
+
+	ret = regmap_update_bits(priv->regmap, MT6370_REG_FLEDEN, enable_mask,
+				 val);
+	if (ret) {
+		dev_err(lcdev->dev, "[%d] control current source %d fail\n",
+				     led->led_no, state);
+		goto unlock;
+	}
+
+	/*
+	 * If the flash needs to be on,
+	 * config the flash current ramping up to the setting value.
+	 * Else, always recover back to the minimum one.
+	 */
+	ret = _mt6370_flash_brightness_set(fl_cdev, state ? s->val : s->min);
+	if (ret)
+		goto unlock;
+
+	/*
+	 * For the flash to turn on/off, need to wait HW ramping up/down time
+	 * 5ms/500us to prevent the unexpected problem.
+	 */
+	if (!prev && curr)
+		usleep_range(5000, 6000);
+	else if (prev && !curr)
+		udelay(500);
+
+	priv->fled_strobe_used = curr;
+
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int mt6370_strobe_get(struct led_classdev_flash *fl_cdev, bool *state)
+{
+	struct mt6370_led *led = to_mt6370_led(fl_cdev, flash);
+	struct mt6370_priv *priv = led->priv;
+
+	mutex_lock(&priv->lock);
+	*state = !!(priv->fled_strobe_used & BIT(led->led_no));
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int mt6370_timeout_set(struct led_classdev_flash *fl_cdev, u32 timeout)
+{
+	struct mt6370_led *led = to_mt6370_led(fl_cdev, flash);
+	struct mt6370_priv *priv = led->priv;
+	struct led_flash_setting *s = &fl_cdev->timeout;
+	u32 val = (timeout - s->min) / s->step;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = regmap_update_bits(priv->regmap, MT6370_REG_STRBTO,
+				 MT6370_STRBTO_MASK, val);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int mt6370_fault_get(struct led_classdev_flash *fl_cdev, u32 *fault)
+{
+	struct mt6370_led *led = to_mt6370_led(fl_cdev, flash);
+	struct mt6370_priv *priv = led->priv;
+	u16 fled_stat;
+	unsigned int chg_stat, strobe_timeout_mask, fled_short_mask;
+	u32 rfault = 0;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = regmap_read(priv->regmap, MT6370_REG_CHGSTAT2, &chg_stat);
+	if (ret)
+		goto unlock;
+
+	ret = regmap_raw_read(priv->regmap, MT6370_REG_FLEDSTAT1, &fled_stat,
+			      sizeof(fled_stat));
+	if (ret)
+		goto unlock;
+
+	switch (led->led_no) {
+	case MT6370_LED_FLASH1:
+		strobe_timeout_mask = MT6370_FLED1STRBTO_MASK;
+		fled_short_mask = MT6370_FLED1SHORT_MASK;
+		break;
+
+	case MT6370_LED_FLASH2:
+		strobe_timeout_mask = MT6370_FLED2STRBTO_MASK;
+		fled_short_mask = MT6370_FLED2SHORT_MASK;
+		break;
+
+	case MT6370_LED_JOINT:
+		strobe_timeout_mask = MT6370_FLED1STRBTO_MASK |
+				      MT6370_FLED2STRBTO_MASK;
+		fled_short_mask = MT6370_FLED1SHORT_MASK |
+				  MT6370_FLED2SHORT_MASK;
+	}
+
+	if (chg_stat & MT6370_FLEDCHGVINOVP_MASK)
+		rfault |= LED_FAULT_INPUT_VOLTAGE;
+
+	if (fled_stat & strobe_timeout_mask)
+		rfault |= LED_FAULT_TIMEOUT;
+
+	if (fled_stat & fled_short_mask)
+		rfault |= LED_FAULT_SHORT_CIRCUIT;
+
+	if (fled_stat & MT6370_FLEDLVF_MASK)
+		rfault |= LED_FAULT_UNDER_VOLTAGE;
+
+	*fault = rfault;
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static const struct led_flash_ops mt6370_flash_ops = {
+	.flash_brightness_set = mt6370_flash_brightness_set,
+	.strobe_set = mt6370_strobe_set,
+	.strobe_get = mt6370_strobe_get,
+	.timeout_set = mt6370_timeout_set,
+	.fault_get = mt6370_fault_get,
+};
+
+#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
+static int mt6370_flash_external_strobe_set(struct v4l2_flash *v4l2_flash,
+					    bool enable)
+{
+	struct led_classdev_flash *flash = v4l2_flash->fled_cdev;
+	struct mt6370_led *led = to_mt6370_led(flash, flash);
+	struct mt6370_priv *priv = led->priv;
+	u32 mask = (led->led_no == MT6370_LED_JOINT) ? MT6370_FLCSEN_MASK_ALL :
+		   MT6370_FLCSEN_MASK(led->led_no);
+	u32 val = enable ? mask : 0;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = regmap_update_bits(priv->regmap, MT6370_REG_FLEDEN, mask, val);
+	if (ret)
+		goto unlock;
+
+	if (enable)
+		priv->fled_strobe_used |= BIT(led->led_no);
+	else
+		priv->fled_strobe_used &= ~BIT(led->led_no);
+
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static const struct v4l2_flash_ops v4l2_flash_ops = {
+	.external_strobe_set = mt6370_flash_external_strobe_set,
+};
+
+static void mt6370_init_v4l2_flash_config(struct mt6370_led *led,
+					  struct v4l2_flash_config *config)
+{
+	struct led_classdev *lcdev;
+	struct led_flash_setting *s = &config->intensity;
+
+	lcdev = &led->flash.led_cdev;
+
+	s->min = MT6370_ITORCH_MIN_UA;
+	s->step = MT6370_ITORCH_STEP_UA;
+	s->val = s->max = s->min + (lcdev->max_brightness - 1) * s->step;
+
+	config->has_external_strobe = 1;
+	strscpy(config->dev_name, lcdev->dev->kobj.name,
+		sizeof(config->dev_name));
+
+	config->flash_faults = LED_FAULT_SHORT_CIRCUIT | LED_FAULT_TIMEOUT |
+			       LED_FAULT_INPUT_VOLTAGE |
+			       LED_FAULT_UNDER_VOLTAGE;
+}
+#else
+static const struct v4l2_flash_ops v4l2_flash_ops;
+static void mt6370_init_v4l2_flash_config(struct mt6370_led *led,
+					  struct v4l2_flash_config *config)
+{
+}
+#endif
+
+static void mt6370_v4l2_flash_release(void *v4l2_flash)
+{
+	v4l2_flash_release(v4l2_flash);
+}
+
+static int mt6370_led_register(struct device *parent, struct mt6370_led *led,
+				struct led_init_data *init_data)
+{
+	struct v4l2_flash_config v4l2_config = {0};
+	int ret;
+
+	ret = devm_led_classdev_flash_register_ext(parent, &led->flash,
+						   init_data);
+	if (ret)
+		return dev_err_probe(parent, ret,
+				     "Couldn't register flash %d\n", led->led_no);
+
+	mt6370_init_v4l2_flash_config(led, &v4l2_config);
+	led->v4l2_flash = v4l2_flash_init(parent, init_data->fwnode,
+					  &led->flash, &v4l2_flash_ops,
+					  &v4l2_config);
+	if (IS_ERR(led->v4l2_flash))
+		return dev_err_probe(parent, PTR_ERR(led->v4l2_flash),
+				     "Failed to register %d v4l2 sd\n", led->led_no);
+
+	return devm_add_action_or_reset(parent, mt6370_v4l2_flash_release,
+					led->v4l2_flash);
+}
+
+static u32 mt6370_clamp(u32 val, u32 min, u32 max, u32 step)
+{
+	u32 retval;
+
+	retval = clamp_val(val, min, max);
+	if (step > 1)
+		retval = rounddown(retval - min, step) + min;
+
+	return retval;
+}
+
+static int mt6370_init_flash_properties(struct mt6370_led *led,
+					struct led_init_data *init_data)
+{
+	struct led_classdev_flash *flash = &led->flash;
+	struct led_classdev *lcdev = &flash->led_cdev;
+	struct mt6370_priv *priv = led->priv;
+	struct led_flash_setting *s;
+	u32 sources[MT6370_MAX_LEDS];
+	u32 max_uA, val;
+	int i, ret, num;
+
+	num = fwnode_property_count_u32(init_data->fwnode, "led-sources");
+	if (num < 1 || num > MT6370_MAX_LEDS)
+		return dev_err_probe(priv->dev, -EINVAL,
+				     "Not specified or wrong number of led-sources\n");
+
+	ret = fwnode_property_read_u32_array(init_data->fwnode, "led-sources", sources, num);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num; i++) {
+		if (sources[i] >= MT6370_MAX_LEDS)
+			return -EINVAL;
+		if (priv->leds_active & BIT(sources[i]))
+			return -EINVAL;
+		priv->leds_active |= BIT(sources[i]);
+
+	}
+	led->led_no = (num == MT6370_MAX_LEDS) ? MT6370_LED_JOINT :
+		       sources[0];
+
+	max_uA = (num == 2) ? MT6370_ITORCH_DOUBLE_MAX_UA : MT6370_ITORCH_MAX_UA;
+	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp", &val);
+	if (ret) {
+		dev_warn(priv->dev,
+			 "Not specified led-max-microamp, config to the minimum\n");
+		val = MT6370_ITORCH_MIN_UA;
+	} else {
+		val = mt6370_clamp(val, MT6370_ITORCH_MIN_UA, max_uA,
+				  MT6370_ITORCH_STEP_UA);
+	}
+
+	lcdev->max_brightness = (val - MT6370_ITORCH_MIN_UA) /
+				MT6370_ITORCH_STEP_UA + 1;
+	lcdev->brightness_set_blocking = mt6370_torch_brightness_set;
+	lcdev->flags |= LED_DEV_CAP_FLASH;
+
+	max_uA = (num == 2) ? MT6370_ISTRB_DOUBLE_MAX_UA : MT6370_ISTRB_MAX_UA;
+	ret = fwnode_property_read_u32(init_data->fwnode, "flash-max-microamp", &val);
+	if (ret) {
+		dev_warn(priv->dev,
+		   "Not specified flash-max-microamp, config to the minimum\n");
+		val = MT6370_ISTRB_MIN_UA;
+	} else {
+		val = mt6370_clamp(val, MT6370_ISTRB_MIN_UA, max_uA,
+				  MT6370_ISTRB_STEP_UA);
+	}
+
+	s = &flash->brightness;
+	s->min = MT6370_ISTRB_MIN_UA;
+	s->step = MT6370_ISTRB_STEP_UA;
+	s->val = s->max = val;
+
+	/*
+	 * Always configure as min level when off to
+	 * prevent flash current spike
+	 */
+	ret = _mt6370_flash_brightness_set(flash, s->min);
+	if (ret)
+		return ret;
+
+	ret = fwnode_property_read_u32(init_data->fwnode,
+				       "flash-max-timeout-us", &val);
+	if (ret) {
+		dev_warn(priv->dev,
+			 "Not specified flash-max-timeout-us, config to the minimum\n");
+		val = MT6370_STRBTO_MIN_US;
+	} else {
+		val = mt6370_clamp(val, MT6370_STRBTO_MIN_US,
+				   MT6370_STRBTO_MAX_US, MT6370_STRBTO_STEP_US);
+	}
+
+	s = &flash->timeout;
+	s->min = MT6370_STRBTO_MIN_US;
+	s->step = MT6370_STRBTO_STEP_US;
+	s->val = s->max = val;
+
+	flash->ops = &mt6370_flash_ops;
+
+	return 0;
+}
+
+static int mt6370_init_common_properties(struct mt6370_led *led,
+					 struct led_init_data *init_data)
+{
+	const char * const states[] = { "off", "keep", "on" };
+	const char *str = states[STATE_OFF];
+	int ret;
+
+	fwnode_property_read_string(init_data->fwnode, "default-state", &str);
+	ret = match_string(states, ARRAY_SIZE(states), str);
+	if (ret >= 0)
+		led->default_state = ret;
+
+	return 0;
+}
+
+static int mt6370_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mt6370_priv *priv;
+	struct fwnode_handle *child;
+	size_t count;
+	int i = 0, ret;
+
+	count = device_get_child_node_count(dev);
+	if (!count || count > MT6370_MAX_LEDS)
+		return dev_err_probe(dev, -EINVAL,
+		       "No child node or node count over max led number %zu\n", count);
+
+	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->leds_count = count;
+	priv->dev = dev;
+	mutex_init(&priv->lock);
+
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
+
+	device_for_each_child_node(dev, child) {
+		struct mt6370_led *led = priv->leds + i;
+		struct led_init_data init_data = { .fwnode = child, };
+
+		led->priv = priv;
+		ret = mt6370_init_common_properties(led, &init_data);
+		if (ret)
+			return ret;
+
+		ret = mt6370_init_flash_properties(led, &init_data);
+
+		if (ret)
+			return ret;
+
+		ret = mt6370_led_register(dev, led, &init_data);
+		if (ret)
+			return ret;
+
+		i++;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id mt6370_led_of_id[] = {
+	{ .compatible = "mediatek,mt6370-flashlight" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_led_of_id);
+
+static struct platform_driver mt6370_led_driver = {
+	.driver = {
+		.name = "mt6370-flashlight",
+		.of_match_table = mt6370_led_of_id,
+	},
+	.probe = mt6370_led_probe,
+};
+module_platform_driver(mt6370_led_driver);
+
+MODULE_AUTHOR("Alice Chen <alice_chen@richtek.com>");
+MODULE_DESCRIPTION("MT6370 FLASH LED Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

