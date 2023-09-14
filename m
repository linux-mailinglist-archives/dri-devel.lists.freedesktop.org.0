Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E679F9DD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838A810E502;
	Thu, 14 Sep 2023 05:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C794C10E500
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:14 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bfc2b26437so7787611fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668033; x=1695272833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCwInEqJkOZgCHiVZ30Oyv45wUr0zuzJYYwe4L035n0=;
 b=MnxZpnFnmQaTKDgZ/emnGnoGexgSj1ujaV2RQesjl/T2zfR2fzhyTR/xSz/BlzUGWn
 fmE60YeHeiXlzBWz+51NzCaFZFK2arOucW+9Smyed9kF1lZ39fzZSINkGmxc6zUISGQ3
 7VvwnqoZwBWEaDtFIAERODCRUCP3/ZzJcb85huKK4T3uDhjT6D2VDTrCZ31ATPhvVdJ4
 dU0QY4NIFCxSiZVm35QSPvgvH4ne1qLIad7vQRwb0XtsPXZGkzX8wdkqzt2265rU3Fbw
 EFvO3lNBnv9n5JowkWGuKZf0cCXx1zWhJ4VpYyphNAqywSWx9HPL0gCcSqAEp9eA8/zS
 4JFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668033; x=1695272833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCwInEqJkOZgCHiVZ30Oyv45wUr0zuzJYYwe4L035n0=;
 b=FO6+NwE3YLNqjMkm3T/h2yWCKhmcz76MWvwwxj2So3md4kmw+FVEA6uwMZc+Dsn+x7
 g/3wu5RxXSTUXB9lzYmL8Lwv6kwknLkkXYGqF80g88h39L479y9F7KS4Ns6hLO6ox2UK
 olqpVXrHTyUL+Rs0Cg8/zoJ53Ac5Hgj1vYfWi5GwC8nOt7G7kcc7ZckKL9T585cijvRP
 TykA9EukrW8uR/l+qGdXgMNjK/l0DXIJaZlMjfN75GeexkTYLenEnpH6CD1nsQCYTSfO
 u6ycvJhSz11cOSCM1zJs4s8j83MP0Mbiw+WXCWEP4iyzNaVLTNHt7/97PTIwxqbkeMUj
 lgxw==
X-Gm-Message-State: AOJu0Ywopwky2Zp0zcrrWOPdMosHd6J336hvJ6HeyioIOtH/mClevcES
 rWjoVTeFJXjevQ2N2GyOQvk/LA==
X-Google-Smtp-Source: AGHT+IGS7kdOJsimHfUpAE29Z+BlPVPUfHIq0NPZ7JwZWP8wzrR8XU00gMiZn5c6Y0yeB2t2p3KkGA==
X-Received: by 2002:a2e:9612:0:b0:2b5:9778:7ce2 with SMTP id
 v18-20020a2e9612000000b002b597787ce2mr3697556ljh.15.1694668033002; 
 Wed, 13 Sep 2023 22:07:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 07/12] drm/msm/dpu: add support for virtual planes
Date: Thu, 14 Sep 2023 08:07:01 +0300
Message-Id: <20230914050706.1058620-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
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

Only several SSPP blocks support such features as YUV output or scaling,
thus different DRM planes have different features.  Properly utilizing
all planes requires the attention of the compositor, who should
prefer simpler planes to YUV-supporting ones. Otherwise it is very easy
to end up in a situation when all featureful planes are already
allocated for simple windows, leaving no spare plane for YUV playback.

To solve this problem make all planes virtual. Each plane is registered
as if it supports all possible features, but then at the runtime during
the atomic_check phase the driver selects backing SSPP block for each
plane.

Note, this does not provide support for using two different SSPP blocks
for a single plane or using two rectangles of an SSPP to drive two
planes. Each plane still gets its own SSPP and can utilize either a solo
rectangle or both multirect rectangles depending on the resolution.

Note #2: By default support for virtual planes is turned off and the
driver still uses old code path with preallocated SSPP block for each
plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
kernel parameter.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  50 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 228 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  19 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  74 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  28 +++
 7 files changed, 384 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8ce7586e2ddf..df4c2e503fa5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1179,6 +1179,49 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
+static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
+{
+	int total_planes = crtc->dev->mode_config.num_total_plane;
+	struct drm_atomic_state *state = crtc_state->state;
+	struct dpu_global_state *global_state;
+	struct drm_plane_state **states;
+	struct drm_plane *plane;
+	int ret;
+
+	global_state = dpu_kms_get_global_state(crtc_state->state);
+	if (IS_ERR(global_state))
+		return PTR_ERR(global_state);
+
+	dpu_rm_release_all_sspp(global_state, crtc);
+
+	if (!crtc_state->enable)
+		return 0;
+
+	states = kcalloc(total_planes, sizeof(*states), GFP_KERNEL);
+	if (!states)
+		return -ENOMEM;
+
+	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
+		struct drm_plane_state *plane_state =
+			drm_atomic_get_plane_state(state, plane);
+
+		if (IS_ERR(plane_state)) {
+			ret = PTR_ERR(plane_state);
+			goto done;
+		}
+
+		states[plane_state->normalized_zpos] = plane_state;
+	}
+
+	ret = dpu_assign_plane_resources(global_state, state, crtc, states, total_planes);
+
+done:
+	kfree(states);
+	return ret;
+
+	return 0;
+}
+
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_atomic_state *state)
 {
@@ -1194,6 +1237,13 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
+	if (dpu_use_virtual_planes &&
+	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
+		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
+		if (rc < 0)
+			return rc;
+	}
+
 	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 172b64dc60e6..5106abe366a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -51,6 +51,9 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
+bool dpu_use_virtual_planes = false;
+module_param(dpu_use_virtual_planes, bool, 0);
+
 static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
@@ -772,8 +775,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			  type, catalog->sspp[i].features,
 			  catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR));
 
-		plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
-				       (1UL << max_crtc_count) - 1);
+		if (dpu_use_virtual_planes)
+			plane = dpu_plane_init_virtual(dev, type, (1UL << max_crtc_count) - 1);
+		else
+			plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
+					       (1UL << max_crtc_count) - 1);
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index dd2be279b366..89947ba25230 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -63,6 +63,8 @@
 #define ktime_compare_safe(A, B) \
 	ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
 
+extern bool dpu_use_virtual_planes;
+
 struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
@@ -137,6 +139,8 @@ struct dpu_global_state {
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
 	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
+
+	uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4cf69f93b44f..2ac6e1074c62 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -857,7 +857,7 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	drm_rect_rotate_inv(&pipe_cfg->src_rect,
 			    new_plane_state->fb->width, new_plane_state->fb->height,
 			    new_plane_state->rotation);
-	if (r_pipe_cfg->src_rect.x1 != 0)
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
 		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
@@ -917,7 +917,7 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	if (r_pipe_cfg->src_rect.x1 != 0) {
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
 		/*
 		 * In parallel multirect case only the half of the usual width
 		 * is supported for tiled formats. If we are here, we know that
@@ -995,6 +995,108 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	return dpu_plane_atomic_check_pipes(plane, state);
 }
 
+static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
+					  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state =
+		drm_atomic_get_plane_state(state, plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
+	const struct dpu_format *format;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	if (plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   plane_state->crtc);
+
+	ret = dpu_plane_atomic_check_nopipe(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	if (!plane_state->visible) {
+		/*
+		 * resources are freed by dpu_crtc_assign_plane_resources(),
+		 * but clean them here.
+		 */
+		pstate->pipe.sspp = NULL;
+		pstate->r_pipe.sspp = NULL;
+
+		return 0;
+	}
+
+	format = to_dpu_format(msm_framebuffer_format(plane_state->fb));
+
+	/* force resource reallocation if the format of FB has changed */
+	if (pstate->saved_fmt != format) {
+		crtc_state->planes_changed = true;
+		pstate->saved_fmt = format;
+	}
+
+	return 0;
+}
+
+static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
+					      struct dpu_global_state *global_state,
+					      struct drm_atomic_state *state,
+					      struct drm_plane_state *plane_state)
+{
+	struct drm_plane *plane = plane_state->plane;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_rm_sspp_requirements reqs;
+	struct dpu_plane_state *pstate;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe *r_pipe;
+	const struct dpu_format *fmt;
+
+	pstate = to_dpu_plane_state(plane_state);
+	pipe = &pstate->pipe;
+	r_pipe = &pstate->r_pipe;
+
+	pipe->sspp = NULL;
+	r_pipe->sspp = NULL;
+
+	if (!plane_state->fb)
+		return -EINVAL;
+
+	fmt = to_dpu_format(msm_framebuffer_format(plane_state->fb));
+	reqs.yuv = DPU_FORMAT_IS_YUV(fmt);
+	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
+		(plane_state->src_h >> 16 != plane_state->crtc_h);
+
+	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
+
+	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+	if (!pipe->sspp)
+		return -ENODEV;
+
+	return dpu_plane_atomic_check_pipes(plane, state);
+}
+
+int dpu_assign_plane_resources(struct dpu_global_state *global_state,
+			       struct drm_atomic_state *state,
+			       struct drm_crtc *crtc,
+			       struct drm_plane_state **states,
+			       unsigned int num_planes)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_planes; i++) {
+		struct drm_plane_state *plane_state = states[i];
+
+		if (!plane_state ||
+		    !plane_state->visible)
+			continue;
+
+		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
+							 state, plane_state);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
 {
 	const struct dpu_format *format =
@@ -1338,12 +1440,14 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
-	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
-	drm_printf(p, "\tmultirect_index[0]=%s\n",
-		   dpu_get_multirect_index(pipe->multirect_index));
-	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
-	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	if (pipe->sspp) {
+		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
+		drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
+		drm_printf(p, "\tmultirect_index[0]=%s\n",
+			   dpu_get_multirect_index(pipe->multirect_index));
+		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
+		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	}
 
 	if (r_pipe->sspp) {
 		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
@@ -1433,18 +1537,26 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
+static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
+	.prepare_fb = dpu_plane_prepare_fb,
+	.cleanup_fb = dpu_plane_cleanup_fb,
+	.atomic_check = dpu_plane_virtual_atomic_check,
+	.atomic_update = dpu_plane_atomic_update,
+};
+
 /* initialize plane */
-struct drm_plane *dpu_plane_init(struct drm_device *dev,
-		uint32_t pipe, enum drm_plane_type type,
-		unsigned long possible_crtcs)
+static struct drm_plane *dpu_plane_init_common(struct drm_device *dev,
+					       enum drm_plane_type type,
+					       unsigned long possible_crtcs,
+					       bool inline_rotation,
+					       const uint32_t *format_list,
+					       uint32_t num_formats,
+					       enum dpu_sspp pipe)
 {
 	struct drm_plane *plane = NULL;
-	const uint32_t *format_list;
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	struct dpu_hw_sspp *pipe_hw;
-	uint32_t num_formats;
 	uint32_t supported_rotations;
 	int ret = -EINVAL;
 
@@ -1460,16 +1572,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	plane = &pdpu->base;
 	pdpu->pipe = pipe;
 
-	/* initialize underlying h/w driver */
-	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
-	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
-		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
-		goto clean_plane;
-	}
-
-	format_list = pipe_hw->cap->sblk->format_list;
-	num_formats = pipe_hw->cap->sblk->num_formats;
-
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
@@ -1490,7 +1592,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
 
-	if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
+	if (inline_rotation)
 		supported_rotations |= DRM_MODE_ROTATE_MASK;
 
 	drm_plane_create_rotation_property(plane,
@@ -1499,8 +1601,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	drm_plane_enable_fb_damage_clips(plane);
 
 	/* success! finalize initialization */
-	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
-
 	mutex_init(&pdpu->lock);
 
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
@@ -1511,3 +1611,77 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	kfree(pdpu);
 	return ERR_PTR(ret);
 }
+
+struct drm_plane *dpu_plane_init(struct drm_device *dev,
+				 uint32_t pipe, enum drm_plane_type type,
+				 unsigned long possible_crtcs)
+{
+	struct drm_plane *plane = NULL;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *kms = to_dpu_kms(priv->kms);
+	struct dpu_hw_sspp *pipe_hw;
+
+	/* initialize underlying h/w driver */
+	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
+	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
+		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
+		return ERR_PTR(-EINVAL);
+	}
+
+
+	plane = dpu_plane_init_common(dev, type, possible_crtcs,
+				      pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION),
+				      pipe_hw->cap->sblk->format_list,
+				      pipe_hw->cap->sblk->num_formats,
+				      pipe);
+	if (IS_ERR(plane))
+		return plane;
+
+	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
+
+	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
+					pipe, plane->base.id);
+
+	return plane;
+}
+
+struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
+					 enum drm_plane_type type,
+					 unsigned long possible_crtcs)
+{
+	struct drm_plane *plane = NULL;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *kms = to_dpu_kms(priv->kms);
+	bool has_inline_rotation = false;
+	const u32 *format_list = NULL;
+	u32 num_formats = 0;
+	int i;
+
+	/* Determine the largest configuration that we can implement */
+	for (i = 0; i < kms->catalog->sspp_count; i++) {
+		const struct dpu_sspp_cfg *cfg = &kms->catalog->sspp[i];
+
+		if (test_bit(DPU_SSPP_INLINE_ROTATION, &cfg->features))
+			has_inline_rotation = true;
+
+		if (!format_list ||
+		    cfg->features & DPU_SSPP_CSC_ANY) {
+			format_list = cfg->sblk->format_list;
+			num_formats = cfg->sblk->num_formats;
+		}
+	}
+
+	plane = dpu_plane_init_common(dev, type, possible_crtcs,
+				      has_inline_rotation,
+				      format_list,
+				      num_formats,
+				      SSPP_NONE);
+	if (IS_ERR(plane))
+		return plane;
+
+	drm_plane_helper_add(plane, &dpu_plane_virtual_helper_funcs);
+
+	DPU_DEBUG("%s created virtual id:%u\n", plane->name, plane->base.id);
+
+	return plane;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index a3ae45dc95d0..15f7d60d8b85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -30,6 +30,7 @@
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
+ * @saved_fmt: format used by the plane's FB, saved for for virtual plane support
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -46,6 +47,8 @@ struct dpu_plane_state {
 	u64 plane_clk;
 
 	bool needs_dirtyfb;
+
+	const struct dpu_format *saved_fmt;
 };
 
 #define to_dpu_plane_state(x) \
@@ -75,6 +78,16 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
 		unsigned long possible_crtcs);
 
+/**
+ * dpu_plane_init_virtual - create new dpu virtualized plane
+ * @dev:   Pointer to DRM device
+ * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
+ * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
+ */
+struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
+					 enum drm_plane_type type,
+					 unsigned long possible_crtcs);
+
 /**
  * dpu_plane_color_fill - enables color fill on plane
  * @plane:  Pointer to DRM plane object
@@ -91,4 +104,10 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
 static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
 #endif
 
+int dpu_assign_plane_resources(struct dpu_global_state *global_state,
+			       struct drm_atomic_state *state,
+			       struct drm_crtc *crtc,
+			       struct drm_plane_state **states,
+			       unsigned int num_planes);
+
 #endif /* _DPU_PLANE_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 5e3442fb8678..1b0166bc9bee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -593,6 +593,80 @@ int dpu_rm_reserve(
 	return ret;
 }
 
+struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
+					struct dpu_global_state *global_state,
+					struct drm_crtc *crtc,
+					struct dpu_rm_sspp_requirements *reqs)
+{
+	uint32_t crtc_id = crtc->base.id;
+	unsigned int weight, best_weght = UINT_MAX;
+	struct dpu_hw_sspp *hw_sspp;
+	unsigned long mask = 0;
+	int i, best_idx = -1;
+
+	/*
+	 * Don't take cursor feature into consideration until there is proper support for SSPP_CURSORn.
+	 */
+	mask |= BIT(DPU_SSPP_CURSOR);
+
+	if (reqs->scale)
+		mask |= DPU_SSPP_SCALER;
+
+	if (reqs->yuv)
+		mask |= DPU_SSPP_CSC_ANY;
+
+	if (reqs->rot90)
+		mask |= DPU_SSPP_INLINE_ROTATION;
+
+	for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++) {
+		if (!rm->hw_sspp[i])
+			continue;
+
+		if (global_state->sspp_to_crtc_id[i])
+			continue;
+
+		hw_sspp = rm->hw_sspp[i];
+
+		/* skip incompatible planes */
+		if (reqs->scale && !(hw_sspp->cap->features & DPU_SSPP_SCALER))
+			continue;
+
+		if (reqs->yuv && !(hw_sspp->cap->features & DPU_SSPP_CSC_ANY))
+			continue;
+
+		if (reqs->rot90 && !(hw_sspp->cap->features & DPU_SSPP_INLINE_ROTATION))
+			continue;
+
+		/*
+		 * For non-yuv, non-scaled planes prefer simple (DMA or RGB)
+		 * plane, falling back to VIG only if there are no such planes.
+		 *
+		 * This way we'd leave VIG sspps to be later used for YUV formats.
+		 */
+		weight = hweight64(hw_sspp->cap->features & ~mask);
+		if (weight < best_weght) {
+			best_weght = weight;
+			best_idx = i;
+		}
+	}
+
+	if (best_idx < 0)
+		return NULL;
+
+	global_state->sspp_to_crtc_id[best_idx] = crtc_id;
+
+	return rm->hw_sspp[best_idx];
+}
+
+void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
+			     struct drm_crtc *crtc)
+{
+	uint32_t crtc_id = crtc->base.id;
+
+	_dpu_rm_clear_mapping(global_state->sspp_to_crtc_id,
+		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
+}
+
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 913baca81a42..ae94848beb58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -35,6 +35,12 @@ struct dpu_rm {
 	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
 };
 
+struct dpu_rm_sspp_requirements {
+	bool yuv;
+	bool scale;
+	bool rot90;
+};
+
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
@@ -85,6 +91,28 @@ int dpu_rm_reserve(struct dpu_rm *rm,
 void dpu_rm_release(struct dpu_global_state *global_state,
 		struct drm_encoder *enc);
 
+/**
+ * dpu_rm_reserve_sspp - Reserve the required SSPP for the provided CRTC
+ * @rm: DPU Resource Manager handle
+ * @global_state: private global state
+ * @crtc: DRM CRTC handle
+ * @reqs: SSPP required features
+ */
+struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
+					struct dpu_global_state *global_state,
+					struct drm_crtc *crtc,
+					struct dpu_rm_sspp_requirements *reqs);
+
+/**
+ * dpu_rm_release_all_sspp - Given the CRTC, release all SSPP
+ *	blocks previously reserved for that use case.
+ * @rm: DPU Resource Manager handle
+ * @crtc: DRM CRTC handle
+ * @Return: 0 on Success otherwise -ERROR
+ */
+void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
+			     struct drm_crtc *crtc);
+
 /**
  * Get hw resources of the given type that are assigned to this encoder.
  */
-- 
2.39.2

