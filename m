Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267406B999A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AF988647;
	Tue, 14 Mar 2023 15:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F3D10EAA7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id h3so16423499lja.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5YY5wL665xxFxD+hAJMgNoq0D5jsaKeheViVvrGYeOM=;
 b=qzzsDwMgcQV9ffHh7oUts6jv3AHvWao6uiw+kCWGQ+lL6KGqDMj6kPJ5U7Ud1TcLze
 pCs5jfLk/HjAqbqNMTOGQQcoXNCsAPgwGeLHs7kddOfy7USEGJO8LiFlJsxFdgKof0IV
 q2wfCJsQHjogMw/FQEPBZ0DHwAIQYhTwFAVlMxFRWH+e9WZxJFTKiNzZTsQHy3V31xbb
 GFOs7ZwcP/CNWegXatu7KqbH1mDUtBPXtyWtG18Q2rxTYW0zbHhmGsMX1/iRRjvPP2Wj
 6xyEhdvHqtfnNE/NFH8uMhFg5wxH3XBWZxtACShEFoYTxLxB9vGVKh6HBbLN3o9YGSG3
 /xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5YY5wL665xxFxD+hAJMgNoq0D5jsaKeheViVvrGYeOM=;
 b=l/XFze6eH8Y7vGOZHV0FGVVjakFCm0ppETSwYwcrGALtBRGfDxSieUHm6KXJXM5oCe
 6hXuaKG81iPLsz1kvdfp/JoOmNmFOMyuBlLULDuztoG2reWqbOAcPsXb2Vgdqt1s/iho
 xT1tZX/D+iIbS3Ltz95XfaKS5+5SGbtx80PRfJN3rkYxwe/nUlwRfD6G3UW0ZJD3NXc1
 qlTiu4dRhH+CuHzRteVPzc6B8BjzvVQ00QgvxAoHuBf1h3e6Kgxnej04uiF+0tPn4/7z
 ouIOEbSWn/nsdk/AVDSmADb/9bzGhCXIHvaOEJSzWHpdGPvMeQenQHdRavQWiCqhljy/
 JnNw==
X-Gm-Message-State: AO0yUKVOz+DOzSV8SmQlRvBvtB0Qat4Q4V0fvVGiGDcPK6U2D3b+dWde
 WcpnRJsrUInqUpX07dS0bt0XBw==
X-Google-Smtp-Source: AK7set8H/3W4FyfY9zHZ3iGmgdFUeXpsoOJVlZNrhqXYzx8R63jW+vLDy1ko103vKoD7ZSsL2uoBpw==
X-Received: by 2002:a2e:b88e:0:b0:298:3a2d:4363 with SMTP id
 r14-20020a2eb88e000000b002983a2d4363mr17042751ljp.5.1678808156200; 
 Tue, 14 Mar 2023 08:35:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 14/32] drm/msm/dpu: drop src_split and multirect check from
 dpu_crtc_atomic_check
Date: Tue, 14 Mar 2023 18:35:27 +0300
Message-Id: <20230314153545.3442879-15-dmitry.baryshkov@linaro.org>
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

Neither source split nor multirect are properly supported at this
moment. Both of these checks depend on normalized_zpos being equal for
several planes (which is never the case for normalized zpos).
Drop these checks to simplify dpu_crtc_atomic_check(). The actual
support for either of these features is not removed from the backend
code (sspp, ctl, etc).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 168 ++---------------------
 1 file changed, 12 insertions(+), 156 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3dcc71997f44..ca7a9f58a97f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1133,13 +1133,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	drm_crtc_vblank_on(crtc);
 }
 
-struct plane_state {
-	struct dpu_plane_state *dpu_pstate;
-	const struct drm_plane_state *drm_pstate;
-	int stage;
-	u32 pipe_id;
-};
-
 static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 {
 	struct drm_crtc *crtc = cstate->crtc;
@@ -1161,31 +1154,22 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
-	struct plane_state *pstates;
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
 	struct drm_display_mode *mode;
 
-	int cnt = 0, rc = 0, mixer_width = 0, i, z_pos;
+	int rc = 0;
 
-	struct dpu_multirect_plane_states multirect_plane[DPU_STAGE_MAX * 2];
-	int multirect_count = 0;
-	const struct drm_plane_state *pipe_staged[SSPP_MAX];
-	int left_zpos_cnt = 0, right_zpos_cnt = 0;
 	struct drm_rect crtc_rect = { 0 };
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
-	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
-	if (!pstates)
-		return -ENOMEM;
-
 	if (!crtc_state->enable || !crtc_state->active) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
 				crtc_state->active);
 		memset(&cstate->new_perf, 0, sizeof(cstate->new_perf));
-		goto end;
+		return 0;
 	}
 
 	mode = &crtc_state->adjusted_mode;
@@ -1195,13 +1179,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	memset(pipe_staged, 0, sizeof(pipe_staged));
-
-	if (cstate->num_mixers) {
-		mixer_width = mode->hdisplay / cstate->num_mixers;
-
+	if (cstate->num_mixers)
 		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
-	}
 
 	crtc_rect.x2 = mode->hdisplay;
 	crtc_rect.y2 = mode->vdisplay;
@@ -1210,38 +1189,21 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
+		int z_pos;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
 			DPU_ERROR("%s: failed to get plane%d state, %d\n",
 					dpu_crtc->name, plane->base.id, rc);
-			goto end;
+			return rc;
 		}
-		if (cnt >= DPU_STAGE_MAX * 4)
-			continue;
 
 		if (!pstate->visible)
 			continue;
 
-		pstates[cnt].dpu_pstate = dpu_pstate;
-		pstates[cnt].drm_pstate = pstate;
-		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->pipe.sspp->idx;
-
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
-		if (pipe_staged[pstates[cnt].pipe_id]) {
-			multirect_plane[multirect_count].r0 =
-				pipe_staged[pstates[cnt].pipe_id];
-			multirect_plane[multirect_count].r1 = pstate;
-			multirect_count++;
-
-			pipe_staged[pstates[cnt].pipe_id] = NULL;
-		} else {
-			pipe_staged[pstates[cnt].pipe_id] = pstate;
-		}
-
-		cnt++;
+		dpu_plane_clear_multirect(pstate);
 
 		dst = drm_plane_state_dest(pstate);
 		if (!drm_rect_intersect(&clip, &dst)) {
@@ -1249,63 +1211,21 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
 				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
 				  DRM_RECT_ARG(&dst));
-			rc = -E2BIG;
-			goto end;
+			return -E2BIG;
 		}
-	}
 
-	for (i = 1; i < SSPP_MAX; i++) {
-		if (pipe_staged[i])
-			dpu_plane_clear_multirect(pipe_staged[i]);
-	}
-
-	z_pos = -1;
-	for (i = 0; i < cnt; i++) {
-		/* reset counts at every new blend stage */
-		if (pstates[i].stage != z_pos) {
-			left_zpos_cnt = 0;
-			right_zpos_cnt = 0;
-			z_pos = pstates[i].stage;
-		}
+		z_pos = pstate->normalized_zpos;
 
 		/* verify z_pos setting before using it */
 		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
 			DPU_ERROR("> %d plane stages assigned\n",
 					DPU_STAGE_MAX - DPU_STAGE_0);
-			rc = -EINVAL;
-			goto end;
-		} else if (pstates[i].drm_pstate->crtc_x < mixer_width) {
-			if (left_zpos_cnt == 2) {
-				DPU_ERROR("> 2 planes @ stage %d on left\n",
-					z_pos);
-				rc = -EINVAL;
-				goto end;
-			}
-			left_zpos_cnt++;
-
-		} else {
-			if (right_zpos_cnt == 2) {
-				DPU_ERROR("> 2 planes @ stage %d on right\n",
-					z_pos);
-				rc = -EINVAL;
-				goto end;
-			}
-			right_zpos_cnt++;
+			return -EINVAL;
 		}
 
-		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
+		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
 		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
-	}
 
-	for (i = 0; i < multirect_count; i++) {
-		if (dpu_plane_validate_multirect_v2(&multirect_plane[i])) {
-			DPU_ERROR(
-			"multirect validation failed for planes (%d - %d)\n",
-					multirect_plane[i].r0->plane->base.id,
-					multirect_plane[i].r1->plane->base.id);
-			rc = -EINVAL;
-			goto end;
-		}
 	}
 
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
@@ -1314,74 +1234,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (rc) {
 		DPU_ERROR("crtc%d failed performance check %d\n",
 				crtc->base.id, rc);
-		goto end;
-	}
-
-	/* validate source split:
-	 * use pstates sorted by stage to check planes on same stage
-	 * we assume that all pipes are in source split so its valid to compare
-	 * without taking into account left/right mixer placement
-	 */
-	for (i = 1; i < cnt; i++) {
-		struct plane_state *prv_pstate, *cur_pstate;
-		struct drm_rect left_rect, right_rect;
-		int32_t left_pid, right_pid;
-		int32_t stage;
-
-		prv_pstate = &pstates[i - 1];
-		cur_pstate = &pstates[i];
-		if (prv_pstate->stage != cur_pstate->stage)
-			continue;
-
-		stage = cur_pstate->stage;
-
-		left_pid = prv_pstate->dpu_pstate->base.plane->base.id;
-		left_rect = drm_plane_state_dest(prv_pstate->drm_pstate);
-
-		right_pid = cur_pstate->dpu_pstate->base.plane->base.id;
-		right_rect = drm_plane_state_dest(cur_pstate->drm_pstate);
-
-		if (right_rect.x1 < left_rect.x1) {
-			swap(left_pid, right_pid);
-			swap(left_rect, right_rect);
-		}
-
-		/**
-		 * - planes are enumerated in pipe-priority order such that
-		 *   planes with lower drm_id must be left-most in a shared
-		 *   blend-stage when using source split.
-		 * - planes in source split must be contiguous in width
-		 * - planes in source split must have same dest yoff and height
-		 */
-		if (right_pid < left_pid) {
-			DPU_ERROR(
-				"invalid src split cfg. priority mismatch. stage: %d left: %d right: %d\n",
-				stage, left_pid, right_pid);
-			rc = -EINVAL;
-			goto end;
-		} else if (right_rect.x1 != drm_rect_width(&left_rect)) {
-			DPU_ERROR("non-contiguous coordinates for src split. "
-				  "stage: %d left: " DRM_RECT_FMT " right: "
-				  DRM_RECT_FMT "\n", stage,
-				  DRM_RECT_ARG(&left_rect),
-				  DRM_RECT_ARG(&right_rect));
-			rc = -EINVAL;
-			goto end;
-		} else if (left_rect.y1 != right_rect.y1 ||
-			   drm_rect_height(&left_rect) != drm_rect_height(&right_rect)) {
-			DPU_ERROR("source split at stage: %d. invalid "
-				  "yoff/height: left: " DRM_RECT_FMT " right: "
-				  DRM_RECT_FMT "\n", stage,
-				  DRM_RECT_ARG(&left_rect),
-				  DRM_RECT_ARG(&right_rect));
-			rc = -EINVAL;
-			goto end;
-		}
+		return rc;
 	}
 
-end:
-	kfree(pstates);
-	return rc;
+	return 0;
 }
 
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
-- 
2.30.2

