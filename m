Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB97A2127A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CCE10E702;
	Tue, 28 Jan 2025 19:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="BIrWZFyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCFD10E6F9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:39 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194838euoutp024bf96776228da8241c05287309b3eea4~e8wcexe_70773407734euoutp02G
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128194838euoutp024bf96776228da8241c05287309b3eea4~e8wcexe_70773407734euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093718;
 bh=BRfXiCNbDurUVJ5VSr3Gpt82Gc/sxIvyoF9J+yTRQL8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BIrWZFydedBJhM1VcBI5RXYTCSxhm6WlE4McBLrh+ch1Tl9mtFmaSW+jETTkObabZ
 c+aZ6B10QKJoSEQCVSNFs4QcZaQw35D5P4iXg8drpc9S8K9El3U5uokUS0Iayv9d3P
 PIzcSzV+kTa4zZ6YuK+S2/MHkAYbuUealrrT8NYc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194837eucas1p182e641b15a24bd233e61178c4c44d819~e8wb3whYQ1987319873eucas1p1o;
 Tue, 28 Jan 2025 19:48:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2E.A2.20397.59439976; Tue, 28
 Jan 2025 19:48:37 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301~e8wbbZBvK1601016010eucas1p1w;
 Tue, 28 Jan 2025 19:48:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194836eusmtrp234310a698ca7f3b0b403fe837b8080e2~e8wbatirj3008430084eusmtrp2c;
 Tue, 28 Jan 2025 19:48:36 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-da-67993495c733
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F5.BB.19654.49439976; Tue, 28
 Jan 2025 19:48:36 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194835eusmtip15c3f1bbeec8f39b0feab98990e3558e5~e8waCiFjz0819608196eusmtip1L;
 Tue, 28 Jan 2025 19:48:35 +0000 (GMT)
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
Subject: [PATCH v4 09/18] reset: thead: Add TH1520 reset controller driver
Date: Tue, 28 Jan 2025 20:48:07 +0100
Message-Id: <20250128194816.2185326-10-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xbZRz1u/f23lIt3HVk+8SJGTqXEWRsLuaDbWbP5E5idEZcojHa0JvC
 eHS2oGIMDNqSgUUeYZl0YHG8ChlDoFSeowKjgNCNV7sIBVy2lSICHYXhY8yWy3T/nd855/ed
 80s+Pi4ykgH82MQkVp4ojg8iBYSx90/LaxcPFEnD7tu3oT7bFQw1/a2l0NUOC4Z0PRYemhox
 YGhsZZFE1+7dotBsRzqBrPoSCil760jk1E6RyKWZ4qHR1mISLef0AGRcVpGotsdOoboVHYZ+
 cDURqLy5FaDMrEoeGh44iexTfQRyjmpwlKn1Q4/bmym0bq0n0OWFTgoZ5vN5yFx7Bqk6C4kj
 gczibTXFzDudBNN9wU0xHaulBNOitVOMpmUQMA01WSQzaW0nme/7TzPT35gxprE8jVHV9mJM
 7qMwZvH6OMl8a6gBzIjSRr0r+lBwSMLGx37Oyve++akgxth/k3cu8+CXJWWp50Hjvmzgw4f0
 AXh/2EBkAwFfROsB/MfcjXODG8BfhwYpblj2KCYX8WTljmmaxwlVAHZrft90zQNou1pFel0k
 vR/OVOk2XP60moDqG+nAO+C0A0Dj3WKPi8/fSr8FK9pSvAsEvQu2/XSL58VC+gh06fJ4XNxL
 sPPnIdyLfTx8wyM9wXm2wP6iuxsY93iUTZc3ikO6XuBpkUtxyyeg+cbs5kNb4ZzZsMnvgI9b
 dBiHZXCm6QHO4a9hi8a8iQ/CSctfGz1xeg+sa93L0Ufhkn6O8NKQ9oW3/9jCVfCFBcZLOEcL
 4YVMEed+FV7U5PwXatEbN0MZqLROgDywU/vUMdqnjtH+n1sK8BqwnU1WJEhZxeuJ7BehCnGC
 IjlRGhotS2gAnq/9y7p5pRno51yhXQDjgy4A+XiQv/Bjy3dSkVAiTvmKlcs+kSfHs4ou8AKf
 CNouvNKplopoqTiJjWPZc6z8iYrxfQLOY8wH8w/O9DizbWfLD0tmw9LiIqpH92ebhJKaieHu
 Z8UL2xSSkxEDGVhp5L33Zk+nPBRnlb2f55ehjI4KwQTX3hmLs7vN0KUhqh+eXSs9pBrKHeyI
 raCOq1/J0Cwl9w8EzsW8/GNtfk4hNk2v+U5YOz7ru7MjI35XdHPk8+sF/bujJBZVQEhO8HMB
 zySMFVkrSiscSVnyBv1afmSzItUv/NiQeqd9xLBQeSL4sMM3/yNefmPBxKS7zVngaH/D4ZYB
 GeMsqT6+eHPctPh217j/knt3uOlFv1Orkb9FrB/jWQfHbOFle4prKqNXJwu7lVji0VMhjqh0
 vD6NDb8+k8oGBhGKGPG+YFyuEP8LAcK3VkkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xu7pTTGamG1y+YmRx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEvY9vJ86wFbdYVcxfXNTBuNuxi5OSQEDCReHTgPmsXIxeHkMBSRolTX5Yx
 QiRkJK51v2SBsIUl/lzrYoMoesUo0XV+BlgRm4CRxIPl81lBbBGBxSwSe/dVghQxC7xllLg+
 cyNQNweHsICXxNLdlSA1LAKqEru3XwCr5xVwkPg4fwIrxAJ5if0HzzKD2JxA8U1/V4AtFhKw
 l3j0dgYbRL2gxMmZT8DizED1zVtnM09gFJiFJDULSWoBI9MqRpHU0uLc9NxiI73ixNzi0rx0
 veT83E2MwOSy7djPLTsYV776qHeIkYmD8RCjBAezkghv7LkZ6UK8KYmVValF+fFFpTmpxYcY
 TYHunsgsJZqcD0xveSXxhmYGpoYmZpYGppZmxkrivGxXzqcJCaQnlqRmp6YWpBbB9DFxcEo1
 MPF1hh5LzTbdWjNfKqSt9uPCFzwNrmqPz0Tdm3Fck3GG6Jzj8/as/Ny3KMuyVqDr4KMOGROH
 YvnG+/nfLkyy35Tza5rI9LS19Z13XdNUF5SqFnvu5Z8j2rZ37+6CkjnLm9dv+5FiyzqRX/1l
 r5Qi35cz0W3tmptNdvFxl7ZHPt0Z+FFqUbDSrZY/dRMmVYYcvXF45VyOkA77ybNKKz1TORbw
 /Vir2e3os3SVn7YQh8ypbQ29y/eY75LZwR3z30z3zLEnLyZmMq287NOwzCrqpVrs9wenpx8Q
 2rRVhvfvl6Y/GmEy4ifeNUvsMHzId0ph+trolPl/829vX2x67pHpEnVOHmeODQtev7pSIHZy
 UYASS3FGoqEWc1FxIgCCaRZQtwMAAA==
X-CMS-MailID: 20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301@eucas1p1.samsung.com>
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
 drivers/reset/Kconfig        |  10 ++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-th1520.c | 178 +++++++++++++++++++++++++++++++++++
 4 files changed, 190 insertions(+)
 create mode 100644 drivers/reset/reset-th1520.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b4e21d814481..d71b8c68ae48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20352,6 +20352,7 @@ F:	drivers/mailbox/mailbox-th1520.c
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
index 000000000000..48afbc9f1cdd
--- /dev/null
+++ b/drivers/reset/reset-th1520.c
@@ -0,0 +1,178 @@
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
+#define TH1520_GPU_RST_CFG_MASK		GENMASK(2, 0)
+
+/* register values */
+#define TH1520_GPU_SW_GPU_RST		BIT(0)
+#define TH1520_GPU_SW_CLKGEN_RST	BIT(1)
+
+struct th1520_reset_priv {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+	struct mutex gpu_seq_lock;  /* protects gpu assert/deassert sequence */
+};
+
+static inline struct th1520_reset_priv *
+to_th1520_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct th1520_reset_priv, rcdev);
+}
+
+static void th1520_rst_gpu_enable(struct regmap *reg,
+				  struct mutex *gpu_seq_lock)
+{
+	int val;
+
+	mutex_lock(gpu_seq_lock);
+
+	/* if the GPU is not in a reset state it, put it into one */
+	regmap_read(reg, TH1520_GPU_RST_CFG, &val);
+	if (val)
+		regmap_update_bits(reg, TH1520_GPU_RST_CFG,
+				   TH1520_GPU_RST_CFG_MASK, 0x0);
+
+	/* rst gpu clkgen */
+	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_CLKGEN_RST);
+
+	/*
+	 * According to the hardware manual, a delay of at least 32 clock
+	 * cycles is required between de-asserting the clkgen reset and
+	 * de-asserting the GPU reset. Assuming a worst-case scenario with
+	 * a very high GPU clock frequency, a delay of 1 microsecond is
+	 * sufficient to ensure this requirement is met across all
+	 * feasible GPU clock speeds.
+	 */
+	udelay(1);
+
+	/* rst gpu */
+	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_GPU_RST);
+
+	mutex_unlock(gpu_seq_lock);
+}
+
+static void th1520_rst_gpu_disable(struct regmap *reg,
+				   struct mutex *gpu_seq_lock)
+{
+	mutex_lock(gpu_seq_lock);
+
+	regmap_update_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_RST_CFG_MASK, 0x0);
+
+	mutex_unlock(gpu_seq_lock);
+}
+
+static int th1520_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
+
+	switch (id) {
+	case TH1520_RESET_ID_GPU:
+		th1520_rst_gpu_disable(priv->map, &priv->gpu_seq_lock);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int th1520_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
+
+	switch (id) {
+	case TH1520_RESET_ID_GPU:
+		th1520_rst_gpu_enable(priv->map, &priv->gpu_seq_lock);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int th1520_reset_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *reset_spec)
+{
+	unsigned int index = reset_spec->args[0];
+
+	/* currently, only GPU reset is implemented in this driver */
+	if (index == TH1520_RESET_ID_GPU)
+		return index;
+
+	return -EOPNOTSUPP;
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
+	mutex_init(&priv->gpu_seq_lock);
+
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.nr_resets = 1;
+	priv->rcdev.ops = &th1520_reset_ops;
+	priv->rcdev.of_node = dev->of_node;
+	priv->rcdev.of_xlate = th1520_reset_xlate;
+	priv->rcdev.of_reset_n_cells = 1;
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

