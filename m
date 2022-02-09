Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4E4AF854
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B68610E411;
	Wed,  9 Feb 2022 17:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9FD10E4DB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:40 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f18so5495964lfj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d78NmTZxF3lIUQQ6J9uVt2AAFNRK9vuPInuNHE0VCs0=;
 b=aoZs4GfhJHliytiNP7wiOnoc2GYXr7zygfHwEr0jTtiEM65wwLeJ3ffrqaIwpzQvv6
 ATD2MnpH7tSbb+r/HuStWNngK/yZITfqzAZ1RhHMKOlMlbfKgkZTbYbNok6sqbMa4UuM
 ZeIgURQX8FP/IEpxw+4Il0SxoCyZbCk1Pw2pREl4mwx0zyXU9cugP8MS8E23o+kXV7z0
 1e9wuD0ror8h9F766MpgWYq+y/UGYSNEwUf6S6dHUX7nxk3xqa/UfaMSF9Tay0mYmg8n
 DDBZf0Nj2Tp35F1qyRBIvxZojQ+cvlHcabNOKj0hiyi/ErBoE0SoFMs9gi+T8GGPxfa2
 HR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d78NmTZxF3lIUQQ6J9uVt2AAFNRK9vuPInuNHE0VCs0=;
 b=fJdXbC4WqXBUXoHWcPZ2dGi2UfItCdAqpW+e7D4qAF2fwpKt7PnCrNXmJOkDwbwBYm
 1RC7HrW5PQd0eU54fXkG7ItJr8VTFQHGjTD67dZIr0dHU8lN94QurygO6gPAycVOo9j2
 BwOmyfvqj0mBHshz8lwckAQkopwInVK3NDtl4N7PNfHk1tTvlxTKCOiQYk6RjCr7exUe
 2wwJA7HWXgJ8MXDI8XoB4+JXpgIVn89pu7AipmG4N4WMmdH6MachMj3CufAKQT1R1N2f
 rhQrH8NxfAa//KARGwGQCGH/xCr2veXWg74I/RoYvUYnugUtbZgrYHXzHLlTGH0Kg/2W
 zSFw==
X-Gm-Message-State: AOAM533SCUdTNKiFdXdXwX+jlOn62qe8/niS7wZvKccl+MuzHwZSIfTn
 DhaBlzKw4M0/KXjgW/98D1xYrA==
X-Google-Smtp-Source: ABdhPJyzWBiuRvysqviEsBy95NOS3Mxq5bWOXWv8TWNHQM5cQoPHJHuFZRgeqN5ks3Umd6C7fKewvQ==
X-Received: by 2002:a19:7604:: with SMTP id c4mr2231111lff.65.1644427538802;
 Wed, 09 Feb 2022 09:25:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 18/25] drm/msm/dpu: move the rest of plane checks to
 dpu_plane_atomic_check()
Date: Wed,  9 Feb 2022 20:25:13 +0300
Message-Id: <20220209172520.3719906-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove plane checks/state updates from dpu_crtc_atomic_check(). The
belong to dpu_plane_atomic_check().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 44 -----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ----
 3 files changed, 10 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index cbd0e50c2bd3..fa279f0358d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1054,14 +1054,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
 
-	const struct drm_plane_state *pstate;
-	struct drm_plane *plane;
 	struct drm_display_mode *mode;
 
 	int rc = 0;
 
-	struct drm_rect crtc_rect = { 0 };
-
 	if (!crtc_state->enable || !crtc_state->active) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
@@ -1080,46 +1076,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (cstate->num_mixers)
 		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
 
-	crtc_rect.x2 = mode->hdisplay;
-	crtc_rect.y2 = mode->vdisplay;
-
-	 /* get plane state for all drm planes associated with crtc state */
-	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
-		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
-
-		if (IS_ERR_OR_NULL(pstate)) {
-			rc = PTR_ERR(pstate);
-			DPU_ERROR("%s: failed to get plane%d state, %d\n",
-					dpu_crtc->name, plane->base.id, rc);
-			return rc;
-		}
-
-		dpu_plane_clear_multirect(pstate);
-
-		dst = drm_plane_state_dest(pstate);
-		if (!drm_rect_intersect(&clip, &dst)) {
-			DPU_ERROR("invalid vertical/horizontal destination\n");
-			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
-				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
-				  DRM_RECT_ARG(&dst));
-			return -E2BIG;
-		}
-
-		z_pos = pstate->normalized_zpos;
-
-		/* verify z_pos setting before using it */
-		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
-			DPU_ERROR("> %d plane stages assigned\n",
-					DPU_STAGE_MAX - DPU_STAGE_0);
-			return -EINVAL;
-		}
-
-		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
-		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
-
-	}
-
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
 
 	rc = dpu_core_perf_crtc_check(crtc, crtc_state);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b2395f02f6d3..637d164667e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -702,14 +702,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	return 0;
 }
 
-void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
-{
-	struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
-
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-}
-
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 {
 	struct dpu_plane_state *pstate[R_MAX];
@@ -931,6 +923,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	if (pstate->stage >= DPU_STAGE_MAX) {
+		DPU_ERROR("> %d plane stages assigned\n",
+				DPU_STAGE_MAX - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	src.x1 = new_plane_state->src_x >> 16;
 	src.y1 = new_plane_state->src_y >> 16;
 	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index b6fd6f856d6a..e61c57b045ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -83,12 +83,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
  */
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane);
 
-/**
- * dpu_plane_clear_multirect - clear multirect bits for the given pipe
- * @drm_state: Pointer to DRM plane state
- */
-void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
-
 /**
  * dpu_plane_color_fill - enables color fill on plane
  * @plane:  Pointer to DRM plane object
-- 
2.34.1

