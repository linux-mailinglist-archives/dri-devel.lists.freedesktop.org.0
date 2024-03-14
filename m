Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F687B59A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E6910E9A2;
	Thu, 14 Mar 2024 00:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dmOZsZoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907F410E6B8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:27 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513c1a82b30so612588e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374546; x=1710979346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PjrhT6a27c234XDd1UAZn9+fAuU0fdQoiJECkOgv0E=;
 b=dmOZsZoDzQAd7Xj/sH/r1qZrE0ZVksgBxIrHFfySRu9rlosZUBegQyAC6tjRTWsBlh
 OKBSFwDbupHPac9IBGet1wJdW7GvARhHRvuuJQwPz9w35JmJA51vy6hiGXXnQ7YgOsJu
 QJR4jY3ucVGRuoblVC7N1Wv8lTo7w1zGFYv+ZzhprDqCrm8MHgBWpyGgGckfA/Iz/dLj
 VXAn9oWBId8Km2tUihOmSNSIcg0Pju590nxSMcWUQNhE89+v2T/qblHHKdz6F+dmAO+A
 exXT0qblqmLp0gQWCpqthez80KS46atD2maP6jEv/tjEPR7GfDv1yGUvF/yb2YxpL4Z4
 zn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374546; x=1710979346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2PjrhT6a27c234XDd1UAZn9+fAuU0fdQoiJECkOgv0E=;
 b=v3qKt8Vcex6p+eMCegI/f4++lInXtXs51KLVZLvZ1gjaZzJp7rLCd+gk3ZemSA4dTw
 K2Osaco3h6jcnNZ/B7mS1Ykv3qvUwC30+WHE7EvthZlKmJ8/SHolcr0gkoRbJOt1L3xf
 QFjGRiqigyIZVRU5SCuUwwdz10WaEd7hlXjLmOinoSqROjNyNizzumaksV4hzazZoAwU
 86SZpx2vKv5ikfITcQHOBcZUukro2FO1mXYt1snsJ+hvJ9APUwqrEWi6ZS9fJp7mXVj7
 SCqw2Ke5e2La5N1kLm8OwNY9oXSpcf5krCze8fGl4GRAeM9QR2MAP+D9GJgmM85EK/xA
 lWwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVscrc+DvplDobbYRvlp12V07BImfVEFBUTDZnfzvgW1G8/IU3leqOZ5r2zWPCx8gLPhQDRYodq6NaZLUp3ZzDpm15Sn5NvxWfMrQqQqEbF
X-Gm-Message-State: AOJu0Yx1EQMgzh6B0QAgHlUt0J1cQIEf8AEW1rJVujkeCNK0MzEu7ld0
 t5ACNuBMlT3Va4T3wGcCpsw3HCchTOgFrYEwBap0G7ibaFbJ+zPlKhkmafjLdPE=
X-Google-Smtp-Source: AGHT+IGuKR8qVbwIuDszsiEvTR2T5e9+glIc5undJ9V4gEe8zTE7KxKSDhoXQT50ghsOysn7iVRtxw==
X-Received: by 2002:a19:5f54:0:b0:513:cf61:6847 with SMTP id
 a20-20020a195f54000000b00513cf616847mr43488lfj.22.1710374545873; 
 Wed, 13 Mar 2024 17:02:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 09/13] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Date: Thu, 14 Mar 2024 02:02:12 +0200
Message-Id: <20240314000216.392549-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 172 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   8 +
 2 files changed, 131 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2961b809ccf3..cde20c1fa90d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -886,6 +886,28 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	return 0;
 }
 
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct dpu_format *fmt,
+						   uint32_t max_linewidth)
+{
+	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
+		return false;
+
+	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90)
+		return false;
+
+	if (DPU_FORMAT_IS_YUV(fmt))
+		return false;
+
+	if (DPU_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	return true;
+}
+
 static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 					struct drm_atomic_state *state,
 					const struct drm_crtc_state *crtc_state)
@@ -899,7 +921,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 	const struct dpu_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t max_linewidth;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps;
 	const struct dpu_sspp_sub_blks *sblk;
@@ -919,15 +940,8 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 	      drm_rect_height(&new_plane_state->dst))))
 		return -ERANGE;
 
-	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
-	max_linewidth = pdpu->catalog->caps->max_linewidth;
-
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
@@ -943,41 +957,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		/*
-		 * In parallel multirect case only the half of the usual width
-		 * is supported for tiled formats. If we are here, we know that
-		 * full width is more than max_linewidth, thus each rect is
-		 * wider than allowed.
-		 */
-		if (DPU_FORMAT_IS_UBWC(fmt) &&
-		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
-
-		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
-		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
-		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
-		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
-		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
-		    DPU_FORMAT_IS_YUV(fmt)) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
-
-		/*
-		 * Use multirect for wide plane. We do not support dynamic
-		 * assignment of SSPPs, so we know the configuration.
-		 */
-		pipe->multirect_index = DPU_SSPP_RECT_0;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-
-		r_pipe->sspp = pipe->sspp;
-		r_pipe->multirect_index = DPU_SSPP_RECT_1;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-
 		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
 						  &crtc_state->adjusted_mode);
 		if (ret)
@@ -998,16 +977,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	const struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	if (pdpu->pipe != SSPP_NONE) {
-		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-		r_pipe->sspp = NULL;
-	}
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
 
 	if (!pipe->sspp)
 		return -EINVAL;
@@ -1019,6 +998,52 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
+		uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+		const struct dpu_format *fmt;
+
+		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
+		/*
+		 * In parallel multirect case only the half of the usual width
+		 * is supported for tiled formats. If we are here, we know that
+		 * full width is more than max_linewidth, thus each rect is
+		 * wider than allowed.
+		 */
+		if (DPU_FORMAT_IS_UBWC(fmt) &&
+		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		r_pipe->sspp = pipe->sspp;
+
+		if (!dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) ||
+		    !dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) ||
+		    !(test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
+		      test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		/*
+		 * Use multirect for wide plane. We do not support dynamic
+		 * assignment of SSPPs, so we know the configuration.
+		 */
+		pipe->multirect_index = DPU_SSPP_RECT_0;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		r_pipe->multirect_index = DPU_SSPP_RECT_1;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
 }
 
@@ -1053,10 +1078,18 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 
 	format = to_dpu_format(msm_framebuffer_format(plane_state->fb));
 
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
@@ -1074,7 +1107,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct dpu_format *fmt;
+	uint32_t max_linewidth;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1083,6 +1119,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pstate = to_dpu_plane_state(plane_state);
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
+	pipe_cfg = &pstate->pipe_cfg;
+	r_pipe_cfg = &pstate->r_pipe_cfg;
 
 	pipe->sspp = NULL;
 	r_pipe->sspp = NULL;
@@ -1097,10 +1135,46 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
+	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+
 	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
 	if (!pipe->sspp)
 		return -ENODEV;
 
+	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
+		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		r_pipe->sspp = NULL;
+	} else {
+		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
+		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
+		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
+		     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
+			r_pipe->sspp = pipe->sspp;
+
+			pipe->multirect_index = DPU_SSPP_RECT_0;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_1;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+		} else {
+			/* multirect is not possible, use two SSPP blocks */
+			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!r_pipe->sspp)
+				return -ENODEV;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 15f7d60d8b85..5522f9035d68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,10 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @saved_fmt: format used by the plane's FB, saved for for virtual plane support
+ * @saved_src_w: cached value of plane's src_w, saved for for virtual plane support
+ * @saved_src_h: cached value of plane's src_h, saved for for virtual plane support
+ * @saved_crtc_w: cached value of plane's crtc_w, saved for for virtual plane support
+ * @saved_crtc_h: cached value of plane's crtc_h, saved for for virtual plane support
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -49,6 +53,10 @@ struct dpu_plane_state {
 	bool needs_dirtyfb;
 
 	const struct dpu_format *saved_fmt;
+	uint32_t saved_src_w;
+	uint32_t saved_src_h;
+	uint32_t saved_crtc_w;
+	uint32_t saved_crtc_h;
 };
 
 #define to_dpu_plane_state(x) \
-- 
2.39.2

