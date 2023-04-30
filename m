Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E46F2AD4
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFAF10E0F4;
	Sun, 30 Apr 2023 20:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B53910E093
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:15 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2a8ba5f1d6bso17638231fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888233; x=1685480233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PF2aHIPE8tZRclZre6Lua+tOB92nq8zaKcTEzBkDhyk=;
 b=sHRDzmX1O7nXWxOtfpfaxHOmoEJuIYlddZ31gCcWp8/DbbimSeJyk1FG5qR53r2sNL
 0LkPPNAcYwqqvKwJ4jDDS+x7v3W3u5KWZBwB8WR+0cGoqcVSVi1CIPYsjIRB4fM17EC9
 47Q/1t+HgNeRWFRzC+Vu8iZa/Hwi9Wk7J9u6JPlZE1tAMle0NvLh44hHLPD3v3yWeX+a
 hlelGZhk4GQKTfIeJDYjrelH4VQCBtskCoUuRYz+UnxZ8y0NI22ahfsvtO7rlSCX2tBi
 rF+cd+7Do44pNsrTH8bzuuoUe3fRG274NQnv4x/700aBFW2a8B2eXgMBSnZc0xbsYmGb
 EsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888233; x=1685480233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PF2aHIPE8tZRclZre6Lua+tOB92nq8zaKcTEzBkDhyk=;
 b=aoi0HawPuHtgTs7Xr72ax2S7xsiXYSaGuKJGsOxnxnaHGjaRTWrCMCb3CxOCawrrfz
 knUv4yS/m9giKFGHxmcygsXkda1XbTdOp6ihHTSFWT87rarv9p22cDmc0wn5FpGZaTA4
 OgVprN06a6Ju2l/plRyZUwPf0rulARnt9xOPokNEIvOikg4JwBHpsfwTkVpsRx/IfYOb
 VKb5gn3PCd6IA6u7uHQRuwqxKwubCRfoZELEH79gwMzZVPZLU2/nSPlgMYpbhaHy0bfr
 kFwqDU4ZhxqLm92s7u+Fduw5CXXYr8/1cm/V+zJ0S5E6Do2eMK7ZL+JAPKZjJWOTiOqX
 qMrg==
X-Gm-Message-State: AC+VfDzIxzcti28k4wfCdxkAJ0HK6D2sLnoIjixj/LMVXeDnFd4Y/zEW
 sXBF6NASq50NRijlhfQRYZfUpQ==
X-Google-Smtp-Source: ACHHUZ4qSmNq5mqM9C2mg/cNSl2OjXdMVxhtk0b37K9woem3mvOBa3vL9TWKMIHwkWhg8Xr4zGIyNw==
X-Received: by 2002:a2e:9d8a:0:b0:2a8:ea1e:bdef with SMTP id
 c10-20020a2e9d8a000000b002a8ea1ebdefmr3583079ljj.48.1682888233440; 
 Sun, 30 Apr 2023 13:57:13 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/9] drm/msm/dpu: simplify CDP programming
Date: Sun, 30 Apr 2023 23:57:03 +0300
Message-Id: <20230430205710.3188230-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get rid of intermediatory configuration structure and defines. Pass the
format and the enablement bit directly to the new helper. The
WB_CDP_CNTL register ignores BIT(2), so we can write it for both SSPP
and WB CDP settings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 19 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 17 ++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 14 ++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 21 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 19 +++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 19 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 11 ++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 20 ++++--------------
 8 files changed, 46 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index bac4aa807b4b..120141f1e5c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -140,7 +140,6 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_wb_cfg *wb_cfg;
-	struct dpu_hw_cdp_cfg cdp_cfg;
 
 	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
 		DPU_ERROR("invalid encoder\n");
@@ -162,20 +161,10 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 	if (hw_wb->ops.setup_outformat)
 		hw_wb->ops.setup_outformat(hw_wb, wb_cfg);
 
-	if (hw_wb->ops.setup_cdp) {
-		memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
-
-		cdp_cfg.enable = phys_enc->dpu_kms->catalog->perf->cdp_cfg
-				[DPU_PERF_CDP_USAGE_NRT].wr_enable;
-		cdp_cfg.ubwc_meta_enable =
-				DPU_FORMAT_IS_UBWC(wb_cfg->dest.format);
-		cdp_cfg.tile_amortize_enable =
-				DPU_FORMAT_IS_UBWC(wb_cfg->dest.format) ||
-				DPU_FORMAT_IS_TILE(wb_cfg->dest.format);
-		cdp_cfg.preload_ahead = DPU_WB_CDP_PRELOAD_AHEAD_64;
-
-		hw_wb->ops.setup_cdp(hw_wb, &cdp_cfg);
-	}
+	if (hw_wb->ops.setup_cdp)
+		hw_wb->ops.setup_cdp(hw_wb, wb_cfg->dest.format,
+				     phys_enc->dpu_kms->catalog->perf->cdp_cfg
+				     [DPU_PERF_CDP_USAGE_NRT].wr_enable);
 
 	if (hw_wb->ops.setup_outaddress)
 		hw_wb->ops.setup_outaddress(hw_wb, wb_cfg);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 1bf717290dab..731199030336 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -592,13 +592,13 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
-		struct dpu_hw_cdp_cfg *cfg)
+				  const struct dpu_format *fmt,
+				  bool enable)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	u32 cdp_cntl = 0;
 	u32 cdp_cntl_offset = 0;
 
-	if (!ctx || !cfg)
+	if (!ctx)
 		return;
 
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
@@ -607,16 +607,7 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
 	else
 		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
 
-	if (cfg->enable)
-		cdp_cntl |= BIT(0);
-	if (cfg->ubwc_meta_enable)
-		cdp_cntl |= BIT(1);
-	if (cfg->tile_amortize_enable)
-		cdp_cntl |= BIT(2);
-	if (cfg->preload_ahead == DPU_SSPP_CDP_PRELOAD_AHEAD_64)
-		cdp_cntl |= BIT(3);
-
-	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
+	dpu_setup_cdp(&ctx->hw, cdp_cntl_offset, fmt, enable);
 }
 
 static void _setup_layer_ops(struct dpu_hw_sspp *c,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 7a8d11ba618d..86bf4b2cda77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -177,14 +177,6 @@ struct dpu_hw_pipe_qos_cfg {
 	bool danger_safe_en;
 };
 
-/**
- * enum CDP preload ahead address size
- */
-enum {
-	DPU_SSPP_CDP_PRELOAD_AHEAD_32,
-	DPU_SSPP_CDP_PRELOAD_AHEAD_64
-};
-
 /**
  * struct dpu_hw_pipe_ts_cfg - traffic shaper configuration
  * @size: size to prefill in bytes, or zero to disable
@@ -331,10 +323,12 @@ struct dpu_hw_sspp_ops {
 	/**
 	 * setup_cdp - setup client driven prefetch
 	 * @pipe: Pointer to software pipe context
-	 * @cfg: Pointer to cdp configuration
+	 * @fmt: format used by the sw pipe
+	 * @enable: whether the CDP should be enabled for this pipe
 	 */
 	void (*setup_cdp)(struct dpu_sw_pipe *pipe,
-			  struct dpu_hw_cdp_cfg *cfg);
+			  const struct dpu_format *fmt,
+			  bool enable);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 8062228eada6..95d20b9a3f2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -494,3 +494,24 @@ int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 
 	return 0;
 }
+
+#define CDP_ENABLE		BIT(0)
+#define CDP_UBWC_META_ENABLE	BIT(1)
+#define CDP_TILE_AMORTIZE_ENABLE BIT(2)
+#define CDP_PRELOAD_AHEAD_64	BIT(3)
+
+void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
+		   const struct dpu_format *fmt, bool enable)
+{
+	u32 cdp_cntl = CDP_PRELOAD_AHEAD_64;
+
+	if (enable)
+		cdp_cntl |= CDP_ENABLE;
+	if (DPU_FORMAT_IS_UBWC(fmt))
+		cdp_cntl |= CDP_UBWC_META_ENABLE;
+	if (DPU_FORMAT_IS_UBWC(fmt) ||
+	    DPU_FORMAT_IS_TILE(fmt))
+		cdp_cntl |= CDP_TILE_AMORTIZE_ENABLE;
+
+	DPU_REG_WRITE(c, offset, cdp_cntl);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 27f4c39e35ab..dc6e3b795aef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -305,22 +305,6 @@ struct dpu_drm_scaler_v2 {
 	struct dpu_drm_de_v1 de;
 };
 
-/**
- * struct dpu_hw_cdp_cfg : CDP configuration
- * @enable: true to enable CDP
- * @ubwc_meta_enable: true to enable ubwc metadata preload
- * @tile_amortize_enable: true to enable amortization control for tile format
- * @preload_ahead: number of request to preload ahead
- *	DPU_*_CDP_PRELOAD_AHEAD_32,
- *	DPU_*_CDP_PRELOAD_AHEAD_64
- */
-struct dpu_hw_cdp_cfg {
-	bool enable;
-	bool ubwc_meta_enable;
-	bool tile_amortize_enable;
-	u32 preload_ahead;
-};
-
 u32 *dpu_hw_util_get_log_mask_ptr(void);
 
 void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
@@ -346,6 +330,9 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10);
 
+void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
+		   const struct dpu_format *fmt, bool enable);
+
 u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 		u32 total_fl);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 4834866d72fd..a6de4b82a188 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -164,24 +164,13 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
 }
 
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
-		struct dpu_hw_cdp_cfg *cfg)
+				const struct dpu_format *fmt,
+				bool enable)
 {
-	struct dpu_hw_blk_reg_map *c;
-	u32 cdp_cntl = 0;
-
-	if (!ctx || !cfg)
+	if (!ctx)
 		return;
 
-	c = &ctx->hw;
-
-	if (cfg->enable)
-		cdp_cntl |= BIT(0);
-	if (cfg->ubwc_meta_enable)
-		cdp_cntl |= BIT(1);
-	if (cfg->preload_ahead == DPU_WB_CDP_PRELOAD_AHEAD_64)
-		cdp_cntl |= BIT(3);
-
-	DPU_REG_WRITE(c, WB_CDP_CNTL, cdp_cntl);
+	dpu_setup_cdp(&ctx->hw, WB_CDP_CNTL, fmt, enable);
 }
 
 static void dpu_hw_wb_bind_pingpong_blk(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index e4f85409c624..ab3541856258 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -21,14 +21,6 @@ struct dpu_hw_wb_cfg {
 	struct drm_rect crop;
 };
 
-/**
- * enum CDP preload ahead address size
- */
-enum {
-	DPU_WB_CDP_PRELOAD_AHEAD_32,
-	DPU_WB_CDP_PRELOAD_AHEAD_64
-};
-
 /**
  * struct dpu_hw_wb_qos_cfg : Writeback pipe QoS configuration
  * @danger_lut: LUT for generate danger level based on fill level
@@ -67,7 +59,8 @@ struct dpu_hw_wb_ops {
 			struct dpu_hw_wb_qos_cfg *cfg);
 
 	void (*setup_cdp)(struct dpu_hw_wb *ctx,
-			struct dpu_hw_cdp_cfg *cfg);
+			  const struct dpu_format *fmt,
+			  bool enable);
 
 	void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
 			bool enable, const enum dpu_pingpong pp);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 14b5cfe30611..43d9fbc0c687 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1115,22 +1115,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		/* update format */
 		pipe->sspp->ops.setup_format(pipe, fmt, src_flags);
 
-		if (pipe->sspp->ops.setup_cdp) {
-			struct dpu_hw_cdp_cfg cdp_cfg;
-
-			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
-
-			cdp_cfg.enable = pdpu->catalog->perf->cdp_cfg
-					[DPU_PERF_CDP_USAGE_RT].rd_enable;
-			cdp_cfg.ubwc_meta_enable =
-					DPU_FORMAT_IS_UBWC(fmt);
-			cdp_cfg.tile_amortize_enable =
-					DPU_FORMAT_IS_UBWC(fmt) ||
-					DPU_FORMAT_IS_TILE(fmt);
-			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
-
-			pipe->sspp->ops.setup_cdp(pipe, &cdp_cfg);
-		}
+		if (pipe->sspp->ops.setup_cdp)
+			pipe->sspp->ops.setup_cdp(pipe, fmt,
+						  pdpu->catalog->perf->cdp_cfg
+						  [DPU_PERF_CDP_USAGE_RT].rd_enable);
 	}
 
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
-- 
2.39.2

