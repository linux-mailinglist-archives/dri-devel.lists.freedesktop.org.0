Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D12987D1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3A06E87C;
	Mon, 26 Oct 2020 08:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86BA6E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c21so7694779ljn.13
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YmQ6EY44tbhvMawl506BzCTDK6dKa3fFg0xJ4Xfe72c=;
 b=rCJ8+fbvfM+nM6H4nEWBnrZDReW8zpVX/CqyQSzcq9qDtihbjCInmOCgnZ3zD8VUfR
 AmA+QVFwjj7tF4xY2Wr8POC3RKnl5ABnt7CEttgdRrV5eac0ae+lZpogMV4J/4Q5OHao
 zSzDEGXmOyhaKYrZoY4WuWT8V0b/O+hw2H3wm1T4LztZvw/SVrbnGu1ke4pfLOzy7Vng
 l3OQFTEUZZ2UJc5VL1PjpRlrG7orhGQbiFiCoYJg/ONAyMpaL9wVbSWBat3tsLZanHV7
 T0zwCAA9oLNdTR01Lhov/OAXJKvuudz9XEIYUobe64xoEJbj68p3VyO3IS+dQ48+qHYq
 bHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmQ6EY44tbhvMawl506BzCTDK6dKa3fFg0xJ4Xfe72c=;
 b=EwNK8yTY/DAN2Jrc5LGv5jBku10hMMZaR7eLWlEZjqEs+MSk3MOcb66pmbSrj+++Bv
 8gMLVg/WyuWNtEKNZHT+8IzsXpQSKAIgSDKvzFlP4chmCCKap4T/9lUPISJn2N3tH3E9
 WZvDq9SWABYLiAqea0KE+ATOljnzCnxVxkvfOCkJWB6xSSMG0WQZP81WrMkp3xzmLZ4B
 TddOpxYOkXacl8cFxePSOYGTOORLxIsUdNSgmH8k+bh2ozBr8EBytjxgL63jDNSF1lyO
 MDxC5jxY+Ue6Dg+SNQmTbiVGRP3lEZD4K7Rk486ae9WpEuqKQ/cL8k9bjMbcZNU16hUo
 /dRQ==
X-Gm-Message-State: AOAM532ZP044LbkQM+zfAwpC1GxVuuA9lF/5Dnwu8X5hiSMgIU2/JxBI
 3Z4IqPurhnQwCBltVhVyeWA=
X-Google-Smtp-Source: ABdhPJySIbDIUlzHgQdHh3N1nqbj5J1fdyQsVrBd9QIxQEUkU9gaQa9jOki91x6NmRpNl5eYlimehw==
X-Received: by 2002:a2e:a591:: with SMTP id m17mr1004902ljp.421.1603664300402; 
 Sun, 25 Oct 2020 15:18:20 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:19 -0700 (PDT)
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
Subject: [PATCH v6 28/52] memory: tegra: Add and use
 devm_tegra_get_memory_controller()
Date: Mon, 26 Oct 2020 01:17:11 +0300
Message-Id: <20201025221735.3062-29-digetx@gmail.com>
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

Multiple Tegra drivers need to retrieve Memory Controller and there is
duplication of the retrieval code among the drivers. This patch removes
the duplication and fixes put_device() which was missed in the duplicated
code.

EMC drivers now use new common devm_tegra_get_memory_controller() helper
instead of opencoding the MC retrieval.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c                | 48 ++++++++++++++++++++++++
 drivers/memory/tegra/tegra124-emc.c      | 18 ++-------
 drivers/memory/tegra/tegra210-emc-core.c | 39 +++++--------------
 drivers/memory/tegra/tegra30-emc.c       | 18 ++-------
 include/soc/tegra/mc.h                   | 10 +++++
 5 files changed, 74 insertions(+), 59 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec8403557ed4..12ea2c79205a 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -42,6 +42,54 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+static void tegra_mc_devm_action_put_device(void *data)
+{
+	struct tegra_mc *mc = data;
+
+	put_device(mc->dev);
+}
+
+/**
+ * devm_tegra_get_memory_controller() - get Tegra Memory Controller handle
+ * @dev: device pointer for the consumer device
+ *
+ * This function will search for the Memory Controller node in a device-tree
+ * and retrieve the Memory Controller handle.
+ *
+ * Return: ERR_PTR() on error or a valid pointer to a struct tegra_mc.
+ */
+struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct tegra_mc *mc;
+	int err;
+
+	np = of_parse_phandle(dev->of_node, "nvidia,memory-controller", 0);
+	if (!np)
+		return ERR_PTR(-ENOENT);
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	mc = platform_get_drvdata(pdev);
+	if (!mc) {
+		put_device(&pdev->dev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	err = devm_add_action(dev, tegra_mc_devm_action_put_device, mc);
+	if (err) {
+		put_device(mc->dev);
+		return ERR_PTR(err);
+	}
+
+	return mc;
+}
+EXPORT_SYMBOL_GPL(devm_tegra_get_memory_controller);
+
 static int tegra_mc_block_dma_common(struct tegra_mc *mc,
 				     const struct tegra_mc_reset *rst)
 {
diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 76ace42a688a..b92259d4fbd1 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1177,7 +1177,6 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 
 static int tegra_emc_probe(struct platform_device *pdev)
 {
-	struct platform_device *mc;
 	struct device_node *np;
 	struct tegra_emc *emc;
 	struct resource *res;
@@ -1195,20 +1194,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
-	np = of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", 0);
-	if (!np) {
-		dev_err(&pdev->dev, "could not get memory controller\n");
-		return -ENOENT;
-	}
-
-	mc = of_find_device_by_node(np);
-	of_node_put(np);
-	if (!mc)
-		return -ENOENT;
-
-	emc->mc = platform_get_drvdata(mc);
-	if (!emc->mc)
-		return -EPROBE_DEFER;
+	emc->mc = devm_tegra_get_memory_controller(&pdev->dev);
+	if (IS_ERR(emc->mc))
+		return PTR_ERR(emc->mc);
 
 	ram_code = tegra_read_ram_code();
 
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index cdd663ba4733..8c6ea634e05a 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1828,7 +1828,6 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 {
 	struct thermal_cooling_device *cd;
 	unsigned long current_rate;
-	struct platform_device *mc;
 	struct tegra210_emc *emc;
 	struct device_node *np;
 	unsigned int i;
@@ -1846,35 +1845,19 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 	spin_lock_init(&emc->lock);
 	emc->dev = &pdev->dev;
 
-	np = of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", 0);
-	if (!np) {
-		dev_err(&pdev->dev, "could not get memory controller\n");
-		return -ENOENT;
-	}
-
-	mc = of_find_device_by_node(np);
-	of_node_put(np);
-	if (!mc)
-		return -ENOENT;
-
-	emc->mc = platform_get_drvdata(mc);
-	if (!emc->mc) {
-		put_device(&mc->dev);
-		return -EPROBE_DEFER;
-	}
+	emc->mc = devm_tegra_get_memory_controller(&pdev->dev);
+	if (IS_ERR(emc->mc))
+		return PTR_ERR(emc->mc);
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(emc->regs)) {
-		err = PTR_ERR(emc->regs);
-		goto put_mc;
-	}
+	if (IS_ERR(emc->regs))
+		return PTR_ERR(emc->regs);
 
 	for (i = 0; i < 2; i++) {
 		emc->channel[i] = devm_platform_ioremap_resource(pdev, 1 + i);
-		if (IS_ERR(emc->channel[i])) {
-			err = PTR_ERR(emc->channel[i]);
-			goto put_mc;
-		}
+		if (IS_ERR(emc->channel[i]))
+			return PTR_ERR(emc->channel[i]);
+
 	}
 
 	tegra210_emc_detect(emc);
@@ -1884,7 +1867,7 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 	err = of_reserved_mem_device_init_by_name(emc->dev, np, "nominal");
 	if (err < 0) {
 		dev_err(emc->dev, "failed to get nominal EMC table: %d\n", err);
-		goto put_mc;
+		return err;
 	}
 
 	err = of_reserved_mem_device_init_by_name(emc->dev, np, "derated");
@@ -2015,8 +1998,7 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 	tegra210_clk_emc_detach(emc->clk);
 release:
 	of_reserved_mem_device_release(emc->dev);
-put_mc:
-	put_device(emc->mc->dev);
+
 	return err;
 }
 
@@ -2027,7 +2009,6 @@ static int tegra210_emc_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(emc->debugfs.root);
 	tegra210_clk_emc_detach(emc->clk);
 	of_reserved_mem_device_release(emc->dev);
-	put_device(emc->mc->dev);
 
 	return 0;
 }
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 055af0e08a2e..602dc4e08c61 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1258,7 +1258,6 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 
 static int tegra_emc_probe(struct platform_device *pdev)
 {
-	struct platform_device *mc;
 	struct device_node *np;
 	struct tegra_emc *emc;
 	int err;
@@ -1269,17 +1268,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	np = of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", 0);
-	if (!np) {
-		dev_err(&pdev->dev, "could not get memory controller node\n");
-		return -ENOENT;
-	}
-
-	mc = of_find_device_by_node(np);
-	of_node_put(np);
-	if (!mc)
-		return -ENOENT;
-
 	np = emc_find_node_by_ram_code(&pdev->dev);
 	if (!np)
 		return -EINVAL;
@@ -1290,9 +1278,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	emc->mc = platform_get_drvdata(mc);
-	if (!emc->mc)
-		return -EPROBE_DEFER;
+	emc->mc = devm_tegra_get_memory_controller(&pdev->dev);
+	if (IS_ERR(emc->mc))
+		return PTR_ERR(emc->mc);
 
 	emc->clk_nb.notifier_call = emc_clk_change_notify;
 	emc->dev = &pdev->dev;
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 1238e35653d1..1b7dfed6afb8 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -184,4 +184,14 @@ struct tegra_mc {
 int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
 
+#ifdef CONFIG_TEGRA_MC
+struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev);
+#else
+static inline struct tegra_mc *
+devm_tegra_get_memory_controller(struct device *dev)
+{
+	ERR_PTR(-ENODEV);
+}
+#endif
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
