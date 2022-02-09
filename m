Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068054AF828
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295FC10E435;
	Wed,  9 Feb 2022 17:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C7F10E3E7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:28 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id k10so1439786ljq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1l7aOgGlUXM4qoMBtCHMSxy1JkrISEHqNb8K8WSoe2M=;
 b=fVfXf36Nmih0pZVsNOkt0ZAH0aQgovF0ztt7Y0e7RCkUYhCXxRu85KDNhC6WtgmSjm
 453Kv7aucXW0tmyhpqlOr9y+O4ken0IuxoT2ULtPTJUV3N1HgFCHFeJvcK+c4mqRzU8Q
 /wdSKT4rTmkAfhp+sHNTngiq9PuRSYV3CQGtJuqEK9WPlDRjLBU/TUhhKbl7dJurt323
 bvYaoudgROpFtbWFpmJ45eo370YBshXZ4hPvw1KKW7Lp+uRcjcjiHoPsJs1LrCH5Mh8I
 aSDctKc1HS9mTeHvCfSzhwc1jAiAKAl12evdOya/r1K1E2HmjvH+PQa346Pssuvefjye
 jEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1l7aOgGlUXM4qoMBtCHMSxy1JkrISEHqNb8K8WSoe2M=;
 b=JWIFPKIWvW1J7Su56m0bJsIrplDUfNkFoiOb75t36j9J5mVT/DpZ4XBlJTiIJAoYLl
 aXe97Sio0OeT/CzWNdxKQSFtSmO/bhO7AKiu6qdyyF27wlemAAwT3xqVf/jtBAN2zjVS
 fMjjuZ0iTkj9E6hg5BQcX5SLfW5akodyDPw/Ia1JXOFII2fyOehbOmnwbxjFMaq7JPed
 0epQodhfaNgVbKqF/gv86de39roamhCvLDlLiP+jZoyusUAKPK+Gsw6ZcHI6XyvJB62s
 VuwmS+IirOsFPW2nCmGVgOvlbTR7GN1JgQtK+j08B+vlD9rtHz4UFHu5Qo2SHBErxvn4
 KsQQ==
X-Gm-Message-State: AOAM533jjnrvlI9GNWzFmDLaXx+K5Avt01qvK4sCgG4TUM0Ec54ayx+r
 MkFJ5+kO+ndQcTqER+MIWHev7g==
X-Google-Smtp-Source: ABdhPJxuORj05rnARDA9+Q5cnggKBDLHAgiD58W6u8CEzkdOVKdpYZvaseIWGa6JIfVIgyQm6zQ1UA==
X-Received: by 2002:a05:651c:217:: with SMTP id
 y23mr2127149ljn.472.1644427527198; 
 Wed, 09 Feb 2022 09:25:27 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 05/25] drm/msm/dpu: move pipe_hw to dpu_plane_state
Date: Wed,  9 Feb 2022 20:25:00 +0300
Message-Id: <20220209172520.3719906-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to adding fully virtualized planes, move struct
dpu_hw_pipe instance from struct dpu_plane to struct dpu_plane_state, as
it will become a part of state (allocated during atomic check) rather
than part of a plane (allocated during boot).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 104 ++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   2 +
 2 files changed, 58 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 37742f74a7bf..0247ff8a67a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -100,7 +100,6 @@ struct dpu_plane {
 
 	enum dpu_sspp pipe;
 
-	struct dpu_hw_pipe *pipe_hw;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -300,6 +299,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	const struct dpu_format *fmt = NULL;
 	u64 qos_lut;
 	u32 total_fl = 0, lut_usage;
@@ -331,7 +331,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, qos_lut);
 
-	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, qos_lut);
+	pstate->pipe_hw->ops.setup_creq_lut(pstate->pipe_hw, qos_lut);
 }
 
 /**
@@ -343,6 +343,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		struct drm_framebuffer *fb)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	const struct dpu_format *fmt = NULL;
 	u32 danger_lut, safe_lut;
 
@@ -382,7 +383,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		danger_lut,
 		safe_lut);
 
-	pdpu->pipe_hw->ops.setup_danger_safe_lut(pdpu->pipe_hw,
+	pstate->pipe_hw->ops.setup_danger_safe_lut(pstate->pipe_hw,
 			danger_lut, safe_lut);
 }
 
@@ -396,14 +397,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
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
 
@@ -429,7 +431,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
-	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
+	pstate->pipe_hw->ops.setup_qos_ctrl(pstate->pipe_hw,
 			&pipe_qos_cfg);
 }
 
@@ -443,18 +445,19 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
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
@@ -467,14 +470,15 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
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
@@ -501,11 +505,11 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
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
@@ -609,6 +613,7 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
 
 static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
 {
+	struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
 	const struct dpu_csc_cfg *csc_ptr;
 
 	if (!pdpu) {
@@ -619,7 +624,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe_hw->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
@@ -654,8 +659,8 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 			&scaler3_cfg, &pixel_ext, fmt,
 			info->hsub, info->vsub);
 
-	if (pdpu->pipe_hw->ops.setup_pe)
-		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
+	if (pstate->pipe_hw->ops.setup_pe)
+		pstate->pipe_hw->ops.setup_pe(pstate->pipe_hw,
 				&pixel_ext);
 
 	/**
@@ -663,9 +668,9 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	 * bypassed. Still we need to update alpha and bitwidth
 	 * ONLY for RECT0
 	 */
-	if (pdpu->pipe_hw->ops.setup_scaler &&
+	if (pstate->pipe_hw->ops.setup_scaler &&
 			pstate->multirect_index != DPU_SSPP_RECT_1)
-		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
+		pstate->pipe_hw->ops.setup_scaler(pstate->pipe_hw,
 				pipe_cfg,
 				&scaler3_cfg);
 }
@@ -694,8 +699,8 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
 
 	/* update sspp */
-	if (fmt && pdpu->pipe_hw->ops.setup_solidfill) {
-		pdpu->pipe_hw->ops.setup_solidfill(pdpu->pipe_hw,
+	if (fmt && pstate->pipe_hw->ops.setup_solidfill) {
+		pstate->pipe_hw->ops.setup_solidfill(pstate->pipe_hw,
 				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
 				pstate->multirect_index);
 
@@ -709,13 +714,13 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		pipe_cfg.src_rect.y2 =
 			drm_rect_height(&pipe_cfg.dst_rect);
 
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
 
@@ -953,10 +958,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -982,8 +987,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
+		(!(pstate->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+		 !(pstate->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
@@ -1044,12 +1049,12 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
+	else if (pstate->pipe_hw && pstate->pipe_hw->ops.setup_csc) {
 		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
 		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
 
 		if (csc_ptr)
-			pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, csc_ptr);
+			pstate->pipe_hw->ops.setup_csc(pstate->pipe_hw, csc_ptr);
 	}
 
 	/* flag h/w flush complete */
@@ -1116,21 +1121,21 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		return;
 	}
 
-	if (pdpu->pipe_hw->ops.setup_rects) {
-		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
+	if (pstate->pipe_hw->ops.setup_rects) {
+		pstate->pipe_hw->ops.setup_rects(pstate->pipe_hw,
 				&pipe_cfg,
 				pstate->multirect_index);
 	}
 
 	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
 
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
@@ -1147,10 +1152,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			src_flags |= DPU_SSPP_FLIP_UD;
 
 		/* update format */
-		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
+		pstate->pipe_hw->ops.setup_format(pstate->pipe_hw, fmt, src_flags,
 				pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_cdp) {
+		if (pstate->pipe_hw->ops.setup_cdp) {
 			struct dpu_hw_pipe_cdp_cfg cdp_cfg;
 
 			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
@@ -1164,7 +1169,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg, pstate->multirect_index);
+			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg, pstate->multirect_index);
 		}
 	}
 
@@ -1310,10 +1315,9 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
 	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	const struct dpu_plane *pdpu = to_dpu_plane(state->plane);
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
-	drm_printf(p, "\tsspp=%s\n", pdpu->pipe_hw->cap->name);
+	drm_printf(p, "\tsspp=%s\n", pstate->pipe_hw->cap->name);
 	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->multirect_mode));
 	drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->multirect_index));
 }
@@ -1322,6 +1326,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
+	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1343,6 +1348,8 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
+	pstate->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pdpu->pipe - SSPP_NONE]);
+
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 
@@ -1411,6 +1418,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
+	struct dpu_hw_pipe *pipe_hw;
 	uint32_t num_formats;
 	int ret = -EINVAL;
 
@@ -1429,15 +1437,15 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* initialize underlying h/w driver */
 	if (!kms->rm.sspp_blks[pipe - SSPP_NONE])
 		goto clean_plane;
-	pdpu->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
+	pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
 
-	if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
+	if (!pipe_hw->cap || !pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
 		goto clean_plane;
 	}
 
-	format_list = pdpu->pipe_hw->cap->sblk->format_list;
-	num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
+	format_list = pipe_hw->cap->sblk->format_list;
+	num_formats = pipe_hw->cap->sblk->num_formats;
 
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index d2f60810434e..42b88b6bc9c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -35,6 +35,8 @@ struct dpu_plane_state {
 	uint32_t multirect_mode;
 	bool pending;
 
+	struct dpu_hw_pipe *pipe_hw;
+
 	u64 plane_fetch_bw;
 	u64 plane_clk;
 };
-- 
2.34.1

