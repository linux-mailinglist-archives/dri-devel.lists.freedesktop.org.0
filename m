Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B56BD93A3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA0D10E21C;
	Tue, 14 Oct 2025 12:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KURGoEuo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C96710E5D7;
 Tue, 14 Oct 2025 12:09:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0175A61E4A;
 Tue, 14 Oct 2025 12:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2653AC4CEFE;
 Tue, 14 Oct 2025 12:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443259;
 bh=vP8VV2WMgH8+wnOSqTJR2WtfyqUjyMXxAPajXCiBnPA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KURGoEuoHC27Jz4fNyU+1o5A8awVXBokUhCX9dFxTyWdifv6rbCNU4S4SaaFu3bJa
 30wemBmnFsbpzWHC6/oxBKLCaEyGuBU+s3LSwF7jsyc9qXYdcwOIuvtJ5gK1qbq4HM
 /4qnyA3BLAikgazdLpLieFm7fovbF9sw6mfjAtP/3fzl4HJulOUwbgtATCnR9Xn+Tn
 PFvG/e+VgbQ46/DNBjuZpze4m39DcyTGC857v6PoCVF1YWM8R+j7kyqXWmWMDClMzr
 M5SeFT0RH+ul2noy82NKJ77pCoMFwDNz3LDgACF3grMHqEXofRCYZDUA2fDoojhxQX
 hRnsy/yKe4VGA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:32:00 +0200
Subject: [PATCH v2 16/16] drm/atomic: Remove state argument to
 drm_atomic_private_obj_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-drm-private-obj-reset-v2-16-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 amd-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17180; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vP8VV2WMgH8+wnOSqTJR2WtfyqUjyMXxAPajXCiBnPA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrL1+fpRWef7t5c8rX835rmr98VBXdCz6aTb7i8bVt
 kPbmmoyO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEttQz1gex3hLjDP6+5tmx
 JXcWtCaZLCs3zpRxZpS79XvpfJOdZ14tdM8x+iv39Ev8de7pZZ0qkxnrLH+uDwn6fjRBaeHzyle
 yLQelmO6l9hu3CTc9U/r/8qsYk5rR1gUr5/M9Pyl6bu47v4NTAQ==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Now that all drm_private_objs users have been converted to use
atomic_create_state instead of the old ad-hoc initialization, we can
remove the state parameter from drm_private_obj_init and the fallback
code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---

To: Liviu Dudau <liviu.dudau@arm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-mips@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   |  1 -
 .../gpu/drm/arm/display/komeda/komeda_private_obj.c | 16 ++++++++--------
 drivers/gpu/drm/display/drm_dp_mst_topology.c       |  1 -
 drivers/gpu/drm/display/drm_dp_tunnel.c             |  2 +-
 drivers/gpu/drm/drm_atomic.c                        | 21 ++++-----------------
 drivers/gpu/drm/drm_bridge.c                        |  1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c           |  2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c               |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c             |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c            |  1 -
 drivers/gpu/drm/omapdrm/omap_drv.c                  |  2 +-
 drivers/gpu/drm/tegra/hub.c                         |  2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                       |  4 +---
 include/drm/drm_atomic.h                            |  1 -
 14 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 239b3f58694919b7dbb8836f8859788b50288ffa..ba63085afafb8483c5f6249f2b6e09a0a0507fc9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4727,11 +4727,10 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 	/* indicates support for immediate flip */
 	adev_to_drm(adev)->mode_config.async_page_flip = true;
 
 	drm_atomic_private_obj_init(adev_to_drm(adev),
 				    &adev->dm.atomic_obj,
-				    NULL,
 				    &dm_atomic_state_funcs);
 
 	r = amdgpu_display_modeset_create_props(adev);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
index 4994b69c6595637ea832b97629b052e3aea97ee7..6270e5c525db221267b1215a27653ace578eeb0a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
@@ -63,11 +63,11 @@ static const struct drm_private_state_funcs komeda_layer_obj_funcs = {
 };
 
 static int komeda_layer_obj_add(struct komeda_kms_dev *kms,
 				struct komeda_layer *layer)
 {
-	drm_atomic_private_obj_init(&kms->base, &layer->base.obj, NULL,
+	drm_atomic_private_obj_init(&kms->base, &layer->base.obj,
 				    &komeda_layer_obj_funcs);
 	return 0;
 }
 
 static struct drm_private_state *
@@ -116,11 +116,11 @@ static const struct drm_private_state_funcs komeda_scaler_obj_funcs = {
 
 static int komeda_scaler_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_scaler *scaler)
 {
 	drm_atomic_private_obj_init(&kms->base,
-				    &scaler->base.obj, NULL,
+				    &scaler->base.obj,
 				    &komeda_scaler_obj_funcs);
 	return 0;
 }
 
 static struct drm_private_state *
@@ -168,11 +168,11 @@ static const struct drm_private_state_funcs komeda_compiz_obj_funcs = {
 };
 
 static int komeda_compiz_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_compiz *compiz)
 {
-	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj, NULL,
+	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj,
 				    &komeda_compiz_obj_funcs);
 
 	return 0;
 }
 
@@ -222,11 +222,11 @@ static const struct drm_private_state_funcs komeda_splitter_obj_funcs = {
 
 static int komeda_splitter_obj_add(struct komeda_kms_dev *kms,
 				   struct komeda_splitter *splitter)
 {
 	drm_atomic_private_obj_init(&kms->base,
-				    &splitter->base.obj, NULL,
+				    &splitter->base.obj,
 				    &komeda_splitter_obj_funcs);
 
 	return 0;
 }
 
@@ -275,11 +275,11 @@ static const struct drm_private_state_funcs komeda_merger_obj_funcs = {
 
 static int komeda_merger_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_merger *merger)
 {
 	drm_atomic_private_obj_init(&kms->base,
-				    &merger->base.obj, NULL,
+				    &merger->base.obj,
 				    &komeda_merger_obj_funcs);
 
 	return 0;
 }
 
@@ -328,11 +328,11 @@ static const struct drm_private_state_funcs komeda_improc_obj_funcs = {
 };
 
 static int komeda_improc_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_improc *improc)
 {
-	drm_atomic_private_obj_init(&kms->base, &improc->base.obj, NULL,
+	drm_atomic_private_obj_init(&kms->base, &improc->base.obj,
 				    &komeda_improc_obj_funcs);
 
 	return 0;
 }
 
@@ -381,11 +381,11 @@ static const struct drm_private_state_funcs komeda_timing_ctrlr_obj_funcs = {
 };
 
 static int komeda_timing_ctrlr_obj_add(struct komeda_kms_dev *kms,
 				       struct komeda_timing_ctrlr *ctrlr)
 {
-	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj, NULL,
+	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj,
 				    &komeda_timing_ctrlr_obj_funcs);
 
 	return 0;
 }
 
@@ -435,11 +435,11 @@ static const struct drm_private_state_funcs komeda_pipeline_obj_funcs = {
 };
 
 static int komeda_pipeline_obj_add(struct komeda_kms_dev *kms,
 				   struct komeda_pipeline *pipe)
 {
-	drm_atomic_private_obj_init(&kms->base, &pipe->obj, NULL,
+	drm_atomic_private_obj_init(&kms->base, &pipe->obj,
 				    &komeda_pipeline_obj_funcs);
 
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 3e3ad6941742680179a9ecd8c07c0bf6adcd215f..b617bb21a8c1551a61171bb3975e876705aced52 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5762,11 +5762,10 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
 	mgr->max_payloads = max_payloads;
 	mgr->conn_base_id = conn_base_id;
 
 	drm_atomic_private_obj_init(dev, &mgr->base,
-				    NULL,
 				    &drm_dp_mst_topology_state_funcs);
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_dp_mst_topology_mgr_init);
diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 2abd714efd19f27697770813b38194e384be87ce..241498cef7de497afdf2837f750113743c001240 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -1598,11 +1598,11 @@ static bool init_group(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_tunnel_group
 {
 	group->mgr = mgr;
 	group->available_bw = -1;
 	INIT_LIST_HEAD(&group->tunnels);
 
-	drm_atomic_private_obj_init(mgr->dev, &group->base, NULL,
+	drm_atomic_private_obj_init(mgr->dev, &group->base,
 				    &tunnel_group_funcs);
 
 	return true;
 }
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 36b56c71cb4e1ddc57577df724efe7d89b4fb6a9..e01d9a4545220e31090c1e45fdb0bf905205b528 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -773,11 +773,10 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 
 /**
  * drm_atomic_private_obj_init - initialize private object
  * @dev: DRM device this object will be attached to
  * @obj: private object
- * @state: initial private object state
  * @funcs: pointer to the struct of function pointers that identify the object
  * type
  *
  * Initialize the private object, which can be embedded into any
  * driver private object that needs its own atomic state.
@@ -785,38 +784,26 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
  * RETURNS:
  * Zero on success, error code on failure
  */
 int drm_atomic_private_obj_init(struct drm_device *dev,
 				struct drm_private_obj *obj,
-				struct drm_private_state *state,
 				const struct drm_private_state_funcs *funcs)
 {
 	memset(obj, 0, sizeof(*obj));
 
 	drm_modeset_lock_init(&obj->lock);
 
 	obj->dev = dev;
 	obj->funcs = funcs;
 	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
 
-	/*
-	 * Not all users of drm_atomic_private_obj_init have been
-	 * converted to using &drm_private_obj_funcs.reset yet. For the
-	 * time being, let's only call reset if the passed state is
-	 * NULL. Otherwise, we will fallback to the previous behaviour.
-	 */
-	if (!state) {
-		if (obj->funcs->atomic_create_state) {
-			state = obj->funcs->atomic_create_state(obj);
-			if (IS_ERR(state))
-				return PTR_ERR(state);
+	if (obj->funcs->atomic_create_state) {
+		struct drm_private_state *state = obj->funcs->atomic_create_state(obj);
+		if (IS_ERR(state))
+			return PTR_ERR(state);
 
-			obj->state = state;
-		}
-	} else {
 		obj->state = state;
-		state->obj = obj;
 	}
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_private_obj_init);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f0db891863428ee65625a6a3ed38f63ec802595e..4d816e2804855e9bd787064e4275ccf611d8e2e5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -480,11 +480,10 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 			goto err_reset_bridge;
 	}
 
 	if (drm_bridge_is_atomic(bridge))
 		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
-					    NULL,
 					    &drm_bridge_priv_state_funcs);
 
 	return 0;
 
 err_reset_bridge:
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 4aca12de0b16aa56dcd7a5942b868c792b08c9c3..d5617d4aef101b195f366adc27e2d24612078b76 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1394,11 +1394,11 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	if (ret) {
 		dev_err(dev, "Unable to register clock notifier\n");
 		goto err_devclk_disable;
 	}
 
-	drm_atomic_private_obj_init(drm, &priv->private_obj, NULL,
+	drm_atomic_private_obj_init(drm, &priv->private_obj,
 				    &ingenic_drm_private_state_funcs);
 
 	ret = drmm_add_action_or_reset(drm, ingenic_drm_atomic_private_obj_fini,
 				       &priv->private_obj);
 	if (ret)
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 9af95b775dd6cb1a8ba9a5c32e6dae824453eb7c..9fe5b5044a09aff9f477d64605633ef1c2d91632 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -899,11 +899,11 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 	if (err) {
 		dev_err(dev, "Unable to prepare clock\n");
 		return err;
 	}
 
-	drm_atomic_private_obj_init(drm, &ipu->private_obj, NULL,
+	drm_atomic_private_obj_init(drm, &ipu->private_obj,
 				    &ingenic_ipu_private_state_funcs);
 
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 28a79e7836c0fb5c3f8a27ea5dda6f677e330bf1..886a3d05d3e70d54549e37b24a219ecbd3d049da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1159,11 +1159,10 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
 
 	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
-				    NULL,
 				    &dpu_kms_global_state_funcs);
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 80e1a331dbf7deae4f039ddcae1e5770e882728d..77d99fd5ef962c2f3be178aa8a0b0c462ce37462 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -715,11 +715,10 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	int ret;
 
 	mdp5_kms->dev = dev;
 
 	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
-				    NULL,
 				    &mdp5_global_state_funcs);
 
 	/* we need to set a default rate before enabling.  Set a safe
 	 * rate first, then figure out hw revision, and then set a
 	 * more optimal rate:
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 7a2d7aa5438a519c876033801da5cd5c411bd5fa..f6193a37cf6709b1b8d7f765d21940ccef0d99ae 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -296,11 +296,11 @@ static const struct drm_private_state_funcs omap_global_state_funcs = {
 
 static int omap_global_obj_init(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
 
-	drm_atomic_private_obj_init(dev, &priv->glob_obj, NULL,
+	drm_atomic_private_obj_init(dev, &priv->glob_obj,
 				    &omap_global_state_funcs);
 	return 0;
 }
 
 static void omap_global_obj_fini(struct omap_drm_private *priv)
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 52058f7dd92fadd45551447106ebe265975e6d8f..8b24ab1981ad3ae3a77f260cf3b484b257bb6763 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -954,11 +954,11 @@ static int tegra_display_hub_init(struct host1x_client *client)
 {
 	struct tegra_display_hub *hub = to_tegra_display_hub(client);
 	struct drm_device *drm = dev_get_drvdata(client->host);
 	struct tegra_drm *tegra = drm->dev_private;
 
-	drm_atomic_private_obj_init(drm, &hub->base, NULL,
+	drm_atomic_private_obj_init(drm, &hub->base,
 				    &tegra_display_hub_state_funcs);
 
 	tegra->hub = hub;
 
 	return 0;
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f52ab17f24956fdb22669b4074901bff900e60a0..2d19296fcd6b381136c0c0a549eed6dda69d59e7 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -113,11 +113,11 @@ static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
 
 static int vc4_ctm_obj_init(struct vc4_dev *vc4)
 {
 	drm_modeset_lock_init(&vc4->ctm_state_lock);
 
-	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, NULL,
+	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager,
 				    &vc4_ctm_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_ctm_obj_fini, NULL);
 }
 
@@ -754,11 +754,10 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 }
 
 static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 {
 	drm_atomic_private_obj_init(&vc4->base, &vc4->load_tracker,
-				    NULL,
 				    &vc4_load_tracker_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
@@ -846,11 +845,10 @@ static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
 }
 
 static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
 {
 	drm_atomic_private_obj_init(&vc4->base, &vc4->hvs_channels,
-				    NULL,
 				    &vc4_hvs_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini, NULL);
 }
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 10a71c4b6afc316f07023756be4cd3ed1d1d2974..61524a2e722e8d2157b30b49b66efdf9a781e0e1 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -621,11 +621,10 @@ struct drm_connector_state * __must_check
 drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			       struct drm_connector *connector);
 
 int drm_atomic_private_obj_init(struct drm_device *dev,
 				struct drm_private_obj *obj,
-				struct drm_private_state *state,
 				const struct drm_private_state_funcs *funcs);
 void drm_atomic_private_obj_fini(struct drm_private_obj *obj);
 
 struct drm_private_state * __must_check
 drm_atomic_get_private_obj_state(struct drm_atomic_state *state,

-- 
2.51.0

