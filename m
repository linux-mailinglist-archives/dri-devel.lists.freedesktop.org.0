Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471B54AF826
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D56110E40B;
	Wed,  9 Feb 2022 17:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D950A10E3EE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so324509lfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FNHwzq3mUVYP9tvZ3dHFWJj6Yx53lVE16yT9fgLyUdc=;
 b=cPkfXS+SabaJuhxGlv2FUVwvEJPajwr4uq7teEv8LtZ7me8XKOPRINtthA297vf5Oo
 Y4VscEzldGo9B5K31Ghq/uD/LrKsuI+QiqPD3SttvFj4rCgAp7YP9ENvav46dQO8yw5p
 4svA6K4deH6Tfks14qDiAiPETakY/dHKl8hhs+ijKwmkRXvZw9MwXB5UZUbkc41kMjRW
 ELO93VedtaaEQQHV4ltNN/E+u1zhamQxcSaANCZySP2s5PML/2McUl/mwglM9Oacj3Kp
 HlwpT4bD33k/6VR1immriUej8Io0qgZR+fz4scFGzUHZ6lTVPSqGUYGQLJhj7DUXK7x5
 31+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FNHwzq3mUVYP9tvZ3dHFWJj6Yx53lVE16yT9fgLyUdc=;
 b=SMDnd/NjG6cAxEFgBZN9IyLvkUiF0RFr+2SLUeHlPmrTV8c2gqY4LhmU+9BGp2i4Jt
 Po/E011H/uxQvBCMkIWGbcgLSagjqRmpoS29Ss2tYOawPcMnm12WssLxiOngDqFUfr4S
 kMeWTHWQkTg9ckxXBgFyjXq4vyXq9AEQ+UpEEcYAhJ8qzHLYMXbjq2vvi4S34/TcYYW5
 7R0oVKeCuu67vB4xCYKJtMhA2QlGdZx9If2rbenHhyACptqodALxMOHe/kxV5Fc7xYP9
 6QcdO3J1KJu8/pqxx12RJtfQOHldOnWh1us+Zkws9p7slbZTdPirLzBxpMvRZR0mmsKB
 Xyxw==
X-Gm-Message-State: AOAM532HnNWm6/H6V/uDM2s1G8qgf7d8IQb8cfoj5XoGDtPLf0MNirOO
 frbpuzkAxpxIOmcRapDU8VhjbA==
X-Google-Smtp-Source: ABdhPJyxbvJ7tFbQEGokz1hb7i2JQEwpOnXmrZQSoCS5bPnXLX7G8hfO4YC/f4St6JXU/uLxzlzNTA==
X-Received: by 2002:a05:6512:1083:: with SMTP id
 j3mr981562lfg.94.1644427528173; 
 Wed, 09 Feb 2022 09:25:28 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 06/25] drm/msm/dpu: inline dpu_plane_get_ctl_flush
Date: Wed,  9 Feb 2022 20:25:01 +0300
Message-Id: <20220209172520.3719906-7-dmitry.baryshkov@linaro.org>
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

There is no need to keep a separate function for calling into the ctl if
we already know all the details. Inline this function in the dpu_crtc.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 15 ++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  9 ---------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7318bd45637a..5fc338ef3460 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -348,7 +348,6 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	u32 flush_mask;
 	uint32_t stage_idx, lm_idx;
 	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
 	bool bg_alpha_enable = false;
@@ -356,6 +355,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	memset(fetch_active, 0, sizeof(fetch_active));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		enum dpu_sspp sspp_idx;
+
 		state = plane->state;
 		if (!state)
 			continue;
@@ -363,14 +364,14 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		dpu_plane_get_ctl_flush(plane, ctl, &flush_mask);
-		set_bit(dpu_plane_pipe(plane), fetch_active);
+		sspp_idx = dpu_plane_pipe(plane);
+		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
 				crtc->base.id,
 				pstate->stage,
 				plane->base.id,
-				dpu_plane_pipe(plane) - SSPP_VIG0,
+				sspp_idx - SSPP_VIG0,
 				state->fb ? state->fb->base.id : -1);
 
 		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
@@ -380,13 +381,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		stage_idx = zpos_cnt[pstate->stage]++;
 		stage_cfg->stage[pstate->stage][stage_idx] =
-					dpu_plane_pipe(plane);
+					sspp_idx;
 		stage_cfg->multirect_index[pstate->stage][stage_idx] =
 					pstate->multirect_index;
 
 		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 					   state, pstate, stage_idx,
-					   dpu_plane_pipe(plane) - SSPP_VIG0,
+					   sspp_idx - SSPP_VIG0,
 					   format->base.pixel_format,
 					   fb ? fb->modifier : 0);
 
@@ -395,7 +396,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 			_dpu_crtc_setup_blend_cfg(mixer + lm_idx,
 						pstate, format);
 
-			mixer[lm_idx].flush_mask |= flush_mask;
+			mixer[lm_idx].flush_mask |= ctl->ops.get_bitmask_sspp(ctl, sspp_idx);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 0247ff8a67a2..ca194cd83cd0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -849,18 +849,6 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 	return 0;
 }
 
-/**
- * dpu_plane_get_ctl_flush - get control flush for the given plane
- * @plane: Pointer to drm plane structure
- * @ctl: Pointer to hardware control driver
- * @flush_sspp: Pointer to sspp flush control word
- */
-void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
-		u32 *flush_sspp)
-{
-	*flush_sspp = ctl->ops.get_bitmask_sspp(ctl, dpu_plane_pipe(plane));
-}
-
 static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		struct drm_plane_state *new_state)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 42b88b6bc9c2..aa9478b475d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -61,15 +61,6 @@ struct dpu_multirect_plane_states {
  */
 enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
 
-/**
- * dpu_plane_get_ctl_flush - get control flush mask
- * @plane:   Pointer to DRM plane object
- * @ctl: Pointer to control hardware
- * @flush_sspp: Pointer to sspp flush control word
- */
-void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
-		u32 *flush_sspp);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
-- 
2.34.1

