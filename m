Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F6ACC0ED
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C27910E691;
	Tue,  3 Jun 2025 07:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uA1PwuDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFBA10E6A7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:11:35 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-742af84818cso3515321b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934695; x=1749539495; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iqHkt4ZGNL+3tDYfg5V4rpXNLmwpH40P5PYVLkKSXx0=;
 b=uA1PwuDBFs1za4ABAXwcGwQoAPETL0Xk3BOA+ky9TuZ5UCdHcmnVosjB8OKPj6r4+w
 BLH4+orI4uk26B6ix+fWXcA7JMD7VUTzbeIlf/XxZ71VzKdAhWr2b8nSs9wtkPzx/P4t
 dUECrEvw+tZKULMNDth5c7LGG8LXDyKAAK8zNFZUrEcRazh7C5SC3wqRMiuRUWNCLnA1
 m/ctm1iNRi+mPJUaMAM5D8gpokVAWW6J07LdjamclkCMmm8zMEKz1ESnfa2CDzvQFgK5
 BUpaULsJTsWP2Xjm62UfYunS2tpoqIDpdet6vBGTXTielZ2IxIMyiU9p+wour0HpoZUz
 Bifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934695; x=1749539495;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqHkt4ZGNL+3tDYfg5V4rpXNLmwpH40P5PYVLkKSXx0=;
 b=E7zDy4OxJSNJUjuxqEh3H8sK63z4Na+bbrO+QTHTe22x7Qrhjv7mT39iLmyvikF6wX
 Dy20DA8Y3IYq5lJaTYomXabZq0GzvngUj+NRU4bbd7P5o6kydMXPz+ao24tGQTO100s4
 SGZykUCZ1sXPazbfuAA4r/a4xKf2rNbbq3TprQs4Y3rvw3YvTMhkGgWdoSPv9bvp6JtO
 G/SRjI45Lj0iEw7+HT0vayt5Xc+txesXzOcrRabLj3lXfn1YuPo9mlv33+z8+70kUhjk
 wu3DLaaJdOZscmh13xk7KU+zwx4T+IZ8kvJ890DenpfyW7tSgeuIk2n11cYqt/ECJ5v4
 rdug==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1kC+sjLjlCHwRvIq5VABAyAa1SqSwzERFoBXhjkbUrwx9k8jKFmumzzwyp9vQNC0loZ1Nni99BUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq+AngdatfXQZvkVoF9PpXHGnuYr0AZV9bcAuwOaGLYBtrRLDK
 LGviTX9CsiX7Z7BmCRKVNJxWek2DOsnh6YTaaDRcz7bc5PxM5NGvKrxvvPiX1Qn5z8s=
X-Gm-Gg: ASbGnct5U5u4L+8f9nVmKQTgY3Hs1PUcS7E8RnGcZ0CN1m+GVBz0hfnFVGLn7qy/xe6
 j/HY5bWtd1GC+BZuCysE//uR0wGZY88CmMZgusQ17jbUcfVCdPbsyoVCzKNzswpdk39A/LB2qud
 Mqkg5Qbp5cFpATiuxmJYrqGS2oHy4dd48QvzGIzd+6j8HjcD0Yqls/drJ3McBQgFpWBKZRrvulL
 7LSXJnSbpGAa1VqgtLpUICO2IjnLUXOT44GjpDc6tQ4s8NWe7BY1vDQx+fNCmIgugZKP4WrsNMr
 /GdP+2Jd4z2pciqbdKcA2UXVbcDX0HGLKxAIHY+ycKp5YaV60w==
X-Google-Smtp-Source: AGHT+IE0cKN4aWF4OP9YolseV4jjv7hUddnD61d843Hi14zGR2S1e8YizkRfust+NhWy/7IseSjSMw==
X-Received: by 2002:a05:6a00:88e:b0:73e:2d76:9eb1 with SMTP id
 d2e1a72fcca58-747bd96bb7bmr19774685b3a.10.1748934695360; 
 Tue, 03 Jun 2025 00:11:35 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:11:34 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:09 +0800
Subject: [PATCH v11 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=8402;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=FXOnL3R5uQl4eFOsJMlFc1wDdgAy74j9iSMVkIWJbCQ=;
 b=A+X5RbNoPpPyW5ruTW9xLFLeQaqnvoADN3UrmSrGA+gxp4NJj3Br1zf4ewa2A2HXZK8vun03n
 QLsoU/78T1qCZNXfWgeZa7FXBqwM9DfHYrP1JpUmEIKQvKw/Jm57oPL
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Currently, SSPPs are assigned to a maximum of two pipes. However,
quad-pipe usage scenarios require four pipes and involve configuring
two stages. In quad-pipe case, the first two pipes share a set of
mixer configurations and enable multi-rect mode when certain
conditions are met. The same applies to the subsequent two pipes.

Assign SSPPs to the pipes in each stage using a unified method and
to loop the stages accordingly.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 148 +++++++++++++++++++-----------
 1 file changed, 94 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 0bb153a71353ca9eaca138ebbee4cd699414771d..501b6a1bad4a1fee832f15efa7caec136a669da5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
 }
 
+static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
+				      struct dpu_sw_pipe **single_pipe,
+				      struct dpu_sw_pipe_cfg **single_pipe_cfg,
+				      bool config_pipe)
+{
+	int i, valid_pipe = 0;
+	struct dpu_sw_pipe *pipe;
+
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
+		if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
+			valid_pipe++;
+			if (valid_pipe > 1)
+				return false;
+			*single_pipe = &pstate->pipe[i];
+			*single_pipe_cfg = &pstate->pipe_cfg[i];
+		} else {
+			if (!config_pipe)
+				continue;
+			pipe = &pstate->pipe[i];
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			pipe->sspp = NULL;
+		}
+	}
+
+	return true;
+}
 
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
@@ -1028,15 +1055,15 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 					  const struct msm_format *fmt,
 					  uint32_t max_linewidth)
 {
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
-	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
+	struct dpu_sw_pipe *pipe, *prev_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
 	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
 	u16 max_tile_height = 1;
 
-	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
+	if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, true))
+		return false;
+
+	if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe, &prev_pipe_cfg, false) ||
 	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
 		return false;
 
@@ -1050,11 +1077,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 	if (MSM_FORMAT_IS_UBWC(prev_fmt))
 		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
 
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	r_pipe->sspp = NULL;
-
 	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
 	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
 	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
@@ -1183,6 +1205,51 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static int dpu_plane_try_multirect_in_stage(struct dpu_sw_pipe *pipe,
+					    struct dpu_sw_pipe_cfg *pipe_cfg,
+					    struct drm_plane_state *plane_state,
+					    struct dpu_global_state *global_state,
+					    struct drm_crtc *crtc,
+					    struct dpu_rm_sspp_requirements *reqs)
+{
+	struct drm_plane *plane = plane_state->plane;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_sw_pipe *r_pipe = pipe + 1;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
+	int i;
+
+	for (i = 0; i < PIPES_PER_STAGE; i++, pipe++, pipe_cfg++) {
+		if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+			continue;
+
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
+		if (!pipe->sspp)
+			return -ENODEV;
+
+		/*
+		 * If current pipe is the first pipe in a stage, check
+		 * multi-rect opportunity for the 2nd pipe in the stage.
+		 * SSPP multi-rect mode cross stage is not supported.
+		 */
+		if (!i &&
+		    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+		    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+						      pipe->sspp,
+						      msm_framebuffer_format(plane_state->fb),
+						      dpu_kms->catalog->caps->max_linewidth)) {
+			goto stage_assinged;
+		} else {
+			/* multirect is not possible, use dedicated SSPP */
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
+	}
+
+stage_assinged:
+	return 0;
+}
+
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
@@ -1195,11 +1262,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
 	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct msm_format *fmt;
-	int i;
+	int i, stage_id, ret;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1209,11 +1274,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	prev_adjacent_pstate = prev_adjacent_plane_state ?
 		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1227,44 +1287,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
-		if (!prev_adjacent_pstate ||
-		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
-						    dpu_kms->catalog->caps->max_linewidth)) {
-			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!pipe->sspp)
-				return -ENODEV;
-
-			r_pipe->sspp = NULL;
-
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-		}
-	} else {
-		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!pipe->sspp)
-			return -ENODEV;
-
-		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-						      pipe->sspp,
-						      msm_framebuffer_format(plane_state->fb),
-						      dpu_kms->catalog->caps->max_linewidth)) {
-			/* multirect is not possible, use two SSPP blocks */
-			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!r_pipe->sspp)
-				return -ENODEV;
-
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	if (prev_adjacent_pstate &&
+	    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
+					    dpu_kms->catalog->caps->max_linewidth)) {
+		goto assigned;
+	}
 
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-		}
+	for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
+		pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
+		pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
+		ret = dpu_plane_try_multirect_in_stage(pipe, pipe_cfg,
+						       plane_state,
+						       global_state,
+						       crtc, &reqs);
+		if (ret)
+			return ret;
 	}
 
+assigned:
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 

-- 
2.34.1

