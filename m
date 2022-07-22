Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928257DF6D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 12:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009699343B;
	Fri, 22 Jul 2022 10:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFAB915CE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 10:25:21 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 12so3851752pga.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3FygRN94hy2NquAI6srZNGQ7gC3ht88aI9wfQI91Tw=;
 b=jbUoXdWD7vpccONfMksCrdmD6rasoMffaqtCLkKKYzr7+cI4M6q+q1Ga1xhcUYxH5v
 KqNRr+HpzSctAE6u2c6PBGmjoQtPQnD2w+LdTrvsephwV60R+HRRy++EQXedkIBa/fO9
 sDxkAKRc9XDTfu3tCL22K+U4obIhGBze7g48Aa8dAd8lYVR60SlqvAkAvMce5RYf38oy
 ssVV8/L2Hw9ixANgx21OI8WbeNMptQFuiAAmBReNKFN47RMOdqTGriee7X/bnGWvAjxS
 rtJRpr3CWe28SNnpZiecZ5lXK5ZnhKdpajAsgbI0Xy5LS8xWuee5txU4EoynpUUF7TF0
 S/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3FygRN94hy2NquAI6srZNGQ7gC3ht88aI9wfQI91Tw=;
 b=CGZrya3PXBjEK+sKaxF2Xa0+OkEN1v+nHePYiXxce6L5J1IgmSd8lfR05UoMxuzpkW
 Vvhxax8Nfx2Difb8YQ6oi7lXBNdVPgGe/U10MgnJZQ+eQqAqbm0919gQTYyRY9RzA6eB
 NOCtKxiGiTwmE0OxJG32aX9W3oOdgZ6BHPUNNvrpZoWT6xp64BjDYVRB80IfYjyo4v92
 29QFR7Y7gotpkUFymcIIfmfeQIpBCAgXmgq9LzuMltwMTNkMBN5wTQ4K8cRToIV7CcSA
 +VOqCwyfMhQg7BYDh7n+et9XiyNNJ+j/4Zr0liRM8LfHb5KINxoewGfmUlqUVTgzUWoN
 NmyQ==
X-Gm-Message-State: AJIora8cq0v3k9m2PtydpGh4c/CkH7wUVu5dFyptgGHKOScltm/89KIe
 A3gFl57GG2pdmaZillcrmWE=
X-Google-Smtp-Source: AGRyM1uxGOGMNLeszrd8le6e3RVD8p2H1j4cFMr6N9MYLPTd1GzRk4Dk47EsxvCHU7IokxanOlVf8Q==
X-Received: by 2002:a05:6a02:30d:b0:412:9de2:eb48 with SMTP id
 bn13-20020a056a02030d00b004129de2eb48mr2568814pgb.47.1658485521269; 
 Fri, 22 Jul 2022 03:25:21 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net.
 [42.73.82.239]) by smtp.gmail.com with ESMTPSA id
 h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:25:20 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v6 09/13] iio: adc: mt6370: Add MediaTek MT6370 support
Date: Fri, 22 Jul 2022 18:24:03 +0800
Message-Id: <20220722102407.2205-10-peterwu.pub@gmail.com>
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
 linux-leds@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
driver, display bias voltage supply, one general purpose LDO, and the
USB Type-C & PD controller complies with the latest USB Type-C and PD
standards.

Add a support the MT6370 ADC driver for system monitoring, including
charger current, voltage, and temperature.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

v6
- Using 'struct device *dev = &pdev->dev' in probe()
- Revise the sixth parameter of regmap_read_poll_timeout() by
  replacing '1000' with 'MILLI'
- Revise the units of three macros
  - MT6370_AICR_400MA --> MT6370_AICR_400_mA
  - MT6370_ICHG_500MA --> MT6370_ICHG_500_mA
  - MT6370_ICHG_900MA --> MT6370_ICHG_900_mA
---
 drivers/iio/adc/Kconfig      |  12 ++
 drivers/iio/adc/Makefile     |   1 +
 drivers/iio/adc/mt6370-adc.c | 274 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/iio/adc/mt6370-adc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 48ace74..60bcc28 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -737,6 +737,18 @@ config MEDIATEK_MT6360_ADC
 	  is used in smartphones and tablets and supports a 11 channel
 	  general purpose ADC.
 
+config MEDIATEK_MT6370_ADC
+	tristate "MediaTek MT6370 ADC driver"
+	depends on MFD_MT6370
+	help
+	  Say yes here to enable MediaTek MT6370 ADC support.
+
+	  This ADC driver provides 9 channels for system monitoring (charger
+	  current, voltage, and temperature).
+
+	  This driver can also be built as a module. If so, the module
+	  will be called "mt6370-adc".
+
 config MEDIATEK_MT6577_AUXADC
 	tristate "MediaTek AUXADC driver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 39d806f..0ce285c 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_MCP320X) += mcp320x.o
 obj-$(CONFIG_MCP3422) += mcp3422.o
 obj-$(CONFIG_MCP3911) += mcp3911.o
 obj-$(CONFIG_MEDIATEK_MT6360_ADC) += mt6360-adc.o
+obj-$(CONFIG_MEDIATEK_MT6370_ADC) += mt6370-adc.o
 obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) += mt6577_auxadc.o
 obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
 obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
diff --git a/drivers/iio/adc/mt6370-adc.c b/drivers/iio/adc/mt6370-adc.c
new file mode 100644
index 0000000..c665de9
--- /dev/null
+++ b/drivers/iio/adc/mt6370-adc.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Richtek Technology Corp.
+ *
+ * Author: ChiaEn Wu <chiaen_wu@richtek.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/iio/iio.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/sysfs.h>
+#include <linux/units.h>
+
+#include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
+
+#define MT6370_REG_CHG_CTRL3		0x113 /* AICR */
+#define MT6370_REG_CHG_CTRL7		0x117 /* ICHG */
+#define MT6370_REG_CHG_ADC		0x121
+#define MT6370_REG_ADC_DATA_H		0x14C
+
+#define MT6370_ADC_START_MASK		BIT(0)
+#define MT6370_ADC_IN_SEL_MASK		GENMASK(7, 4)
+#define MT6370_AICR_ICHG_MASK		GENMASK(7, 2)
+
+#define MT6370_AICR_400_mA		0x6
+#define MT6370_ICHG_500_mA		0x4
+#define MT6370_ICHG_900_mA		0x8
+
+#define ADC_CONV_TIME_MS		35
+#define ADC_CONV_POLLING_TIME_US	1000
+
+struct mt6370_adc_data {
+	struct device *dev;
+	struct regmap *regmap;
+	/*
+	 * This mutex lock is for preventing the different ADC channels
+	 * from being read at the same time.
+	 */
+	struct mutex adc_lock;
+};
+
+static int mt6370_adc_read_channel(struct mt6370_adc_data *priv, int chan,
+				   unsigned long addr, int *val)
+{
+	unsigned int reg_val;
+	__be16 be_val;
+	int ret;
+
+	mutex_lock(&priv->adc_lock);
+
+	reg_val = MT6370_ADC_START_MASK |
+		  FIELD_PREP(MT6370_ADC_IN_SEL_MASK, addr);
+	ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, reg_val);
+	if (ret)
+		goto adc_unlock;
+
+	msleep(ADC_CONV_TIME_MS);
+
+	ret = regmap_read_poll_timeout(priv->regmap,
+				       MT6370_REG_CHG_ADC, reg_val,
+				       !(reg_val & MT6370_ADC_START_MASK),
+				       ADC_CONV_POLLING_TIME_US,
+				       ADC_CONV_TIME_MS * MILLI * 3);
+	if (ret) {
+		dev_err(priv->dev, "Failed to read ADC register (%d)\n", ret);
+		goto adc_unlock;
+	}
+
+	ret = regmap_raw_read(priv->regmap, MT6370_REG_ADC_DATA_H,
+			      &be_val, sizeof(be_val));
+	if (ret)
+		goto adc_unlock;
+
+	*val = be16_to_cpu(be_val);
+	ret = IIO_VAL_INT;
+
+adc_unlock:
+	mutex_unlock(&priv->adc_lock);
+
+	return ret;
+}
+
+static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
+				 int chan, int *val1, int *val2)
+{
+	unsigned int reg_val;
+	int ret;
+
+	switch (chan) {
+	case MT6370_CHAN_VBAT:
+	case MT6370_CHAN_VSYS:
+	case MT6370_CHAN_CHG_VDDP:
+		*val1 = 5;
+		return IIO_VAL_INT;
+	case MT6370_CHAN_IBUS:
+		ret = regmap_read(priv->regmap, MT6370_REG_CHG_CTRL3, &reg_val);
+		if (ret)
+			return ret;
+
+		reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
+		if (reg_val < MT6370_AICR_400_mA)
+			*val1 = 3350;
+		else
+			*val1 = 5000;
+
+		*val2 = 100;
+
+		return IIO_VAL_FRACTIONAL;
+	case MT6370_CHAN_IBAT:
+		ret = regmap_read(priv->regmap, MT6370_REG_CHG_CTRL7, &reg_val);
+		if (ret)
+			return ret;
+
+		reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
+		if (reg_val < MT6370_ICHG_500_mA)
+			*val1 = 2375;
+		else if (reg_val >= MT6370_ICHG_500_mA &&
+			 reg_val < MT6370_ICHG_900_mA)
+			*val1 = 2680;
+		else
+			*val1 = 5000;
+
+		*val2 = 100;
+
+		return IIO_VAL_FRACTIONAL;
+	case MT6370_CHAN_VBUSDIV5:
+		*val1 = 25;
+		return IIO_VAL_INT;
+	case MT6370_CHAN_VBUSDIV2:
+		*val1 = 50;
+		return IIO_VAL_INT;
+	case MT6370_CHAN_TS_BAT:
+		*val1 = 25;
+		*val2 = 10000;
+		return IIO_VAL_FRACTIONAL;
+	case MT6370_CHAN_TEMP_JC:
+		*val1 = 2000;
+		return IIO_VAL_FRACTIONAL;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mt6370_adc_read_offset(struct mt6370_adc_data *priv,
+				  int chan, int *val)
+{
+	*val = -20;
+
+	return IIO_VAL_INT;
+}
+
+static int mt6370_adc_read_raw(struct iio_dev *iio_dev,
+			       const struct iio_chan_spec *chan,
+			       int *val, int *val2, long mask)
+{
+	struct mt6370_adc_data *priv = iio_priv(iio_dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		return mt6370_adc_read_channel(priv, chan->channel,
+					       chan->address, val);
+	case IIO_CHAN_INFO_SCALE:
+		return mt6370_adc_read_scale(priv, chan->channel, val, val2);
+	case IIO_CHAN_INFO_OFFSET:
+		return mt6370_adc_read_offset(priv, chan->channel, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] = {
+	[MT6370_CHAN_VBUSDIV5] = "vbusdiv5",
+	[MT6370_CHAN_VBUSDIV2] = "vbusdiv2",
+	[MT6370_CHAN_VSYS] = "vsys",
+	[MT6370_CHAN_VBAT] = "vbat",
+	[MT6370_CHAN_TS_BAT] = "ts_bat",
+	[MT6370_CHAN_IBUS] = "ibus",
+	[MT6370_CHAN_IBAT] = "ibat",
+	[MT6370_CHAN_CHG_VDDP] = "chg_vddp",
+	[MT6370_CHAN_TEMP_JC] = "temp_jc",
+};
+
+static int mt6370_adc_read_label(struct iio_dev *iio_dev,
+				 struct iio_chan_spec const *chan, char *label)
+{
+	return sysfs_emit(label, "%s\n", mt6370_channel_labels[chan->channel]);
+}
+
+static const struct iio_info mt6370_adc_iio_info = {
+	.read_raw = mt6370_adc_read_raw,
+	.read_label = mt6370_adc_read_label,
+};
+
+#define MT6370_ADC_CHAN(_idx, _type, _addr, _extra_info) {	\
+	.type = _type,						\
+	.channel = MT6370_CHAN_##_idx,				\
+	.address = _addr,					\
+	.scan_index = MT6370_CHAN_##_idx,			\
+	.indexed = 1,						\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
+			      BIT(IIO_CHAN_INFO_SCALE) |	\
+			      _extra_info,			\
+}
+
+static const struct iio_chan_spec mt6370_adc_channels[] = {
+	MT6370_ADC_CHAN(VBUSDIV5, IIO_VOLTAGE, 1, 0),
+	MT6370_ADC_CHAN(VBUSDIV2, IIO_VOLTAGE, 2, 0),
+	MT6370_ADC_CHAN(VSYS, IIO_VOLTAGE, 3, 0),
+	MT6370_ADC_CHAN(VBAT, IIO_VOLTAGE, 4, 0),
+	MT6370_ADC_CHAN(TS_BAT, IIO_VOLTAGE, 6, 0),
+	MT6370_ADC_CHAN(IBUS, IIO_CURRENT, 8, 0),
+	MT6370_ADC_CHAN(IBAT, IIO_CURRENT, 9, 0),
+	MT6370_ADC_CHAN(CHG_VDDP, IIO_VOLTAGE, 11, 0),
+	MT6370_ADC_CHAN(TEMP_JC, IIO_TEMP, 12, BIT(IIO_CHAN_INFO_OFFSET)),
+};
+
+static int mt6370_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mt6370_adc_data *priv;
+	struct iio_dev *indio_dev;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to get regmap\n");
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*priv));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	priv = iio_priv(indio_dev);
+	priv->dev = dev;
+	priv->regmap = regmap;
+	mutex_init(&priv->adc_lock);
+
+	ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to reset ADC\n");
+
+	indio_dev->name = "mt6370-adc";
+	indio_dev->info = &mt6370_adc_iio_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = mt6370_adc_channels;
+	indio_dev->num_channels = ARRAY_SIZE(mt6370_adc_channels);
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct of_device_id mt6370_adc_of_id[] = {
+	{ .compatible = "mediatek,mt6370-adc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_adc_of_id);
+
+static struct platform_driver mt6370_adc_driver = {
+	.driver = {
+		.name = "mt6370-adc",
+		.of_match_table = mt6370_adc_of_id,
+	},
+	.probe = mt6370_adc_probe,
+};
+module_platform_driver(mt6370_adc_driver);
+
+MODULE_AUTHOR("ChiaEn Wu <chiaen_wu@richtek.com>");
+MODULE_DESCRIPTION("MT6370 ADC Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

