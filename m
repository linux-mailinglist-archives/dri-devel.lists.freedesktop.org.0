Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CED2A7924
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ED56EA28;
	Thu,  5 Nov 2020 08:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00FD6E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:13 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 184so28006483lfd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+PlVNz2DO82Pxa4NldbfLMdE8+v1PrLJFS/R38S8Isg=;
 b=A87Wg4QKQL3q3FFqkehTbQpaq4XT5eRAOqy33Xin6xKb8B8xzLme7pkgNfpl7ZlP/i
 giaZ0EpKejZOAVQx/SNrU8fFRUdIyoCVBG8dPYx/2tA94KZwZVpEDN8b2lg281Aot9qx
 2A+J2KTD5vT9PkpJlOglQRAprHjGvaRTCqSa+Y8pJiWFPNfxSEouoH4hia9Zw/NE+PCA
 HVXVvTsqPPlP6s8dBBPhGQzD8S0tDhYfOSaUJCTyQbN90XVDbWA11WBpqKQ32oPX5lkv
 FMuOuhtdTLmMebPYeXCdVfzroiGg39ySDreUr06cg+eO5eFkoKaZ6f6feLdweJJzVJvS
 q39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+PlVNz2DO82Pxa4NldbfLMdE8+v1PrLJFS/R38S8Isg=;
 b=Y+YLDjQr9munbT6S9kNmkSPLW17eAfsD2vdspwDJMGp8ao76Egjetor07bOMCWPZDN
 Xz4+jGNRWBXozUD3Umab0ePyW1pzyC/omr7IfSNns6HViOYD+ThWjK8p6SDnplsaVnLm
 wzYIePl2KQwG2opjGFoE43S5KzE0t3JSgHjI5EMtQ0s4DIvr/2b0EEo/cZEU0O9d8So4
 dWe9pqi+LnMKP8fKFNopMQob2ow2PNtgMbKk0OmGl3N3ayvHt0pnDw58kgv1Z9uvc70j
 uCjkhPPTmqeDSirfadaf7jDKqs+8zAQ2hHlhdPLSs1bHTErPCRtcrrUmsZsk9+b5jscK
 uD2Q==
X-Gm-Message-State: AOAM531MVS+eCLnTmkjvxgqaMBkoK/I4gpVKXPvcxgF95RBS8H7SYv74
 3/zS+LJ04hRRvUSKw6rnyFk=
X-Google-Smtp-Source: ABdhPJyZcwK2knrE+1ZPczga3RIbbzmkeGQ19AMjHZaGvSJ65EWHyr+iyJ/B+1M40rO2bPZLHvExkA==
X-Received: by 2002:a05:6512:1da:: with SMTP id
 f26mr10741885lfp.245.1604508612132; 
 Wed, 04 Nov 2020 08:50:12 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:11 -0800 (PST)
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
Subject: [PATCH v7 35/47] memory: tegra20: Support interconnect framework
Date: Wed,  4 Nov 2020 19:49:11 +0300
Message-Id: <20201104164923.21238-36-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:03 +0000
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

Now Internal and External Memory Controllers are memory interconnection
providers. This allows us to use interconnect API for tuning of memory
configuration. EMC driver now supports OPPs and DVFS.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |   3 +-
 drivers/memory/tegra/tegra20-emc.c | 310 ++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra20.c     |  77 +++++++
 3 files changed, 386 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index ff426747cd7d..ac3dfe155505 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -11,7 +11,8 @@ config TEGRA_MC
 config TEGRA20_EMC
 	tristate "NVIDIA Tegra20 External Memory Controller driver"
 	default y
-	depends on ARCH_TEGRA_2x_SOC
+	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
+	select PM_OPP
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra20 chips. The EMC controls the external DRAM on the board.
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index a49658d217a7..5e10aa97809f 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -9,18 +9,25 @@
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
 #include <linux/err.h>
+#include <linux/interconnect-provider.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/types.h>
 
+#include <soc/tegra/common.h>
 #include <soc/tegra/fuse.h>
 
+#include "mc.h"
+
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
 #define EMC_DBG					0x008
@@ -62,6 +69,11 @@
 #define EMC_ODT_READ				0x0b4
 #define EMC_FBIO_CFG5				0x104
 #define EMC_FBIO_CFG6				0x114
+#define EMC_STAT_CONTROL			0x160
+#define EMC_STAT_LLMC_CONTROL			0x178
+#define EMC_STAT_PWR_CLOCK_LIMIT		0x198
+#define EMC_STAT_PWR_CLOCKS			0x19c
+#define EMC_STAT_PWR_COUNT			0x1a0
 #define EMC_AUTO_CAL_INTERVAL			0x2a8
 #define EMC_CFG_2				0x2b8
 #define EMC_CFG_DIG_DLL				0x2bc
@@ -88,6 +100,8 @@
 #define EMC_DBG_READ_DQM_CTRL			BIT(9)
 #define EMC_DBG_CFG_PRIORITY			BIT(24)
 
+#define EMC_FBIO_CFG5_DRAM_WIDTH_X16		BIT(4)
+
 static const u16 emc_timing_registers[] = {
 	EMC_RC,
 	EMC_RFC,
@@ -142,11 +156,25 @@ struct emc_timing {
 	u32 data[ARRAY_SIZE(emc_timing_registers)];
 };
 
+enum emc_rate_request_type {
+	EMC_RATE_DEBUG,
+	EMC_RATE_ICC,
+	EMC_RATE_TYPE_MAX,
+};
+
+struct emc_rate_request {
+	unsigned long min_rate;
+	unsigned long max_rate;
+};
+
 struct tegra_emc {
 	struct device *dev;
+	struct tegra_mc *mc;
+	struct icc_provider provider;
 	struct notifier_block clk_nb;
 	struct clk *clk;
 	void __iomem *regs;
+	unsigned int dram_bus_width;
 
 	struct emc_timing *timings;
 	unsigned int num_timings;
@@ -156,6 +184,15 @@ struct tegra_emc {
 		unsigned long min_rate;
 		unsigned long max_rate;
 	} debugfs;
+
+	/*
+	 * There are multiple sources in the EMC driver which could request
+	 * a min/max clock rate, these rates are contained in this array.
+	 */
+	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
+
+	/* protect shared rate-change code path */
+	struct mutex rate_lock;
 };
 
 static irqreturn_t tegra_emc_isr(int irq, void *data)
@@ -413,7 +450,7 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 static int emc_setup_hw(struct tegra_emc *emc)
 {
 	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
-	u32 emc_cfg, emc_dbg;
+	u32 emc_cfg, emc_dbg, emc_fbio;
 
 	emc_cfg = readl_relaxed(emc->regs + EMC_CFG_2);
 
@@ -444,6 +481,15 @@ static int emc_setup_hw(struct tegra_emc *emc)
 	emc_dbg &= ~EMC_DBG_FORCE_UPDATE;
 	writel_relaxed(emc_dbg, emc->regs + EMC_DBG);
 
+	emc_fbio = readl_relaxed(emc->regs + EMC_FBIO_CFG5);
+
+	if (emc_fbio & EMC_FBIO_CFG5_DRAM_WIDTH_X16)
+		emc->dram_bus_width = 16;
+	else
+		emc->dram_bus_width = 32;
+
+	dev_info(emc->dev, "%ubit DRAM bus\n", emc->dram_bus_width);
+
 	return 0;
 }
 
@@ -488,6 +534,83 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
+static void tegra_emc_rate_requests_init(struct tegra_emc *emc)
+{
+	unsigned int i;
+
+	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
+		emc->requested_rate[i].min_rate = 0;
+		emc->requested_rate[i].max_rate = ULONG_MAX;
+	}
+}
+
+static int emc_request_rate(struct tegra_emc *emc,
+			    unsigned long new_min_rate,
+			    unsigned long new_max_rate,
+			    enum emc_rate_request_type type)
+{
+	struct emc_rate_request *req = emc->requested_rate;
+	unsigned long min_rate = 0, max_rate = ULONG_MAX;
+	unsigned int i;
+	int err;
+
+	/* select minimum and maximum rates among the requested rates */
+	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
+		if (i == type) {
+			min_rate = max(new_min_rate, min_rate);
+			max_rate = min(new_max_rate, max_rate);
+		} else {
+			min_rate = max(req->min_rate, min_rate);
+			max_rate = min(req->max_rate, max_rate);
+		}
+	}
+
+	if (min_rate > max_rate) {
+		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
+				    __func__, type, min_rate, max_rate);
+		return -ERANGE;
+	}
+
+	/*
+	 * EMC rate-changes should go via OPP API because it manages voltage
+	 * changes.
+	 */
+	err = dev_pm_opp_set_rate(emc->dev, min_rate);
+	if (err)
+		return err;
+
+	emc->requested_rate[type].min_rate = new_min_rate;
+	emc->requested_rate[type].max_rate = new_max_rate;
+
+	return 0;
+}
+
+static int emc_set_min_rate(struct tegra_emc *emc, unsigned long rate,
+			    enum emc_rate_request_type type)
+{
+	struct emc_rate_request *req = &emc->requested_rate[type];
+	int ret;
+
+	mutex_lock(&emc->rate_lock);
+	ret = emc_request_rate(emc, rate, req->max_rate, type);
+	mutex_unlock(&emc->rate_lock);
+
+	return ret;
+}
+
+static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
+			    enum emc_rate_request_type type)
+{
+	struct emc_rate_request *req = &emc->requested_rate[type];
+	int ret;
+
+	mutex_lock(&emc->rate_lock);
+	ret = emc_request_rate(emc, req->min_rate, rate, type);
+	mutex_unlock(&emc->rate_lock);
+
+	return ret;
+}
+
 /*
  * debugfs interface
  *
@@ -571,7 +694,7 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	if (!tegra_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = clk_set_min_rate(emc->clk, rate);
+	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -601,7 +724,7 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	if (!tegra_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = clk_set_max_rate(emc->clk, rate);
+	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -658,6 +781,177 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
+static inline struct tegra_emc *
+to_tegra_emc_provider(struct icc_provider *provider)
+{
+	return container_of(provider, struct tegra_emc, provider);
+}
+
+static struct icc_node_data *
+emc_of_icc_xlate_extended(struct of_phandle_args *spec, void *data)
+{
+	struct icc_provider *provider = data;
+	struct icc_node_data *ndata;
+	struct icc_node *node;
+
+	/* External Memory is the only possible ICC route */
+	list_for_each_entry(node, &provider->nodes, node_list) {
+		if (node->id != TEGRA_ICC_EMEM)
+			continue;
+
+		ndata = kzalloc(sizeof(*ndata), GFP_KERNEL);
+		if (!ndata)
+			return ERR_PTR(-ENOMEM);
+
+		/*
+		 * SRC and DST nodes should have matching TAG in order to have
+		 * it set by default for a requested path.
+		 */
+		ndata->tag = TEGRA_MC_ICC_TAG_ISO;
+		ndata->node = node;
+
+		return ndata;
+	}
+
+	return ERR_PTR(-EPROBE_DEFER);
+}
+
+static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct tegra_emc *emc = to_tegra_emc_provider(dst->provider);
+	unsigned long long peak_bw = icc_units_to_bps(dst->peak_bw);
+	unsigned long long avg_bw = icc_units_to_bps(dst->avg_bw);
+	unsigned long long rate = max(avg_bw, peak_bw);
+	unsigned int dram_data_bus_width_bytes;
+	int err;
+
+	/*
+	 * Tegra20 EMC runs on x2 clock rate of SDRAM bus because DDR data
+	 * is sampled on both clock edges.  This means that EMC clock rate
+	 * equals to the peak data-rate.
+	 */
+	dram_data_bus_width_bytes = emc->dram_bus_width / 8;
+	do_div(rate, dram_data_bus_width_bytes);
+	rate = min_t(u64, rate, U32_MAX);
+
+	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra_emc_interconnect_init(struct tegra_emc *emc)
+{
+	const struct tegra_mc_soc *soc;
+	struct icc_node *node;
+	int err;
+
+	emc->mc = devm_tegra_memory_controller_get(emc->dev);
+	if (IS_ERR(emc->mc))
+		return PTR_ERR(emc->mc);
+
+	soc = emc->mc->soc;
+
+	emc->provider.dev = emc->dev;
+	emc->provider.set = emc_icc_set;
+	emc->provider.data = &emc->provider;
+	emc->provider.aggregate = soc->icc_ops->aggregate;
+	emc->provider.xlate_extended = emc_of_icc_xlate_extended;
+
+	err = icc_provider_add(&emc->provider);
+	if (err)
+		goto err_msg;
+
+	/* create External Memory Controller node */
+	node = icc_node_create(TEGRA_ICC_EMC);
+	if (IS_ERR(node)) {
+		err = PTR_ERR(node);
+		goto del_provider;
+	}
+
+	node->name = "External Memory Controller";
+	icc_node_add(node, &emc->provider);
+
+	/* link External Memory Controller to External Memory (DRAM) */
+	err = icc_link_create(node, TEGRA_ICC_EMEM);
+	if (err)
+		goto remove_nodes;
+
+	/* create External Memory node */
+	node = icc_node_create(TEGRA_ICC_EMEM);
+	if (IS_ERR(node)) {
+		err = PTR_ERR(node);
+		goto remove_nodes;
+	}
+
+	node->name = "External Memory (DRAM)";
+	icc_node_add(node, &emc->provider);
+
+	return 0;
+
+remove_nodes:
+	icc_nodes_remove(&emc->provider);
+del_provider:
+	icc_provider_del(&emc->provider);
+err_msg:
+	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
+
+	return err;
+}
+
+static int tegra_emc_opp_table_init(struct tegra_emc *emc)
+{
+	struct opp_table *opp_table;
+	const char *rname = "core";
+	int err;
+
+	/*
+	 * Legacy device-trees don't have OPP table and EMC driver isn't
+	 * useful in this case.
+	 */
+	if (!device_property_present(emc->dev, "operating-points-v2")) {
+		dev_err(emc->dev,
+			"OPP table not found, please update your device tree\n");
+		return -ENODEV;
+	}
+
+	/* voltage scaling is optional */
+	if (device_property_present(emc->dev, "core-supply"))
+		opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
+	else
+		opp_table = dev_pm_opp_get_opp_table(emc->dev);
+
+	if (IS_ERR(opp_table))
+		return dev_err_probe(emc->dev, PTR_ERR(opp_table),
+				     "failed to prepare OPP table\n");
+
+	err = dev_pm_opp_of_add_table(emc->dev);
+	if (err) {
+		dev_err(emc->dev, "failed to add OPP table: %d\n", err);
+		goto put_table;
+	}
+
+	dev_info(emc->dev, "current clock rate %lu MHz\n",
+		 clk_get_rate(emc->clk) / 1000000);
+
+	/* first dummy rate-set initializes voltage state */
+	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
+	if (err) {
+		dev_err(emc->dev, "failed to initialize OPP clock: %d\n", err);
+		goto remove_table;
+	}
+
+	return 0;
+
+remove_table:
+	dev_pm_opp_of_remove_table(emc->dev);
+put_table:
+	dev_pm_opp_put_regulators(opp_table);
+
+	return err;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -674,6 +968,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (!emc)
 		return -ENOMEM;
 
+	mutex_init(&emc->rate_lock);
 	emc->clk_nb.notifier_call = tegra_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
@@ -716,8 +1011,14 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		goto unset_cb;
 	}
 
+	err = tegra_emc_opp_table_init(emc);
+	if (err)
+		goto unreg_notifier;
+
 	platform_set_drvdata(pdev, emc);
+	tegra_emc_rate_requests_init(emc);
 	tegra_emc_debugfs_init(emc);
+	tegra_emc_interconnect_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
@@ -728,6 +1029,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	return 0;
 
+unreg_notifier:
+	clk_notifier_unregister(emc->clk, &emc->clk_nb);
 unset_cb:
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
 
@@ -746,6 +1049,7 @@ static struct platform_driver tegra_emc_driver = {
 		.name = "tegra20-emc",
 		.of_match_table = tegra_emc_of_match,
 		.suppress_bind_attrs = true,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(tegra_emc_driver);
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index a8098bff91d9..29ecf02805a0 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -3,6 +3,10 @@
  * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
 #include <dt-bindings/memory/tegra20-mc.h>
 
 #include "mc.h"
@@ -280,6 +284,78 @@ static const struct tegra_mc_reset_ops tegra20_mc_reset_ops = {
 	.reset_status = tegra20_mc_reset_status,
 };
 
+static int tegra20_mc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	/*
+	 * It should be possible to tune arbitration knobs here, but the
+	 * default values are known to work well on all devices. Hence
+	 * nothing to do here so far.
+	 */
+	return 0;
+}
+
+static int tegra20_mc_icc_aggreate(struct icc_node *node, u32 tag, u32 avg_bw,
+				   u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	/*
+	 * ISO clients need to reserve extra bandwidth up-front because
+	 * there could be high bandwidth pressure during initial filling
+	 * of the client's FIFO buffers.  Secondly, we need to take into
+	 * account impurities of the memory subsystem.
+	 */
+	if (tag & TEGRA_MC_ICC_TAG_ISO)
+		peak_bw = tegra_mc_scale_percents(peak_bw, 300);
+
+	*agg_avg += avg_bw;
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static struct icc_node_data *
+tegra20_mc_of_icc_xlate_extended(struct of_phandle_args *spec, void *data)
+{
+	struct tegra_mc *mc = icc_provider_to_tegra_mc(data);
+	unsigned int i, idx = spec->args[0];
+	struct icc_node_data *ndata;
+	struct icc_node *node;
+
+	list_for_each_entry(node, &mc->provider.nodes, node_list) {
+		if (node->id != idx)
+			continue;
+
+		ndata = kzalloc(sizeof(*ndata), GFP_KERNEL);
+		if (!ndata)
+			return ERR_PTR(-ENOMEM);
+
+		ndata->node = node;
+
+		/* these clients are isochronous by default */
+		if (strstarts(node->name, "display") ||
+		    strstarts(node->name, "vi"))
+			ndata->tag = TEGRA_MC_ICC_TAG_ISO;
+		else
+			ndata->tag = TEGRA_MC_ICC_TAG_DEFAULT;
+
+		return ndata;
+	}
+
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		if (mc->soc->clients[i].id == idx)
+			return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	dev_err(mc->dev, "invalid ICC client ID %u\n", idx);
+
+	return ERR_PTR(-EINVAL);
+}
+
+static const struct tegra_mc_icc_ops tegra20_mc_icc_ops = {
+	.xlate_extended = tegra20_mc_of_icc_xlate_extended,
+	.aggregate = tegra20_mc_icc_aggreate,
+	.set = tegra20_mc_icc_set,
+};
+
 const struct tegra_mc_soc tegra20_mc_soc = {
 	.clients = tegra20_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra20_mc_clients),
@@ -290,4 +366,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.reset_ops = &tegra20_mc_reset_ops,
 	.resets = tegra20_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
+	.icc_ops = &tegra20_mc_icc_ops,
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
