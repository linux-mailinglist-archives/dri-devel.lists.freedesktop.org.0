Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B442CE9E1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD8D6E135;
	Fri,  4 Dec 2020 08:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106776EBA8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 19:25:05 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id q8so3780819ljc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 11:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Y9KUYQXFWobegekZ4zPhL5ARhA2nWflhNK/oNr6bdk=;
 b=W1SMYDSwQrazalVtKwzoZmkIVjBR7QZjIs/Z/b8avUZhobsWUwjfIUHhRp5PvqPlWn
 9zJR/7aLT+pUdoZDG0GJ/nGsSIUvgk9qq2iOsjxXwfAs3hEaR++TzeOd3iJJS7f6cGGJ
 hHaGHEdZxtLCgon4c2H3Uan28dNicuZDuVUxy09LUeY4KR6S8zc4W0HWEzsZEp7jgXdT
 q/e6osqp4K+FFBITE/FDSZ85Umk0M5IbeirRjfGIiJNunr9GllFQCjAxJIzeQayZCWj9
 fpJ3bn3CSyMTNOAO8WIyZMKDOGy0DbA+MkSbb4RnzfFOAJtzq+tz09xjCUq8C+TO9n2F
 CxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Y9KUYQXFWobegekZ4zPhL5ARhA2nWflhNK/oNr6bdk=;
 b=hGGUNcgFsTV2T7FErJocn2Uck9BPOfP4koH0ptVv75dSNUrJuNzsX/lKiNqrnH2N9V
 R6LWN422t1R9Ar0V8isdlcHEGZvbx+6G+gfhoqPG/g/RdBXcvQPagHL9r9igma8wLJln
 g1kH8M/2/PLcQgfoLdSgHknLXm4JBZmLZR+WnLYfQjJyao/DQruS/fRB7nwhvk3RSieJ
 EAfs9X6X1DH24pWqN+54q69EEedgVV+U++U3mBLG3b5o6rKrQ/epovae2nYjxPZ7fHM8
 FOCzvzYMTMmkDHLYTlBm4whu4mXNcjzN2yS4NHkKcmZYKNuPEx6K3idbFHwXDaxgkWkM
 5oEg==
X-Gm-Message-State: AOAM5319cXn0ZWHaCMuvOjKMWAZwk9Oc1/dVkleoXG6XcaYeoFxutGzD
 vMk6sr9zV+mljbYBuy61PS4=
X-Google-Smtp-Source: ABdhPJyNjBLd1R9muxALNUEj7BrTxjrCGw5Z/vUfrDLKHbTjM7hZ3kHzOj1bkAf9w/9h0TLl55GXSw==
X-Received: by 2002:a2e:b0d4:: with SMTP id g20mr1779527ljl.281.1607023503300; 
 Thu, 03 Dec 2020 11:25:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru.
 [109.252.192.53])
 by smtp.gmail.com with ESMTPSA id z7sm861932lfq.50.2020.12.03.11.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 11:25:02 -0800 (PST)
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
Subject: [PATCH v11 10/10] PM / devfreq: tegra30: Separate configurations
 per-SoC generation
Date: Thu,  3 Dec 2020 22:24:39 +0300
Message-Id: <20201203192439.16177-11-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203192439.16177-1-digetx@gmail.com>
References: <20201203192439.16177-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 68 ++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 145ef91ae092..117cad7968ab 100644
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
@@ -779,6 +802,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	if (!tegra)
 		return -ENOMEM;
 
+	tegra->soc = of_device_get_match_data(&pdev->dev);
+
 	tegra->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(tegra->regs))
 		return PTR_ERR(tegra->regs);
@@ -852,9 +877,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	tegra->max_freq = rate / KHZ;
 
-	for (i = 0; i < ARRAY_SIZE(actmon_device_configs); i++) {
+	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
 		dev = tegra->devices + i;
-		dev->config = actmon_device_configs + i;
+		dev->config = tegra->soc->configs + i;
 		dev->regs = tegra->regs + dev->config->offset;
 	}
 
@@ -916,9 +941,24 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
