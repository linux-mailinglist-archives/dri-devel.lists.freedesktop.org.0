Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC672CE9B5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DEC6E147;
	Fri,  4 Dec 2020 08:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D326EB95
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 19:25:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s30so4389597lfc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 11:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnqsd+V53uqp1CGIZaebjaGV3U3sH5Obhs6azmKGMYs=;
 b=FlytKDeU3JEATzKETacbtY60cVjg+91y8R0jkQIDOQBudb+fkEP9sZO2GHKcRiGhiW
 IPbjxNN/KVf+sZMI43Mvko5yETTB1t7c5of1rIlVFduSgP/D/lOEf1E3XiV3B+m/kbkI
 P+BQ8pY/t3q2+C3UciEKQtmVP8c0OP183KWlN/52opbG3csg/cJ+sV5jjQD+OHUTFbkV
 6mg7Q0aiG5KBzlM/LqRIt4PG5k1EYERCd67ES5O1XUSrIPPhIuv+3CuHT8iTzdX/0hIA
 YbCfC36xDt+RGLO88M7NAchCEz906LflCVva66M0q/ReRAxOUVwo8Y3DaDW3vdFnDH7h
 vDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnqsd+V53uqp1CGIZaebjaGV3U3sH5Obhs6azmKGMYs=;
 b=rJccJRSFNfnwnYdSpS4LlGToHSFvZs5ja50GUfCX45HgQfWEKW8Vs83dA+Pv0fJeuA
 7GR0D7W/rifPHzP3yetwB3FDlwvM7+AzpfW4iQkvTZZ4biiUIVS9MEkMNzLl7/Wvcxhv
 49/Y7JDR5xj1NAPaqI0EltgDImThkPgqB6hF8m/zOQyIl4bGlR8s+DSQ6HLJNEj+VMl/
 bZg28d2QmxSidseIxGFYV4A0s9eSO66BTCU4jDeK7SlW2+ou9ts6SNixjQnEoK6PBsgM
 n8kux9ZB4MzhXfkwD5KjCJetlRFiFKCgoiKSiGt1MsAtpJTXmRDixSuTm2vIjPF3EYpr
 OIUw==
X-Gm-Message-State: AOAM5332w8ekp4S7jG4q4aAgWieHKGaFaZusNRH8dJVazeVtsWDab9hh
 IE8j1vQrOcDCsWLE+nNQSeA=
X-Google-Smtp-Source: ABdhPJwHF1KdVYGK3MYHKWAkrxyWi+CXeMnKPheEGOnaXUlMMp5iaP7D3krOCKlTw08r1LJ/UDlB4g==
X-Received: by 2002:a05:6512:1095:: with SMTP id
 j21mr1838166lfg.309.1607023502161; 
 Thu, 03 Dec 2020 11:25:02 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru.
 [109.252.192.53])
 by smtp.gmail.com with ESMTPSA id z7sm861932lfq.50.2020.12.03.11.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 11:25:01 -0800 (PST)
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
Subject: [PATCH v11 09/10] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
Date: Thu,  3 Dec 2020 22:24:38 +0300
Message-Id: <20201203192439.16177-10-digetx@gmail.com>
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

This patch moves ACTMON driver away from generating OPP table by itself,
transitioning it to use the table which comes from device-tree. This
change breaks compatibility with older device-trees and brings support
for the interconnect framework to the driver. This is a mandatory change
which needs to be done in order to implement interconnect-based memory
DVFS, i.e. device-trees need to be updated. Now ACTMON issues a memory
bandwidth requests using dev_pm_opp_set_bw() instead of driving EMC clock
rate directly.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 79 +++++++++++++++----------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 38cc0d014738..145ef91ae092 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -19,6 +19,8 @@
 #include <linux/reset.h>
 #include <linux/workqueue.h>
 
+#include <soc/tegra/fuse.h>
+
 #include "governor.h"
 
 #define ACTMON_GLB_STATUS					0x0
@@ -155,6 +157,7 @@ struct tegra_devfreq_device {
 
 struct tegra_devfreq {
 	struct devfreq		*devfreq;
+	struct opp_table	*opp_table;
 
 	struct reset_control	*reset;
 	struct clk		*clock;
@@ -612,34 +615,19 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
 static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 				u32 flags)
 {
-	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
-	struct devfreq *devfreq = tegra->devfreq;
 	struct dev_pm_opp *opp;
-	unsigned long rate;
-	int err;
+	int ret;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
 	if (IS_ERR(opp)) {
 		dev_err(dev, "Failed to find opp for %lu Hz\n", *freq);
 		return PTR_ERR(opp);
 	}
-	rate = dev_pm_opp_get_freq(opp);
-	dev_pm_opp_put(opp);
-
-	err = clk_set_min_rate(tegra->emc_clock, rate * KHZ);
-	if (err)
-		return err;
-
-	err = clk_set_rate(tegra->emc_clock, 0);
-	if (err)
-		goto restore_min_rate;
 
-	return 0;
-
-restore_min_rate:
-	clk_set_min_rate(tegra->emc_clock, devfreq->previous_freq);
+	ret = dev_pm_opp_set_bw(dev, opp);
+	dev_pm_opp_put(opp);
 
-	return err;
+	return ret;
 }
 
 static int tegra_devfreq_get_dev_status(struct device *dev,
@@ -655,7 +643,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 	stat->private_data = tegra;
 
 	/* The below are to be used by the other governors */
-	stat->current_frequency = cur_freq;
+	stat->current_frequency = cur_freq * KHZ;
 
 	actmon_dev = &tegra->devices[MCALL];
 
@@ -705,7 +693,12 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
 		target_freq = max(target_freq, dev->target_freq);
 	}
 
-	*freq = target_freq;
+	/*
+	 * tegra-devfreq driver operates with KHz units, while OPP table
+	 * entries use Hz units. Hence we need to convert the units for the
+	 * devfreq core.
+	 */
+	*freq = target_freq * KHZ;
 
 	return 0;
 }
@@ -774,6 +767,7 @@ static struct devfreq_governor tegra_devfreq_governor = {
 
 static int tegra_devfreq_probe(struct platform_device *pdev)
 {
+	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
 	struct tegra_devfreq_device *dev;
 	struct tegra_devfreq *tegra;
 	struct devfreq *devfreq;
@@ -822,11 +816,25 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	tegra->opp_table = dev_pm_opp_set_supported_hw(&pdev->dev,
+						       &hw_version, 1);
+	err = PTR_ERR_OR_ZERO(tegra->opp_table);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to set supported HW: %d\n", err);
+		return err;
+	}
+
+	err = dev_pm_opp_of_add_table(&pdev->dev);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to add OPP table: %d\n", err);
+		goto put_hw;
+	}
+
 	err = clk_prepare_enable(tegra->clock);
 	if (err) {
 		dev_err(&pdev->dev,
 			"Failed to prepare and enable ACTMON clock\n");
-		return err;
+		goto remove_table;
 	}
 
 	err = reset_control_reset(tegra->reset);
@@ -850,23 +858,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
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
@@ -882,7 +873,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	}
 
 	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
-	tegra_devfreq_profile.initial_freq /= KHZ;
 
 	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
 				     "tegra_actmon", NULL);
@@ -902,6 +892,10 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	reset_control_reset(tegra->reset);
 disable_clk:
 	clk_disable_unprepare(tegra->clock);
+remove_table:
+	dev_pm_opp_of_remove_table(&pdev->dev);
+put_hw:
+	dev_pm_opp_put_supported_hw(tegra->opp_table);
 
 	return err;
 }
@@ -913,11 +907,12 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
 	devfreq_remove_device(tegra->devfreq);
 	devfreq_remove_governor(&tegra_devfreq_governor);
 
-	dev_pm_opp_remove_all_dynamic(&pdev->dev);
-
 	reset_control_reset(tegra->reset);
 	clk_disable_unprepare(tegra->clock);
 
+	dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_put_supported_hw(tegra->opp_table);
+
 	return 0;
 }
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
