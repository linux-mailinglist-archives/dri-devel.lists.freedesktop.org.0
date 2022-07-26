Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28083581892
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F40495F4A;
	Tue, 26 Jul 2022 17:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174D95F52
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 17:38:47 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id y9so13818826pff.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UvSYvNuG1zZNgf5lwaC/VfaYfdBFj5iq4D0i1aS1Skw=;
 b=djfRA0Eg0DUtXyTAWIgvYBh4WrojPtSupPoHdpQ5Jw58cZfSkruu49XB9PEHCYf8Bg
 huiJa7f1mFnti3f4hoBb1kyUbccQwOrELcqKa6zaYoGKQJXlZ6JSYsjhftiqgqSqhLtq
 haMSDYXOZewhmtDsBljxk3a/cwgRrTX7KVD8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvSYvNuG1zZNgf5lwaC/VfaYfdBFj5iq4D0i1aS1Skw=;
 b=06PKla9UB2D2za3dB/D9wrh5xPFptdyz/HAK3elDpLy8pbDjBeMuXZ1S5ByQSkxcI7
 7ZcEpBgalP5o0yyx4vgSusMlfPxCZm9A7iCGGah0ITwxoMAxEbJEIPOGcB0yGNplJM/Y
 B+ZKMbwfPN98MKSNz4XvGstyLuMabYB6XVV/AoU4YH9sqNB+wLJls4zuxvje2BSDDybP
 7EFjve9AjDv0TIxzCSqWUAsEHLfPy+Nge4LZzZPS8JYRRdISUH9mV2DysJoZwtvdmkZj
 w/pZNjxX3p61Ahmo17yfmfq0ysKsUztFCws8RtG9hGR7xOVNkELuhLSikKADZ0g4RMf1
 ZYKQ==
X-Gm-Message-State: AJIora+zLkep31JU3um+AI4C+1BvNtl8+VTYRRB/4s+g1TvyjrP2AUVD
 GTbF6husn8uGQmLBVYZhNBLyGg==
X-Google-Smtp-Source: AGRyM1vFdUiyfeSe/x1TcybAAdxEh0/qd7TQii/r3t1NmylM9ZaZ3xbKNbEYB1xEe2/+LsEbzqQppg==
X-Received: by 2002:a05:6a00:1708:b0:52a:ecdd:69d1 with SMTP id
 h8-20020a056a00170800b0052aecdd69d1mr18515922pfc.75.1658857126859; 
 Tue, 26 Jul 2022 10:38:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8693:e9aa:75c0:5134])
 by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:38:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/7] drm/msm/dsi: Don't set a load before disabling a
 regulator
Date: Tue, 26 Jul 2022 10:38:20 -0700
Message-Id: <20220726103631.v2.3.If1f94fbbdb7c1d0fb3961de61483a851ad1971a7@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit 5451781dadf8 ("regulator: core: Only count load for
enabled consumers"), a load isn't counted for a disabled
regulator. That means all the code in the DSI driver to specify and
set loads before disabling a regulator is not actually doing anything
useful. Let's remove it.

It should be noted that all of the loads set that were being specified
were pointless noise anyway. The only use for this number is to pick
between low power and high power modes of regulators. Regulators
appear to do this changeover at loads on the order of 10000 uA. You
would a lot of clients of the same rail for that 100 uA number to
count for anything.

Note that now that we get rid of the setting of the load at disable
time, we can just set the load once when we first get the regulator
and then forget it.

It should also be noted that the regulator functions
regulator_bulk_enable() and regulator_set_load() already print error
messages when they encounter problems so while moving things around we
get rid of some extra error prints.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/msm/dsi/dsi.h                 |  1 -
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 52 +++++++++----------
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 45 ++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 46 ++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    |  4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  6 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  6 +--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  6 +--
 10 files changed, 60 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 580a1e6358bf..bb6a5bd05cb1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -37,7 +37,6 @@ enum msm_dsi_phy_usecase {
 struct dsi_reg_entry {
 	char name[32];
 	int enable_load;
-	int disable_load;
 };
 
 struct dsi_reg_config {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 72c018e26f47..901d6fd53800 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -14,9 +14,9 @@ static const struct msm_dsi_config apq8064_dsi_cfg = {
 	.reg_cfg = {
 		.num = 3,
 		.regs = {
-			{"vdda", 100000, 100},	/* 1.2 V */
-			{"avdd", 10000, 100},	/* 3.0 V */
-			{"vddio", 100000, 100},	/* 1.8 V */
+			{"vdda", 100000},	/* 1.2 V */
+			{"avdd", 10000},	/* 3.0 V */
+			{"vddio", 100000},	/* 1.8 V */
 		},
 	},
 	.bus_clk_names = dsi_v2_bus_clk_names,
@@ -34,9 +34,9 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
 	.reg_cfg = {
 		.num = 3,
 		.regs = {
-			{"vdd", 150000, 100},	/* 3.0 V */
-			{"vdda", 100000, 100},	/* 1.2 V */
-			{"vddio", 100000, 100},	/* 1.8 V */
+			{"vdd", 150000},	/* 3.0 V */
+			{"vdda", 100000},	/* 1.2 V */
+			{"vddio", 100000},	/* 1.8 V */
 		},
 	},
 	.bus_clk_names = dsi_6g_bus_clk_names,
@@ -54,8 +54,8 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.reg_cfg = {
 		.num = 2,
 		.regs = {
-			{"vdda", 100000, 100},	/* 1.2 V */
-			{"vddio", 100000, 100},	/* 1.8 V */
+			{"vdda", 100000},	/* 1.2 V */
+			{"vddio", 100000},	/* 1.8 V */
 		},
 	},
 	.bus_clk_names = dsi_8916_bus_clk_names,
@@ -73,8 +73,8 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
 	.reg_cfg = {
 		.num = 2,
 		.regs = {
-			{"vdda", 100000, 100},	/* 1.2 V */
-			{"vddio", 100000, 100},	/* 1.8 V */
+			{"vdda", 100000},	/* 1.2 V */
+			{"vddio", 100000},	/* 1.8 V */
 		},
 	},
 	.bus_clk_names = dsi_8976_bus_clk_names,
@@ -88,12 +88,12 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
 	.reg_cfg = {
 		.num = 6,
 		.regs = {
-			{"vdda", 100000, 100},	/* 1.25 V */
-			{"vddio", 100000, 100},	/* 1.8 V */
-			{"vcca", 10000, 100},	/* 1.0 V */
-			{"vdd", 100000, 100},	/* 1.8 V */
-			{"lab_reg", -1, -1},
-			{"ibb_reg", -1, -1},
+			{"vdda", 100000},	/* 1.25 V */
+			{"vddio", 100000},	/* 1.8 V */
+			{"vcca", 10000},	/* 1.0 V */
+			{"vdd", 100000},	/* 1.8 V */
+			{"lab_reg", -1},
+			{"ibb_reg", -1},
 		},
 	},
 	.bus_clk_names = dsi_6g_bus_clk_names,
@@ -111,9 +111,9 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.reg_cfg = {
 		.num = 3,
 		.regs = {
-			{"vdda", 18160, 1 },	/* 1.25 V */
-			{"vcca", 17000, 32 },	/* 0.925 V */
-			{"vddio", 100000, 100 },/* 1.8 V */
+			{"vdda", 18160},	/* 1.25 V */
+			{"vcca", 17000},	/* 0.925 V */
+			{"vddio", 100000},/* 1.8 V */
 		},
 	},
 	.bus_clk_names = dsi_8996_bus_clk_names,
@@ -131,8 +131,8 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
 	.reg_cfg = {
 		.num = 2,
 		.regs = {
-			{"vdd", 367000, 16 },	/* 0.9 V */
-			{"vdda", 62800, 2 },	/* 1.2 V */
+			{"vdd", 367000},	/* 0.9 V */
+			{"vdda", 62800},	/* 1.2 V */
 		},
 	},
 	.bus_clk_names = dsi_msm8998_bus_clk_names,
@@ -150,7 +150,7 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdda", 12560, 4 },	/* 1.2 V */
+			{"vdda", 12560},	/* 1.2 V */
 		},
 	},
 	.bus_clk_names = dsi_sdm660_bus_clk_names,
@@ -172,7 +172,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdda", 21800, 4 },	/* 1.2 V */
+			{"vdda", 21800},	/* 1.2 V */
 		},
 	},
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
@@ -186,7 +186,7 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdda", 21800, 4 },	/* 1.2 V */
+			{"vdda", 21800},	/* 1.2 V */
 		},
 	},
 	.bus_clk_names = dsi_sc7180_bus_clk_names,
@@ -204,7 +204,7 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdda", 8350, 0 },	/* 1.2 V */
+			{"vdda", 8350},	/* 1.2 V */
 		},
 	},
 	.bus_clk_names = dsi_sc7280_bus_clk_names,
@@ -222,7 +222,7 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdda", 21800, 4 },	/* 1.2 V */
+			{"vdda", 21800},	/* 1.2 V */
 		},
 	},
 	.bus_clk_names = dsi_qcm2290_bus_clk_names,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a95d5df52653..04265ad2fbef 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -259,15 +259,7 @@ static inline struct msm_dsi_host *to_msm_dsi_host(struct mipi_dsi_host *host)
 static void dsi_host_regulator_disable(struct msm_dsi_host *msm_host)
 {
 	struct regulator_bulk_data *s = msm_host->supplies;
-	const struct dsi_reg_entry *regs = msm_host->cfg_hnd->cfg->reg_cfg.regs;
 	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
-	int i;
-
-	DBG("");
-	for (i = num - 1; i >= 0; i--)
-		if (regs[i].disable_load >= 0)
-			regulator_set_load(s[i].consumer,
-					   regs[i].disable_load);
 
 	regulator_bulk_disable(num, s);
 }
@@ -275,35 +267,9 @@ static void dsi_host_regulator_disable(struct msm_dsi_host *msm_host)
 static int dsi_host_regulator_enable(struct msm_dsi_host *msm_host)
 {
 	struct regulator_bulk_data *s = msm_host->supplies;
-	const struct dsi_reg_entry *regs = msm_host->cfg_hnd->cfg->reg_cfg.regs;
 	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
-	int ret, i;
-
-	DBG("");
-	for (i = 0; i < num; i++) {
-		if (regs[i].enable_load >= 0) {
-			ret = regulator_set_load(s[i].consumer,
-						 regs[i].enable_load);
-			if (ret < 0) {
-				pr_err("regulator %d set op mode failed, %d\n",
-					i, ret);
-				goto fail;
-			}
-		}
-	}
-
-	ret = regulator_bulk_enable(num, s);
-	if (ret < 0) {
-		pr_err("regulator enable failed, %d\n", ret);
-		goto fail;
-	}
 
-	return 0;
-
-fail:
-	for (i--; i >= 0; i--)
-		regulator_set_load(s[i].consumer, regs[i].disable_load);
-	return ret;
+	return regulator_bulk_enable(num, s);
 }
 
 static int dsi_regulator_init(struct msm_dsi_host *msm_host)
@@ -323,6 +289,15 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
 		return ret;
 	}
 
+	for (i = 0; i < num; i++) {
+		if (regs[i].enable_load >= 0) {
+			ret = regulator_set_load(s[i].consumer,
+						 regs[i].enable_load);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index a39de3bdc7fa..330c0c4e7f9d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -529,20 +529,22 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
 		return ret;
 	}
 
+	for (i = 0; i < num; i++) {
+		if (regs[i].enable_load >= 0) {
+			ret = regulator_set_load(s[i].consumer,
+							regs[i].enable_load);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	return 0;
 }
 
 static void dsi_phy_regulator_disable(struct msm_dsi_phy *phy)
 {
 	struct regulator_bulk_data *s = phy->supplies;
-	const struct dsi_reg_entry *regs = phy->cfg->reg_cfg.regs;
 	int num = phy->cfg->reg_cfg.num;
-	int i;
-
-	DBG("");
-	for (i = num - 1; i >= 0; i--)
-		if (regs[i].disable_load >= 0)
-			regulator_set_load(s[i].consumer, regs[i].disable_load);
 
 	regulator_bulk_disable(num, s);
 }
@@ -550,37 +552,9 @@ static void dsi_phy_regulator_disable(struct msm_dsi_phy *phy)
 static int dsi_phy_regulator_enable(struct msm_dsi_phy *phy)
 {
 	struct regulator_bulk_data *s = phy->supplies;
-	const struct dsi_reg_entry *regs = phy->cfg->reg_cfg.regs;
-	struct device *dev = &phy->pdev->dev;
 	int num = phy->cfg->reg_cfg.num;
-	int ret, i;
 
-	DBG("");
-	for (i = 0; i < num; i++) {
-		if (regs[i].enable_load >= 0) {
-			ret = regulator_set_load(s[i].consumer,
-							regs[i].enable_load);
-			if (ret < 0) {
-				DRM_DEV_ERROR(dev,
-					"regulator %d set op mode failed, %d\n",
-					i, ret);
-				goto fail;
-			}
-		}
-	}
-
-	ret = regulator_bulk_enable(num, s);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev, "regulator enable failed, %d\n", ret);
-		goto fail;
-	}
-
-	return 0;
-
-fail:
-	for (i--; i >= 0; i--)
-		regulator_set_load(s[i].consumer, regs[i].disable_load);
-	return ret;
+	return regulator_bulk_enable(num, s);
 }
 
 static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 08b015ea1b1e..6a10a1448051 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -1033,7 +1033,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdds", 36000, 32},
+			{"vdds", 36000},
 		},
 	},
 	.ops = {
@@ -1055,7 +1055,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdds", 36000, 32},
+			{"vdds", 36000},
 		},
 	},
 	.ops = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 8199c53567f4..0f3d4c56c333 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1029,7 +1029,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vcca", 17000, 32},
+			{"vcca", 17000},
 		},
 	},
 	.ops = {
@@ -1050,7 +1050,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vcca", 73400, 32},
+			{"vcca", 73400},
 		},
 	},
 	.ops = {
@@ -1071,7 +1071,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vcca", 17000, 32},
+			{"vcca", 17000},
 		},
 	},
 	.ops = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index ee7c418a1c29..b7c621d94981 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -134,8 +134,8 @@ const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
 	.reg_cfg = {
 		.num = 2,
 		.regs = {
-			{"vddio", 100000, 100},	/* 1.8 V */
-			{"vcca", 10000, 100},	/* 1.0 V */
+			{"vddio", 100000},	/* 1.8 V */
+			{"vcca", 10000},	/* 1.0 V */
 		},
 	},
 	.ops = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 48eab80b548e..6beba387640d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -774,7 +774,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vddio", 100000, 100},
+			{"vddio", 100000},
 		},
 	},
 	.ops = {
@@ -795,7 +795,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vddio", 100000, 100},
+			{"vddio", 100000},
 		},
 	},
 	.ops = {
@@ -816,7 +816,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vddio", 100000, 100},	/* 1.8 V */
+			{"vddio", 100000},	/* 1.8 V */
 		},
 	},
 	.ops = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index fc56cdcc9ad6..2e942b10fffa 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -653,7 +653,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vddio", 100000, 100},	/* 1.8 V */
+			{"vddio", 100000},	/* 1.8 V */
 		},
 	},
 	.ops = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 66ed1919a1db..9c7c49ce1200 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1041,7 +1041,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdds", 36000, 32},
+			{"vdds", 36000},
 		},
 	},
 	.ops = {
@@ -1068,7 +1068,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdds", 36000, 32},
+			{"vdds", 36000},
 		},
 	},
 	.ops = {
@@ -1090,7 +1090,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vdds", 37550, 0},
+			{"vdds", 37550},
 		},
 	},
 	.ops = {
-- 
2.37.1.359.gd136c6c3e2-goog

