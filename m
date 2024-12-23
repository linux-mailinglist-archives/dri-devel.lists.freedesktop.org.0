Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A4B9FB170
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4704910E554;
	Mon, 23 Dec 2024 16:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="FJnfsJpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82DB10E155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125613euoutp013d4ef66929880ffd4933eadce666245a~Tz6FvTLCA0113001130euoutp01U
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241223125613euoutp013d4ef66929880ffd4933eadce666245a~Tz6FvTLCA0113001130euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958573;
 bh=rsVgMSE0qrD9/Dm6ayVky1t6/68XWrLqc/Q39UlEoYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FJnfsJpmkGdKoQcI+Ljv74o1o22d1XTgTh1Lgpquyjb26kDAdDrIGqtTxt7CFgPnl
 Z9lc7ybkIGcbEdLWbU8i+CbxENKIbk3ENpZdmmJocbi1i7YuExs4gjOYEOn3172TBe
 UaLRK5bWgr9yBxW65Wz2AVNbDVV69IkR6/aZJIqc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20241223125613eucas1p180dfd9f65b3bd810f1e049740d45d02e~Tz6FWguXl2328723287eucas1p1c;
 Mon, 23 Dec 2024 12:56:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 41.C6.20821.DED59676; Mon, 23
 Dec 2024 12:56:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241223125612eucas1p1d27f793116fa405911f07cfc926c0129~Tz6E-L9jd2328723287eucas1p1b;
 Mon, 23 Dec 2024 12:56:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125612eusmtrp17620118d05e2ae0e860868a2b1c8fe66~Tz6E8UZRU2051220512eusmtrp1a;
 Mon, 23 Dec 2024 12:56:12 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-82-67695ded60de
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3E.73.19654.CED59676; Mon, 23
 Dec 2024 12:56:12 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125611eusmtip2d22b094104dd478af478866667b01b85~Tz6DiN4vn3173831738eusmtip2M;
 Mon, 23 Dec 2024 12:56:11 +0000 (GMT)
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
Subject: [RFC PATCH v2 09/19] reset: thead: Add TH1520 reset controller driver
Date: Mon, 23 Dec 2024 13:55:43 +0100
Message-Id: <20241223125553.3527812-10-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xbZRz1u/f23tvO4l2Z2yeIzOJMUHkZST50WzBBcolRcVGZIw7u5MKY
 ULYWxlAjzAKyrgwZ4rLSCsMhDfKcpbxBuo7CeDkQaCKUoZDBAjY8RsTHZrt2uv/O75zz+875
 JR+NS1pJLzpZls7LZVyKlBQRxr6tkYCVD5KTglsqPFD/VCWGmv/SUKi2awRD5eYRAbKNGTD0
 8x07ieoXfqLQYtdpAk3qdRRS9jWQaEljI9Gq2iZA4+1aEq0XmgEyrueSqM48Q6GGO+UYurTa
 TKDLre0A5Z/5ToBuXH8Nzdj6CbQ0rsZRvuYxdK+zlUJ3J5sIVPZ7D4UMy8UCZKmLQbk9XxHh
 T7F2ax7FLi8tEezVgg2K7dqsINg2zQzFqtuGAHul5gzJTk92kuw3A2+zs2ctGPvD5Ww2t64P
 Y4v+CWbt3RMke85QA9gx5RQVLTkk2pvApySf5OVB++NFRxd7F6jjJaGnls5eoHKA+QUVENKQ
 eQmuDesxFRDREkYPoPW8hXQNGwDWNCrdyjqAqvpB4sFK0cIXbqEawHMD31OuYRnAv9s7caeL
 ZF6EN6vLBU5hB5NHwLxrp4FzwJlbABrntaTT5clEw7H2YsqJCWYPrJirAE4sZsLhkKqAcuX5
 wp7e4fuvCh18rcrq9myHAxfn73fCHR5lcxnuDIBMnQj+2KgVuJYjYOngqLu4J7xtMbgffRIO
 lqjdfBq82byGu/CnsE1tceNX4PTIn46itCPAHza0B7noV2HP3B+4k4aMB7SubHdV8IDnjRfc
 tBgW5Etc7mdhqbrwv9ARvRFzYRYuNxmpL8HTmoeO0Tx0jOb/3AqA14BdfIYiNYlXhMj4zEAF
 l6rIkCUFfpiWegU4PvfgXctaK9DdXg00AYwGJgBpXLpDbJIkJ0nECVzWx7w8LU6ekcIrTMCb
 JqS7xHsSfHkJk8Sl8x/x/HFe/kDFaKFXDlZgEYXIrjKPnwjz2s0+83zwNt270zlZkdFe0zEB
 Qf6HO30Cek+EcUrUZN8WtV91rPfztaojLTP1eu0T+qHftoo00dZK3ey+uaqdm9lhn33r5783
 PqY7Iev90Jqm+E/SD3T0Z0ca+k7VF8nSDt06IkzLFEmUo97dw8MGe3xUy9dmi3wi9pEOfXii
 p6nx4mSoLWSriheOHnx9yj8z/5dj7+0ebbxuKtt65/A9nwhrR5VHZmJkVO4N79rl0rYDurjC
 ShFdoreFL4an/1odUbwyAE8ScbETftek4wuxXGrbpX264vpe6JM4u7Jx0E/LcX4235fnzT07
 Sdlbb/h5JGy+ufmoVkoojnIhz+FyBfcvg2aCVEsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xe7pvYjPTDRYu17E4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CX8eLgU/aCyaYVL7unszcwHtHpYuTkkBAwkeh/2s7UxcjFISSwlFHi+IkL
 jBAJGYlr3S9ZIGxhiT/Xutggil4xSrRMOwqWYBMwkniwfD4riC0isJhFYu++SpAiZoG3jBLX
 Z24EKxIW8JP4vPcs2FQWAVWJBQ8XgNm8Ag4SZ7o62CE2yEvsP3iWGcTmBIqv6boBViMkYC/x
 79QHNoh6QYmTM5+AzWQGqm/eOpt5AqPALCSpWUhSCxiZVjGKpJYW56bnFhvpFSfmFpfmpesl
 5+duYgQmmG3Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeA8JZaYL8aYkVlalFuXHF5XmpBYfYjQF
 unsis5Rocj4wxeWVxBuaGZgamphZGphamhkrifOyXTmfJiSQnliSmp2aWpBaBNPHxMEp1cA0
 87DDW5Yt5yVO7OQ67PT3yOoqFo0v5wr1ps5fa9wu6MEcra3ZJbeEJdvX4P52gejzUz3ffUyc
 2hChVrtG0N7a89cW/YBjht96l78Jm8HP/OriiWKPql1WCg84fXK2ppzd//JyJWu2ce4NsemB
 +1o+OT7YucjsSMeflR67t029kX3x7xl3lhMHuPacnRrXz7UjYbvG/o12R5w3dk9k4bmjkMga
 y3O2XyvofP/pVUz50ifvrOe6b3n9IGNP3tK8Z//86i4VvzVaus31Tvlp3Wohw8kzFndkebxP
 1Y38nK03o6yyPZz3dmDFJaEmQ9ljvzb02lrOYZ/OLDDP3i8t1IbT4f1hI7uVtdJsttoluUFK
 LMUZiYZazEXFiQALVyeRuQMAAA==
X-CMS-MailID: 20241223125612eucas1p1d27f793116fa405911f07cfc926c0129
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125612eucas1p1d27f793116fa405911f07cfc926c0129
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125612eucas1p1d27f793116fa405911f07cfc926c0129
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125612eucas1p1d27f793116fa405911f07cfc926c0129@eucas1p1.samsung.com>
X-Mailman-Approved-At: Mon, 23 Dec 2024 16:04:53 +0000
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

This patch introduces the reset controller driver for the T-HEAD
TH1520 SoC. The controller manages hardware reset lines for various SoC
subsystems, such as the GPU. By exposing these resets via the Linux
reset subsystem, drivers can request and control hardware resets to
reliably initialize or recover key components.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                  |   1 +
 drivers/reset/Kconfig        |  10 +++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-th1520.c | 151 +++++++++++++++++++++++++++++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 drivers/reset/reset-th1520.c

diff --git a/MAINTAINERS b/MAINTAINERS
index db8c55058c29..38130ae25c6f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20202,6 +20202,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
+F:	drivers/reset/reset-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
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
index 000000000000..10ca200690d5
--- /dev/null
+++ b/drivers/reset/reset-th1520.c
@@ -0,0 +1,151 @@
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
+};
+
+static inline struct th1520_reset_priv *
+to_th1520_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct th1520_reset_priv, rcdev);
+}
+
+static void th1520_rst_gpu_enable(struct regmap *reg)
+{
+	int val;
+
+	/* if the GPU is not in a reset state it, put it into one */
+	regmap_read(reg, TH1520_GPU_RST_CFG, &val);
+	if (val) {
+		regmap_update_bits(reg, TH1520_GPU_RST_CFG,
+				   TH1520_GPU_RST_CFG_MASK, 0x0);
+	}
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
+}
+
+static void th1520_rst_gpu_disable(struct regmap *reg)
+{
+	regmap_update_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_RST_CFG_MASK, 0x0);
+}
+
+static int th1520_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
+
+	switch (id) {
+	case TH1520_RESET_ID_GPU:
+		th1520_rst_gpu_disable(priv->map);
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
+		th1520_rst_gpu_enable(priv->map);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct reset_control_ops th1520_reset_ops = {
+	.assert	= th1520_reset_assert,
+	.deassert = th1520_reset_deassert,
+};
+
+const struct regmap_config th1520_reset_regmap_config = {
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
+	priv->map =
+		devm_regmap_init_mmio(dev, base, &th1520_reset_regmap_config);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.nr_resets = TH1520_RESET_NUM_IDS;
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

