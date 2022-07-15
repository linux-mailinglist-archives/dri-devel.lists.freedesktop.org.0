Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1178257601E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD3114BFEE;
	Fri, 15 Jul 2022 11:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2449214BFEC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:27:10 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id g17so2983124plh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iz1yHTUnPBgwocXDviCRZ3bIk2PlWYQ9pJntR6S0OEs=;
 b=kAjAb5k7l0t9qqlOLpFTaEr3DiJ8oWuygMmxIRptH60n/6E8gtA5aY33Lil24Cdn8z
 6Rrz7yOP4ybO8P2SFKl27Lq+jS43koGdaZCk56bB1ynewGLDYOOU4EeVlwdkJGl1EEgL
 FfSe14u3F3ucCWnK3tqbQGD4PPPLzE+ct1c7O4iOJPSQPGnnIHw7ppYX8miV2E/8/JwL
 DjW4uso/NjBizJB0NaEucU+mrR2GXualjCBR4SXw6tMyw5mphFyBIOTk5RDjkb9CqY9b
 N4iY34vLXdE2wculFHiHVxglJNPebAYYMuE3czxLsOpQDgajDZzb+5cf3h7V8XOGvSJ/
 KMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iz1yHTUnPBgwocXDviCRZ3bIk2PlWYQ9pJntR6S0OEs=;
 b=Z4JF3YQlPUKV7Un6pgwshmvEhs4jrWOWxbDPgPZlYPPr+SCyDGN1sPh2r3DHKgvbPb
 uZHVShyqmPepKLY3QJ962M2Ca37o3Wzh0aoV1E70oKa2+WL8qkeSHkwzCYo9AlVdN4IL
 xvbHh4CQmx2r/mUSm0SiOXDWL6NJapnnsy7r8+ceBvXcPwssUsd6W1ae87kyMQ/GbIrc
 lBaDMg/EhDQh4xu5jkAzmmoxBHHRe/uXbJCqA5pESohurkr/qk7plSwDElrJsbuoFlTk
 qyNkg+NDNoeDhNb87U7ldGIPazoVh5cqTxt1mPPvHoNDr/sKGRfajDTIaMAEiyJmts/o
 Pp3A==
X-Gm-Message-State: AJIora8AUxTkaqXhrvvjQSdadvs2m/dosCeFeu2LNkXjFSFGerTwTX5D
 JeFlx3vrxyDfGnh7jkf6EsSqSTHFeMU=
X-Google-Smtp-Source: AGRyM1tqmQFTBlfOr9O1H2+HhmLsHe9RYXjkBdWJxEgCj/jfr59WRY3t3vhljP/9JRbmPZ8PxtVgcA==
X-Received: by 2002:a17:902:9b8b:b0:16a:14fa:cd27 with SMTP id
 y11-20020a1709029b8b00b0016a14facd27mr13193749plp.86.1657884429779; 
 Fri, 15 Jul 2022 04:27:09 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net.
 [42.72.159.86]) by smtp.gmail.com with ESMTPSA id
 a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:27:09 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v5 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370 tcpci
 driver
Date: Fri, 15 Jul 2022 19:26:02 +0800
Message-Id: <20220715112607.591-9-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
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

From: ChiYuan Huang <cy_huang@richtek.com>

The MT6370 is a highly-integrated smart power management IC, which
includes a single cell Li-Ion/Li-Polymer switching battery charger,
a USB Type-C & Power Delivery (PD) controller, dual Flash LED current
sources, a RGB LED driver, a backlight WLED driver, a display bias
driver and a general LDO for portable devices.

This commit add support for the Type-C & Power Delivery controller in
MediaTek MT6370 IC.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---

v5
- Add comma for the last index of mt6370_reg_init.
- Use dev_err_probe to decrease LOC.
- Use 'dev' variable to make probe function more clean.
- Refine kconfig text.
- Remove both 'else' in set_vbus callback.
- Remove comma for of_device_id if the assigned member is only one.
---
 drivers/usb/typec/tcpm/Kconfig        |  11 ++
 drivers/usb/typec/tcpm/Makefile       |   1 +
 drivers/usb/typec/tcpm/tcpci_mt6370.c | 207 ++++++++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)
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
index 0000000..a08b0ba
--- /dev/null
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -0,0 +1,207 @@
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
+	int irq;
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
+static int mt6370_tcpc_probe(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	platform_set_drvdata(pdev, priv);
+
+	priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->tcpci_data.regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to init regmap\n");
+
+	ret = mt6370_check_vendor_info(priv);
+	if (ret)
+		return ret;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return priv->irq;
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
+	ret = devm_request_threaded_irq(dev, priv->irq, NULL,
+					mt6370_irq_handler, IRQF_ONESHOT,
+					dev_name(dev), priv);
+	if (ret) {
+		tcpci_unregister_port(priv->tcpci);
+		return dev_err_probe(dev, ret, "Failed to allocate irq\n");
+	}
+
+	device_init_wakeup(dev, true);
+	dev_pm_set_wake_irq(dev, priv->irq);
+
+	return 0;
+}
+
+static int mt6370_tcpc_remove(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv = platform_get_drvdata(pdev);
+
+	disable_irq(priv->irq);
+	tcpci_unregister_port(priv->tcpci);
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

