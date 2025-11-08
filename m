Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68FC42383
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2C810E1E2;
	Sat,  8 Nov 2025 01:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="reaRL0QR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E40C10E1CF
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010507euoutp02608f1b6065d2e85a35a3b95166a32026~14okUsFck3059330593euoutp02D;
 Sat,  8 Nov 2025 01:05:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20251108010507euoutp02608f1b6065d2e85a35a3b95166a32026~14okUsFck3059330593euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563907;
 bh=XQe4R4o9WpjBGcKRBUP5XLW7Oh9QUtioXyZiGKxOWWw=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=reaRL0QRtfzSfVw9BoQcuUy/hz2H312EX/4L8iARtztL9e5AWsZEdtyxtJUWWt3+O
 IQNlV33wE/j+Max4IakaPa56664cDmQVf6aunWNDWjcjb4krWyJvV4sZKY+Bh8K0BZ
 U3l0dgp00LYdacsnS0rdHL1IZGCh5AiUnwNEZXas=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010506eucas1p233e03b70f074720a659b5e3862f61905~14ojMin6V1161211612eucas1p2d;
 Sat,  8 Nov 2025 01:05:06 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010504eusmtip212ee682d719b3e6e6c819a3c19a4a346~14oh0FAJw0912409124eusmtip2W;
 Sat,  8 Nov 2025 01:05:04 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:43 +0100
Subject: [PATCH RFC 09/13] soc: starfive: Add jh7110-hdmi-mfd driver
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-jh7110-clean-send-v1-9-06bf43bb76b1@samsung.com>
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
 <conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
 Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
 Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
 <maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
 <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010506eucas1p233e03b70f074720a659b5e3862f61905
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010506eucas1p233e03b70f074720a659b5e3862f61905
X-EPHeader: CA
X-CMS-RootMailID: 20251108010506eucas1p233e03b70f074720a659b5e3862f61905
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010506eucas1p233e03b70f074720a659b5e3862f61905@eucas1p2.samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the MFD parent driver for the monolithic JH7110 HDMI IP block.

This driver binds to the starfive,jh7110-hdmi-mfd node. Its sole
responsibility is to map the entire shared register block, create a
regmap with the correct configuration, and then call
devm_of_platform_populate() to create its hdmi_phy and hdmi_controller
child devices.

The child drivers will retrieve the shared regmap from this parent
driver.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                            |  1 +
 drivers/soc/starfive/Kconfig           | 17 +++++++++
 drivers/soc/starfive/Makefile          |  1 +
 drivers/soc/starfive/jh7110-hdmi-mfd.c | 67 ++++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 74e562a6b57ac9f776c4be2d6f0977c62bc03d46..f1867018ee92fb754689934f6d238f9c9f185161 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24051,6 +24051,7 @@ F:	Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-co
 F:	Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.yaml
 F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
 F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
+F:	drivers/soc/starfive/jh7110-hdmi-mfd.c
 F:	drivers/soc/starfive/jh7110-vout-subsystem.c
 
 STARFIVE JH7110 DPHY RX DRIVER
diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
index 47e82aaaa7e0af9d5c718166601c59c1ca683d3a..e0232988050bd250529e373243f5ae1851b26135 100644
--- a/drivers/soc/starfive/Kconfig
+++ b/drivers/soc/starfive/Kconfig
@@ -21,5 +21,22 @@ config SOC_STARFIVE_JH7110_VOUT_SUBSYSTEM
 	  This is essential for the display hardware to be detected and
 	  to function correctly.
 
+config SOC_STARFIVE_JH7110_HDMI_MFD
+    tristate "StarFive JH7110 HDMI MFD Driver"
+    depends on OF
+    help
+	  This option enables the MFD (Multi-Function Device) parent driver
+	  for the monolithic StarFive JH7110 HDMI peripheral.
+
+	  The JH7110 HDMI IP block contains both the digital controller
+	  (DRM bridge) and the analog PHY (clock/phy provider) logic within
+	  a single shared register space.
+
+	  This MFD driver acts as a wrapper. Its only job is to map the
+	  shared registers and create separate logical child devices
+	  for the "PHY" and the "controller". This is required to
+	  correctly manage resources and break a circular clock dependency
+	  between the PHY and the VOUT clock generator at probe time.
+
 endmenu
 endif
diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Makefile
index 17081cd67635b02f495230b117c9acb691ef33ba..15a4e8ca358f2bfe3ed0d00fea948edac4ccbd75 100644
--- a/drivers/soc/starfive/Makefile
+++ b/drivers/soc/starfive/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_SOC_STARFIVE_JH7110_VOUT_SUBSYSTEM) += jh7110-vout-subsystem.o
+obj-$(CONFIG_SOC_STARFIVE_JH7110_HDMI_MFD) += jh7110-hdmi-mfd.o
diff --git a/drivers/soc/starfive/jh7110-hdmi-mfd.c b/drivers/soc/starfive/jh7110-hdmi-mfd.c
new file mode 100644
index 0000000000000000000000000000000000000000..73f1d58b280d3efb770c2dcf1ac934e7a6a51c64
--- /dev/null
+++ b/drivers/soc/starfive/jh7110-hdmi-mfd.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MFD Driver for StarFive JH7110 HDMI
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * This driver binds to the monolithic HDMI block and creates separate
+ * logical platform devices for the HDMI Controller (bridge) and the
+ * HDMI PHY (clock/phy provider), allowing them to share a single regmap
+ * and breaking the probing circular dependency.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+static const struct regmap_config starfive_hdmi_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.max_register = 0x4000,
+};
+
+static int starfive_hdmi_mfd_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *regs;
+	struct regmap *regmap;
+	int ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	regmap = devm_regmap_init_mmio(dev, regs,
+				       &starfive_hdmi_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to init shared regmap\n");
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		dev_err(dev, "Failed to populate child devices: %d\n", ret);
+
+	return ret;
+}
+
+static const struct of_device_id starfive_hdmi_mfd_of_match[] = {
+	{ .compatible = "starfive,jh7110-hdmi-mfd", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, starfive_hdmi_mfd_of_match);
+
+static struct platform_driver starfive_hdmi_mfd_driver = {
+	.probe = starfive_hdmi_mfd_probe,
+	.driver = {
+		.name = "starfive-hdmi-mfd",
+		.of_match_table = starfive_hdmi_mfd_of_match,
+	},
+};
+module_platform_driver(starfive_hdmi_mfd_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("StarFive JH7110 HDMI MFD Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

