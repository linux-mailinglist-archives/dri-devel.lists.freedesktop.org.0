Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8422A17140
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624DD10E45A;
	Mon, 20 Jan 2025 17:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="qlsMakrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D632410E45B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172130euoutp0205fd11726a0f5b43f7814d75ad33519e~cdltGaZO91548115481euoutp024
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250120172130euoutp0205fd11726a0f5b43f7814d75ad33519e~cdltGaZO91548115481euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393690;
 bh=upP84irMEogwZ/4ICPa1KeMs0pseg0LCguUHUshKaBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qlsMakrIFM7mcFSeoEYX+9VAvRxEyynMnmYjNMq7+fcf+jXXudSoNKj6M0l+tAdqb
 z5Y27xB1xbPsKgkKgKqyFTrO1L+YFO7g4Jt06J/yqV4ZC60O0pOYr5bYOhjtcmo8Aq
 knstjSyDZ8In+N/ITFjSrJrmOAGkb0lcMGTlfAmc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250120172130eucas1p1794cb28f6bea1e680f03bb1818c070da~cdlss5tgk0503405034eucas1p1l;
 Mon, 20 Jan 2025 17:21:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C7.76.20409.A168E876; Mon, 20
 Jan 2025 17:21:30 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250120172129eucas1p236f71df4e30f821f7682263ee8ecec06~cdlsRn1UU1091110911eucas1p2d;
 Mon, 20 Jan 2025 17:21:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172129eusmtrp2705fade5f86f1c0a34b84edc78c5cddb~cdlsQncQs0490804908eusmtrp2w;
 Mon, 20 Jan 2025 17:21:29 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-d0-678e861a990b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 5F.95.19654.9168E876; Mon, 20
 Jan 2025 17:21:29 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172128eusmtip1632a5aa33c614fcf0e348d989c2d4acf~cdlq_7Oca0819408194eusmtip1q;
 Mon, 20 Jan 2025 17:21:28 +0000 (GMT)
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
Subject: [RFC v3 08/18] reset: thead: Add TH1520 reset controller driver
Date: Mon, 20 Jan 2025 18:21:01 +0100
Message-Id: <20250120172111.3492708-9-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTVxjHd+69vbcQC5fC4IwZiESJoCvgnDl7yYQ4yNHMxLkPRD+I3bwp
 yJu2gtPohgNqcRUFX3ClyEtRCAhEKAwIrMiwiIOGwUCXAIMJdCVlFVrc5rCMcuvmt9//ef7P
 +T9PcoSk+Ds6UJiUdoKTp0lTQmhPqsX4t+mtQGW+LHL0rgA9eFRBoOZ/NAy602kiUGmPSYAm
 hvQE+nnJRqP6mUEG/d55jkKj1SUMyjY20MiimaDRgnpCgIbbtTSyX+wBqMWeQ6O6nnEGNSyV
 Eqh8oZlCla3tACnzbgvQTw9j0fjEAwpZhtUkUmq80UpHK4Oco3cpVPyHgUF6a4EA9dbFoxzD
 VSo6CNse5zLYarFQ+AeVg8Gdz8oo3KYZZ7C6rR/gxpo8Go+NdtD4Zt8n+NdvegncVPkVzqkz
 EvjSi0hs+36Exvn6GoCHsh8x+8QHPT84wqUkZXLyiA8PeyY6bL8Rx5a3f9Fkr2eygGHrBeAh
 hOx2uFJUzFwAnkIxWw3gdPGwWzgAnNE9FfDCDuBU+S/kyxFHVpPbVQVg/62HFC+sAHY5lZTL
 RbPb4GRV6dq4H5tLwdz754BLkKwZwJZpLe1y+bIYGke6CRdT7Ca48OwJcLGI3Qk7dWaKzwuG
 hnsDa9kebDT8c6ST4T0+sO/b6TUPuerJbi5271fnCbtrA3n+CLYPvgA8+8K5Xj3D83q40lZK
 8JwOJ5sX3bNnYJu6183vwzHT89U9havvh8GG9gi+HANzvr5KusqQ9YKP5334DbxgYUuRuyyC
 KqWYd4fCa+qL/4WaqlvcoRiWGbX0ZbBB88otmldu0fyfWwbIGhDAZShSZZxiWxp3UqKQpioy
 0mSSz9NTG8Hq3/7R2etoBVVzC5JuQAhBN4BCMsRP9PpTtUwsOiI9dZqTpyfIM1I4RTd4U0iF
 BIgqDLkyMSuTnuCSOe4YJ3/ZJYQegVlExfz9Hb5Ho29yZeF56PgZ8cfxFQXka6HWS9JTyQfP
 3zJ4R0gVsT6Ty0TfkgqHxVm3KPwv/xWqsUeGX3m+GPflemlQ7WepziT1e1NndadnP51xXtu8
 3GFhd0vHSqwqS3oUjgq+vjWuxMu8wzG/LvOoJLQQe1vgxs0281x8QUr5bd3+TaK0k9otu5rt
 U0Hle95eOWQa2OVdP+Z/3HQ+Kk4zuyHmcOPu9C5xqUVvLFTd2Fi8cy8dcOVsbKWvqDbT73qC
 18y6e8H5s8mF+9/pSoyUqDwI5Z2ExndD6v33VugKnmj7Y7SLWeZRXbJtsOlG2AHfooEhMtap
 9YvbM7HPJnljIYRSJEqjwkm5QvovuSvx6koEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7qSbX3pBv2rNC1OXF/EZLH19yx2
 izV7zzFZzD9yjtXi3qUtTBZXvr5ns1j39AK7xYu9jSwW11bMZbdoPraezeLlrHtsFh977rFa
 XN41h83ic+8RRottn1vYLNYeuctusf7rfCaLhR+3slgs2bGL0aKtcxmrxcVTrhZ3751gsXh5
 uYfZom0Wv8X/PTvYLf5d28hiMfvdfnaLLW8mslocXxtu0bJ/CouDnMf7G63sHm9evmTxONzx
 hd1j77cFLB47Z91l9+jZeYbRY9OqTjaPO9f2sHnMOxnocb/7OJPH5iX1Hi1rjzF59P818Hi/
 7yqbR9+WVYwel5qvswcIRenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZ
 pKTmZJalFunbJehlfHn/iKngj0nF5s/r2BsY9+t0MXJySAiYSHxp2MwOYgsJLGWUaPqUDxGX
 kbjW/ZIFwhaW+HOti62LkQuo5hWjxK49c5hAEmwCRhIPls9nBbFFBBazSOzdVwlSxCzwllHi
 +syNYN3CAh4Sx64eAmtgEVCV+PjtMSOIzStgL7F38XOoDfIS+w+eZQaxOQUcJL5f3Qt1kb3E
 navdUPWCEidnPgGrZwaqb946m3kCo8AsJKlZSFILGJlWMYqklhbnpucWG+kVJ+YWl+al6yXn
 525iBKaXbcd+btnBuPLVR71DjEwcjIcYJTiYlUR4RT/0pAvxpiRWVqUW5ccXleakFh9iNAW6
 eyKzlGhyPjDB5ZXEG5oZmBqamFkamFqaGSuJ87JdOZ8mJJCeWJKanZpakFoE08fEwSnVwCR8
 Q+/b6XUrg2ZNv+ITdaHDPDn3/Z20NuXgvSwPd13pWN96SrmMkdHMIml7hHKAx/+Dkdc+VAVu
 jQzaq2BzfKHMZyEt29TTT5bZbN3UfdrJ/smU3l//pzVWSMX7+EpJGXdOyVLT3uXy3mDLiioV
 JeYpxnEPoyb82TFjW4jNm5NSISatZTM3fF83ha3Z3qL47c+HMlMv+JqIHa5b3eA2yZhz+gSN
 kLC+p2nKYZ4P6y/fMW/8f2fOIr3DR3i3l6nfLucSfZb8xVmt4uOU79asc1bfPHIjRyIi49pf
 Q/XEHVfz/qyM3xcmK2DtZNrs96l84yHNLYmqZryTjT8H31nnc6nmDWOIspPQlNtvLdyfGCqx
 FGckGmoxFxUnAgBEeIX3uAMAAA==
X-CMS-MailID: 20250120172129eucas1p236f71df4e30f821f7682263ee8ecec06
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172129eucas1p236f71df4e30f821f7682263ee8ecec06
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172129eucas1p236f71df4e30f821f7682263ee8ecec06
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172129eucas1p236f71df4e30f821f7682263ee8ecec06@eucas1p2.samsung.com>
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

Introduce reset controller driver for the T-HEAD TH1520 SoC. The
controller manages hardware reset lines for various SoC subsystems, such
as the GPU. By exposing these resets via the Linux reset subsystem,
drivers can request and control hardware resets to reliably initialize
or recover key components.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                  |   1 +
 drivers/reset/Kconfig        |  10 +++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-th1520.c | 144 +++++++++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+)
 create mode 100644 drivers/reset/reset-th1520.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b6e894500ef..18382a356b12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20197,6 +20197,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
+F:	drivers/reset/reset-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/firmware/thead,th1520-aon.h
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
index 000000000000..e4278f49c62f
--- /dev/null
+++ b/drivers/reset/reset-th1520.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
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
+	th1520_rst_gpu_disable(priv->map);
+
+	return 0;
+}
+
+static int th1520_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
+
+	th1520_rst_gpu_enable(priv->map);
+
+	return 0;
+}
+
+static int th1520_reset_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *reset_spec)
+{
+	return 0;
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
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.nr_resets = 1;
+	priv->rcdev.ops = &th1520_reset_ops;
+	priv->rcdev.of_node = dev->of_node;
+	priv->rcdev.of_xlate = th1520_reset_xlate;
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

