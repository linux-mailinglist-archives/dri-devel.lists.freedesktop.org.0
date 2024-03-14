Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A887B5A8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5431410EBF1;
	Thu, 14 Mar 2024 00:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lTQuc/Vb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E1B10E711
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:28 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-513c1a82b30so612604e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374547; x=1710979347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkVn674vUD7EPt+lgPohg2m9UJkSbMPId/q0P1tsdBY=;
 b=lTQuc/VbDT30V1S1QaSs2ll6nVlmUdlySCfqViIB2XxKYNewFpdZ7pKZcZUT9LQtpz
 qZAKYY2cG9m43NymKiAicmb4a8AXQFw57IanYGxyyYr0+S4JqeQwlD740Otu/uf5TVIr
 FGfUhuDdHXJhkTnjhtY/VInL0lEOtwhzhTzsqMXipb+MmG8x45nuclEvDye6TgAK3Wto
 rraTITucyLDfnjYBBBIrYZu36U18Mk+QmZISOOfZbnwm/jNVWvJe8MYUI5O7ev5gTOTf
 jKEPH6uy5bRGCzd5vpjDaoQz/eTUwpuOaKH7Kf6KlR3Qsedyn4NIDs/uFFSWZLaJrbcI
 kEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374547; x=1710979347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkVn674vUD7EPt+lgPohg2m9UJkSbMPId/q0P1tsdBY=;
 b=wqJWTUczmXvFG/avAYhGdhahX4eKZ6nMba0Gerz68NvIzNgSClIJXirfLOJvisk5zb
 eiI1IeyCB4YdssAnsEYoO5HL25Fhj2onRZ7EszWS7dqSmX5AGgEXzE0tGPBFUqQHw43C
 004k3kV7/dMbrNN6th6IqnmdIP6yDeKPkgQGhBMXW0YGJRNfifvSUxAvqGpkG3W9XrqR
 +BfNKqCk4+1B0FQWSIOsZQmaEc4PM5io6kmb0tiJgZ/05Iv1QfoGgKCuIgOOGlMUQ4ke
 oCsjLzMLFeb8GB923lBAxLY/EUBguDQwvtdGWzEKTo2AzTcjHb5BBkShY9W86T4rj9Mb
 ml3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWUnSHdykmco7qxsIkpfxMptQbHfqHsEIORkPLYtj+FppyXrMkUjWNfukOKXcXxWdxcKPkzDVUFDhF+ql4LRFHuReOY5O2Fc0P6SosDyfH
X-Gm-Message-State: AOJu0YwWUXSWi+CbQJtPXyCzEclNO78YhX+LAYD3BfIlE1yrgnnXQAP/
 ZGA0OufW/2vVLBpmUbr1Fw+L7694VLowsEgWNTPdBZWI7lAr+iW1PMYf8HRlLqo=
X-Google-Smtp-Source: AGHT+IGjyhST2MEHmYm8qVlyj0FWIeE/08ge6huKoEyo0olLDE/jvx+pxdZ6fNV30wgDZS8F53SIJQ==
X-Received: by 2002:a05:6512:3095:b0:513:c174:c3f6 with SMTP id
 z21-20020a056512309500b00513c174c3f6mr41441lfd.40.1710374546958; 
 Wed, 13 Mar 2024 17:02:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 10/13] drm/msm/dpu: allow sharing SSPP between planes
Date: Thu, 14 Mar 2024 02:02:13 +0200
Message-Id: <20240314000216.392549-11-dmitry.baryshkov@linaro.org>
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

Since SmartDMA planes provide two rectangles, it is possible to use them
to drive two different DRM planes, first plane getting the rect_0,
another one using rect_1 of the same SSPP. The sharing algorithm is
pretty simple, it requires that each of the planes can be driven by the
single rectangle and only consequetive planes are considered.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 128 +++++++++++++++++++---
 1 file changed, 112 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index cde20c1fa90d..2e1c544efc4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -886,10 +886,9 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	return 0;
 }
 
-static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
-						   struct dpu_sw_pipe_cfg *pipe_cfg,
-						   const struct dpu_format *fmt,
-						   uint32_t max_linewidth)
+static int dpu_plane_is_multirect_capable(struct dpu_sw_pipe *pipe,
+					  struct dpu_sw_pipe_cfg *pipe_cfg,
+					  const struct dpu_format *fmt)
 {
 	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
@@ -901,6 +900,13 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
 	if (DPU_FORMAT_IS_YUV(fmt))
 		return false;
 
+	return true;
+}
+
+static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
+					 const struct dpu_format *fmt,
+					 uint32_t max_linewidth)
+{
 	if (DPU_FORMAT_IS_UBWC(fmt) &&
 	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
 		return false;
@@ -908,6 +914,82 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
 	return true;
 }
 
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct dpu_format *fmt,
+						   uint32_t max_linewidth)
+{
+	return dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) &&
+		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
+}
+
+
+static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
+				   struct dpu_plane_state *prev_pstate,
+				   const struct dpu_format *fmt,
+				   uint32_t max_linewidth)
+{
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe *prev_pipe = &prev_pstate->pipe;
+	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_pstate->pipe_cfg;
+	const struct dpu_format *prev_fmt =
+		to_dpu_format(msm_framebuffer_format(prev_pstate->base.fb));
+	u16 max_tile_height = 1;
+
+	if (prev_pstate->r_pipe.sspp != NULL ||
+	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
+		return false;
+
+	if (!dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) ||
+	    !dpu_plane_is_multirect_capable(prev_pipe, prev_pipe_cfg, prev_fmt) ||
+	    !(test_bit(DPU_SSPP_SMART_DMA_V1, &prev_pipe->sspp->cap->features) ||
+	      test_bit(DPU_SSPP_SMART_DMA_V2, &prev_pipe->sspp->cap->features)))
+		return false;
+
+	if (DPU_FORMAT_IS_UBWC(fmt))
+		max_tile_height = max(max_tile_height, fmt->tile_height);
+
+	if (DPU_FORMAT_IS_UBWC(prev_fmt))
+		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
+
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	r_pipe->sspp = NULL;
+
+	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
+	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
+	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
+	     prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		return true;
+	}
+
+	if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
+	    prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		return true;
+	}
+
+	return false;
+}
+
 static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 					struct drm_atomic_state *state,
 					const struct drm_crtc_state *crtc_state)
@@ -1098,13 +1180,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
-					      struct drm_plane_state *plane_state)
+					      struct drm_plane_state *plane_state,
+					      struct drm_plane_state *prev_plane_state)
 {
 	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
-	struct dpu_plane_state *pstate;
+	struct dpu_plane_state *pstate, *prev_pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
@@ -1117,6 +1200,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
+	prev_pstate = prev_plane_state ? to_dpu_plane_state(prev_plane_state) : NULL;
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
 	pipe_cfg = &pstate->pipe_cfg;
@@ -1137,19 +1221,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
 	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (!prev_pstate ||
+		    !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			r_pipe->sspp = NULL;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
 
-		r_pipe->sspp = NULL;
 	} else {
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
+			return -ENODEV;
+
 		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
 		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
 		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
@@ -1186,6 +1278,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 {
 	unsigned int i;
 	int ret;
+	struct drm_plane_state *prev_plane_state = NULL;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1195,9 +1288,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			continue;
 
 		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
-							 state, plane_state);
+							 state, plane_state,
+							 prev_plane_state);
 		if (ret)
 			break;
+
+		prev_plane_state = plane_state;
 	}
 
 	return ret;
-- 
2.39.2

