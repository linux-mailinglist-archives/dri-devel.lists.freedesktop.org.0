Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA212A78DC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C316E9C9;
	Thu,  5 Nov 2020 08:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FE46E226
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:27 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d24so23661171ljg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0iEwaTGjBhhhYbqhEB674AFJTwQ7XfjZia90rQHHnqQ=;
 b=RaOKVsHl0zQ706fDUOJ4r3MY+qrWEFTCtfEgOzBQc4TFtDZLWSLDIdWoTn/DhShhX4
 UpB2hqZc5X3ZwOWK7leoEm9cuuL/a9L8c+4axgQ3oOYk1vPHTF4qruUm52QwS1efJkvA
 Q0DINB6hbWYv9Bj57TeeZwSWZRw+ibVe8oqF2WUozTZR9FaH/0tob/gYIXHXBD6EaIiI
 HWSY9bRwSb5BQdHJT65GH1+Fwi1ITzWLREmAUEJZ5raO6WRMEPSiRl0LRFR9lgXFIUwZ
 jwMrAmq5ZK2gnKN2JiB8vt1ZorV08LOT06nZQz8d8VOH9sChFmKuO2z5rKLcWx4KSZca
 lOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0iEwaTGjBhhhYbqhEB674AFJTwQ7XfjZia90rQHHnqQ=;
 b=Wx06Zn/Ob8mQGNDpnrApr6iPytzwYR2Q22J7ZdIA3jecDp6Ma9nEllUlLYk29ZHslQ
 IgBiNaJ9EuzFffA/RsKb4Pxwk6GQVyqvBqgncNQXPpFjeNQXEEM5ismBgdFJaoM+xagU
 5fckd81AzzXQ3gf+Xw7Ou6pTesbubE7DIwkC1j34EuG3Lzbv7BjevfpmDxCgK8bExa2/
 jrwdD32j90jua0Y4GzZyVJgOPupr2Ro8dJ33c8Nhyq0zgFWTRrsK4IxSMn7r45IOVvyd
 hvyDaN2JXAokW0/dmcDvmU/bBiDrj74OrPEhe+YUnHJSSWLRpEXPncOFgsa0F7g1ND7j
 YL0Q==
X-Gm-Message-State: AOAM5331XtKDu225QNWg418QFmC80a6c8iE/C/ybuls4F7Nf69T7calW
 H6+IPT9n93fywrNHN1JKd0Q=
X-Google-Smtp-Source: ABdhPJzi8UyuzGks82q4fzvpFQNvhcIrq5nuS+hMmVa6Y/MRKXlWqjSwqjZ6sMPrylaY5AUN02CHbw==
X-Received: by 2002:a2e:b0c7:: with SMTP id g7mr10368958ljl.433.1604508625829; 
 Wed, 04 Nov 2020 08:50:25 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:25 -0800 (PST)
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
Subject: [PATCH v7 46/47] PM / devfreq: tegra30: Separate configurations
 per-SoC generation
Date: Wed,  4 Nov 2020 19:49:22 +0300
Message-Id: <20201104164923.21238-47-digetx@gmail.com>
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

Previously we were using count-weight of the T124 for T30 in order to
get EMC clock rate that was reasonable for T30. In fact the count-weight
should be x2 times smaller on T30, but then devfreq was producing a bit
too low EMC clock rate for ISO memory clients, like display controller
for example.

Now both Tegra ACTMON and Tegra DRM display drivers support interconnect
framework and display driver tells to ICC what a minimum memory bandwidth
is needed, preventing FIFO underflows. Thus, now we can use a proper
count-weight value for Tegra30 and MC_ALL device config needs a bit more
aggressive boosting.

Add a separate ACTMON driver configuration that is specific to Tegra30.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 68 ++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 4db027ca17e1..aaa22077815c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -57,13 +57,6 @@
 #define ACTMON_BELOW_WMARK_WINDOW				3
 #define ACTMON_BOOST_FREQ_STEP					16000
 
-/*
- * Activity counter is incremented every 256 memory transactions, and each
- * transaction takes 4 EMC clocks for Tegra124; So the COUNT_WEIGHT is
- * 4 * 256 = 1024.
- */
-#define ACTMON_COUNT_WEIGHT					0x400
-
 /*
  * ACTMON_AVERAGE_WINDOW_LOG2: default value for @DEV_CTRL_K_VAL, which
  * translates to 2 ^ (K_VAL + 1). ex: 2 ^ (6 + 1) = 128
@@ -111,7 +104,7 @@ enum tegra_actmon_device {
 	MCCPU,
 };
 
-static const struct tegra_devfreq_device_config actmon_device_configs[] = {
+static const struct tegra_devfreq_device_config tegra124_device_configs[] = {
 	{
 		/* MCALL: All memory accesses (including from the CPUs) */
 		.offset = 0x1c0,
@@ -133,6 +126,28 @@ static const struct tegra_devfreq_device_config actmon_device_configs[] = {
 	},
 };
 
+static const struct tegra_devfreq_device_config tegra30_device_configs[] = {
+	{
+		/* MCALL: All memory accesses (including from the CPUs) */
+		.offset = 0x1c0,
+		.irq_mask = 1 << 26,
+		.boost_up_coeff = 200,
+		.boost_down_coeff = 50,
+		.boost_up_threshold = 20,
+		.boost_down_threshold = 10,
+	},
+	{
+		/* MCCPU: memory accesses from the CPUs */
+		.offset = 0x200,
+		.irq_mask = 1 << 25,
+		.boost_up_coeff = 800,
+		.boost_down_coeff = 40,
+		.boost_up_threshold = 27,
+		.boost_down_threshold = 10,
+		.avg_dependency_threshold = 16000, /* 16MHz in kHz units */
+	},
+};
+
 /**
  * struct tegra_devfreq_device - state specific to an ACTMON device
  *
@@ -155,6 +170,12 @@ struct tegra_devfreq_device {
 	unsigned long target_freq;
 };
 
+struct tegra_devfreq_soc_data {
+	const struct tegra_devfreq_device_config *configs;
+	/* Weight value for count measurements */
+	unsigned int count_weight;
+};
+
 struct tegra_devfreq {
 	struct devfreq		*devfreq;
 	struct opp_table	*opp_table;
@@ -171,11 +192,13 @@ struct tegra_devfreq {
 	struct delayed_work	cpufreq_update_work;
 	struct notifier_block	cpu_rate_change_nb;
 
-	struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
+	struct tegra_devfreq_device devices[2];
 
 	unsigned int		irq;
 
 	bool			started;
+
+	const struct tegra_devfreq_soc_data *soc;
 };
 
 struct tegra_actmon_emc_ratio {
@@ -488,7 +511,7 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 	tegra_devfreq_update_avg_wmark(tegra, dev);
 	tegra_devfreq_update_wmark(tegra, dev);
 
-	device_writel(dev, ACTMON_COUNT_WEIGHT, ACTMON_DEV_COUNT_WEIGHT);
+	device_writel(dev, tegra->soc->count_weight, ACTMON_DEV_COUNT_WEIGHT);
 	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
 
 	val |= ACTMON_DEV_CTRL_ENB_PERIODIC;
@@ -787,6 +810,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	if (!tegra)
 		return -ENOMEM;
 
+	tegra->soc = of_device_get_match_data(&pdev->dev);
+
 	tegra->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(tegra->regs))
 		return PTR_ERR(tegra->regs);
@@ -866,9 +891,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	tegra->max_freq = rate / KHZ;
 
-	for (i = 0; i < ARRAY_SIZE(actmon_device_configs); i++) {
+	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
 		dev = tegra->devices + i;
-		dev->config = actmon_device_configs + i;
+		dev->config = tegra->soc->configs + i;
 		dev->regs = tegra->regs + dev->config->offset;
 	}
 
@@ -933,9 +958,24 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct tegra_devfreq_soc_data tegra124_soc = {
+	.configs = tegra124_device_configs,
+
+	/*
+	 * Activity counter is incremented every 256 memory transactions,
+	 * and each transaction takes 4 EMC clocks.
+	 */
+	.count_weight = 4 * 256,
+};
+
+static const struct tegra_devfreq_soc_data tegra30_soc = {
+	.configs = tegra30_device_configs,
+	.count_weight = 2 * 256,
+};
+
 static const struct of_device_id tegra_devfreq_of_match[] = {
-	{ .compatible = "nvidia,tegra30-actmon" },
-	{ .compatible = "nvidia,tegra124-actmon" },
+	{ .compatible = "nvidia,tegra30-actmon",  .data = &tegra30_soc, },
+	{ .compatible = "nvidia,tegra124-actmon", .data = &tegra124_soc, },
 	{ },
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
