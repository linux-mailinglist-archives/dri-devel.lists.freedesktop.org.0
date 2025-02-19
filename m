Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA59AA3C10E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6906C10E490;
	Wed, 19 Feb 2025 14:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="UMuALkDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B5C10E806
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140306euoutp01fb5daa3d0671682786b25e02c63b36c1~loPCjb4To1494614946euoutp01J
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250219140306euoutp01fb5daa3d0671682786b25e02c63b36c1~loPCjb4To1494614946euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973786;
 bh=HFzUdkbMg7ULZ/Bptv4WqR1izaUc64oi32t52hIxkRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UMuALkDn7Cbl6AWhHtbrwBC8BkFUt78eiuZCJIoESVxArWCLZz4UVfRey8lLOWXP+
 uLLziQ6ltN5FdLcp2YoNaVVK+ZTlvtoIHI1nWP7HG7CS4TOreWHomEmZT2ohJG9DaD
 uhSKnEnM18whrI9q+7SflVW5w+p4+RJX4KqgAEVY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250219140306eucas1p2f5109aaa21c2815361e8833a15b544f7~loPCO-a_l1358413584eucas1p2G;
 Wed, 19 Feb 2025 14:03:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A7.83.20821.994E5B76; Wed, 19
 Feb 2025 14:03:06 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140305eucas1p26317b54727c68cf069458d270e06d962~loPBws_Wb1971219712eucas1p2F;
 Wed, 19 Feb 2025 14:03:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140305eusmtrp13a12bb5c0d1dcf0b0f76dcb384c2ab1f~loPBv1Y_F2395223952eusmtrp1Y;
 Wed, 19 Feb 2025 14:03:05 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-57-67b5e4992752
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 79.86.19920.994E5B76; Wed, 19
 Feb 2025 14:03:05 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140304eusmtip259883a2a3e0f884864c120997a69f701~loPAbqb8k0642206422eusmtip2L;
 Wed, 19 Feb 2025 14:03:04 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: [PATCH v5 12/21] reset: thead: Add TH1520 reset controller driver
Date: Wed, 19 Feb 2025 15:02:30 +0100
Message-Id: <20250219140239.1378758-13-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1ATVxjl7m52QzS6xAd3aKs1U7QyFRD9cbXKqEPbVWY69VenYqdmYCcg
 EGxCau1DQQgSTFBK+jCASSktgRYQSDJAgSimhIeGRjDCDESmpFUeEhBxqC1QwtLWf+c753zf
 +b47l4+L6skQfpIsnZXLJCliUkBY2//s2aH3WqSRdgnquFeKIctfegr91OLEkMHu5CHPHTOG
 +mZ9JKr+/VcKPWzJJJDbVEKhrPYaEo3qPSSa1nh4qLepmEQzWjtA1plsElXZhyhUM2vA0LfT
 FgKVNTQBlKP+gYdcXW+gIU8HgUZ7NTjK0a9Fi80NFFpw1xKoaNJGIfNEAQ85qt5F2TYdcWAT
 4+tXUczE6CjB3Mx9QjEtT40E06gfohhN4y3A1FWqSWbQ3UwyVzuPMvcvOjCmvuwck13VjjGX
 5iMZX+tdksk3VwLmTtY96h3RMcG+BDYl6SNWHhF9QpA4XCI7ZYr6uK/MSGYAQ1ge4PMhvRv2
 Dh3PAwK+iDYB2G77g+KKJwD6KjUYV8wAeLtDh+eBwOWO+0N1hB+L6HIAXQMyzjQBYIW7f1kg
 6Sg4XG7g+YX1tIqAql8ygb/A6QcAWr3FpN+1jj4C1WNlwI8JOhQ2u6eWsZA+AC3Z9QQXtxna
 btzG/csGLvGtrhDOEgQ7r3iXLfiSJctShPvnQ7pWAPP77BTXGwNrOy2Aw+vgmMO8wr8Iuws1
 K/PT4LDl8cppn8FGjWMFvw4Hnc9Ify5Ob4c1TREcfRDOztsx7u3WwP5HQdwKa+AX1q9xjhbC
 3BwR594Kv9Ro/wt1mqwYhxm4OLxIXAZb9M8do3/uGP3/uUaAV4JgVqlIlbKKnTL2dLhCkqpQ
 yqTh8WmpdWDpX3cvOB43gJKx6fA2gPFBG4B8XLxemHPOLBUJEyRnPmHlaR/IlSmsog28wCfE
 wcJSm0oqoqWSdDaZZU+x8n9VjB8YkoElt36eECvvie5uGDfN3bqeWBzxUmnWRlwcZuuK2nT5
 G1fXgxuWXUElq8f/Vu6JkxHbbMY3yeuqXdWRhs2H0zDv99U1sdYLBv57I/nvfzo7BUWF+5O9
 k+pjx+MjsMAPwQbjws23K2Vbk06OW372DuQqdK8UvDyXcMERiulePW1SvVZ9JTiu5/yqi6u0
 ppgfu7R34/aW+34LIwIe9X2VGXAp8lD+ybeCnnqeqYTyGGe689qR+PPuM9Frdwy2txoUh7+b
 Pkjb61YbH4rCq0/s1bqUtrmB+f3X6qe2qQumsYqAfaaNVd6Rs9s7JhtDfUUb0o/uKauoOpRx
 diRWHD8Tqttd6JWFiQlFomRnGC5XSP4BgygbNkYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xe7ozn2xNN3h5TtbixPVFTBZbf89i
 t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZvGx5x6r
 xeVdc9gsPvceYbTY9rmFzWLtkbvsFuu/zmeyWPhxK4vFkh27GC3aOpexWlw85Wpx994JFouX
 l3uYLdpm8Vv837OD3eLftY0sFrPf7We32PJmIqvF8bXhFi37p7A4yHm8v9HK7vHm5UsWj8Md
 X9g99n5bwOKxc9Zddo+enWcYPTat6mTzuHNtD5vHvJOBHve7jzN5bF5S79Gy9hiTR/9fA4/3
 +66yefRtWcXocan5OnuAUJSeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexoO5eQUrjCquLFnA1sA4X6uLkZNDQsBE4v7dTSxdjFwcQgJLGSWOvdjA
 BJGQkbjW/ZIFwhaW+HOtiw2i6BWjxIPzS5hBEmwCRhIPls9nBbFFBBazSOzdVwlSxCzwllHi
 +syNYN3CAl4Sna+WMILYLAKqEnuufQCzeQUcJLa2bIbaIC+x/+BZoKEcHJxA8X0XpUDCQgL2
 Euf67rNClAtKnJz5BKycGai8eets5gmMArOQpGYhSS1gZFrFKJJaWpybnltsqFecmFtcmpeu
 l5yfu4kRmFy2Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuFtq9+SLsSbklhZlVqUH19UmpNafIjR
 FOjsicxSosn5wPSWVxJvaGZgamhiZmlgamlmrCTO63b5fJqQQHpiSWp2ampBahFMHxMHp1QD
 08yaixyPD6X5v4tV4XpSaFUjFrlmVbpTqL/T/0It2/suT1R3HTqx/N+XmLO3qvXWKOzd/2ar
 XJ+nnIHasR69yjlLP/UvsGy33nTg7erqkyt4/Ip1Ppcv9Pt1cUXd0UXVf9fo2onLn5jQY8D7
 /z7X1Xf2FwP23pGpcbjJOaHx2M1NKb075y3jOdB25FSSTFcby6GWlPe7kpWLjSs+nhCIeyUy
 +dUZ521qmT6lybyTTrBKrZq8+em1IIWTPgder3nAfcZpqrpQ5oHuXLPaggMVdxaey5CePXeV
 qJOkwtSuWwaF02/m2bXOmHPv/bzr5c/99h+Ml36/T0dq4vONb79Lhefdf3h3f6vmjnWLNga8
 js1TYinOSDTUYi4qTgQA5yVj6rcDAAA=
X-CMS-MailID: 20250219140305eucas1p26317b54727c68cf069458d270e06d962
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140305eucas1p26317b54727c68cf069458d270e06d962
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140305eucas1p26317b54727c68cf069458d270e06d962
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140305eucas1p26317b54727c68cf069458d270e06d962@eucas1p2.samsung.com>
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

Add reset controller driver for the T-HEAD TH1520 SoC that manages
hardware reset lines for various subsystems. The driver currently
implements support for GPU reset control, with infrastructure in place
to extend support for NPU and Watchdog Timer resets in future updates.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                  |   1 +
 drivers/reset/Kconfig        |  10 +++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-th1520.c | 141 +++++++++++++++++++++++++++++++++++
 4 files changed, 153 insertions(+)
 create mode 100644 drivers/reset/reset-th1520.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 819686e98214..e4a0a83b4c11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20425,6 +20425,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
+F:	drivers/reset/reset-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5b3abb6db248..fa0943c3d1de 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -272,6 +272,16 @@ config RESET_SUNXI
 	help
 	  This enables the reset driver for Allwinner SoCs.
 
+config RESET_TH1520
+	tristate "T-HEAD 1520 reset controller"
+	depends on ARCH_THEAD || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  This driver provides support for the T-HEAD TH1520 SoC reset controller,
+	  which manages hardware reset lines for SoC components such as the GPU.
+	  Enable this option if you need to control hardware resets on TH1520-based
+	  systems.
+
 config RESET_TI_SCI
 	tristate "TI System Control Interface (TI-SCI) reset driver"
 	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 677c4d1e2632..d6c2774407ae 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
+obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
 obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
 obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
new file mode 100644
index 000000000000..d6816c86ba95
--- /dev/null
+++ b/drivers/reset/reset-th1520.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/reset/thead,th1520-reset.h>
+
+ /* register offset in VOSYS_REGMAP */
+#define TH1520_GPU_RST_CFG		0x0
+#define TH1520_GPU_RST_CFG_MASK		GENMASK(1, 0)
+
+/* register values */
+#define TH1520_GPU_SW_GPU_RST		BIT(0)
+#define TH1520_GPU_SW_CLKGEN_RST	BIT(1)
+
+struct th1520_reset_priv {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+};
+
+struct th1520_reset_map {
+	u32 bit;
+	u32 reg;
+};
+
+static const struct th1520_reset_map th1520_resets[] = {
+	[TH1520_RESET_ID_GPU] = {
+		.bit = TH1520_GPU_SW_GPU_RST,
+		.reg = TH1520_GPU_RST_CFG,
+	},
+	[TH1520_RESET_ID_GPU_CLKGEN] = {
+		.bit = TH1520_GPU_SW_CLKGEN_RST,
+		.reg = TH1520_GPU_RST_CFG,
+	}
+};
+
+static inline struct th1520_reset_priv *
+to_th1520_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct th1520_reset_priv, rcdev);
+}
+
+static int th1520_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
+	const struct th1520_reset_map *reset;
+
+	if (id >= ARRAY_SIZE(th1520_resets))
+		return -EINVAL;
+
+	reset = &th1520_resets[id];
+
+	return regmap_update_bits(priv->map, reset->reg, reset->bit, 0);
+}
+
+static int th1520_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
+	const struct th1520_reset_map *reset;
+
+	if (id >= ARRAY_SIZE(th1520_resets))
+		return -EINVAL;
+
+	reset = &th1520_resets[id];
+
+	return regmap_update_bits(priv->map, reset->reg, reset->bit,
+				  reset->bit);
+}
+
+static const struct reset_control_ops th1520_reset_ops = {
+	.assert	= th1520_reset_assert,
+	.deassert = th1520_reset_deassert,
+};
+
+static const struct regmap_config th1520_reset_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.fast_io = true,
+};
+
+static int th1520_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct th1520_reset_priv *priv;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->map = devm_regmap_init_mmio(dev, base,
+					  &th1520_reset_regmap_config);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	/* Initialize GPU resets to asserted state */
+	ret = regmap_update_bits(priv->map, TH1520_GPU_RST_CFG,
+				 TH1520_GPU_RST_CFG_MASK, 0);
+	if (ret)
+		return ret;
+
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.nr_resets = 2;
+	priv->rcdev.ops = &th1520_reset_ops;
+	priv->rcdev.of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, &priv->rcdev);
+}
+
+static const struct of_device_id th1520_reset_match[] = {
+	{ .compatible = "thead,th1520-reset" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, th1520_reset_match);
+
+static struct platform_driver th1520_reset_driver = {
+	.driver = {
+		.name = "th1520-reset",
+		.of_match_table = th1520_reset_match,
+	},
+	.probe = th1520_reset_probe,
+};
+module_platform_driver(th1520_reset_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("T-HEAD TH1520 SoC reset controller");
+MODULE_LICENSE("GPL");
-- 
2.34.1

