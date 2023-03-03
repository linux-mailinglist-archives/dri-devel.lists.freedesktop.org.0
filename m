Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4066A9803
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919C910E610;
	Fri,  3 Mar 2023 12:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B8A10E5D9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:38 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id s20so3418363lfb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0ghkZJxuoI4nufkqUo3DBZdStD+Ge+AxHRUF3oBgXU=;
 b=LMEdlr9IFOMgyZH3nGvnuTAQVdj/kmXaoZwd1X/z1wtT3FutmfxuQTCBkZVhiEiiuM
 u3sqX5yAYMRj5ciOWROcK+Wc2Dol/+nYKNL1qWfYlesGpiPctMGpdrQqLj6KAZ9p2BP9
 +ELQK1j8+qlncpDbbFPSazsJa/aFw1Ct4HkxlMiMLRpUopMet0S1x5Qk7GlRRj/G/VZH
 /k+lt/8WsvsFkUBQOgUInFMYseesSXCAR6JzU+OvhVtPLcBhPbGlHJJvb/58UP2Ss/x1
 we1a5Ryc1tQ/PNM+JuW/cP+PfrPaYjvlUquzfw7VZNqADaMVvdJypq4ADxyQcL1PqWJP
 s51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0ghkZJxuoI4nufkqUo3DBZdStD+Ge+AxHRUF3oBgXU=;
 b=tg4Vve4ZPf3HUkpUolmPu9s8kCAlu9SohNhRog+fusJTS9mVPN+oigbm63eNwOIEVK
 /6m1OgrwOj/pF38QweOHcJ4bni07ranWuxL5zokWMbfX902BrCenqBu0F6I7z7kcGVgU
 Q//F8tg7DhpgpkzLujaopzNwSCtrYP/XtviV5FSWVZC922le/ClnkdGfx4qPg9DgUfvx
 XcUHRbJy+9jvGy/h5FD5EMga3GBeS62yT/1Y4i+kUM0l7umSgH5umMFfKSupEPgGvqL7
 YkKz3dk7kZADMov+oMVz6UuXiUhQXLELnAMlIeSJUnx6W/8UMBH+yZLUkvbpGZcfU97Y
 grjQ==
X-Gm-Message-State: AO0yUKUyNt+tm9teuYQ0X+jrN4aHjtA6rnCZtG/f1QmQrtE4cMF4FTfc
 C0CilWiQMCrW8yKtYRILU0vw9A==
X-Google-Smtp-Source: AK7set+6ImKoM0snv6l/Y3G3x4zF2Tqhr3lhFmxpzbZtq7PUYHfit164+pqMcOwyfF/rkRp4rfgK/Q==
X-Received: by 2002:a19:751a:0:b0:4e1:1bfe:38f7 with SMTP id
 y26-20020a19751a000000b004e11bfe38f7mr440969lfe.27.1677848258093; 
 Fri, 03 Mar 2023 04:57:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 18/30] drm/msm/dpu: rewrite plane's QoS-related functions
 to take dpu_sw_pipe and dpu_format
Date: Fri,  3 Mar 2023 14:57:13 +0200
Message-Id: <20230303125725.3695011-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

Rewrite dpu_plane's QoS related functions to take struct dpu_sw_pipe and
struct dpu_format as arguments rather than fetching them from the
pstate or drm_framebuffer.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 98 +++++++++++------------
 1 file changed, 47 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3fba63fbbd78..aaea7c63d944 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -128,19 +128,18 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
 /**
  * _dpu_plane_calc_bw - calculate bandwidth required for a plane
  * @plane: Pointer to drm plane.
- * @fb:   Pointer to framebuffer associated with the given plane
+ * @fmt: Pointer to source buffer format
  * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated bandwidth in the plane state.
  * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
  * Prefill BW Equation: line src bytes * line_time
  */
 static void _dpu_plane_calc_bw(struct drm_plane *plane,
-	struct drm_framebuffer *fb,
+	const struct dpu_format *fmt,
 	struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
-	const struct dpu_format *fmt = NULL;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	int src_width, src_height, dst_height, fps;
 	u64 plane_prefill_bw;
@@ -152,8 +151,6 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	pstate = to_dpu_plane_state(plane->state);
 	mode = &plane->state->crtc->mode;
 
-	fmt = dpu_get_dpu_format_ext(fb->format->format, fb->modifier);
-
 	src_width = drm_rect_width(&pipe_cfg->src_rect);
 	src_height = drm_rect_height(&pipe_cfg->src_rect);
 	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
@@ -217,25 +214,25 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_sw_pipe_cfg
 /**
  * _dpu_plane_calc_fill_level - calculate fill level of the given source format
  * @plane:		Pointer to drm plane
+ * @pipe:		Pointer to software pipe
  * @fmt:		Pointer to source buffer format
  * @src_width:		width of source buffer
  * Return: fill level corresponding to the source buffer/format or 0 if error
  */
 static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
+		struct dpu_sw_pipe *pipe,
 		const struct dpu_format *fmt, u32 src_width)
 {
 	struct dpu_plane *pdpu;
-	struct dpu_plane_state *pstate;
 	u32 fixed_buff_size;
 	u32 total_fl;
 
-	if (!fmt || !plane->state || !src_width || !fmt->bpp) {
+	if (!fmt || !pipe || !src_width || !fmt->bpp) {
 		DPU_ERROR("invalid arguments\n");
 		return 0;
 	}
 
 	pdpu = to_dpu_plane(plane);
-	pstate = to_dpu_plane_state(plane->state);
 	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
 
 	/* FIXME: in multirect case account for the src_width of all the planes */
@@ -251,7 +248,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 				((src_width + 32) * fmt->bpp);
 		}
 	} else {
-		if (pstate->pipe.multirect_mode == DPU_SSPP_MULTIRECT_PARALLEL) {
+		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_PARALLEL) {
 			total_fl = (fixed_buff_size / 2) * 2 /
 				((src_width + 32) * fmt->bpp);
 		} else {
@@ -261,7 +258,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 	}
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s w:%u fl:%u\n",
-			pdpu->pipe - SSPP_VIG0,
+			pipe->sspp->idx - SSPP_VIG0,
 			(char *)&fmt->base.pixel_format,
 			src_width, total_fl);
 
@@ -271,25 +268,22 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 /**
  * _dpu_plane_set_qos_lut - set QoS LUT of the given plane
  * @plane:		Pointer to drm plane
- * @fb:			Pointer to framebuffer associated with the given plane
+ * @pipe:		Pointer to software pipe
+ * @fmt:		Pointer to source buffer format
  * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
-		struct drm_framebuffer *fb, struct dpu_sw_pipe_cfg *pipe_cfg)
+		struct dpu_sw_pipe *pipe,
+		const struct dpu_format *fmt, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
-	const struct dpu_format *fmt = NULL;
 	u64 qos_lut;
 	u32 total_fl = 0, lut_usage;
 
 	if (!pdpu->is_rt_pipe) {
 		lut_usage = DPU_QOS_LUT_USAGE_NRT;
 	} else {
-		fmt = dpu_get_dpu_format_ext(
-				fb->format->format,
-				fb->modifier);
-		total_fl = _dpu_plane_calc_fill_level(plane, fmt,
+		total_fl = _dpu_plane_calc_fill_level(plane, pipe, fmt,
 				drm_rect_width(&pipe_cfg->src_rect));
 
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
@@ -301,7 +295,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 	qos_lut = _dpu_hw_get_qos_lut(
 			&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
 
-	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,
+	trace_dpu_perf_set_qos_luts(pipe->sspp->idx - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
 			pdpu->is_rt_pipe, total_fl, qos_lut, lut_usage);
 
@@ -310,20 +304,20 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, qos_lut);
 
-	pstate->pipe.sspp->ops.setup_creq_lut(pstate->pipe.sspp, qos_lut);
+	pipe->sspp->ops.setup_creq_lut(pipe->sspp, qos_lut);
 }
 
 /**
  * _dpu_plane_set_danger_lut - set danger/safe LUT of the given plane
  * @plane:		Pointer to drm plane
- * @fb:			Pointer to framebuffer associated with the given plane
+ * @pipe:		Pointer to software pipe
+ * @fmt:		Pointer to source buffer format
  */
 static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
-		struct drm_framebuffer *fb)
+		struct dpu_sw_pipe *pipe,
+		const struct dpu_format *fmt)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
-	const struct dpu_format *fmt = NULL;
 	u32 danger_lut, safe_lut;
 
 	if (!pdpu->is_rt_pipe) {
@@ -332,10 +326,6 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		safe_lut = pdpu->catalog->perf->safe_lut_tbl
 				[DPU_QOS_LUT_USAGE_NRT];
 	} else {
-		fmt = dpu_get_dpu_format_ext(
-				fb->format->format,
-				fb->modifier);
-
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt)) {
 			danger_lut = pdpu->catalog->perf->danger_lut_tbl
 					[DPU_QOS_LUT_USAGE_LINEAR];
@@ -362,29 +352,30 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		danger_lut,
 		safe_lut);
 
-	pstate->pipe.sspp->ops.setup_danger_safe_lut(pstate->pipe.sspp,
+	pipe->sspp->ops.setup_danger_safe_lut(pipe->sspp,
 			danger_lut, safe_lut);
 }
 
 /**
  * _dpu_plane_set_qos_ctrl - set QoS control of the given plane
  * @plane:		Pointer to drm plane
+ * @pipe:		Pointer to software pipe
  * @enable:		true to enable QoS control
  * @flags:		QoS control mode (enum dpu_plane_qos)
  */
 static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
+	struct dpu_sw_pipe *pipe,
 	bool enable, u32 flags)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pstate->pipe.sspp->cap->sblk->creq_vblank;
+		pipe_qos_cfg.creq_vblank = pipe->sspp->cap->sblk->creq_vblank;
 		pipe_qos_cfg.danger_vblank =
-				pstate->pipe.sspp->cap->sblk->danger_vblank;
+				pipe->sspp->cap->sblk->danger_vblank;
 		pipe_qos_cfg.vblank_en = enable;
 	}
 
@@ -410,33 +401,34 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
-	pstate->pipe.sspp->ops.setup_qos_ctrl(pstate->pipe.sspp,
+	pipe->sspp->ops.setup_qos_ctrl(pipe->sspp,
 			&pipe_qos_cfg);
 }
 
 /**
  * _dpu_plane_set_ot_limit - set OT limit for the given plane
  * @plane:		Pointer to drm plane
+ * @pipe:		Pointer to software pipe
  * @crtc:		Pointer to drm crtc
  * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
+		struct dpu_sw_pipe *pipe,
 		struct drm_crtc *crtc, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_vbif_set_ot_params ot_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	memset(&ot_params, 0, sizeof(ot_params));
-	ot_params.xin_id = pstate->pipe.sspp->cap->xin_id;
-	ot_params.num = pstate->pipe.sspp->idx - SSPP_NONE;
+	ot_params.xin_id = pipe->sspp->cap->xin_id;
+	ot_params.num = pipe->sspp->idx - SSPP_NONE;
 	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
 	ot_params.vbif_idx = VBIF_RT;
-	ot_params.clk_ctrl = pstate->pipe.sspp->cap->clk_ctrl;
+	ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
 	ot_params.rd = true;
 
 	dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
@@ -445,19 +437,20 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 /**
  * _dpu_plane_set_qos_remap - set vbif QoS for the given plane
  * @plane:		Pointer to drm plane
+ * @pipe:		Pointer to software pipe
  */
-static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
+static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
+		struct dpu_sw_pipe *pipe)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_vbif_set_qos_params qos_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	memset(&qos_params, 0, sizeof(qos_params));
 	qos_params.vbif_idx = VBIF_RT;
-	qos_params.clk_ctrl = pstate->pipe.sspp->cap->clk_ctrl;
-	qos_params.xin_id = pstate->pipe.sspp->cap->xin_id;
-	qos_params.num = pstate->pipe.sspp->idx - SSPP_VIG0;
+	qos_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
+	qos_params.xin_id = pipe->sspp->cap->xin_id;
+	qos_params.num = pipe->sspp->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
 	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
@@ -1144,7 +1137,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
-	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
+	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
@@ -1213,20 +1206,20 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		}
 	}
 
-	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
-	_dpu_plane_set_danger_lut(plane, fb);
+	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pipe_cfg);
+	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
-		_dpu_plane_set_qos_ctrl(plane, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
+		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
+		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pipe_cfg);
 	}
 
 	if (pstate->needs_qos_remap) {
 		pstate->needs_qos_remap = false;
-		_dpu_plane_set_qos_remap(plane);
+		_dpu_plane_set_qos_remap(plane, pipe);
 	}
 
-	_dpu_plane_calc_bw(plane, fb, &pipe_cfg);
+	_dpu_plane_calc_bw(plane, fmt, &pipe_cfg);
 
 	_dpu_plane_calc_clk(plane, &pipe_cfg);
 }
@@ -1263,11 +1256,13 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 static void dpu_plane_destroy(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
+	struct dpu_plane_state *pstate;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
 	if (pdpu) {
-		_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
+		pstate = to_dpu_plane_state(plane->state);
+		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
 		mutex_destroy(&pdpu->lock);
 
@@ -1396,13 +1391,14 @@ static void dpu_plane_reset(struct drm_plane *plane)
 void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!pdpu->is_rt_pipe)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	_dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
+	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 #endif
-- 
2.39.2

