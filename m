Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8130965911F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2D810E3F3;
	Thu, 29 Dec 2022 19:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4C110E229
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g13so28735204lfv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FobwD5sQvqefW0anWOBg/FR0LKON5OAk6+WYCx9JwxE=;
 b=B6PJ1qXGVKRcbM0/UWvdsnYjBWbVoM1cqOG/2rpsTJykpkFPVNCth6qGofoIFgLpG8
 khMdJNwV5n8BGmTbMXUl/uGAMROa/6xtU2xdlC39jaNx2BDIdV4/ZNnb8lDWOAp4NOc4
 JmcFfBQbAludeoAlfjluxF5GBHHC3EU6/5RSv3AwNolZQR4dZPN2q9cQXLbJhttAMDhe
 FVA8eMMVKaKaKnzhBjGWfNr8pkuEUl0fWdIUzM3WG8bJM7Xv0gxBp/s+q8+gw+ww7jyx
 memTmF8eHap6Tsz6dfoYe13ZNpbHc8a8GnBFioTEGVyLy6WZ8GuacMHukM91BaxG4D8A
 wCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FobwD5sQvqefW0anWOBg/FR0LKON5OAk6+WYCx9JwxE=;
 b=jWJdVFE/LdUbq/MaVzVVIu7OJz2mty2pEulnRQWUkGM/yBCOIhaa859vamc6LRuqtq
 EUoeIFYNyiJ5xIj8n1ENxifyqZ5dLl/0Krj8trGNhjTVuLdbiAs6J38e+VpmEyD24zFJ
 iPH7uzGofeO0CijjNknoQPYT7n1lN3SlgwdtmFHQa0S5EfLf/VavhTpsS5YW32a4WYXf
 enCUSHzN5o/pGomBaFEJoy7OlybEXYuaB34C/D+/Acsp/L4RulOGXPT5oGGVTulNd17L
 VF41rUeDWkhlvEs/f+fS8g1zL14J/6upZCwTQh+gPWbOzMyrVJi/ydDovGw5ziglmpX5
 sVMQ==
X-Gm-Message-State: AFqh2kqBme4mSg9ILA7UEMCqDWXeSVffvXUa4QwMhMuwZG67MbZBCvht
 tfAL8eVIM6DuqMHplbH1P+1QNBJJYalGR+hE
X-Google-Smtp-Source: AMrXdXsa5Oey2ed+1blTFA8tzsPIvb9RWbg2rWPIFN/2XDTo20qI9Ugu0Gckb3QJPbwVASB+pV/U8A==
X-Received: by 2002:a05:6512:2805:b0:4b5:a53f:ac18 with SMTP id
 cf5-20020a056512280500b004b5a53fac18mr9803236lfb.69.1672341554487; 
 Thu, 29 Dec 2022 11:19:14 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 16/27] drm/msm/dpu: drop redundant plane dst check from
 dpu_crtc_atomic_check()
Date: Thu, 29 Dec 2022 21:18:45 +0200
Message-Id: <20221229191856.3508092-17-dmitry.baryshkov@linaro.org>
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

The helper drm_atomic_helper_check_plane_state() already checks whether
the scaled and clipped plane falls into the CRTC visible region (and
clears plane_state->visible if it doesn't). Drop the redundant check
from dpu_crtc_atomic_check().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3c33bb4dfaf9..78981271b28a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1129,11 +1129,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
-	struct drm_display_mode *mode;
 
 	int rc = 0;
 
-	struct drm_rect crtc_rect = { 0 };
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	if (!crtc_state->enable || !crtc_state->active) {
@@ -1144,7 +1142,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		return 0;
 	}
 
-	mode = &crtc_state->adjusted_mode;
 	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
@@ -1154,13 +1151,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
@@ -1173,15 +1166,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
2.39.0

