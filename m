Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2DBD4FB4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 18:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C9C10E4A2;
	Mon, 13 Oct 2025 16:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Btku4Kmg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3F310E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:25:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C3EA2C093B1;
 Mon, 13 Oct 2025 16:24:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7A7B6067B;
 Mon, 13 Oct 2025 16:25:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8853102F2279; 
 Mon, 13 Oct 2025 18:24:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760372703; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Gv0maEjq5v/FElsFwj5bt6nUQBctEM89W5hyzui+jc0=;
 b=Btku4KmgpXmFc33YSzZUjtX/oFmmd7anKehG8NfVPSNBg8HB4XyywCc2BoW072/V5JCcto
 2P+u5KQdJjr2RiwQx7SPPg6BBVs/KifEJI8NlyO5zCUTU5dIhi9mnnejIXsWra1rRaccuw
 AHwuz/EdzbK52O8xVX0rPQoVTk6OCCuDRN2a5rlVhsc9ytHXuiZuVXkCi/spwTzctr7iEQ
 zqRqRD1Dtep+Vkg3Luq0F3sp/kODgQY2zbsPfKfEoMIlFbdnRdskhQ0gtRUjPPZq47OKpj
 EaVVPUP/ZpwZ8T2Bv+NQQtXs0uECJf9uBMUeGhsBYVOmalTwY2w3W8TPWNqFwg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 13 Oct 2025 18:24:22 +0200
Subject: [PATCH 1/2] drm/atomic: pass drm_device pointer to
 drm_atomic_private_obj_fini()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-drm-bridge-atomic-vs-remove-private_obj-v1-1-1fc2e58102e0@bootlin.com>
References: <20251013-drm-bridge-atomic-vs-remove-private_obj-v1-0-1fc2e58102e0@bootlin.com>
In-Reply-To: <20251013-drm-bridge-atomic-vs-remove-private_obj-v1-0-1fc2e58102e0@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

In preparation for creating a drm_modeset_acquire_ctx for locking insode
drm_atomic_private_obj_fini(), pass a pointer to the struct drm_device
which is needed to create such context.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c | 2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c           | 2 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c                 | 2 +-
 drivers/gpu/drm/drm_atomic.c                            | 3 ++-
 drivers/gpu/drm/drm_bridge.c                            | 2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c               | 2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c                   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                 | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c                | 2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                      | 2 +-
 drivers/gpu/drm/tegra/hub.c                             | 2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                           | 6 +++---
 include/drm/drm_atomic.h                                | 3 ++-
 14 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fe41494635c54ee58354b51b53449835a7f47328..e5391dc5a69c7266e6902bd6ea01a229b002ffc6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5491,7 +5491,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 static void amdgpu_dm_destroy_drm_device(struct amdgpu_display_manager *dm)
 {
 	if (dm->atomic_obj.state)
-		drm_atomic_private_obj_fini(&dm->atomic_obj);
+		drm_atomic_private_obj_fini(dm->ddev, &dm->atomic_obj);
 }
 
 /******************************************************************************
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
index 914400c4af73824e52dda76425a73a74e681a146..08b1f35727ded45b7b00c727199f0f952f9c5108 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
@@ -428,5 +428,5 @@ void komeda_kms_cleanup_private_objs(struct komeda_kms_dev *kms)
 	struct drm_private_obj *obj, *next;
 
 	list_for_each_entry_safe(obj, next, &config->privobj_list, head)
-		drm_atomic_private_obj_fini(obj);
+		drm_atomic_private_obj_fini(&kms->base, obj);
 }
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 64e5c176d5cce9df9314f77a0b4c97662c30c070..b1ab7b8e4bf9c9b3fe46ad90558edf48b5521ed2 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5773,9 +5773,9 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr)
 		destroy_workqueue(mgr->delayed_destroy_wq);
 		mgr->delayed_destroy_wq = NULL;
 	}
+	drm_atomic_private_obj_fini(mgr->dev, &mgr->base);
 	mgr->dev = NULL;
 	mgr->aux = NULL;
-	drm_atomic_private_obj_fini(&mgr->base);
 	mgr->funcs = NULL;
 
 	mutex_destroy(&mgr->delayed_destroy_lock);
diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 43f13a7c79b931beb230f8afe20afa0ebcf5ed8d..407eda40981c687a0e8bc3a7d61c6fbda0c61100 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -1601,7 +1601,7 @@ static bool init_group(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_tunnel_group
 
 static void cleanup_group(struct drm_dp_tunnel_group *group)
 {
-	drm_atomic_private_obj_fini(&group->base);
+	drm_atomic_private_obj_fini(group->mgr->dev, &group->base);
 }
 
 #ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index be2cb6e43cb07fbe553d1ab875911253be628d1a..7910dacb269c03a0f3e1785bb864d228a693a1aa 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -807,7 +807,8 @@ EXPORT_SYMBOL(drm_atomic_private_obj_init);
  * Finalize the private object.
  */
 void
-drm_atomic_private_obj_fini(struct drm_private_obj *obj)
+drm_atomic_private_obj_fini(struct drm_device *dev,
+			    struct drm_private_obj *obj)
 {
 	list_del(&obj->head);
 	obj->funcs->atomic_destroy_state(obj, obj->state);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 53e7ece36dd940aabd1c0880f296fce7224a12ac..0997a17a6793f5e42a488d81d8e57b93c5f425a3 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -512,7 +512,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 		return;
 
 	if (drm_bridge_is_atomic(bridge))
-		drm_atomic_private_obj_fini(&bridge->base);
+		drm_atomic_private_obj_fini(bridge->dev, &bridge->base);
 
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index d3213fbf22be14b177fc1b7100c5b721d5f17924..9d7f978eeefd317c07e6b0d328b9f59a0048e073 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1081,7 +1081,7 @@ static void ingenic_drm_configure_hwdesc_plane(struct ingenic_drm *priv,
 
 static void ingenic_drm_atomic_private_obj_fini(struct drm_device *drm, void *private_obj)
 {
-	drm_atomic_private_obj_fini(private_obj);
+	drm_atomic_private_obj_fini(drm, private_obj);
 }
 
 static int ingenic_drm_bind(struct device *dev, bool has_components)
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 32638a713241abbd4eaed09f0aaec2b790650cc9..c89dd4ce73e277e382b244e73b4d1474ad544c6b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -908,7 +908,7 @@ static void ingenic_ipu_unbind(struct device *dev,
 {
 	struct ingenic_ipu *ipu = dev_get_drvdata(dev);
 
-	drm_atomic_private_obj_fini(&ipu->private_obj);
+	drm_atomic_private_obj_fini(ipu->drm, &ipu->private_obj);
 	clk_unprepare(ipu->clk);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4e5a8ecd31f7570beb45fd1629a131e70aaefea8..6f03e2e11d255b734f6212bc57bf2d5660d89269 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -400,7 +400,7 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 
 static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
 {
-	drm_atomic_private_obj_fini(&dpu_kms->global_state);
+	drm_atomic_private_obj_fini(dpu_kms->dev, &dpu_kms->global_state);
 }
 
 static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 61edf6864092664afe474cc8d1fd097ca495ebb8..57ecc2ca8bb9d8e2ce38f3eff4cc67c179c98438 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -571,7 +571,7 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 	if (mdp5_kms->rpm_enabled)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
-	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
+	drm_atomic_private_obj_fini(mdp5_kms->dev, &mdp5_kms->glob_state);
 }
 
 static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 794267f0f007850e43949f93be5c98d0e32a84ea..37b9cf58d4b3776a484d9923c291e49a9d899cf4 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -295,7 +295,7 @@ static int omap_global_obj_init(struct drm_device *dev)
 
 static void omap_global_obj_fini(struct omap_drm_private *priv)
 {
-	drm_atomic_private_obj_fini(&priv->glob_obj);
+	drm_atomic_private_obj_fini(priv->ddev, &priv->glob_obj);
 }
 
 static void omap_disconnect_pipelines(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 8f779f23dc0904d38b14d3f3a928a07fc9e601ad..b468be737273b4ba7682e8b4cc5bffd061b4914e 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -959,7 +959,7 @@ static int tegra_display_hub_exit(struct host1x_client *client)
 	struct drm_device *drm = dev_get_drvdata(client->host);
 	struct tegra_drm *tegra = drm->dev_private;
 
-	drm_atomic_private_obj_fini(&tegra->hub->base);
+	drm_atomic_private_obj_fini(drm, &tegra->hub->base);
 	tegra->hub = NULL;
 
 	return 0;
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 8f983edb81ff0e3b11bbc8465e69f838050f0d07..2150d4c28cbe4f16ed089a04215bb4b4bfa48985 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -93,7 +93,7 @@ static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	drm_atomic_private_obj_fini(&vc4->ctm_manager);
+	drm_atomic_private_obj_fini(dev, &vc4->ctm_manager);
 }
 
 static int vc4_ctm_obj_init(struct vc4_dev *vc4)
@@ -726,7 +726,7 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	drm_atomic_private_obj_fini(&vc4->load_tracker);
+	drm_atomic_private_obj_fini(dev, &vc4->load_tracker);
 }
 
 static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
@@ -809,7 +809,7 @@ static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	drm_atomic_private_obj_fini(&vc4->hvs_channels);
+	drm_atomic_private_obj_fini(dev, &vc4->hvs_channels);
 }
 
 static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 155e82f87e4d47161475b57fc28762d7ba8fd206..d9a26da24fa89ccb6ab351c9dbeb4978ee117f7d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -672,7 +672,8 @@ void drm_atomic_private_obj_init(struct drm_device *dev,
 				 struct drm_private_obj *obj,
 				 struct drm_private_state *state,
 				 const struct drm_private_state_funcs *funcs);
-void drm_atomic_private_obj_fini(struct drm_private_obj *obj);
+void drm_atomic_private_obj_fini(struct drm_device *dev,
+				 struct drm_private_obj *obj);
 
 struct drm_private_state * __must_check
 drm_atomic_get_private_obj_state(struct drm_atomic_state *state,

-- 
2.51.0

