Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678215484BD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3B610E43A;
	Mon, 13 Jun 2022 11:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA39710E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:13:29 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso2729870pja.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z5uncPv1fQJ6Inryo/Jxe0YJNsHb/4JMV9KCN0gsmWE=;
 b=pd73LQObyyEFqF+IG7iiw4+z8grK7IkliFVN1NI1zCSzrpavh92+1xH08I/6z7cWI2
 DCPEI9Bhi+EC4sBZ3SwlBgFYk2e8i95NAQR+WuhDISBq3/evK394GCwj9fYVtNcPAqb+
 BU83cxUnGezt+QAS7N3S7M1xZRpLdQ/dyg2JYPdExw/ZDrvwrpgrV8Zao8/WFSRg6Ho8
 HSzJ4PXQiu3Im7bXCTRnKT5kJ0fNTLJvkqTXtXqn3XMXlJdH8xcFPhVly/H3Tgtk7nfk
 m9QkQR/GiHRlKD2oZFn20Jt+xkfGt1/+hyL/CeZzCY+VVw+/mylbA1fdtmyOoUqtqGBZ
 aSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z5uncPv1fQJ6Inryo/Jxe0YJNsHb/4JMV9KCN0gsmWE=;
 b=BFpj9Q6nLN+Gk13sGtS8iQZhtPMU5uCnJzg+FLD4TMSPdMNg8rPg9N7rSstqN+8h0i
 oUr8yYO9WVVpQ5C3vSSAj4yY9l5YQc0k0zAppJ4lNqsCYDbukQJOzqonpf9gHj1ZqiHq
 WFIhkC5zeIzFQlroO+FOTEmnHYH0hNrlk2RmUluOXl7Cjq5qkw437VV8TGKpqtuPzTJC
 ppdvzOIOnResStLJEnfzBBzjs0k/82PZ8GMWcJDXNIlobhva7OXIhHmNP4uTqfL61N3s
 mrEEKRFQKKOFK/rBgGmqWrh7gTUxbb2otZBcrO26CS7PnE0g8mFNli+oyVzR4GTWPgT3
 +DLw==
X-Gm-Message-State: AOAM532X6S1holb7CwQxjV1SUEgfvOKZciQh6zuJjR3Hb3kMCAkzdKdN
 UxPw7FdBCFxMfQ+OH0QEBCg=
X-Google-Smtp-Source: ABdhPJxtj+t1BFPIao8PMCTn9jkbOr7kv/Nom62g5b2mpLyeeKbxstkd1RZq4PtIsuHU9LA7HOCilA==
X-Received: by 2002:a17:902:9307:b0:166:41a8:abc0 with SMTP id
 bc7-20020a170902930700b0016641a8abc0mr55428441plb.135.1655118809203; 
 Mon, 13 Jun 2022 04:13:29 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net.
 [42.72.115.109]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 04:13:28 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 10/15] regulator: mt6370: Add mt6370 DisplayBias and VibLDO
 support
Date: Mon, 13 Jun 2022 19:11:41 +0800
Message-Id: <20220613111146.25221-11-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ChiYuan Huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add mt6370 DisplayBias and VibLDO support.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/regulator/Kconfig            |   8 +
 drivers/regulator/Makefile           |   1 +
 drivers/regulator/mt6370-regulator.c | 388 +++++++++++++++++++++++++++
 3 files changed, 397 insertions(+)
 create mode 100644 drivers/regulator/mt6370-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index cbe0f96ca342..dcb6866dab53 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -804,6 +804,14 @@ config REGULATOR_MT6360
 	  2-channel buck with Thermal Shutdown and Overload Protection
 	  6-channel High PSRR and Low Dropout LDO.
 
+config REGULATOR_MT6370
+	tristate "MT6370 SubPMIC Regulator"
+	depends on MFD_MT6370
+	help
+	  Say Y here to enable MT6370 regulator support.
+	  This driver support the control for DisplayBias voltages and one
+	  general purpose LDO which commonly used to drive the vibrator.
+
 config REGULATOR_MT6380
 	tristate "MediaTek MT6380 PMIC"
 	depends on MTK_PMIC_WRAP
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 8d3ee8b6d41d..f1cbff21843e 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6358)	+= mt6358-regulator.o
 obj-$(CONFIG_REGULATOR_MT6359)	+= mt6359-regulator.o
 obj-$(CONFIG_REGULATOR_MT6360) += mt6360-regulator.o
+obj-$(CONFIG_REGULATOR_MT6370) += mt6370-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/mt6370-regulator.c
new file mode 100644
index 000000000000..bc356b4bbf22
--- /dev/null
+++ b/drivers/regulator/mt6370-regulator.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/bits.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+
+enum {
+	MT6370_IDX_DSVBOOST = 0,
+	MT6370_IDX_DSVPOS,
+	MT6370_IDX_DSVNEG,
+	MT6370_IDX_VIBLDO,
+	MT6370_MAX_IDX
+};
+
+#define MT6370_REG_LDO_CFG	0x180
+#define MT6370_REG_LDO_VOUT	0x181
+#define MT6370_REG_DB_CTRL1	0x1B0
+#define MT6370_REG_DB_CTRL2	0x1B1
+#define MT6370_REG_DB_VBST	0x1B2
+#define MT6370_REG_DB_VPOS	0x1B3
+#define MT6370_REG_DB_VNEG	0x1B4
+#define MT6370_REG_LDO_STAT	0x1DC
+#define MT6370_REG_DB_STAT	0x1DF
+
+#define MT6370_LDOOMS_MASK	BIT(7)
+#define MT6370_LDOEN_MASK	BIT(7)
+#define MT6370_LDOVOUT_MASK	GENMASK(3, 0)
+#define MT6370_DBPERD_MASK	(BIT(7) | BIT(4))
+#define MT6370_DBEXTEN_MASK	BIT(0)
+#define MT6370_DBVPOSEN_MASK	BIT(6)
+#define MT6370_DBVPOSDISG_MASK	BIT(5)
+#define MT6370_DBVNEGEN_MASK	BIT(3)
+#define MT6370_DBVNEGDISG_MASK	BIT(2)
+#define MT6370_DBALLON_MASK	(MT6370_DBVPOSEN_MASK | MT6370_DBVNEGEN_MASK)
+#define MT6370_DBSLEW_MASK	GENMASK(7, 6)
+#define MT6370_DBVOUT_MASK	GENMASK(5, 0)
+#define MT6370_LDOOC_EVT_MASK	BIT(7)
+#define MT6370_POSSCP_EVT_MASK	BIT(7)
+#define MT6370_NEGSCP_EVT_MASK	BIT(6)
+#define MT6370_BSTOCP_EVT_MASK	BIT(5)
+#define MT6370_POSOCP_EVT_MASK	BIT(4)
+#define MT6370_NEGOCP_EVT_MASK	BIT(3)
+
+#define MT6370_LDO_MINUV	1600000
+#define MT6370_LDO_STPUV	200000
+#define MT6370_LDO_N_VOLT	13
+#define MT6370_DBVBOOST_MINUV	4000000
+#define MT6370_DBVBOOST_STPUV	50000
+#define MT6370_DBVBOOST_N_VOLT	45
+#define MT6370_DBVOUT_MINUV	4000000
+#define MT6370_DBVOUT_STPUV	50000
+#define MT6370_DBVOUT_N_VOLT	41
+
+struct mt6370_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct regulator_dev *rdev[MT6370_MAX_IDX];
+	bool use_external_ctrl;
+};
+
+static const unsigned int mt6370_vpos_ramp_tbl[] = { 8540, 5840, 4830, 3000 };
+static const unsigned int mt6370_vneg_ramp_tbl[] = { 10090, 6310, 5050, 3150 };
+
+static int mt6370_get_error_flags(struct regulator_dev *rdev,
+				  unsigned int *flags)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	unsigned int stat_reg, stat, rpt_flags = 0;
+	int rid = rdev_get_id(rdev), ret;
+
+	if (rid == MT6370_IDX_VIBLDO)
+		stat_reg = MT6370_REG_LDO_STAT;
+	else
+		stat_reg = MT6370_REG_DB_STAT;
+
+	ret = regmap_read(regmap, stat_reg, &stat);
+	if (ret)
+		return ret;
+
+	switch (rid) {
+	case MT6370_IDX_DSVBOOST:
+		if (stat & MT6370_BSTOCP_EVT_MASK)
+			rpt_flags |= REGULATOR_ERROR_OVER_CURRENT;
+		break;
+	case MT6370_IDX_DSVPOS:
+		if (stat & MT6370_POSSCP_EVT_MASK)
+			rpt_flags |= REGULATOR_ERROR_UNDER_VOLTAGE;
+
+		if (stat & MT6370_POSOCP_EVT_MASK)
+			rpt_flags |= REGULATOR_ERROR_OVER_CURRENT;
+		break;
+	case MT6370_IDX_DSVNEG:
+		if (stat & MT6370_NEGSCP_EVT_MASK)
+			rpt_flags |= REGULATOR_ERROR_UNDER_VOLTAGE;
+
+		if (stat & MT6370_NEGOCP_EVT_MASK)
+			rpt_flags |= REGULATOR_ERROR_OVER_CURRENT;
+		break;
+	default:
+		if (stat & MT6370_LDOOC_EVT_MASK)
+			rpt_flags |= REGULATOR_ERROR_OVER_CURRENT;
+		break;
+	}
+
+	*flags = rpt_flags;
+	return 0;
+}
+
+static const struct regulator_ops mt6370_dbvboost_ops = {
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.get_bypass = regulator_get_bypass_regmap,
+	.set_bypass = regulator_set_bypass_regmap,
+	.get_error_flags = mt6370_get_error_flags,
+};
+
+static const struct regulator_ops mt6370_dbvout_ops = {
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.is_enabled = regulator_is_enabled_regmap,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
+	.set_ramp_delay = regulator_set_ramp_delay_regmap,
+	.get_error_flags = mt6370_get_error_flags,
+};
+
+static const struct regulator_ops mt6370_ldo_ops = {
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.is_enabled = regulator_is_enabled_regmap,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
+	.get_error_flags = mt6370_get_error_flags,
+};
+
+static int mt6370_of_parse_cb(struct device_node *np,
+			      const struct regulator_desc *desc,
+			      struct regulator_config *config)
+{
+	struct mt6370_priv *priv = config->driver_data;
+	struct gpio_desc *enable_gpio;
+	int ret;
+
+	enable_gpio = gpiod_get_from_of_node(np, "enable", 0, GPIOD_OUT_HIGH |
+					     GPIOD_FLAGS_BIT_NONEXCLUSIVE,
+					     desc->name);
+	if (IS_ERR(enable_gpio)) {
+		config->ena_gpiod = NULL;
+		return 0;
+	}
+
+	/*
+	 * RG control by default
+	 * Only if all are using external pin, change all by external control
+	 */
+	if (priv->use_external_ctrl) {
+		ret = regmap_update_bits(priv->regmap, MT6370_REG_DB_CTRL1,
+					 MT6370_DBEXTEN_MASK,
+					 MT6370_DBEXTEN_MASK);
+		if (ret)
+			return ret;
+	}
+
+	config->ena_gpiod = enable_gpio;
+	priv->use_external_ctrl = true;
+	return 0;
+}
+
+static const struct regulator_desc mt6370_regulator_descs[] = {
+	{
+		.name = "mt6370-dsv-vbst",
+		.of_match = of_match_ptr("dsvbst"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = MT6370_IDX_DSVBOOST,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.ops = &mt6370_dbvboost_ops,
+		.min_uV = MT6370_DBVBOOST_MINUV,
+		.uV_step = MT6370_DBVBOOST_STPUV,
+		.n_voltages = MT6370_DBVBOOST_N_VOLT,
+		.vsel_reg = MT6370_REG_DB_VBST,
+		.vsel_mask = MT6370_DBVOUT_MASK,
+		.bypass_reg = MT6370_REG_DB_CTRL1,
+		.bypass_mask = MT6370_DBPERD_MASK,
+		.bypass_val_on = MT6370_DBPERD_MASK,
+	},
+	{
+		.name = "mt6370-dsv-vpos",
+		.of_match = of_match_ptr("dsvpos"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = MT6370_IDX_DSVPOS,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.of_parse_cb = mt6370_of_parse_cb,
+		.ops = &mt6370_dbvout_ops,
+		.min_uV = MT6370_DBVOUT_MINUV,
+		.uV_step = MT6370_DBVOUT_STPUV,
+		.n_voltages = MT6370_DBVOUT_N_VOLT,
+		.vsel_reg = MT6370_REG_DB_VPOS,
+		.vsel_mask = MT6370_DBVOUT_MASK,
+		.enable_reg = MT6370_REG_DB_CTRL2,
+		.enable_mask = MT6370_DBVPOSEN_MASK,
+		.ramp_reg = MT6370_REG_DB_VPOS,
+		.ramp_mask = MT6370_DBSLEW_MASK,
+		.ramp_delay_table = mt6370_vpos_ramp_tbl,
+		.n_ramp_values = ARRAY_SIZE(mt6370_vpos_ramp_tbl),
+		.active_discharge_reg = MT6370_REG_DB_CTRL2,
+		.active_discharge_mask = MT6370_DBVPOSDISG_MASK,
+		.active_discharge_on = MT6370_DBVPOSDISG_MASK,
+	},
+	{
+		.name = "mt6370-dsv-vneg",
+		.of_match = of_match_ptr("dsvneg"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = MT6370_IDX_DSVNEG,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.of_parse_cb = mt6370_of_parse_cb,
+		.ops = &mt6370_dbvout_ops,
+		.min_uV = MT6370_DBVOUT_MINUV,
+		.uV_step = MT6370_DBVOUT_STPUV,
+		.n_voltages = MT6370_DBVOUT_N_VOLT,
+		.vsel_reg = MT6370_REG_DB_VNEG,
+		.vsel_mask = MT6370_DBVOUT_MASK,
+		.enable_reg = MT6370_REG_DB_CTRL2,
+		.enable_mask = MT6370_DBVNEGEN_MASK,
+		.ramp_reg = MT6370_REG_DB_VNEG,
+		.ramp_mask = MT6370_DBSLEW_MASK,
+		.ramp_delay_table = mt6370_vneg_ramp_tbl,
+		.n_ramp_values = ARRAY_SIZE(mt6370_vneg_ramp_tbl),
+		.active_discharge_reg = MT6370_REG_DB_CTRL2,
+		.active_discharge_mask = MT6370_DBVNEGDISG_MASK,
+		.active_discharge_on = MT6370_DBVNEGDISG_MASK,
+	},
+	{
+		.name = "mt6370-vib-ldo",
+		.of_match = of_match_ptr("vibldo"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = MT6370_IDX_VIBLDO,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.ops = &mt6370_ldo_ops,
+		.min_uV = MT6370_LDO_MINUV,
+		.uV_step = MT6370_LDO_STPUV,
+		.n_voltages = MT6370_LDO_N_VOLT,
+		.vsel_reg = MT6370_REG_LDO_VOUT,
+		.vsel_mask = MT6370_LDOVOUT_MASK,
+		.enable_reg = MT6370_REG_LDO_VOUT,
+		.enable_mask = MT6370_LDOEN_MASK,
+		.active_discharge_reg = MT6370_REG_LDO_CFG,
+		.active_discharge_mask = MT6370_LDOOMS_MASK,
+		.active_discharge_on = MT6370_LDOOMS_MASK,
+	}
+};
+
+static irqreturn_t mt6370_scp_handler(int irq, void *data)
+{
+	struct regulator_dev *rdev = data;
+
+	regulator_notifier_call_chain(rdev, REGULATOR_EVENT_UNDER_VOLTAGE,
+				      NULL);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mt6370_ocp_handler(int irq, void *data)
+{
+	struct regulator_dev *rdev = data;
+
+	regulator_notifier_call_chain(rdev, REGULATOR_EVENT_OVER_CURRENT, NULL);
+	return IRQ_HANDLED;
+}
+
+static int mt6370_regulator_irq_register(struct mt6370_priv *priv)
+{
+	struct platform_device *pdev = to_platform_device(priv->dev);
+	static const struct {
+		const char *name;
+		int rid;
+		irq_handler_t handler;
+	} mt6370_irqs[] = {
+		{ "db_vpos_scp", MT6370_IDX_DSVPOS, mt6370_scp_handler },
+		{ "db_vneg_scp", MT6370_IDX_DSVNEG, mt6370_scp_handler },
+		{ "db_vbst_ocp", MT6370_IDX_DSVBOOST, mt6370_ocp_handler },
+		{ "db_vpos_ocp", MT6370_IDX_DSVPOS,  mt6370_ocp_handler },
+		{ "db_vneg_ocp", MT6370_IDX_DSVNEG, mt6370_ocp_handler },
+		{ "ldo_oc", MT6370_IDX_VIBLDO, mt6370_ocp_handler }
+	};
+	struct regulator_dev *rdev;
+	int i, irq, ret;
+
+	for (i = 0; i < ARRAY_SIZE(mt6370_irqs); i++) {
+		irq = platform_get_irq_byname(pdev, mt6370_irqs[i].name);
+
+		rdev = priv->rdev[mt6370_irqs[i].rid];
+
+		ret = devm_request_threaded_irq(priv->dev, irq, NULL,
+						mt6370_irqs[i].handler, 0,
+						mt6370_irqs[i].name, rdev);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to register (%d) interrupt\n", i);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int mt6370_regualtor_register(struct mt6370_priv *priv)
+{
+	struct regulator_dev *rdev;
+	struct regulator_config cfg = {};
+	struct device *parent = priv->dev->parent;
+	int i;
+
+	cfg.dev = parent;
+	cfg.driver_data = priv;
+
+	for (i = 0; i < MT6370_MAX_IDX; i++) {
+		rdev = devm_regulator_register(priv->dev,
+					       mt6370_regulator_descs + i,
+					       &cfg);
+		if (IS_ERR(rdev)) {
+			dev_err(priv->dev,
+				"Failed to register (%d) regulator\n", i);
+			return PTR_ERR(rdev);
+		}
+
+		priv->rdev[i] = rdev;
+	}
+
+	return 0;
+}
+
+static int mt6370_regulator_probe(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->regmap) {
+		dev_err(&pdev->dev, "Failed to init regmap\n");
+		return -ENODEV;
+	}
+
+	ret = mt6370_regualtor_register(priv);
+	if (ret)
+		return ret;
+
+	return mt6370_regulator_irq_register(priv);
+}
+
+static const struct platform_device_id mt6370_devid_table[] = {
+	{ "mt6370-regulator", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(platform, mt6370_devid_table);
+
+static struct platform_driver mt6370_regulator_driver = {
+	.driver = {
+		.name = "mt6370-regulator",
+	},
+	.id_table = mt6370_devid_table,
+	.probe = mt6370_regulator_probe,
+};
+module_platform_driver(mt6370_regulator_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("Mediatek MT6370 Regulator Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

