Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41692987DE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473246E882;
	Mon, 26 Oct 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686D26E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m16so7720567ljo.6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=53R9ReHiAZ2LSI2wAiUXAN48a+5VvKwvMCg5ujEfp1s=;
 b=ruHncWpXYOUQzbCAXMEHNlPiFmsjeqOJsXfUkcFvDoqliR1nr2XNWE4GH+B+yAhFk+
 UEimbvh1WyhUO59cdLh1fKeax7lS7B7S1UOX7o2M28XSOx748wOvg+upGlU+zcFL9ZbE
 c0IKmcxoy29YmzofUcpMS9bvxdE1yAQA5f2XRNS0HxDXILJULLx0F2hLmviClAQSMhVq
 IRSzvIuxdTSsV74r0xOH8mYak0BFLX8TItcF+rMV/EdsB5irUGTzTOLR5AVwL4rwfoYe
 J7TECOlMAIk4dS9DnHqAAvUCWMvsBiHdNHCDiZsJM4fNinpZa6m8fLo75v8E6AcX13Zg
 aknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=53R9ReHiAZ2LSI2wAiUXAN48a+5VvKwvMCg5ujEfp1s=;
 b=V5TqjjVtzULRey4GzlBZb1j9FzvH+P8d+54RU+3ZJSPNIdL1espBvtZ7o43z5lfLS9
 zi9ZPEEHavh58nCbhxG/DM5hJ/WiiIEx/U64kEba5ko6XG3z0Z7buER/Q7Nvkvwvodcx
 eORuZ4XjHDpCGn03z7KH2o2+S6fKLgrMA8lmzWdtDjCPt25pP759QK7XUKU56Opurgjz
 OLN9UItHMNiYdM+npacUUPdJZrB8EYZfsuZ4Q4owmZutUTrtikqQHyu0wt8Yxz0NAqJ4
 lo2OwBC8VdrW3R0q+m6NNY/u+H2rcF+yBglaqfkFRYXKGQEGEvD1uZ8O5Cseoit7piED
 p+VA==
X-Gm-Message-State: AOAM532gqsgcUN3ma6rNZYUSAXEZJtKHvqRHpuxf2bC6YcGfhwEsK0Tq
 TDYw3Lkegh7vxkwwMEXG9D4=
X-Google-Smtp-Source: ABdhPJzTwkN5hnuPWyga367ZKVYPkPg2jq7JcgBCKyYshWOivgRtqcyaOxrEB3UX4LyWPd2hVV9NDA==
X-Received: by 2002:a2e:3915:: with SMTP id g21mr4822074lja.18.1603664312766; 
 Sun, 25 Oct 2020 15:18:32 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:32 -0700 (PDT)
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
Subject: [PATCH v6 39/52] memory: tegra30: Support interconnect framework
Date: Mon, 26 Oct 2020 01:17:22 +0300
Message-Id: <20201025221735.3062-40-digetx@gmail.com>
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

Now Internal and External memory controllers are memory interconnection
providers. This allows us to use interconnect API for tuning of memory
configuration. EMC driver now supports OPPs and DVFS. MC driver now
supports tuning of memory arbitration latency, which needs to be done
for ISO memory clients, like a Display client for example.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |   1 +
 drivers/memory/tegra/tegra30-emc.c | 184 ++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra30.c     | 119 +++++++++++++++++++
 3 files changed, 302 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 61cdb5c04b18..73a5c5bca480 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -23,6 +23,7 @@ config TEGRA30_EMC
 	tristate "NVIDIA Tegra30 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_3x_SOC
+	select PM_OPP
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra30 chips. The EMC controls the external DRAM on the board.
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 78f770cf0d64..66eae944ca6d 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -14,6 +14,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/interconnect-provider.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -21,6 +22,8 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/types.h>
 
@@ -326,6 +329,8 @@ struct emc_timing {
 struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
+	struct opp_table *opp_table;
+	struct icc_provider provider;
 	struct notifier_block clk_nb;
 	struct clk *clk;
 	void __iomem *regs;
@@ -973,11 +978,12 @@ static int emc_load_timings_from_dt(struct tegra_emc *emc,
 		return err;
 
 	dev_info(emc->dev,
-		 "got %u timings for RAM code %u (min %luMHz max %luMHz)\n",
+		 "got %u timings for RAM code %u (min %luMHz max %luMHz) OPP HW ver. 0x%lx\n",
 		 emc->num_timings,
 		 tegra_read_ram_code(),
 		 emc->timings[0].rate / 1000000,
-		 emc->timings[emc->num_timings - 1].rate / 1000000);
+		 emc->timings[emc->num_timings - 1].rate / 1000000,
+		 BIT(tegra_sku_info.soc_speedo_id));
 
 	return 0;
 }
@@ -1264,6 +1270,172 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
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
+	unsigned int ddr = 2;
+	long rounded_rate;
+	int err;
+
+	/*
+	 * Tegra30 EMC runs on a clock rate of SDRAM bus. This means that
+	 * EMC clock rate is twice smaller than the peak data rate because
+	 * data is sample on both EMC clock edges.
+	 */
+	do_div(rate, ddr * dram_data_bus_width_bytes);
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
+	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
+	struct opp_table *opp_table;
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
+	opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
+	err = PTR_ERR_OR_ZERO(opp_table);
+	if (err) {
+		dev_err(emc->dev, "failed to set supported HW: %d\n", err);
+		goto put_table;
+	}
+
+	err = dev_pm_opp_of_add_table(emc->dev);
+	if (err) {
+		dev_err(emc->dev, "failed to add OPP table: %d\n", err);
+		goto put_hw;
+	}
+
+	return 0;
+
+put_hw:
+	dev_pm_opp_put_supported_hw(emc->opp_table);
+put_table:
+	dev_pm_opp_put_opp_table(emc->opp_table);
+
+	return err;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -1329,8 +1501,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
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
@@ -1341,6 +1518,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	return 0;
 
+unreg_notifier:
+	clk_notifier_unregister(emc->clk, &emc->clk_nb);
 unset_cb:
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
 
@@ -1398,6 +1577,7 @@ static struct platform_driver tegra_emc_driver = {
 		.of_match_table = tegra_emc_of_match,
 		.pm = &tegra_emc_pm_ops,
 		.suppress_bind_attrs = true,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(tegra_emc_driver);
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 05780a0c6d39..f4ff967d7a10 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1083,6 +1083,124 @@ static const struct tegra_mc_reset tegra30_mc_resets[] = {
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
+		/* we always want lower latency for CPU, hence don't touch it */
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
+	struct icc_provider *provider = src->provider;
+	struct tegra_mc *mc = container_of(provider, struct tegra_mc, provider);
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
+	 * there could high bandwidth pressure during initial fulling-up
+	 * of the client's FIFO buffers. Secondly, we need to take into
+	 * account impurities of the memory subsystem.
+	 */
+	if (tag == TEGRA_MC_ICC_TAG_ISO)
+		peak_bw = tegra_mc_scale_percents(peak_bw, 400);
+
+	*agg_avg += avg_bw;
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static const struct tegra_mc_icc_ops tegra30_mc_icc_ops = {
+	.aggregate = tegra30_mc_icc_aggreate,
+	.set = tegra30_mc_icc_set,
+};
+
 const struct tegra_mc_soc tegra30_mc_soc = {
 	.clients = tegra30_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra30_mc_clients),
@@ -1097,4 +1215,5 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra30_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
+	.icc_ops = &tegra30_mc_icc_ops,
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
