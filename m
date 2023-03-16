Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139E46BD682
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D88E10EDEC;
	Thu, 16 Mar 2023 16:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428EE10ED8F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:55:56 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id l22so2365760ljc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678985754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLR+3xKuB7nKvcFlrwQcVeNzdFj2pHbl4n7fAtnTorc=;
 b=nRWDyVnY7VcuhaZvlem2FuvqIXO0w0uRnBImYu660LU+0dQ1wC2jHHAgdyMsZSXtr8
 RGrtRMgBXXozVmkujZNksUVhxBnxApMvEec0tkfxaZQTvSD5hBTCUNYqKnt5l4Mu/awZ
 XNUeVTCDCom1YHrvkhtARZHDF5UGa4m0QF31Eoxp9g4tdN0uPjBXpTRIZG7YvvNXpULH
 G/PI3MILW5KxvvDz/+onjoj/9K2jN8NyOET0LmUqgHz6p2tG5JFKKQHvzUCQTYkh1SvY
 zQxhnIUYkQkiZDgkfPpSXpU2+yUY6MW2Rqk3bvkAesD7xzOWErxxBCYrkz5ES7Cd5lsJ
 Zkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678985754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLR+3xKuB7nKvcFlrwQcVeNzdFj2pHbl4n7fAtnTorc=;
 b=A5v/GoO1Y8Lk5pJc/bgsrnUTARPK3viG/9Sgney+W7fphuvUFAEz8fhL+F+eruJlxK
 vB4bZxVyoerGKNk2ZOlFOSZodQl/rCmNPZqwEKFgrmMV66DfttByS0RHHFFD6JL91ozl
 Il5uhvOiymmg9OhidaMySD1NJAGlI0ZIzsouwQYgK7wS4nsebmQEKML+6XIBezFcj2bJ
 NGaSMhsk9D3pbQI9nHJGm8kRL140EqcIiyWinVUKjOPSluXfQlo2N2qK8ey/PxtP03M5
 91ACZvuvlSSfagmZhWzo86ZpF8eTHrlEhzI5qbPUwGT/uNpBxlZ1nJmScT+cfNyH1CMX
 AJvg==
X-Gm-Message-State: AO0yUKWpm0ZAxnMGYxAdLhCLdwx8oriU7fJB7PSgItmCXrHyy6PJKBiU
 91D0AZMHxc0ZKP89/ZMONFSdBQ==
X-Google-Smtp-Source: AK7set+XKntDkC/4LYVhwjiyclZwfQySyr72BT1hExf1WFY3nWpshgnpN/0X3+W+ZKc+w6EbaqufbA==
X-Received: by 2002:a2e:bc28:0:b0:290:4e1c:96c9 with SMTP id
 b40-20020a2ebc28000000b002904e1c96c9mr2853207ljf.32.1678985754314; 
 Thu, 16 Mar 2023 09:55:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:55:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v1 12/12] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Date: Thu, 16 Mar 2023 19:55:42 +0300
Message-Id: <20230316165542.4109764-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
References: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 236 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  13 +-
 3 files changed, 227 insertions(+), 24 deletions(-)

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
index 787e81740eb9..3bd3951d9ffa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -844,16 +844,27 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
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
@@ -861,18 +872,46 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
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
-	if (pstate->saved_fmt ! = format) {
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
@@ -881,25 +920,185 @@ int dpu_plane_virtual_assign_resources(struct drm_plane *plane,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_plane_state *pstate;
 	struct drm_plane_state *plane_state;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe *r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	struct dpu_hw_sspp *hw_sspp;
-	bool yuv, scale;
+	const struct dpu_format *fmt;
+	bool yuv, scale, tiled;
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
+	pipe_cfg->src_rect = plane_state->src;
+
+	/* state->src is 16.16, src_rect is not */
+	pipe_cfg->src_rect.x1 >>= 16;
+	pipe_cfg->src_rect.x2 >>= 16;
+	pipe_cfg->src_rect.y1 >>= 16;
+	pipe_cfg->src_rect.y2 >>= 16;
+
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
 
 	hw_sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, yuv, scale);
 	if (!hw_sspp)
 		return -ENODEV;
 
-	pstate = to_dpu_plane_state(plane_state);
-	pstate->pipe.sspp = hw_sspp;
+	pipe->sspp = hw_sspp;
+
+	if (drm_rect_width(&pipe_cfg->src_rect) <= max_linewidth)
+		return 0;
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
+		hw_sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, yuv, scale);
+		if (!hw_sspp)
+			return -ENODEV;
+
+		r_pipe->sspp = hw_sspp;
+	}
+
+	return 0;
+}
+
+int dpu_plane_virtual_atomic_check_late(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	int ret = 0, min_scale, max_scale, hscale, vscale;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct drm_crtc_state *crtc_state = NULL;
+	const struct dpu_format *fmt;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	struct drm_rect fb_rect = { 0 };
+	uint32_t max_linewidth;
+	unsigned int rotation;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+
+	if (plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   plane_state->crtc);
+
+	pipe_hw_caps = pstate->pipe.sspp->cap;
+	sblk = pstate->pipe.sspp->cap->sblk;
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
+	if (!plane_state->visible)
+		return 0;
+
+	fmt = to_dpu_format(msm_framebuffer_format(plane_state->fb));
+
+	max_linewidth = pdpu->catalog->caps->max_linewidth;
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
 
 	return 0;
 }
@@ -930,11 +1129,6 @@ int dpu_plane_atomic_check(struct drm_plane *plane,
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

