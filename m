Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F7D2987C7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D9C6E853;
	Mon, 26 Oct 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBFA6E2E6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:27 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l2so9444355lfk.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X/quYQuLiS9Hb/X2/ZpOD2OYlalLEdAaOFzDl7YFvnY=;
 b=tSnTLcTshFavkM04kXkNFDVHYKJtnpeKpa7tkn15Z1udSp/kaBFvx0bsMkEjTZeBuc
 fFWsKPNJK9tI6FXrpNELsRBreg4IZ8u9jIE15kbDd8s3ntZmdrspoDs8r3cdR3LJNLYW
 JPU9N8ej3/IwL+4faHYhKe3IcmEsxeNV9UJznzLphC7mYSq3l0SFzKzxWKSmwE7CM5gG
 xCQha4fClGhabyikadLmJ4fn1F7kY5MJCfS3z8fBhD2V1CsLKW/n02UNESLIB8QueKCn
 FkNWbOJ+19xqRRgLrqBNby9PMdBmtyf9pRjIBnVmR8i9Bu8fPyQphjIw+7YCoqv6YiYB
 A+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/quYQuLiS9Hb/X2/ZpOD2OYlalLEdAaOFzDl7YFvnY=;
 b=ETByQD8OnTB112wPvyT13CB/CHtzdKhtju84oBSNUgW9gslvgfmIACs149N+ccRL01
 ZLvB+aVh+ScQSSkfXBGUAZ/3NT7XCKL2lD0r/Kbk4yH1uqamZyOQVUN9ehZkXUw4+MNA
 9++y6x0e8YsrSMlCqYY7HLT4mmkUHYLelLnZr2ZwYCQtEExP7fm9IzPDL7EtlXrshu9z
 0pE3STon1AC8OPme3wJWc82xDfQg1NT8cKtOi5U6WCwpzjEHrrWcGpmckXR5XB8TeME6
 GX6Y+A6mqU/4rpXmtH/OgM4MDSdZ6GgU+REqcnwLmsEEa3iJIh1UhepYA1BvOJcEfoVw
 LJhw==
X-Gm-Message-State: AOAM531T0pvwk9ryZwQXoR1UWyIVTk21wYTrXVh5vau7I3ghRg3OXBY8
 hWuUmDE9eg8n8oa3fEHzZoM=
X-Google-Smtp-Source: ABdhPJx+i71TknzNwqoL99JxK+aNLt6kLSn/1+n9rduIIE1PlkhrSAzFB9aPyTMT2ZrXb9bfGburbg==
X-Received: by 2002:a05:6512:3248:: with SMTP id
 c8mr3925961lfr.156.1603664306087; 
 Sun, 25 Oct 2020 15:18:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:25 -0700 (PDT)
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
Subject: [PATCH v6 33/52] memory: tegra20: Support interconnect framework
Date: Mon, 26 Oct 2020 01:17:16 +0300
Message-Id: <20201025221735.3062-34-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
 drivers/memory/tegra/mc.h          |  12 ++
 drivers/memory/tegra/tegra20-emc.c | 176 +++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra20.c     |  34 ++++++
 4 files changed, 224 insertions(+), 1 deletion(-)

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
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index abeb6a2cc36a..531fb4fb7b17 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -78,6 +78,18 @@
 
 #define MC_TIMING_UPDATE				BIT(0)
 
+static inline u32 tegra_mc_scale_percents(u64 val, unsigned int percents)
+{
+	val = val * percents;
+	do_div(val, 100);
+
+	/*
+	 * High freq + high boosting percent + large polling interval are
+	 * resulting in integer overflow when watermarks are calculated.
+	 */
+	return min_t(u64, val, U32_MAX);
+}
+
 static inline u32 mc_readl(struct tegra_mc *mc, unsigned long offset)
 {
 	return readl_relaxed(mc->regs + offset);
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 34085e26dced..69ccb3fe5b0b 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -9,6 +9,7 @@
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
 #include <linux/err.h>
+#include <linux/interconnect-provider.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -16,11 +17,15 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/types.h>
 
 #include <soc/tegra/fuse.h>
 
+#include "mc.h"
+
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
 #define EMC_DBG					0x008
@@ -144,6 +149,9 @@ struct emc_timing {
 
 struct tegra_emc {
 	struct device *dev;
+	struct tegra_mc *mc;
+	struct opp_table *opp_table;
+	struct icc_provider provider;
 	struct notifier_block clk_nb;
 	struct clk *clk;
 	void __iomem *regs;
@@ -658,6 +666,166 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
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
+	return ERR_PTR(-EINVAL);
+}
+
+static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct tegra_emc *emc = to_tegra_emc_provider(dst->provider);
+	unsigned long long peak_bw = icc_units_to_bps(dst->peak_bw);
+	unsigned long long avg_bw = icc_units_to_bps(dst->avg_bw);
+	unsigned long long rate = max(avg_bw, peak_bw);
+	unsigned int dram_data_bus_width_bytes = 4;
+	long rounded_rate;
+	int err;
+
+	/*
+	 * Tegra20 EMC runs on x2 clock rate of SDRAM bus because DDR data
+	 * is sampled on both clock edges. This means that EMC clock rate
+	 * equals to the peak data rate.
+	 */
+	do_div(rate, dram_data_bus_width_bytes);
+	rate = min_t(u64, rate, U32_MAX);
+
+	rounded_rate = emc_round_rate(rate, 0, U32_MAX, emc);
+	if (rounded_rate < 0)
+		return rounded_rate;
+
+	err = dev_pm_opp_set_rate(emc->dev, rounded_rate);
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
+	emc->mc = devm_tegra_get_memory_controller(emc->dev);
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
+	err = PTR_ERR_OR_ZERO(node);
+	if (err)
+		goto del_provider;
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
+	err = PTR_ERR_OR_ZERO(node);
+	if (err)
+		goto remove_nodes;
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
+	const char *rname = "core";
+	int err;
+
+	/*
+	 * Legacy device-trees don't have OPP table and EMC driver isn't
+	 * useful in this case.
+	 */
+	if (!device_property_present(emc->dev, "operating-points-v2")) {
+		dev_err(emc->dev, "OPP table not found\n");
+		dev_err(emc->dev, "please update your device tree\n");
+		return -ENODEV;
+	}
+
+	/* voltage scaling is optional */
+	if (device_property_present(emc->dev, "core-supply"))
+		emc->opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
+	else
+		emc->opp_table = dev_pm_opp_get_opp_table(emc->dev);
+
+	if (IS_ERR(emc->opp_table))
+		return dev_err_probe(emc->dev, PTR_ERR(emc->opp_table),
+				     "failed to prepare OPP table\n");
+
+	err = dev_pm_opp_of_add_table(emc->dev);
+	if (err) {
+		dev_err(emc->dev, "failed to add OPP table: %d\n", err);
+		goto put_table;
+	}
+
+	return 0;
+
+put_table:
+	dev_pm_opp_put_opp_table(emc->opp_table);
+
+	return err;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -717,8 +885,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		goto unset_cb;
 	}
 
+	err = tegra_emc_opp_table_init(emc);
+	if (err)
+		goto unreg_notifier;
+
 	platform_set_drvdata(pdev, emc);
 	tegra_emc_debugfs_init(emc);
+	tegra_emc_interconnect_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
@@ -729,6 +902,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	return 0;
 
+unreg_notifier:
+	clk_notifier_unregister(emc->clk, &emc->clk_nb);
 unset_cb:
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
 
@@ -747,6 +922,7 @@ static struct platform_driver tegra_emc_driver = {
 		.name = "tegra20-emc",
 		.of_match_table = tegra_emc_of_match,
 		.suppress_bind_attrs = true,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(tegra_emc_driver);
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index a8098bff91d9..5127e8e8250f 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -280,6 +280,39 @@ static const struct tegra_mc_reset_ops tegra20_mc_reset_ops = {
 	.reset_status = tegra20_mc_reset_status,
 };
 
+static int tegra20_mc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	/*
+	 * Technically, it should be possible to tune arbitration knobs here,
+	 * but the default values are known to work well on all devices.
+	 * Hence nothing to do here so far.
+	 */
+	return 0;
+}
+
+static int tegra20_mc_icc_aggreate(struct icc_node *node, u32 tag, u32 avg_bw,
+				   u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	/*
+	 * ISO clients need to reserve extra bandwidth up-front because
+	 * there could high bandwidth pressure during initial fulling-up
+	 * of the client's FIFO buffers. Secondly, we need to take into
+	 * account impurities of the memory subsystem.
+	 */
+	if (tag == TEGRA_MC_ICC_TAG_ISO)
+		peak_bw = tegra_mc_scale_percents(peak_bw, 300);
+
+	*agg_avg += avg_bw;
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static const struct tegra_mc_icc_ops tegra20_mc_icc_ops = {
+	.aggregate = tegra20_mc_icc_aggreate,
+	.set = tegra20_mc_icc_set,
+};
+
 const struct tegra_mc_soc tegra20_mc_soc = {
 	.clients = tegra20_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra20_mc_clients),
@@ -290,4 +323,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
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
