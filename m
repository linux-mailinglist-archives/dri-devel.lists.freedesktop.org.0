Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E863B3211
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8B86EC2A;
	Thu, 24 Jun 2021 14:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91AD6EC29
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:51 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u13so10832882lfk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvWRCVEBl9/CGNemHPslKAzAaSLA8yJ6l2UCmlJ75Fw=;
 b=jciHK/yZoBV+u1bAMzZDjBSZwXS8n8a5xr8CdEu6kojchi929eItfLVR9RVWf0kn3n
 1TEdk9y/LPa6odng2ARjEr10aXEHynWkiOz1V4LPVQUA0tFZMhR48xkU8EVjmNI7ikIN
 XRzHXjZychon9Jt1WnK7efWvH8MeYrzf0UveH30gulvOTPCl+USaEFHrdSHQBGRZzs8m
 26Pkb7HtIuJezDEr9Ork55Oof3Y70BK6PSO9v5lh6cxO3B3KqqK83FiggaQbwiC0QnRg
 WGTkpfj9dObylAIOTnC0+cUz978yN0OUd6aVdjRbavCMidkC4NSN4WWJrzlH+VSR+E6N
 xaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvWRCVEBl9/CGNemHPslKAzAaSLA8yJ6l2UCmlJ75Fw=;
 b=OdorCNTdYVcbajGoy3NaSs9O8/NMeKeBVJj2GfhNFoWuKOAEjwdexbvqfGrB6w/dZs
 maZqHlPqY7yPhSQ3/j3UMRPU/LTIWG4LPnDwki0pKve1ftmn/YfIVSmqDmhNMTocI1ib
 PjWyYtZ4o4dwgscgf1jMBTvIltEaVKGMiFlLGp1vKOhjBuSv5z4vO4VjmieWajlpuJZM
 x83ILGMZTATMIlIWoPwdSCezb6GUOQASaYokr5DRZfwZmDjLr8UO6BraFXTR08hDSpTe
 lPOn0DNzej8loRWohxB6Qmv3lycXRI711C7e+l/SJoDtP5GID3fgdLMyEI9xEbpZBlAy
 h7Mg==
X-Gm-Message-State: AOAM531nxC+cv8nNuW0Ikao8AIOr8FB2/cwwLn5NqQZksZ7eMHs7OmUR
 qsrXyFpuiiJaBpRV/QFGfnOpjw==
X-Google-Smtp-Source: ABdhPJzqpIXxf7sDlwvG5dpfwz0MR1YtWLG5ICSpaeVxQW8cVQdXSK+PKLKFDUHTASQkHsLeCr6IhA==
X-Received: by 2002:a05:6512:32a6:: with SMTP id
 q6mr4362786lfe.308.1624546670302; 
 Thu, 24 Jun 2021 07:57:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 16/17] drm/msm/dpu: add support for virtualized planes
Date: Thu, 24 Jun 2021 17:57:32 +0300
Message-Id: <20210624145733.2561992-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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

Add support for registering unified (virtualized) planes, allowing SSPP
block to be allocated at runtime, during atomic_check. This allows one
userspace to use any plane without caring if it supports scaler or YUV
formats. The kernel space will select the appropriate SSPP pipe or
return an error if we run out of resources.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  84 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 226 +++++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  23 +--
 3 files changed, 211 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b62e8e4e8d0a..002bdf0ecd00 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -206,6 +206,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
+	enum dpu_sspp pipe;
 
 	memset(fetch_active, 0, sizeof(fetch_active));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
@@ -216,14 +217,19 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		dpu_plane_get_ctl_flush(plane, ctl, &flush_mask);
-		set_bit(dpu_plane_pipe(plane), fetch_active);
+		if (WARN_ON(!pstate->pipe_hw))
+			continue;
+
+		pipe = pstate->pipe_hw->idx;
+
+		flush_mask = ctl->ops.get_bitmask_sspp(ctl, pipe);
+		set_bit(pipe, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
 				crtc->base.id,
 				pstate->stage,
 				plane->base.id,
-				dpu_plane_pipe(plane) - SSPP_VIG0,
+				pipe - SSPP_VIG0,
 				state->fb ? state->fb->base.id : -1);
 
 		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
@@ -233,13 +239,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		stage_idx = zpos_cnt[pstate->stage]++;
 		stage_cfg->stage[pstate->stage][stage_idx] =
-					dpu_plane_pipe(plane);
+					pipe;
 		stage_cfg->multirect_index[pstate->stage][stage_idx] =
 					pstate->multirect_index;
 
 		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 					   state, pstate, stage_idx,
-					   dpu_plane_pipe(plane) - SSPP_VIG0,
+					   pipe - SSPP_VIG0,
 					   format->base.pixel_format,
 					   fb ? fb->modifier : 0);
 
@@ -875,13 +881,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	drm_crtc_vblank_on(crtc);
 }
 
-struct plane_state {
-	struct dpu_plane_state *dpu_pstate;
-	const struct drm_plane_state *drm_pstate;
-	int stage;
-	u32 pipe_id;
-};
-
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_atomic_state *state)
 {
@@ -889,17 +888,21 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
-	struct plane_state *pstates;
 
-	const struct drm_plane_state *pstate;
+	struct dpu_plane_state **pstates;
+
+	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	struct drm_display_mode *mode;
 
-	int cnt = 0, rc = 0, mixer_width = 0, i;
+	int rc = 0, mixer_width = 0, i;
+	unsigned int num_planes, max_zpos = 0;
 
+	struct drm_rect dst;
 	struct drm_rect crtc_rect = { 0 };
 
-	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
+	num_planes = DPU_STAGE_MAX * 4;
+	pstates = kcalloc(num_planes, sizeof(*pstates), GFP_KERNEL);
 
 	if (!crtc_state->enable || !crtc_state->active) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
@@ -926,28 +929,26 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	crtc_rect.y2 = mode->vdisplay;
 
 	 /* get plane state for all drm planes associated with crtc state */
-	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
-		struct drm_rect dst, clip = crtc_rect;
-
-		if (IS_ERR_OR_NULL(pstate)) {
-			rc = PTR_ERR(pstate);
+	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
+		plane_state = drm_atomic_get_plane_state(state, plane);
+		if (IS_ERR(plane_state)) {
+			rc = PTR_ERR(plane_state);
 			DPU_ERROR("%s: failed to get plane%d state, %d\n",
 					dpu_crtc->name, plane->base.id, rc);
 			goto end;
 		}
-		if (cnt >= DPU_STAGE_MAX * 4)
+
+		if (plane_state->normalized_zpos >= num_planes)
 			continue;
 
-		pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
-		pstates[cnt].drm_pstate = pstate;
-		pstates[cnt].stage = pstate->normalized_zpos;
+		pstates[plane_state->normalized_zpos] = to_dpu_plane_state(plane_state);
 
-		dpu_plane_clear_multirect(pstate);
+		dpu_plane_clear_multirect(plane_state);
 
-		cnt++;
+		max_zpos = max(max_zpos, plane_state->normalized_zpos);
 
-		dst = drm_plane_state_dest(pstate);
-		if (!drm_rect_intersect(&clip, &dst)) {
+		dst = drm_plane_state_dest(plane_state);
+		if (!drm_rect_intersect(&dst, &crtc_rect)) {
 			DPU_ERROR("invalid vertical/horizontal destination\n");
 			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
 				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
@@ -957,8 +958,14 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		}
 	}
 
-	for (i = 0; i < cnt; i++) {
-		int z_pos = pstates[i].stage;
+	for (i = 0; i <= max_zpos; i++) {
+		struct dpu_plane_state *pstate = pstates[i];
+		int z_pos;
+
+		if (!pstate)
+			continue;
+
+		z_pos = pstate->base.normalized_zpos;
 
 		/* verify z_pos setting before using it */
 		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
@@ -968,7 +975,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			goto end;
 		}
 
-		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
+		plane = pstate->base.plane;
+		rc = dpu_plane_set_pipe(plane, pstate);
+		if (rc) {
+			DPU_ERROR("%s: error setting pipe for %s\n", dpu_crtc->name, plane->name);
+			goto end;
+		}
+
+		rc = dpu_plane_real_atomic_check(plane, state);
+		if (rc) {
+			DPU_ERROR("%s: error checking pipe for %s\n", dpu_crtc->name, plane->name);
+			goto end;
+		}
+
+		pstates[i]->stage = z_pos + DPU_STAGE_0;
 		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 70e3eb165363..7b881dba8ad1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -100,7 +100,6 @@ struct dpu_plane {
 
 	enum dpu_sspp pipe;
 
-	struct dpu_hw_pipe *pipe_hw;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -299,6 +298,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	const struct dpu_format *fmt = NULL;
 	u64 qos_lut;
 	u32 total_fl = 0, lut_usage;
@@ -330,7 +330,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, qos_lut);
 
-	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, qos_lut);
+	pstate->pipe_hw->ops.setup_creq_lut(pstate->pipe_hw, qos_lut);
 }
 
 /**
@@ -342,6 +342,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		struct drm_framebuffer *fb)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	const struct dpu_format *fmt = NULL;
 	u32 danger_lut, safe_lut;
 
@@ -381,7 +382,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		danger_lut,
 		safe_lut);
 
-	pdpu->pipe_hw->ops.setup_danger_safe_lut(pdpu->pipe_hw,
+	pstate->pipe_hw->ops.setup_danger_safe_lut(pstate->pipe_hw,
 			danger_lut, safe_lut);
 }
 
@@ -395,14 +396,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	bool enable, u32 flags)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pdpu->pipe_hw->cap->sblk->creq_vblank;
+		pipe_qos_cfg.creq_vblank = pstate->pipe_hw->cap->sblk->creq_vblank;
 		pipe_qos_cfg.danger_vblank =
-				pdpu->pipe_hw->cap->sblk->danger_vblank;
+				pstate->pipe_hw->cap->sblk->danger_vblank;
 		pipe_qos_cfg.vblank_en = enable;
 	}
 
@@ -428,7 +430,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
-	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
+	pstate->pipe_hw->ops.setup_qos_ctrl(pstate->pipe_hw,
 			&pipe_qos_cfg);
 }
 
@@ -441,18 +443,19 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 		struct drm_crtc *crtc, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_vbif_set_ot_params ot_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	memset(&ot_params, 0, sizeof(ot_params));
-	ot_params.xin_id = pdpu->pipe_hw->cap->xin_id;
-	ot_params.num = pdpu->pipe_hw->idx - SSPP_NONE;
+	ot_params.xin_id = pstate->pipe_hw->cap->xin_id;
+	ot_params.num = pstate->pipe_hw->idx - SSPP_NONE;
 	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
 	ot_params.vbif_idx = VBIF_RT;
-	ot_params.clk_ctrl = pdpu->pipe_hw->cap->clk_ctrl;
+	ot_params.clk_ctrl = pstate->pipe_hw->cap->clk_ctrl;
 	ot_params.rd = true;
 
 	dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
@@ -465,14 +468,15 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_vbif_set_qos_params qos_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	memset(&qos_params, 0, sizeof(qos_params));
 	qos_params.vbif_idx = VBIF_RT;
-	qos_params.clk_ctrl = pdpu->pipe_hw->cap->clk_ctrl;
-	qos_params.xin_id = pdpu->pipe_hw->cap->xin_id;
-	qos_params.num = pdpu->pipe_hw->idx - SSPP_VIG0;
+	qos_params.clk_ctrl = pstate->pipe_hw->cap->clk_ctrl;
+	qos_params.xin_id = pstate->pipe_hw->cap->xin_id;
+	qos_params.num = pstate->pipe_hw->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
 	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
@@ -499,11 +503,11 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
 		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
 	else if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pdpu->pipe_hw->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(pdpu->pipe_hw->idx,
+	else if (pstate->pipe_hw->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pstate->pipe_hw->idx,
 					    &pipe_cfg->layout,
 					    pstate->multirect_index);
-		pdpu->pipe_hw->ops.setup_sourceaddress(pdpu->pipe_hw, pipe_cfg,
+		pstate->pipe_hw->ops.setup_sourceaddress(pstate->pipe_hw, pipe_cfg,
 						pstate->multirect_index);
 	}
 }
@@ -549,7 +553,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->src_height[i] /= chroma_subsmpl_v;
 		}
 
-		if (pdpu->pipe_hw->cap->features &
+		if (pstate->pipe_hw->cap->features &
 			BIT(DPU_SSPP_SCALER_QSEED4)) {
 			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
@@ -608,6 +612,7 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
 
 static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
 {
+	struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
 	const struct dpu_csc_cfg *csc_ptr;
 
 	if (!pdpu) {
@@ -618,7 +623,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe_hw->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
@@ -673,8 +678,8 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
 
 	/* update sspp */
-	if (fmt && pdpu->pipe_hw->ops.setup_solidfill) {
-		pdpu->pipe_hw->ops.setup_solidfill(pdpu->pipe_hw,
+	if (fmt && pstate->pipe_hw->ops.setup_solidfill) {
+		pstate->pipe_hw->ops.setup_solidfill(pstate->pipe_hw,
 				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
 				pstate->multirect_index);
 
@@ -687,23 +692,23 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 			drm_rect_height(&pipe_cfg.dst_rect);
 		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 
-		if (pdpu->pipe_hw->ops.setup_format)
-			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
+		if (pstate->pipe_hw->ops.setup_format)
+			pstate->pipe_hw->ops.setup_format(pstate->pipe_hw,
 					fmt, DPU_SSPP_SOLID_FILL,
 					pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_rects)
-			pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
+		if (pstate->pipe_hw->ops.setup_rects)
+			pstate->pipe_hw->ops.setup_rects(pstate->pipe_hw,
 					&pipe_cfg,
 					pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_pe)
-			pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
+		if (pstate->pipe_hw->ops.setup_pe)
+			pstate->pipe_hw->ops.setup_pe(pstate->pipe_hw,
 					&pstate->pixel_ext);
 
-		if (pdpu->pipe_hw->ops.setup_scaler &&
+		if (pstate->pipe_hw->ops.setup_scaler &&
 				pstate->multirect_index != DPU_SSPP_RECT_1)
-			pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
+			pstate->pipe_hw->ops.setup_scaler(pstate->pipe_hw,
 					&pipe_cfg, &pstate->pixel_ext,
 					&pstate->scaler3_cfg);
 	}
@@ -830,18 +835,6 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 	return 0;
 }
 
-/**
- * dpu_plane_get_ctl_flush - get control flush for the given plane
- * @plane: Pointer to drm plane structure
- * @ctl: Pointer to hardware control driver
- * @flush_sspp: Pointer to sspp flush control word
- */
-void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
-		u32 *flush_sspp)
-{
-	*flush_sspp = ctl->ops.get_bitmask_sspp(ctl, dpu_plane_pipe(plane));
-}
-
 static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		struct drm_plane_state *new_state)
 {
@@ -922,8 +915,86 @@ static bool dpu_plane_validate_src(struct drm_rect *src,
 		drm_rect_equals(fb_rect, src);
 }
 
+int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate)
+{
+	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_global_state *global_state = dpu_kms_get_global_state(pstate->base.state);
+	enum dpu_sspp pipe;
+
+	if (pdpu->pipe != SSPP_NONE) {
+		pipe = pdpu->pipe;
+	} else {
+		bool yuv, scale;
+		struct drm_rect src, dst;
+
+		yuv = pstate->base.fb ? DPU_FORMAT_IS_YUV (to_dpu_format(msm_framebuffer_format(pstate->base.fb))) : false;
+		src = drm_plane_state_src(&pstate->base);
+		dst = drm_plane_state_dest(&pstate->base);
+		scale = (drm_rect_width(&src) >> 16 != drm_rect_width(&dst)) ||
+			(drm_rect_height(&src) >> 16 != drm_rect_height(&dst));
+
+		pipe = dpu_rm_get_sspp(&kms->rm, global_state, plane->base.id, yuv, scale);
+		DRM_DEBUG_ATOMIC("PLANE %d got SSPP %d\n", plane->base.id, pipe);
+	}
+
+	if (pipe == SSPP_NONE || pipe >= SSPP_MAX || !kms->rm.sspp_blks[pipe - SSPP_NONE])
+		return -EINVAL;
+
+	pstate->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
+
+	return 0;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_global_state *global_state = dpu_kms_get_global_state(state);
+
+	if (!new_plane_state->fb)
+		new_plane_state->visible = false;
+
+	/*
+	 * Free unused pipes during atomic_check. They might be picked up
+	 * later, during pipes reallocation. The real checks will be executed
+	 * later, from dpu_plane_real_atomic_check() called from
+	 * dpu_crtc_atomic_check when the pipes are allocated.
+	 */
+	if (!new_plane_state->visible &&
+	    pstate->pipe_hw != NULL) {
+		/*
+		 * If the pipe was statically allocated during dpu_plane_init, do not
+		 * touch dpu_rm here.
+		 */
+		if (pdpu->pipe == SSPP_NONE) {
+			DRM_DEBUG_ATOMIC("PLANE %d released SSPP %d\n", plane->base.id, pstate->pipe_hw->idx);
+			dpu_rm_release_sspp(&dpu_kms->rm, global_state, plane);
+			pstate->pipe_hw = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static bool dpu_plane_check_sspp_format(struct dpu_hw_pipe *pipe_hw, u32 format)
+{
+	int i;
+
+	for (i = 0; i < pipe_hw->cap->sblk->num_formats; i++) {
+		if (format == pipe_hw->cap->sblk->format_list[i])
+			return true;
+	}
+
+	return false;
+}
+
+int dpu_plane_real_atomic_check(struct drm_plane *plane,
+				struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
@@ -939,10 +1010,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	min_scale = FRAC_16_16(1, pdpu->pipe_hw->cap->sblk->maxupscale);
+	min_scale = FRAC_16_16(1, pstate->pipe_hw->cap->sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
-						  pdpu->pipe_hw->cap->sblk->maxdwnscale << 16,
+						  pstate->pipe_hw->cap->sblk->maxdwnscale << 16,
 						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
@@ -951,6 +1022,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	if (!dpu_plane_check_sspp_format(pstate->pipe_hw, new_plane_state->fb->format->format)) {
+		DPU_ERROR("Format %p4cc not supported by the selected SSPP %d\n",
+				&new_plane_state->fb->format->format, pstate->pipe_hw->idx);
+
+		return -EINVAL;
+	}
+
 	src.x1 = new_plane_state->src_x >> 16;
 	src.y1 = new_plane_state->src_y >> 16;
 	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
@@ -968,8 +1046,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
+		(!(pstate->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+		 !(pstate->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
@@ -1030,8 +1108,8 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else if (pdpu->pipe_hw && pdpu->csc_ptr && pdpu->pipe_hw->ops.setup_csc)
-		pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, pdpu->csc_ptr);
+	else if (pstate->pipe_hw && pdpu->csc_ptr && pstate->pipe_hw->ops.setup_csc)
+		pstate->pipe_hw->ops.setup_csc(pstate->pipe_hw, pdpu->csc_ptr);
 
 	/* flag h/w flush complete */
 	if (plane->state)
@@ -1099,15 +1177,15 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		return;
 	}
 
-	if (pdpu->pipe_hw->ops.setup_rects) {
-		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
+	if (pstate->pipe_hw->ops.setup_rects) {
+		pstate->pipe_hw->ops.setup_rects(pstate->pipe_hw,
 				&pipe_cfg,
 				pstate->multirect_index);
 	}
 
-	if (pdpu->pipe_hw->ops.setup_pe &&
+	if (pstate->pipe_hw->ops.setup_pe &&
 			(pstate->multirect_index != DPU_SSPP_RECT_1))
-		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
+		pstate->pipe_hw->ops.setup_pe(pstate->pipe_hw,
 				&pstate->pixel_ext);
 
 	/**
@@ -1115,19 +1193,19 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	 * bypassed. Still we need to update alpha and bitwidth
 	 * ONLY for RECT0
 	 */
-	if (pdpu->pipe_hw->ops.setup_scaler &&
+	if (pstate->pipe_hw->ops.setup_scaler &&
 			pstate->multirect_index != DPU_SSPP_RECT_1)
-		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
+		pstate->pipe_hw->ops.setup_scaler(pstate->pipe_hw,
 				&pipe_cfg, &pstate->pixel_ext,
 				&pstate->scaler3_cfg);
 
-	if (pdpu->pipe_hw->ops.setup_multirect)
-		pdpu->pipe_hw->ops.setup_multirect(
-				pdpu->pipe_hw,
+	if (pstate->pipe_hw->ops.setup_multirect)
+		pstate->pipe_hw->ops.setup_multirect(
+				pstate->pipe_hw,
 				pstate->multirect_index,
 				pstate->multirect_mode);
 
-	if (pdpu->pipe_hw->ops.setup_format) {
+	if (pstate->pipe_hw->ops.setup_format) {
 		unsigned int rotation;
 
 		src_flags = 0x0;
@@ -1144,10 +1222,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			src_flags |= DPU_SSPP_FLIP_UD;
 
 		/* update format */
-		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
+		pstate->pipe_hw->ops.setup_format(pstate->pipe_hw, fmt, src_flags,
 				pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_cdp) {
+		if (pstate->pipe_hw->ops.setup_cdp) {
 			struct dpu_hw_pipe_cdp_cfg *cdp_cfg = &pstate->cdp_cfg;
 
 			memset(cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
@@ -1161,7 +1239,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg->preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, cdp_cfg);
+			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, cdp_cfg);
 		}
 
 		/* update csc */
@@ -1201,6 +1279,8 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 				pstate->multirect_mode);
 
 	pstate->pending = true;
+
+	pstate->pipe_hw = NULL;
 }
 
 static void dpu_plane_atomic_update(struct drm_plane *plane,
@@ -1357,11 +1437,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane)
-{
-	return plane ? to_dpu_plane(plane)->pipe : SSPP_NONE;
-}
-
 /* initialize plane */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
@@ -1387,19 +1462,22 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	plane = &pdpu->base;
 	pdpu->pipe = pipe;
 
-	/* initialize underlying h/w driver */
-	if (!kms->rm.sspp_blks[pipe - SSPP_NONE])
-		goto clean_plane;
-	pdpu->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
-
-	if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
-		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
-		goto clean_plane;
+	if (pdpu->pipe == SSPP_NONE) {
+		format_list = kms->catalog->caps->format_list;
+		num_formats = kms->catalog->caps->num_formats;
+	} else if (pdpu->pipe < SSPP_MAX) {
+		struct dpu_hw_pipe *pipe_hw;
+
+		if (!kms->rm.sspp_blks[pdpu->pipe - SSPP_NONE])
+			return ERR_PTR(-EINVAL);
+		pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pdpu->pipe - SSPP_NONE]);
+		format_list = pipe_hw->cap->sblk->format_list;
+		num_formats = pipe_hw->cap->sblk->num_formats;
+	} else {
+		return ERR_PTR(-EINVAL);
 	}
 
-	format_list = pdpu->pipe_hw->cap->sblk->format_list;
-	num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
-
+	/* initialize underlying h/w driver */
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index b0c08bd54170..0d964512f8e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -45,6 +45,8 @@ struct dpu_plane_state {
 	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
 	u64 plane_fetch_bw;
 	u64 plane_clk;
+
+	struct dpu_hw_pipe *pipe_hw;
 };
 
 /**
@@ -60,22 +62,6 @@ struct dpu_multirect_plane_states {
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
-/**
- * dpu_plane_pipe - return sspp identifier for the given plane
- * @plane:   Pointer to DRM plane object
- * Returns: sspp identifier of the given plane
- */
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
-
-/**
- * dpu_plane_get_ctl_flush - get control flush mask
- * @plane:   Pointer to DRM plane object
- * @ctl: Pointer to control hardware
- * @flush_sspp: Pointer to sspp flush control word
- */
-void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
-		u32 *flush_sspp);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
@@ -129,4 +115,9 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
 static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
 #endif
 
+int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate);
+
+int dpu_plane_real_atomic_check(struct drm_plane *plane,
+				struct drm_atomic_state *state);
+
 #endif /* _DPU_PLANE_H_ */
-- 
2.30.2

