Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F62987C4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CC46E843;
	Mon, 26 Oct 2020 08:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B806E192
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d24so9411626lfa.8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3EhKDbYBl/W4vyGmACGVXwv0qO3ebzMX67r/csDaZQQ=;
 b=ZEa4Ok+Eeh6O6h2WWjVtO+4i/6CJbdyLlhAShpAGNDMJNPKyo/Jgi0YhuPb5q/LSYU
 tQfB517FYY+lIGgC5tDB8uXehydg02cF2ffsVnAjjrSpJQ9ImeWRJl2yb7vWAHz1cBLw
 av3px2uI8/ZgwvNvIxKwNB6Ptje1Sf75j+gzjtFsissqE11Rv5dWiriEP1+wP9AelSIQ
 HGaQMOZ7ODYiJhTprotufZaUU43jtbP39/Pu7DzA6wd3ANym85+6ysP4WiEAjJkQgoog
 F7tfT8PkMtCSjBljVbbh7lH9oocwThSqcPwQQCuOYQv3n/IrylMzepJrMkJn34HEaQjo
 z8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3EhKDbYBl/W4vyGmACGVXwv0qO3ebzMX67r/csDaZQQ=;
 b=LE7TG+RKKk4qIlJDbhCmoHO/hjab5amIHEKqPmrQoCGADbI1ncFf2uKH4TByQYtKqn
 6hebMRHH8/WodJCMpryclkB4r/wpsowIQorlHyaTEBiizZN4MrAmUsfaFAv8uQHN6FXG
 J6W087H04aAzXZi8WHmTBFniCUABaCbEBHe4sBYBNNNlNS3MIOPejqqSRORVi4v3th0A
 VmnGOyqf0tsYGRQX1wqsY9Hdzg8Zf+EzaXasnIc2v90Wy8zY6L/oOtU5Sqymwv/2vNEb
 haYBHvN6hQFV4KKUtncH/tH49D3gNt4/C3tlCi2tNgnViJbFNADgHg8I94entljuQwD7
 0y5A==
X-Gm-Message-State: AOAM5302AnHRTA46yAI4Dtpiw9hA1IvEv7AjXrpSygofIyCPkAEEx+a2
 y/25TJCu2r/emjWXi2m1lsE=
X-Google-Smtp-Source: ABdhPJwuR2DanyajcL3uVnJBhRnxV8Dit/JxgZTRGvekw4lWvdqctPwGyXhg1RFlWvu9MJBC1PgbNQ==
X-Received: by 2002:ac2:550d:: with SMTP id j13mr3843419lfk.475.1603664316155; 
 Sun, 25 Oct 2020 15:18:36 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:35 -0700 (PDT)
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
Subject: [PATCH v6 42/52] memory: tegra124: Support interconnect framework
Date: Mon, 26 Oct 2020 01:17:25 +0300
Message-Id: <20201025221735.3062-43-digetx@gmail.com>
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
configuration. EMC driver now supports OPPs and DVFS.

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig        |   1 +
 drivers/memory/tegra/tegra124-emc.c | 186 +++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra124.c     |  31 +++++
 3 files changed, 216 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 94536dc4c495..3d1ef3ec1a2d 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -34,6 +34,7 @@ config TEGRA124_EMC
 	tristate "NVIDIA Tegra124 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_124_SOC
+	select PM_OPP
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra124 chips. The EMC controls the external DRAM on the board.
diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 2814b1b4a1d9..bdce7bebe0ef 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -12,17 +12,21 @@
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/interconnect-provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/sort.h>
 #include <linux/string.h>
 
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/mc.h>
 
+#include "mc.h"
+
 #define EMC_FBIO_CFG5				0x104
 #define	EMC_FBIO_CFG5_DRAM_TYPE_MASK		0x3
 #define	EMC_FBIO_CFG5_DRAM_TYPE_SHIFT		0
@@ -482,6 +486,9 @@ struct tegra_emc {
 		unsigned long min_rate;
 		unsigned long max_rate;
 	} debugfs;
+
+	struct opp_table *opp_table;
+	struct icc_provider provider;
 };
 
 /* Timing change sequence functions */
@@ -1177,6 +1184,169 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
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
+	unsigned int dram_data_bus_width_bytes = 8;
+	unsigned int ddr = 2;
+	int err;
+
+	/*
+	 * Tegra124 EMC runs on a clock rate of SDRAM bus. This means that
+	 * EMC clock rate is twice smaller than the peak data rate because
+	 * data is sample on both EMC clock edges.
+	 */
+	do_div(rate, ddr * dram_data_bus_width_bytes);
+	rate = min_t(u64, rate, U32_MAX);
+
+	err = dev_pm_opp_set_rate(emc->dev, rate);
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
+	dev_info(emc->dev, "OPP HW ver. 0x%x\n", hw_version);
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
@@ -1226,14 +1396,20 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	platform_set_drvdata(pdev, emc);
-
 	tegra124_clk_set_emc_callbacks(tegra_emc_prepare_timing_change,
 				       tegra_emc_complete_timing_change);
 
+	platform_set_drvdata(pdev, emc);
+
+	err = tegra_emc_opp_table_init(emc);
+	if (err)
+		goto unset_cb;
+
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		emc_debugfs_init(&pdev->dev, emc);
 
+	tegra_emc_interconnect_init(emc);
+
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
 	 * extra complexity which doesn't really worth the effort in a case of
@@ -1242,6 +1418,11 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	try_module_get(THIS_MODULE);
 
 	return 0;
+
+unset_cb:
+	tegra124_clk_set_emc_callbacks(NULL, NULL);
+
+	return err;
 };
 
 static struct platform_driver tegra_emc_driver = {
@@ -1250,6 +1431,7 @@ static struct platform_driver tegra_emc_driver = {
 		.name = "tegra-emc",
 		.of_match_table = tegra_emc_of_match,
 		.suppress_bind_attrs = true,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(tegra_emc_driver);
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index e2389573d3c0..b69d76cd0411 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1010,6 +1010,35 @@ static const struct tegra_mc_reset tegra124_mc_resets[] = {
 	TEGRA124_MC_RESET(GPU,       0x970, 0x974,  2),
 };
 
+static int tegra124_mc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	/* TODO: program PTSA */
+	return 0;
+}
+
+static int tegra124_mc_icc_aggreate(struct icc_node *node, u32 tag, u32 avg_bw,
+				    u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
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
+static const struct tegra_mc_icc_ops tegra124_mc_icc_ops = {
+	.aggregate = tegra124_mc_icc_aggreate,
+	.set = tegra124_mc_icc_set,
+};
+
 #ifdef CONFIG_ARCH_TEGRA_124_SOC
 static const unsigned long tegra124_mc_emem_regs[] = {
 	MC_EMEM_ARB_CFG,
@@ -1061,6 +1090,7 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra124_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
+	.icc_ops = &tegra124_mc_icc_ops,
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1091,5 +1121,6 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra124_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
+	.icc_ops = &tegra124_mc_icc_ops,
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
