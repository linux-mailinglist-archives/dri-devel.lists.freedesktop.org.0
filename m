Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECF2B3B1C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D1B6E9FA;
	Mon, 16 Nov 2020 01:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFAC6E9EC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:27 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v20so17827198ljk.8
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kRRPaJW/gM7L0QjtLDhzKeECHTYBDICUxkcxvPOGlhE=;
 b=LN4D2kbn3Sqbz1lGyvf/AJQ51C0saQ/oaP7zr91Di0uehw0ezzOuq4AvOZM0zXMyJP
 oN52NwCXEb/SVujlufGQUS3N4PjA9DxDou/yMkUDbhV8RSbRTmnyRomzb2B5gJj5jYe8
 x14oHte0qmwoCOP87NOShlzrj/1ZxLmf+ywpin29CiDN7gp6S2QzCd3iLk8VI008qktc
 ZeBppS4C4hdBzXZ6NqFTTQioWQuKt7AGpH4aCrqouSU0JeLudV/B6azRS9mWNstxYR+c
 8Q68vKHXJUGEdowKe4H3qBIy86UDpdmeprTRjJZFuaOgWHlaRE5uLUX6m1jSpziUBE21
 pEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kRRPaJW/gM7L0QjtLDhzKeECHTYBDICUxkcxvPOGlhE=;
 b=faP8wCDk1/1vQkemxxIFOhv5Ki3LtR/vVKrGEHF+QG3WzzUlkEOneO/7moA17XYoqF
 DlD2JqvWP/Dr/Fbphw18bkudXMxFUA6gGp8MCuBxi4dGtdNPuxWF/Lzf7poUILtgBr1T
 ByQQ7OitKh+qwfyOKf9tIly3677GTCZ6X5DrGJynqS533DkwL9zZ3B3DNT8BEufdaW0b
 YwWpW5v+6dHjQeWQhzUVJ1HReRxWGLgvx/oPB9W6Jh4jX2LVXi1cOIxVwcpdFfNglBtD
 pP3f1P6Qc8XSl0RIzckrJD50dNTfwyxygF03O5floqN2fc2rVhHiXYQclyzdI4V7tU96
 zjWg==
X-Gm-Message-State: AOAM533QmgcDx14h0JaOs4RptNJP9YD2qU6DYu20HKwCMinj/7ZquRWA
 8HTP247xoiFaPqiTsGYneOk=
X-Google-Smtp-Source: ABdhPJz4PoXAk2muZV9Yg53uqqw7DVbppub4U0Axu33VemLeV4gkWOxbLQp09GgsN/IIKwkUHsYwLg==
X-Received: by 2002:a2e:b0cc:: with SMTP id g12mr5174644ljl.309.1605476006157; 
 Sun, 15 Nov 2020 13:33:26 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:25 -0800 (PST)
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
Subject: [PATCH v9 09/17] PM / devfreq: tegra20: Deprecate in a favor of
 emc-stat based driver
Date: Mon, 16 Nov 2020 00:29:14 +0300
Message-Id: <20201115212922.4390-10-digetx@gmail.com>
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

Remove tegra20-devfreq in order to replace it with a EMC_STAT based
devfreq driver. Previously we were going to use MC_STAT based
tegra20-devfreq driver because EMC_STAT wasn't working properly, but
now that problem is resolved. This resolves complications imposed by
the removed driver since it was depending on both EMC and MC drivers
simultaneously.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 MAINTAINERS                       |   1 -
 drivers/devfreq/Kconfig           |  10 --
 drivers/devfreq/Makefile          |   1 -
 drivers/devfreq/tegra20-devfreq.c | 210 ------------------------------
 4 files changed, 222 deletions(-)
 delete mode 100644 drivers/devfreq/tegra20-devfreq.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0818a5b03832..f1fd25d7e9ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11389,7 +11389,6 @@ L:	linux-pm@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
 S:	Maintained
-F:	drivers/devfreq/tegra20-devfreq.c
 F:	drivers/devfreq/tegra30-devfreq.c
 
 MEMORY MANAGEMENT
diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 0ee36ae2fa79..00704efe6398 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -121,16 +121,6 @@ config ARM_TEGRA_DEVFREQ
 	  It reads ACTMON counters of memory controllers and adjusts the
 	  operating frequencies and voltages with OPP support.
 
-config ARM_TEGRA20_DEVFREQ
-	tristate "NVIDIA Tegra20 DEVFREQ Driver"
-	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
-	depends on COMMON_CLK
-	select DEVFREQ_GOV_SIMPLE_ONDEMAND
-	help
-	  This adds the DEVFREQ driver for the Tegra20 family of SoCs.
-	  It reads Memory Controller counters and adjusts the operating
-	  frequencies and voltages with OPP support.
-
 config ARM_RK3399_DMC_DEVFREQ
 	tristate "ARM RK3399 DMC DEVFREQ Driver"
 	depends on (ARCH_ROCKCHIP && HAVE_ARM_SMCCC) || \
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 3ca1ad0ecb97..a16333ea7034 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -13,7 +13,6 @@ obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)	+= imx-bus.o
 obj-$(CONFIG_ARM_IMX8M_DDRC_DEVFREQ)	+= imx8m-ddrc.o
 obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
 obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
-obj-$(CONFIG_ARM_TEGRA20_DEVFREQ)	+= tegra20-devfreq.o
 
 # DEVFREQ Event Drivers
 obj-$(CONFIG_PM_DEVFREQ_EVENT)		+= event/
diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
deleted file mode 100644
index fd801534771d..000000000000
--- a/drivers/devfreq/tegra20-devfreq.c
+++ /dev/null
@@ -1,210 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * NVIDIA Tegra20 devfreq driver
- *
- * Copyright (C) 2019 GRATE-DRIVER project
- */
-
-#include <linux/clk.h>
-#include <linux/devfreq.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-#include <linux/pm_opp.h>
-#include <linux/slab.h>
-
-#include <soc/tegra/mc.h>
-
-#include "governor.h"
-
-#define MC_STAT_CONTROL				0x90
-#define MC_STAT_EMC_CLOCK_LIMIT			0xa0
-#define MC_STAT_EMC_CLOCKS			0xa4
-#define MC_STAT_EMC_CONTROL			0xa8
-#define MC_STAT_EMC_COUNT			0xb8
-
-#define EMC_GATHER_CLEAR			(1 << 8)
-#define EMC_GATHER_ENABLE			(3 << 8)
-
-struct tegra_devfreq {
-	struct devfreq *devfreq;
-	struct clk *emc_clock;
-	void __iomem *regs;
-};
-
-static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
-				u32 flags)
-{
-	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
-	struct devfreq *devfreq = tegra->devfreq;
-	struct dev_pm_opp *opp;
-	unsigned long rate;
-	int err;
-
-	opp = devfreq_recommended_opp(dev, freq, flags);
-	if (IS_ERR(opp))
-		return PTR_ERR(opp);
-
-	rate = dev_pm_opp_get_freq(opp);
-	dev_pm_opp_put(opp);
-
-	err = clk_set_min_rate(tegra->emc_clock, rate);
-	if (err)
-		return err;
-
-	err = clk_set_rate(tegra->emc_clock, 0);
-	if (err)
-		goto restore_min_rate;
-
-	return 0;
-
-restore_min_rate:
-	clk_set_min_rate(tegra->emc_clock, devfreq->previous_freq);
-
-	return err;
-}
-
-static int tegra_devfreq_get_dev_status(struct device *dev,
-					struct devfreq_dev_status *stat)
-{
-	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
-
-	/*
-	 * EMC_COUNT returns number of memory events, that number is lower
-	 * than the number of clocks. Conversion ratio of 1/8 results in a
-	 * bit higher bandwidth than actually needed, it is good enough for
-	 * the time being because drivers don't support requesting minimum
-	 * needed memory bandwidth yet.
-	 *
-	 * TODO: adjust the ratio value once relevant drivers will support
-	 * memory bandwidth management.
-	 */
-	stat->busy_time = readl_relaxed(tegra->regs + MC_STAT_EMC_COUNT);
-	stat->total_time = readl_relaxed(tegra->regs + MC_STAT_EMC_CLOCKS) / 8;
-	stat->current_frequency = clk_get_rate(tegra->emc_clock);
-
-	writel_relaxed(EMC_GATHER_CLEAR, tegra->regs + MC_STAT_CONTROL);
-	writel_relaxed(EMC_GATHER_ENABLE, tegra->regs + MC_STAT_CONTROL);
-
-	return 0;
-}
-
-static struct devfreq_dev_profile tegra_devfreq_profile = {
-	.polling_ms	= 500,
-	.target		= tegra_devfreq_target,
-	.get_dev_status	= tegra_devfreq_get_dev_status,
-};
-
-static struct tegra_mc *tegra_get_memory_controller(void)
-{
-	struct platform_device *pdev;
-	struct device_node *np;
-	struct tegra_mc *mc;
-
-	np = of_find_compatible_node(NULL, NULL, "nvidia,tegra20-mc-gart");
-	if (!np)
-		return ERR_PTR(-ENOENT);
-
-	pdev = of_find_device_by_node(np);
-	of_node_put(np);
-	if (!pdev)
-		return ERR_PTR(-ENODEV);
-
-	mc = platform_get_drvdata(pdev);
-	if (!mc)
-		return ERR_PTR(-EPROBE_DEFER);
-
-	return mc;
-}
-
-static int tegra_devfreq_probe(struct platform_device *pdev)
-{
-	struct tegra_devfreq *tegra;
-	struct tegra_mc *mc;
-	unsigned long max_rate;
-	unsigned long rate;
-	int err;
-
-	mc = tegra_get_memory_controller();
-	if (IS_ERR(mc)) {
-		err = PTR_ERR(mc);
-		dev_err(&pdev->dev, "failed to get memory controller: %d\n",
-			err);
-		return err;
-	}
-
-	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
-	if (!tegra)
-		return -ENOMEM;
-
-	/* EMC is a system-critical clock that is always enabled */
-	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(tegra->emc_clock))
-		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->emc_clock),
-				     "failed to get emc clock\n");
-
-	tegra->regs = mc->regs;
-
-	max_rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
-
-	for (rate = 0; rate <= max_rate; rate++) {
-		rate = clk_round_rate(tegra->emc_clock, rate);
-
-		err = dev_pm_opp_add(&pdev->dev, rate, 0);
-		if (err) {
-			dev_err(&pdev->dev, "failed to add opp: %d\n", err);
-			goto remove_opps;
-		}
-	}
-
-	/*
-	 * Reset statistic gathers state, select global bandwidth for the
-	 * statistics collection mode and set clocks counter saturation
-	 * limit to maximum.
-	 */
-	writel_relaxed(0x00000000, tegra->regs + MC_STAT_CONTROL);
-	writel_relaxed(0x00000000, tegra->regs + MC_STAT_EMC_CONTROL);
-	writel_relaxed(0xffffffff, tegra->regs + MC_STAT_EMC_CLOCK_LIMIT);
-
-	platform_set_drvdata(pdev, tegra);
-
-	tegra->devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
-					    DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
-	if (IS_ERR(tegra->devfreq)) {
-		err = PTR_ERR(tegra->devfreq);
-		goto remove_opps;
-	}
-
-	return 0;
-
-remove_opps:
-	dev_pm_opp_remove_all_dynamic(&pdev->dev);
-
-	return err;
-}
-
-static int tegra_devfreq_remove(struct platform_device *pdev)
-{
-	struct tegra_devfreq *tegra = platform_get_drvdata(pdev);
-
-	devfreq_remove_device(tegra->devfreq);
-	dev_pm_opp_remove_all_dynamic(&pdev->dev);
-
-	return 0;
-}
-
-static struct platform_driver tegra_devfreq_driver = {
-	.probe		= tegra_devfreq_probe,
-	.remove		= tegra_devfreq_remove,
-	.driver		= {
-		.name	= "tegra20-devfreq",
-	},
-};
-module_platform_driver(tegra_devfreq_driver);
-
-MODULE_ALIAS("platform:tegra20-devfreq");
-MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
-MODULE_DESCRIPTION("NVIDIA Tegra20 devfreq driver");
-MODULE_LICENSE("GPL v2");
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
