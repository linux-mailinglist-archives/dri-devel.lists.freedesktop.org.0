Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B79AF611
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 02:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218FD10E9B4;
	Fri, 25 Oct 2024 00:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b/O8ypY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3B410E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:20:30 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539ebb5a20aso1523742e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729815629; x=1730420429; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KO6tGe2ER49LXcluNu17KTFPHL2OyyMJep0BHriGxwY=;
 b=b/O8ypY+J6E4ssRF/MyDw2MmckY2DHzbViE0H8l84D8Yd2NL7l9jnOdhbaM3RsUq4O
 ezwourd44QstTOjobatcnRzYTv0SIkGSR7TX8Z17uxajeEBm7hSNSfBpv/Nz5TpM0Q5u
 NiixPXbXBRrh6AFdjK1KaeEs2zEWtDU3ZJI4idNUC2O0QT4ZQUkepCBxZoEvLoX3t6Ot
 GliF9i/0TX7+zP0KYIrNjpJEL1jyTQaMvSnIPEiztkIQFTcwQ7ud7zDsQoXkHHVjP8na
 KxlHM/KKlKLr8vleWlN0n7GPeqPW3XTzo/xqparioibviEZvG4FwDkZgJNJmuizBmQjW
 va0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729815629; x=1730420429;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KO6tGe2ER49LXcluNu17KTFPHL2OyyMJep0BHriGxwY=;
 b=m4KToqhnFf1TD7Zr6izyazB+bfYdOIkNush3gFTjgNkXEQjw2RFHQ4EjjCdRoGC7vY
 FbLP7+GXmFVqDr2R5NqN5aCMlUkdDf1obdDQaAKcx9yh6F6GE/IDefeNJoddkR3dgpGt
 yhNoWDeiBDOP7fofdrxsasoW9jt6HM24rq11HF9ZMCyFgEhcKKQ5LSa6Y5uw+gwdkoz3
 xdAnoGmGItHpmROTy6xYFWqPx4ZQAsfPPgNqZoRruuv/LtkVkuiNScEy5ys5jRlK3EhV
 l67ANJkygxYnRZNaScWcwPfhO1mMHNO/3TBkkgNsx02IYKx1b+aezzCwaWuoPy8fZjfc
 GwDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi4hLL6naiuIUFGMlqBYjlt1Lk9chYDYv84iTfHyOjUrZkpkbsWebVl8FdEUF9VhVzYYRo77b1mUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUK4hXZZ6cGUeqx3K9mrtjqTMWyWn0CGFIryD0B7tzA/I0lstP
 O8tYynI0Y0yHTKIH03VWAEseeYk/QJdytoAfT9Dnszc7Sgz/b+LbIIvIQGzF3Vo=
X-Google-Smtp-Source: AGHT+IGfyBlLtbqDWxKwQGgOA2KcexfhVeaOdZ6Z5GcuRdstl3UDMNGnnoW+X59H/Zcpq7+J6YRtAQ==
X-Received: by 2002:a05:6512:1250:b0:539:959e:f0e8 with SMTP id
 2adb3069b0e04-53b1a3115bcmr5162203e87.21.1729815628520; 
 Thu, 24 Oct 2024 17:20:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 17:20:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:15 +0300
Subject: [PATCH v6 8/9] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-8-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10756;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4qNpQUOhNNwVlHnVY+cep13TqyWzrHpO52v1B/hEeg8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ7JWBdORKrPuu9KuvRBASndaP/1geNPHWah
 HTAHwaUCVmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOwAKCRCLPIo+Aiko
 1QNRB/4lF91qmZEYWpZkSHR8uuFgIrbwF5xpmMIVwV5ptnwhbuqg7WVio3sYqR4BEqtKh8pYUQv
 Tp1FtAL24INDRHdQVmsUSoc1Ef2yrg/fr2vaM2pvvUeqHU67NGiWcELV/54duV24QBdn/WTJds2
 wDJh56DbH3Veqfwn2hhyriwwlk2tawiBQ0wV1GiSHxfpSr5A7+RJm9vrT3+w0S8HFlyTaFJg22G
 XeW6ijz9hutpTf0sa0OCjSPCcJ69W6sgoEfZ84tQt8nL63KP3emep0tN4GU9ODgAhKF22pmsiFG
 rB/y4fOdj3kIvYFK+vqkiYkdcR3/uEdOl2A290xAUaIhaw5m
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 163 ++++++++++++++++++++++--------
 1 file changed, 119 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 125db3803cf5..ad6cc469f475 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -20,7 +20,6 @@
 #include "msm_drv.h"
 #include "msm_mdss.h"
 #include "dpu_kms.h"
-#include "dpu_formats.h"
 #include "dpu_hw_sspp.h"
 #include "dpu_hw_util.h"
 #include "dpu_trace.h"
@@ -888,6 +887,28 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	return 0;
 }
 
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct msm_format *fmt,
+						   uint32_t max_linewidth)
+{
+	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
+		return false;
+
+	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90)
+		return false;
+
+	if (MSM_FORMAT_IS_YUV(fmt))
+		return false;
+
+	if (MSM_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	return true;
+}
+
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
 				       const struct drm_crtc_state *crtc_state)
@@ -901,7 +922,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t max_linewidth;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps;
 	const struct dpu_sspp_sub_blks *sblk;
@@ -923,8 +943,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
-	max_linewidth = pdpu->catalog->caps->max_linewidth;
-
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
@@ -940,41 +958,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		/*
-		 * In parallel multirect case only the half of the usual width
-		 * is supported for tiled formats. If we are here, we know that
-		 * full width is more than max_linewidth, thus each rect is
-		 * wider than allowed.
-		 */
-		if (MSM_FORMAT_IS_UBWC(fmt) &&
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
-		    MSM_FORMAT_IS_YUV(fmt)) {
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
@@ -995,16 +978,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -1021,6 +1004,49 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
+		uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+		const struct msm_format *fmt;
+
+		fmt = msm_framebuffer_format(new_plane_state->fb);
+
+		/*
+		 * In parallel multirect case only the half of the usual width
+		 * is supported for tiled formats. If we are here, we know that
+		 * full width is more than max_linewidth, thus each rect is
+		 * wider than allowed.
+		 */
+		if (MSM_FORMAT_IS_UBWC(fmt) &&
+		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
+		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
+		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
+		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
+		    MSM_FORMAT_IS_YUV(fmt)) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		/*
+		 * Use multirect for wide plane. We do not support dynamic
+		 * assignment of SSPPs, so we know the configuration.
+		 */
+		r_pipe->sspp = pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_0;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		r_pipe->multirect_index = DPU_SSPP_RECT_1;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+	}
+
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 
@@ -1054,8 +1080,16 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		return 0;
 	}
 
-	/* force resource reallocation if the format of FB has changed */
+	/*
+	 * Force resource reallocation if the format of FB or src/dst have
+	 * changed. We might need to allocate different SSPP or SSPPs for this
+	 * plane than the one used previously.
+	 */
 	if (!old_plane_state || !old_plane_state->fb ||
+	    old_plane_state->src_w != plane_state->src_w ||
+	    old_plane_state->src_h != plane_state->src_h ||
+	    old_plane_state->src_w != plane_state->src_w ||
+	    old_plane_state->crtc_h != plane_state->crtc_h ||
 	    msm_framebuffer_format(old_plane_state->fb) !=
 	    msm_framebuffer_format(plane_state->fb))
 		crtc_state->planes_changed = true;
@@ -1075,7 +1109,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct msm_format *fmt;
+	uint32_t max_linewidth;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1084,6 +1121,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pstate = to_dpu_plane_state(plane_state);
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
+	pipe_cfg = &pstate->pipe_cfg;
+	r_pipe_cfg = &pstate->r_pipe_cfg;
 
 	pipe->sspp = NULL;
 	r_pipe->sspp = NULL;
@@ -1098,10 +1137,46 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
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
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 

-- 
2.39.5

