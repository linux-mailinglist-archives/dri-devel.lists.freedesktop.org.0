Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40724741666
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 18:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476F610E37B;
	Wed, 28 Jun 2023 16:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E89010E37B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 16:29:53 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b699a2fe86so67814341fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687969791; x=1690561791;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3O7/8dc5GSHiu5z4ltCF1O6EcsodTXplnyycC64HxP8=;
 b=sc7OSEXAmym4AYx+twt7Awti6LbhsI/Tf7SayEzAimJ37RTgR1C+ZvoK5uRqP17Bk+
 6tYC26hJoMwOkRHUddIyXEaYQX+fUzGf8w8efx7xFHwye/PXXZkOBktMWkJ3NKIndTo1
 y041bAS200dAttLn9ORND4RzJWkXrPXu/LCHGso2bukyDVgLqyBf/kxLBGYSKcPQwA/s
 M+UtH55xtE5bcwdvOlHBbumf/rzI0fHyhDXlka3cUtLrLTht5inpM4p0UfkhofDte4eu
 JKtAFbYDB2aoYfCuvszi7kc+KTmlMBSW2RN9U2E7/hEDuKIL7M5v9jDBGamjmUz+c2OF
 bh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687969791; x=1690561791;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3O7/8dc5GSHiu5z4ltCF1O6EcsodTXplnyycC64HxP8=;
 b=FFHgemw10LC5Vi/nGDzQzTukDUphS9uqbLZZ/wsWNa+/7w/U4Iu5hPoku5Ms+MGmof
 AdaRp30ufD3pn1We0yH9EIzh+wK9pVnrQllHLKP2rcGAxBEyAaNT0kHslqzF9J0B4K73
 ydfkN62O9PzDNIt5oxfb2xTy+WZzvPbRkzW99ola4eNi6v1RsqAfsEdHZiOaTaiciIln
 PYwgN96kcxQt9zYxoJWTCooLVYMQd4cr1bEbolyTejOVmPYsMVTVz87sZ3BWk14Usbpi
 0NpgHvgODM4V334cb3zti4TVNipEnsK4CcTbYNOEGfQGk4CHR0aJ82R00bSIgQBklD9U
 xRDQ==
X-Gm-Message-State: AC+VfDxdrNuungt6HXLzbJEjTPYNDUACkv/2lJ1hbuyWoxp68qlXriT8
 +DvNaifbIs3b+l/pFmTtHtL04Q==
X-Google-Smtp-Source: ACHHUZ5q8ETxboNpBER9trv4PZjsbiQVNkYRZRA2DMU/96YNvRV9S7QtW1GTNt4Xr68tMiJYV+mh9A==
X-Received: by 2002:a05:6512:224f:b0:4fb:7b4c:d38c with SMTP id
 i15-20020a056512224f00b004fb7b4cd38cmr6687850lfu.60.1687969790950; 
 Wed, 28 Jun 2023 09:29:50 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a056512049c00b004faeedbb29dsm1678783lfq.64.2023.06.28.09.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 09:29:50 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 18:29:46 +0200
Subject: [PATCH 2/4] regulator: Introduce Qualcomm REFGEN regulator driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v1-2-126e59573eeb@linaro.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
In-Reply-To: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687969785; l=7718;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=cLuCOydeuQxZpxQ1jarab69rCq1J+CL/0LN9pVBus9k=;
 b=z5Dv3I0gno4CqdlcpHcPFnKPKgajDU/Cm6GfWD4HwWQEu7jM2JBafkwMhhhLcdIqbLKnlIadh
 OFbUyw4EO7oCwfSVA179BDOQMJxmnzJzKj8957lrmXV4CEsnJowBbMe
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

This driver is based on the driver available in the downstream msm-5.4
kernel. It's been cleaned up and partly remade to match upstream
standards.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/regulator/Kconfig                 |  10 ++
 drivers/regulator/Makefile                |   1 +
 drivers/regulator/qcom-refgen-regulator.c | 187 ++++++++++++++++++++++++++++++
 3 files changed, 198 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 2c2405024ace..ea5549d62825 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -978,6 +978,16 @@ config REGULATOR_PWM
 	  This driver supports PWM controlled voltage regulators. PWM
 	  duty cycle can increase or decrease the voltage.
 
+config REGULATOR_QCOM_REFGEN
+	tristate "Qualcomm REFGEN regulator driver"
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
index ebfa75379c20..a044ad20e202 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,6 +107,7 @@ obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
+obj-$(CONFIG_REGULATOR_QCOM_REFGEN) += qcom-refgen-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
new file mode 100644
index 000000000000..854ab91f649c
--- /dev/null
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017, 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
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
+ #define REFGEN_BG_CTRL_ENABLE		0x6
+ #define REFGEN_BG_CTRL_DISABLE		0x4
+
+#define REFGEN_REG_PWRDWN_CTRL5		0x80
+#define REFGEN_PWRDWN_CTRL5_MASK	BIT(0)
+ #define REFGEN_PWRDWN_CTRL5_ENABLE	0x1
+ #define REFGEN_PWRDWN_CTRL5_DISABLE	0x0
+
+struct qcom_refgen {
+	struct regulator_desc	rdesc;
+	struct regulator_dev	*rdev;
+	void __iomem		*base;
+};
+
+static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
+
+	regmap_update_bits(vreg->base, REFGEN_REG_BG_CTRL,
+			   REFGEN_BG_CTRL_MASK, REFGEN_BG_CTRL_ENABLE);
+	regmap_write(vreg->base, REFGEN_REG_BIAS_EN, REFGEN_BIAS_EN_ENABLE);
+
+	return 0;
+}
+
+static int qcom_sdm845_refgen_disable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
+
+	regmap_write(vreg->base, REFGEN_REG_BIAS_EN, REFGEN_BIAS_EN_DISABLE);
+	regmap_update_bits(vreg->base, REFGEN_REG_BG_CTRL,
+			   REFGEN_BG_CTRL_MASK, REFGEN_BG_CTRL_DISABLE);
+
+	return 0;
+}
+
+static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
+{
+	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
+	u32 val;
+
+	regmap_read(vreg->base, REFGEN_REG_BG_CTRL, &val);
+	if (FIELD_GET(REFGEN_BG_CTRL_MASK, val) != REFGEN_BG_CTRL_ENABLE)
+		return 0;
+
+	regmap_read(vreg->base, REFGEN_REG_BIAS_EN, &val);
+	if (FIELD_GET(REFGEN_BIAS_EN_MASK, val) != REFGEN_BIAS_EN_ENABLE)
+		return 0;
+
+	return 1;
+}
+
+static const struct regulator_ops sdm845_refgen_ops = {
+	.enable		= qcom_sdm845_refgen_enable,
+	.disable	= qcom_sdm845_refgen_disable,
+	.is_enabled	= qcom_sdm845_refgen_is_enabled,
+};
+
+static int qcom_sm8250_refgen_enable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
+
+	regmap_update_bits(vreg->base, REFGEN_REG_PWRDWN_CTRL5,
+			   REFGEN_PWRDWN_CTRL5_MASK, REFGEN_PWRDWN_CTRL5_ENABLE);
+
+	return 0;
+}
+
+static int qcom_sm8250_refgen_disable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
+
+	regmap_update_bits(vreg->base, REFGEN_REG_PWRDWN_CTRL5,
+			   REFGEN_PWRDWN_CTRL5_MASK, REFGEN_PWRDWN_CTRL5_DISABLE);
+
+	return 0;
+}
+
+static int qcom_sm8250_refgen_is_enabled(struct regulator_dev *rdev)
+{
+	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
+	u32 val;
+
+	regmap_read(vreg->base, REFGEN_REG_PWRDWN_CTRL5, &val);
+
+	return FIELD_GET(REFGEN_PWRDWN_CTRL5_MASK, val) == REFGEN_PWRDWN_CTRL5_ENABLE;
+}
+
+static const struct regulator_ops sm8250_refgen_ops = {
+	.enable		= qcom_sm8250_refgen_enable,
+	.disable	= qcom_sm8250_refgen_disable,
+	.is_enabled	= qcom_sm8250_refgen_is_enabled,
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
+	struct device *dev = &pdev->dev;
+	struct regulator_desc *rdesc;
+	struct qcom_refgen *vreg;
+	void __iomem *base;
+
+	vreg = devm_kzalloc(dev, sizeof(*vreg), GFP_KERNEL);
+	if (!vreg)
+		return -ENOMEM;
+
+	vreg->rdesc.ops = of_device_get_match_data(dev);
+	if (!vreg->rdesc.ops)
+		return -ENODATA;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	vreg->base = devm_regmap_init_mmio(dev, base, &qcom_refgen_regmap_config);
+	if (IS_ERR(vreg->base))
+		return PTR_ERR(vreg->base);
+
+	init_data = of_get_regulator_init_data(dev, dev->of_node, &vreg->rdesc);
+	if (!init_data)
+		return -ENOMEM;
+
+	rdesc = &vreg->rdesc;
+
+	rdesc->name = "refgen";
+	rdesc->owner = THIS_MODULE;
+	rdesc->type = REGULATOR_VOLTAGE;
+	rdesc->enable_time = 5; /* us */
+
+	config.dev = dev;
+	config.init_data = init_data;
+	config.driver_data = vreg;
+	config.of_node = dev->of_node;
+
+	vreg->rdev = devm_regulator_register(dev, rdesc, &config);
+	if (IS_ERR(vreg->rdev))
+		return PTR_ERR(vreg->rdev);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_refgen_match_table[] = {
+	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_refgen_ops },
+	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_refgen_ops },
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

