Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2964175FBE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 17:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1E16E584;
	Mon,  2 Mar 2020 16:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912416E573;
 Mon,  2 Mar 2020 16:33:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 08:33:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="351575119"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2020 08:33:11 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
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
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/7] drm: Remove unused arg from drm_fb_helper_init
Date: Mon,  2 Mar 2020 21:51:44 +0530
Message-Id: <20200302162151.52349-2-pankaj.laxminarayan.bharadiya@intel.com>
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

The max connector argument for drm_fb_helper_init() isn't used anymore
hence remove it.

All the drm_fb_helper_init() calls are modified with below sementic
patch.

@@
expression E1, E2, E3;
@@
-  drm_fb_helper_init(E1,E2, E3)
+  drm_fb_helper_init(E1,E2)

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        | 3 +--
 drivers/gpu/drm/armada/armada_fbdev.c         | 2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     | 2 +-
 drivers/gpu/drm/gma500/framebuffer.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 2 +-
 drivers/gpu/drm/msm/msm_fbdev.c               | 2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c       | 2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          | 2 +-
 drivers/gpu/drm/radeon/radeon_fb.c            | 3 +--
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c | 2 +-
 drivers/gpu/drm/tegra/fb.c                    | 2 +-
 include/drm/drm_fb_helper.h                   | 6 ++----
 13 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 2672dc64a310..579d614c7b70 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -336,8 +336,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
 	drm_fb_helper_prepare(adev->ddev, &rfbdev->helper,
 			&amdgpu_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(adev->ddev, &rfbdev->helper,
-				 AMDGPUFB_CONN_LIMIT);
+	ret = drm_fb_helper_init(adev->ddev, &rfbdev->helper);
 	if (ret) {
 		kfree(rfbdev);
 		return ret;
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index ac8a78bfda03..6254353c00ae 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -129,7 +129,7 @@ int armada_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, fbh, &armada_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(dev, fbh, 1);
+	ret = drm_fb_helper_init(dev, fbh);
 	if (ret) {
 		DRM_ERROR("failed to initialize drm fb helper\n");
 		goto err_fb_helper;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 490a99de6ec1..a9771de4d17e 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -450,7 +450,6 @@ EXPORT_SYMBOL(drm_fb_helper_prepare);
  * drm_fb_helper_init - initialize a &struct drm_fb_helper
  * @dev: drm device
  * @fb_helper: driver-allocated fbdev helper structure to initialize
- * @max_conn_count: max connector count (not used)
  *
  * This allocates the structures for the fbdev helper with the given limits.
  * Note that this won't yet touch the hardware (through the driver interfaces)
@@ -463,8 +462,7 @@ EXPORT_SYMBOL(drm_fb_helper_prepare);
  * Zero if everything went ok, nonzero otherwise.
  */
 int drm_fb_helper_init(struct drm_device *dev,
-		       struct drm_fb_helper *fb_helper,
-		       int max_conn_count)
+		       struct drm_fb_helper *fb_helper)
 {
 	int ret;
 
@@ -2125,7 +2123,7 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 
 	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
 
-	ret = drm_fb_helper_init(dev, fb_helper, 0);
+	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 647a1fd1d815..5afecb6a30ad 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -200,7 +200,7 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, helper, &exynos_drm_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(dev, helper, MAX_CONNECTOR);
+	ret = drm_fb_helper_init(dev, helper);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev->dev,
 			      "failed to initialize drm fb helper.\n");
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 1459076d1980..fe892e1243db 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -513,7 +513,7 @@ int psb_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, fb_helper, &psb_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(dev, fb_helper, INTELFB_CONN_LIMIT);
+	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
 		goto free;
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index b6ee0d902003..8f65963266a3 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -452,7 +452,7 @@ int intel_fbdev_init(struct drm_device *dev)
 	if (!intel_fbdev_init_bios(dev, ifbdev))
 		ifbdev->preferred_bpp = 32;
 
-	ret = drm_fb_helper_init(dev, &ifbdev->helper, 4);
+	ret = drm_fb_helper_init(dev, &ifbdev->helper);
 	if (ret) {
 		kfree(ifbdev);
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index db48867df47d..b4f44146d9de 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -160,7 +160,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, helper, &msm_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(dev, helper, priv->num_connectors);
+	ret = drm_fb_helper_init(dev, helper);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not init fbdev: ret=%d\n", ret);
 		goto fail;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 0c5cdda3c336..21fc7c63e2f7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -558,7 +558,7 @@ nouveau_fbcon_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, &fbcon->helper, &nouveau_fbcon_helper_funcs);
 
-	ret = drm_fb_helper_init(dev, &fbcon->helper, 4);
+	ret = drm_fb_helper_init(dev, &fbcon->helper);
 	if (ret)
 		goto free;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b06e5cbfd03a..eba57ac31cc6 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -242,7 +242,7 @@ void omap_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, helper, &omap_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(dev, helper, priv->num_pipes);
+	ret = drm_fb_helper_init(dev, helper);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index ec0b7d6c994d..85548cf2529a 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -354,8 +354,7 @@ int radeon_fbdev_init(struct radeon_device *rdev)
 	drm_fb_helper_prepare(rdev->ddev, &rfbdev->helper,
 			      &radeon_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(rdev->ddev, &rfbdev->helper,
-				 RADEONFB_CONN_LIMIT);
+	ret = drm_fb_helper_init(rdev->ddev, &rfbdev->helper);
 	if (ret)
 		goto free;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
index 521fe42ac5e2..6ad4cce17089 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
@@ -124,7 +124,7 @@ int rockchip_drm_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, helper, &rockchip_drm_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(dev, helper, ROCKCHIP_MAX_CONNECTOR);
+	ret = drm_fb_helper_init(dev, helper);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev->dev,
 			      "Failed to initialize drm fb helper - %d.\n",
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 84f0e01e3428..feefe62be8dd 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -314,7 +314,7 @@ static int tegra_fbdev_init(struct tegra_fbdev *fbdev,
 	struct drm_device *drm = fbdev->base.dev;
 	int err;
 
-	err = drm_fb_helper_init(drm, &fbdev->base, max_connectors);
+	err = drm_fb_helper_init(drm, &fbdev->base);
 	if (err < 0) {
 		dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
 			err);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 1c6633da0f91..62e8dda6d1d1 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -213,8 +213,7 @@ drm_fb_helper_from_client(struct drm_client_dev *client)
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 			   const struct drm_fb_helper_funcs *funcs);
-int drm_fb_helper_init(struct drm_device *dev,
-		       struct drm_fb_helper *helper, int max_conn);
+int drm_fb_helper_init(struct drm_device *dev, struct drm_fb_helper *helper);
 void drm_fb_helper_fini(struct drm_fb_helper *helper);
 int drm_fb_helper_blank(int blank, struct fb_info *info);
 int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
@@ -279,8 +278,7 @@ static inline void drm_fb_helper_prepare(struct drm_device *dev,
 }
 
 static inline int drm_fb_helper_init(struct drm_device *dev,
-		       struct drm_fb_helper *helper,
-		       int max_conn)
+		       struct drm_fb_helper *helper)
 {
 	/* So drivers can use it to free the struct */
 	helper->dev = dev;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
