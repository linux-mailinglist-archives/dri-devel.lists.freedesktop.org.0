Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6292A78E6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094C86E9EE;
	Thu,  5 Nov 2020 08:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C91D6E249
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y16so23731170ljk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBDSVLceH42ghd/sR4M7H2Ikede4GW7JPwdSJ9jMlOg=;
 b=taDTiV3SzCKMk/PixwEOGzaOsAdFjiPDf3mL1DNc+FCM++cad54XkR+z8qDcOKAsXT
 +PcLekF7f8RfMrCvOR/X1QhC9IGuRm3JEYtu+jXTmn+wg2BGdBRzsOD3ccwkMqvdNYfm
 BOkt+P63uY1zcrD86thGxUxwCCI8EzYEbazvUeoTN9CKpe2pisa4QPBRdxuJcWVuA6iy
 nPvEHfwq5mjfLXiTKbrkeBFij+0rv7NOtIRnUiS6LLJxAvggY4GEpHfhtRbzcF+x7r3x
 HLjzIEqIUPF/FzagNpkBAXuiMVVl0Ok2uf+w5L0X1pT4Yvm/4BUMywU9TrracrssrI8r
 eoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBDSVLceH42ghd/sR4M7H2Ikede4GW7JPwdSJ9jMlOg=;
 b=JsrsMFTqicKs7BiN2eqXMsxNVOo2IlwmFtrlAivZspS/wyJf7vDI7N0OB/9lnliX49
 ItEIOtXWZ4TpbF/9e6NijR26D+MYljlijdRe9I4uxHAAEIWQ8olKB/iRxeGTDFAMEUDh
 g+pwdCmj4si0yKKCP5C7fcdlZ0PnIMc6GRj2PVKkydyHTLcv1DHqLgJcclWQxPf1C+PC
 RSHieA4eu2fFCuczth+wRXLGcWYHQ1SPRLc+qsm8yUpj7VyKNQmsRjPQCcynmmj+7Ia3
 CmnCjRiWb49c2Z5pCZHElZhCBXQHWw8TElmKX6d03OGLjk6Zok2PIkvo4ifDm3k1dRfa
 1oyw==
X-Gm-Message-State: AOAM532X0LohATQxKcDikEMg5FzviSmXmeg3vz2Gho1nVdjGh+0qdDS8
 DdIEYa4YdE6e9rJYllQMZBM=
X-Google-Smtp-Source: ABdhPJw4ilpmq2RSdroewmGcVScETUJMoICYBZJ2u8Wm7iRGIB9o4JBpngkMRemfIBLHkQwEBOb6eA==
X-Received: by 2002:a2e:584e:: with SMTP id x14mr10190824ljd.335.1604508619419; 
 Wed, 04 Nov 2020 08:50:19 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:18 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 41/47] memory: tegra124-emc: Make driver modular
Date: Wed,  4 Nov 2020 19:49:17 +0300
Message-Id: <20201104164923.21238-42-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add modularization support to the Tegra124 EMC driver, which now can be
compiled as a loadable kernel module.

Note that EMC clock must be registered at clk-init time, otherwise PLLM
will be disabled as unused clock at boot time if EMC driver is compiled
as a module. Hence add a prepare/complete callbacks. similarly to what is
done for the Tegra20/30 EMC drivers.

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/Makefile           |  3 +-
 drivers/clk/tegra/clk-tegra124-emc.c | 41 ++++++++++++++++++++++++----
 drivers/clk/tegra/clk-tegra124.c     | 27 ++++++++++++++++--
 drivers/clk/tegra/clk.h              | 16 +++--------
 drivers/memory/tegra/Kconfig         |  2 +-
 drivers/memory/tegra/tegra124-emc.c  | 31 ++++++++++++++-------
 include/linux/clk/tegra.h            |  8 ++++++
 include/soc/tegra/emc.h              | 16 -----------
 8 files changed, 96 insertions(+), 48 deletions(-)
 delete mode 100644 include/soc/tegra/emc.h

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index eec2313fd37e..53b76133e905 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -22,7 +22,8 @@ obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= clk-tegra20-emc.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
 obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
-obj-$(CONFIG_TEGRA124_EMC)		+= clk-tegra124-emc.o
+obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124-emc.o
+obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124-emc.o
 obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
 obj-y					+= cvb.o
 obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o
diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 745f9faa98d8..bdf6f4a51617 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -11,7 +11,9 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/clk/tegra.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -21,7 +23,6 @@
 #include <linux/string.h>
 
 #include <soc/tegra/fuse.h>
-#include <soc/tegra/emc.h>
 
 #include "clk.h"
 
@@ -80,6 +81,9 @@ struct tegra_clk_emc {
 	int num_timings;
 	struct emc_timing *timings;
 	spinlock_t *lock;
+
+	tegra124_emc_prepare_timing_change_cb *prepare_timing_change;
+	tegra124_emc_complete_timing_change_cb *complete_timing_change;
 };
 
 /* Common clock framework callback implementations */
@@ -176,6 +180,9 @@ static struct tegra_emc *emc_ensure_emc_driver(struct tegra_clk_emc *tegra)
 	if (tegra->emc)
 		return tegra->emc;
 
+	if (!tegra->prepare_timing_change || !tegra->complete_timing_change)
+		return NULL;
+
 	if (!tegra->emc_node)
 		return NULL;
 
@@ -241,7 +248,7 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 
 	div = timing->parent_rate / (timing->rate / 2) - 2;
 
-	err = tegra_emc_prepare_timing_change(emc, timing->rate);
+	err = tegra->prepare_timing_change(emc, timing->rate);
 	if (err)
 		return err;
 
@@ -259,7 +266,7 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 
 	spin_unlock_irqrestore(tegra->lock, flags);
 
-	tegra_emc_complete_timing_change(emc, timing->rate);
+	tegra->complete_timing_change(emc, timing->rate);
 
 	clk_hw_reparent(&tegra->hw, __clk_get_hw(timing->parent));
 	clk_disable_unprepare(tegra->prev_parent);
@@ -473,8 +480,8 @@ static const struct clk_ops tegra_clk_emc_ops = {
 	.get_parent = emc_get_parent,
 };
 
-struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
-				   spinlock_t *lock)
+struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np,
+				      spinlock_t *lock)
 {
 	struct tegra_clk_emc *tegra;
 	struct clk_init_data init;
@@ -538,3 +545,27 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 
 	return clk;
 };
+
+void tegra124_clk_set_emc_callbacks(tegra124_emc_prepare_timing_change_cb *prep_cb,
+				    tegra124_emc_complete_timing_change_cb *complete_cb)
+{
+	struct clk *clk = __clk_lookup("emc");
+	struct tegra_clk_emc *tegra;
+	struct clk_hw *hw;
+
+	if (clk) {
+		hw = __clk_get_hw(clk);
+		tegra = container_of(hw, struct tegra_clk_emc, hw);
+
+		tegra->prepare_timing_change = prep_cb;
+		tegra->complete_timing_change = complete_cb;
+	}
+}
+EXPORT_SYMBOL_GPL(tegra124_clk_set_emc_callbacks);
+
+bool tegra124_clk_emc_driver_available(struct clk_hw *hw)
+{
+	struct tegra_clk_emc *tegra = container_of(hw, struct tegra_clk_emc, hw);
+
+	return tegra->prepare_timing_change && tegra->complete_timing_change;
+}
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index e931319dcc9d..b4f2ae4066a6 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -929,6 +929,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio4_mux] = { .dt_id = TEGRA124_CLK_AUDIO4_MUX, .present = true },
 	[tegra_clk_spdif_mux] = { .dt_id = TEGRA124_CLK_SPDIF_MUX, .present = true },
 	[tegra_clk_cec] = { .dt_id = TEGRA124_CLK_CEC, .present = true },
+	[tegra_clk_emc] = { .dt_id = TEGRA124_CLK_EMC, .present = false },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
@@ -1500,6 +1501,26 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
 	writel(plld_base, clk_base + PLLD_BASE);
 }
 
+static struct clk *tegra124_clk_src_onecell_get(struct of_phandle_args *clkspec,
+						void *data)
+{
+	struct clk_hw *hw;
+	struct clk *clk;
+
+	clk = of_clk_src_onecell_get(clkspec, data);
+	if (IS_ERR(clk))
+		return clk;
+
+	hw = __clk_get_hw(clk);
+
+	if (clkspec->args[0] == TEGRA124_CLK_EMC) {
+		if (!tegra124_clk_emc_driver_available(hw))
+			return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	return clk;
+}
+
 /**
  * tegra124_132_clock_init_post - clock initialization postamble for T124/T132
  * @np: struct device_node * of the DT node for the SoC CAR IP block
@@ -1516,10 +1537,10 @@ static void __init tegra124_132_clock_init_post(struct device_node *np)
 				  &pll_x_params);
 	tegra_init_special_resets(1, tegra124_reset_assert,
 				  tegra124_reset_deassert);
-	tegra_add_of_provider(np, of_clk_src_onecell_get);
+	tegra_add_of_provider(np, tegra124_clk_src_onecell_get);
 
-	clks[TEGRA124_CLK_EMC] = tegra_clk_register_emc(clk_base, np,
-							&emc_lock);
+	clks[TEGRA124_CLK_EMC] = tegra124_clk_register_emc(clk_base, np,
+							   &emc_lock);
 
 	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 6b565f6b5f66..2da7c93c1a6c 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -881,18 +881,6 @@ void tegra_super_clk_gen5_init(void __iomem *clk_base,
 			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
 
-#ifdef CONFIG_TEGRA124_EMC
-struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
-				   spinlock_t *lock);
-#else
-static inline struct clk *tegra_clk_register_emc(void __iomem *base,
-						 struct device_node *np,
-						 spinlock_t *lock)
-{
-	return NULL;
-}
-#endif
-
 void tegra114_clock_tune_cpu_trimmers_high(void);
 void tegra114_clock_tune_cpu_trimmers_low(void);
 void tegra114_clock_tune_cpu_trimmers_init(void);
@@ -922,6 +910,10 @@ void tegra_clk_periph_resume(void);
 bool tegra20_clk_emc_driver_available(struct clk_hw *emc_hw);
 struct clk *tegra20_clk_register_emc(void __iomem *ioaddr, bool low_jitter);
 
+struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np,
+				      spinlock_t *lock);
+bool tegra124_clk_emc_driver_available(struct clk_hw *emc_hw);
+
 struct clk *tegra210_clk_register_emc(struct device_node *np,
 				      void __iomem *regs);
 
diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index e7c295d50734..b5824c6cf664 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -33,7 +33,7 @@ config TEGRA30_EMC
 	  external memory.
 
 config TEGRA124_EMC
-	bool "NVIDIA Tegra124 External Memory Controller driver"
+	tristate "NVIDIA Tegra124 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_124_SOC
 	help
diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index ee8ee39e98ed..edfbf6d6d357 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -9,16 +9,17 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/string.h>
 
-#include <soc/tegra/emc.h>
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/mc.h>
 
@@ -562,8 +563,8 @@ static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
 	return timing;
 }
 
-int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
-				    unsigned long rate)
+static int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
+					   unsigned long rate)
 {
 	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
 	struct emc_timing *last = &emc->last_timing;
@@ -790,8 +791,8 @@ int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
 	return 0;
 }
 
-void tegra_emc_complete_timing_change(struct tegra_emc *emc,
-				      unsigned long rate)
+static void tegra_emc_complete_timing_change(struct tegra_emc *emc,
+					     unsigned long rate)
 {
 	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
 	struct emc_timing *last = &emc->last_timing;
@@ -987,6 +988,7 @@ static const struct of_device_id tegra_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra132-emc" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
 
 static struct device_node *
 tegra_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
@@ -1226,9 +1228,19 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, emc);
 
+	tegra124_clk_set_emc_callbacks(tegra_emc_prepare_timing_change,
+				       tegra_emc_complete_timing_change);
+
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		emc_debugfs_init(&pdev->dev, emc);
 
+	/*
+	 * Don't allow the kernel module to be unloaded. Unloading adds some
+	 * extra complexity which doesn't really worth the effort in a case of
+	 * this driver.
+	 */
+	try_module_get(THIS_MODULE);
+
 	return 0;
 };
 
@@ -1240,9 +1252,8 @@ static struct platform_driver tegra_emc_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
+module_platform_driver(tegra_emc_driver);
 
-static int tegra_emc_init(void)
-{
-	return platform_driver_register(&tegra_emc_driver);
-}
-subsys_initcall(tegra_emc_init);
+MODULE_AUTHOR("Mikko Perttunen <mperttunen@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra124 EMC driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 3f01d43f0598..eb016fc9cc0b 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -136,6 +136,7 @@ extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
 extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
 
 struct clk;
+struct tegra_emc;
 
 typedef long (tegra20_clk_emc_round_cb)(unsigned long rate,
 					unsigned long min_rate,
@@ -146,6 +147,13 @@ void tegra20_clk_set_emc_round_callback(tegra20_clk_emc_round_cb *round_cb,
 					void *cb_arg);
 int tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same);
 
+typedef int (tegra124_emc_prepare_timing_change_cb)(struct tegra_emc *emc,
+						    unsigned long rate);
+typedef void (tegra124_emc_complete_timing_change_cb)(struct tegra_emc *emc,
+						      unsigned long rate);
+void tegra124_clk_set_emc_callbacks(tegra124_emc_prepare_timing_change_cb *prep_cb,
+				    tegra124_emc_complete_timing_change_cb *complete_cb);
+
 struct tegra210_clk_emc_config {
 	unsigned long rate;
 	bool same_freq;
diff --git a/include/soc/tegra/emc.h b/include/soc/tegra/emc.h
deleted file mode 100644
index 05199a97ccf4..000000000000
--- a/include/soc/tegra/emc.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2014 NVIDIA Corporation. All rights reserved.
- */
-
-#ifndef __SOC_TEGRA_EMC_H__
-#define __SOC_TEGRA_EMC_H__
-
-struct tegra_emc;
-
-int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
-				    unsigned long rate);
-void tegra_emc_complete_timing_change(struct tegra_emc *emc,
-				      unsigned long rate);
-
-#endif /* __SOC_TEGRA_EMC_H__ */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
