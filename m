Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38DC6590F4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9750710E21C;
	Thu, 29 Dec 2022 19:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7424B10E226
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:06 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bf43so28743716lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ss0HkvEiP7gxydmqp93caBI153pBe6rBOY2wrUpnjK0=;
 b=Sk633oUpDcJ3FVdnX++v59R3JWPawtWMmGv35/fbhUaoTA4dufIHwnuhNhetFq+Fy0
 8Ftr8fFrW7Ia3BOq6vuaGI4HXM5Ap2csqHEk+ex8QGKOfePCngy7O/kM7iq4c9Wnc4dA
 sE/Rw3vVAcX31Vw9Fc6JopM65xBLiHsTW9g2D4I3cj17P6JRJSkKEU+zneADAyHXMLuD
 TRarkmqice3l/uGh3b2cXCOKlf339iMKfmDo6cPCkc87s+TkpPPY4OhelltEtYEhm47g
 +KtIuI9PPKC7siqT6Ro1Iaqb2zHO1AAP/j3f15IHpmm/gSoVvHwgY5JekNNhoRrXpUD/
 2RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ss0HkvEiP7gxydmqp93caBI153pBe6rBOY2wrUpnjK0=;
 b=rLNV6++k5tsQzGDTDqCas4YdYmE807Ad4QJDVChtha+vHyUVtt1dLRKwGrE8uxVdAL
 i9xyugH1Ce4q8OTktJfX/c9e9Ypsb92S0Ek3O+tiGvs1iSA2uyY7mSmjDLd7ZFRPi6vE
 KxcPaUINv7IfskxlJuQpSyEePu1Ws8ty8tlESIFjiVHqk78oCSTA3DOWrgZ022+oIUZf
 4U7A0ueHmtsuCdkbvIKNWneyCFvqMjAOLqd2BZ5kqxSQeFirMrMqBY9pu2/xcLk/QGAi
 29P5KUg5B12Pb5FxyyXbdvGHHN+vTD+AIiFG6uw+OlM6SrgXDNI0GIa6VtIfEhDCdu4M
 NK9g==
X-Gm-Message-State: AFqh2kpS67j2z7613J0S7F/JuIv1FmXUPWLmfrWiGah0IYfWUlpMCvcB
 vxDHVW33F9CagbO9A+QwJuivsA==
X-Google-Smtp-Source: AMrXdXt7gEcdGSAoymb/5PNlAonqSOtLxW+p0aif8ejC4/ZJJIaQDq0OSYTD0Sv1qIfj/5hCzYmajw==
X-Received: by 2002:a19:760f:0:b0:4b6:eaa5:4347 with SMTP id
 c15-20020a19760f000000b004b6eaa54347mr7695536lff.62.1672341546030; 
 Thu, 29 Dec 2022 11:19:06 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 07/27] drm/msm/dpu: drop dpu_plane_pipe function
Date: Thu, 29 Dec 2022 21:18:36 +0200
Message-Id: <20221229191856.3508092-8-dmitry.baryshkov@linaro.org>
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

There no more need for the dpu_plane_pipe() function, crtc code can
access pstate->pipe_hw.idx directly.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h | 7 -------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 13ce321283ff..78c21a976bad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -431,7 +431,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = dpu_plane_pipe(plane);
+		sspp_idx = pstate->pipe_hw->idx;
 		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
@@ -1197,7 +1197,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = dpu_pstate;
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
+		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->pipe_hw->idx;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7ba954c7b3e0..493dcf04fa6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1437,11 +1437,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane)
-{
-	return plane ? to_dpu_plane(plane)->pipe : SSPP_NONE;
-}
-
 /* initialize plane */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 0d268729ce81..8786359a191c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -59,13 +59,6 @@ struct dpu_multirect_plane_states {
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
-/**
- * dpu_plane_pipe - return sspp identifier for the given plane
- * @plane:   Pointer to DRM plane object
- * Returns: sspp identifier of the given plane
- */
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
-- 
2.39.0

