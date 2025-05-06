Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DF9AAC9F6
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627CB10E6DC;
	Tue,  6 May 2025 15:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yzrWGONr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6DD10E6DC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:49:19 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b1396171fb1so3527032a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546559; x=1747151359; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y4adXkuA0Ut1yoGju9UZ6d3zlzbJKQf/iksrtQL/Cz4=;
 b=yzrWGONr87wsuan26sXJplLSvXyAh9nLUNFNxMZamvzRucu+zsz2HIQGYVV9M2MC1Q
 3+0pPBefvPO2i/1AGD0+ervr3mfe7T0fjSFTNvEjePimwU8X/JUj60bhedYOtNWUI4rc
 bsl6qWVpi0nQUxHLbcCH1efK66bKb8nrmrtA7uq718ul7qyheVwlpK7TNVbUieAJF/6x
 sL/6eYYrXTNVVjaUPUWJMg/T99MesINivMt67eMC4AKgBYzjyauesrQlW68aldYmVbyt
 Y3Gcgmn2f3ywxMbFBVyUYuKAYYSbOy2n1XDKuUFtlxwCF0mxxUQo3VJqbOTXUyiqe1l/
 APFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546559; x=1747151359;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4adXkuA0Ut1yoGju9UZ6d3zlzbJKQf/iksrtQL/Cz4=;
 b=gbHlvQHoBU9Qoc/iJSvdXb7D0pu/lpGcXKjAcvVkk2ScCcdj8zy51dhijJZtUJ1iwA
 MIj3oxOxCNiLkRm24opfHbuxYHNGA/aFl9fD7+aCQ8CKYiCnQimx5mMilkfYVVS3XqLO
 K9WC+hNJWYpMtxS0SnJArRbFMmvY/10gAWSjAE5ueq6invqSKbe8vVrUUkWDHw81cZCy
 jgWxQ7D4JEqMnIGFtfeZAtjQu2HRQnkMnrn44zYTPdzIHSCTojFzSds2nHpVSczMaDz4
 BF2jay2XjIGjT8KQyXKtiztangml0ecHJIeMcc3CslIEj5Pd0YpmKY1O4dk8ts2aVkuT
 jVQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWByCx8mmKO0KvFrJt+Nz1eMBRoWCcgFx1+5GQS2P2SDV9tFwhvEY+cuyYl7Tnp84n0CMXe3kVvOts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP+u0BTGgR1OzNSMyWFuy2XwyQ1+j5CuyoGBnHKLGMHlMrBKx6
 HDXWovpfgFWb5Cfx5p/NINnUQX4DGUPGFdXOFGp7s9laZoxOqNrctn/ht5xHzD8=
X-Gm-Gg: ASbGncuJZeYSxwm/rSogwQbUW7grFS/nHFdZRRmJrQXk5V6vdxhJwfGoNmn1Yb77jli
 Rsyxbllab9HMTuJleClk9VHdFW+e+ZrEtOi1qj8WVHUOxNHeMNJvCW/NxVp4gvYVXg+iSC6BQAG
 QA1ARudlCpfTD9x0nc4SC0ZtLOlVmZAsKeWnPxkAaJijM7x32ouPT5g+5UdbeYLoD1CYb0IdXxd
 DhOr8ECckIw2Pm9ptkhDgkS0HRmT3pv2+L2WAqgkl0rW/UVLL2qb6oLYHcI/2TzxvlSy8WhcidZ
 TbOPfBVCfG+MzCFhgPigv7CzX5JFxJyH4DSalw==
X-Google-Smtp-Source: AGHT+IFzsDNJefDFD1dPV6NizI/CiNwMisjKagajmP84vghYxSNrs3kBlttCjBT8EkKabBGKqjyB6g==
X-Received: by 2002:a17:90b:2f10:b0:2ee:d63f:d8f with SMTP id
 98e67ed59e1d1-30a6197d927mr17191166a91.13.1746546559235; 
 Tue, 06 May 2025 08:49:19 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:49:18 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:42 +0800
Subject: [PATCH v9 12/14] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-12-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=4243;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2mKqRS34Z84UH7CQAO59n/IZlDeuxLXIr1MCB9xV8r0=;
 b=0SPMajJzrRWad99g1YRN0moRSfl4vZYh0dg2S/muHYhxTVT9WoMSc+kI8XigzmmnNnPMy00Oa
 COT8yBYUlUnBnmFBGlNKKqEufLkFcHSCK6g1NhYPHll7bdujEQS2P41
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 68 +++++++++++++++++++------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ea7e3fdf52f726737941ad33218a843dca17280b..de3f52d743e1d1f11ae8721a316b9872d4139069 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1112,11 +1112,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1124,11 +1123,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1142,24 +1136,46 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
-			return -ENODEV;
-
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	num_stages = (num_lm + 1) / 2;
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
+			struct dpu_sw_pipe *r_pipe;
+			struct dpu_sw_pipe_cfg *r_pipe_cfg;
+
+			pipe = &pstate->pipe[i];
+			pipe_cfg = &pstate->pipe_cfg[i];
+
+			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			r_pipe = &pstate->pipe[i + 1];
+			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if ((i % PIPES_PER_STAGE == 0) &&
+			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+							      pipe->sspp,
+							      msm_framebuffer_format(plane_state->fb),
+							      dpu_kms->catalog->caps->max_linewidth)) {
+				i++;
+			} else {
+				/* multirect is not possible, use two SSPP blocks */
+				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+						pipe->sspp->idx - SSPP_NONE, i);
+			}
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);

-- 
2.34.1

