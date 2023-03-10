Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498E86B3340
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE51D10E92B;
	Fri, 10 Mar 2023 00:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD79210E91D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:20 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id r27so4588537lfe.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhVs4vt0TafHFP/4BzDwPQBBm+kjTcr7bWFE2MoX3Rw=;
 b=L7dpV6Ug7ZUYL7Qm7B/XAimtkW/maLUVJL2cTFBBZMOrQTXlNoz340CglujoZQyox8
 c2MC9dzxHJWp3lWqAo+aYSDSNUhkXDKZ5+JMEjYLGste27uxVWtwzP3uI53HO2qLTGVl
 RU/T3MFu1+9YmA1qSn3RWbV7UdHBZMSGf57QRpvaOLsp/Y9HICYo+epQTJMwpLhwygDL
 witvL/6T3NjmZIm3etqdu+DH25Sk24gJktBvWViHWUSTI4aXVS6KJNLk5st5uf66sRgo
 KmQoQHBL6byNM9f4TEFRpryjUvlCsPKh4kInRABGnNHCjr7qYFqRSXmelqtBgwasIFho
 qi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZhVs4vt0TafHFP/4BzDwPQBBm+kjTcr7bWFE2MoX3Rw=;
 b=i6QYxiPN24wcCd19XWOkg2kNMOvlslnUb8CCjZ+lQC/Ivv6Xw+JfwWDwXcDNlQdhA8
 Qf3RciyCMdNRFD6yAsLm09Ng6wuyrlyn3ZDhfDrm6MnsejngEKU3j9zV65sf/xBYLMQB
 8l6LHQWpLXG7ulTp3xwAWwNAfECBA86kLqDWFeqelvm8StVcgIaBt1g5zFt1zuvFMIK8
 3pR0oj6ExSo55JubuaQq4WjDq3POaWA2n07wYb1bVZd0/A4cyHM1iCkFt88gIgOBjAhN
 AMhtkhNWLLlRJgAtt/SJQSxFhn0D4XRwI8dJW6DpNAtIRU2qom7JqQVD4lvD3JpDis14
 a17Q==
X-Gm-Message-State: AO0yUKWojKlfyXP4TGIri3cIImxdfqnRgwi40kFVTxItjJs5K1wjujdW
 0TK43JKgtBivhlX2n2BtwgefRg==
X-Google-Smtp-Source: AK7set9k0BLuenbgXSwuCtiR2TbPRTyN6IwkhTrC0p3K9sGy2XMAxdfPyAuLjhWXd8nIr4NAexjGXA==
X-Received: by 2002:ac2:5451:0:b0:4de:2650:b4c8 with SMTP id
 d17-20020ac25451000000b004de2650b4c8mr7452214lfn.24.1678409840338; 
 Thu, 09 Mar 2023 16:57:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 16/32] drm/msm/dpu: move the rest of plane checks to
 dpu_plane_atomic_check()
Date: Fri, 10 Mar 2023 02:56:48 +0200
Message-Id: <20230310005704.1332368-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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

Move plane state updates from dpu_crtc_atomic_check() to the function
where they belong: to dpu_plane_atomic_check().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
 3 files changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0260c4d6ded7..bd09bb319a58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1129,7 +1129,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
-	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1161,11 +1160,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	crtc_rect.x2 = mode->hdisplay;
 	crtc_rect.y2 = mode->vdisplay;
 
-	 /* get plane state for all drm planes associated with crtc state */
+	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1179,8 +1177,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
-		dpu_plane_clear_multirect(pstate);
-
 		dst = drm_plane_state_dest(pstate);
 		if (!drm_rect_intersect(&clip, &dst)) {
 			DPU_ERROR("invalid vertical/horizontal destination\n");
@@ -1189,18 +1185,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 				  DRM_RECT_ARG(&dst));
 			return -E2BIG;
 		}
-
-		/* verify stage setting before using it */
-		stage = DPU_STAGE_0 + pstate->normalized_zpos;
-		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
-			DPU_ERROR("> %d plane stages assigned\n",
-				  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
-			return -EINVAL;
-		}
-
-		to_dpu_plane_state(pstate)->stage = stage;
-		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
-
 	}
 
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ce01a602cbc9..3fba63fbbd78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -733,14 +733,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
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
@@ -994,6 +986,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	src.x1 = new_plane_state->src_x >> 16;
 	src.y1 = new_plane_state->src_y >> 16;
 	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 228db401e905..a08b0539513b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -88,12 +88,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
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
2.39.2

