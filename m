Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2D43BB4E8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB5C89C6C;
	Mon,  5 Jul 2021 01:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5627289BFC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id v14so3943158lfb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FS0wBor72lwtDqqGaNQ94EbgDco+WDfbD45HiffsXpM=;
 b=zSkuMUEMUhPtECUi1qHD+rMzplKoQf6CttCztaU+9e5ak8Pfb7+zdI63m71wRV/y1S
 fHM9okIG6RZQ9Lr2fxb8UbljrCzQ1cEjwAxY62tsCdjonnzPmyZASDeVL3C6bV1wW4gW
 M5bbdnFBk4IEsSVYvWd/olPjJlFKkwQ64ejoTAjlM2oKl1Rva3FGzzzFSi77E1o+jtX2
 XHs23l4Sj3t0lDNrHhaovFRbi2z+qZ3TbOgbyq4goMZKP3CrA+Up0jMJdG42ekOXfK5K
 ItE+ewno+UXoe5JFZVM2qD9mTj/D6pUNx9jm/q1+ya02ZZNYbL97KB6KCGfOmLTzeeDG
 gyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FS0wBor72lwtDqqGaNQ94EbgDco+WDfbD45HiffsXpM=;
 b=BhPB1vmctNWebrikJ4jT810IsYQHXYBMnd3Z0GsMARbY7EFi7i27hxluJUxIRzzpH1
 JnpFGXS7bYrcSdv/TktDVyhtKmfU5slhYoXeca249uA8ywKsSRq2+7iuopqC+gGOgFKi
 2mkSGdHzSzg5fxwQra0/LLhAEnV7duGSuG6zfKU8/dKlD2MmRaT/EWyaBKNzcUdyWmYH
 WMYkQAQPjSfB4TnihystQILAJYyzTtfU4/CdAOkauuNHsRs5kzlzmMNjXFhxd8wk0Hym
 Zg2wDvRGwzSnstn/DI7Z16BPHurUbZHFXPyk3C7uOsA688OF7ypNIvUcm7H9J08gUR5W
 /R4w==
X-Gm-Message-State: AOAM531H+K9QiJ+QOV3ddLksv3DyywTbq2IzrbgOygfl1emQlh8cZMLc
 XOJmhbPAQqIpWhBqWBdHqzF53g==
X-Google-Smtp-Source: ABdhPJx9X+N4qsv4a9MphwoiaagyXSRHIvfdw9FmYeLUVEBQjbkj05d2/ekYlOAZ1lixvsHzLeI+MA==
X-Received: by 2002:ac2:44ae:: with SMTP id c14mr996883lfm.152.1625448321579; 
 Sun, 04 Jul 2021 18:25:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 19/22] drm/msm/dpu: add support for virtualized planes
Date: Mon,  5 Jul 2021 04:21:12 +0300
Message-Id: <20210705012115.4179824-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for registering unified (virtualized) planes, allowing SSPP
block to be allocated at runtime, during atomic_check. This allows
userspace app to use any plane without caring if it supports scaler or
YUV formats. All planes are marked as supporting all formats and scaler
options. The kernel space will select the appropriate SSPP pipe or
return an error if we run out of resources.

Virtual planes are disabled by default, use msm.dpu_use_virtual_planes=1
kernel parameter to enable them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 115 ++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 109 ++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 133 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  21 +---
 4 files changed, 272 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f311cdbfe7d2..49bdd5953b9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -206,6 +206,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
+	enum dpu_sspp pipe;
 
 	memset(fetch_active, 0, sizeof(fetch_active));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
@@ -216,14 +217,19 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		dpu_plane_get_ctl_flush(plane, ctl, &flush_mask);
-		set_bit(dpu_plane_pipe(plane), fetch_active);
+		if (WARN_ON(!pstate->pipe_hw))
+			continue;
+
+		pipe = pstate->pipe_hw->idx;
+
+		flush_mask = ctl->ops.get_bitmask_sspp(ctl, pipe);
+		set_bit(pipe, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
 				crtc->base.id,
 				pstate->stage,
 				plane->base.id,
-				dpu_plane_pipe(plane) - SSPP_VIG0,
+				pipe - SSPP_VIG0,
 				state->fb ? state->fb->base.id : -1);
 
 		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
@@ -233,13 +239,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		stage_idx = zpos_cnt[pstate->stage]++;
 		stage_cfg->stage[pstate->stage][stage_idx] =
-					dpu_plane_pipe(plane);
+					pipe;
 		stage_cfg->multirect_index[pstate->stage][stage_idx] =
 					pstate->multirect_index;
 
 		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 					   state, pstate, stage_idx,
-					   dpu_plane_pipe(plane) - SSPP_VIG0,
+					   pipe - SSPP_VIG0,
 					   format->base.pixel_format,
 					   fb ? fb->modifier : 0);
 
@@ -875,13 +881,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	drm_crtc_vblank_on(crtc);
 }
 
-struct plane_state {
-	struct dpu_plane_state *dpu_pstate;
-	const struct drm_plane_state *drm_pstate;
-	int stage;
-	u32 pipe_id;
-};
-
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_atomic_state *state)
 {
@@ -889,17 +888,25 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
-	struct plane_state *pstates;
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	struct dpu_global_state *global_state = dpu_kms_get_global_state(state);
+
+	struct dpu_plane_state **pstates;
+	struct dpu_plane_state *pstate;
 
-	const struct drm_plane_state *pstate;
+	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	struct drm_display_mode *mode;
 
-	int cnt = 0, rc = 0, i;
+	int rc = 0, i;
+	unsigned int num_planes, max_zpos = 0;
 
+	struct drm_rect dst;
 	struct drm_rect crtc_rect = { 0 };
+	int stage;
 
-	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
+	num_planes = DPU_STAGE_MAX * 4;
+	pstates = kcalloc(num_planes, sizeof(*pstates), GFP_KERNEL);
 
 	if (!crtc_state->enable || !crtc_state->active) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
@@ -923,28 +930,57 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	crtc_rect.y2 = mode->vdisplay;
 
 	 /* get plane state for all drm planes associated with crtc state */
-	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
-		struct drm_rect dst, clip = crtc_rect;
-
-		if (IS_ERR_OR_NULL(pstate)) {
-			rc = PTR_ERR(pstate);
+	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
+		plane_state = drm_atomic_get_plane_state(state, plane);
+		if (IS_ERR(plane_state)) {
+			rc = PTR_ERR(plane_state);
 			DPU_ERROR("%s: failed to get plane%d state, %d\n",
 					dpu_crtc->name, plane->base.id, rc);
 			goto end;
 		}
-		if (cnt >= DPU_STAGE_MAX * 4)
+
+		if (plane_state->normalized_zpos >= num_planes) {
+			DPU_ERROR("%s: normalized zpos is too big for plane %d: %d\n",
+					dpu_crtc->name, plane->base.id, plane_state->normalized_zpos);
+			rc = -EINVAL;
+			goto end;
+		}
+
+		pstate = to_dpu_plane_state(plane_state);
+		pstates[plane_state->normalized_zpos] = pstate;
+		max_zpos = max(max_zpos, plane_state->normalized_zpos);
+
+		/* Here we are going to release SSPP blocks and acquire them later in dpu_plane_set_pipe.
+		 *
+		 * TODO: optimize to that we do not reacquire SSPPs if none of
+		 * the plane modes/formats/etc were changed, no planes added or removed.
+		 */
+		if (pstate->pipe_hw) {
+			dpu_rm_release_sspp(&dpu_kms->rm, global_state, plane->base.id);
+			pstate->pipe_hw = NULL;
+		}
+	}
+
+	stage = DPU_STAGE_0;
+	for (i = 0; i <= max_zpos; i++) {
+		pstate = pstates[i];
+		if (!pstate)
 			continue;
 
-		pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
-		pstates[cnt].drm_pstate = pstate;
-		pstates[cnt].stage = pstate->normalized_zpos;
+		/* verify stage setting before using it */
+		if (stage >= DPU_STAGE_MAX) {
+			DPU_ERROR("> %d plane stages assigned\n",
+					DPU_STAGE_MAX - DPU_STAGE_0);
+			rc = -EINVAL;
+			goto end;
+		}
 
-		dpu_plane_clear_multirect(pstate);
+		plane_state = &pstate->base;
 
-		cnt++;
+		dpu_plane_clear_multirect(plane_state);
 
-		dst = drm_plane_state_dest(pstate);
-		if (!drm_rect_intersect(&clip, &dst)) {
+		dst = drm_plane_state_dest(plane_state);
+		if (!drm_rect_intersect(&dst, &crtc_rect)) {
 			DPU_ERROR("invalid vertical/horizontal destination\n");
 			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
 				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
@@ -952,21 +988,22 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			rc = -E2BIG;
 			goto end;
 		}
-	}
 
-	for (i = 0; i < cnt; i++) {
-		int z_pos = pstates[i].stage;
+		plane = pstate->base.plane;
+		rc = dpu_plane_set_pipe(plane, pstate);
+		if (rc) {
+			DPU_ERROR("%s: error setting pipe for %s\n", dpu_crtc->name, plane->name);
+			goto end;
+		}
 
-		/* verify z_pos setting before using it */
-		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
-			DPU_ERROR("> %d plane stages assigned\n",
-					DPU_STAGE_MAX - DPU_STAGE_0);
-			rc = -EINVAL;
+		rc = dpu_plane_real_atomic_check(plane, state);
+		if (rc) {
+			DPU_ERROR("%s: error checking pipe for %s\n", dpu_crtc->name, plane->name);
 			goto end;
 		}
 
-		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
-		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
+		pstates[i]->stage = stage++;
+		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
 	}
 
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 66a1c8889cf3..08a7e56cc98f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -47,6 +47,9 @@
 
 #define MIN_IB_BW	400000000ULL /* Min ib vote 400MB */
 
+static bool dpu_use_virtual_planes = false;
+module_param(dpu_use_virtual_planes, bool, 0);
+
 static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
@@ -581,32 +584,20 @@ static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
 	priv->num_encoders = 0;
 }
 
-static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
+static int _dpu_kms_create_planes(struct dpu_kms *dpu_kms, int max_crtc_count, struct drm_plane **primary_planes, struct drm_plane **cursor_planes)
 {
 	struct drm_device *dev;
-	struct drm_plane *primary_planes[MAX_PLANES], *plane;
-	struct drm_plane *cursor_planes[MAX_PLANES] = { NULL };
-	struct drm_crtc *crtc;
+	struct drm_plane *plane;
 
 	struct msm_drm_private *priv;
 	struct dpu_mdss_cfg *catalog;
 
-	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
-	int max_crtc_count;
+	int primary_planes_idx = 0, cursor_planes_idx = 0, i;
+
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 	catalog = dpu_kms->catalog;
 
-	/*
-	 * Create encoder and query display drivers to create
-	 * bridges and connectors
-	 */
-	ret = _dpu_kms_setup_displays(dev, priv, dpu_kms);
-	if (ret)
-		goto fail;
-
-	max_crtc_count = min(catalog->mixer_count, priv->num_encoders);
-
 	/* Create the planes, keeping track of one primary/cursor per crtc */
 	for (i = 0; i < catalog->sspp_count; i++) {
 		enum drm_plane_type type;
@@ -627,8 +618,51 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 				       (1UL << max_crtc_count) - 1);
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
-			ret = PTR_ERR(plane);
-			goto fail;
+			return PTR_ERR(plane);
+		}
+		priv->planes[priv->num_planes++] = plane;
+
+		if (type == DRM_PLANE_TYPE_CURSOR)
+			cursor_planes[cursor_planes_idx++] = plane;
+		else if (type == DRM_PLANE_TYPE_PRIMARY)
+			primary_planes[primary_planes_idx++] = plane;
+	}
+
+	return 0;
+}
+
+static int _dpu_kms_create_planes_virtual(struct dpu_kms *dpu_kms, int max_crtc_count, struct drm_plane **primary_planes, struct drm_plane **cursor_planes)
+{
+	struct drm_device *dev;
+	struct drm_plane *plane;
+
+	struct msm_drm_private *priv;
+	struct dpu_mdss_cfg *catalog;
+
+	int primary_planes_idx = 0, cursor_planes_idx = 0, i;
+
+	dev = dpu_kms->dev;
+	priv = dev->dev_private;
+	catalog = dpu_kms->catalog;
+
+	/* Create the planes, keeping track of one primary/cursor per crtc */
+	for (i = 0; i < catalog->sspp_count; i++) {
+		enum drm_plane_type type;
+
+		if (primary_planes_idx < max_crtc_count)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else if (cursor_planes_idx < max_crtc_count)
+			type = DRM_PLANE_TYPE_CURSOR;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		DPU_DEBUG("Create virtual plane type %d \n", type);
+
+		plane = dpu_plane_init(dev, SSPP_NONE, type,
+				       (1UL << max_crtc_count) - 1);
+		if (IS_ERR(plane)) {
+			DPU_ERROR("dpu_plane_init failed\n");
+			return PTR_ERR(plane);
 		}
 		priv->planes[priv->num_planes++] = plane;
 
@@ -638,10 +672,47 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			primary_planes[primary_planes_idx++] = plane;
 	}
 
-	max_crtc_count = min(max_crtc_count, primary_planes_idx);
+	return 0;
+}
+
+static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
+{
+	struct drm_device *dev;
+	struct drm_plane *primary_planes[MAX_PLANES] = { NULL };
+	struct drm_plane *cursor_planes[MAX_PLANES] = { NULL };
+	struct drm_crtc *crtc;
+
+	struct msm_drm_private *priv;
+	struct dpu_mdss_cfg *catalog;
+
+	int i, ret;
+	int max_crtc_count;
+	dev = dpu_kms->dev;
+	priv = dev->dev_private;
+	catalog = dpu_kms->catalog;
+
+	/*
+	 * Create encoder and query display drivers to create
+	 * bridges and connectors
+	 */
+	ret = _dpu_kms_setup_displays(dev, priv, dpu_kms);
+	if (ret)
+		goto fail;
+
+	max_crtc_count = min(catalog->mixer_count, priv->num_encoders);
+
+	if (dpu_use_virtual_planes)
+		ret = _dpu_kms_create_planes_virtual(dpu_kms, max_crtc_count, primary_planes, cursor_planes);
+	else
+		ret = _dpu_kms_create_planes(dpu_kms, max_crtc_count, primary_planes, cursor_planes);
+	if (ret)
+		goto fail;
 
 	/* Create one CRTC per encoder */
 	for (i = 0; i < max_crtc_count; i++) {
+		if (!primary_planes[i])
+			break;
+
 		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a6de7f3ae2d8..d692136884ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -848,18 +848,6 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
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
@@ -940,8 +928,86 @@ static bool dpu_plane_validate_src(struct drm_rect *src,
 		drm_rect_equals(fb_rect, src);
 }
 
+int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate)
+{
+	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_global_state *global_state = dpu_kms_get_global_state(pstate->base.state);
+	enum dpu_sspp pipe;
+	bool yuv, scale;
+
+	if (pdpu->pipe != SSPP_NONE) {
+		pipe = pdpu->pipe;
+		goto out;
+	}
+
+	yuv = pstate->base.fb ? DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(pstate->base.fb))) : false;
+	scale = (pstate->base.src_w >> 16 != pstate->base.crtc_w) ||
+		(pstate->base.src_h >> 16 != pstate->base.crtc_h);
+
+	pipe = dpu_rm_get_sspp(&kms->rm, global_state, plane->base.id, yuv, scale);
+
+	DRM_DEBUG_ATOMIC("PLANE %d got SSPP %d\n", plane->base.id, pipe);
+
+out:
+	if (pipe == SSPP_NONE || pipe >= SSPP_MAX || !kms->rm.sspp_blks[pipe - SSPP_NONE])
+		return -EINVAL;
+
+	pstate->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
+
+	return 0;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_global_state *global_state = dpu_kms_get_global_state(state);
+
+	if (!new_plane_state->fb)
+		new_plane_state->visible = false;
+
+	/*
+	 * Free unused pipes during atomic_check. They might be picked up
+	 * later, during pipes reallocation. The real checks will be executed
+	 * later, from dpu_plane_real_atomic_check() called from
+	 * dpu_crtc_atomic_check when the pipes are allocated.
+	 */
+	if (!new_plane_state->visible &&
+	    pstate->pipe_hw != NULL) {
+		/*
+		 * If the pipe was statically allocated during dpu_plane_init, do not
+		 * touch dpu_rm here.
+		 */
+		if (pdpu->pipe != SSPP_NONE)
+			return 0;
+
+		DRM_DEBUG_ATOMIC("PLANE %d released SSPP %d\n", plane->base.id, pstate->pipe_hw->idx);
+		dpu_rm_release_sspp(&dpu_kms->rm, global_state, plane->base.id);
+		pstate->pipe_hw = NULL;
+	}
+
+	return 0;
+}
+
+static bool dpu_plane_check_sspp_format(struct dpu_hw_pipe *pipe_hw, u32 format)
+{
+	int i;
+
+	for (i = 0; i < pipe_hw->cap->sblk->num_formats; i++) {
+		if (format == pipe_hw->cap->sblk->format_list[i])
+			return true;
+	}
+
+	return false;
+}
+
+int dpu_plane_real_atomic_check(struct drm_plane *plane,
+				struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
@@ -969,6 +1035,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	if (!dpu_plane_check_sspp_format(pstate->pipe_hw, new_plane_state->fb->format->format)) {
+		DPU_ERROR("Format %p4cc not supported by the selected SSPP %d\n",
+				&new_plane_state->fb->format->format, pstate->pipe_hw->idx);
+
+		return -EINVAL;
+	}
+
 	src.x1 = new_plane_state->src_x >> 16;
 	src.y1 = new_plane_state->src_y >> 16;
 	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
@@ -1205,6 +1278,8 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 				pstate->multirect_mode);
 
 	pstate->pending = true;
+
+	pstate->pipe_hw = NULL;
 }
 
 static void dpu_plane_atomic_update(struct drm_plane *plane,
@@ -1286,7 +1361,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
-	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1308,8 +1382,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	pstate->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pdpu->pipe - SSPP_NONE]);
-
 	pstate->base.plane = plane;
 
 	plane->state = &pstate->base;
@@ -1364,11 +1436,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
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
@@ -1379,7 +1446,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	struct dpu_hw_pipe *pipe_hw;
 	uint32_t num_formats;
 	int ret = -EINVAL;
 
@@ -1395,19 +1461,22 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	plane = &pdpu->base;
 	pdpu->pipe = pipe;
 
-	/* initialize underlying h/w driver */
-	if (!kms->rm.sspp_blks[pipe - SSPP_NONE])
-		goto clean_plane;
-	pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
-
-	if (!pipe_hw->cap || !pipe_hw->cap->sblk) {
-		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
-		goto clean_plane;
+	if (pdpu->pipe == SSPP_NONE) {
+		format_list = kms->catalog->caps->format_list;
+		num_formats = kms->catalog->caps->num_formats;
+	} else if (pdpu->pipe < SSPP_MAX) {
+		struct dpu_hw_pipe *pipe_hw;
+
+		if (!kms->rm.sspp_blks[pdpu->pipe - SSPP_NONE])
+			return ERR_PTR(-EINVAL);
+		pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pdpu->pipe - SSPP_NONE]);
+		format_list = pipe_hw->cap->sblk->format_list;
+		num_formats = pipe_hw->cap->sblk->num_formats;
+	} else {
+		return ERR_PTR(-EINVAL);
 	}
 
-	format_list = pipe_hw->cap->sblk->format_list;
-	num_formats = pipe_hw->cap->sblk->num_formats;
-
+	/* initialize underlying h/w driver */
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 42b88b6bc9c2..0940ffbb8b28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -54,22 +54,6 @@ struct dpu_multirect_plane_states {
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
-/**
- * dpu_plane_pipe - return sspp identifier for the given plane
- * @plane:   Pointer to DRM plane object
- * Returns: sspp identifier of the given plane
- */
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
-
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
@@ -123,4 +107,9 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
 static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
 #endif
 
+int dpu_plane_set_pipe(struct drm_plane *plane, struct dpu_plane_state *pstate);
+
+int dpu_plane_real_atomic_check(struct drm_plane *plane,
+				struct drm_atomic_state *state);
+
 #endif /* _DPU_PLANE_H_ */
-- 
2.30.2

