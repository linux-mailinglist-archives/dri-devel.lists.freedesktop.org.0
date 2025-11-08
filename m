Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775B8C42386
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6946A10E1DE;
	Sat,  8 Nov 2025 01:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="f9CRyEIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4DE10E1DA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010505euoutp02e3d04829efe7fa9d34059d0425426368~14oinCaVM3060130601euoutp02C;
 Sat,  8 Nov 2025 01:05:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20251108010505euoutp02e3d04829efe7fa9d34059d0425426368~14oinCaVM3060130601euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563905;
 bh=hoC+SpFDCQo5pWkuwvO82vRS8ka5VBvpG4xMPsQUfao=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=f9CRyEIkegBZkv9ThluR8Vzre0XOVOhPuBWtBwfE0myqvOb+iGj7Tdis3s0OADmVG
 7cWDzSLHCBIIcE+hVFOOwoFP+SHDlZK8Vye2zh5rh0R/982IjjqoKTutJWeVsg2qRO
 IiDxr9TOpazfpO7+bGST9FoYc/10gQ2+GsCJEmHw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010504eucas1p26e8ee9aa88ab75bebd832eaea81720e9~14ohvLBch1200312003eucas1p2Y;
 Sat,  8 Nov 2025 01:05:04 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010503eusmtip2ab84a13253c43f0009a12efd77a8b1dd~14ogV-TN10912409124eusmtip2V;
 Sat,  8 Nov 2025 01:05:03 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:42 +0100
Subject: [PATCH RFC 08/13] soc: starfive: Add jh7110-vout-subsystem driver
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-jh7110-clean-send-v1-8-06bf43bb76b1@samsung.com>
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
X-CMS-MailID: 20251108010504eucas1p26e8ee9aa88ab75bebd832eaea81720e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010504eucas1p26e8ee9aa88ab75bebd832eaea81720e9
X-EPHeader: CA
X-CMS-RootMailID: 20251108010504eucas1p26e8ee9aa88ab75bebd832eaea81720e9
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010504eucas1p26e8ee9aa88ab75bebd832eaea81720e9@eucas1p2.samsung.com>
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

Add the wrapper driver for the StarFive JH7110 VOUT subsystem.

This driver is responsible for managing the shared resources for all
video output devices. It enables the PD_VOUT power domain, enables the
top-level NoC bus clock, and deasserts the main bus reset.

Once these resources are active, it calls of_platform_populate() to
create and probe the child devices (DC8200, VOUTCRG, HDMI MFD) that
reside within this subsystem.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                  |   1 +
 drivers/soc/Kconfig                          |   1 +
 drivers/soc/Makefile                         |   1 +
 drivers/soc/starfive/Kconfig                 |  25 ++++++
 drivers/soc/starfive/Makefile                |   2 +
 drivers/soc/starfive/jh7110-vout-subsystem.c | 117 +++++++++++++++++++++++++++
 6 files changed, 147 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 052876c6538f980f75ff64e78b6ebea460307904..74e562a6b57ac9f776c4be2d6f0977c62bc03d46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24051,6 +24051,7 @@ F:	Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-co
 F:	Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.yaml
 F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
 F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
+F:	drivers/soc/starfive/jh7110-vout-subsystem.c
 
 STARFIVE JH7110 DPHY RX DRIVER
 M:	Jack Zhu <jack.zhu@starfivetech.com>
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb8052c0ac5a6b60bf33fa9c644701bb..b3b01fc38139d98076c14f626a42ae3b7ef7c5d6 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
 source "drivers/soc/sophgo/Kconfig"
+source "drivers/soc/starfive/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb759384f690c2b65a82b3cb451c74..009f85ff891a15e0455f92c5d5a4059d8b1fcd3f 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -30,6 +30,7 @@ obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
+obj-y				+= starfive/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..47e82aaaa7e0af9d5c718166601c59c1ca683d3a
--- /dev/null
+++ b/drivers/soc/starfive/Kconfig
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Starfive SoC drivers
+#
+
+if ARCH_STARFIVE || COMPILE_TEST
+menu "Starfive SoC drivers"
+
+config SOC_STARFIVE_JH7110_VOUT_SUBSYSTEM
+	tristate "StarFive JH7110 VOUT Subsystem Manager"
+	help
+	  Enable this option to support the VOUT (Video Output) subsystem on
+	  the StarFive JH7110 SoC.
+
+	  This driver acts as a parent wrapper for all display related
+	  hardware blocks (DC8200, VOUTCRG, HDMI MFD). Its primary
+	  responsibility is to manage the shared PD_VOUT power domain,
+	  enabling power, clocks, and resets for the entire subsystem
+	  before the individual child drivers are probed.
+
+	  This is essential for the display hardware to be detected and
+	  to function correctly.
+
+endmenu
+endif
diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..17081cd67635b02f495230b117c9acb691ef33ba
--- /dev/null
+++ b/drivers/soc/starfive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SOC_STARFIVE_JH7110_VOUT_SUBSYSTEM) += jh7110-vout-subsystem.o
diff --git a/drivers/soc/starfive/jh7110-vout-subsystem.c b/drivers/soc/starfive/jh7110-vout-subsystem.c
new file mode 100644
index 0000000000000000000000000000000000000000..a67fd1cbac6b97c0c78c5dff444450579beca91d
--- /dev/null
+++ b/drivers/soc/starfive/jh7110-vout-subsystem.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+static void devm_clk_disable_unprepare(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+}
+
+static void devm_reset_control_assert(void *data)
+{
+	struct reset_control *rst = data;
+
+	reset_control_assert(rst);
+}
+
+static int jh7110_vout_subsystem_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk *bus_clk;
+	struct reset_control *bus_rst;
+	int ret;
+
+	bus_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(dev, PTR_ERR(bus_clk), "Failed to get bus clock\n");
+
+	bus_rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(bus_rst))
+		return dev_err_probe(dev, PTR_ERR(bus_rst), "Failed to get bus reset\n");
+
+	pm_runtime_enable(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable power domain: %d\n", ret);
+		pm_runtime_disable(dev);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(bus_clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable bus clock: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	ret = devm_add_action_or_reset(dev, devm_clk_disable_unprepare, bus_clk);
+	if (ret) {
+		dev_err(dev, "Failed to register clk disable action: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	ret = reset_control_deassert(bus_rst);
+	if (ret) {
+		dev_err(dev, "Failed to deassert bus reset: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	ret = devm_add_action_or_reset(dev, devm_reset_control_assert, bus_rst);
+	if (ret) {
+		dev_err(dev, "Failed to register reset assert action: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	dev_info(dev, "VOUT subsystem bus interface is powered on\n");
+
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "Failed to populate child devices: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	return 0;
+
+err_pm_put:
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static void jh7110_vout_subsystem_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id vout_subsystem_of_match[] = {
+	{ .compatible = "starfive,jh7110-vout-subsystem", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, vout_subsystem_of_match);
+
+static struct platform_driver jh7110_vout_subsystem_driver = {
+	.probe = jh7110_vout_subsystem_probe,
+	.remove = jh7110_vout_subsystem_remove,
+	.driver = {
+		.name = "jh7110-vout-subsystem",
+		.of_match_table = vout_subsystem_of_match,
+	},
+};
+module_platform_driver(jh7110_vout_subsystem_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("StarFive JH7110 VOUT Subsystem Manager");
+MODULE_LICENSE("GPL");

-- 
2.34.1

