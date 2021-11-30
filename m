Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26711464273
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834A76E7D4;
	Tue, 30 Nov 2021 23:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820636E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:07 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id r26so57903571lfn.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ICJnk3FwYhvBb3ZzWnvNkPNXyskDbLEUXbJt1XZit8o=;
 b=X+yTWYpAAEzzZ0MPCyEBN0girAa4u+nRe66ItjmQHKXh6l/IsBrJhaIv3vSd6TMRR/
 62e3Bbrq7A8a+8wTjxmyPNATt98pPKirmFYP92LAWUTNCCIPEYXI0IYkd7ToreOkJ86d
 z6KxRsXpX1OwM1FmpJ9U8Az+pwv85H330dyad2bmvZcaKyHR14jzIxowIgwQob2GDpVF
 3158IW0KPMsZ7uMB2GtLNcc++jWnNoaQG0LMtlfMEYp2TPpyznw/6OPHQDsUzKL1Y12S
 jIY3Y7r36CyXgIo+ynrHcbnPe3rI+eSmxBOfmAhzpwvrlc7IUTy956FV8kf0bGiEvk9C
 zp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ICJnk3FwYhvBb3ZzWnvNkPNXyskDbLEUXbJt1XZit8o=;
 b=RyLPjUYPIaiI475WqEHy82OB78kFSvYhptmSKEoN/MJZN4ZrlndJuS4D+ZKUdyHxAV
 eKmo0GvkGc/Q67zybrJIwYxRMuaSyHNnzmOvFD+KwW8Q5ofC/ZQjapeXqadYRAPjU3W5
 afUlN8p+XQ3Ey6twpedieKVBENVrhvB5Jko2ff4kcWln4rAF4kYv89VdlZaAowmpfzXz
 USx1sr6OHGEHBPBI72hL50pEglYceLTeLyADBFOTBKK28GMftkvSRKlOPYdk/HOagv0T
 Zl4ASysITKI1ukare4Uwhh1hPTpDjv6GsiP1q6baLufHuD1HvihpRFwy2zmiIuFk25AK
 +vFA==
X-Gm-Message-State: AOAM533Dym+8Rzks7nDeyuDx1P3uzC8WdeKUn4DsNfU2zx9WjJUhN5Lr
 uW7sFrXh+OpagIQc/4CZhhA=
X-Google-Smtp-Source: ABdhPJwGSBDqYX5ilFH58KTzc0EOSr5ocGDAIJKTE5f6EPmFGBJry+nOoQGvI55SX64HX2f7h/pQlA==
X-Received: by 2002:ac2:4d29:: with SMTP id h9mr2173173lfk.633.1638314645871; 
 Tue, 30 Nov 2021 15:24:05 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:05 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v16 11/40] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
Date: Wed,  1 Dec 2021 02:23:18 +0300
Message-Id: <20211130232347.950-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add OPP and SoC core voltage scaling support to the display controller
driver. This is required for enabling system-wide DVFS on pre-Tegra186
SoCs.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 79 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.h |  2 +
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index a457ee954a49..eb70eee8992a 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -11,9 +11,12 @@
 #include <linux/interconnect.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
 #include <soc/tegra/pmc.h>
 
 #include <drm/drm_atomic.h>
@@ -1834,6 +1837,52 @@ int tegra_dc_state_setup_clock(struct tegra_dc *dc,
 	return 0;
 }
 
+static void tegra_dc_update_voltage_state(struct tegra_dc *dc,
+					  struct tegra_dc_state *state)
+{
+	unsigned long rate, pstate;
+	struct dev_pm_opp *opp;
+	int err;
+
+	if (!dc->has_opp_table)
+		return;
+
+	/* calculate actual pixel clock rate which depends on internal divider */
+	rate = DIV_ROUND_UP(clk_get_rate(dc->clk) * 2, state->div + 2);
+
+	/* find suitable OPP for the rate */
+	opp = dev_pm_opp_find_freq_ceil(dc->dev, &rate);
+
+	/*
+	 * Very high resolution modes may results in a clock rate that is
+	 * above the characterized maximum. In this case it's okay to fall
+	 * back to the characterized maximum.
+	 */
+	if (opp == ERR_PTR(-ERANGE))
+		opp = dev_pm_opp_find_freq_floor(dc->dev, &rate);
+
+	if (IS_ERR(opp)) {
+		dev_err(dc->dev, "failed to find OPP for %luHz: %pe\n",
+			rate, opp);
+		return;
+	}
+
+	pstate = dev_pm_opp_get_required_pstate(opp, 0);
+	dev_pm_opp_put(opp);
+
+	/*
+	 * The minimum core voltage depends on the pixel clock rate (which
+	 * depends on internal clock divider of the CRTC) and not on the
+	 * rate of the display controller clock. This is why we're not using
+	 * dev_pm_opp_set_rate() API and instead controlling the power domain
+	 * directly.
+	 */
+	err = dev_pm_genpd_set_performance_state(dc->dev, pstate);
+	if (err)
+		dev_err(dc->dev, "failed to set power domain state to %lu: %d\n",
+			pstate, err);
+}
+
 static void tegra_dc_set_clock_rate(struct tegra_dc *dc,
 				    struct tegra_dc_state *state)
 {
@@ -1867,6 +1916,8 @@ static void tegra_dc_set_clock_rate(struct tegra_dc *dc,
 	DRM_DEBUG_KMS("rate: %lu, div: %u\n", clk_get_rate(dc->clk),
 		      state->div);
 	DRM_DEBUG_KMS("pclk: %lu\n", state->pclk);
+
+	tegra_dc_update_voltage_state(dc, state);
 }
 
 static void tegra_dc_stop(struct tegra_dc *dc)
@@ -2057,6 +2108,13 @@ static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
 	err = host1x_client_suspend(&dc->client);
 	if (err < 0)
 		dev_err(dc->dev, "failed to suspend: %d\n", err);
+
+	if (dc->has_opp_table) {
+		err = dev_pm_genpd_set_performance_state(dc->dev, 0);
+		if (err)
+			dev_err(dc->dev,
+				"failed to clear power domain state: %d\n", err);
+	}
 }
 
 static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -3058,6 +3116,23 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 	return 0;
 }
 
+static int tegra_dc_init_opp_table(struct tegra_dc *dc)
+{
+	struct tegra_core_opp_params opp_params = {};
+	int err;
+
+	err = devm_tegra_core_dev_init_opp_table(dc->dev, &opp_params);
+	if (err && err != -ENODEV)
+		return err;
+
+	if (err)
+		dc->has_opp_table = false;
+	else
+		dc->has_opp_table = true;
+
+	return 0;
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	u64 dma_mask = dma_get_mask(pdev->dev.parent);
@@ -3123,6 +3198,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		tegra_powergate_power_off(dc->powergate);
 	}
 
+	err = tegra_dc_init_opp_table(dc);
+	if (err < 0)
+		return err;
+
 	dc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dc->regs))
 		return PTR_ERR(dc->regs);
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index c9c4c45c0518..3f91a10ea6c7 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -101,6 +101,8 @@ struct tegra_dc {
 	struct drm_info_list *debugfs_files;
 
 	const struct tegra_dc_soc_info *soc;
+
+	bool has_opp_table;
 };
 
 static inline struct tegra_dc *
-- 
2.33.1

