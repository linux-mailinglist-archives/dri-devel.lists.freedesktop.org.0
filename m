Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5B197521
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DAC6E027;
	Mon, 30 Mar 2020 07:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E1E89F19
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:50 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f20so16336048ljm.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MHYPefJWQ2jYMV5ChKdxbB+4Vp/yJ7NANKqMVNH2lrQ=;
 b=VcKHNHojJQkkNIkk4s/pQWLeajPjlCG7JcOfFQs6wCbDvRCsIBmXS5CSe5NCIGTRNk
 pY0ivIqW1Y04EEaV/fDSpWI56dOXHaxgkuRwJS4EHWqi6JGfcYLcPM5BNroghts3g4cX
 l7k3jK1uJPfKIxezSlnLiIANzt6zus1pX2XIDuqGZnpMGNJ597FhKD8WGBWgu464H/a2
 8qbLhv/Mrw26/7iPqXluUFfQvqCbiDAdf6wRhfLuWrCMKE//Z9ZXlvpzAMLTUIvHZ0ZT
 ryiw8s1rIFdRcjA+fvFo+XciWrz9NEDnViu7zoOkoklgXMswwsepOFnrR2sFjR1fj1um
 qp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MHYPefJWQ2jYMV5ChKdxbB+4Vp/yJ7NANKqMVNH2lrQ=;
 b=HFflUn/OqHFZPQYGjLpBAd2xKnIS450zhxiUM/mDSvQYQxZYsyPgsaIpGQONvVT4Q0
 +cfh8a/14WuWMRP920zZLmyuKedO8DeKL+H+u2/WsaGaSs4OU2A43aKV3MyLmJcHCeck
 l+vRlflcCm9y1TyHC7a9zqEJwN+N9PkeEprSudFPYowVgaIFKs3JhRZf32YJ7+ifcwZr
 be3RXESFJ+9lmbhsURkM6JlV4tz4G5G2cchgrEA9t5pt6TrWryIubfJ6LP1H0YbYKlPk
 mdBFhDvzQjqj2r4ks+CavTOmFqkVQ8r5/eb36Imy0z/M1LvCtHfaki/eg+A/ZUka5tQP
 M7xA==
X-Gm-Message-State: AGi0PuaL4NWK0ytHP/3gtZs8LyQqAsdUmwtjNwLKrrlrtTil3ow+CyCn
 d0EzmHEpYzF7TYSkUJo4ybs=
X-Google-Smtp-Source: APiQypJJ+SH3w4iibw9wY4Fz8oSyX+m81GA7f/6kS7n/iDhCOBJ5FH8lCHkmaWU9g38a35GHNtheYg==
X-Received: by 2002:a2e:b005:: with SMTP id y5mr1424029ljk.25.1585530588778;
 Sun, 29 Mar 2020 18:09:48 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:48 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 14/22] memory: tegra20-emc: Register as interconnect
 provider
Date: Mon, 30 Mar 2020 04:08:56 +0300
Message-Id: <20200330010904.27643-15-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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

Now memory controller is a memory interconnection provider. This allows us
to use interconnect API in order to change memory configuration.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 117 +++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 3a6eb5cc5c29..a2fcff221659 100644
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
@@ -21,6 +22,8 @@
 
 #include <soc/tegra/fuse.h>
 
+#include "mc.h"
+
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
 #define EMC_DBG					0x008
@@ -145,6 +148,7 @@ struct emc_timing {
 struct tegra_emc {
 	struct device *dev;
 	struct notifier_block clk_nb;
+	struct icc_provider provider;
 	struct clk *clk;
 	void __iomem *regs;
 
@@ -658,6 +662,112 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
+static inline struct tegra_emc *
+to_tegra_emc_provider(struct icc_provider *provider)
+{
+	return container_of(provider, struct tegra_emc, provider);
+}
+
+static struct icc_node *
+emc_of_icc_xlate_onecell(struct of_phandle_args *spec, void *data)
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
+	emc->provider.xlate = emc_of_icc_xlate_onecell;
+	emc->provider.aggregate = emc_icc_aggregate;
+
+	err = icc_provider_add(&emc->provider);
+	if (err)
+		return err;
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
+
+del_provider:
+	icc_provider_del(&emc->provider);
+
+	return err;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -721,6 +831,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, emc);
 	tegra_emc_debugfs_init(emc);
 
+	if (IS_ENABLED(CONFIG_INTERCONNECT)) {
+		err = tegra_emc_interconnect_init(emc);
+		if (err)
+			dev_err(&pdev->dev, "failed to initialize ICC: %d\n",
+				err);
+	}
+
 	return 0;
 
 unset_cb:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
