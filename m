Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0279F9DA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5194310E504;
	Thu, 14 Sep 2023 05:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5025E10E4FD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:13 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bfc68be09bso4967961fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668031; x=1695272831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plrluv5QV8EPu2mUJr8YqU8PvbWDvsdMpqG8T+T+sN8=;
 b=Ij5xf0hKDn6sUdjTivFlFWfUKeOh6IxqxXa58yWI/KfPI33lrPUHuu0/dBu3B0XKuF
 jIosdUzEthH6hKvqTrxLhnR5LUReEe7Oq8vBT7OGuv07sxVdjeutlPW9XmyaFQC6hfUI
 WF5lQ9DQHk3cIRPovvYf8WJzinL9qbY1Fb7XaWO5fQcvLt589rogxUerBEflPQ9jXv02
 hcydK2VlC3Own7hliGSdQ1v2dhkqgURE0Y6HuJglvH884ILSwdJ3aDkhdzgAA5tY5mAZ
 TQngJJHnOpFMEop/9ysxoSnFKv7q4BalBnHI7BqsQI8bt/U/jsLmoBMpD+0sK4lO46Gt
 8gqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668031; x=1695272831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=plrluv5QV8EPu2mUJr8YqU8PvbWDvsdMpqG8T+T+sN8=;
 b=qenyaJrBiboJNMqJS0uzJg+BleWAsx1UM92JMfdRYazGBeSGvUA6ZFpBeGXbJB5q0L
 4hjUyMfRpj0RD2weFWBVRYXqcD1gjY/iiGSrkcgIF68gndZJS+RAXzv1EzA2YBRTsVRg
 aicZHGg6qE/yR8UpqvfL4K+pkgX9tqJJLlou5rU14B0+tF0Z2bbnqzNusdndDiHIijCG
 bgWtUMMCe6fMjOLv06Ieu7+g+PqoJlLxQpNwPACGIwliTpwq1H04lhdff6DnSMSm/+el
 AeTygFlfgWWNEmv5c6rIUfgbRE3F9GwHVGL8ln+IYALowNCmQRXxOPcTt8YTGrv3+rRA
 v1tw==
X-Gm-Message-State: AOJu0YyYgC7KmaB1FXv0ByS8aI/whtHrqfvQb4qjn9EZmAYrST6YPnuH
 3BfWiklz0TIy3Wzswhnd1tYufw==
X-Google-Smtp-Source: AGHT+IHPmITUAbGJTINrlVxZxGUD11N+A3ABBhpQJSR+Sp6EAE1W7ImEI847Ug7zcvatgNaa8bNgsQ==
X-Received: by 2002:a2e:a372:0:b0:2bf:af6e:9420 with SMTP id
 i18-20020a2ea372000000b002bfaf6e9420mr193041ljn.19.1694668031454; 
 Wed, 13 Sep 2023 22:07:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 05/12] drm/msm/dpu: split dpu_plane_atomic_check()
Date: Thu, 14 Sep 2023 08:06:59 +0300
Message-Id: <20230914050706.1058620-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
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

Split dpu_plane_atomic_check() function into two pieces:

dpu_plane_atomic_check_nopipe() performing generic checks on the pstate,
without touching the associated pipe,

and

dpu_plane_atomic_check_pipes(), which takes into account used pipes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 178 ++++++++++++++--------
 1 file changed, 112 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3a75c474c4cd..4b1fbe9dbb3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -777,46 +777,20 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	return 0;
 }
 
-static int dpu_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_atomic_state *state)
+static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
+					 struct drm_plane_state *new_plane_state,
+					 const struct drm_crtc_state *crtc_state)
 {
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
-	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct drm_crtc_state *crtc_state = NULL;
-	const struct dpu_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
 	uint32_t max_linewidth;
-	unsigned int rotation;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
+	int ret = 0;
 
-	if (new_plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   new_plane_state->crtc);
-
-	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	r_pipe->sspp = NULL;
-
-	if (!pipe->sspp)
-		return -EINVAL;
-
-	pipe_hw_caps = pipe->sspp->cap;
-	sblk = pipe->sspp->cap->sblk;
-
-	min_scale = FRAC_16_16(1, sblk->maxupscale);
-	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
-						  min_scale,
-						  sblk->maxdwnscale << 16,
-						  true, true);
+	ret = drm_atomic_helper_check_plane_noscale(new_plane_state, crtc_state,
+						    true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
 		return ret;
@@ -824,11 +798,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
 		DPU_ERROR("> %d plane stages assigned\n",
@@ -847,8 +816,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
-
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	/* state->src is 16.16, src_rect is not */
@@ -861,6 +828,77 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 			new_plane_state->rotation);
 
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		*r_pipe_cfg = *pipe_cfg;
+		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
+		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
+		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
+		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
+	} else {
+		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
+	}
+
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe_cfg->src_rect.x1 != 0)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
+	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
+
+	return 0;
+}
+
+static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state =
+		drm_atomic_get_new_plane_state(state, plane);
+	int ret = 0, min_scale, max_scale;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct dpu_format *fmt;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	uint32_t max_linewidth;
+	unsigned int rotation;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
+	min_scale = FRAC_16_16(1, sblk->maxupscale);
+	max_scale = sblk->maxdwnscale << 16;
+
+	ret = drm_atomic_helper_check_plane_scale(new_plane_state, min_scale, max_scale);
+	if (ret)
+		return ret;
+
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
+	max_linewidth = pdpu->catalog->caps->max_linewidth;
+
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
+	if (ret)
+		return ret;
+
+	if (r_pipe_cfg->src_rect.x1 != 0) {
 		/*
 		 * In parallel multirect case only the half of the usual width
 		 * is supported for tiled formats. If we are here, we know that
@@ -873,12 +911,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 			return -E2BIG;
 		}
 
-		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
-
 		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
 		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
@@ -900,26 +932,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe->multirect_index = DPU_SSPP_RECT_1;
 		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
-		*r_pipe_cfg = *pipe_cfg;
-		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
-		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
-		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
-		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
-	}
-
-	drm_rect_rotate_inv(&pipe_cfg->src_rect,
-			    new_plane_state->fb->width, new_plane_state->fb->height,
-			    new_plane_state->rotation);
-	if (r_pipe->sspp)
-		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
-				    new_plane_state->fb->width, new_plane_state->fb->height,
-				    new_plane_state->rotation);
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
-	if (ret)
-		return ret;
-
-	if (r_pipe->sspp) {
 		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt);
 		if (ret)
 			return ret;
@@ -941,11 +953,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	}
 
 	pstate->rotation = rotation;
-	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 
 	return 0;
 }
 
+static int dpu_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	int ret = 0;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct drm_crtc_state *crtc_state = NULL;
+
+	if (new_plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   new_plane_state->crtc);
+
+	if (pdpu->pipe != SSPP_NONE) {
+		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+		r_pipe->sspp = NULL;
+	}
+
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	ret = dpu_plane_atomic_check_nopipe(plane, new_plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	if (!new_plane_state->visible)
+		return 0;
+
+	return dpu_plane_atomic_check_pipes(plane, state);
+}
+
 static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
 {
 	const struct dpu_format *format =
-- 
2.39.2

