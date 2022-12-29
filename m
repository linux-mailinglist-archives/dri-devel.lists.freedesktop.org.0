Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B90659106
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF31710E235;
	Thu, 29 Dec 2022 19:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CF010E21C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:12 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j17so19247417lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HZvAhIcCvTuY1772qgTfDmlfw3PveCe2fLJ0nn71tE=;
 b=PSd+ik6NLa/0+70GkPEfL3ZceykxEx9i+s6QpWxeG73sn1Ls8hHObhvLKiqGNCJR5O
 X7pdk76/98rASjRgDSDn7YKqT1l5BSIQ0Z1sbF/J3ewDG6kASOcXVAVsfxmU8hKxBfq7
 P27YnCx/3z4qkyExERlZpNzXjp1Ztxlua77uF8cod4FdYH8YqMeQte79MfTz+vuTYK2L
 OZJaWOIHK+EHuJ/QCt1QYQusF81zCNcJ87H00QgtaPz/KtsWGJ8Zm3qIpTnDNWqGxSlL
 9k3qMrFOWLwl9BIyzvdKfw450Bi68rsEP8NsdTqNMQSJsvEWKP366y27laF06zLm0Nl+
 hJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2HZvAhIcCvTuY1772qgTfDmlfw3PveCe2fLJ0nn71tE=;
 b=IR7KSZ/sCvurjf7tPbmsJbwVKLGSNb6XwvHrtMTpvy0qLKGSZc3abZ2GY9LnBzGOlw
 2scuR95BBaSIixBYre5NSeKcZfTBVeHuv9zffKay5TsHafUnzAwvdUfouVNbnbpOqarn
 0XYEJgFiSWLwYRfbT3Sb7vfDcDh8Yrw+fC/GW7sfRdqHALp7R3osZGXRZRCypblpbWWW
 I9P0su+mYTlAamAX+Wvng4A3adFVZ8j6pCA4nStixZhgT79+SaL2DcjtU1Hz5uZiUEYA
 P7ExF6Hr5Wp8eIcZ3mAcDUGJ7+umfUVIG9T3HpP9JzyB3H8x7XXTZ+sQvtBnCGWI+Wzf
 F08g==
X-Gm-Message-State: AFqh2kpBfY5XwfMtSXd28NAbqRC+UYUc6Xrn90cz6NYojfvW7+6D+pZl
 GBGWrYNHUEd7RREO9xMsYkNhrReCLKUl5Dh8
X-Google-Smtp-Source: AMrXdXuxSJIBJfGd95s/40x4VOAGFVnKBueWyZP/daYzQJPUOVpCLFq/S/bda9FwxCnxH5s2L5dcIg==
X-Received: by 2002:a05:6512:3b87:b0:4a4:68b7:d623 with SMTP id
 g7-20020a0565123b8700b004a468b7d623mr9549025lfv.10.1672341552388; 
 Thu, 29 Dec 2022 11:19:12 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 14/27] drm/msm/dpu: don't use unsupported blend stages
Date: Thu, 29 Dec 2022 21:18:43 +0200
Message-Id: <20221229191856.3508092-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
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

The dpu_crtc_atomic_check() compares blending stage with DPU_STAGE_MAX
(maximum amount of blending stages supported by the driver), however we
should compare it against .max_mixer_blendstages, the maximum blend
stage supported by the mixer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index cdaf48a849bc..cf7be1427298 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1126,6 +1126,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1161,7 +1162,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
+		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1186,17 +1187,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			return -E2BIG;
 		}
 
-		z_pos = pstate->normalized_zpos;
-
-		/* verify z_pos setting before using it */
-		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
+		/* verify stage setting before using it */
+		stage = DPU_STAGE_0 + pstate->normalized_zpos;
+		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
 			DPU_ERROR("> %d plane stages assigned\n",
-					DPU_STAGE_MAX - DPU_STAGE_0);
+					dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
 			return -EINVAL;
 		}
 
-		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
-		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
+		to_dpu_plane_state(pstate)->stage = stage;
+		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
 
 	}
 
-- 
2.39.0

