Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ACB6A97F7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41AD10E613;
	Fri,  3 Mar 2023 12:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADB510E5E4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:37 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id t11so3488186lfr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBLqAmXU8RzuNTFCSMX95oVYpDr4yOBGu5atcgyyNsY=;
 b=RGqKWZZueTLN7nkXECplHGdN/ztb2r6aIiHQJvne+B9ZRjY7gpKsRxBJIeBRNomdpO
 NXftUxxnUNu2O+KS/Kt+c7/5VHjiF/kvBViG5u9bIyy5Ga/ZhB/TxbO2114TyGohdo4N
 u0P/l4AkJxt47ZzYNjgDzlttVaJlUbp4euIkysxtXsQhjDeIG1rX1+j2pAAoAS523uZ3
 79gvg+JaZ6PVtJkrqAkDixaNeqmka6kAIJjBZq18siDtbs2Hd16CwunsTqYvkD6uT5F/
 bjOOfJYgtpNU8pJUZJ7UszlBBcD4d3xYvry/SwGtAjJ3qvziXH4KP0VVVedxbwdwSrcU
 GEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBLqAmXU8RzuNTFCSMX95oVYpDr4yOBGu5atcgyyNsY=;
 b=5eqrbgY5ZIN2kOrMEYo4SbghCchBJiwWs/pl1Q7Z0iP6aD5jL850C0LeDljbYh7DWP
 Pp/YRrX6TNm0ypHu48YbroZQbeFIZ9KuQTPgXiw4d8bNOqCQx6xD6davJcjZtV58cUWs
 mf1NUrolEXdJdyekJ2HRubqpEL3+0D9Sz+i4uuVCrMP+SE21fMaVAty0VK162jyYyd09
 P95+1u5mx37bm8ErtAIYYovfL8zxRTy1JSp2zlhHGnKSCkf8jdkZyLQ+QbIe1ys+doWZ
 Qjut/Tw3hloAVSNo/FiqQ1PwSo47SlUE8Zy9jaL4iwf2gVcrUQI8iFs6QvnS2UD7BXJM
 Ms3A==
X-Gm-Message-State: AO0yUKXDFOwvVaPlNIEKCpj9r7zb0ihpZ7DeVXhHDInx8sE6ndc91xei
 PtDXNY6bHaspSlxvJivX9HeWUA==
X-Google-Smtp-Source: AK7set/Lwi2oRtEhoyh0s/pn3Ir/pDDlrC9uHQ3mKp/cOEYua7CbBrrd8ScfVeHuVX+8SXEqEvUyDw==
X-Received: by 2002:ac2:5238:0:b0:4de:7a23:23e2 with SMTP id
 i24-20020ac25238000000b004de7a2323e2mr497618lfl.21.1677848257487; 
 Fri, 03 Mar 2023 04:57:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 17/30] drm/msm/dpu: drop redundant plane dst check from
 dpu_crtc_atomic_check()
Date: Fri,  3 Mar 2023 14:57:12 +0200
Message-Id: <20230303125725.3695011-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

The helper drm_atomic_helper_check_plane_state() already checks whether
the scaled and clipped plane falls into the CRTC visible region (and
clears plane_state->visible if it doesn't). Drop the redundant check
from dpu_crtc_atomic_check().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index bd09bb319a58..73e1a8c69ef0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1132,11 +1132,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
-	struct drm_display_mode *mode;
 
 	int rc = 0;
 
-	struct drm_rect crtc_rect = { 0 };
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	if (!crtc_state->enable || !crtc_state->active) {
@@ -1147,7 +1145,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		return 0;
 	}
 
-	mode = &crtc_state->adjusted_mode;
 	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
@@ -1157,13 +1154,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (cstate->num_mixers)
 		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
 
-	crtc_rect.x2 = mode->hdisplay;
-	crtc_rect.y2 = mode->vdisplay;
-
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
-		struct drm_rect dst, clip = crtc_rect;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1176,15 +1169,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			continue;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
-
-		dst = drm_plane_state_dest(pstate);
-		if (!drm_rect_intersect(&clip, &dst)) {
-			DPU_ERROR("invalid vertical/horizontal destination\n");
-			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
-				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
-				  DRM_RECT_ARG(&dst));
-			return -E2BIG;
-		}
 	}
 
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
-- 
2.39.2

