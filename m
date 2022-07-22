Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8FF57DF6C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 12:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DD793423;
	Fri, 22 Jul 2022 10:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE46293413
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 10:25:14 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 l14-20020a17090a72ce00b001f20ed3c55dso3813782pjk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aiigJnY44QEKuly+adwrOBZ3zq4Ykg20V/ssFghIP8g=;
 b=beJZO+pkjb7ehCszAoaxPdWXd7nC05BkAjf0/IEVDXjBWb98JuigvL3XoGcxDgAYyB
 cz/pvNJvIlhLrBOBxjpzT0kMEzjnF65QRshKTIfncXMJ/+yufrJcORU1D2tQg8Jj4FHc
 1yHyagZ1BvOcxLOsj55oHa7VhimNnYDFrul/tYVzBbmiCPtic11yhnQtdN9XvMaA0mjm
 47ncrZbdr20G6/lEXBAXsB2KRXpxQ4LtthDILBmvGHXQiiEf2JfVX4x3pxHmg7F+nUsv
 tJlp+zVZCmjcz3qKN3wDy1Cc9sGUTcn6rwXQnVjsEEXktlK92QFNCGTITEWelEVGHgXt
 FQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aiigJnY44QEKuly+adwrOBZ3zq4Ykg20V/ssFghIP8g=;
 b=dyOhykeqL8IZOVfaczjtpt2KiwQdERXr1iioCs/QLWRQtsJ3ouQ4LldLLsrGlyt8O4
 S0qbVwvhIZC8SL29ey/4DOMRyaFvHJV6KLtGF08Rm6PblBOxYmJMwUA7+6aoCeRyPP3/
 E2o2lx5mQ31lZy9M2garl7Qz0xksAd96DbhKM/YIMPhD+oVAyqiVcLZNSamX5IHu4yx+
 tq4Mw5/zpQuPHupSU9/VVxFJ7xfB+XvwOvaEqEW5J/iGsvlAkvSmjneOLcLp9PInYcbb
 BRFf2HUwjSH3LIEo0LiuGwPbPt+/PrrwRdd/GB8Im47U/YI3O60Z6t1ii//V70mCat+P
 Bcnw==
X-Gm-Message-State: AJIora+jMjFGDiZGZgWXQR3YfqS/NSXsL51ytkyOWphW/fbTEh563qH6
 uooPldjR05/LTy9xfqU9NwM=
X-Google-Smtp-Source: AGRyM1tscUTHnAFCCpRKJ/RL3PABkL/deCOG0OGoVbFZIjrTUqv0De2bGU/PWSld5UKGhjoALZ7qww==
X-Received: by 2002:a17:902:e750:b0:16c:761:6e96 with SMTP id
 p16-20020a170902e75000b0016c07616e96mr2882367plf.0.1658485514256; 
 Fri, 22 Jul 2022 03:25:14 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net.
 [42.73.82.239]) by smtp.gmail.com with ESMTPSA id
 h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:25:13 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v6 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370 tcpci
 driver
Date: Fri, 22 Jul 2022 18:24:02 +0800
Message-Id: <20220722102407.2205-9-peterwu.pub@gmail.com>
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

From: ChiYuan Huang <cy_huang@richtek.com>

The MediaTek MT6370 is a highly-integrated smart power management IC,
which includes a single cell Li-Ion/Li-Polymer switching battery
charger, a USB Type-C & Power Delivery (PD) controller, dual
Flash LED current sources, a RGB LED driver, a backlight WLED driver,
a display bias driver and a general LDO for portable devices.

Add support for the Type-C & Power Delivery controller in
MediaTek MT6370 IC.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

v6
- Convert tcpci as device resource managed with 'devm_add_action_or_reset' API.
- Refine remvoe callback.
- Refine the commit text from 'This commit add' to 'Add'.
---
 drivers/usb/typec/tcpm/Kconfig        |  11 ++
 drivers/usb/typec/tcpm/Makefile       |   1 +
 drivers/usb/typec/tcpm/tcpci_mt6370.c | 208 ++++++++++++++++++++++++++++++++++
 3 files changed, 220 insertions(+)
 create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 073fd2e..e6b88ca 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -35,6 +35,17 @@ config TYPEC_MT6360
 	  USB Type-C. It works with Type-C Port Controller Manager
 	  to provide USB PD and USB Type-C functionalities.
 
+config TYPEC_TCPCI_MT6370
+	tristate "MediaTek MT6370 Type-C driver"
+	depends on MFD_MT6370
+	help
+	  MediaTek MT6370 is a multi-functional IC that includes
+	  USB Type-C. It works with Type-C Port Controller Manager
+	  to provide USB PD and USB Type-C functionalities.
+
+	  This driver can also be built as a module. The module
+	  will be called "tcpci_mt6370".
+
 config TYPEC_TCPCI_MAXIM
 	tristate "Maxim TCPCI based Type-C chip driver"
 	help
diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
index 7d499f3..906d9dc 100644
--- a/drivers/usb/typec/tcpm/Makefile
+++ b/drivers/usb/typec/tcpm/Makefile
@@ -6,4 +6,5 @@ typec_wcove-y				:= wcove.o
 obj-$(CONFIG_TYPEC_TCPCI)		+= tcpci.o
 obj-$(CONFIG_TYPEC_RT1711H)		+= tcpci_rt1711h.o
 obj-$(CONFIG_TYPEC_MT6360)		+= tcpci_mt6360.o
+obj-$(CONFIG_TYPEC_TCPCI_MT6370)	+= tcpci_mt6370.o
 obj-$(CONFIG_TYPEC_TCPCI_MAXIM)		+= tcpci_maxim.o
diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
new file mode 100644
index 0000000..4f53319
--- /dev/null
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Richtek Technology Corp.
+ *
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_wakeup.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/tcpm.h>
+#include "tcpci.h"
+
+#define MT6370_REG_SYSCTRL8	0x9B
+
+#define MT6370_AUTOIDLE_MASK	BIT(3)
+
+#define MT6370_VENDOR_ID	0x29CF
+#define MT6370_TCPC_DID_A	0x2170
+
+struct mt6370_priv {
+	struct device *dev;
+	struct regulator *vbus;
+	struct tcpci *tcpci;
+	struct tcpci_data tcpci_data;
+};
+
+static const struct reg_sequence mt6370_reg_init[] = {
+	REG_SEQ(0xA0, 0x1, 1000),
+	REG_SEQ(0x81, 0x38, 0),
+	REG_SEQ(0x82, 0x82, 0),
+	REG_SEQ(0xBA, 0xFC, 0),
+	REG_SEQ(0xBB, 0x50, 0),
+	REG_SEQ(0x9E, 0x8F, 0),
+	REG_SEQ(0xA1, 0x5, 0),
+	REG_SEQ(0xA2, 0x4, 0),
+	REG_SEQ(0xA3, 0x4A, 0),
+	REG_SEQ(0xA4, 0x01, 0),
+	REG_SEQ(0x95, 0x01, 0),
+	REG_SEQ(0x80, 0x71, 0),
+	REG_SEQ(0x9B, 0x3A, 1000),
+};
+
+static int mt6370_tcpc_init(struct tcpci *tcpci, struct tcpci_data *data)
+{
+	u16 did;
+	int ret;
+
+	ret = regmap_register_patch(data->regmap, mt6370_reg_init,
+				    ARRAY_SIZE(mt6370_reg_init));
+	if (ret)
+		return ret;
+
+	ret = regmap_raw_read(data->regmap, TCPC_BCD_DEV, &did, sizeof(u16));
+	if (ret)
+		return ret;
+
+	if (did == MT6370_TCPC_DID_A)
+		return regmap_write(data->regmap, TCPC_FAULT_CTRL, 0x80);
+
+	return 0;
+}
+
+static int mt6370_tcpc_set_vconn(struct tcpci *tcpci, struct tcpci_data *data,
+				 bool enable)
+{
+	return regmap_update_bits(data->regmap, MT6370_REG_SYSCTRL8,
+				  MT6370_AUTOIDLE_MASK,
+				  !enable ? MT6370_AUTOIDLE_MASK : 0);
+}
+
+static int mt6370_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data *data,
+				bool source, bool sink)
+{
+	struct mt6370_priv *priv = container_of(data, struct mt6370_priv,
+						tcpci_data);
+	int ret;
+
+	ret = regulator_is_enabled(priv->vbus);
+	if (ret < 0)
+		return ret;
+
+	if (ret && !source)
+		return regulator_disable(priv->vbus);
+
+	if (!ret && source)
+		return regulator_enable(priv->vbus);
+
+	return 0;
+}
+
+static irqreturn_t mt6370_irq_handler(int irq, void *dev_id)
+{
+	struct mt6370_priv *priv = dev_id;
+
+	return tcpci_irq(priv->tcpci);
+}
+
+static int mt6370_check_vendor_info(struct mt6370_priv *priv)
+{
+	struct regmap *regmap = priv->tcpci_data.regmap;
+	u16 vid;
+	int ret;
+
+	ret = regmap_raw_read(regmap, TCPC_VENDOR_ID, &vid, sizeof(u16));
+	if (ret)
+		return ret;
+
+	if (vid != MT6370_VENDOR_ID)
+		return dev_err_probe(priv->dev, -ENODEV,
+				     "Vendor ID not correct 0x%02x\n", vid);
+
+	return 0;
+}
+
+static void mt6370_unregister_tcpci_port(void *tcpci)
+{
+	tcpci_unregister_port(tcpci);
+}
+
+static int mt6370_tcpc_probe(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv;
+	struct device *dev = &pdev->dev;
+	int irq, ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->tcpci_data.regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to init regmap\n");
+
+	ret = mt6370_check_vendor_info(priv);
+	if (ret)
+		return ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get irq\n");
+
+	/* Assign TCPCI feature and ops */
+	priv->tcpci_data.auto_discharge_disconnect = 1;
+	priv->tcpci_data.init = mt6370_tcpc_init;
+	priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
+
+	priv->vbus = devm_regulator_get_optional(dev, "vbus");
+	if (!IS_ERR(priv->vbus))
+		priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
+
+	priv->tcpci = tcpci_register_port(dev, &priv->tcpci_data);
+	if (IS_ERR(priv->tcpci))
+		return dev_err_probe(dev, PTR_ERR(priv->tcpci),
+				     "Failed to register tcpci port\n");
+
+	ret = devm_add_action_or_reset(dev, mt6370_unregister_tcpci_port,
+				       priv->tcpci);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(dev, irq, NULL, mt6370_irq_handler,
+					IRQF_ONESHOT, dev_name(dev), priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to allocate irq\n");
+
+	device_init_wakeup(dev, true);
+	dev_pm_set_wake_irq(dev, irq);
+
+	return 0;
+}
+
+static int mt6370_tcpc_remove(struct platform_device *pdev)
+{
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+
+	return 0;
+}
+
+static const struct of_device_id mt6370_tcpc_devid_table[] = {
+	{ .compatible = "mediatek,mt6370-tcpc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_tcpc_devid_table);
+
+static struct platform_driver mt6370_tcpc_driver = {
+	.driver = {
+		.name = "mt6370-tcpc",
+		.of_match_table = mt6370_tcpc_devid_table,
+	},
+	.probe = mt6370_tcpc_probe,
+	.remove = mt6370_tcpc_remove,
+};
+module_platform_driver(mt6370_tcpc_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("MT6370 USB Type-C Port Controller Interface Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

