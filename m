Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629A68A1CC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26ECF10E872;
	Fri,  3 Feb 2023 18:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEFA10E86F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:52 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id lu11so17729814ejb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TbZbkl9ux9EY3/Lwyjl6uBKwO9sp33uIomeqb/KbrF8=;
 b=ytcdsY9wWnewOYrJpCJYcEGMnj5FnhqrlHctY3R/3Wq/oKLn9ECo+el93VjoMAvsRN
 1yASyKbH4Ac7j2jixcH6J7nuSLzwbwD8SOi5xLaPj5Zb5qbL8GVq98211/FT4h8l1Pl0
 1enRsxtqux6yOM8cSeAszbQXld7Syi7xbNsS6CaCn0FqH2ytlCDuTo5kvVv2shWLdDhQ
 4IFkGmSJb7aGbkg7nrsIXq+0Sv/LcIcLi0LXW7dPfnpNf6kgP5hhrwz1EzuFrKo3zpTA
 IibSSkndhcyYgUnb0WKg9CJnTC2anDvAtcDKNLspHYH7mrGgnhgl4hHzJ7OLBzT7Xq84
 N0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TbZbkl9ux9EY3/Lwyjl6uBKwO9sp33uIomeqb/KbrF8=;
 b=tGGCKy0l6q7RpvLK/DnWpe4/mnjmxuh1U4GpNQrd9c45QyzzTuiSzBmjhCjUtuDgnW
 KoKluDkh3jK1Udhx6IBalKqjg9adzedVc6EPsZY0ZJOlTOnX8hqMcifzrb3yg3d1VpaY
 hqNQlIZc2GyJaB9103CxmdmIqZUwNtP2yO9vd3U1bxlIyJmV71rwXr2J0puJG87UaHBS
 bCsAgZFfbDVp3tt+3Nni7aFMnTzPlNit8FBtTOYwIS2po182gvdJmr2QKj9IBYVqgsiN
 njrlUemHE3ZCHisBJj2y1Qrx07XjaUlX8hvT44ZVt8StIJGgxIWYOjyZ6ffZdohH5ecb
 Apug==
X-Gm-Message-State: AO0yUKWmYd5pKuXMXUlnRu4fFDfatmahSSQLhdTOleR2MzG0xCJJCODb
 LRAsScoKou4QQ2ffSPqC+Exj0g==
X-Google-Smtp-Source: AK7set99yPsgQfxUPPTU2+/SWHmcdNgz6PITwc2b1oxg4yV/6+JA1NdvEpPIURXvg/I3VxF6g6GewA==
X-Received: by 2002:a17:906:c319:b0:88b:236e:ed25 with SMTP id
 s25-20020a170906c31900b0088b236eed25mr10578349ejz.61.1675448510761; 
 Fri, 03 Feb 2023 10:21:50 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 14/27] drm/msm/dpu: don't use unsupported blend stages
Date: Fri,  3 Feb 2023 20:21:19 +0200
Message-Id: <20230203182132.1307834-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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
index c1579d6f5060..b485234eefb2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1129,6 +1129,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1164,7 +1165,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
+		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1189,17 +1190,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
2.39.1

