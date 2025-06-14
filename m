Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50924AD9EAC
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 20:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156CD10E128;
	Sat, 14 Jun 2025 18:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="L06zSlpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDA910E158
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 18:09:12 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250614180908euoutp0156515c33465bdbd8fdfcf45d0f335548~I_xsAUtZ00712307123euoutp01I
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 18:09:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250614180908euoutp0156515c33465bdbd8fdfcf45d0f335548~I_xsAUtZ00712307123euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1749924548;
 bh=es42sbD4TwJBn2FnGEDu63hM0VjueMf8OeKZlpT3Lck=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=L06zSlpOGQcGYRb1RD6sNAkqpSSAbcaKSl/jtPMgtBoadivsrxChgvIKR8VVMvreV
 vtKmDvh9KTXQTDIf0CFUP3+VYMUyQ/FAhC+d5Jkcno84YhsmaTvy9uvm80/GtsCMIh
 +xecwWytHkjiYtDxku4szoiaDlNxTXuGzwBFsHk0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250614180907eucas1p13d341c30e495fb36598b1d7c10ec7070~I_xrApfT50329603296eucas1p1O;
 Sat, 14 Jun 2025 18:09:07 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250614180906eusmtip10ef2265dbfca800be20fd8a02eca94e8~I_xp4kdF00306403064eusmtip1W;
 Sat, 14 Jun 2025 18:09:06 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 14 Jun 2025 20:06:07 +0200
Subject: [PATCH v4 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-apr_14_for_sending-v4-1-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
 Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250614180907eucas1p13d341c30e495fb36598b1d7c10ec7070
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250614180907eucas1p13d341c30e495fb36598b1d7c10ec7070
X-EPHeader: CA
X-CMS-RootMailID: 20250614180907eucas1p13d341c30e495fb36598b1d7c10ec7070
References: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
 <CGME20250614180907eucas1p13d341c30e495fb36598b1d7c10ec7070@eucas1p1.samsung.com>
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

Introduce the pwrseq-thead-gpu driver, a power sequencer provider for
the Imagination BXM-4-64 GPU on the T-HEAD TH1520 SoC. This driver is
an auxiliary driver instantiated by the AON power domain driver.

The TH1520 GPU requires a specific sequence to correctly initialize and
power down its resources:
 - Enable GPU clocks (core and sys).
 - De-assert the GPU clock generator reset (clkgen_reset).
 - Introduce a short hardware-required delay.
 - De-assert the GPU core reset. The power-down sequence performs these
   steps in reverse.

Implement this sequence via the pwrseq_power_on and pwrseq_power_off
callbacks.

Crucially, the driver's match function is called when a consumer (the
Imagination GPU driver) requests the "gpu-power" target. During this
match, the sequencer uses devm_clk_bulk_get() and
devm_reset_control_get_exclusive() on the consumer's device to obtain
handles to the GPU's "core" and "sys" clocks, and the GPU core reset.
These, along with clkgen_reset obtained from parent aon node, allow it
to perform the complete sequence.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                 |   1 +
 drivers/power/sequencing/Kconfig            |   8 ++
 drivers/power/sequencing/Makefile           |   1 +
 drivers/power/sequencing/pwrseq-thead-gpu.c | 208 ++++++++++++++++++++++++++++
 4 files changed, 218 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0183c028fa18c397d30ec82fd419894f1f50a448..3283ff592215249bcf702dbb4ab710477243477e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21395,6 +21395,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
+F:	drivers/power/sequencing/pwrseq-thead-gpu.c
 F:	drivers/reset/reset-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/power/thead,th1520-power.h
diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index ddcc42a984921c55667c46ac586d259625e1f1a7..7fa912c9af2479cdce909467c29fe335788f0bd7 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -27,4 +27,12 @@ config POWER_SEQUENCING_QCOM_WCN
 	  this driver is needed for correct power control or else we'd risk not
 	  respecting the required delays between enabling Bluetooth and WLAN.
 
+config POWER_SEQUENCING_THEAD_GPU
+	tristate "T-HEAD TH1520 GPU power sequencing driver"
+	depends on ARCH_THEAD && AUXILIARY_BUS
+	help
+	  Say Y here to enable the power sequencing driver for the TH1520 SoC
+	  GPU. This driver handles the complex clock and reset sequence
+	  required to power on the Imagination BXM GPU on this platform.
+
 endif
diff --git a/drivers/power/sequencing/Makefile b/drivers/power/sequencing/Makefile
index 2eec2df7912d11827f9ba914177dd2c882e44bce..647f81f4013ab825630f069d2e0f6d22159f1f56 100644
--- a/drivers/power/sequencing/Makefile
+++ b/drivers/power/sequencing/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_POWER_SEQUENCING)		+= pwrseq-core.o
 pwrseq-core-y				:= core.o
 
 obj-$(CONFIG_POWER_SEQUENCING_QCOM_WCN)	+= pwrseq-qcom-wcn.o
+obj-$(CONFIG_POWER_SEQUENCING_THEAD_GPU) += pwrseq-thead-gpu.o
diff --git a/drivers/power/sequencing/pwrseq-thead-gpu.c b/drivers/power/sequencing/pwrseq-thead-gpu.c
new file mode 100644
index 0000000000000000000000000000000000000000..bb77aba59a031471fe00c919fcc4a5f2564e0cb6
--- /dev/null
+++ b/drivers/power/sequencing/pwrseq-thead-gpu.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * T-HEAD TH1520 GPU Power Sequencer Driver
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * This driver implements the power sequence for the Imagination BXM-4-64
+ * GPU on the T-HEAD TH1520 SoC. The sequence requires coordinating resources
+ * from both the sequencer's parent device node (clkgen_reset) and the GPU's
+ * device node (clocks and core reset).
+ *
+ * The `match` function is used to acquire the GPU's resources when the
+ * GPU driver requests the "gpu-power" sequence target.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pwrseq/provider.h>
+#include <linux/reset.h>
+
+#include <dt-bindings/power/thead,th1520-power.h>
+
+struct pwrseq_thead_gpu_ctx {
+	struct pwrseq_device *pwrseq;
+	struct reset_control *clkgen_reset;
+	struct device_node *aon_node;
+
+	/* Consumer resources */
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct reset_control *gpu_reset;
+};
+
+static int pwrseq_thead_gpu_power_on(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_thead_gpu_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	int ret;
+
+	if (!ctx->clks || !ctx->gpu_reset)
+		return -ENODEV;
+
+	ret = clk_bulk_prepare_enable(ctx->num_clks, ctx->clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(ctx->clkgen_reset);
+	if (ret)
+		goto err_disable_clks;
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
+	ret = reset_control_deassert(ctx->gpu_reset);
+	if (ret)
+		goto err_assert_clkgen;
+
+	return 0;
+
+err_assert_clkgen:
+	reset_control_assert(ctx->clkgen_reset);
+err_disable_clks:
+	clk_bulk_disable_unprepare(ctx->num_clks, ctx->clks);
+	return ret;
+}
+
+static int pwrseq_thead_gpu_power_off(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_thead_gpu_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	if (!ctx->clks || !ctx->gpu_reset)
+		return -ENODEV;
+
+	reset_control_assert(ctx->gpu_reset);
+	reset_control_assert(ctx->clkgen_reset);
+	clk_bulk_disable_unprepare(ctx->num_clks, ctx->clks);
+
+	return 0;
+}
+
+static const struct pwrseq_unit_data pwrseq_thead_gpu_unit = {
+	.name = "gpu-power-sequence",
+	.enable = pwrseq_thead_gpu_power_on,
+	.disable = pwrseq_thead_gpu_power_off,
+};
+
+static const struct pwrseq_target_data pwrseq_thead_gpu_target = {
+	.name = "gpu-power",
+	.unit = &pwrseq_thead_gpu_unit,
+};
+
+static const struct pwrseq_target_data *pwrseq_thead_gpu_targets[] = {
+	&pwrseq_thead_gpu_target,
+	NULL
+};
+
+static int pwrseq_thead_gpu_match(struct pwrseq_device *pwrseq,
+				  struct device *dev)
+{
+	struct pwrseq_thead_gpu_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	static const char *const clk_names[] = { "core", "sys" };
+	struct of_phandle_args pwr_spec;
+	int i, ret;
+
+	/* We only match the specific T-HEAD TH1520 GPU compatible */
+	if (!of_device_is_compatible(dev->of_node, "thead,th1520-gpu"))
+		return 0;
+
+	ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
+					 "#power-domain-cells", 0, &pwr_spec);
+	if (ret)
+		return 0;
+
+	/* Additionally verify consumer device has AON as power-domain */
+	if (pwr_spec.np != ctx->aon_node || pwr_spec.args[0] != TH1520_GPU_PD) {
+		of_node_put(pwr_spec.np);
+		return 0;
+	}
+
+	of_node_put(pwr_spec.np);
+
+	/* Prevent multiple consumers from attaching */
+	if (ctx->gpu_reset || ctx->clks)
+		return -EBUSY;
+
+	ctx->num_clks = ARRAY_SIZE(clk_names);
+	ctx->clks = devm_kcalloc(dev, ctx->num_clks, sizeof(*ctx->clks),
+				 GFP_KERNEL);
+	if (!ctx->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < ctx->num_clks; i++)
+		ctx->clks[i].id = clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, ctx->num_clks, ctx->clks);
+	if (ret)
+		return ret;
+
+	ctx->gpu_reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(ctx->gpu_reset))
+		return PTR_ERR(ctx->gpu_reset);
+
+	return 1;
+}
+
+static int pwrseq_thead_gpu_probe(struct auxiliary_device *adev,
+				  const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct device *parent_dev = dev->parent;
+	struct pwrseq_thead_gpu_ctx *ctx;
+	struct pwrseq_config config = {};
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->aon_node = parent_dev->of_node;
+
+	ctx->clkgen_reset =
+		devm_reset_control_get_exclusive(parent_dev, "gpu-clkgen");
+	if (IS_ERR(ctx->clkgen_reset))
+		return dev_err_probe(
+			dev, PTR_ERR(ctx->clkgen_reset),
+			"Failed to get GPU clkgen reset from parent\n");
+
+	config.parent = dev;
+	config.owner = THIS_MODULE;
+	config.drvdata = ctx;
+	config.match = pwrseq_thead_gpu_match;
+	config.targets = pwrseq_thead_gpu_targets;
+
+	ctx->pwrseq = devm_pwrseq_device_register(dev, &config);
+	if (IS_ERR(ctx->pwrseq))
+		return dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
+				     "Failed to register power sequencer\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id pwrseq_thead_gpu_id_table[] = {
+	{ .name = "th1520_pm_domains.pwrseq-gpu" },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, pwrseq_thead_gpu_id_table);
+
+static struct auxiliary_driver pwrseq_thead_gpu_driver = {
+	.driver = {
+		.name = "pwrseq-thead-gpu",
+	},
+	.probe = pwrseq_thead_gpu_probe,
+	.id_table = pwrseq_thead_gpu_id_table,
+};
+module_auxiliary_driver(pwrseq_thead_gpu_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("T-HEAD TH1520 GPU power sequencer driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

