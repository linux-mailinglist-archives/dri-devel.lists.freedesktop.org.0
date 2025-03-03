Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F21A4C49B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5325510E460;
	Mon,  3 Mar 2025 15:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HtYBiygD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AE710E469
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:16:20 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22185cddbffso93822515ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 07:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014980; x=1741619780; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JJwNXR5/FA1bwrksoREVmlsFsu5t6bJdXbvSI3qGRv0=;
 b=HtYBiygDkTu6sG+NAazg2dTDlnQd4yyCGxvC2jqiqF9QSbxXX23s9G5YiXpq1vjglI
 7tel/2Qe7mnIr8k6q/A8Cf1cHYoiuZtDxbdDs4prsbhvYmuciHPC2LIMhFBo8M1fDrsN
 0eGNQ6eCnqd1up6bDI6mtp3UHanoOLCh+n1spcvTpXC8E1AyiC5xyOdIEy6y1e47nCQY
 KAL6V7x1mH4zD8Smzd38y/7sXJNk1iSiNEUG+bPR/YXFDxLYAcPnMK5p8wm9XyvlECJj
 rdxjF3gv+HIe+QlOsKDlnEzPGKX0tPxyVIHhB3ypeb+nPAviGWKOLWUz+u9tDM96Vqm5
 RdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014980; x=1741619780;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJwNXR5/FA1bwrksoREVmlsFsu5t6bJdXbvSI3qGRv0=;
 b=PziYNfN2AwDTM2UbdnI2l1sXiChEx1+5vD2i5yeDclNezSW49T8wJzfuIt1HXsS7Ej
 SiFA9PbBi71fyNOkQarzUj4E9aQl2PVaIEnV5Pr4qaHhRMPWIEWQscDx4CuYlX77byL0
 yAlB1pJSx+5ZPwvKOXcCElvpzIMQ/epkLDeeRgGlsX+lhuR30k9J6mWxBYntUIRzserp
 gR3b32PILCfa7NtioTvSd9wpvAWyrDTxWsH1GMHf8QY2UER1soJefri2vLkPvKVRpGJP
 aDMxgTYo1GUbMdCGCEyQxsSnwGhewMxgA5ZMntF4fLYV5IUemXx7DXdyXEu75Y1fAKzX
 C+zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf/tqmLUZLi2UfWWXzRcCYR3ZMjsjtQkSj98d3xA2vH0C0MmwDNZ1aInRxSL9qiIVY2MyxQhaKMpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzlf+ZEePjKGDDq1Ah8sWHc3SFvTVjVMfSATsKtnAQ+rBspYeGc
 Rvz+m7vGFvKH2fKi8jmUMyeAxMksdjk+3Bur6yf0Sl5z9TCtWBvy31Ezogf3Qps=
X-Gm-Gg: ASbGncvzt5CW1ksaF7rvchYE4ViPRBn3feFlOoHzaceZv9VGPdQHnZ+gYxqcDGhT6ky
 AEneNDEqWzjknpWw/Dum0gG1GdARdabQ+mONHxjCUq4rpQ5k4Qhl55VRuN/mtdPiyZSrDe7k52K
 NwOskaMsffBQshZ8dreCY/fNtA6EIFOgt6AStzTiL+lzWFNv4MB0IRYUU74eriRdlwCXU4XV9mG
 +LnQpC6mAPUpc0yYGsDod3pVybxZISy1YuVAJ32mcDf/cIPn6ZFiVgsUIqxBdX+ZTxjkFJY3/F6
 jGWvEbNfLfTS3UAsj0b2lQet/ocXBNZWn0Ug8xcF2g==
X-Google-Smtp-Source: AGHT+IE1+I1a6C4GkaIKEMJYRAIAIPlqnMwAZ4/E6m8E1fUS94oLMhy4xVMa2pj2jJk9HmcZTW1g+w==
X-Received: by 2002:a05:6a00:cd1:b0:736:4d05:2e35 with SMTP id
 d2e1a72fcca58-7364d0530cfmr8341363b3a.3.1741014979568; 
 Mon, 03 Mar 2025 07:16:19 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:16:19 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:42 +0800
Subject: [PATCH v8 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-13-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=5614;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ePNMMcEGe1JDTHAjr10tWqIoVJITlGWG4gqdbWeDX1E=;
 b=4cEJMb5KlA0GTKQX1UO6Ej4OrdsmNdwBp7kNNf9Aqn2yRanYC+vrCQFI+pSMqj8pBuZpzHKmJ
 vf7QUnqbdQRA0PzMrAGOUmi7viWIGwsHtp91OnNJO/0E5CtePGnPIgq
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, SSPPs are assigned to a maximum of two pipes. However,
quad-pipe usage scenarios require four pipes and involve configuring
two stages. In quad-pipe case, the first two pipes share a set of
mixer configurations and enable multi-rect mode when certain
conditions are met. The same applies to the subsequent two pipes.

Assign SSPPs to the pipes in each stage using a unified method and
to loop the stages accordingly.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 64 +++++++++++++++++++++----------
 3 files changed, 57 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6fbe42e8988edac7e7917ae8de180aefdaf443e9..fa487d625dde5cbd9a83ceb5163c049da45163f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1367,6 +1367,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
+/**
+ * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
+ * @state: Pointer to drm crtc state object
+ */
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
+
+	return cstate->num_mixers;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1..b14bab2754635953da402d09e11a43b9b4cf4153 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
 
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1095727d1d9f17407f2b063039bf2efd8733ec70..0245f158881b5c37fffb75d78c75310ba446a0b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1115,8 +1115,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1124,11 +1125,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1142,24 +1138,52 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	num_stages = (num_lm + 1) / PIPES_PER_STAGE;
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		i = stage_id * PIPES_PER_STAGE;
+		pipe = &pstate->pipe[i];
+		pipe_cfg = &pstate->pipe_cfg[i];
+		r_pipe = &pstate->pipe[i + 1];
+		r_pipe_cfg = &pstate->pipe_cfg[i + 1];
 
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
+		if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+			goto r_pipe_assign;
+
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
 			return -ENODEV;
 
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		/*
+		 * Check multi-rect opportunity for the 2nd pipe in the
+		 * pair. SSPP multi-rect mode cross mixer pairs is not
+		 * supported.
+		 */
+		if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+		    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+						     pipe->sspp,
+						     msm_framebuffer_format(plane_state->fb),
+						     dpu_kms->catalog->caps->max_linewidth)) {
+			DPU_DEBUG_PLANE(pdpu, "allocate sspp_%d for pipe %d and %d.\n",
+					pipe->sspp->idx - SSPP_NONE, i, i + 1);
+			continue;
+		}
+
+		DPU_DEBUG_PLANE(pdpu, "allocate sspp_%d for pipe %d\n",
+				pipe->sspp->idx - SSPP_NONE, i);
+
+r_pipe_assign:
+		if (drm_rect_width(&r_pipe_cfg->src_rect) == 0)
+			continue;
+
+		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm,
+						 global_state,
+						 crtc, &reqs);
+		if (!r_pipe->sspp)
+			return -ENODEV;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		DPU_DEBUG_PLANE(pdpu, "allocate sspp_%d for pipe %d\n",
+				r_pipe->sspp->idx - SSPP_NONE, i + 1);
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);

-- 
2.34.1

