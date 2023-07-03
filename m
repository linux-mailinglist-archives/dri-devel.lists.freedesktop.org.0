Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08077461F2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 20:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F2E10E229;
	Mon,  3 Jul 2023 18:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E1510E12E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 18:16:04 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb94b1423eso7147258e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688408163; x=1691000163;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yppVVJZsVALQlxVkrk6bRQIocnUZEUf5eYssW3dPax0=;
 b=PZv50YTxGjUL+H8+y3K2oF7zo66LmTqSJu6hiAKLFiYHUK/rL8dgCegUsRvZSU6aZb
 7qPQYy1VJHO+iUZbH3AhD2efLKXlY3TW0iwQplS9vcHTJnHvW+Z8R64jCiA5F61vz9G1
 WhmEqa0kSXyY8hUjHPmZ77CKRVrnuw5YgdvgfrUeh1yhlDZmKedhCpAaN1hrZTu+Pz8p
 KEfS88zX7NkBBNjaAbtesgpC1SS/lbLrH+P5wY/Y2yfj521/HO6XjKRExquhBZCM6Ccl
 Hicz3L0FY4NDGHKt4H1fM7Wk0OGiS1cDuZIrqCkVPh3+ON72N9g0vqXIKteKPJGbZ3lp
 419w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688408163; x=1691000163;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yppVVJZsVALQlxVkrk6bRQIocnUZEUf5eYssW3dPax0=;
 b=hURQCxhgVlHV9P1t5DL1IBtf8yie7z71ChoT10mXKpVkUYhg5zciBjmJtK7fPqTaWt
 3B6hW/XlJdAYvjlnHL2fEimq0hMgOlCQdqoTqaftz2rRh+ZVRnv9pYVW5TzMguNpE/Qd
 b6Gk0UEWLOgMBWcazLbM2T5lWxtOgIGwvB1hV/jdFgINFgOGE4jHHiuk8yQlmwROFGCb
 mdnh3Gax5C5jdlYuLlGT+zje6E+s/zlwdB9Mp9FnAWYa1sgPKxtp9HO2tIfhCs/xv7HO
 XmpCZ1La6pxBfj73hgzWrzgpA5CDQn4qNcYkcoheJKjdy0OMgnNzhx+/n/ZZQxD1vHpJ
 Db6A==
X-Gm-Message-State: ABy/qLZYRBP+N82bqAsXesJs/hTBjCV2gpisCj2vpyhWKoFcztFevVVP
 bnhgK853FbllvSQgAEdL61rmdQ==
X-Google-Smtp-Source: APBJJlGJYrTrFXurxhsL9mUzOD78TanI0VM1Nsoofsh7pHoqjHCkKu+3IWV6L4IPZRhS/K+gEjXUPQ==
X-Received: by 2002:a05:6512:5c4:b0:4fb:8965:7882 with SMTP id
 o4-20020a05651205c400b004fb89657882mr6183156lfo.35.1688408162717; 
 Mon, 03 Jul 2023 11:16:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512390600b004f1383d57ecsm4633034lfu.202.2023.07.03.11.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 11:16:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 03 Jul 2023 20:15:55 +0200
Subject: [PATCH v3 2/4] regulator: Introduce Qualcomm REFGEN regulator driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v3-2-9fbf0e605d23@linaro.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408157; l=6762;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=pjLeGl5c7AIRN3onIFXcWrE2ZGIUzY+F26Ci1naF9rY=;
 b=zyzA+EFWkLUHUvbbwQvhdFMSA9gTAsia8dHBonOdb/FkF5+cpeQWP/+rvMtK/O/Rwchn9ojGB
 RZnwKZYj4I9D0L95uHNsaybSP8e+Ji6wBDU4NWE0b6GCoi+t9PlS/hP
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modern Qualcomm SoCs have a REFGEN (reference voltage generator)
regulator, providing reference voltage to on-chip IP, like PHYs.

Add a driver to support toggling that regulator.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/regulator/Kconfig                 |  11 +++
 drivers/regulator/Makefile                |   1 +
 drivers/regulator/qcom-refgen-regulator.c | 154 ++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 823f8e6e4801..18a05b09406f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -989,6 +989,17 @@ config REGULATOR_PWM
 	  This driver supports PWM controlled voltage regulators. PWM
 	  duty cycle can increase or decrease the voltage.
 
+config REGULATOR_QCOM_REFGEN
+	tristate "Qualcomm REFGEN regulator driver"
+	depends on HAS_IOMEM
+	depends on REGMAP
+	help
+	  This driver supports the MMIO-mapped reference voltage regulator,
+	  used internally by some PHYs on many Qualcomm SoCs.
+
+	  Say M here if you want to include support for this regulator as
+	  a module. The module will be named "qcom-refgen-regulator".
+
 config REGULATOR_QCOM_RPM
 	tristate "Qualcomm RPM regulator driver"
 	depends on MFD_QCOM_RPM
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 15e0d614ff66..4f4589877e81 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
+obj-$(CONFIG_REGULATOR_QCOM_REFGEN) += qcom-refgen-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
new file mode 100644
index 000000000000..656fe330d38f
--- /dev/null
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2017, 2019-2020, The Linux Foundation. All rights reserved.
+// Copyright (c) 2023, Linaro Limited
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+
+#define REFGEN_REG_BIAS_EN		0x08
+#define REFGEN_BIAS_EN_MASK		GENMASK(2, 0)
+ #define REFGEN_BIAS_EN_ENABLE		0x7
+ #define REFGEN_BIAS_EN_DISABLE		0x6
+
+#define REFGEN_REG_BG_CTRL		0x14
+#define REFGEN_BG_CTRL_MASK		GENMASK(2, 1)
+ #define REFGEN_BG_CTRL_ENABLE		0x3
+ #define REFGEN_BG_CTRL_DISABLE		0x2
+
+#define REFGEN_REG_PWRDWN_CTRL5		0x80
+#define REFGEN_PWRDWN_CTRL5_MASK	BIT(0)
+ #define REFGEN_PWRDWN_CTRL5_ENABLE	0x1
+
+static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
+{
+	regmap_update_bits(rdev->regmap, REFGEN_REG_BG_CTRL, REFGEN_BG_CTRL_MASK,
+			   FIELD_PREP(REFGEN_BG_CTRL_MASK, REFGEN_BG_CTRL_ENABLE));
+
+	regmap_write(rdev->regmap, REFGEN_REG_BIAS_EN,
+		     FIELD_PREP(REFGEN_BIAS_EN_MASK, REFGEN_BIAS_EN_ENABLE));
+
+	return 0;
+}
+
+static int qcom_sdm845_refgen_disable(struct regulator_dev *rdev)
+{
+	regmap_write(rdev->regmap, REFGEN_REG_BIAS_EN,
+		     FIELD_PREP(REFGEN_BIAS_EN_MASK, REFGEN_BIAS_EN_DISABLE));
+
+	regmap_update_bits(rdev->regmap, REFGEN_REG_BG_CTRL, REFGEN_BG_CTRL_MASK,
+			   FIELD_PREP(REFGEN_BG_CTRL_MASK, REFGEN_BG_CTRL_DISABLE));
+
+	return 0;
+}
+
+static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
+{
+	u32 val;
+
+	regmap_read(rdev->regmap, REFGEN_REG_BG_CTRL, &val);
+	if (FIELD_GET(REFGEN_BG_CTRL_MASK, val) != REFGEN_BG_CTRL_ENABLE)
+		return 0;
+
+	regmap_read(rdev->regmap, REFGEN_REG_BIAS_EN, &val);
+	if (FIELD_GET(REFGEN_BIAS_EN_MASK, val) != REFGEN_BIAS_EN_ENABLE)
+		return 0;
+
+	return 1;
+}
+
+static struct regulator_desc sdm845_refgen_desc = {
+	.enable_time = 5,
+	.name = "refgen",
+	.owner = THIS_MODULE,
+	.type = REGULATOR_VOLTAGE,
+	.ops = &(const struct regulator_ops) {
+		.enable		= qcom_sdm845_refgen_enable,
+		.disable	= qcom_sdm845_refgen_disable,
+		.is_enabled	= qcom_sdm845_refgen_is_enabled,
+	},
+};
+
+static struct regulator_desc sm8250_refgen_desc = {
+	.enable_reg = REFGEN_REG_PWRDWN_CTRL5,
+	.enable_mask = REFGEN_PWRDWN_CTRL5_MASK,
+	.enable_val = REFGEN_PWRDWN_CTRL5_ENABLE,
+	.disable_val = 0,
+	.enable_time = 5,
+	.name = "refgen",
+	.owner = THIS_MODULE,
+	.type = REGULATOR_VOLTAGE,
+	.ops = &(const struct regulator_ops) {
+		.enable		= regulator_enable_regmap,
+		.disable	= regulator_disable_regmap,
+		.is_enabled	= regulator_is_enabled_regmap,
+	},
+};
+
+static const struct regmap_config qcom_refgen_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+};
+
+static int qcom_refgen_probe(struct platform_device *pdev)
+{
+	struct regulator_init_data *init_data;
+	struct regulator_config config = {};
+	const struct regulator_desc *rdesc;
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+	struct regmap *regmap;
+	void __iomem *base;
+
+	rdesc = of_device_get_match_data(dev);
+	if (!rdesc)
+		return -ENODATA;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &qcom_refgen_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	init_data = of_get_regulator_init_data(dev, dev->of_node, rdesc);
+	if (!init_data)
+		return -ENOMEM;
+
+	config.dev = dev;
+	config.init_data = init_data;
+	config.of_node = dev->of_node;
+	config.regmap = regmap;
+
+	rdev = devm_regulator_register(dev, rdesc, &config);
+	if (IS_ERR(rdev))
+		return PTR_ERR(rdev);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_refgen_match_table[] = {
+	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_refgen_desc },
+	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_refgen_desc },
+	{ }
+};
+
+static struct platform_driver qcom_refgen_driver = {
+	.probe = qcom_refgen_probe,
+	.driver = {
+		.name = "qcom-refgen-regulator",
+		.of_match_table = qcom_refgen_match_table,
+	},
+};
+module_platform_driver(qcom_refgen_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm REFGEN regulator driver");

-- 
2.41.0

