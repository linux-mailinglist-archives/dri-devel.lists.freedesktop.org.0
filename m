Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556756A9809
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B815D10E616;
	Fri,  3 Mar 2023 12:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F59110E5D6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t11so3487690lfr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43O4Zz5/DbeaZ6/GkMjmGqVKawOZWq8u1Wg8/BX1+u4=;
 b=M78OPYXpm9YFeSj1u137Lv9z2p0z60wi8VsMxevdl3mnh/l7jrD3tw6bYqbW+JHxzu
 wY2trzKyr4wT6/biRSIvSuxRS5RMLiy5hDgMWUvstCBdExys1mcGk0XQzh2YzK+wwbjY
 fdK3Xde2vBiFDyXu/9LHCRqRBP+/zYLh7EhUPERD5jD8CPYK91JZiP5qFMgCcW+MU7uE
 vlk4Kvc9Iw8pYtRLzU8v9FSTKZ+5kN9fOG3Kh3uJvCqg1kFLaZU2NU0ciP2j3KokaH4i
 ikhp9T0I8b10QknTIwU2+P0U5MVAzwnpXdYyoA/MgdQFkl4Dhi03VAg+F3jHXjEfn3bB
 ScyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43O4Zz5/DbeaZ6/GkMjmGqVKawOZWq8u1Wg8/BX1+u4=;
 b=mIyEWttA40AXI6UG0KXVxXeVu6iJ22Sn6ylzoqDjKcWidagbUtWT0hUQS2BYK4TKvb
 lwWN+5f1Rz8RSYmWH7Mu9TE7LDEWmes15eXQ6963/72S3H6LPqqiJi0KCCKnZ4Hoq2aQ
 ERqe/ebjGS6UbuCUs0Aoxa6YAU1UTBxk/4CBxkCUkhz0vUJq/l2DTv1GD60pwi0oLEwO
 PZKOiFuBHSpC1i3jM/QQFnTl/tGF8hfLDVk8nd9jC6ytbnWPqC5nRE7tcr2CAFpWfJjc
 mSVJyJ8rk4L55IbDRnFffyn4TUiLWH1HhuzkxdJhX9hlfFm1UqcGGsfLdqyJtc5g1Yf/
 03SQ==
X-Gm-Message-State: AO0yUKWmBO+cNRzFXPqLGA3Ie7U9Na057I+11tNMeMPAqUttXnJ6EWQa
 21FgZMcNhIFkTSl06/j4bedE6w==
X-Google-Smtp-Source: AK7set9RztqiT+k6Aj8T9gB4OXUSHdO88aGlgVfgPYCuMemP/gjL07N8Nw/p5B0XLlTf4n7QFsijeQ==
X-Received: by 2002:ac2:44ca:0:b0:4df:7586:cc3a with SMTP id
 d10-20020ac244ca000000b004df7586cc3amr524064lfm.5.1677848249482; 
 Fri, 03 Mar 2023 04:57:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 05/30] drm/msm/dpu: move pipe_hw to dpu_plane_state
Date: Fri,  3 Mar 2023 14:57:00 +0200
Message-Id: <20230303125725.3695011-6-dmitry.baryshkov@linaro.org>
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

In preparation to adding fully virtualized planes, move struct
dpu_hw_sspp instance from struct dpu_plane to struct dpu_plane_state, as
it will become a part of state (variable, changes during runtime) rather
than part of a plane (ideally should be statically allocated during boot).

The sspp pointer is set at the dpu_plane_reset(), since this is the
function which allocates the state. Once we have fully virtual
plane<->SSPP relationship, the SSPP will be allocated dynamically in the
dpu_plane_atomic_check() function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 107 ++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   2 +
 2 files changed, 62 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d6518ef1beb2..546629232e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -104,7 +104,6 @@ struct dpu_plane {
 
 	enum dpu_sspp pipe;
 
-	struct dpu_hw_sspp *pipe_hw;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -279,6 +278,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 		struct drm_framebuffer *fb, struct dpu_hw_sspp_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	const struct dpu_format *fmt = NULL;
 	u64 qos_lut;
 	u32 total_fl = 0, lut_usage;
@@ -310,7 +310,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, qos_lut);
 
-	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, qos_lut);
+	pstate->hw_sspp->ops.setup_creq_lut(pstate->hw_sspp, qos_lut);
 }
 
 /**
@@ -322,6 +322,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		struct drm_framebuffer *fb)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	const struct dpu_format *fmt = NULL;
 	u32 danger_lut, safe_lut;
 
@@ -361,7 +362,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		danger_lut,
 		safe_lut);
 
-	pdpu->pipe_hw->ops.setup_danger_safe_lut(pdpu->pipe_hw,
+	pstate->hw_sspp->ops.setup_danger_safe_lut(pstate->hw_sspp,
 			danger_lut, safe_lut);
 }
 
@@ -375,14 +376,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	bool enable, u32 flags)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pdpu->pipe_hw->cap->sblk->creq_vblank;
+		pipe_qos_cfg.creq_vblank = pstate->hw_sspp->cap->sblk->creq_vblank;
 		pipe_qos_cfg.danger_vblank =
-				pdpu->pipe_hw->cap->sblk->danger_vblank;
+				pstate->hw_sspp->cap->sblk->danger_vblank;
 		pipe_qos_cfg.vblank_en = enable;
 	}
 
@@ -408,7 +410,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
-	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
+	pstate->hw_sspp->ops.setup_qos_ctrl(pstate->hw_sspp,
 			&pipe_qos_cfg);
 }
 
@@ -422,18 +424,19 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 		struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_vbif_set_ot_params ot_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	memset(&ot_params, 0, sizeof(ot_params));
-	ot_params.xin_id = pdpu->pipe_hw->cap->xin_id;
-	ot_params.num = pdpu->pipe_hw->idx - SSPP_NONE;
+	ot_params.xin_id = pstate->hw_sspp->cap->xin_id;
+	ot_params.num = pstate->hw_sspp->idx - SSPP_NONE;
 	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
 	ot_params.vbif_idx = VBIF_RT;
-	ot_params.clk_ctrl = pdpu->pipe_hw->cap->clk_ctrl;
+	ot_params.clk_ctrl = pstate->hw_sspp->cap->clk_ctrl;
 	ot_params.rd = true;
 
 	dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
@@ -446,14 +449,15 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
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
+	qos_params.clk_ctrl = pstate->hw_sspp->cap->clk_ctrl;
+	qos_params.xin_id = pstate->hw_sspp->cap->xin_id;
+	qos_params.num = pstate->hw_sspp->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
 	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
@@ -478,11 +482,11 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
 	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
 	if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pdpu->pipe_hw->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(pdpu->pipe_hw->idx,
+	else if (pstate->hw_sspp->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pstate->hw_sspp->idx,
 					    &pipe_cfg->layout,
 					    pstate->multirect_index);
-		pdpu->pipe_hw->ops.setup_sourceaddress(pdpu->pipe_hw, pipe_cfg,
+		pstate->hw_sspp->ops.setup_sourceaddress(pstate->hw_sspp, pipe_cfg,
 						pstate->multirect_index);
 	}
 }
@@ -534,7 +538,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->src_height[i] /= chroma_subsmpl_v;
 		}
 
-		if (pdpu->pipe_hw->cap->features &
+		if (pstate->hw_sspp->cap->features &
 			BIT(DPU_SSPP_SCALER_QSEED4)) {
 			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
@@ -607,6 +611,7 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
 
 static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
 {
+	struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
 	const struct dpu_csc_cfg *csc_ptr;
 
 	if (!pdpu) {
@@ -617,7 +622,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->hw_sspp->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
@@ -660,8 +665,8 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
 			src_width, src_height, info->hsub, info->vsub);
 
-	if (pdpu->pipe_hw->ops.setup_pe)
-		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
+	if (pstate->hw_sspp->ops.setup_pe)
+		pstate->hw_sspp->ops.setup_pe(pstate->hw_sspp,
 				&pixel_ext);
 
 	/**
@@ -669,9 +674,9 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	 * bypassed. Still we need to update alpha and bitwidth
 	 * ONLY for RECT0
 	 */
-	if (pdpu->pipe_hw->ops.setup_scaler &&
+	if (pstate->hw_sspp->ops.setup_scaler &&
 			pstate->multirect_index != DPU_SSPP_RECT_1)
-		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
+		pstate->hw_sspp->ops.setup_scaler(pstate->hw_sspp,
 				pipe_cfg,
 				&scaler3_cfg);
 }
@@ -700,8 +705,8 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
 
 	/* update sspp */
-	if (fmt && pdpu->pipe_hw->ops.setup_solidfill) {
-		pdpu->pipe_hw->ops.setup_solidfill(pdpu->pipe_hw,
+	if (fmt && pstate->hw_sspp->ops.setup_solidfill) {
+		pstate->hw_sspp->ops.setup_solidfill(pstate->hw_sspp,
 				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
 				pstate->multirect_index);
 
@@ -715,13 +720,13 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		pipe_cfg.src_rect.y2 =
 			drm_rect_height(&pipe_cfg.dst_rect);
 
-		if (pdpu->pipe_hw->ops.setup_format)
-			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
+		if (pstate->hw_sspp->ops.setup_format)
+			pstate->hw_sspp->ops.setup_format(pstate->hw_sspp,
 					fmt, DPU_SSPP_SOLID_FILL,
 					pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_rects)
-			pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
+		if (pstate->hw_sspp->ops.setup_rects)
+			pstate->hw_sspp->ops.setup_rects(pstate->hw_sspp,
 					&pipe_cfg,
 					pstate->multirect_index);
 
@@ -973,8 +978,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t min_src_size, max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pdpu->pipe_hw->cap;
-	const struct dpu_sspp_sub_blks *sblk = pdpu->pipe_hw->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->hw_sspp->cap;
+	const struct dpu_sspp_sub_blks *sblk = pstate->hw_sspp->cap->sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1087,12 +1092,12 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
+	else if (pstate->hw_sspp && pstate->hw_sspp->ops.setup_csc) {
 		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
 		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
 
 		if (csc_ptr)
-			pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, csc_ptr);
+			pstate->hw_sspp->ops.setup_csc(pstate->hw_sspp, csc_ptr);
 	}
 
 	/* flag h/w flush complete */
@@ -1162,21 +1167,21 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		return;
 	}
 
-	if (pdpu->pipe_hw->ops.setup_rects) {
-		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
+	if (pstate->hw_sspp->ops.setup_rects) {
+		pstate->hw_sspp->ops.setup_rects(pstate->hw_sspp,
 				&pipe_cfg,
 				pstate->multirect_index);
 	}
 
 	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
 
-	if (pdpu->pipe_hw->ops.setup_multirect)
-		pdpu->pipe_hw->ops.setup_multirect(
-				pdpu->pipe_hw,
+	if (pstate->hw_sspp->ops.setup_multirect)
+		pstate->hw_sspp->ops.setup_multirect(
+				pstate->hw_sspp,
 				pstate->multirect_index,
 				pstate->multirect_mode);
 
-	if (pdpu->pipe_hw->ops.setup_format) {
+	if (pstate->hw_sspp->ops.setup_format) {
 		unsigned int rotation = pstate->rotation;
 
 		src_flags = 0x0;
@@ -1191,10 +1196,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			src_flags |= DPU_SSPP_ROT_90;
 
 		/* update format */
-		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
+		pstate->hw_sspp->ops.setup_format(pstate->hw_sspp, fmt, src_flags,
 				pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_cdp) {
+		if (pstate->hw_sspp->ops.setup_cdp) {
 			struct dpu_hw_cdp_cfg cdp_cfg;
 
 			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
@@ -1208,7 +1213,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg, pstate->multirect_index);
+			pstate->hw_sspp->ops.setup_cdp(pstate->hw_sspp, &cdp_cfg,
+						       pstate->multirect_index);
 		}
 	}
 
@@ -1348,10 +1354,9 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
 	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	const struct dpu_plane *pdpu = to_dpu_plane(state->plane);
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
-	drm_printf(p, "\tsspp=%s\n", pdpu->pipe_hw->cap->name);
+	drm_printf(p, "\tsspp=%s\n", pstate->hw_sspp->cap->name);
 	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->multirect_mode));
 	drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->multirect_index));
 }
@@ -1360,6 +1365,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1381,6 +1387,12 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
+	/*
+	 * Set the SSPP here until we have proper virtualized DPU planes.
+	 * This is the place where the state is allocated, so fill it fully.
+	 */
+	pstate->hw_sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 
@@ -1445,6 +1457,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
+	struct dpu_hw_sspp *pipe_hw;
 	uint32_t num_formats;
 	uint32_t supported_rotations;
 	int ret = -EINVAL;
@@ -1462,14 +1475,14 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	pdpu->pipe = pipe;
 
 	/* initialize underlying h/w driver */
-	pdpu->pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
-	if (!pdpu->pipe_hw || !pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
+	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
+	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
 		goto clean_plane;
 	}
 
-	format_list = pdpu->pipe_hw->cap->sblk->format_list;
-	num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
+	format_list = pipe_hw->cap->sblk->format_list;
+	num_formats = pipe_hw->cap->sblk->num_formats;
 
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
@@ -1491,7 +1504,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
 
-	if (pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
+	if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
 		supported_rotations |= DRM_MODE_ROTATE_MASK;
 
 	drm_plane_create_rotation_property(plane,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index b7b1b05199c2..08a4b6a99f51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -18,6 +18,7 @@
  * struct dpu_plane_state: Define dpu extension of drm plane state object
  * @base:	base drm plane state object
  * @aspace:	pointer to address space for input/output buffers
+ * @hw_sspp:	pointer to corresponding SSPP instance
  * @stage:	assigned by crtc blender
  * @needs_qos_remap: qos remap settings need to be updated
  * @multirect_index: index of the rectangle of SSPP
@@ -31,6 +32,7 @@
 struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
+	struct dpu_hw_sspp *hw_sspp;
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	uint32_t multirect_index;
-- 
2.39.2

