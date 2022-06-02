Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6A53BFBF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9AC11348E;
	Thu,  2 Jun 2022 20:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76083113489
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:24:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y32so9538586lfa.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 13:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uklzEXr6Rdx6svJLzaQalDk4LY85NuhCKz5DRddagk4=;
 b=w976L+PCXeIpUsEctVmkDqUkB4Qz9USQ9suBhwTjnyxEXb23WjrY8JSHoiVtbiJVbN
 miG+2RN/1Aym8Fl7J+h7jUWhTyYvVjI+H5Clc4y1ljqhF5VEP5VjjIAlMt/iqL2YUBN9
 d1ZeSso3mu8MCGIh4za/Qo43BUWJQr2yAt+CrCU53KG7jqlV24u/i6n2NyWiHJPkUzp+
 Bf97cVcqzKTaKTCxDFU/hOp8b54yl+aCqxTwYqe92d7/wveXX7O7mEQdkyQcN0vN2EfB
 lYkCPkX84T7p47jKcfdkRM4JROjUsT4gXoAfX/Y7zriKOsuHp8sQkXYo8jNut9yMVuMJ
 Xy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uklzEXr6Rdx6svJLzaQalDk4LY85NuhCKz5DRddagk4=;
 b=fU4myJshOZOdgy9DVRlQ+0MsUsiQwRNeEyS5oKbQfEavixHV+Kb99MeSfZuekWqhML
 EyofmWuhLYJe7HeNJ3mbw9UjsRS4nHQxnrl8Ni9PsSSUDEaZf6GY0OhAs7Z9MaxXxDh6
 Mvt2sShqAhRmNDpPkwbm+LOf5OnE4j3nY5929G6yquJiHaNV7SkWpD+rOaho+j0Yu55U
 /MZg4l4UEkk4QjhtC2sIweoxHlzG5klnKhJlm4liJawmvW2vKZin/UBfq6BjuQJYVjM/
 PNW7m69shvntwjUANh2/fClPwUaHNz1QQAj9WRTXiGtbaqxK8EPdQZC72/Wft7Awp32B
 hzPA==
X-Gm-Message-State: AOAM53346FPfjbV/+sb3WSLvfQZFs4i5K7aIox2uzUhH6vVOUImIs6OY
 O5SF7SS4kqLCy9MVHoSoDjvxkg==
X-Google-Smtp-Source: ABdhPJz/gq6bdyz+vLkwMXOId36hWMuJAU+NyaSy2fakoZag2F947DKMoWJZhGJAKFkYwa/zBWp/wQ==
X-Received: by 2002:a19:7907:0:b0:479:165c:3842 with SMTP id
 u7-20020a197907000000b00479165c3842mr1317967lfc.552.1654201494968; 
 Thu, 02 Jun 2022 13:24:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.241])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a056512369900b0047255d21114sm1205718lfs.67.2022.06.02.13.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 13:24:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 4/7] drm/msm/dpu: change catalog->perf to be a const pointer
Date: Thu,  2 Jun 2022 23:24:44 +0300
Message-Id: <20220602202447.1755115-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
References: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change dpu_mdss_cfg::perf to be a const pointer rather than embedding
the dpu_perf_cfg struct into the struct dpu_mdss_cfg.

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 20 +++++++++----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 10 +++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 16 +++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 18 ++++++++---------
 5 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index a7492dd6ed65..31767d0f7353 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -53,7 +53,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
 		crtc_plane_bw += pstate->plane_fetch_bw;
 	}
 
-	bw_factor = kms->catalog->perf.bw_inefficiency_factor;
+	bw_factor = kms->catalog->perf->bw_inefficiency_factor;
 	if (bw_factor) {
 		crtc_plane_bw *= bw_factor;
 		do_div(crtc_plane_bw, 100);
@@ -90,7 +90,7 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
 		crtc_clk = max(pstate->plane_clk, crtc_clk);
 	}
 
-	clk_factor = kms->catalog->perf.clk_inefficiency_factor;
+	clk_factor = kms->catalog->perf->clk_inefficiency_factor;
 	if (clk_factor) {
 		crtc_clk *= clk_factor;
 		do_div(crtc_clk, 100);
@@ -128,7 +128,7 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
 	} else {
 		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-		perf->max_per_pipe_ib = kms->catalog->perf.min_dram_ib;
+		perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
 		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
 	}
 
@@ -189,7 +189,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
 		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->catalog->perf.max_bw_high;
+		threshold = kms->catalog->perf->max_bw_high;
 
 		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
@@ -413,7 +413,7 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		    const char __user *user_buf, size_t count, loff_t *ppos)
 {
 	struct dpu_core_perf *perf = file->private_data;
-	struct dpu_perf_cfg *cfg = &perf->catalog->perf;
+	const struct dpu_perf_cfg *cfg = perf->catalog->perf;
 	u32 perf_mode = 0;
 	int ret;
 
@@ -480,15 +480,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 	debugfs_create_u32("enable_bw_release", 0600, entry,
 			(u32 *)&perf->enable_bw_release);
 	debugfs_create_u32("threshold_low", 0600, entry,
-			(u32 *)&catalog->perf.max_bw_low);
+			(u32 *)&catalog->perf->max_bw_low);
 	debugfs_create_u32("threshold_high", 0600, entry,
-			(u32 *)&catalog->perf.max_bw_high);
+			(u32 *)&catalog->perf->max_bw_high);
 	debugfs_create_u32("min_core_ib", 0600, entry,
-			(u32 *)&catalog->perf.min_core_ib);
+			(u32 *)&catalog->perf->min_core_ib);
 	debugfs_create_u32("min_llcc_ib", 0600, entry,
-			(u32 *)&catalog->perf.min_llcc_ib);
+			(u32 *)&catalog->perf->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0600, entry,
-			(u32 *)&catalog->perf.min_dram_ib);
+			(u32 *)&catalog->perf->min_dram_ib);
 	debugfs_create_file("perf_mode", 0600, entry,
 			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4829d1ce0cf8..1e4a4822fbf4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -104,7 +104,7 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_wb_qos_cfg qos_cfg;
 	struct dpu_mdss_cfg *catalog;
-	struct dpu_qos_lut_tbl *qos_lut_tb;
+	const struct dpu_qos_lut_tbl *qos_lut_tb;
 
 	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
 		DPU_ERROR("invalid parameter(s)\n");
@@ -118,11 +118,11 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 	memset(&qos_cfg, 0, sizeof(struct dpu_hw_wb_qos_cfg));
 	qos_cfg.danger_safe_en = true;
 	qos_cfg.danger_lut =
-		catalog->perf.danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
+		catalog->perf->danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
 
-	qos_cfg.safe_lut = catalog->perf.safe_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
+	qos_cfg.safe_lut = catalog->perf->safe_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
 
-	qos_lut_tb = &catalog->perf.qos_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
+	qos_lut_tb = &catalog->perf->qos_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
 	qos_cfg.creq_lut = _dpu_hw_get_qos_lut(qos_lut_tb, 0);
 
 	if (hw_wb->ops.setup_qos_lut)
@@ -166,7 +166,7 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 	if (hw_wb->ops.setup_cdp) {
 		memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
 
-		cdp_cfg.enable = phys_enc->dpu_kms->catalog->perf.cdp_cfg
+		cdp_cfg.enable = phys_enc->dpu_kms->catalog->perf->cdp_cfg
 				[DPU_PERF_CDP_USAGE_NRT].wr_enable;
 		cdp_cfg.ubwc_meta_enable =
 				DPU_FORMAT_IS_UBWC(wb_cfg->dest.format);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 355c7aa82582..95b3ecc4db60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1750,7 +1750,7 @@ static void msm8998_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(msm8998_vbif),
 		.vbif = msm8998_vbif,
 		.reg_dma_count = 0,
-		.perf = msm8998_perf_data,
+		.perf = &msm8998_perf_data,
 		.mdss_irqs = IRQ_SM8250_MASK,
 	};
 }
@@ -1781,7 +1781,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
-		.perf = sdm845_perf_data,
+		.perf = &sdm845_perf_data,
 		.mdss_irqs = IRQ_SDM845_MASK,
 	};
 }
@@ -1812,7 +1812,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
-		.perf = sc7180_perf_data,
+		.perf = &sc7180_perf_data,
 		.mdss_irqs = IRQ_SC7180_MASK,
 	};
 }
@@ -1845,7 +1845,7 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sm8150_regdma,
-		.perf = sm8150_perf_data,
+		.perf = &sm8150_perf_data,
 		.mdss_irqs = IRQ_SDM845_MASK,
 	};
 }
@@ -1876,7 +1876,7 @@ static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sm8150_regdma,
-		.perf = sc8180x_perf_data,
+		.perf = &sc8180x_perf_data,
 		.mdss_irqs = IRQ_SC8180X_MASK,
 	};
 }
@@ -1911,7 +1911,7 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.wb = sm8250_wb,
 		.reg_dma_count = 1,
 		.dma_cfg = sm8250_regdma,
-		.perf = sm8250_perf_data,
+		.perf = &sm8250_perf_data,
 		.mdss_irqs = IRQ_SM8250_MASK,
 	};
 }
@@ -1934,7 +1934,7 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.intf = sc7280_intf,
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
-		.perf = sc7280_perf_data,
+		.perf = &sc7280_perf_data,
 		.mdss_irqs = IRQ_SC7280_MASK,
 	};
 }
@@ -1966,7 +1966,7 @@ static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
-		.perf = qcm2290_perf_data,
+		.perf = &qcm2290_perf_data,
 		.mdss_irqs = IRQ_SC7180_MASK,
 	};
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4225f58d8f97..64ed96b2fa3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -868,7 +868,7 @@ struct dpu_mdss_cfg {
 
 	/* Add additional block data structures here */
 
-	struct dpu_perf_cfg perf;
+	const struct dpu_perf_cfg *perf;
 	const struct dpu_format_extended *dma_formats;
 	const struct dpu_format_extended *cursor_formats;
 	const struct dpu_format_extended *vig_formats;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9d2f0364d2c7..d8048b6862f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -160,7 +160,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
 	vfp = mode->vsync_start - mode->vdisplay;
-	hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
+	hw_latency_lines =  dpu_kms->catalog->perf->min_prefill_lines;
 	scale_factor = src_height > dst_height ?
 		mult_frac(src_height, 1, dst_height) : 1;
 
@@ -309,7 +309,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 	}
 
 	qos_lut = _dpu_hw_get_qos_lut(
-			&pdpu->catalog->perf.qos_lut_tbl[lut_usage], total_fl);
+			&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
 
 	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
@@ -336,9 +336,9 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 	u32 danger_lut, safe_lut;
 
 	if (!pdpu->is_rt_pipe) {
-		danger_lut = pdpu->catalog->perf.danger_lut_tbl
+		danger_lut = pdpu->catalog->perf->danger_lut_tbl
 				[DPU_QOS_LUT_USAGE_NRT];
-		safe_lut = pdpu->catalog->perf.safe_lut_tbl
+		safe_lut = pdpu->catalog->perf->safe_lut_tbl
 				[DPU_QOS_LUT_USAGE_NRT];
 	} else {
 		fmt = dpu_get_dpu_format_ext(
@@ -346,14 +346,14 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 				fb->modifier);
 
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt)) {
-			danger_lut = pdpu->catalog->perf.danger_lut_tbl
+			danger_lut = pdpu->catalog->perf->danger_lut_tbl
 					[DPU_QOS_LUT_USAGE_LINEAR];
-			safe_lut = pdpu->catalog->perf.safe_lut_tbl
+			safe_lut = pdpu->catalog->perf->safe_lut_tbl
 					[DPU_QOS_LUT_USAGE_LINEAR];
 		} else {
-			danger_lut = pdpu->catalog->perf.danger_lut_tbl
+			danger_lut = pdpu->catalog->perf->danger_lut_tbl
 					[DPU_QOS_LUT_USAGE_MACROTILE];
-			safe_lut = pdpu->catalog->perf.safe_lut_tbl
+			safe_lut = pdpu->catalog->perf->safe_lut_tbl
 					[DPU_QOS_LUT_USAGE_MACROTILE];
 		}
 	}
@@ -1225,7 +1225,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
 
-			cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
+			cdp_cfg.enable = pdpu->catalog->perf->cdp_cfg
 					[DPU_PERF_CDP_USAGE_RT].rd_enable;
 			cdp_cfg.ubwc_meta_enable =
 					DPU_FORMAT_IS_UBWC(fmt);
-- 
2.35.1

