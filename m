Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD12987C1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1E76E83F;
	Mon, 26 Oct 2020 08:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A5C6E0D2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:23 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b1so9400558lfp.11
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZruQyda58afra3e+p999AIpEFDjJR3PA1UbZc2hY7Hg=;
 b=tWJTiBD2UJ5SwuzESp8/tbVGhbdw5YFP+L+L+ZXsRqSMZ7n9nsfE/qGGVEg/A+JFM6
 3JRrfXUbDRvLx9ldg4E7FZh9NLL3r0s5LQUVQAeqO6RGfDnI/afqlFy4oZZvjNdOQAeF
 U5MbHqJ/2sJNFyw/PYWxhr105e+LoiOCa/0OCdwidW2J//mv3wbFFMpGjOQhIi4fxgbO
 ZjMP9QDz7JMXRI6wD8s0jpAEXAdQKMhNKLToF1GSq3lwYp9wmcai2eYkC1b3Ik7RmCgE
 XeVNRJatHchkOzPZ5xzt3U9NhToM57unzrjctcBUBNHxXayhXZGfXpzPR29TBOP9lJLw
 stdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZruQyda58afra3e+p999AIpEFDjJR3PA1UbZc2hY7Hg=;
 b=cydof5nO/UEPEybZE+EVfAVtNtIwZY/x4Cr+m33EsljzP1hKCmBsi6bnla6n9mjRGu
 uErhlQvkO9RNePFzYRnTCy+Yo7k77CmLEsNrdp9hoem8I46LdchXcRjTjpgNcGca33VN
 RY1TvKoUWNKH1siF85VTKSO9gCgXjOIwPJk/t0fmkL769fboCU2pa7Mx74YLxumf9qj9
 DhU0malN+aJqgQh3IavWEA977aHIiYirA61ENh3WjfKGKZHdhyXf8NzjYALqUcBNUsXR
 JQd11ibhugRMlAO77ftgBV0Q/jITP1Ao/SJjRovjiJyhDrX1nJcwoVfbJY0bB8NfRM0P
 RCqg==
X-Gm-Message-State: AOAM531aKJ6Eq8mIw31psnV5d7EnMmJbZeWsligfbndYsHgqLaBWTCLR
 athm5idmEXUv0uQj3ngxb5o=
X-Google-Smtp-Source: ABdhPJwAL9ZdLj/NvkGx2N5xSZ/jPsH41MUejXsoZ5HjYlRPTW0V/dCZkdpTRZhIiw9sUIxx6KlTJA==
X-Received: by 2002:a19:7608:: with SMTP id c8mr4158883lff.453.1603664301550; 
 Sun, 25 Oct 2020 15:18:21 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:21 -0700 (PDT)
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
Subject: [PATCH v6 29/52] memory: tegra-mc: Add interconnect framework
Date: Mon, 26 Oct 2020 01:17:12 +0300
Message-Id: <20201025221735.3062-30-digetx@gmail.com>
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

Now Memory Controller is a memory interconnection provider. This allows
us to use interconnect API for tuning of memory configuration. This patch
adds common ICC core and adds hooks which should be implemented by the SoC
drivers.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig |   1 +
 drivers/memory/tegra/mc.c    | 129 +++++++++++++++++++++++++++++++++++
 drivers/memory/tegra/mc.h    |   8 +++
 include/soc/tegra/mc.h       |  16 +++++
 4 files changed, 154 insertions(+)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 9f0a96bf9ccc..b38e5255effe 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -3,6 +3,7 @@ config TEGRA_MC
 	bool "NVIDIA Tegra Memory Controller support"
 	default y
 	depends on ARCH_TEGRA
+	select INTERCONNECT
 	help
 	  This driver supports the Memory Controller (MC) hardware found on
 	  NVIDIA Tegra SoCs.
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 12ea2c79205a..53d61b05ebf8 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -639,6 +639,133 @@ static __maybe_unused irqreturn_t tegra20_mc_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static struct icc_node_data *
+tegra_mc_of_icc_xlate_extended(struct of_phandle_args *spec, void *data)
+{
+	struct icc_provider *provider = data;
+	unsigned int idx = spec->args[0];
+	struct icc_node_data *ndata;
+	struct icc_node *node;
+
+	list_for_each_entry(node, &provider->nodes, node_list) {
+		if (node->id != idx)
+			continue;
+
+		ndata = kzalloc(sizeof(*ndata), GFP_KERNEL);
+		if (!ndata)
+			return ERR_PTR(-ENOMEM);
+
+		ndata->node = node;
+
+		/* these clients are isochronous by default on all SoCs */
+		if (strstarts(node->name, "display") ||
+		    strstarts(node->name, "ptc") ||
+		    strstarts(node->name, "vi"))
+			ndata->tag = TEGRA_MC_ICC_TAG_ISO;
+
+		return ndata;
+	}
+
+	pr_err("%s: invalid client index %u\n", __func__, idx);
+
+	return ERR_PTR(-EINVAL);
+}
+
+/*
+ * Memory Controller (MC) has few Memory Clients that are issuing memory
+ * bandwidth allocation requests to the MC interconnect provider. The MC
+ * provider aggregates the requests and then sends the aggregated request
+ * up to the External Memory Controller (EMC) interconnect provider which
+ * re-configures hardware interface to External Memory (EMEM) in accordance
+ * to the required bandwidth. Each MC interconnect node represents an
+ * individual Memory Client.
+ *
+ * Memory interconnect topology:
+ *
+ *               +----+
+ * +--------+    |    |
+ * | TEXSRD +--->+    |
+ * +--------+    |    |
+ *               |    |    +-----+    +------+
+ *    ...        | MC +--->+ EMC +--->+ EMEM |
+ *               |    |    +-----+    +------+
+ * +--------+    |    |
+ * | DISP.. +--->+    |
+ * +--------+    |    |
+ *               +----+
+ */
+static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
+{
+	struct icc_node *node;
+	unsigned int i;
+	int err;
+
+	/* older device-trees don't have interconnect properties */
+	if (!of_find_property(mc->dev->of_node, "#interconnect-cells", NULL) ||
+	    !mc->soc->icc_ops)
+		return 0;
+
+	mc->provider.dev = mc->dev;
+	mc->provider.data = &mc->provider;
+	mc->provider.set = mc->soc->icc_ops->set;
+	mc->provider.aggregate = mc->soc->icc_ops->aggregate;
+	mc->provider.xlate_extended = tegra_mc_of_icc_xlate_extended;
+
+	err = icc_provider_add(&mc->provider);
+	if (err)
+		goto err_msg;
+
+	/* create Memory Controller node */
+	node = icc_node_create(TEGRA_ICC_MC);
+	err = PTR_ERR_OR_ZERO(node);
+	if (err)
+		goto del_provider;
+
+	node->name = "Memory Controller";
+	icc_node_add(node, &mc->provider);
+
+	/* link Memory Controller to External Memory Controller */
+	err = icc_link_create(node, TEGRA_ICC_EMC);
+	if (err)
+		goto remove_nodes;
+
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		/* create MC client node */
+		node = icc_node_create(mc->soc->clients[i].id);
+		err = PTR_ERR_OR_ZERO(node);
+		if (err)
+			goto remove_nodes;
+
+		node->name = mc->soc->clients[i].name;
+		icc_node_add(node, &mc->provider);
+
+		/* link Memory Client to Memory Controller */
+		err = icc_link_create(node, TEGRA_ICC_MC);
+		if (err)
+			goto remove_nodes;
+	}
+
+	/*
+	 * MC driver is registered too early, so early that generic driver
+	 * syncing doesn't work for the MC. But it doesn't really matter
+	 * since syncing works for the EMC drivers, hence the we can sync
+	 * the MC driver by ourselves and then EMC will complete syncing of
+	 * the whole ICC state.
+	 */
+	icc_sync_state(mc->dev);
+
+	return 0;
+
+remove_nodes:
+	icc_nodes_remove(&mc->provider);
+del_provider:
+	icc_provider_del(&mc->provider);
+err_msg:
+	dev_err(mc->dev, "failed to initialize ICC: %d\n", err);
+
+	return err;
+}
+
 static int tegra_mc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -747,6 +874,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		}
 	}
 
+	tegra_mc_interconnect_setup(mc);
+
 	return 0;
 }
 
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index afa3ba45c9e6..abeb6a2cc36a 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -115,4 +115,12 @@ extern const struct tegra_mc_soc tegra132_mc_soc;
 extern const struct tegra_mc_soc tegra210_mc_soc;
 #endif
 
+/*
+ * These IDs are for internal use of Tegra's ICC, the values are chosen
+ * such that they don't conflict with the device-tree ICC node IDs.
+ */
+#define TEGRA_ICC_EMC		1000
+#define TEGRA_ICC_EMEM		2000
+#define TEGRA_ICC_MC		3000
+
 #endif /* MEMORY_TEGRA_MC_H */
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 1b7dfed6afb8..09b3fe30c8e7 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -7,6 +7,7 @@
 #define __SOC_TEGRA_MC_H__
 
 #include <linux/err.h>
+#include <linux/interconnect-provider.h>
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 
@@ -141,6 +142,17 @@ struct tegra_mc_reset_ops {
 			    const struct tegra_mc_reset *rst);
 };
 
+enum terga_mc_icc_tag {
+	TEGRA_MC_ICC_TAG_DEFAULT,
+	TEGRA_MC_ICC_TAG_ISO,
+};
+
+struct tegra_mc_icc_ops {
+	int (*set)(struct icc_node *src, struct icc_node *dst);
+	int (*aggregate)(struct icc_node *node, u32 tag, u32 avg_bw,
+			 u32 peak_bw, u32 *agg_avg, u32 *agg_peak);
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -160,6 +172,8 @@ struct tegra_mc_soc {
 	const struct tegra_mc_reset_ops *reset_ops;
 	const struct tegra_mc_reset *resets;
 	unsigned int num_resets;
+
+	const struct tegra_mc_icc_ops *icc_ops;
 };
 
 struct tegra_mc {
@@ -178,6 +192,8 @@ struct tegra_mc {
 
 	struct reset_controller_dev reset;
 
+	struct icc_provider provider;
+
 	spinlock_t lock;
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
