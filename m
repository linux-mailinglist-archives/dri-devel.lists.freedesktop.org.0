Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131B3BB4E5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEFC89C56;
	Mon,  5 Jul 2021 01:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA43C89C33
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:25 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bu19so29488019lfb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3pXnHhbLOSgh1nV7LB4+UfwJds4kYMWrR6kDSeI0UM=;
 b=f/zfF5yFxg3umfx/ezGsoQu1xyCe2kuPx6Gg1V01M1fLYptYs6AmP2pvbV5cffCdqN
 sK/QSBJADVORD6ClitdL2EDo+bVJCemNNA25igTxkpBk2HcgR96STu/FbnqA0syVgoHV
 Aolk++BRg8OgBafIX5lSd8L61uvAf8n5oCvoA22EwHTS3F8jBg4kP0+cWrsrN2hxoVoT
 7XJOM4lbSmWDhEbvGPl4+208HTVEAkg5zwVtseVtrItmC+YlJMFWDyMPbLyWp8BAe3N3
 SSA4Y71TGWb1W+hXas1u2aVwv5fz38/KtJNzacU6PEngWhczlwASyxcPPao0cp9CDhH6
 JS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g3pXnHhbLOSgh1nV7LB4+UfwJds4kYMWrR6kDSeI0UM=;
 b=GC8Kl8utieZdIL6/c3U0KlVJa5aFraaJOhbLx0Al3z5UTl/O26TGY8wWQu7uofpM7a
 srpt5T4bWrA1Zwm39pLT2b8D3jGo/ZmQl+ObmtLdZ4wpVWPFlre/Gny5kG1bbi2FFd3R
 yBGz1j2yoPkSzl/wq8r1fSgwqBjmmHauIAD3SRemQUzSJPTLAZN+fyPPRSpK7H0xvnNC
 0V1hN+An6lOhMbAJKhv8iahYUhbMzQ3PBauFDqbP8kGjH/FBESNAQy7HPuSZ+PNzYV03
 XylsW7Yqv9TCGdTxu6Elh028Evz+MM6e8v3mlUWbGIrgo2KSA0ljqaSEEGmEnZfB10uB
 DjQg==
X-Gm-Message-State: AOAM530+sGyqCJJOeIs374jWX1WHtRyjRlTNuu2jgH4OOIy62iT+f7cv
 bupfSFSy2gsuOqei5ZxFf+Sl0w==
X-Google-Smtp-Source: ABdhPJyxQAmzSr2crGdO2yLmf+a7X2LIFj08Q8oCACI5htosaivpKMdIX+FhbdjJviI3bc7I3SfEtw==
X-Received: by 2002:a05:6512:3253:: with SMTP id
 c19mr8557028lfr.432.1625448324142; 
 Sun, 04 Jul 2021 18:25:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 22/22] drm/msm/dpu: add multirect support
Date: Mon,  5 Jul 2021 04:21:15 +0300
Message-Id: <20210705012115.4179824-23-dmitry.baryshkov@linaro.org>
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

If SmartDMA is supported by the hardware, SSPPs allow using two RGB
layers per the hardware pipe (with some additional restrictions, like no
support for scaling, etc). Register additional planes (two per the SSPP)
and check if we can use multirect during atomic_check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  18 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 109 +++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  29 +-----
 4 files changed, 86 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 49bdd5953b9f..49bd9df387b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -892,7 +892,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	struct dpu_global_state *global_state = dpu_kms_get_global_state(state);
 
 	struct dpu_plane_state **pstates;
-	struct dpu_plane_state *pstate;
+	struct dpu_plane_state *pstate, *prev_plane_state;
 
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
@@ -962,6 +962,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	}
 
 	stage = DPU_STAGE_0;
+	prev_plane_state = NULL;
 	for (i = 0; i <= max_zpos; i++) {
 		pstate = pstates[i];
 		if (!pstate)
@@ -977,8 +978,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 		plane_state = &pstate->base;
 
-		dpu_plane_clear_multirect(plane_state);
-
 		dst = drm_plane_state_dest(plane_state);
 		if (!drm_rect_intersect(&dst, &crtc_rect)) {
 			DPU_ERROR("invalid vertical/horizontal destination\n");
@@ -990,7 +989,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		}
 
 		plane = pstate->base.plane;
-		rc = dpu_plane_set_pipe(plane, pstate);
+		rc = dpu_plane_set_pipe(plane, pstate, prev_plane_state);
 		if (rc) {
 			DPU_ERROR("%s: error setting pipe for %s\n", dpu_crtc->name, plane->name);
 			goto end;
@@ -1002,6 +1001,17 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			goto end;
 		}
 
+		/*
+		 * If this plane was not selected for multirect, so we can try
+		 * using it together with the next pipe.  If it selected for
+		 * the REC1, next pipe will have to start from REC_SOLO (and
+		 * maybe be promoted to REC0 later.
+		 */
+		if (pstate->multirect_index == DPU_SSPP_RECT_SOLO)
+			prev_plane_state = pstate;
+		else
+			prev_plane_state = NULL;
+
 		pstates[i]->stage = stage++;
 		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 08a7e56cc98f..c3c3972627ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -646,7 +646,7 @@ static int _dpu_kms_create_planes_virtual(struct dpu_kms *dpu_kms, int max_crtc_
 	catalog = dpu_kms->catalog;
 
 	/* Create the planes, keeping track of one primary/cursor per crtc */
-	for (i = 0; i < catalog->sspp_count; i++) {
+	for (i = 0; i < 2 * catalog->sspp_count; i++) {
 		enum drm_plane_type type;
 
 		if (primary_planes_idx < max_crtc_count)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 420cdd90e89b..77cb4f172379 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -292,10 +292,10 @@ static u64 _dpu_plane_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
  * _dpu_plane_set_qos_lut - set QoS LUT of the given plane
  * @plane:		Pointer to drm plane
  * @fb:			Pointer to framebuffer associated with the given plane
- * @pipe_cfg:		Pointer to pipe configuration
+ * @src_width:		Plane source width (max for both multirect planes).
  */
 static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
-		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
+		struct drm_framebuffer *fb, u32 src_width)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
@@ -309,8 +309,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 		fmt = dpu_get_dpu_format_ext(
 				fb->format->format,
 				fb->modifier);
-		total_fl = _dpu_plane_calc_fill_level(plane, fmt,
-				drm_rect_width(&pipe_cfg->src_rect));
+		total_fl = _dpu_plane_calc_fill_level(plane, fmt, src_width);
 
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
 			lut_usage = DPU_QOS_LUT_USAGE_LINEAR;
@@ -570,6 +569,9 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 		&& (src_w == dst_w))
 		return;
 
+	if (pstate->multirect_index != DPU_SSPP_RECT_SOLO)
+		return;
+
 	scale_cfg->dst_width = dst_w;
 	scale_cfg->dst_height = dst_h;
 	scale_cfg->y_rgb_filter_cfg = DPU_SCALE_BIL;
@@ -638,13 +640,16 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 
 static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 		struct dpu_plane_state *pstate,
-		const struct dpu_format *fmt, bool color_fill,
+		const struct dpu_format *fmt,
 		struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
 	struct dpu_hw_scaler3_cfg scaler3_cfg;
 	struct dpu_hw_pixel_ext pixel_ext;
 
+	if (pstate->multirect_index == DPU_SSPP_RECT_1)
+		return;
+
 	memset(&scaler3_cfg, 0, sizeof(scaler3_cfg));
 	memset(&pixel_ext, 0, sizeof(pixel_ext));
 
@@ -667,8 +672,7 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	 * bypassed. Still we need to update alpha and bitwidth
 	 * ONLY for RECT0
 	 */
-	if (pstate->pipe_hw->ops.setup_scaler &&
-			pstate->multirect_index != DPU_SSPP_RECT_1)
+	if (pstate->pipe_hw->ops.setup_scaler)
 		pstate->pipe_hw->ops.setup_scaler(pstate->pipe_hw,
 				pipe_cfg, &pixel_ext,
 				&scaler3_cfg);
@@ -723,23 +727,15 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 					&pipe_cfg,
 					pstate->multirect_index);
 
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
+		_dpu_plane_setup_scaler(pdpu, pstate, fmt, &pipe_cfg);
 	}
 
 	return 0;
 }
 
-void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
-{
-	struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
-
-	pstate->multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-}
-
-int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
+static int dpu_plane_validate_multirect_v2(struct dpu_plane_state *pstate0,
+					   struct dpu_plane_state *pstate1)
 {
-	struct dpu_plane_state *pstate[R_MAX];
 	const struct drm_plane_state *drm_state[R_MAX];
 	struct drm_rect src[R_MAX], dst[R_MAX];
 	struct dpu_plane *dpu_plane[R_MAX];
@@ -750,9 +746,17 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 	bool has_tiled_rect = false;
 
 	for (i = 0; i < R_MAX; i++) {
+		struct dpu_plane_state *pstate;
 		const struct msm_format *msm_fmt;
 
-		drm_state[i] = i ? plane->r1 : plane->r0;
+		pstate = i ? pstate1 : pstate0;
+		if (pstate == NULL) {
+			DPU_DEBUG("DPU plane state of plane id %d is NULL\n",
+				drm_state[i]->plane->base.id);
+			return -EINVAL;
+		}
+
+		drm_state[i] = &pstate->base;
 		msm_fmt = msm_framebuffer_format(drm_state[i]->fb);
 		fmt[i] = to_dpu_format(msm_fmt);
 
@@ -766,15 +770,8 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 	for (i = 0; i < R_MAX; i++) {
 		int width_threshold;
 
-		pstate[i] = to_dpu_plane_state(drm_state[i]);
 		dpu_plane[i] = to_dpu_plane(drm_state[i]->plane);
 
-		if (pstate[i] == NULL) {
-			DPU_ERROR("DPU plane state of plane id %d is NULL\n",
-				drm_state[i]->plane->base.id);
-			return -EINVAL;
-		}
-
 		src[i].x1 = drm_state[i]->src_x >> 16;
 		src[i].y1 = drm_state[i]->src_y >> 16;
 		src[i].x2 = src[i].x1 + (drm_state[i]->src_w >> 16);
@@ -784,13 +781,13 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 
 		if (drm_rect_calc_hscale(&src[i], &dst[i], 1, 1) != 1 ||
 		    drm_rect_calc_vscale(&src[i], &dst[i], 1, 1) != 1) {
-			DPU_ERROR_PLANE(dpu_plane[i],
+			DPU_DEBUG_PLANE(dpu_plane[i],
 				"scaling is not supported in multirect mode\n");
 			return -EINVAL;
 		}
 
 		if (DPU_FORMAT_IS_YUV(fmt[i])) {
-			DPU_ERROR_PLANE(dpu_plane[i],
+			DPU_DEBUG_PLANE(dpu_plane[i],
 				"Unsupported format for multirect mode\n");
 			return -EINVAL;
 		}
@@ -816,8 +813,8 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 
 	/* Prefer PARALLEL FETCH Mode over TIME_MX Mode */
 	if (parallel_fetch_qualified) {
-		pstate[R0]->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-		pstate[R1]->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+		pstate0->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+		pstate1->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
 		goto done;
 	}
@@ -827,10 +824,10 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 
 	if (dst[R1].y1 >= dst[R0].y2 + buffer_lines ||
 	    dst[R0].y1 >= dst[R1].y2 + buffer_lines) {
-		pstate[R0]->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
-		pstate[R1]->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+		pstate0->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+		pstate1->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
 	} else {
-		DPU_ERROR(
+		DPU_DEBUG(
 			"No multirect mode possible for the planes (%d - %d)\n",
 			drm_state[R0]->plane->base.id,
 			drm_state[R1]->plane->base.id);
@@ -838,13 +835,15 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 	}
 
 done:
-	pstate[R0]->multirect_index = DPU_SSPP_RECT_0;
-	pstate[R1]->multirect_index = DPU_SSPP_RECT_1;
+	pstate0->multirect_index = DPU_SSPP_RECT_0;
+	pstate1->multirect_index = DPU_SSPP_RECT_1;
+
+	pstate0->qos_src_w = max(pstate0->qos_src_w, pstate1->base.src_w >> 16);
 
 	DPU_DEBUG_PLANE(dpu_plane[R0], "R0: %d - %d\n",
-		pstate[R0]->multirect_mode, pstate[R0]->multirect_index);
+		pstate0->multirect_mode, pstate0->multirect_index);
 	DPU_DEBUG_PLANE(dpu_plane[R1], "R1: %d - %d\n",
-		pstate[R1]->multirect_mode, pstate[R1]->multirect_index);
+		pstate1->multirect_mode, pstate1->multirect_index);
 	return 0;
 }
 
@@ -928,7 +927,8 @@ static bool dpu_plane_validate_src(struct drm_rect *src,
 		drm_rect_equals(fb_rect, src);
 }
 
-int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate)
+int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate,
+		struct dpu_plane_state *prev_plane_state)
 {
 	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
@@ -936,11 +936,24 @@ int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate)
 	enum dpu_sspp pipe;
 	bool yuv, scale;
 
+	pstate->multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
 	if (pdpu->pipe != SSPP_NONE) {
 		pipe = pdpu->pipe;
 		goto out;
 	}
 
+	if (prev_plane_state &&
+	    kms->catalog->caps->smart_dma_rev != DPU_SMART_DMA_UNSUPPORTED &&
+	    !dpu_plane_validate_multirect_v2(prev_plane_state, pstate)) {
+		/* multirect capable, use the same pipe */
+		DPU_DEBUG_PLANE(pdpu, "multirect, SSPP %d\n", prev_plane_state->pipe_hw->idx);
+		pstate->pipe_hw = prev_plane_state->pipe_hw;
+
+		return 0;
+	}
+
 	yuv = pstate->base.fb ? DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(pstate->base.fb))) : false;
 	scale = (pstate->base.src_w >> 16 != pstate->base.crtc_w) ||
 		(pstate->base.src_h >> 16 != pstate->base.crtc_h);
@@ -953,6 +966,8 @@ int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate)
 	if (pipe == SSPP_NONE || pipe >= SSPP_MAX || !kms->rm.sspp_blks[pipe - SSPP_NONE])
 		return -EINVAL;
 
+	pstate->qos_src_w = pstate->base.src_w >> 16;
+
 	pstate->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
 
 	return 0;
@@ -988,7 +1003,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 		DRM_DEBUG_ATOMIC("PLANE %d released SSPP %d\n", plane->base.id, pstate->pipe_hw->idx);
 		dpu_rm_release_sspp(&dpu_kms->rm, global_state, plane->base.id);
-		pstate->pipe_hw = NULL;
+		/* do not clear pipe_hw here, use it in atomic_disable to cleanup mutlirect */
 	}
 
 	return 0;
@@ -1199,7 +1214,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				pstate->multirect_index);
 	}
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
+	_dpu_plane_setup_scaler(pdpu, pstate, fmt, &pipe_cfg);
 
 	if (pstate->pipe_hw->ops.setup_multirect)
 		pstate->pipe_hw->ops.setup_multirect(
@@ -1245,8 +1260,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		}
 	}
 
-	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
-	_dpu_plane_set_danger_lut(plane, fb);
+	if (pstate->multirect_index != DPU_SSPP_RECT_1) {
+		_dpu_plane_set_qos_lut(plane, fb, pstate->qos_src_w);
+		_dpu_plane_set_danger_lut(plane, fb);
+	}
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, true, DPU_PLANE_QOS_PANIC_CTRL);
@@ -1279,7 +1296,13 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 
 	pstate->pending = true;
 
-	pstate->pipe_hw = NULL;
+	if (pstate->multirect_index != DPU_SSPP_RECT_SOLO &&
+	    pstate->pipe_hw &&
+	    pstate->pipe_hw->ops.setup_multirect)
+		pstate->pipe_hw->ops.setup_multirect(
+				pstate->pipe_hw,
+				DPU_SSPP_RECT_SOLO,
+				DPU_SSPP_MULTIRECT_NONE);
 }
 
 static void dpu_plane_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 0940ffbb8b28..6ec7f5edc06a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -23,6 +23,7 @@
  * @multirect_index: index of the rectangle of SSPP
  * @multirect_mode: parallel or time multiplex multirect mode
  * @pending:	whether the current update is still pending
+ * @qos_src_w: src_width used for qos_lut setup
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
  */
@@ -35,22 +36,14 @@ struct dpu_plane_state {
 	uint32_t multirect_mode;
 	bool pending;
 
+	uint32_t qos_src_w;
+
 	struct dpu_hw_pipe *pipe_hw;
 
 	u64 plane_fetch_bw;
 	u64 plane_clk;
 };
 
-/**
- * struct dpu_multirect_plane_states: Defines multirect pair of drm plane states
- * @r0: drm plane configured on rect 0
- * @r1: drm plane configured on rect 1
- */
-struct dpu_multirect_plane_states {
-	const struct drm_plane_state *r0;
-	const struct drm_plane_state *r1;
-};
-
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
@@ -78,19 +71,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
 		unsigned long possible_crtcs);
 
-/**
- * dpu_plane_validate_multirecti_v2 - validate the multirect planes
- *				      against hw limitations
- * @plane: drm plate states of the multirect pair
- */
-int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane);
-
-/**
- * dpu_plane_clear_multirect - clear multirect bits for the given pipe
- * @drm_state: Pointer to DRM plane state
- */
-void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
-
 /**
  * dpu_plane_color_fill - enables color fill on plane
  * @plane:  Pointer to DRM plane object
@@ -107,7 +87,8 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
 static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
 #endif
 
-int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate);
+int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate,
+		struct dpu_plane_state *prev_plane_state);
 
 int dpu_plane_real_atomic_check(struct drm_plane *plane,
 				struct drm_atomic_state *state);
-- 
2.30.2

