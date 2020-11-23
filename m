Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75DE2BFDE3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 02:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ECF89B48;
	Mon, 23 Nov 2020 01:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F58189B3B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 00:31:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id s30so21457516lfc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 16:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Od8uKLkk5/TlE95YKjfvYs2gQB/tKXFyfZIoEa0kDEA=;
 b=nn5hEuOi7qzvCBYCGqyL+UzjlBdW1JjfvyXdiuT7c0H93rvF/G6egEWilT/LN/U0OZ
 pR2S4o0jyjzylBNdeMy4eJ5278F0Zk5ZrKHtOYZ2VULmmQIi0JkA70hsQY3f6By7BfZz
 7FSQYaagyjazLU/HddNZB89/GpMlHfn24LrGEH8uaAzgboE4C/cZc/WWd1VCHapj7MCd
 gP4BaWrY+AfwniafIPhxcLkCBNNoCC0/EDv9Z1q/gLwHEELIX0uG+HX0TICztaIdfy+H
 sMbTB1HThjoGzr22W95d5bWbIJuY8S1kvYuJcDU67bcjVu2SBnvhjVTEH1mnS8oot+/d
 rPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Od8uKLkk5/TlE95YKjfvYs2gQB/tKXFyfZIoEa0kDEA=;
 b=fx4pmc1q4XyAwkgTBSWvsvSpZr+O80syCyjtIX9t0zCZo/wo9RorqJHT/u3UdRdNaw
 D8PN+TaFI6XP4niK9zcxybhpwt4BDZ9N/Dx2gErofwtRTPRUbmVCOtpBg7hDqIsqC9P7
 V45uHxF864QO2OpkZTH4kkkh+j3EqK1c0LaQ2nOBC5X673Un9wncWViBbZ9jUzexvsyr
 +rVr/LygMuQgD9WBGV/k6WiifZZnGmXfoVsgwAL161ImW8Y2IvsHEPUzCZ7/oJg6/aSw
 FC+abseeeJ38BprkPIiva4E8pVqKCXUdfDveL9POve8JnyT/Af89X+EjQT7nSdrasZnP
 IY2A==
X-Gm-Message-State: AOAM532Ut+ZNOmQ227O+6eSoxMq83gj4triujWvJEgNopIjQVpgnPEx0
 nuKODOXv1ydYfGZ3D1whBFA=
X-Google-Smtp-Source: ABdhPJxmKBZBxjZ1mYcNa8oOEW5mFDK8+QUN5ks3U9l8+ZNMWu0lj6T1fEOQamYAQHXnwKI3gN/dcg==
X-Received: by 2002:a19:7f48:: with SMTP id a69mr13578857lfd.379.1606091476824; 
 Sun, 22 Nov 2020 16:31:16 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id r27sm1225823lfn.290.2020.11.22.16.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 16:31:16 -0800 (PST)
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
Subject: [PATCH v10 03/19] memory: tegra30: Support interconnect framework
Date: Mon, 23 Nov 2020 03:27:07 +0300
Message-Id: <20201123002723.28463-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 01:06:28 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now Internal and External memory controllers are memory interconnection
providers. This allows us to use interconnect API for tuning of memory
configuration. EMC driver now supports OPPs and DVFS. MC driver now
supports tuning of memory arbitration latency, which needs to be done
for ISO memory clients, like a Display client for example.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |   1 +
 drivers/memory/tegra/tegra30-emc.c | 344 +++++++++++++++++++++++++++--
 drivers/memory/tegra/tegra30.c     | 173 ++++++++++++++-
 3 files changed, 496 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 2a4a16bcf91c..ca7077a06f4c 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -24,6 +24,7 @@ config TEGRA30_EMC
 	tristate "NVIDIA Tegra30 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_3x_SOC
+	select PM_OPP
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra30 chips. The EMC controls the external DRAM on the board.
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 3488786da03b..969105a41f81 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -14,16 +14,21 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/interconnect-provider.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/types.h>
 
+#include <soc/tegra/common.h>
 #include <soc/tegra/fuse.h>
 
 #include "mc.h"
@@ -323,9 +328,21 @@ struct emc_timing {
 	bool emc_cfg_dyn_self_ref;
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
 	struct tegra_mc *mc;
+	struct icc_provider provider;
 	struct notifier_block clk_nb;
 	struct clk *clk;
 	void __iomem *regs;
@@ -352,6 +369,15 @@ struct tegra_emc {
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
 
 static int emc_seq_update_timing(struct tegra_emc *emc)
@@ -1094,6 +1120,83 @@ static long emc_round_rate(unsigned long rate,
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
@@ -1177,7 +1280,7 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	if (!tegra_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = clk_set_min_rate(emc->clk, rate);
+	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1207,7 +1310,7 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	if (!tegra_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = clk_set_max_rate(emc->clk, rate);
+	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1264,6 +1367,214 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
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
+	const unsigned int dram_data_bus_width_bytes = 4;
+	const unsigned int ddr = 2;
+	int err;
+
+	/*
+	 * Tegra30 EMC runs on a clock rate of SDRAM bus.  This means that
+	 * EMC clock rate is twice smaller than the peak data rate because
+	 * data is sampled on both EMC clock edges.
+	 */
+	do_div(rate, ddr * dram_data_bus_width_bytes);
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
+	const struct tegra_mc_soc *soc = emc->mc->soc;
+	struct icc_node *node;
+	int err;
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
+	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
+	struct opp_table *clk_opp_table, *hw_opp_table;
+	int err;
+
+	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
+	err = PTR_ERR_OR_ZERO(clk_opp_table);
+	if (err) {
+		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
+		return err;
+	}
+
+	hw_opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
+	err = PTR_ERR_OR_ZERO(hw_opp_table);
+	if (err) {
+		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
+		goto put_clk_table;
+	}
+
+	err = dev_pm_opp_of_add_table(emc->dev);
+	if (err) {
+		if (err == -ENODEV)
+			dev_err(emc->dev, "OPP table not found, please update your device tree\n");
+		else
+			dev_err(emc->dev, "failed to add OPP table: %d\n", err);
+
+		goto put_hw_table;
+	}
+
+	dev_info(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
+		 hw_version, clk_get_rate(emc->clk) / 1000000);
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
+put_hw_table:
+	dev_pm_opp_put_supported_hw(hw_opp_table);
+put_clk_table:
+	dev_pm_opp_put_clkname(clk_opp_table);
+
+	return err;
+}
+
+static void devm_tegra_emc_unset_callback(void *data)
+{
+	tegra20_clk_set_emc_round_callback(NULL, NULL);
+}
+
+static void devm_tegra_emc_unreg_clk_notifier(void *data)
+{
+	struct tegra_emc *emc = data;
+
+	clk_notifier_unregister(emc->clk, &emc->clk_nb);
+}
+
+static int tegra_emc_init_clk(struct tegra_emc *emc)
+{
+	int err;
+
+	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
+
+	err = devm_add_action_or_reset(emc->dev, devm_tegra_emc_unset_callback,
+				       NULL);
+	if (err)
+		return err;
+
+	emc->clk = devm_clk_get(emc->dev, NULL);
+	if (IS_ERR(emc->clk)) {
+		dev_err(emc->dev, "failed to get EMC clock: %pe\n", emc->clk);
+		return PTR_ERR(emc->clk);
+	}
+
+	err = clk_notifier_register(emc->clk, &emc->clk_nb);
+	if (err) {
+		dev_err(emc->dev, "failed to register clk notifier: %d\n", err);
+		return err;
+	}
+
+	err = devm_add_action_or_reset(emc->dev,
+				       devm_tegra_emc_unreg_clk_notifier, emc);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -1280,6 +1591,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (IS_ERR(emc->mc))
 		return PTR_ERR(emc->mc);
 
+	mutex_init(&emc->rate_lock);
 	emc->clk_nb.notifier_call = emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
@@ -1312,24 +1624,18 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
-
-	emc->clk = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(emc->clk)) {
-		err = PTR_ERR(emc->clk);
-		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
-		goto unset_cb;
-	}
+	err = tegra_emc_init_clk(emc);
+	if (err)
+		return err;
 
-	err = clk_notifier_register(emc->clk, &emc->clk_nb);
-	if (err) {
-		dev_err(&pdev->dev, "failed to register clk notifier: %d\n",
-			err);
-		goto unset_cb;
-	}
+	err = tegra_emc_opp_table_init(emc);
+	if (err)
+		return err;
 
 	platform_set_drvdata(pdev, emc);
+	tegra_emc_rate_requests_init(emc);
 	tegra_emc_debugfs_init(emc);
+	tegra_emc_interconnect_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
@@ -1339,11 +1645,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	try_module_get(THIS_MODULE);
 
 	return 0;
-
-unset_cb:
-	tegra20_clk_set_emc_round_callback(NULL, NULL);
-
-	return err;
 }
 
 static int tegra_emc_suspend(struct device *dev)
@@ -1397,6 +1698,7 @@ static struct platform_driver tegra_emc_driver = {
 		.of_match_table = tegra_emc_of_match,
 		.pm = &tegra_emc_pm_ops,
 		.suppress_bind_attrs = true,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(tegra_emc_driver);
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index d0314f29608d..ea849003014b 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -4,7 +4,8 @@
  */
 
 #include <linux/of.h>
-#include <linux/mm.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
 
 #include <dt-bindings/memory/tegra30-mc.h>
 
@@ -1083,6 +1084,175 @@ static const struct tegra_mc_reset tegra30_mc_resets[] = {
 	TEGRA30_MC_RESET(VI,       0x200, 0x204, 17),
 };
 
+static void tegra30_mc_tune_client_latency(struct tegra_mc *mc,
+					   const struct tegra_mc_client *client,
+					   unsigned int bandwidth_mbytes_sec)
+{
+	u32 arb_tolerance_compensation_nsec, arb_tolerance_compensation_div;
+	const struct tegra_mc_la *la = &client->la;
+	unsigned int fifo_size = client->fifo_size;
+	u32 arb_nsec, la_ticks, value;
+
+	/* see 18.4.1 Client Configuration in Tegra3 TRM v03p */
+	if (bandwidth_mbytes_sec)
+		arb_nsec = fifo_size * NSEC_PER_USEC / bandwidth_mbytes_sec;
+	else
+		arb_nsec = U32_MAX;
+
+	/*
+	 * Latency allowness should be set with consideration for the module's
+	 * latency tolerance and internal buffering capabilities.
+	 *
+	 * Display memory clients use isochronous transfers and have very low
+	 * tolerance to a belated transfers. Hence we need to compensate the
+	 * memory arbitration imperfection for them in order to prevent FIFO
+	 * underflow condition when memory bus is busy.
+	 *
+	 * VI clients also need a stronger compensation.
+	 */
+	switch (client->swgroup) {
+	case TEGRA_SWGROUP_MPCORE:
+	case TEGRA_SWGROUP_PTC:
+		/*
+		 * We always want lower latency for these clients, hence
+		 * don't touch them.
+		 */
+		return;
+
+	case TEGRA_SWGROUP_DC:
+	case TEGRA_SWGROUP_DCB:
+		arb_tolerance_compensation_nsec = 1050;
+		arb_tolerance_compensation_div = 2;
+		break;
+
+	case TEGRA_SWGROUP_VI:
+		arb_tolerance_compensation_nsec = 1050;
+		arb_tolerance_compensation_div = 1;
+		break;
+
+	default:
+		arb_tolerance_compensation_nsec = 150;
+		arb_tolerance_compensation_div = 1;
+		break;
+	}
+
+	if (arb_nsec > arb_tolerance_compensation_nsec)
+		arb_nsec -= arb_tolerance_compensation_nsec;
+	else
+		arb_nsec = 0;
+
+	arb_nsec /= arb_tolerance_compensation_div;
+
+	/*
+	 * Latency allowance is a number of ticks a request from a particular
+	 * client may wait in the EMEM arbiter before it becomes a high-priority
+	 * request.
+	 */
+	la_ticks = arb_nsec / mc->tick;
+	la_ticks = min(la_ticks, la->mask);
+
+	value = mc_readl(mc, la->reg);
+	value &= ~(la->mask << la->shift);
+	value |= la_ticks << la->shift;
+	mc_writel(mc, value, la->reg);
+}
+
+static int tegra30_mc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct tegra_mc *mc = icc_provider_to_tegra_mc(src->provider);
+	const struct tegra_mc_client *client = &mc->soc->clients[src->id];
+	u64 peak_bandwidth = icc_units_to_bps(src->peak_bw);
+
+	/*
+	 * Skip pre-initialization that is done by icc_node_add(), which sets
+	 * bandwidth to maximum for all clients before drivers are loaded.
+	 *
+	 * This doesn't make sense for us because we don't have drivers for all
+	 * clients and it's okay to keep configuration left from bootloader
+	 * during boot, at least for today.
+	 */
+	if (src == dst)
+		return 0;
+
+	/* convert bytes/sec to megabytes/sec */
+	do_div(peak_bandwidth, 1000000);
+
+	tegra30_mc_tune_client_latency(mc, client, peak_bandwidth);
+
+	return 0;
+}
+
+static int tegra30_mc_icc_aggreate(struct icc_node *node, u32 tag, u32 avg_bw,
+				   u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	/*
+	 * ISO clients need to reserve extra bandwidth up-front because
+	 * there could be high bandwidth pressure during initial filling
+	 * of the client's FIFO buffers.  Secondly, we need to take into
+	 * account impurities of the memory subsystem.
+	 */
+	if (tag & TEGRA_MC_ICC_TAG_ISO)
+		peak_bw = tegra_mc_scale_percents(peak_bw, 400);
+
+	*agg_avg += avg_bw;
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static struct icc_node_data *
+tegra30_mc_of_icc_xlate_extended(struct of_phandle_args *spec, void *data)
+{
+	struct tegra_mc *mc = icc_provider_to_tegra_mc(data);
+	const struct tegra_mc_client *client;
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
+		client = &mc->soc->clients[idx];
+		ndata->node = node;
+
+		switch (client->swgroup) {
+		case TEGRA_SWGROUP_DC:
+		case TEGRA_SWGROUP_DCB:
+		case TEGRA_SWGROUP_PTC:
+		case TEGRA_SWGROUP_VI:
+			/* these clients are isochronous by default */
+			ndata->tag = TEGRA_MC_ICC_TAG_ISO;
+			break;
+
+		default:
+			ndata->tag = TEGRA_MC_ICC_TAG_DEFAULT;
+			break;
+		}
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
+static const struct tegra_mc_icc_ops tegra30_mc_icc_ops = {
+	.xlate_extended = tegra30_mc_of_icc_xlate_extended,
+	.aggregate = tegra30_mc_icc_aggreate,
+	.set = tegra30_mc_icc_set,
+};
+
 const struct tegra_mc_soc tegra30_mc_soc = {
 	.clients = tegra30_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra30_mc_clients),
@@ -1097,4 +1267,5 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra30_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
+	.icc_ops = &tegra30_mc_icc_ops,
 };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
