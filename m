Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3052E6F71
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2ED892D8;
	Tue, 29 Dec 2020 09:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACE58999C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 15:49:42 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h205so24757864lfd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 07:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYqB7FEw68SeQwuJRfi2dBM2z15ZxlZU6C2m0canOnM=;
 b=sEgcyPWlaSSTwXBAomOpVZo6RxKFFLPZoVPyBw0vKfBwS/xjyG5T11OENKFHmpg7uU
 sW/7ysR1TOJTmER7yNNs1+ZshW2+P3b98SoCy9yMMrusKpxg044d+pt3VLGVA5uNGWq7
 9AVIAy/4rtd6gZie8/XLQF3X7wdmKq1E6zqNXOakdfP5kmMic0J785/hVHDMiCowVWa7
 WuowyaL9Jej6omI+zOLun4EdPY/CWiS9AmGi8TxUVmBHzuvLMqwejSN+LK/rpr2VM6aI
 oM7E/qjq2YetB7DQIsx8Q+EdJikpheT5ODXudeKRdDCJDnrCazmnHPAySWaqrp9MaFnE
 Eiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYqB7FEw68SeQwuJRfi2dBM2z15ZxlZU6C2m0canOnM=;
 b=coPMT3NzffX/wBfD0uEosksXTH9zOQlG7UnpObd1OdDiEVacKM6zW4VHT0qoD7OX8g
 wgyr4ooSMsPir4Xp+CwHIGHcwTcnGhcCdUeuWkkVFcZyGvhiQBE+oL7AJwoFgGzVXE2i
 6DsNWQW8oi2B1S9FnA/aMyxA3CNH8azTgRsXFM1yg1ZfeqyB8Y0lxIde9iruDwRVE2/M
 VxIMhiaWX2725kEH2sXL+6X2q8bgqz0TWQKT9OUOvYaTlBjeb0HjX/Qg1uFdkTtEibvD
 iXVBObUGLKpUncg+nS8LMgaoIzOFpML2/2++HFovw2G/P9BoMtDshPHrO9cpCh1Uz3KJ
 CMzQ==
X-Gm-Message-State: AOAM530x1zJngvdywDHJDiI3bFxvxGRd1lCIp1XjSJUHrVKdMZQTVXFq
 F9R+a9eEBnI75hNm5DffCms=
X-Google-Smtp-Source: ABdhPJx6of6SGDaYGkMgwUrHD1FNT9wEk0MrqiLjo3AUiuA45X6RdT8LZUx/Su87DaBj+BgkYQkFew==
X-Received: by 2002:a2e:894c:: with SMTP id b12mr21161181ljk.401.1609170580520; 
 Mon, 28 Dec 2020 07:49:40 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm6502262ljd.25.2020.12.28.07.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 07:49:40 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v12 1/5] memory: tegra124-emc: Make driver modular
Date: Mon, 28 Dec 2020 18:49:16 +0300
Message-Id: <20201228154920.18846-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228154920.18846-1-digetx@gmail.com>
References: <20201228154920.18846-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
Cc: linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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
 drivers/clk/tegra/Kconfig            |  3 ++
 drivers/clk/tegra/Makefile           |  2 +-
 drivers/clk/tegra/clk-tegra124-emc.c | 41 ++++++++++++++++++++++++----
 drivers/clk/tegra/clk-tegra124.c     | 26 ++++++++++++++++--
 drivers/clk/tegra/clk.h              | 18 ++++++++----
 drivers/memory/tegra/Kconfig         |  3 +-
 drivers/memory/tegra/tegra124-emc.c  | 31 ++++++++++++++-------
 include/linux/clk/tegra.h            |  8 ++++++
 include/soc/tegra/emc.h              | 16 -----------
 9 files changed, 106 insertions(+), 42 deletions(-)
 delete mode 100644 include/soc/tegra/emc.h

diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
index deaa4605824c..90df619dc087 100644
--- a/drivers/clk/tegra/Kconfig
+++ b/drivers/clk/tegra/Kconfig
@@ -7,3 +7,6 @@ config TEGRA_CLK_DFLL
 	depends on ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC
 	select PM_OPP
 	def_bool y
+
+config TEGRA124_CLK_EMC
+	bool
diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index eec2313fd37e..7b1816856eb5 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= clk-tegra20-emc.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
 obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
-obj-$(CONFIG_TEGRA124_EMC)		+= clk-tegra124-emc.o
+obj-$(CONFIG_TEGRA124_CLK_EMC)		+= clk-tegra124-emc.o
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
index e931319dcc9d..934520aab6e3 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1500,6 +1500,26 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
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
@@ -1516,10 +1536,10 @@ static void __init tegra124_132_clock_init_post(struct device_node *np)
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
index 6b565f6b5f66..c3e36b5dcc75 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -881,16 +881,22 @@ void tegra_super_clk_gen5_init(void __iomem *clk_base,
 			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
 
-#ifdef CONFIG_TEGRA124_EMC
-struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
-				   spinlock_t *lock);
+#ifdef CONFIG_TEGRA124_CLK_EMC
+struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np,
+				      spinlock_t *lock);
+bool tegra124_clk_emc_driver_available(struct clk_hw *emc_hw);
 #else
-static inline struct clk *tegra_clk_register_emc(void __iomem *base,
-						 struct device_node *np,
-						 spinlock_t *lock)
+static inline struct clk *
+tegra124_clk_register_emc(void __iomem *base, struct device_node *np,
+			  spinlock_t *lock)
 {
 	return NULL;
 }
+
+static inline bool tegra124_clk_emc_driver_available(struct clk_hw *emc_hw)
+{
+	return false;
+}
 #endif
 
 void tegra114_clock_tune_cpu_trimmers_high(void);
diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index ca7077a06f4c..f5b451403c58 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -32,9 +32,10 @@ config TEGRA30_EMC
 	  external memory.
 
 config TEGRA124_EMC
-	bool "NVIDIA Tegra124 External Memory Controller driver"
+	tristate "NVIDIA Tegra124 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_124_SOC
+	select TEGRA124_CLK_EMC
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra124 chips. The EMC controls the external DRAM on the board.
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
