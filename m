Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AD679F9E4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BDF10E510;
	Thu, 14 Sep 2023 05:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96ED10E502
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:17 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bfb0a2682fso8073641fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668036; x=1695272836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ng3rBeSQ/W+G7uWpNI7jELlTn6jgRfXd01MrnHQQlow=;
 b=IMdi39+mOzcFQPgijwfHBxyH/BHWixgbjRSXY7Cgv3xYT7+HDAHCyQaFXMrL7K9Pao
 rNL88PpM5MR4IofIytnRAYnW2mi6eDTXo8SGl3rlXrnE75DJxg/rTKHVyt3yfd2qQy2O
 L3igfVhNYlp1b1CyHVNA5agpPysPItQbo9l1CZHFgGNsP8NXn6WHSh20zR90WQKFVE30
 snEJeSDPzIjNyKvnS0NrA+1Ubs2JmHGVOcYnaC9aM/cam1ITEKs+ToqBuR/VgTI6stis
 GUN51TWJcgpR7aeE4GIEOuwuDk6K+tP+U2PgnLGHlvEOcknLGStiLheucayRCrKDnbsb
 eh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668036; x=1695272836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ng3rBeSQ/W+G7uWpNI7jELlTn6jgRfXd01MrnHQQlow=;
 b=RdDDxxC9E+8BxoEzu7yxoqj7sK9UaX91uUKa1FocWV8BSnAJItbNoUx2Z4ZWg3Ua6C
 Ns14W6Hl5Y8FvgzhD15Gyt+TqdBNqwiaoiD9POoGPq6e1Gnu/1RNnumk6/aHfijS0aiT
 v4Dz8WXdFlAZFVsjwmmncItYFYsBmhgytawOdg8ZydmFWpzIJZeHys+Q20gxYdFIgnQa
 B/c+eM8KNMQXyMhxbc+hheeFV0VIk0Lm6z7sPFBxn4FTL0OIe7h/rNKLrWNBPAUTWiwi
 2+OxaGesT/MO232IUb7emD62B7CTX2bgYqkb9Tc7xSiohQ8NVyrmR4H8W4AxnrcYDR3w
 TF2Q==
X-Gm-Message-State: AOJu0Yzr3kXFoN+2WhNalcZJPZv9KTuHRp3AuB47fLIpvoIcvzLRn7Hy
 OiVfc67SJeVtyS3TuxgALkusHQ==
X-Google-Smtp-Source: AGHT+IGaNLvdD/ESWuuLXBV0BWRXSIv6/PYuDxqDQWUJCk5sLLdobUXlj3d01Q6c3DqHwTqQgtqoyg==
X-Received: by 2002:a05:651c:451:b0:2bc:b8f5:aaf1 with SMTP id
 g17-20020a05651c045100b002bcb8f5aaf1mr3724104ljg.35.1694668036226; 
 Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 11/12] drm/msm/dpu: allow sharing of blending stages
Date: Thu, 14 Sep 2023 08:07:05 +0300
Message-Id: <20230914050706.1058620-12-dmitry.baryshkov@linaro.org>
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

It is possible to slightly bend the limitations of the HW blender. If
two rectangles are contiguous (like two rectangles of a single plane)
they can be blended using a single LM blending stage, allowing one to
blend more planes via a single LM.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 37 ++++++++++++++++++-----
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index df4c2e503fa5..4b5b2b7ed494 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -456,6 +456,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
+	unsigned int stage_indices[DPU_STAGE_MAX] = {};
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
 	memset(fetch_active, 0, sizeof(fetch_active));
@@ -480,7 +481,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
 					   format, fb ? fb->modifier : 0,
-					   &pstate->pipe, 0, stage_cfg);
+					   &pstate->pipe,
+					   stage_indices[pstate->stage]++,
+					   stage_cfg);
 
 		if (pstate->r_pipe.sspp) {
 			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
@@ -488,7 +491,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
 						   format, fb ? fb->modifier : 0,
-						   &pstate->r_pipe, 1, stage_cfg);
+						   &pstate->r_pipe,
+						   stage_indices[pstate->stage]++,
+						   stage_cfg);
 		}
 
 		/* blend config update */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 61afd1cf033d..e7a157feab22 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -809,13 +809,6 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
-	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
-		DPU_ERROR("> %d plane stages assigned\n",
-			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
-		return -EINVAL;
-	}
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -952,6 +945,18 @@ static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
 		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
 		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
+		if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
+		    pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
+		    pipe_cfg->dst_rect.x1 == prev_pipe_cfg->dst_rect.x2) {
+			pstate->stage = prev_pstate->stage;
+		} else if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
+			   pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
+			   pipe_cfg->dst_rect.x2 == prev_pipe_cfg->dst_rect.x1) {
+			pstate->stage = prev_pstate->stage;
+			pipe->multirect_index = DPU_SSPP_RECT_0;
+			prev_pipe->multirect_index = DPU_SSPP_RECT_1;
+		}
+
 		return true;
 	}
 
@@ -1054,6 +1059,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
@@ -1189,6 +1201,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
+	if (prev_pstate)
+		pstate->stage = prev_pstate->stage + 1;
+	else
+		pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+
 	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
 		if (!prev_pstate ||
 		    !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
@@ -1235,6 +1252,12 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 		}
 	}
 
+	if (pstate->stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+			  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state);
 }
 
-- 
2.39.2

