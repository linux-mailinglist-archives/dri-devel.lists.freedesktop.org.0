Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002A2B3B12
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF1889DB4;
	Mon, 16 Nov 2020 01:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CB06E9EB
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:26 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id l10so17843630lji.4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dejh7lmuIs2BCjeD8ndvQApwvmyVhewJWcHAU0cSde8=;
 b=fgmXLV1zNcinx9KdF5QkvdTY8uPrcrQ9WALdna1Pel7A1vePC67hPrvNgRhBN5OxTF
 hAyHIA+GW/vEeohwrAY/ufKVjhNCkp+aFy7lu4HuaIklx17KqoSHBkJNqdRV2N9qw3CT
 lZ5FWii503awqm4VH0z688Q2Y47uHpnyhpUprS8S3tg/rgxACvRrsFBwHe9OIOHqGsum
 XoAUQReBQriO6p/sadQq/SvufMMqel39K88AGmA5U2erJgySd3Q6vmZp607khCeiAoTU
 u8wJGle+NBtyoOT9oaFm8z5KWE7ZoFrcYPpw6G8VDna07sJnz5wKovUqmCKUWnqkSNul
 MTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dejh7lmuIs2BCjeD8ndvQApwvmyVhewJWcHAU0cSde8=;
 b=roXNQ0lZ+IdIJSxma7Oz0GfWu2EWwFb0yUiEIBs5n8KL4wf8Kaj1PIen3XenZSd7EG
 7B/duBwrrUKVpEuxiia3kIhpqGP5hcUnH7tDioLW3proV9KJjFsIlkIjBvRCkGEs0Uwf
 nhMgYqER57u34lPP+x25HzuRw108VwhvqtRa7ABmVDrKZYnyRveIHqchhbpC+ZbTRY+u
 h/K2akrSlrJ7cpm7lwA+fc/D5ZhadY6mltgoSBT7yHs6BuB3BhILpgOgZ54XSGI7++Xt
 64GA+Ru61QLjm0uFQ2ZE82doOPFgKFOHt0/3kbw1YJrwT9T4xoMH9mqSLsMLZ13rpo5D
 nXkg==
X-Gm-Message-State: AOAM530W1p7RnJseffAp3+2Po/PzF4I4iKvB9i4M6zV+nwxFFzr8hRWP
 rTHX/4jf6A4gb8fMbKmp++M=
X-Google-Smtp-Source: ABdhPJxq19CQqCuiBnJhAzL51S7uzd9bwSxxnxHZyCDTZ0foMVY/Nuezk6I9A5d9RrTaq0raeqCryA==
X-Received: by 2002:a2e:9dda:: with SMTP id x26mr5076787ljj.331.1605476005073; 
 Sun, 15 Nov 2020 13:33:25 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:24 -0800 (PST)
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
Subject: [PATCH v9 08/17] PM / devfreq: tegra30: Separate configurations
 per-SoC generation
Date: Mon, 16 Nov 2020 00:29:13 +0300
Message-Id: <20201115212922.4390-9-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115212922.4390-1-digetx@gmail.com>
References: <20201115212922.4390-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
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
index ed6d4469c8c7..36ba82c3898c 100644
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
@@ -786,6 +809,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	if (!tegra)
 		return -ENOMEM;
 
+	tegra->soc = of_device_get_match_data(&pdev->dev);
+
 	tegra->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(tegra->regs))
 		return PTR_ERR(tegra->regs);
@@ -859,9 +884,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	tegra->max_freq = rate / KHZ;
 
-	for (i = 0; i < ARRAY_SIZE(actmon_device_configs); i++) {
+	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
 		dev = tegra->devices + i;
-		dev->config = actmon_device_configs + i;
+		dev->config = tegra->soc->configs + i;
 		dev->regs = tegra->regs + dev->config->offset;
 	}
 
@@ -923,9 +948,24 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
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
