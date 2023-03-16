Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16C6BD675
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E549689AC3;
	Thu, 16 Mar 2023 16:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D8E10ED88
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:55:51 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x36so2377258ljq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678985751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rC5x9PPF7sivNtqd2Nq3a/pO80auqySsk0aVFQXcuEM=;
 b=VLLubm5h3A9bFuWJ5ER2e85wz/pNxKve8mexaNkrtE2kw937XvbATuqzaDLH3do19e
 X9XVRng+9wS17isZ+YVVIId+qrmNhpiWYQI0zbdYCEzE/aa9sdIYQnrN9hdbrdIHWjiI
 90vgEU8HYXckDpbaJ+txZaRc27WYXd4hlXJhXvbRSwObSSmuwQyDPqF3CP/UvDHuS8Of
 mmBQq2+h63cGrWygYQHy+Og/jUiYNjSmVoZn68PDwCI+okr6zvg5R77hUbbOTFBSrsff
 Q0RHQ7LMxxo9D4iJOO+LzPj80so4zhTlttzd81rzjsLYpdUDq0wckUc9L0aikeRiKJ+a
 Edug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678985751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rC5x9PPF7sivNtqd2Nq3a/pO80auqySsk0aVFQXcuEM=;
 b=B0bwkv4RqZSERIVQni6Y6aOd89DysCP4s6QRrCA7u6Y4pQfeMQMRQTE40WqEeSwVT+
 RRLhIv1PZt85T2o369xr/ko8yncyy01P8E1tUa3TtFBjRX5omsxdwnX2jOiU0/JJoPTV
 Vd8Q65z56EkOGEoVxIx4gVFlvL78NKtyF2AJY5W2zJAnWd853k2urXwYt1ib67Lg++GT
 ovqs1SbhWeuY1JXneQxv3CLT+MYdbjH4CH3TlPegme4CO3fokKjIazv2btEN+LDcbxU9
 1Bs7nS0N85Imu6Gy43bJSV0uiidTVLRYWU9aIgb+PC7RfAQeeEX97gWlPvbnhkwaO9wQ
 LxUQ==
X-Gm-Message-State: AO0yUKXl9Uth745vOjh38dgmJcTJ2vPy8smoWaSjLBB8k/TSl9dek3n5
 ClQISq4YtXt5Xtt/luWIekVXkw==
X-Google-Smtp-Source: AK7set+RRxwZtYI01vM1dsBA4QgFuF9qKW7jeDf6lgm4a7JyvpWQrh7ApfrXE9ih2+GMKyEWtPq9Cw==
X-Received: by 2002:a05:651c:19a4:b0:295:b0aa:978a with SMTP id
 bx36-20020a05651c19a400b00295b0aa978amr32537ljb.6.1678985751013; 
 Thu, 16 Mar 2023 09:55:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:55:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v1 08/12] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
Date: Thu, 16 Mar 2023 19:55:38 +0300
Message-Id: <20230316165542.4109764-9-dmitry.baryshkov@linaro.org>
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

In preparation to virtualized planes support, move pstate->pipe
initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
case of virtual planes the plane's pipe will not be known up to the
point of atomic_check() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2e63eb0a2f3f..1b11c9476fb3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -845,6 +845,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
@@ -855,13 +856,19 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
+	pipe_hw_caps = pstate->pipe.sspp->cap;
+	sblk = pstate->pipe.sspp->cap->sblk;
+
 	min_scale = FRAC_16_16(1, sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -878,7 +885,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1367,7 +1373,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1389,16 +1394,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
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
2.30.2

