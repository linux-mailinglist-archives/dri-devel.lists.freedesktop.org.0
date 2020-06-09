Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9341F4F28
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B64B6E3FC;
	Wed, 10 Jun 2020 07:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968576E2D8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:15:04 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x22so12472134lfd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7K6pP+VtdggFZCsP3lFDVTttDH/0LC9bYXS86TOH5s=;
 b=gpz1dVmGBS0JAbbGjI2zfwNKRCHvLrspiNt4fq2GRSzA391Qr0vfeCTsyIRAer/4Ve
 RoqJunmdCHCAQAA9wAQiT/GqKQexWEMILhCBxSpo5KImBza98KvVbpTbROSO/RgquH97
 4H12d9Zdmeh0ybgb4V57JH+9eVjoyGCpU3dxNeBR24H+MZUCGsQasFyrEu6SG1p6EC/r
 Lf2EQJ3XGzL3c9RdCSw43hN6Nwb7Y6qqSyZ3jABVwF6GRXKyLSR+Z/YmuesJBAha9NDf
 Nx0E7I4lN8MkNzdkcJEe1vQXLCgxnobtv59F+yJxfWXtP9aMWVxESrCrYHffyPROP/J9
 JvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7K6pP+VtdggFZCsP3lFDVTttDH/0LC9bYXS86TOH5s=;
 b=iD1VvvOENEU6sYRZyQx9/S/7ARUvGcVaZyA3AEMNS13uxNktvXAipaeax1AqMkFnZR
 1Ga3hfrWuzyxMRaO3+uJ6/0yydnVgFXsCLZVJ5ZA6PPedsXpFuEhFnri3UvflVHjhNdW
 3FXX0NgYuQmHhvHVJwGIRs6mrBIezow3tfIci8RmEZNmUNxtlhr1Kt2Kxuy302TfyhGB
 AcNINsM1+QFI3mT7DAggzBQwPa/dmP9wQAzGjawojbbW8vyt8VezWoqO0Zr74NbrIEPE
 fCRUyLQODgtzqHHVLvVipbcea2WO2wdnRn0jSu/sOPDi+0Qrlcul8CcYUIPCTHQ+Pr+v
 LlCA==
X-Gm-Message-State: AOAM530AKMevbtd7ngRZ98yHRrU/INsR+yffFRBl5WxLmKONq2FwbR+N
 BQKL7P8e97mRcydVh8UBtbQ=
X-Google-Smtp-Source: ABdhPJwPGbudINukH8h1BPvKKcnsUFOEztbYVGuIQyCRXoLqJ2LoTQ2Y/j1f0h4O68zrJBXYiJqVZg==
X-Received: by 2002:a19:ae0f:: with SMTP id f15mr15731902lfc.142.1591708502997; 
 Tue, 09 Jun 2020 06:15:02 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:15:02 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v4 31/37] memory: tegra20-emc: Register as interconnect
 provider
Date: Tue,  9 Jun 2020 16:13:58 +0300
Message-Id: <20200609131404.17523-32-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now memory controller is a memory interconnection provider. This allows us
to use interconnect API in order to change memory configuration.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 6cd3d50145dc..ef0f5a69f24b 100644
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
@@ -148,6 +149,7 @@ struct emc_timing {
 struct tegra_emc {
 	struct device *dev;
 	struct notifier_block clk_nb;
+	struct icc_provider provider;
 	struct clk *clk;
 	void __iomem *regs;
 
@@ -661,6 +663,113 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
+static inline struct tegra_emc *
+to_tegra_emc_provider(struct icc_provider *provider)
+{
+	return container_of(provider, struct tegra_emc, provider);
+}
+
+static struct icc_node *
+emc_of_icc_xlate(struct of_phandle_args *spec, void *data)
+{
+	struct icc_provider *provider = data;
+	struct icc_node *node;
+
+	/* External Memory is the only possible ICC route */
+	list_for_each_entry(node, &provider->nodes, node_list) {
+		if (node->id == TEGRA_ICC_EMEM)
+			return node;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct tegra_emc *emc = to_tegra_emc_provider(dst->provider);
+	unsigned long long rate = icc_units_to_bps(dst->avg_bw);
+	unsigned int dram_data_bus_width_bytes = 4;
+	unsigned int ddr = 2;
+	int err;
+
+	do_div(rate, ddr * dram_data_bus_width_bytes);
+	rate = min_t(u64, rate, U32_MAX);
+
+	err = clk_set_min_rate(emc->clk, rate);
+	if (err)
+		return err;
+
+	err = clk_set_rate(emc->clk, rate);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int emc_icc_aggregate(struct icc_node *node,
+			     u32 tag, u32 avg_bw, u32 peak_bw,
+			     u32 *agg_avg, u32 *agg_peak)
+{
+	*agg_avg = min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static int tegra_emc_interconnect_init(struct tegra_emc *emc)
+{
+	struct icc_node *node;
+	int err;
+
+	/* older device-trees don't have interconnect properties */
+	if (!of_find_property(emc->dev->of_node, "#interconnect-cells", NULL))
+		return 0;
+
+	emc->provider.dev = emc->dev;
+	emc->provider.set = emc_icc_set;
+	emc->provider.data = &emc->provider;
+	emc->provider.xlate = emc_of_icc_xlate;
+	emc->provider.aggregate = emc_icc_aggregate;
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
 static int tegra_emc_init_mc_timings(struct tegra_emc *emc)
 {
 	struct tegra_mc_timing *timing;
@@ -766,6 +875,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, emc);
 	tegra_emc_debugfs_init(emc);
+	tegra_emc_interconnect_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
