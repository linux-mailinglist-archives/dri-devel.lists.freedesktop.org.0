Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A4BC4B3E
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5176710E7FA;
	Wed,  8 Oct 2025 12:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BD87Q5Qs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC65110E800;
 Wed,  8 Oct 2025 12:04:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 89BBB404A0;
 Wed,  8 Oct 2025 12:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D933FC4CEF5;
 Wed,  8 Oct 2025 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925096;
 bh=J1XxVyG1Phld3DrVzD2ehN89MqMO6pD9wFfUe5YfFyQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BD87Q5QsECr2lnDvhjFtpVmnZbwTvVPySt0qSuNQ0APJ39RtWcNPNIXOTZqtsZ0fQ
 FK6ZcRuk9iaWSASMjHqSPiwDdB+1DWQuCBAzNF7zAXbxM11aldI5gkrspmAazgOV2p
 kfb7Ow5sisphNIg7lSViSY2MsDIHn4KlXWufjYah+YqJO6Zpq1vehGpZMEXYPO6UNO
 s8e8iLQHZpnkvKz+yQpWNTIN5nrqxVugU3Oo3m+PLCzU/iOd81FOY+aKSUWo+QlvcK
 JM9XuAcHHXr2f2XpQRVziff/9nJiPXOBWWl5WXtZN22alsB56kghmWAkaPaYtIsty4
 9a6aR/C0+/Zbw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:13 +0200
Subject: [PATCH 15/16] drm/atomic: Remove state argument to
 drm_atomic_private_obj_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251008-drm-private-obj-reset-v1-15-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16649; i=mripard@kernel.org;
 h=from:subject:message-id; bh=J1XxVyG1Phld3DrVzD2ehN89MqMO6pD9wFfUe5YfFyQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgi3fSn9//HyPh9RpxWkda/Zn3HUo/prKdbD/Vk5pz
 oR1eR/rO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEBCcwNny+8PyCU9H/ZW/3
 SjxmdehqKJ84Z3NZf/Fk9asTFf+deaHDdfhn6yWruIYlZr47WnW+f2ZseOj6I3zt0labb41Cufe
 Dp/x7/UT42o0vKhO3hn7jMhHgeZ3XWc7+9t2Tb9pMCuuOrF97FgA=
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

Now that all drm_private_objs users have been converted to use reset
instead of the old ad-hoc initialization, we can remove the state
parameter from drm_private_obj_init and the fallback code.

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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       |  1 -
 drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c | 16 ++++++++--------
 drivers/gpu/drm/display/drm_dp_mst_topology.c           |  1 -
 drivers/gpu/drm/display/drm_dp_tunnel.c                 |  2 +-
 drivers/gpu/drm/drm_atomic.c                            | 17 ++---------------
 drivers/gpu/drm/drm_bridge.c                            |  1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c               |  2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c                   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                 |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c                |  1 -
 drivers/gpu/drm/omapdrm/omap_drv.c                      |  2 +-
 drivers/gpu/drm/tegra/hub.c                             |  2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                           |  4 +---
 include/drm/drm_atomic.h                                |  1 -
 14 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1bcbfd814d53bb443b7503ffacb109c900b67b5f..a8b2c7639440dbf16baa2741490db193019f7bc4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4729,11 +4729,10 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
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
index 0c7b7a5dd10900016f64df2a86d54f9178d1cf5e..403f9c10d4cd1e70319d40c2ad267ab76fd24bff 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
@@ -66,11 +66,11 @@ static const struct drm_private_state_funcs komeda_layer_obj_funcs = {
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
@@ -122,11 +122,11 @@ static const struct drm_private_state_funcs komeda_scaler_obj_funcs = {
 
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
@@ -177,11 +177,11 @@ static const struct drm_private_state_funcs komeda_compiz_obj_funcs = {
 };
 
 static int komeda_compiz_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_compiz *compiz)
 {
-	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj, NULL,
+	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj,
 				    &komeda_compiz_obj_funcs);
 
 	return 0;
 }
 
@@ -234,11 +234,11 @@ static const struct drm_private_state_funcs komeda_splitter_obj_funcs = {
 
 static int komeda_splitter_obj_add(struct komeda_kms_dev *kms,
 				   struct komeda_splitter *splitter)
 {
 	drm_atomic_private_obj_init(&kms->base,
-				    &splitter->base.obj, NULL,
+				    &splitter->base.obj,
 				    &komeda_splitter_obj_funcs);
 
 	return 0;
 }
 
@@ -290,11 +290,11 @@ static const struct drm_private_state_funcs komeda_merger_obj_funcs = {
 
 static int komeda_merger_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_merger *merger)
 {
 	drm_atomic_private_obj_init(&kms->base,
-				    &merger->base.obj, NULL,
+				    &merger->base.obj,
 				    &komeda_merger_obj_funcs);
 
 	return 0;
 }
 
@@ -346,11 +346,11 @@ static const struct drm_private_state_funcs komeda_improc_obj_funcs = {
 };
 
 static int komeda_improc_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_improc *improc)
 {
-	drm_atomic_private_obj_init(&kms->base, &improc->base.obj, NULL,
+	drm_atomic_private_obj_init(&kms->base, &improc->base.obj,
 				    &komeda_improc_obj_funcs);
 
 	return 0;
 }
 
@@ -402,11 +402,11 @@ static const struct drm_private_state_funcs komeda_timing_ctrlr_obj_funcs = {
 };
 
 static int komeda_timing_ctrlr_obj_add(struct komeda_kms_dev *kms,
 				       struct komeda_timing_ctrlr *ctrlr)
 {
-	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj, NULL,
+	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj,
 				    &komeda_timing_ctrlr_obj_funcs);
 
 	return 0;
 }
 
@@ -459,11 +459,11 @@ static const struct drm_private_state_funcs komeda_pipeline_obj_funcs = {
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
index 255fbdcea9f0b6376d15439e3da1dc02be472a20..2831e0b77ab120ef313ad44b0f35df37a0fb59dd 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5764,11 +5764,10 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
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
index ae6c6ca99417bf7d99186dd2648f0525c633a8d5..b6e6f0e01c972db2def5164deeff34838ede544f 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -1601,11 +1601,11 @@ static bool init_group(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_tunnel_group
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
index 45c26294e712fd36b43e87548072c3c0e9af1887..e409919b0ccb632e869b4a6f8462731484755b73 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -773,44 +773,31 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 
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
  */
 void
 drm_atomic_private_obj_init(struct drm_device *dev,
 			    struct drm_private_obj *obj,
-			    struct drm_private_state *state,
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
-		if (obj->funcs->reset)
-			obj->funcs->reset(obj);
-	} else {
-		obj->state = state;
-		state->obj = obj;
-	}
+	if (obj->funcs->reset)
+		obj->funcs->reset(obj);
 }
 EXPORT_SYMBOL(drm_atomic_private_obj_init);
 
 /**
  * drm_atomic_private_obj_fini - finalize private object
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index cc346412b0205288ec7ee5a7d80a897ad9659404..107bf1d984511496a3766d77de4d1e8a821eaeef 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -478,11 +478,10 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 			goto err_reset_bridge;
 	}
 
 	if (drm_bridge_is_atomic(bridge))
 		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
-					    NULL,
 					    &drm_bridge_priv_state_funcs);
 
 	return 0;
 
 err_reset_bridge:
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 18f20d96f6e4a7d9e5209ee770c7b4fc81adbad7..a721353a9cba410f002c81d082eb2601c1830024 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1396,11 +1396,11 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
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
index ddaf80052f03b8e366c89a6562b430a400b6dacd..e4de737d159e03a1e61015e42e000a83c9231357 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -901,11 +901,11 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
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
index 04baf072e8510ce8260f1ec609ba8f2b22f7c11e..d7257e888269aa0b4add4d3a911a9403ef590582 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -403,11 +403,10 @@ static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
 };
 
 static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 {
 	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
-				    NULL,
 				    &dpu_kms_global_state_funcs);
 
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 44aef7eb8e9073bc9a4bab03c1d6c41313c56ac7..893f29a1fbdd51d22425f52638c74cc97cbe95bf 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -151,11 +151,10 @@ static const struct drm_private_state_funcs mdp5_global_state_funcs = {
 };
 
 static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
 {
 	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
-				    NULL,
 				    &mdp5_global_state_funcs);
 	return 0;
 }
 
 static void mdp5_enable_commit(struct msm_kms *kms)
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 4c556da5a5cae3685d929679f43260c51459e8a9..c14e8648b86044c90d2f9e93dbbe497086289f4f 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -298,11 +298,11 @@ static const struct drm_private_state_funcs omap_global_state_funcs = {
 
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
index 6cae71bc3744a22e4b3804b19869e8b16fd60ecd..67e3b8ca4a5204fd29a64b0c80a5290bb6b093ea 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -956,11 +956,11 @@ static int tegra_display_hub_init(struct host1x_client *client)
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
index f50ffc1c4b62ae3e180743f9cad4c6d0bc62a922..b1f2fb29a97b5cd23d819af9ff4ff407a511d2dc 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -115,11 +115,11 @@ static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
 
 static int vc4_ctm_obj_init(struct vc4_dev *vc4)
 {
 	drm_modeset_lock_init(&vc4->ctm_state_lock);
 
-	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, NULL,
+	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager,
 				    &vc4_ctm_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_ctm_obj_fini, NULL);
 }
 
@@ -758,11 +758,10 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 }
 
 static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 {
 	drm_atomic_private_obj_init(&vc4->base, &vc4->load_tracker,
-				    NULL,
 				    &vc4_load_tracker_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
@@ -852,11 +851,10 @@ static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
 }
 
 static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
 {
 	drm_atomic_private_obj_init(&vc4->base, &vc4->hvs_channels,
-				    NULL,
 				    &vc4_hvs_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini, NULL);
 }
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index fbac6d4c75fc86535cf153745b6132f8705c808a..68e30bce7b318ea524df9b47a9e88bb0c7b77c6b 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -617,11 +617,10 @@ struct drm_connector_state * __must_check
 drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			       struct drm_connector *connector);
 
 void drm_atomic_private_obj_init(struct drm_device *dev,
 				 struct drm_private_obj *obj,
-				 struct drm_private_state *state,
 				 const struct drm_private_state_funcs *funcs);
 void drm_atomic_private_obj_fini(struct drm_private_obj *obj);
 
 struct drm_private_state * __must_check
 drm_atomic_get_private_obj_state(struct drm_atomic_state *state,

-- 
2.51.0

