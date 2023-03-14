Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563F16B9998
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D92C10EAA0;
	Tue, 14 Mar 2023 15:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A7010EAA8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:57 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id i20so16423820lja.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=px47uAOQkqAfQG49cyyMWqMkDhV0IAY5Pz0cQj+iwGU=;
 b=TtGRPNrw6Zwf3wfCLxcsiXUwS3op2Cd83HM0p2C9zMCJG9sV1pvbW0pBg29pT3MGN2
 i9dassk1ApnhltvbZ2Vlis3Gr0luWmSC9j/BulPAqYaZFJpKSt0JDmjiYr8RyaBvi3sT
 OreVUyIbSQDjtpXgk4G15tky9JCBjXYaKQt1LfmskGORKshUyYGh4KpCu0D6PpUitGT5
 ifBmAvbRqahPde2/ZIoeKQccdDVEP7/hbXXk8ibIVlvoz24bVU2Lbp1RKcNE5L6RlvpF
 wAPihqFJ04TIxA62vrp6BBcPCKkjcWsmSui789fQbdY3gkoHlA6jwwOpBfR+dTtcS8LX
 /KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=px47uAOQkqAfQG49cyyMWqMkDhV0IAY5Pz0cQj+iwGU=;
 b=ZJ4D2ikJPYuUQHR14Ve3ZeDpdvSlvg7d4jGmxhdWwQ8oCr7rB+5gLEcbzzD797wfvv
 cOTEQvwhunm4sIVhLEKz60yieZFxl2imY94QVmUA9OOUvYuDlDFlZs3TdnpTCtfWMoZd
 g9WmNNi73QrJpYYl5UV9TMDbdgneuX6Qkeqqe2gW8gnLc2H3MCLMx2EAkNNOEvds5BG+
 VsObXpvaYtdYJzRHez6shav8rFiyBIcV/sVzGJA2g8iZKgktqZIgkdD9DStRWotX6LLx
 78jn28U6WJiH3s19YrPBVFm2Im14EqVMQjCEbUrj0+WMJXD4chdtirqsAvGlOmHQjID8
 QYBA==
X-Gm-Message-State: AO0yUKVyXops7FmL6OSNS3+v/XlMTryiOL9RJYpql70/WDPrG1QXsgLf
 M1ZyzOsLBj7QhKgqzq2qrB/wqg==
X-Google-Smtp-Source: AK7set/wNp5wMTbWY1n0W9X9/90hGF4rYjK9WfWxStkhKJbUvEJ/pzE57xzXQQGe7TxGtHRpRj2hpA==
X-Received: by 2002:a05:651c:544:b0:298:4424:aea9 with SMTP id
 q4-20020a05651c054400b002984424aea9mr12748087ljp.21.1678808156878; 
 Tue, 14 Mar 2023 08:35:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 15/32] drm/msm/dpu: don't use unsupported blend stages
Date: Tue, 14 Mar 2023 18:35:28 +0300
Message-Id: <20230314153545.3442879-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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

