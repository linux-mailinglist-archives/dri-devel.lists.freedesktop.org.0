Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2796B999D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0975510EA86;
	Tue, 14 Mar 2023 15:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F0E88647
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:52 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id b13so16449896ljf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZV/iGylTDgxxWCB5fJRWseJZRf6m0M+kKVRnwgr+IlI=;
 b=DcG8c90lQLDUIz0rXptmL+CnlWOXW6NnjM+Kr5M2PMVP4NG0G5wIgt5BsXJAWb5GB+
 AKky90qWiDT0Blb0QBfwLjd81/2y6AsZKcCzoQUDr4S15Cpiw0s+GQBRuOU1x+RE1+Ib
 A78NaqZ45axWFEyk125LfffgwjY/NcdzYGOKUl4eDUBlGx/iTtyJuYxMRKweAEEi3NVv
 mZqUrFWmC8+aZ2QI2P0UMyPz+Y/SbIropukMKcd5iqrywazK9MvTkyIX0sWn/p3HJMWz
 S7eG09M8HeJlm1B6q7WnumPHIMAmKZrmsSUgg+u2uhVy4y4WJhOZNdNRdg78zdna2dwM
 mn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZV/iGylTDgxxWCB5fJRWseJZRf6m0M+kKVRnwgr+IlI=;
 b=GvIXpVCkKSjIWAnT56IBOeNmOGHjJKc8lpNQsDuYIYx74BIV6OX8E48+6H1oXaMnii
 GqWGn4WwTTfTjHqnNtwL3jCTNFqd9w3QAG5LdkaSscVbrEDVPVH+Er3MibO4CU7LlDrB
 SRtHtrytEQlvtBUaA3j4rpB3vVIDgW6MJBGFwaT/saWBbgBnnGRWs3KRdGCV4e6PsJW5
 BYl/dR0f+xZGPfA20zhwWznUHSTXz3u7b2gGdQQLjm9v/ljKjGm4oQzEM+zlkYRSVifC
 v0egjrMnVs0QEgEp3N2ij+Lbom/RhMhSSKlyq2mzurYMtetUhfjAcFp8kzW+F0Tcnk+F
 2H1w==
X-Gm-Message-State: AO0yUKV/qG4NxoltiriejSBN1uB6a8opdXfnwE2HMDJ9Gi7hwob0sYqP
 klAy550bHRwgUJUi8Zh2/MrYUA==
X-Google-Smtp-Source: AK7set8yOOyLwqDw8jk7L0u0X5+xqfHu71OyQbZvn2oygU+zrCKVnBOudN8J9aTl+/hUVulXmFiBjA==
X-Received: by 2002:a2e:990f:0:b0:294:669a:6adc with SMTP id
 v15-20020a2e990f000000b00294669a6adcmr10739373lji.3.1678808150630; 
 Tue, 14 Mar 2023 08:35:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 06/32] drm/msm/dpu: drop dpu_plane_pipe function
Date: Tue, 14 Mar 2023 18:35:19 +0300
Message-Id: <20230314153545.3442879-7-dmitry.baryshkov@linaro.org>
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
index b1ec0c35947b..c059090e9479 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -432,7 +432,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = dpu_plane_pipe(plane);
+		sspp_idx = pstate->hw_sspp->idx;
 		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
@@ -1227,7 +1227,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = dpu_pstate;
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
+		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->hw_sspp->idx;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 546629232e3d..10678f6502a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1442,11 +1442,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
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
index 08a4b6a99f51..25e261cabadc 100644
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
2.30.2

