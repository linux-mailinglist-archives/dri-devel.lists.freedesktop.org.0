Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEC16BD51C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D2910ED62;
	Thu, 16 Mar 2023 16:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1770F10ED22
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id y14so2267457ljq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMxu228UknSnm7hBHXdsSZRYK1JBi7/hMEuzH/oSPi8=;
 b=aLJ46BlgzGvL6ooDZJH8ibqOX5r/YNvyNA9/w7MxoIix0lZbc9aLqLsXfFQUh3MNi6
 vUDsDfPyYaNdeJ0cLhncSvh2GdNCW+1rhcND+wbzLAl4eWyCaHXcf2C1kJ6OLIN7Y9Pf
 D7tc8kY0r9nn9fbkeQnPHGpNF3zsVt/5qWylUsGqo/dwxLtSXVIa24N1CeKQnRZ5zGbo
 z7V+WWsspr2FofOokzHnTlPTtdyvVD251ixOdHOersx9Cr2vqxeIDfxzKiUkHDZCV21h
 PxwWI2xHhSV/9QOlnJWb6zl1VO2TAlCCR9aaC0WL0ipi31m0Y7NHg4aXXLZWFl6VzYCP
 LrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lMxu228UknSnm7hBHXdsSZRYK1JBi7/hMEuzH/oSPi8=;
 b=FfgSO0lu/iC3frhJfBRLPvLHFWYOuxpSzU5vWSA++BU/LDHyvgnz3sF4vjcBtRx3fP
 kvrJ0WUDUrEgSQ8bsBS49rMQ0UKSj4E1wHgqkAkSc7IbK8RdHx91oYKuncj9qUsj0ZZj
 5Qxgy9ImDpsgKJQgL0m5LIVjOtLcDHrfTKjY+yt+QQKgQAp/l323nnneaX4mFoeJQvS1
 AarWl/HJaQGhBAcPtVRTfibbKFx9ogU4eqg+fmyUkcdtH0RHoo6pib0qnEwzZMiBNr7A
 Ebouk9rumW1mZxfunNw6WwtT1otECOrY/xAtzX/t2lxGcOzbWZNhm7Q3Z1VYnYjNj6rq
 UFyw==
X-Gm-Message-State: AO0yUKVbBL5pCCTQGiXf8Z7rHjHb0BHEgq9pogASpOPTyKGnYFXaqxie
 15BnkToKf/qF6cgZT1Rxa32d9g==
X-Google-Smtp-Source: AK7set/SIy0LrEzwkKzeeWrTZXys5+mkGu/qEaEVOgXxaeCw69QIIu+wCMfB/TadRNoktgUIS3QU4g==
X-Received: by 2002:a05:651c:2111:b0:298:6d41:a663 with SMTP id
 a17-20020a05651c211100b002986d41a663mr2798907ljq.23.1678983428466; 
 Thu, 16 Mar 2023 09:17:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 15/32] drm/msm/dpu: don't use unsupported blend stages
Date: Thu, 16 Mar 2023 19:16:36 +0300
Message-Id: <20230316161653.4106395-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ca7a9f58a97f..3ff9c6018a5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1154,6 +1154,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1189,7 +1190,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
+		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1214,17 +1215,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
+				  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
 			return -EINVAL;
 		}
 
-		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
-		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
+		to_dpu_plane_state(pstate)->stage = stage;
+		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
 
 	}
 
-- 
2.30.2

