Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 806BE6C274E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE4710E6B4;
	Tue, 21 Mar 2023 01:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6013B10E6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bi9so17190859lfb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7u1KWHHcBPRYaV34yLX+D6szNMMbKpRmY9dWoX1bHws=;
 b=lQArMFxdjhBFChBbiqLMaAY2r4ciqju53EXPbDLjN+rGmHlUB93SeFUG7dW57Ls1xg
 baJZpJrxbkBPSIIeT7yacQL5p6bMvluHKSIPY2Rbdtf9OF6/++J8DVTLL3As/l1RQN4z
 ezry0qADNuKOJvOE6cCvIVB0ZTbm96GTXywRQAftqiOIdumuxinSaCqhA85GdJN0xQtZ
 J/3rZH6S4wRLt5Ip/AEKUE0PqLjGFqONFbvZ1/TtOJMCZeK2F4N4ZmgA+ZZ4klES0MzL
 Vn+V0a0WJ2TaPIbF0fv/UN3Cz76cGxO4X806Jnh8hhy/kqyADqEnhUi58v4tooS/De7m
 g2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7u1KWHHcBPRYaV34yLX+D6szNMMbKpRmY9dWoX1bHws=;
 b=WDOzhC6U11aq+gBnm+Ew+ncnS74SKP7+kO8lHxQXCNPBK0z9Ahlve5gdTyHkgjiIij
 p8fcTaDJvf+wOW12ww7v2ziDTIxlfjLFiN1D88DuhTrF9JvTfx4uP5pAMFCoD5+aaPCZ
 8SmCTP+eeuFcM7qH+9Ir7FB4oJKJ5vkx2nsWHNdGxTIv+3hs427lRSNOYRpST0cxX6vp
 mHwN06cv36rIJJhUlriYRYeDhkJE8wNDDt0R1siiLb9af146DxetIEm033zd40rgE3yI
 294E9q6MYzW5LAfrOyvGmSsXEZX9vhkV+XZE5wc65H9CX3mXy38oWhi6iAwBwxT0jNmA
 362A==
X-Gm-Message-State: AO0yUKUVnaR+iuoQ/XP9dZz0y3M+OevSidldxQEJe5r3m7Jib6xNAQGj
 ysod7jaXAElGoOb2sNTNIFEgOQ==
X-Google-Smtp-Source: AK7set9WQNS+YjDayFDNYoySjliqEtR+dQ+GJ7Id9EfEmsz7AjTkrwxJp03JO8E8e/osh+1IAwCw+w==
X-Received: by 2002:ac2:4e72:0:b0:4e9:59cd:4172 with SMTP id
 y18-20020ac24e72000000b004e959cd4172mr277111lfs.0.1679361512709; 
 Mon, 20 Mar 2023 18:18:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v2 13/13] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Date: Tue, 21 Mar 2023 04:18:21 +0300
Message-Id: <20230321011821.635977-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
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

Virtual wide planes give high amount of flexibility, but it is not
always enough:

In parallel multirect case only the half of the usual width is supported
for tiled formats. Thus the whole width of two tiled multirect
rectangles can not be greater than max_linewidth, which is not enough
for some platforms/compositors.

Another example is as simple as wide YUV plane. YUV planes can not use
multirect, so currently they are limited to max_linewidth too.

Now that the planes are fully virtualized, add support for allocating
two SSPP blocks to drive a single DRM plane. This fixes both mentioned
cases and allows all planes to go up to 2*max_linewidth (at the cost of
making some of the planes unavailable to the user).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 247 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  13 +-
 3 files changed, 235 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index cdece21b81c9..7422bee8d21f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1354,7 +1354,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			 * is a shortcut. Perform actual check here, after
 			 * allocating SSPPs.
 			 */
-			rc = dpu_plane_atomic_check(plane, crtc_state->state);
+			rc = dpu_plane_virtual_atomic_check_late(plane, crtc_state->state);
 			if (rc)
 				return rc;
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ee906c276aa5..56cb03f1d393 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -840,20 +840,32 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *plane_state =
 		drm_atomic_get_plane_state(state, plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
 	const struct dpu_format *format;
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 
 	/*
-	 * Main part of checks, including drm_atomic_helper_check_plane_state()
-	 * is called from dpu_crtc_atomic_check(). Do minimal processing here.
+	 * Main part of checks is performed in
+	 * dpu_plane_virtual_atomic_check_late(), called from
+	 * dpu_crtc_atomic_check(). Do minimal processing here.
 	 */
+	ret = drm_atomic_helper_check_plane_noscale(plane_state, crtc_state,
+						    true, true);
+	if (ret) {
+		DPU_DEBUG_PLANE(to_dpu_plane(plane),
+				"Check plane state failed (%d)\n", ret);
+		return ret;
+	}
 
-	if (!plane_state->fb) {
-		plane_state->visible = false;
 
+	if (!plane_state->visible) {
 		/* resources are freed by dpu_crtc_atomic_check(), but clean them here */
 		pstate->pipe.sspp = NULL;
 		pstate->r_pipe.sspp = NULL;
@@ -861,18 +873,46 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		return 0;
 	}
 
+	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
+	/* Ensure fb size is supported */
+	if (plane_state->fb->width > MAX_IMG_WIDTH ||
+	    plane_state->fb->height > MAX_IMG_HEIGHT) {
+		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer %dx%d\n",
+				plane_state->fb->width,
+				plane_state->fb->height);
+		return -E2BIG;
+	}
+
 	format = to_dpu_format(msm_framebuffer_format(plane_state->fb));
-	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 
-	/* force resource reallocation if the format of FB has changed */
-	if (pstate->saved_fmt != format) {
+	/* force resource reallocation if the format of FB or src/dst have changed */
+	if (pstate->saved_fmt != format ||
+	    pstate->saved_src_w != plane_state->src_w ||
+	    pstate->saved_src_h != plane_state->src_h ||
+	    pstate->saved_src_w != plane_state->src_w ||
+	    pstate->saved_crtc_h != plane_state->crtc_h) {
 		crtc_state->planes_changed = true;
 		pstate->saved_fmt = format;
+		pstate->saved_src_w = plane_state->src_w;
+		pstate->saved_src_h = plane_state->src_h;
+		pstate->saved_crtc_w = plane_state->crtc_w;
+		pstate->saved_crtc_h = plane_state->crtc_h;
 	}
 
 	return 0;
 }
 
+/*
+ * Allocate backing SSPP blocks for the plane. This does not perform any
+ * additional checks on the plane, this is done in
+ * dpu_plane_virtual_atomic_check_late().
+ */
 int dpu_plane_virtual_assign_resources(struct drm_plane *plane,
 				       struct drm_crtc *crtc,
 				       struct dpu_global_state *global_state,
@@ -881,18 +921,44 @@ int dpu_plane_virtual_assign_resources(struct drm_plane *plane,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_plane_state *pstate;
 	struct drm_plane_state *plane_state;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe *r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	struct dpu_hw_sspp *hw_sspp;
-	bool yuv, scale, rot90;
+	const struct dpu_format *fmt;
+	bool yuv, scale, rot90, tiled;
+	uint32_t max_linewidth;
 
 	plane_state = drm_atomic_get_plane_state(state, plane);
 	if (IS_ERR(plane_state))
 		return PTR_ERR(plane_state);
 
-	yuv = plane_state->fb ?
-		DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(plane_state->fb))) :
-		false;
-	scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
-		(plane_state->src_h >> 16 != plane_state->crtc_h);
+	pstate = to_dpu_plane_state(plane_state);
+
+	pipe = &pstate->pipe;
+	r_pipe = &pstate->r_pipe;
+	pipe_cfg = &pstate->pipe_cfg;
+	r_pipe_cfg = &pstate->r_pipe_cfg;
+
+	fmt = to_dpu_format(msm_framebuffer_format(plane_state->fb));
+	yuv = DPU_FORMAT_IS_YUV(fmt);
+	tiled = DPU_FORMAT_IS_UBWC(fmt);
+
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &plane_state->src);
+	pipe_cfg->dst_rect = plane_state->dst;
+
+	scale = (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect)) ||
+		(drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect));
+
+	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->sspp = NULL;
 
 	rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
@@ -900,21 +966,159 @@ int dpu_plane_virtual_assign_resources(struct drm_plane *plane,
 	if (!hw_sspp)
 		return -ENODEV;
 
-	pstate = to_dpu_plane_state(plane_state);
-	pstate->pipe.sspp = hw_sspp;
+	pipe->sspp = hw_sspp;
+
+	if (drm_rect_width(&pipe_cfg->src_rect) <= max_linewidth)
+		return 0;
+
+	drm_rect_rotate(&pipe_cfg->src_rect,
+			plane_state->fb->width, plane_state->fb->height,
+			plane_state->rotation);
+
+	*r_pipe_cfg = *pipe_cfg;
+
+	pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
+	pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
+
+	if (yuv && pipe_cfg->src_rect.x2 & 0x1) {
+		pipe_cfg->src_rect.x2 -= 1;
+		pipe_cfg->dst_rect.x2 -= 1;
+	}
+
+	r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
+	r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
+
+	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth ||
+	    drm_rect_width(&r_pipe_cfg->src_rect) > max_linewidth) {
+		DPU_DEBUG_PLANE(to_dpu_plane(plane),
+				"invalid src " DRM_RECT_FMT " / " DRM_RECT_FMT " line:%u\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect),
+				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
+				max_linewidth);
+		return -E2BIG;
+	}
+
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    plane_state->fb->width, plane_state->fb->height,
+			    plane_state->rotation);
+	drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+			    plane_state->fb->width, plane_state->fb->height,
+			    plane_state->rotation);
+
+	/*
+	 * Check if we can use parallel multirect for the wide plane.
+	 *
+	 * For tiled formats there is no point in trying multirect.
+	 * In parallel multirect case only the half of the usual width
+	 * is supported for tiled formats. If we are here, we know that
+	 * full width is more than max_linewidth, thus each rect is
+	 * wider than allowed.
+	 */
+	if (!yuv && !scale && !tiled &&
+	    test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) {
+		pipe->multirect_index = DPU_SSPP_RECT_0;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		r_pipe->sspp = pipe->sspp;
+		r_pipe->multirect_index = DPU_SSPP_RECT_1;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+	} else {
+		/* multirect is not possible, use two SSPP blocks */
+		hw_sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, yuv, scale, rot90);
+		if (!hw_sspp)
+			return -ENODEV;
+
+		r_pipe->sspp = hw_sspp;
+	}
 
 	return 0;
 }
 
-int dpu_plane_atomic_check(struct drm_plane *plane,
-			   struct drm_atomic_state *state)
+int dpu_plane_virtual_atomic_check_late(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	int ret = 0, min_scale, max_scale, hscale, vscale;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct drm_crtc_state *crtc_state = NULL;
+	const struct dpu_format *fmt;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	unsigned int rotation;
+	uint32_t supported_rotations;
+	struct drm_rect src;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+
+	if (plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   plane_state->crtc);
+
+	if (!plane_state->visible)
+		return 0;
+
+	pipe_hw_caps = pstate->pipe.sspp->cap;
+	sblk = pstate->pipe.sspp->cap->sblk;
+
+	src = drm_plane_state_src(plane_state);
+	drm_rect_rotate(&src, plane_state->fb->width << 16, plane_state->fb->height << 16,
+			plane_state->rotation);
+
+	min_scale = FRAC_16_16(1, sblk->maxupscale);
+	max_scale = sblk->maxdwnscale << 16;
+	hscale = drm_rect_calc_hscale(&plane_state->src, &plane_state->dst, min_scale, max_scale);
+	vscale = drm_rect_calc_vscale(&plane_state->src, &plane_state->dst, min_scale, max_scale);
+	if (hscale < 0 || vscale < 0) {
+		drm_dbg_kms(plane->dev, "Invalid scaling of plane\n");
+		drm_rect_debug_print("src: ", &plane_state->src, true);
+		drm_rect_debug_print("dst: ", &plane_state->dst, false);
+		return -ERANGE;
+	}
+
+	fmt = to_dpu_format(msm_framebuffer_format(plane_state->fb));
+
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
+	if (ret)
+		return ret;
+
+	if (r_pipe->sspp) {
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt);
+		if (ret)
+			return ret;
+	}
+
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	rotation = drm_rotation_simplify(plane_state->rotation,
+					supported_rotations);
+
+	if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
+		(rotation & DRM_MODE_ROTATE_90)) {
+		ret = dpu_plane_check_inline_rotation(pdpu, sblk, pipe_cfg->src_rect, fmt);
+		if (ret)
+			return ret;
+	}
+
+	pstate->rotation = rotation;
+	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
+
+	return 0;
+}
+
+static int dpu_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
@@ -932,11 +1136,6 @@ int dpu_plane_atomic_check(struct drm_plane *plane,
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	if (pdpu->pipe != SSPP_NONE) {
-		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-		r_pipe->sspp = NULL;
-	}
-
 	pipe_hw_caps = pstate->pipe.sspp->cap;
 	sblk = pstate->pipe.sspp->cap->sblk;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index cb1e31ef0d3f..07e0796cc100 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -32,6 +32,10 @@
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
  * @saved_fmt: format used by the plane's FB, saved for for virtual plane support
+ * @saved_src_w: cached value of plane's src_w, saved for for virtual plane support
+ * @saved_src_h: cached value of plane's src_h, saved for for virtual plane support
+ * @saved_crtc_w: cached value of plane's crtc_w, saved for for virtual plane support
+ * @saved_crtc_h: cached value of plane's crtc_h, saved for for virtual plane support
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -51,6 +55,10 @@ struct dpu_plane_state {
 	unsigned int rotation;
 
 	const struct dpu_format *saved_fmt;
+	uint32_t saved_src_w;
+	uint32_t saved_src_h;
+	uint32_t saved_crtc_w;
+	uint32_t saved_crtc_h;
 };
 
 #define to_dpu_plane_state(x) \
@@ -106,11 +114,12 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
 static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
 #endif
 
-int dpu_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state);
-
 int dpu_plane_virtual_assign_resources(struct drm_plane *plane,
 				       struct drm_crtc *crtc,
 				       struct dpu_global_state *global_state,
 				       struct drm_atomic_state *state);
 
+int dpu_plane_virtual_atomic_check_late(struct drm_plane *plane,
+					struct drm_atomic_state *state);
+
 #endif /* _DPU_PLANE_H_ */
-- 
2.30.2

