Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA7245D0F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6F16E484;
	Mon, 17 Aug 2020 07:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8296EAC2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:17 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v12so8091945ljc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gc+aFeFcEEe0r2e6kfr4D7GHdjfoBcTEAztvWmEYKOI=;
 b=qOlCRW4YKq7eraL0D+nMuvdP0nKf2YB3LHLWujjF9N7fKZ+0dGAqCZoSrWQoCAfcaq
 IdEYT/DDOjsoiSPKIf0WcjKhGRDhRrzwEl+SgzCWmlr1dVWREpMLY4EL5pJLE5j+UiBQ
 4gdN8mIcjCr7UrWGjezdIe0NFwKDcjXUyRMNJ0CaCwZMS/gUrxmx4zsbOFP84i+DDCSP
 kx3zLe2Tz184wiYgNxVB+sSVLbrQVZ8tGThnS6fzq+oQB+dFID3fxscp4hurFVrN+BaA
 we2TsVfxsyO3joDBk+dHXKxxvaDE5+GxxbDoh/0l9vcT9s5M7Nxk3xryypAAHts8vuIK
 0OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gc+aFeFcEEe0r2e6kfr4D7GHdjfoBcTEAztvWmEYKOI=;
 b=fsHgcMGnB45mKQQvJGX0bGh5APYI7HGUVDSevk5ro8W+25256nniYG/eqmTfhdCoJX
 tZCn/9GBeubYF3W7BVLLGiJQvNWb7/bls6HkCCOoAkuOqK1Oi5zqdegoul0E6R5GaOyv
 z7rTo/tNmZOCOMFSDStAr9tNtuMXsDv+UrhyOcG+/u+Ne4qW1Qi2EoWy2UBSr4hH9/W5
 YM777O5qJynnHfwC3A1l6VzlChVy+6bgGcHvVoNOKzFqXvcJGLu8OIWbQKqmAK06AwKz
 Ukwbc9pN0cbeW5H5N2UtSAjQ5PaVi2rBYYtRl6zlat4o32rxD6Pf0OBXObWge9NYZaIy
 7S+A==
X-Gm-Message-State: AOAM533Emr3uwWdwHXu/LvNq9mWOn65a7oXiKCrGPkdKzz289a3m32w4
 O4qawPZikGogWBx6lsysMEQ=
X-Google-Smtp-Source: ABdhPJyLqxpWmF26iNvV15chMmfqVwwnfry3sIqaIUF06wr+7+dJDbgJL9oYeQttZiVFIxgfOvpHqQ==
X-Received: by 2002:a05:651c:1b4:: with SMTP id
 c20mr102897ljn.432.1597363635587; 
 Thu, 13 Aug 2020 17:07:15 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:15 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v5 13/36] PM / devfreq: tegra30: Use MC timings for building
 OPP table
Date: Fri, 14 Aug 2020 03:05:58 +0300
Message-Id: <20200814000621.8415-14-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

The clk_round_rate() won't be usable for building OPP table once
interconnect support will be added to the EMC driver because that CLK API
function limits the rounded rate based on the clk rate that is imposed by
active clk-users, and thus, the rounding won't work as expected if
interconnect will set the minimum EMC clock rate before devfreq driver is
loaded. The struct tegra_mc contains memory timings which could be used by
the devfreq driver for building up OPP table instead of rounding clock
rate, this patch implements this idea.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 93 +++++++++++++++++++++----------
 1 file changed, 65 insertions(+), 28 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 423dd35c95b3..6c2f56b34535 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -19,6 +19,8 @@
 #include <linux/reset.h>
 #include <linux/workqueue.h>
 
+#include <soc/tegra/mc.h>
+
 #include "governor.h"
 
 #define ACTMON_GLB_STATUS					0x0
@@ -153,6 +155,18 @@ struct tegra_devfreq_device {
 	unsigned long target_freq;
 };
 
+struct tegra_devfreq_soc_data {
+	const char *mc_compatible;
+};
+
+static const struct tegra_devfreq_soc_data tegra30_soc = {
+	.mc_compatible = "nvidia,tegra30-mc",
+};
+
+static const struct tegra_devfreq_soc_data tegra124_soc = {
+	.mc_compatible = "nvidia,tegra124-mc",
+};
+
 struct tegra_devfreq {
 	struct devfreq		*devfreq;
 
@@ -771,15 +785,49 @@ static struct devfreq_governor tegra_devfreq_governor = {
 	.interrupt_driven = true,
 };
 
+static struct tegra_mc *tegra_get_memory_controller(const char *compatible)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct tegra_mc *mc;
+
+	np = of_find_compatible_node(NULL, NULL, compatible);
+	if (!np)
+		return ERR_PTR(-ENOENT);
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	mc = platform_get_drvdata(pdev);
+	if (!mc)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return mc;
+}
+
 static int tegra_devfreq_probe(struct platform_device *pdev)
 {
+	const struct tegra_devfreq_soc_data *soc_data;
 	struct tegra_devfreq_device *dev;
 	struct tegra_devfreq *tegra;
 	struct devfreq *devfreq;
+	struct tegra_mc *mc;
 	unsigned int i;
-	long rate;
 	int err;
 
+	soc_data = of_device_get_match_data(&pdev->dev);
+
+	mc = tegra_get_memory_controller(soc_data->mc_compatible);
+	if (IS_ERR(mc))
+		return PTR_ERR(mc);
+
+	if (!mc->num_timings) {
+		dev_info(&pdev->dev, "memory controller has no timings\n");
+		return -ENODEV;
+	}
+
 	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
 	if (!tegra)
 		return -ENOMEM;
@@ -825,6 +873,20 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	for (i = 0; i < mc->num_timings; i++) {
+		/*
+		 * Memory Controller timings are sorted in ascending clock
+		 * rate order, so the last timing will be the max freq.
+		 */
+		tegra->max_freq = mc->timings[i].rate / KHZ;
+
+		err = dev_pm_opp_add(&pdev->dev, tegra->max_freq, 0);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
+			goto remove_opps;
+		}
+	}
+
 	reset_control_assert(tegra->reset);
 
 	err = clk_prepare_enable(tegra->clock);
@@ -836,37 +898,12 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	reset_control_deassert(tegra->reset);
 
-	rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
-	if (rate < 0) {
-		dev_err(&pdev->dev, "Failed to round clock rate: %ld\n", rate);
-		return rate;
-	}
-
-	tegra->max_freq = rate / KHZ;
-
 	for (i = 0; i < ARRAY_SIZE(actmon_device_configs); i++) {
 		dev = tegra->devices + i;
 		dev->config = actmon_device_configs + i;
 		dev->regs = tegra->regs + dev->config->offset;
 	}
 
-	for (rate = 0; rate <= tegra->max_freq * KHZ; rate++) {
-		rate = clk_round_rate(tegra->emc_clock, rate);
-
-		if (rate < 0) {
-			dev_err(&pdev->dev,
-				"Failed to round clock rate: %ld\n", rate);
-			err = rate;
-			goto remove_opps;
-		}
-
-		err = dev_pm_opp_add(&pdev->dev, rate / KHZ, 0);
-		if (err) {
-			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
-			goto remove_opps;
-		}
-	}
-
 	platform_set_drvdata(pdev, tegra);
 
 	tegra->clk_rate_change_nb.notifier_call = tegra_actmon_clk_notify_cb;
@@ -921,8 +958,8 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
 }
 
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
