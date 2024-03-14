Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62E87B59F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F7D10F312;
	Thu, 14 Mar 2024 00:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="huwWpatl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BB510E432
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:22 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-513cc23b93aso551439e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374540; x=1710979340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XNr6KKW37IazWI0ZJpFV5pkj9zPRMLRzsCadh2vfcc=;
 b=huwWpatlakx1MtQOp9RHRjCvls6wXOCwiAiDNZF0l4qfE+BDRS854cwoTKZOd+ZL/O
 pwtzUdCZy+ZVXOJAwOvQmWxj2Ll2VLTIyJu1f06qA98eaD/fXwYVcqq4Lx3HfgfBQwS2
 Vooj5oYcKnqmLqyqMXDqyN2nhNCM4s0GdDqPifxgoMIhgxNHgoaoEeqd4RBxP9KxAnhI
 /Is8Bc9oMlF85OEzpijLbiQAZIVLKFEVLf1mrn0jNYKDxr20N8oAhGDhl8LrYx8hCP97
 IUwtrsieH3k3xIsXm5M66VL3zTN0tq8fY050qvnaUsoWysIlSNT/IgE9gNY91mW8zH2y
 yTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374540; x=1710979340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/XNr6KKW37IazWI0ZJpFV5pkj9zPRMLRzsCadh2vfcc=;
 b=akkt+sWSn4nKQ6ikVaTPRX+b7zADmS/NWmMTURrKu40BAMX9UF1xzcxOGetTn9i0H1
 GebRe8nUux58HxTSYnLuxF5d3OG/qpQKfYE8E1eBvKCgD1j/Jqh5Kl73YretARstnI8o
 xcz7sxO2qhXqNjVj3lGZgzg8E3rrGNk8OT3U/H+YjK+4g7W+5AT3zSZ1QlX3TCs/t+dQ
 GiAt0Xt/9sSKCTiyrH6ytQJQeSPJLBcudkbOHtltT20P9A0HYelh2+EyEw5KNZVgaNq2
 qw6o3GomSFPfDdVXETgJeWsay+elI4XiANo9+FPxPWYw9Kr2cqteKkCna+r+t2Z19bLv
 4Yeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW9MbMe1S2vrOk6yh32jvRTfup0gQibbZZKpUCxTKG08j3P4rvSg8CUOXTvVk6lzjfyANuJ0Osvvao3w1ASUkbt8ZYnVFKMperWLJPGLAP
X-Gm-Message-State: AOJu0Ywah6iQ0hF7D8+T5xHtpkP0UzJ8M17CKbpDlTyZBFbHhcNJ+iXI
 XEkQXuQiDrp3cM/CmmiKvCQtMArTJJDrw67UnsVntPbTsNjApbKSrluAHupdUhM=
X-Google-Smtp-Source: AGHT+IGMZ6cQE2t+Zj2q16bpR1SktpXUJO2yjIiNo+IjHXUThHSVFo6j+i9y23ceYGZIyS/MkUo/RA==
X-Received: by 2002:ac2:5b45:0:b0:513:c429:c04e with SMTP id
 i5-20020ac25b45000000b00513c429c04emr38800lfp.33.1710374540483; 
 Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 03/13] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
Date: Thu, 14 Mar 2024 02:02:06 +0200
Message-Id: <20240314000216.392549-4-dmitry.baryshkov@linaro.org>
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

In preparation for virtualized planes support, move pstate->pipe
initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
case of virtual planes the plane's pipe will not be known up to the
point of atomic_check() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9c52fe3c0261..70d6a8989e1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -795,6 +795,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
@@ -805,13 +806,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
-	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
+
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
 	min_scale = FRAC_16_16(1, sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -828,7 +838,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1292,7 +1301,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1314,16 +1322,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	/*
-	 * Set the SSPP here until we have proper virtualized DPU planes.
-	 * This is the place where the state is allocated, so fill it fully.
-	 */
-	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	pstate->r_pipe.sspp = NULL;
-
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 
-- 
2.39.2

