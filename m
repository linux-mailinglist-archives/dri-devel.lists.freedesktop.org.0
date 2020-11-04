Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A32A78D7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC006E9EA;
	Thu,  5 Nov 2020 08:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6147E6E21A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l10so2705577lji.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4gGLigHRb8dSM/OgsY/qKA3lzMZL1Y4iIFuz3JOCB58=;
 b=lVSx22kd1re9sCWQB0XFY1WhPMFuTdf73IyjpPLPxz68QPsF/5ZZkjQMfp3ILw3+Gj
 IOf3Xb1pd7YJyNSzLH/Ui1cugwon0pmwNtGf/rx87H6xjEkYjjwm9HxmMaRys94FJrf1
 cQE4ogixwq6FQTDHmj+zHpChC6NVOP1otUvY3kS3WHjJEmIiQ0wkfalLwFFPdb1QHy/9
 yfrnMemN1PQJhBrjX7zKuwKxS80t9mkmi5oeYpvaBwllzuA2iyAsouy/hbE3A4enIef0
 sh+xGdDNB40tZ7T1yVxtJM6EmB2XZ/WB76ImxUuvZhtE6Q2TqrK4odJfPLvu/Zm83+Ec
 5ucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gGLigHRb8dSM/OgsY/qKA3lzMZL1Y4iIFuz3JOCB58=;
 b=FQ7aZ2A89suJx5NOw9Ri+fcj85t1fe/VnjOG4qfTVr1jTn2WoPedt4rvCTuLtJG6u/
 qxlu22/o6LHXAg/LUiRiRwimFDXTuLLIi/NL7BelFXa1yQONbsAOoe9CRRsTjs80HZd0
 I25Fpw4dFO1DezNyUN1YYESKykTSI8O005g+9tESnyIM11bEkR0721r45kONKqV2eyUh
 eXnvvn1YOaS2K0t4BTlzPQlTG2OTRVuSYJSbNudEiBIr5j8jkj3BuWnRryIUYtMfnMjN
 umIIXPxDLMEzkW6joJ2Yymd35fhDQ/F7vnpMYO6sz5sQ4s7MNxDOH7BiYeCUcwuXL0xH
 /NNQ==
X-Gm-Message-State: AOAM5326qLoG/VeHdS7iUYFEWTm10+SHX8siRNHGK8vDvIcMhFoUCaLZ
 WpKJA8ivR1hVVIV9Reoc/vGVybNqZHg=
X-Google-Smtp-Source: ABdhPJy3WWB8I19r9KEL4dqJjBRCO3w+s4R2wBlmMOotagRrb+3XSD3SGk1xFfbFlcI2ht1ZDE+ejQ==
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr11358346ljn.211.1604508603792; 
 Wed, 04 Nov 2020 08:50:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:03 -0800 (PST)
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
Subject: [PATCH v7 28/47] memory: tegra: Add and use
 devm_tegra_memory_controller_get()
Date: Wed,  4 Nov 2020 19:49:04 +0300
Message-Id: <20201104164923.21238-29-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
duplication of the retrieval code among the drivers.

Add new devm_tegra_memory_controller_get() helper to remove the code's
duplication and to fix put_device() which was missed in the duplicated
code. Make EMC drivers to use the new helper.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c                | 48 ++++++++++++++++++++++++
 drivers/memory/tegra/tegra124-emc.c      | 18 ++-------
 drivers/memory/tegra/tegra210-emc-core.c | 39 +++++--------------
 drivers/memory/tegra/tegra30-emc.c       | 18 ++-------
 include/soc/tegra/mc.h                   | 10 +++++
 5 files changed, 74 insertions(+), 59 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec8403557ed4..a72cdcafc933 100644
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
+ * devm_tegra_memory_controller_get() - get Tegra Memory Controller handle
+ * @dev: device pointer for the consumer device
+ *
+ * This function will search for the Memory Controller node in a device-tree
+ * and retrieve the Memory Controller handle.
+ *
+ * Return: ERR_PTR() on error or a valid pointer to a struct tegra_mc.
+ */
+struct tegra_mc *devm_tegra_memory_controller_get(struct device *dev)
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
+EXPORT_SYMBOL_GPL(devm_tegra_memory_controller_get);
+
 static int tegra_mc_block_dma_common(struct tegra_mc *mc,
 				     const struct tegra_mc_reset *rst)
 {
diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 76ace42a688a..35dbceb7f841 100644
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
+	emc->mc = devm_tegra_memory_controller_get(&pdev->dev);
+	if (IS_ERR(emc->mc))
+		return PTR_ERR(emc->mc);
 
 	ram_code = tegra_read_ram_code();
 
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index cdd663ba4733..5f224796e32e 100644
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
+	emc->mc = devm_tegra_memory_controller_get(&pdev->dev);
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
index 055af0e08a2e..c58cf31cb27b 100644
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
+	emc->mc = devm_tegra_memory_controller_get(&pdev->dev);
+	if (IS_ERR(emc->mc))
+		return PTR_ERR(emc->mc);
 
 	emc->clk_nb.notifier_call = emc_clk_change_notify;
 	emc->dev = &pdev->dev;
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 1238e35653d1..d9395af98143 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -184,4 +184,14 @@ struct tegra_mc {
 int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
 
+#ifdef CONFIG_TEGRA_MC
+struct tegra_mc *devm_tegra_memory_controller_get(struct device *dev);
+#else
+static inline struct tegra_mc *
+devm_tegra_memory_controller_get(struct device *dev)
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
