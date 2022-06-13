Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E285484BC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B26D10E44E;
	Mon, 13 Jun 2022 11:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E3510E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:13:25 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id i64so5444533pfc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QTCg5JULGIw2Y2CEYchomvyXaPsSNLMR9ooYVVdBZ18=;
 b=kNg0gpb7T+dY04BzAtYyXq2+HIvpkAbDBchaIYWDhoiZtEu3v1Z+DsMOvlkC1I+a3g
 rLEzMsVyelWGPy6DDEsYrbKTo4PVegBxZ3CkuFZmEYNJp7RYwNaSVC/Hy4qrWt48db6m
 IIbXRb2ebZ18yUFNzwJMsbWs1rKHF/tdQTOvvEdVPMgeQbUi3aj9UP2dOErQWXF+ZiAf
 DyxqUo1IlaQkqTnIYEw0ht/aday/XhkjFdMTX35dwVmO937VoxwecPfE+gpHCu3TiNpM
 Uwrx8Za0Y/ADNbCF5f0/yNu6mxnmN0Sm2Kmvwlmzp5JsaZVt9aBp60Z/JeGfJiXKnG3J
 91xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QTCg5JULGIw2Y2CEYchomvyXaPsSNLMR9ooYVVdBZ18=;
 b=WRRMRKBnwkOSHFhv8n8I7fRmxOr6zKW8mO8w8+XCR9qYeV8Zb0vo+GjnbM9kpHoDCR
 xmFouTxohmyzRBPnkNfr6brxbA6xcVd9AuEeqOhWQ1lC2f3prqGgJ7oBWB7rWbxb60T5
 8nWD4Y/ioDjz1d3dH8awVuNbX6rb0ASb5F0kqdx+r9AMI8180bdVYj3eyZs/Bf76BEBG
 W2UGv0VIW97/14hqLyvX1cnxChhKPUFkF/H9y2FQPIpa9lGuQMshibpKeOelbi9CRdUq
 0l66qUDiPy3CeSiPSivJBngO4XRTN81Te/tSnxtYz0wCMQUENPPowJoMhIykASbtiHLR
 8qEQ==
X-Gm-Message-State: AOAM530B1JKcXUHn/mZP5pNgSMHrKdfzhEIGbf3C17orWvkXOblvOT0J
 W1i4xR531eWh9yHgldodicM=
X-Google-Smtp-Source: ABdhPJxXJnoij6Y2MFsSw+H5AXvsHhhCiVg0q8CYKWsz5V0iu/CIh0LTGsRUtxkkKC2SrFrXGInexQ==
X-Received: by 2002:a62:1589:0:b0:51b:e99c:8f8f with SMTP id
 131-20020a621589000000b0051be99c8f8fmr50709522pfv.30.1655118804586; 
 Mon, 13 Jun 2022 04:13:24 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net.
 [42.72.115.109]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 04:13:24 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 09/15] usb: typec: tcpci_mt6370: Add Mediatek MT6370 tcpci
 driver
Date: Mon, 13 Jun 2022 19:11:40 +0800
Message-Id: <20220613111146.25221-10-peterwu.pub@gmail.com>
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

Add chip level mt6370 tcpci driver.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/usb/typec/tcpm/Kconfig        |   8 +
 drivers/usb/typec/tcpm/Makefile       |   1 +
 drivers/usb/typec/tcpm/tcpci_mt6370.c | 212 ++++++++++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 557f392fe24d..f4b7363bc7e9 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -35,6 +35,14 @@ config TYPEC_MT6360
 	  USB Type-C. It works with Type-C Port Controller Manager
 	  to provide USB PD and USB Type-C functionalities.
 
+config TYPEC_TCPCI_MT6370
+	tristate "Mediatek MT6370 Type-C driver"
+	depends on MFD_MT6370
+	help
+	  Mediatek MT6370 is a multi-functional IC that includes
+	  USB Type-C. It works with Type-C Port Controller Manager
+	  to provide USB PD and USB Type-C functionalities.
+
 config TYPEC_TCPCI_MAXIM
 	tristate "Maxim TCPCI based Type-C chip driver"
 	help
diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
index 7d499f3569fd..906d9dced8e7 100644
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
index 000000000000..ce7f5e03fd10
--- /dev/null
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
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
+	REG_SEQ(0x9B, 0x3A, 1000)
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
+	if (did == MT6370_TCPC_DID_A) {
+		ret = regmap_write(data->regmap, TCPC_FAULT_CTRL, 0x80);
+		if (ret)
+			return ret;
+	}
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
+		ret = regulator_disable(priv->vbus);
+	else if (!ret && source)
+		ret = regulator_enable(priv->vbus);
+	else
+		ret = 0;
+
+	return ret;
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
+	if (vid != MT6370_VENDOR_ID) {
+		dev_err(priv->dev, "Vendor ID not correct 0x%02x\n", vid);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int mt6370_tcpc_probe(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	platform_set_drvdata(pdev, priv);
+
+	priv->tcpci_data.regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->tcpci_data.regmap) {
+		dev_err(&pdev->dev, "Failed to init regmap\n");
+		return -ENODEV;
+	}
+
+	ret = mt6370_check_vendor_info(priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to check vendor info (%d)\n", ret);
+		return ret;
+	}
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0) {
+		dev_err(&pdev->dev, "Failed to get TCPC irq (%d)\n", priv->irq);
+		return priv->irq;
+	}
+
+	/* Assign TCPCI feature and ops */
+	priv->tcpci_data.auto_discharge_disconnect = 1;
+	priv->tcpci_data.init = mt6370_tcpc_init;
+	priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
+
+	priv->vbus = devm_regulator_get_optional(&pdev->dev, "vbus");
+	if (!IS_ERR(priv->vbus))
+		priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
+
+	priv->tcpci = tcpci_register_port(&pdev->dev, &priv->tcpci_data);
+	if (IS_ERR(priv->tcpci)) {
+		dev_err(&pdev->dev, "Failed to register tcpci port\n");
+		return PTR_ERR(priv->tcpci);
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
+					mt6370_irq_handler, IRQF_ONESHOT,
+					dev_name(&pdev->dev), priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to allocate irq (%d)\n", ret);
+		tcpci_unregister_port(priv->tcpci);
+		return ret;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+	dev_pm_set_wake_irq(&pdev->dev, priv->irq);
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
+	return 0;
+}
+
+static const struct of_device_id mt6370_tcpc_devid_table[] = {
+	{ .compatible = "mediatek,mt6370-tcpc", },
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
2.25.1

