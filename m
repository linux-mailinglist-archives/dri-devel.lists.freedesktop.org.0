Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C20252A78CE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869E06E9B2;
	Thu,  5 Nov 2020 08:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3015F6E23D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:10 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a7so28002380lfk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xF3849VzaoUkwlJVQxMK0p9EE4An5iO4TNW5KJUNqkI=;
 b=UE6ahmZUXgLanUgmwbF1+Kd66O+g7zjrTXzmDdlckuUHhusQSlWDArUYNSyxEO9mBg
 p9DTK3RPcrOKbkp4WVtFIyRjUIYh+zG04OEDAj8SR7PIsP0G5w//GxalgPcJ7iIGnAS7
 Bsnuw7azSvuq+HkpLF6+JuSlVN+jDrewSBMSrFKS3kMzT7mquDt7y4KZdxCOCJ++Xzot
 /HXkQiStUWUKjAOkBMUTZdU3YEcDq9/V8mP2/QqqfJRlrKoO4VPZycbqygy2csUsu2r/
 dA11SxFk9K0LYanmtP5jr4I4hq/QQlY0xR6dTHl+gMMXa5+1jotKsGk067DesV+lXOTT
 sQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xF3849VzaoUkwlJVQxMK0p9EE4An5iO4TNW5KJUNqkI=;
 b=fC1ruplqd8ahdOV/BgFpuTQ5sftzB71NAGIbeek/dlybpXByXx1YkQvPcJJCGgMm3c
 s9rQ57qvkL/FsbBZ13LabiBinnJuQ0JzOH1MpFDSSjpjW1iTU96fwrO2qhtAvfZi56ee
 /+AmFpw+tihSjY15Pl+Iohy1UuayhENEAN9piS7U+EhhwixDHit7wwP25g/QDEs4gz0B
 muQASvVSXB7k4Q9XsNbYrlfU4FF41SCshUV3D1xowpsVWq2JbCYDbjd5+9ffUmH1BUqW
 ti9Xrvg/VdeeABcI6KxjKlEjk0VuMuDU2wa9iBAINUgeSXckISDkEXcb466s/DIP3Vk9
 4row==
X-Gm-Message-State: AOAM532061e/OZj05A5KfAZXdKgyGNi5wGxhUMIvpAwNsT+P0k2EOuuN
 johQyYS3QlcUUqmAkoMPM/Y=
X-Google-Smtp-Source: ABdhPJyIRbpopM66GwgNH/xaZzCBjvCrNQQGoQ0QhDsmeMrJWLANUvsikptUHHjPcycTxkBTX+YRyw==
X-Received: by 2002:a19:3ce:: with SMTP id 197mr13207lfd.364.1604508608569;
 Wed, 04 Nov 2020 08:50:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:08 -0800 (PST)
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
Subject: [PATCH v7 32/47] memory: tegra-mc: Add interconnect framework
Date: Wed,  4 Nov 2020 19:49:08 +0300
Message-Id: <20201104164923.21238-33-digetx@gmail.com>
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

Add common SoC-agnostic ICC framework which turns Tegra Memory Controller
into a memory interconnection provider. This allows us to use interconnect
API for tuning of memory configurations.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig |   1 +
 drivers/memory/tegra/mc.c    | 100 +++++++++++++++++++++++++++++++++++
 drivers/memory/tegra/mc.h    |  22 ++++++++
 include/soc/tegra/mc.h       |  17 ++++++
 4 files changed, 140 insertions(+)

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
index 998f9148ecb8..a7e6a8e4c95a 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -639,6 +639,101 @@ static __maybe_unused irqreturn_t tegra20_mc_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
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
+	if (!device_property_present(mc->dev, "#interconnect-cells") ||
+	    !mc->soc->icc_ops)
+		return 0;
+
+	mc->provider.dev = mc->dev;
+	mc->provider.data = &mc->provider;
+	mc->provider.set = mc->soc->icc_ops->set;
+	mc->provider.aggregate = mc->soc->icc_ops->aggregate;
+	mc->provider.xlate_extended = mc->soc->icc_ops->xlate_extended;
+
+	err = icc_provider_add(&mc->provider);
+	if (err)
+		return err;
+
+	/* create Memory Controller node */
+	node = icc_node_create(TEGRA_ICC_MC);
+	if (IS_ERR(node)) {
+		err = PTR_ERR(node);
+		goto del_provider;
+	}
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
+		if (IS_ERR(node)) {
+			err = PTR_ERR(node);
+			goto remove_nodes;
+		}
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
+	 * since syncing works for the EMC drivers, hence we can sync the
+	 * MC driver by ourselves and then EMC will complete syncing of
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
+
+	return err;
+}
+
 static int tegra_mc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -727,6 +822,11 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to register reset controller: %d\n",
 			err);
 
+	err = tegra_mc_interconnect_setup(mc);
+	if (err < 0)
+		dev_err(&pdev->dev, "failed to initialize interconnect: %d\n",
+			err);
+
 	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_SMMU) && mc->soc->smmu) {
 		mc->smmu = tegra_smmu_probe(&pdev->dev, mc->soc->smmu, mc);
 		if (IS_ERR(mc->smmu)) {
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index afa3ba45c9e6..33e40d600592 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -78,6 +78,20 @@
 
 #define MC_TIMING_UPDATE				BIT(0)
 
+static inline u32 tegra_mc_scale_percents(u64 val, unsigned int percents)
+{
+	val = val * percents;
+	do_div(val, 100);
+
+	return min_t(u64, val, U32_MAX);
+}
+
+static inline struct tegra_mc *
+icc_provider_to_tegra_mc(struct icc_provider *provider)
+{
+	return container_of(provider, struct tegra_mc, provider);
+}
+
 static inline u32 mc_readl(struct tegra_mc *mc, unsigned long offset)
 {
 	return readl_relaxed(mc->regs + offset);
@@ -115,4 +129,12 @@ extern const struct tegra_mc_soc tegra132_mc_soc;
 extern const struct tegra_mc_soc tegra210_mc_soc;
 #endif
 
+/*
+ * These IDs are for internal use of Tegra ICC drivers. The ID numbers are
+ * chosen such that they don't conflict with the device-tree ICC node IDs.
+ */
+#define TEGRA_ICC_MC		1000
+#define TEGRA_ICC_EMC		1001
+#define TEGRA_ICC_EMEM		1002
+
 #endif /* MEMORY_TEGRA_MC_H */
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index d9395af98143..43876216de34 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -6,7 +6,9 @@
 #ifndef __SOC_TEGRA_MC_H__
 #define __SOC_TEGRA_MC_H__
 
+#include <linux/bits.h>
 #include <linux/err.h>
+#include <linux/interconnect-provider.h>
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 
@@ -141,6 +143,17 @@ struct tegra_mc_reset_ops {
 			    const struct tegra_mc_reset *rst);
 };
 
+#define TEGRA_MC_ICC_TAG_DEFAULT				0
+#define TEGRA_MC_ICC_TAG_ISO					BIT(0)
+
+struct tegra_mc_icc_ops {
+	int (*set)(struct icc_node *src, struct icc_node *dst);
+	int (*aggregate)(struct icc_node *node, u32 tag, u32 avg_bw,
+			 u32 peak_bw, u32 *agg_avg, u32 *agg_peak);
+	struct icc_node_data *(*xlate_extended)(struct of_phandle_args *spec,
+						void *data);
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -160,6 +173,8 @@ struct tegra_mc_soc {
 	const struct tegra_mc_reset_ops *reset_ops;
 	const struct tegra_mc_reset *resets;
 	unsigned int num_resets;
+
+	const struct tegra_mc_icc_ops *icc_ops;
 };
 
 struct tegra_mc {
@@ -178,6 +193,8 @@ struct tegra_mc {
 
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
