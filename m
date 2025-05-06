Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1DDAAC9F3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBDA10E6F4;
	Tue,  6 May 2025 15:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cv7w6BuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7EB10E6F4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:49:12 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b1f7357b5b6so3752813a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546552; x=1747151352; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zrSXC8CSaWVKjQd78VPB0kbH8RLAs1ZrYyrkr0ZbwVM=;
 b=Cv7w6BuRAOKCUpIyQBTLR0SSi2xdSjTfRx3SA17+65BVpnUTfHDdQpGAU0KPPiny8q
 bEAUo7LKxVioqtN7gop9hvYqIxEB2hf8UllGcukbODYPUKeTjChlt+/opHr4gnZTDIWV
 T+EIfd0oPS+QCaP+nvb8suVyECSDJkUBRvvxNw/Iv06hoWHFvqkz8psZHpSFcXHLQO9F
 yh24p/gJp85V+BQT01SbF8uz7BjL6XYStS2VEqa/5Dk9tsAa0c4BSzfplyg/9xsUVVy9
 EFv8y/vSuUd2lcmo+96InkAu1elDBEEZlWSi96SVHB6v1U+ULABMVsHCBRuCcWuDwHEb
 B2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546552; x=1747151352;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrSXC8CSaWVKjQd78VPB0kbH8RLAs1ZrYyrkr0ZbwVM=;
 b=mjEZOS9vOqwo7SdA6XVQ56j7ULvNYwMls8tSumxMKK5bmGtj7Zq1lIeLDdRv5Flh6s
 oJDAEsah+kDwOcxuWKSXWMx+MbFl+u3ljf7PDmUjaKfqS5oyvqLLDJmxZPD1YqtW8Xjx
 By3tznHd2UCKtC5eaHt9cL+WnB7q0fyi8yREkBorhAvSgU2p06EhD6ScmpzhFyFiz9uR
 dhRvZQjbKMh/6npFV+t4hRfjUH7mekcaYjrXLSkT3vENRg/+mvaY93egfjbmLTmcuTNa
 7W6z1h9cYviFxgh1rmG7GgJC7u4MBdd8lu7K+54xiXlOOCDpv3H3LdclOlTsC2FrXOR0
 V28w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgphpfLmut17opzKtz991o56e34gYLa07BBMZkphuhSxAYX7EykjVa0Wi/73dRNDVJYZt+/SP8tsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4RHaLEApX2ppXeIOi2vQweOOQHSqaGKldEv9UQAuVx+CrOQEp
 MXzCsRVZKWXwsWZx7V81tFBex5zUv35+Gxt9pJl5T3kHbpHwl2oni21OvZNKXJk=
X-Gm-Gg: ASbGncuk1UPahK4FXA8N1Re8zkP0PKgdfyrA8636FWCfplPfzyihwZCiaf3y1D4wTNi
 rARLZLxElOR9upP4XsKZnwC8eF+Kg6vn2cq5Fnp9WGrrt1aeU5V8Vlw42njToBiQUv/tYaZe7Lr
 fjvGggAXfxjAFVhi5fEJKc8LZjyFVOTufcDxsxQD5Q0pCAPThPTYm3aIC+fW9vA9EOSsCmcZOvq
 6s+a/TZjb+KVecN7OmzvijbP6f3aAtpa9ZZXav2d/qRE1dlewjZFLbKUfkDzLwo113jIYyCwpXl
 G2NHmX+LIPYpjKES686GfkjLq3rAeSFVBPmUjUwt9njgyrQD
X-Google-Smtp-Source: AGHT+IEBtFUXnS8dAqCaKYwBMhrZN6VksI4/OB2wRMlUXMc8hMijAv8x2Gw5tGgKsiddLUp1u2GH+g==
X-Received: by 2002:a17:90b:4f42:b0:2ee:d433:7c50 with SMTP id
 98e67ed59e1d1-30a7f32d52dmr3266079a91.23.1746546551917; 
 Tue, 06 May 2025 08:49:11 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:49:11 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:41 +0800
Subject: [PATCH v9 11/14] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-11-f7b273a8cc80@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=5139;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=YY4sN7xbdWZfp/Re8KSXr3eEbiH28FLdUnNLnDHq/Fs=;
 b=z59G7UE5c0GyBKTeFnQwFKcjApDR+0lwb5J5NlTIgLOyaebWwCy1yru4Z6Ij39Ii/NPgHJU6u
 /cM6a61HOxsAtthaf/+zLI5heopnu59LwU+sNb+NQVDkPhV5j6PJAoV
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

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array
size STAGES_PER_PLANE and blend pipes per mixer pair with configuration in
the stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 +-
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d710b4eec7ad946a4cf74d6ac5f4db90e8dcf1fd..f35cb1f7a7d2c2c63b4228bc47b85bb57cddbe6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -392,7 +392,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct drm_plane *plane,
 				       struct dpu_crtc_mixer *mixer,
-				       u32 num_mixers,
+				       u32 lms_in_pair,
 				       enum dpu_stage stage,
 				       const struct msm_format *format,
 				       uint64_t modifier,
@@ -426,7 +426,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+	for (lm_idx = 0; lm_idx < lms_in_pair; lm_idx++)
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
@@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_pair;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +463,24 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			head_pipe_in_stage = stage * PIPES_PER_STAGE;
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + head_pipe_in_stage;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				lms_in_pair = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
+						  PIPES_PER_STAGE);
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[head_pipe_in_stage],
+							   lms_in_pair,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +512,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +525,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +544,12 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * stage data is shared between PIPES_PER_STAGE pipes.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index b0ed41108a32158c0bc3be2e25fc229b218fd6c5..7c74221380b2c05225c9f82ed6d33765042aec78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,8 +34,9 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define PIPES_PER_PLANE			2
+#define STAGES_PER_PLANE		1
 #define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif

-- 
2.34.1

