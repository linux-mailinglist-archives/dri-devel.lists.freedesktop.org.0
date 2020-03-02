Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7BA175FC8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 17:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943B76E58B;
	Mon,  2 Mar 2020 16:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0955D6E58B;
 Mon,  2 Mar 2020 16:33:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 08:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="351575220"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2020 08:33:40 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Ben Skeggs <bskeggs@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 5/7] drm: Remove drm_fb_helper add,
 add all and remove connector calls
Date: Mon,  2 Mar 2020 21:51:48 +0530
Message-Id: <20200302162151.52349-6-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_fb_helper_{add,remove}_one_connector() and
drm_fb_helper_single_add_all_connectors() are dummy functions now
and serve no purpose. Hence remove their calls.

This is the preparatory step for removing the
drm_fb_helper_{add,remove}_one_connector() functions from
drm_fb_helper.h

This removal is done using below sementic patch and unused variable
compilation warnings are fixed manually.

@@
@@

- drm_fb_helper_single_add_all_connectors(...);

@@
expression e1;
statement S;
@@
- e1 = drm_fb_helper_single_add_all_connectors(...);
- S

@@
@@

- drm_fb_helper_add_one_connector(...);

@@
@@

- drm_fb_helper_remove_one_connector(...);

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        | 2 --
 drivers/gpu/drm/armada/armada_fbdev.c         | 6 ------
 drivers/gpu/drm/bridge/tc358764.c             | 3 ---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     | 8 --------
 drivers/gpu/drm/gma500/framebuffer.c          | 4 ----
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 2 --
 drivers/gpu/drm/msm/msm_fbdev.c               | 4 ----
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 7 -------
 drivers/gpu/drm/nouveau/nouveau_fbcon.c       | 4 ----
 drivers/gpu/drm/omapdrm/omap_fbdev.c          | 4 ----
 drivers/gpu/drm/radeon/radeon_fb.c            | 4 ----
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c | 7 -------
 drivers/gpu/drm/tegra/fb.c                    | 6 ------
 14 files changed, 62 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 579d614c7b70..9ae7b61f696a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -342,8 +342,6 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
 		return ret;
 	}
 
-	drm_fb_helper_single_add_all_connectors(&rfbdev->helper);
-
 	/* disable all the possible outputs/crtcs before entering KMS mode */
 	if (!amdgpu_device_has_dc_support(adev))
 		drm_helper_disable_unused_functions(adev->ddev);
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 6254353c00ae..f2dc371bd8e5 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -135,12 +135,6 @@ int armada_fbdev_init(struct drm_device *dev)
 		goto err_fb_helper;
 	}
 
-	ret = drm_fb_helper_single_add_all_connectors(fbh);
-	if (ret) {
-		DRM_ERROR("failed to add fb connectors\n");
-		goto err_fb_setup;
-	}
-
 	ret = drm_fb_helper_initial_config(fbh, 32);
 	if (ret) {
 		DRM_ERROR("failed to set initial config\n");
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 283e4a8dd923..5ac1430fab04 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -375,7 +375,6 @@ static int tc358764_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
 	drm_panel_attach(ctx->panel, &ctx->connector);
 	ctx->connector.funcs->reset(&ctx->connector);
-	drm_fb_helper_add_one_connector(drm->fb_helper, &ctx->connector);
 	drm_connector_register(&ctx->connector);
 
 	return 0;
@@ -384,10 +383,8 @@ static int tc358764_attach(struct drm_bridge *bridge,
 static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
-	struct drm_device *drm = bridge->dev;
 
 	drm_connector_unregister(&ctx->connector);
-	drm_fb_helper_remove_one_connector(drm->fb_helper, &ctx->connector);
 	drm_panel_detach(ctx->panel);
 	ctx->panel = NULL;
 	drm_connector_put(&ctx->connector);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 669d3857502a..38e43d957ae0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1514,7 +1514,6 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
 		return 0;
 
 	connector->funcs->reset(connector);
-	drm_fb_helper_add_one_connector(drm->fb_helper, connector);
 	drm_connector_register(connector);
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 5afecb6a30ad..e6ceaf36fb04 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -207,14 +207,6 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 		goto err_init;
 	}
 
-	ret = drm_fb_helper_single_add_all_connectors(helper);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev->dev,
-			      "failed to register drm_fb_helper_connector.\n");
-		goto err_setup;
-
-	}
-
 	ret = drm_fb_helper_initial_config(helper, PREFERRED_BPP);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev->dev,
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index fe892e1243db..1d8f67e4795a 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -517,10 +517,6 @@ int psb_fbdev_init(struct drm_device *dev)
 	if (ret)
 		goto free;
 
-	ret = drm_fb_helper_single_add_all_connectors(fb_helper);
-	if (ret)
-		goto fini;
-
 	/* disable all the possible outputs/crtcs before entering KMS mode */
 	drm_helper_disable_unused_functions(dev);
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 8f65963266a3..3bc804212a99 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -461,8 +461,6 @@ int intel_fbdev_init(struct drm_device *dev)
 	dev_priv->fbdev = ifbdev;
 	INIT_WORK(&dev_priv->fbdev_suspend_work, intel_fbdev_suspend_worker);
 
-	drm_fb_helper_single_add_all_connectors(&ifbdev->helper);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index b4f44146d9de..47235f8c5922 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -166,10 +166,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	ret = drm_fb_helper_single_add_all_connectors(helper);
-	if (ret)
-		goto fini;
-
 	/* the fw fb could be anywhere in memory */
 	drm_fb_helper_remove_conflicting_framebuffers(NULL, "msm", false);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a3dc2ba19fb2..4e164ad8003f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1260,23 +1260,16 @@ static void
 nv50_mstm_destroy_connector(struct drm_dp_mst_topology_mgr *mgr,
 			    struct drm_connector *connector)
 {
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
 	struct nv50_mstc *mstc = nv50_mstc(connector);
 
 	drm_connector_unregister(&mstc->connector);
 
-	drm_fb_helper_remove_one_connector(&drm->fbcon->helper, &mstc->connector);
-
 	drm_connector_put(&mstc->connector);
 }
 
 static void
 nv50_mstm_register_connector(struct drm_connector *connector)
 {
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-
-	drm_fb_helper_add_one_connector(&drm->fbcon->helper, connector);
-
 	drm_connector_register(connector);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 21fc7c63e2f7..24d543a01f43 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -562,10 +562,6 @@ nouveau_fbcon_init(struct drm_device *dev)
 	if (ret)
 		goto free;
 
-	ret = drm_fb_helper_single_add_all_connectors(&fbcon->helper);
-	if (ret)
-		goto fini;
-
 	if (preferred_bpp != 8 && preferred_bpp != 16 && preferred_bpp != 32) {
 		if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
 			preferred_bpp = 8;
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index eba57ac31cc6..09a84919ef73 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -246,10 +246,6 @@ void omap_fbdev_init(struct drm_device *dev)
 	if (ret)
 		goto fail;
 
-	ret = drm_fb_helper_single_add_all_connectors(helper);
-	if (ret)
-		goto fini;
-
 	ret = drm_fb_helper_initial_config(helper, 32);
 	if (ret)
 		goto fini;
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index 1c02cd771d52..cf3156a65fc1 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -358,10 +358,6 @@ int radeon_fbdev_init(struct radeon_device *rdev)
 	if (ret)
 		goto free;
 
-	ret = drm_fb_helper_single_add_all_connectors(&rfbdev->helper);
-	if (ret)
-		goto fini;
-
 	/* disable all the possible outputs/crtcs before entering KMS mode */
 	drm_helper_disable_unused_functions(rdev->ddev);
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
index 6ad4cce17089..2fdc455c4ad7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
@@ -132,13 +132,6 @@ int rockchip_drm_fbdev_init(struct drm_device *dev)
 		return ret;
 	}
 
-	ret = drm_fb_helper_single_add_all_connectors(helper);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev->dev,
-			      "Failed to add connectors - %d.\n", ret);
-		goto err_drm_fb_helper_fini;
-	}
-
 	ret = drm_fb_helper_initial_config(helper, PREFERRED_BPP);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev->dev,
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index feefe62be8dd..b8a328f53862 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -321,12 +321,6 @@ static int tegra_fbdev_init(struct tegra_fbdev *fbdev,
 		return err;
 	}
 
-	err = drm_fb_helper_single_add_all_connectors(&fbdev->base);
-	if (err < 0) {
-		dev_err(drm->dev, "failed to add connectors: %d\n", err);
-		goto fini;
-	}
-
 	err = drm_fb_helper_initial_config(&fbdev->base, preferred_bpp);
 	if (err < 0) {
 		dev_err(drm->dev, "failed to set initial configuration: %d\n",
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
