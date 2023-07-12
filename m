Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C9751359
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B62010E5E8;
	Wed, 12 Jul 2023 22:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C2310E5E5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so84796e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199906; x=1689804706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xXiotgg0GEwf2bGvLMM/To/LRv6KFOudFNtkJYumEM=;
 b=nuLUm72slarHs/aLS7aizeWSnl4qA5KytxViS0f01nx41XHLtuPziuVbXIUIdYatLZ
 m6szK/Qm/qR6mbcvuCEHgvy9uGZOYqM9PNWHiu4tXueC8YO7Q+o4A3JH7DhnxtywQooG
 8CT74g6UJLGKE2q3JW4kN5ekbjhfc6vp3/paRx/gtUpUwIo80kxMIddswAezE6/volCH
 9iIs9X4eFk4gW9Cd/enp/iZgV0AkHPUd6018UXkyf/qgxlT3/mBgN5xk95q7e5RphFz5
 yZkqsI3g7gvtcrp2VFL2CchSN2DriOdbOVMWFpon5XpShLtMC1xoZnxpMOc2748m6bBP
 iTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199906; x=1689804706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xXiotgg0GEwf2bGvLMM/To/LRv6KFOudFNtkJYumEM=;
 b=WLT0aAoaZuH07oTgPVpoqxJzhgj0EMtp6VpAskRFgazcRB+oRTiJbQaJ+7dKI/Z2HF
 A1kFBoUOboPFbM/1MVysBcKq6UnWPXr2tw0pxa2Nc9Cpe1cCf7mbYCsr6v9hV3PAkqgq
 SGnrhkcKhwNJuI1fehK4AHoFXCKN4OvKh8Hya0unF4U5431xn2MeUvRy1wEYKZ9kQhE3
 BNPSkHjirDJrPlHLCQKDKgli00Fmu7IJovNxvkMaP/hF9YQW8GMF3XSpEOPAUX1owgYa
 BMxvAHCbkq4RNSk3SNrvxT/G90WW1aEIvAKyCc809rcqDtwIWn3nT+Yog9HWPPlrUPdD
 apqw==
X-Gm-Message-State: ABy/qLbpn8WVq5RjIECJZ3Ol9XiRSd/aSbaGng/LlpV4j0GCED+AiC12
 RpzskiTP7Y7nGsLIL2e68Jc6Dw==
X-Google-Smtp-Source: APBJJlH9z4m+l3rXPw6OAbrnWXrV255A64S8yAtmrCqRstmlR28v442StbZ9//nPsMETCmaw6ngikA==
X-Received: by 2002:a05:6512:39c3:b0:4fb:896d:bd70 with SMTP id
 k3-20020a05651239c300b004fb896dbd70mr19543018lfu.46.1689199905994; 
 Wed, 12 Jul 2023 15:11:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 07/11] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
Date: Thu, 13 Jul 2023 01:11:35 +0300
Message-Id: <20230712221139.313729-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify dpu_core_perf code by using only dpu_perf_cfg instead of using
full-featured catalog data.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 73 ++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
 3 files changed, 35 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 3b3c2659297d..27a0312bd140 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -33,11 +33,11 @@ enum dpu_perf_mode {
 
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
- * @kms:  pointer to the dpu_kms
+ * @perf_cfg: performance configuration
  * @crtc: pointer to a crtc
  * Return: returns aggregated BW for all planes in crtc.
  */
-static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
+static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
 		struct drm_crtc *crtc)
 {
 	struct drm_plane *plane;
@@ -53,7 +53,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
 		crtc_plane_bw += pstate->plane_fetch_bw;
 	}
 
-	bw_factor = kms->catalog->perf->bw_inefficiency_factor;
+	bw_factor = perf_cfg->bw_inefficiency_factor;
 	if (bw_factor) {
 		crtc_plane_bw *= bw_factor;
 		do_div(crtc_plane_bw, 100);
@@ -64,12 +64,12 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
 
 /**
  * _dpu_core_perf_calc_clk() - to calculate clock per crtc
- * @kms:  pointer to the dpu_kms
+ * @perf_cfg: performance configuration
  * @crtc: pointer to a crtc
  * @state: pointer to a crtc state
  * Return: returns max clk for all planes in crtc.
  */
-static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
+static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
 		struct drm_crtc *crtc, struct drm_crtc_state *state)
 {
 	struct drm_plane *plane;
@@ -90,7 +90,7 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
 		crtc_clk = max(pstate->plane_clk, crtc_clk);
 	}
 
-	clk_factor = kms->catalog->perf->clk_inefficiency_factor;
+	clk_factor = perf_cfg->clk_inefficiency_factor;
 	if (clk_factor) {
 		crtc_clk *= clk_factor;
 		do_div(crtc_clk, 100);
@@ -106,30 +106,32 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 	return to_dpu_kms(priv->kms);
 }
 
-static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
-		struct drm_crtc *crtc,
-		struct drm_crtc_state *state,
-		struct dpu_core_perf_params *perf)
+static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
+				     struct drm_crtc *crtc,
+				     struct drm_crtc_state *state,
+				     struct dpu_core_perf_params *perf)
 {
-	if (!kms || !kms->catalog || !crtc || !state || !perf) {
+	const struct dpu_perf_cfg *perf_cfg = core_perf->perf_cfg;
+
+	if (!perf_cfg || !crtc || !state || !perf) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
 
 	memset(perf, 0, sizeof(struct dpu_core_perf_params));
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
 		perf->bw_ctl = 0;
 		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
-	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = kms->perf.fix_core_ab_vote;
-		perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
-		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
+	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
+		perf->bw_ctl = core_perf->fix_core_ab_vote;
+		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
+		perf->core_clk_rate = core_perf->fix_core_clk_rate;
 	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-		perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
+		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
+		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 	}
 
 	DRM_DEBUG_ATOMIC(
@@ -154,10 +156,6 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid parameters\n");
-		return 0;
-	}
 
 	/* we only need bandwidth check on real-time clients (interfaces) */
 	if (dpu_crtc_get_client_type(crtc) == NRT_CLIENT)
@@ -166,7 +164,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	dpu_cstate = to_dpu_crtc_state(state);
 
 	/* obtain new values */
-	_dpu_core_perf_calc_crtc(kms, crtc, state, &dpu_cstate->new_perf);
+	_dpu_core_perf_calc_crtc(&kms->perf, crtc, state, &dpu_cstate->new_perf);
 
 	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
 	curr_client_type = dpu_crtc_get_client_type(crtc);
@@ -189,7 +187,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
 		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->catalog->perf->max_bw_high;
+		threshold = kms->perf.perf_cfg->max_bw_high;
 
 		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
@@ -270,11 +268,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid kms\n");
-		return;
-	}
-
 	dpu_crtc = to_dpu_crtc(crtc);
 
 	if (atomic_dec_return(&kms->bandwidth_ref) > 0)
@@ -331,10 +324,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid kms\n");
-		return -EINVAL;
-	}
 
 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
@@ -466,7 +455,6 @@ static const struct file_operations dpu_core_perf_mode_fops = {
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 {
 	struct dpu_core_perf *perf = &dpu_kms->perf;
-	const struct dpu_mdss_cfg *catalog = perf->catalog;
 	struct dentry *entry;
 
 	entry = debugfs_create_dir("core_perf", parent);
@@ -478,15 +466,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 	debugfs_create_u32("enable_bw_release", 0600, entry,
 			(u32 *)&perf->enable_bw_release);
 	debugfs_create_u32("threshold_low", 0600, entry,
-			(u32 *)&catalog->perf->max_bw_low);
+			(u32 *)&perf->perf_cfg->max_bw_low);
 	debugfs_create_u32("threshold_high", 0600, entry,
-			(u32 *)&catalog->perf->max_bw_high);
+			(u32 *)&perf->perf_cfg->max_bw_high);
 	debugfs_create_u32("min_core_ib", 0600, entry,
-			(u32 *)&catalog->perf->min_core_ib);
+			(u32 *)&perf->perf_cfg->min_core_ib);
 	debugfs_create_u32("min_llcc_ib", 0600, entry,
-			(u32 *)&catalog->perf->min_llcc_ib);
+			(u32 *)&perf->perf_cfg->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0600, entry,
-			(u32 *)&catalog->perf->min_dram_ib);
+			(u32 *)&perf->perf_cfg->min_dram_ib);
 	debugfs_create_file("perf_mode", 0600, entry,
 			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
@@ -509,17 +497,16 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 
 	perf->max_core_clk_rate = 0;
 	perf->core_clk = NULL;
-	perf->catalog = NULL;
 	perf->dev = NULL;
 }
 
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
-		const struct dpu_mdss_cfg *catalog,
+		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk)
 {
 	perf->dev = dev;
-	perf->catalog = catalog;
+	perf->perf_cfg = perf_cfg;
 	perf->core_clk = core_clk;
 
 	perf->max_core_clk_rate = clk_get_rate(core_clk);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index c0097b67f9dd..f4b84e67138c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -38,7 +38,7 @@ struct dpu_core_perf_tune {
  * struct dpu_core_perf - definition of core performance context
  * @dev: Pointer to drm device
  * @debugfs_root: top level debug folder
- * @catalog: Pointer to catalog configuration
+ * @perf_cfg: Platform-specific performance configuration
  * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
@@ -51,7 +51,7 @@ struct dpu_core_perf_tune {
 struct dpu_core_perf {
 	struct drm_device *dev;
 	struct dentry *debugfs_root;
-	const struct dpu_mdss_cfg *catalog;
+	const struct dpu_perf_cfg *perf_cfg;
 	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
@@ -96,12 +96,12 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
  * @dev: Pointer to drm device
- * @catalog: Pointer to catalog
+ * @perf_cfg: Pointer to platform performance configuration
  * @core_clk: pointer to core clock
  */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
-		const struct dpu_mdss_cfg *catalog,
+		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk);
 
 struct dpu_kms;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c1d06e19b237..074c032cd24e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1156,7 +1156,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
+	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
 			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-- 
2.39.2

