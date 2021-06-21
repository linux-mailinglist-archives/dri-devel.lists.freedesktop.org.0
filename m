Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339333AE417
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E83889DE6;
	Mon, 21 Jun 2021 07:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9E089DE6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:25:08 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id c15so7965629pls.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 00:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lup727rZLbGr3vyVlbClHGUKHLX9fxH8BjtfQEfB8/4=;
 b=aMmsv68lVfYZR82zX+vhWtVfOZjjn/TBWHf4EnveoeT12AUEmHOzYzB/QM6hBDz/FN
 QFCga/+I7XcFJXk8TxJgqeD7DUKO93LTm6xuMyHjfojLMXoZQhvEmGeCVmUTEj09PZzk
 BN4kGoNiKB8ivLG5XzJfJB+xZ52aIAR4AMD/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lup727rZLbGr3vyVlbClHGUKHLX9fxH8BjtfQEfB8/4=;
 b=Yrbzx+m+gPuon5zJBtGmWufyzpchN70G0pE+RuA9XQHzRh2gLuD6wWrdoOwWza3JS6
 9lKy8jMF0W3OfCh3WHXF15fXq/dcwHa7wbMCx6d759T4siMPF77fVdkz/DfjnviQZHSy
 fBXZuC5/nbtlrJi87QMAQCu0zEtu3Y69+7fEarsBMOLY8NMpcodWAtn5YOGqUT9RJjY2
 3pEygKB/k4nTmnoaHnlKaCqZ7Z25pH9txiWyck4qdwji6dT3BC3RhJfgOqLu07NN8b9w
 pUUllph+9J5veKV67GE2iNbmTF9e9qZt2R/kSzbKGJF4JfoyjHBNpXOhHc7AuRCsCL5S
 /vNQ==
X-Gm-Message-State: AOAM5306ofRVw9O4uR1RwBwsCjI2S/0TVp+dHkRKSYxeFH6/tODEVgSG
 oSVzaCTyjeJa8Yize6Zyj7s3rQ==
X-Google-Smtp-Source: ABdhPJzifgqvkvEs04pUMLDheJAy9L6rtD13FLwnanqcAZd8AIuPsznijFvjfR+DvvUqFmz+nLFIbg==
X-Received: by 2002:a17:902:d48b:b029:122:d1b9:7e5a with SMTP id
 c11-20020a170902d48bb0290122d1b97e5amr9985842plg.47.1624260307627; 
 Mon, 21 Jun 2021 00:25:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:139:e97f:a55d:7f66])
 by smtp.gmail.com with ESMTPSA id
 21sm13951294pfh.103.2021.06.21.00.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:25:07 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <t.figa@samsung.com>,
 Fancy Fang <chen.fang@nxp.com>
Subject: [RFC PATCH 4/9] phy: samsung: Add SEC DSIM DPHY driver
Date: Mon, 21 Jun 2021 12:54:19 +0530
Message-Id: <20210621072424.111733-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621072424.111733-1-jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung SEC MIPI DSIM DPHY controller is part of registers
available in SEC MIPI DSIM bridge for NXP's i.MX8M Mini and
Nano Processors.

Add phy driver for it.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/phy/samsung/Kconfig             |   9 +
 drivers/phy/samsung/Makefile            |   1 +
 drivers/phy/samsung/phy-sec-dsim-dphy.c | 236 ++++++++++++++++++++++++
 3 files changed, 246 insertions(+)
 create mode 100644 drivers/phy/samsung/phy-sec-dsim-dphy.c

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index e20d2fcc9fe7..e80d40d1278c 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -103,3 +103,12 @@ config PHY_EXYNOS5250_SATA
 	  Exynos5250 based SoCs.This SerDes/Phy supports SATA 1.5 Gb/s,
 	  SATA 3.0 Gb/s, SATA 6.0 Gb/s speeds. It supports one SATA host
 	  port to accept one SATA device.
+
+config PHY_SEC_DSIM_DPHY
+	tristate "Samsung SEC MIPI DSIM DPHY driver"
+	depends on OF && HAS_IOMEM
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+          Enable this to add support for the SEC MIPI DSIM DPHY as found
+          on NXP's i.MX8M Mini and Nano family of SOCs.
diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
index 3959100fe8a2..4d46c7ec0072 100644
--- a/drivers/phy/samsung/Makefile
+++ b/drivers/phy/samsung/Makefile
@@ -11,3 +11,4 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
 obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
 obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
+obj-$(CONFIG_PHY_SEC_DSIM_DPHY)		+= phy-sec-dsim-dphy.o
diff --git a/drivers/phy/samsung/phy-sec-dsim-dphy.c b/drivers/phy/samsung/phy-sec-dsim-dphy.c
new file mode 100644
index 000000000000..31de4a774b5f
--- /dev/null
+++ b/drivers/phy/samsung/phy-sec-dsim-dphy.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2018 NXP
+ * Copyright (C) 2021 Amarula Solutions(India)
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+
+#define DSI_PHYCTRL_B1			0x00
+#define DSI_PHYCTRL_B2			0x04
+#define DSI_PHYCTRL_M1			0x08
+#define DSI_PHYCTRL_M2			0x0c
+#define DSI_PHYTIMING			0x10
+#define DSI_PHYTIMING1			0x14
+#define DSI_PHYTIMING2			0x18
+
+/* phytiming */
+#define M_TLPXCTL_MASK			GENMASK(15, 8)
+#define M_TLPXCTL(x)			FIELD_PREP(M_TLPXCTL_MASK, (x))
+#define M_THSEXITCTL_MASK		GENMASK(7, 0)
+#define M_THSEXITCTL(x)			FIELD_PREP(M_THSEXITCTL_MASK, (x))
+
+/* phytiming1 */
+#define M_TCLKPRPRCTL_MASK		GENMASK(31, 24)
+#define M_TCLKPRPRCTL(x)		FIELD_PREP(M_TCLKPRPRCTL_MASK, (x))
+#define M_TCLKZEROCTL_MASK		GENMASK(23, 16)
+#define M_TCLKZEROCTL(x)		FIELD_PREP(M_TCLKZEROCTL_MASK, (x))
+#define M_TCLKPOSTCTL_MASK		GENMASK(15, 8)
+#define M_TCLKPOSTCTL(x)		FIELD_PREP(M_TCLKPOSTCTL_MASK, (x))
+#define M_TCLKTRAILCTL_MASK		GENMASK(7, 0)
+#define M_TCLKTRAILCTL(x)		FIELD_PREP(M_TCLKTRAILCTL_MASK, (x))
+
+/* phytiming2 */
+#define M_THSPRPRCTL_MASK		GENMASK(23, 16)
+#define M_THSPRPRCTL(x)			FIELD_PREP(M_THSPRPRCTL_MASK, (x))
+#define M_THSZEROCTL_MASK		GENMASK(15, 8)
+#define M_THSZEROCTL(x)			FIELD_PREP(M_THSZEROCTL_MASK, (x))
+#define M_THSTRAILCTL_MASK		GENMASK(7, 0)
+#define M_THSTRAILCTL(x)		FIELD_PREP(M_THSTRAILCTL_MASK, (x))
+
+struct dsim_dphy_plat_data {
+	unsigned int m_tlpxctl;
+	unsigned int m_thsexitctl;
+	unsigned int m_tclkprprctl;
+	unsigned int m_tclkzeroctl;
+	unsigned int m_tclkpostctl;
+	unsigned int m_tclktrailctl;
+	unsigned int m_thsprprctl;
+	unsigned int m_thszeroctl;
+	unsigned int m_thstrailctl;
+};
+
+struct dsim_dphy {
+	struct regmap *regmap;
+	struct clk *phy_ref_clk;
+	const struct dsim_dphy_plat_data *pdata;
+};
+
+static const struct regmap_config dsim_dphy_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = DSI_PHYTIMING2,
+	.name = "mipi-dphy",
+};
+
+static int dsim_dphy_init(struct phy *phy)
+{
+	struct dsim_dphy *dphy = phy_get_drvdata(phy);
+	const struct dsim_dphy_plat_data *pdata = dphy->pdata;
+	u32 reg;
+
+	/* phytiming */
+	regmap_read(dphy->regmap, DSI_PHYTIMING, &reg);
+
+	reg &= ~M_TLPXCTL_MASK;
+	reg |= M_TLPXCTL(pdata->m_tlpxctl);
+	reg &= ~M_THSEXITCTL_MASK;
+	reg |= M_THSEXITCTL(pdata->m_thsexitctl);
+	regmap_write(dphy->regmap, DSI_PHYTIMING, reg);
+
+	/* phytiming1 */
+	regmap_read(dphy->regmap, DSI_PHYTIMING1, &reg);
+
+	reg &= ~M_TCLKPRPRCTL_MASK;
+	reg |= M_TCLKPRPRCTL(pdata->m_tclkprprctl);
+	reg &= ~M_TCLKZEROCTL_MASK;
+	reg |= M_TCLKZEROCTL(pdata->m_tclkzeroctl);
+	reg &= ~M_TCLKPOSTCTL_MASK;
+	reg |= M_TCLKPOSTCTL(pdata->m_tclkpostctl);
+	reg &= ~M_TCLKTRAILCTL_MASK;
+	reg |= M_TCLKTRAILCTL(pdata->m_tclktrailctl);
+	regmap_write(dphy->regmap, DSI_PHYTIMING1, reg);
+
+	/* phytiming2 */
+	regmap_read(dphy->regmap, DSI_PHYTIMING2, &reg);
+
+	reg &= ~M_THSPRPRCTL_MASK;
+	reg |= M_THSPRPRCTL(pdata->m_thsprprctl);
+	reg &= ~M_THSZEROCTL_MASK;
+	reg |= M_THSZEROCTL(pdata->m_thszeroctl);
+	reg &= ~M_THSTRAILCTL_MASK;
+	reg |= M_THSTRAILCTL(pdata->m_thstrailctl);
+	regmap_write(dphy->regmap, DSI_PHYTIMING2, reg);
+
+	return 0;
+}
+
+static int dsim_dphy_exit(struct phy *phy)
+{
+	return 0;
+}
+
+static int dsim_dphy_power_on(struct phy *phy)
+{
+	struct dsim_dphy *dphy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(dphy->phy_ref_clk);
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
+static int dsim_dphy_power_off(struct phy *phy)
+{
+	struct dsim_dphy *dphy = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(dphy->phy_ref_clk);
+
+	return 0;
+}
+
+static const struct phy_ops dsim_dphy_phy_ops = {
+	.init = dsim_dphy_init,
+	.exit = dsim_dphy_exit,
+	.power_on = dsim_dphy_power_on,
+	.power_off = dsim_dphy_power_off,
+	.owner = THIS_MODULE,
+};
+
+static const struct dsim_dphy_plat_data imx8mm_dphy_plat_data = {
+	/* phytiming */
+	.m_tlpxctl	= 0x06,
+	.m_thsexitctl	= 0x0b,
+	/* phytiming1 */
+	.m_tclkprprctl	= 0x07,
+	.m_tclkzeroctl	= 0x26,
+	.m_tclkpostctl	= 0x0d,
+	.m_tclktrailctl	= 0x08,
+	/* phytimings2 */
+	.m_thsprprctl	= 0x08,
+	.m_thszeroctl	= 0x0d,
+	.m_thstrailctl	= 0x0b,
+};
+
+static const struct of_device_id dsim_dphy_of_match[] = {
+	{
+		.compatible = "fsl,imx8mm-sec-dsim-dphy",
+		.data = &imx8mm_dphy_plat_data,
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, dsim_dphy_of_match);
+
+static int dsim_dphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct phy_provider *phy_provider;
+	struct dsim_dphy *dphy;
+	struct phy *phy;
+	void __iomem *base;
+
+	if (!np)
+		return -ENODEV;
+
+	dphy = devm_kzalloc(dev, sizeof(*dphy), GFP_KERNEL);
+	if (!dphy)
+		return -ENOMEM;
+
+	dphy->pdata = of_device_get_match_data(&pdev->dev);
+	if (!dphy->pdata)
+		return -EINVAL;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	dphy->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					     &dsim_dphy_regmap_config);
+	if (IS_ERR(dphy->regmap)) {
+		dev_err(dev, "failed create the DPHY regmap\n");
+		return PTR_ERR(dphy->regmap);
+	}
+
+	dphy->phy_ref_clk = devm_clk_get(&pdev->dev, "phy_ref");
+	if (IS_ERR(dphy->phy_ref_clk)) {
+		dev_err(dev, "failed to get phy_ref clock\n");
+		return PTR_ERR(dphy->phy_ref_clk);
+	}
+
+	dev_set_drvdata(dev, dphy);
+
+	phy = devm_phy_create(dev, np, &dsim_dphy_phy_ops);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "failed to create phy %ld\n", PTR_ERR(phy));
+		return PTR_ERR(phy);
+	}
+	phy_set_drvdata(phy, dphy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver dsim_dphy_driver = {
+	.probe	= dsim_dphy_probe,
+	.driver = {
+		.name = "sec-dsim-dphy",
+		.of_match_table	= dsim_dphy_of_match,
+	}
+};
+module_platform_driver(dsim_dphy_driver);
+
+MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
+MODULE_DESCRIPTION("Samsung SEC MIPI DSIM DPHY driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

