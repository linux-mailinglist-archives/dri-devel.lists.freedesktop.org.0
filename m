Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E32402AEA72
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD55A89E86;
	Wed, 11 Nov 2020 07:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F208889D6C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o15so734121wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2H5Lm+qxnRH66Iv9SihHnRlpGVSBdudBvuJJ7xJCLGs=;
 b=CcR7eJqJ8+wvjgRNKfYchXC1ubzvS4Ne9crwHQPHnSxMpyClYrh5jVCpGtYfJPgcHS
 ZlM12pZC3QtKfYgxhBKPDcsDap6U3y3AStECCKTWal/QiEen+c0SsxmwnAoDYj2gG0BX
 dgTPI1u4ECUQvS6iv5puSqym4gnZEzF1nvAFcTx7T8Hw64j+LlX97qWPNtETVYzO7H1f
 SvOdU8lPKoiAHRIp60bGYUbRhUNJHos06mSyDjMTZ5VM86/26PRLsSH2UW3R7NsnWjT+
 dduTd2TtoUgYAzKmXKG9UBv5ZIrAIXrJPjp09/xxyMru5e8VrnkzLIABgdCmFpLgki7x
 6zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2H5Lm+qxnRH66Iv9SihHnRlpGVSBdudBvuJJ7xJCLGs=;
 b=lEkXw67MtC9DYVJ12QLUeHw0/PUHttYKnQXLo+KhNi28Il3WQO2/PTlCf87vxuQ29W
 WQPpxKMp0WwkQrUF+KE77rk7pE94iM2JeNKEO+sG6D2UJbSaYGTfU0wcuMGRABrPcbaK
 3UAlLgGSpOECfn6j8YREMTC8VCUg/oIUp4Us7ueZeBVeG89YuntxkpaHa/TiACmPEoT5
 3U1qzJoA/8cB/meJNfsBl9O56CQHuzkk4qgIqNNGN8maYT7U0n/MXiX2+Fei+sLjyd3r
 52uGoZXt8acyYM1EXKF7OQKiciQpZXXSkma2DUCbGQejFc9Y0Rntj0G9nvHgL8MI8WzO
 ZK+Q==
X-Gm-Message-State: AOAM533eAEiRDWmWqpZQ6Vxxw3NZ8yPTt9Y5oEc6/Yi4m9E5oS4uHVm1
 TGt17Tar4ylboYf7c2WfZAE=
X-Google-Smtp-Source: ABdhPJybpkHO7WEGCaTdiIYy3a7vUTnTG+P0Ol/V3RaV6o+aCN6QeuJFyH3uk39oh9p6JS2S8c61iA==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr4709710wrm.414.1605057315654; 
 Tue, 10 Nov 2020 17:15:15 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:15 -0800 (PST)
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
Subject: [PATCH v8 04/26] memory: tegra20-emc: Add devfreq support
Date: Wed, 11 Nov 2020 04:14:34 +0300
Message-Id: <20201111011456.7875-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111011456.7875-1-digetx@gmail.com>
References: <20201111011456.7875-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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

Add devfreq support to the Tegra20 EMC driver. Memory utilization
statistics will be periodically polled from the memory controller and
appropriate minimum clock rate will be selected by the devfreq governor.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |  3 +-
 drivers/memory/tegra/tegra20-emc.c | 90 ++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index ac3dfe155505..8cc1ec5be443 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -12,7 +12,8 @@ config TEGRA20_EMC
 	tristate "NVIDIA Tegra20 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
-	select PM_OPP
+	select DEVFREQ_GOV_SIMPLE_ONDEMAND
+	select PM_DEVFREQ
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra20 chips. The EMC controls the external DRAM on the board.
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index d01b556a6d06..b9cd965980e2 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
+#include <linux/devfreq.h>
 #include <linux/err.h>
 #include <linux/interconnect-provider.h>
 #include <linux/interrupt.h>
@@ -102,6 +103,10 @@
 
 #define EMC_FBIO_CFG5_DRAM_WIDTH_X16		BIT(4)
 
+#define EMC_PWR_GATHER_CLEAR			(1 << 8)
+#define EMC_PWR_GATHER_DISABLE			(2 << 8)
+#define EMC_PWR_GATHER_ENABLE			(3 << 8)
+
 static const u16 emc_timing_registers[] = {
 	EMC_RC,
 	EMC_RFC,
@@ -157,6 +162,7 @@ struct emc_timing {
 };
 
 enum emc_rate_request_type {
+	EMC_RATE_DEVFREQ,
 	EMC_RATE_DEBUG,
 	EMC_RATE_ICC,
 	EMC_RATE_TYPE_MAX,
@@ -193,6 +199,8 @@ struct tegra_emc {
 
 	/* protect shared rate-change code path */
 	struct mutex rate_lock;
+
+	struct devfreq_simple_ondemand_data ondemand_data;
 };
 
 static irqreturn_t tegra_emc_isr(int irq, void *data)
@@ -1003,6 +1011,87 @@ static int tegra_emc_init_clk(struct tegra_emc *emc)
 	return 0;
 }
 
+static int tegra_emc_devfreq_target(struct device *dev, unsigned long *freq,
+				    u32 flags)
+{
+	struct tegra_emc *emc = dev_get_drvdata(dev);
+	struct dev_pm_opp *opp;
+	unsigned long rate;
+
+	opp = devfreq_recommended_opp(dev, freq, flags);
+	if (IS_ERR(opp)) {
+		dev_err(dev, "failed to find opp for %lu Hz\n", *freq);
+		return PTR_ERR(opp);
+	}
+
+	rate = dev_pm_opp_get_freq(opp);
+	dev_pm_opp_put(opp);
+
+	return emc_set_min_rate(emc, rate, EMC_RATE_DEVFREQ);
+}
+
+static int tegra_emc_devfreq_get_dev_status(struct device *dev,
+					    struct devfreq_dev_status *stat)
+{
+	struct tegra_emc *emc = dev_get_drvdata(dev);
+
+	/* freeze counters */
+	writel_relaxed(EMC_PWR_GATHER_DISABLE, emc->regs + EMC_STAT_CONTROL);
+
+	/*
+	 *  busy_time: number of clocks EMC request was accepted
+	 * total_time: number of clocks PWR_GATHER control was set to ENABLE
+	 */
+	stat->busy_time = readl_relaxed(emc->regs + EMC_STAT_PWR_COUNT);
+	stat->total_time = readl_relaxed(emc->regs + EMC_STAT_PWR_CLOCKS);
+	stat->current_frequency = clk_get_rate(emc->clk);
+
+	/* clear counters and restart */
+	writel_relaxed(EMC_PWR_GATHER_CLEAR, emc->regs + EMC_STAT_CONTROL);
+	writel_relaxed(EMC_PWR_GATHER_ENABLE, emc->regs + EMC_STAT_CONTROL);
+
+	return 0;
+}
+
+static struct devfreq_dev_profile tegra_emc_devfreq_profile = {
+	.polling_ms = 30,
+	.target = tegra_emc_devfreq_target,
+	.get_dev_status = tegra_emc_devfreq_get_dev_status,
+};
+
+static int tegra_emc_devfreq_init(struct tegra_emc *emc)
+{
+	struct devfreq *devfreq;
+
+	/*
+	 * PWR_COUNT is 1/2 of PWR_CLOCKS at max, and thus, the up-threshold
+	 * should be less than 50.  Secondly, multiple active memory clients
+	 * may cause over 20% of lost clock cycles due to stalls caused by
+	 * competing memory accesses.  This means that threshold should be
+	 * set to a less than 30 in order to have a properly working governor.
+	 */
+	emc->ondemand_data.upthreshold = 20;
+
+	/*
+	 * Reset statistic gathers state, select global bandwidth for the
+	 * statistics collection mode and set clocks counter saturation
+	 * limit to maximum.
+	 */
+	writel_relaxed(0x00000000, emc->regs + EMC_STAT_CONTROL);
+	writel_relaxed(0x00000000, emc->regs + EMC_STAT_LLMC_CONTROL);
+	writel_relaxed(0xffffffff, emc->regs + EMC_STAT_PWR_CLOCK_LIMIT);
+
+	devfreq = devm_devfreq_add_device(emc->dev, &tegra_emc_devfreq_profile,
+					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
+					  &emc->ondemand_data);
+	if (IS_ERR(devfreq)) {
+		dev_err(emc->dev, "failed to initialize devfreq: %pe", devfreq);
+		return PTR_ERR(devfreq);
+	}
+
+	return 0;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -1058,6 +1147,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	tegra_emc_rate_requests_init(emc);
 	tegra_emc_debugfs_init(emc);
 	tegra_emc_interconnect_init(emc);
+	tegra_emc_devfreq_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
