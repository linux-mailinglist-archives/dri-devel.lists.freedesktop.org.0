Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D03BB4C8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FDD89B3C;
	Mon,  5 Jul 2021 01:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCE589B29
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a18so29464522lfs.10
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QokhGLmFQPZpx/J6MEfssTkOAzANaFx0qdKj6cdWDvM=;
 b=Sr/DAAeyv4qMrNA+4C5Gtl2g01djbEmadm5eT7yrRbDhhk5OpewYF+IPNLbo3Jr42E
 eAa+uhatl0eXOB/Bflf7AbeflxohX384BuKuL295ljCfInMtt/JKVRKG16XzkQa+4zdh
 Xwnyu5b4Yt0VXxf7GZOTzer6VuULxSIHgNva0GRSmvc6po0j1NEV7KYEdc2fuuoxYh/2
 Ym3IosHPd1m0rW0iA8ZnOzM+YnZhh5arCWXjF7ng0pqkI78B0jZiVX0Pb32z8OwD7J0L
 76BWY/B1cuaVdjrfXFdTvKpE5kjiCHwLWLirIRcMSeZFgEo8eCZ/PqiB4XbrY+4bTdOw
 FPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QokhGLmFQPZpx/J6MEfssTkOAzANaFx0qdKj6cdWDvM=;
 b=dLahYqDx4l4gP7dQathhWhbZZmNqyob/jobdSbbaXLiSS7FRqqxhlvisvv0n9GkbeY
 DeRyqaSaMGV55k/wplFP5kWW6Najav0gpY9TX5MdFY8DjHP1xf4nv7x/cxnmVTwhIjDa
 /dx6TYF0Ifu/EFVpDLh7BFomaTvpCyKCQl0MGNVMrE7H+Sraa4C7RAAXCmf+h6XokFKL
 +NRBS3+gPcdWrOujRyACcdavzqt/MvDN6WP7aDIufk98178Ej+u3tUbeOT5mN5NwI1DV
 4nkinF5rluCC7OdmqQG8hfbcjc9jx8+SLGvx1uXQiUwZBncg5ETP3PG0xjiK7teek0fF
 6kqA==
X-Gm-Message-State: AOAM530asPpYqlhMCBONAt84ytDetER2YuD4hF71XjJqjE/Y3GluCnlW
 Le4zHLT7fYgHZ57Sb6MohVAIWQ==
X-Google-Smtp-Source: ABdhPJy32cWoo3jO2aSjvn9ExnT+ptTkPG05m3+x3lgj9x2/qBFPy6IznUtULh3HiO0OqTIlqVxu2w==
X-Received: by 2002:a19:a41a:: with SMTP id q26mr8393784lfc.81.1625448311269; 
 Sun, 04 Jul 2021 18:25:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 06/22] drm/msm/dpu: move dpu_hw_pipe_cfg out of struct
 dpu_plane
Date: Mon,  5 Jul 2021 04:20:59 +0300
Message-Id: <20210705012115.4179824-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct dpu_hw_pipe_cfg represents an interim state during atomic
update/color fill, so move it out of struct dpu_plane.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 97 ++++++++++++-----------
 1 file changed, 52 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 8095afdb4385..cd1a1e333f7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -103,7 +103,6 @@ struct dpu_plane {
 	uint32_t features;      /* capabilities from catalog */
 
 	struct dpu_hw_pipe *pipe_hw;
-	struct dpu_hw_pipe_cfg pipe_cfg;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -140,14 +139,15 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
  * _dpu_plane_calc_bw - calculate bandwidth required for a plane
  * @plane: Pointer to drm plane.
  * @fb:   Pointer to framebuffer associated with the given plane
+ * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated bandwidth in the plane state.
  * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
  * Prefill BW Equation: line src bytes * line_time
  */
 static void _dpu_plane_calc_bw(struct drm_plane *plane,
-	struct drm_framebuffer *fb)
+	struct drm_framebuffer *fb,
+	struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
 	const struct dpu_format *fmt = NULL;
@@ -164,9 +164,9 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 
 	fmt = dpu_get_dpu_format_ext(fb->format->format, fb->modifier);
 
-	src_width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
-	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
-	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
+	src_width = drm_rect_width(&pipe_cfg->src_rect);
+	src_height = drm_rect_height(&pipe_cfg->src_rect);
+	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
 	fps = drm_mode_vrefresh(mode);
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
@@ -197,12 +197,12 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 /**
  * _dpu_plane_calc_clk - calculate clock required for a plane
  * @plane: Pointer to drm plane.
+ * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
-static void _dpu_plane_calc_clk(struct drm_plane *plane)
+static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
 	int dst_width, src_height, dst_height, fps;
@@ -210,9 +210,9 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane)
 	pstate = to_dpu_plane_state(plane->state);
 	mode = &plane->state->crtc->mode;
 
-	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
-	dst_width = drm_rect_width(&pdpu->pipe_cfg.dst_rect);
-	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
+	src_height = drm_rect_height(&pipe_cfg->src_rect);
+	dst_width = drm_rect_width(&pipe_cfg->dst_rect);
+	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
 	fps = drm_mode_vrefresh(mode);
 
 	pstate->plane_clk =
@@ -307,9 +307,10 @@ static u64 _dpu_plane_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
  * _dpu_plane_set_qos_lut - set QoS LUT of the given plane
  * @plane:		Pointer to drm plane
  * @fb:			Pointer to framebuffer associated with the given plane
+ * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
-		struct drm_framebuffer *fb)
+		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct dpu_format *fmt = NULL;
@@ -323,7 +324,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 				fb->format->format,
 				fb->modifier);
 		total_fl = _dpu_plane_calc_fill_level(plane, fmt,
-				drm_rect_width(&pdpu->pipe_cfg.src_rect));
+				drm_rect_width(&pipe_cfg->src_rect));
 
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
 			lut_usage = DPU_QOS_LUT_USAGE_LINEAR;
@@ -449,9 +450,10 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
  * _dpu_plane_set_ot_limit - set OT limit for the given plane
  * @plane:		Pointer to drm plane
  * @crtc:		Pointer to drm crtc
+ * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
-		struct drm_crtc *crtc)
+		struct drm_crtc *crtc, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
@@ -460,8 +462,8 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	memset(&ot_params, 0, sizeof(ot_params));
 	ot_params.xin_id = pdpu->pipe_hw->cap->xin_id;
 	ot_params.num = pdpu->pipe_hw->idx - SSPP_NONE;
-	ot_params.width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
-	ot_params.height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
+	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
+	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
 	ot_params.vbif_idx = VBIF_RT;
@@ -639,17 +641,18 @@ static void _dpu_plane_setup_csc(struct dpu_plane *pdpu)
 
 static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 		struct dpu_plane_state *pstate,
-		const struct dpu_format *fmt, bool color_fill)
+		const struct dpu_format *fmt, bool color_fill,
+		struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
 
 	/* don't chroma subsample if decimating */
 	/* update scaler. calculate default config for QSEED3 */
 	_dpu_plane_setup_scaler3(pdpu, pstate,
-			drm_rect_width(&pdpu->pipe_cfg.src_rect),
-			drm_rect_height(&pdpu->pipe_cfg.src_rect),
-			drm_rect_width(&pdpu->pipe_cfg.dst_rect),
-			drm_rect_height(&pdpu->pipe_cfg.dst_rect),
+			drm_rect_width(&pipe_cfg->src_rect),
+			drm_rect_height(&pipe_cfg->src_rect),
+			drm_rect_width(&pipe_cfg->dst_rect),
+			drm_rect_height(&pipe_cfg->dst_rect),
 			&pstate->scaler3_cfg, fmt,
 			info->hsub, info->vsub);
 }
@@ -667,6 +670,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
+	struct dpu_hw_pipe_cfg pipe_cfg;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -683,13 +687,15 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 				pstate->multirect_index);
 
 		/* override scaler/decimation if solid fill */
-		pdpu->pipe_cfg.src_rect.x1 = 0;
-		pdpu->pipe_cfg.src_rect.y1 = 0;
-		pdpu->pipe_cfg.src_rect.x2 =
-			drm_rect_width(&pdpu->pipe_cfg.dst_rect);
-		pdpu->pipe_cfg.src_rect.y2 =
-			drm_rect_height(&pdpu->pipe_cfg.dst_rect);
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true);
+		pipe_cfg.dst_rect = pstate->base.dst;
+
+		pipe_cfg.src_rect.x1 = 0;
+		pipe_cfg.src_rect.y1 = 0;
+		pipe_cfg.src_rect.x2 =
+			drm_rect_width(&pipe_cfg.dst_rect);
+		pipe_cfg.src_rect.y2 =
+			drm_rect_height(&pipe_cfg.dst_rect);
+		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 
 		if (pdpu->pipe_hw->ops.setup_format)
 			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
@@ -698,7 +704,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 
 		if (pdpu->pipe_hw->ops.setup_rects)
 			pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
-					&pdpu->pipe_cfg,
+					&pipe_cfg,
 					pstate->multirect_index);
 
 		if (pdpu->pipe_hw->ops.setup_pe)
@@ -708,7 +714,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		if (pdpu->pipe_hw->ops.setup_scaler &&
 				pstate->multirect_index != DPU_SSPP_RECT_1)
 			pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-					&pdpu->pipe_cfg, &pstate->pixel_ext,
+					&pipe_cfg, &pstate->pixel_ext,
 					&pstate->scaler3_cfg);
 	}
 
@@ -1070,10 +1076,11 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe, update_qos_remap;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
+	struct dpu_hw_pipe_cfg pipe_cfg;
 
-	memset(&(pdpu->pipe_cfg), 0, sizeof(struct dpu_hw_pipe_cfg));
+	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
-	_dpu_plane_set_scanout(plane, pstate, &pdpu->pipe_cfg, fb);
+	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
 
 	pstate->pending = true;
 
@@ -1085,17 +1092,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
 
-	pdpu->pipe_cfg.src_rect = state->src;
+	pipe_cfg.src_rect = state->src;
 
 	/* state->src is 16.16, src_rect is not */
-	pdpu->pipe_cfg.src_rect.x1 >>= 16;
-	pdpu->pipe_cfg.src_rect.x2 >>= 16;
-	pdpu->pipe_cfg.src_rect.y1 >>= 16;
-	pdpu->pipe_cfg.src_rect.y2 >>= 16;
+	pipe_cfg.src_rect.x1 >>= 16;
+	pipe_cfg.src_rect.x2 >>= 16;
+	pipe_cfg.src_rect.y1 >>= 16;
+	pipe_cfg.src_rect.y2 >>= 16;
 
-	pdpu->pipe_cfg.dst_rect = state->dst;
+	pipe_cfg.dst_rect = state->dst;
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false);
+	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
 
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
@@ -1105,7 +1112,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (pdpu->pipe_hw->ops.setup_rects) {
 		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
-				&pdpu->pipe_cfg,
+				&pipe_cfg,
 				pstate->multirect_index);
 	}
 
@@ -1122,7 +1129,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	if (pdpu->pipe_hw->ops.setup_scaler &&
 			pstate->multirect_index != DPU_SSPP_RECT_1)
 		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-				&pdpu->pipe_cfg, &pstate->pixel_ext,
+				&pipe_cfg, &pstate->pixel_ext,
 				&pstate->scaler3_cfg);
 
 	if (pdpu->pipe_hw->ops.setup_multirect)
@@ -1175,12 +1182,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			pdpu->csc_ptr = 0;
 	}
 
-	_dpu_plane_set_qos_lut(plane, fb);
+	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, fb);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, crtc);
+		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
 	}
 
 	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
@@ -1194,9 +1201,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_qos_remap(plane);
 	}
 
-	_dpu_plane_calc_bw(plane, fb);
+	_dpu_plane_calc_bw(plane, fb, &pipe_cfg);
 
-	_dpu_plane_calc_clk(plane);
+	_dpu_plane_calc_clk(plane, &pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
-- 
2.30.2

