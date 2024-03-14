Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAAD87B5AA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C44C10F088;
	Thu, 14 Mar 2024 00:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vNJT0r6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11D110EBF1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:30 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-512f892500cso457843e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374549; x=1710979349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NyH70gBQ0VtdOLbmQIMNFH5hau07nRJ94ccmDkurCw=;
 b=vNJT0r6j0ykYd82+gJB8eMQVgDSWuF7Lx2MowB6NDqEMEdlHBN2iJsDu43vcAijM93
 y7slrMVqi3ZDKMto8M9aYpQ0hYtHnT/1X7BXj90zGRJRGzYD91yiOOcjXncsim4PcV6B
 scJVsuq/mFaIPbrq7cDWjN55n6AhVz+e28qg1FsDUmV0TShL22BFeWfmNYlLJb01vjsy
 vCK7nbe3Afnn2easm3OtWB3qrwmH/+ywFZ4AYW4kjjsWV2YG1qhXy/3YRTMT16t8U994
 Daa6kKYZ78bFIXEM1OryAV2C6D6L8lYHetU9KgMAWlzT8BIWAp7ZHxrYb6AI9Z+mlhuY
 1pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374549; x=1710979349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NyH70gBQ0VtdOLbmQIMNFH5hau07nRJ94ccmDkurCw=;
 b=CGawP4hC0BTJV542SZib7RBLZCd7+3jvD8Q6mgLLCdn8cGvlRnAUPYIS74xSrDxMH/
 VlIea0X9NFk9aZWm5DoNqRfxxZ4MfquOn4sa7vWimYaiobxj7S56lzQtE1GZTOeX5kr6
 vARRRqnu89NS/tRlITdPtpAB33+d67qnCVENTG0rGVxIHKamAu5PjKMnAq/S+hkB44p0
 0QAzWVcb1tNrBE8MoDf+cfnxpwjz6JIOUs1jVwYasx0z8jlVmHvtiiFCU7Ftjie1rrXF
 k4GwFvzeT+Le96zU4HdRmNPD12Sd1BMxhg301u8EO+aQ/QoOEWoZsHxDItGahTxjXR2d
 6qYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3ORZ7q6iRqQPrPAnhFy8mmo1/4HNhIk4ocTV71io1DGsRlqU+tcfeyZqBhztpnbUjtNPAqtZcr6rpcdyYaQBDqsRCoDNhzlD/UMyeWdsR
X-Gm-Message-State: AOJu0YzMOU+tdRuT+n47QBpBGUvATOewwCjBiXeu6YthyvYKZex+swtc
 NtUcIHkpcmlPjDMwbK4GCljeRGUOjp+MSIK31/lREGm3p4uwordNTGi2C4ohy3o=
X-Google-Smtp-Source: AGHT+IFA3Dx5ozpGCZSWbfbx6oCBjyOBUbhWSz/XnE08IlR2N2DP/AnfA6vuDd6fnf0H52M4mNbo3A==
X-Received: by 2002:a19:8c13:0:b0:513:c2e3:226e with SMTP id
 o19-20020a198c13000000b00513c2e3226emr57801lfd.8.1710374548954; 
 Wed, 13 Mar 2024 17:02:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 12/13] drm/msm/dpu: allow sharing of blending stages
Date: Thu, 14 Mar 2024 02:02:15 +0200
Message-Id: <20240314000216.392549-13-dmitry.baryshkov@linaro.org>
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
index 794c5643584f..fbbd7f635d04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -445,6 +445,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
+	unsigned int stage_indices[DPU_STAGE_MAX] = {};
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
 	memset(fetch_active, 0, sizeof(fetch_active));
@@ -469,7 +470,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
 					   format, fb ? fb->modifier : 0,
-					   &pstate->pipe, 0, stage_cfg);
+					   &pstate->pipe,
+					   stage_indices[pstate->stage]++,
+					   stage_cfg);
 
 		if (pstate->r_pipe.sspp) {
 			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
@@ -477,7 +480,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
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
index 2e1c544efc4a..43dfe13eb298 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -827,13 +827,6 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
-	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
-		DPU_ERROR("> %d plane stages assigned\n",
-			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
-		return -EINVAL;
-	}
-
 	/* state->src is 16.16, src_rect is not */
 	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
 
@@ -971,6 +964,18 @@ static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
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
 
@@ -1080,6 +1085,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -1221,6 +1233,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
+	if (prev_pstate)
+		pstate->stage = prev_pstate->stage + 1;
+	else
+		pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+
 	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
 		if (!prev_pstate ||
 		    !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
@@ -1267,6 +1284,12 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 		}
 	}
 
+	if (pstate->stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+			  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
 }
 
-- 
2.39.2

