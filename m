Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9C7A195C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457DD10E5E0;
	Fri, 15 Sep 2023 08:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4331410E5DA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:54:17 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7135:da8b:ba1d:1a7c])
 by laurent.telenet-ops.be with bizsmtp
 id m8uF2A0083q21w7018uFga; Fri, 15 Sep 2023 10:54:15 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4aJ-003lHZ-SN;
 Fri, 15 Sep 2023 10:54:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4ac-00Gdci-S8;
 Fri, 15 Sep 2023 10:54:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 26/41] drm: renesas: shmobile: Unify plane allocation
Date: Fri, 15 Sep 2023 10:53:41 +0200
Message-Id: <adbc5febc0099fd1910f32a7af1c8e0f570f74b4.1694767209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
References: <cover.1694767208.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unify primary and overlay plane allocation:
  - Enhance shmob_drm_plane_create() so it can be used to create the
    primary plane, too,
  - Move overlay plane creation next to primary plane creation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - No changes,

v3:
  - No changes,

v2:
  - Pass plane type to shmob_drm_plane_create() to avoid having to shift
    all overlay plane indices by one,
  - Rename primary_plane_funcs to shmob_drm_primary_plane_funcs,
  - Rename shmob_drm_plane_funcs to shmob_drm_overlay_plane_funcs.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 39 +++++--------------
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  9 -----
 .../drm/renesas/shmobile/shmob_drm_plane.c    | 31 +++++++++++----
 .../drm/renesas/shmobile/shmob_drm_plane.h    |  4 +-
 4 files changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index caafd04acd3d46d0..564051b505ed4ac5 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -19,7 +19,6 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
@@ -453,47 +452,29 @@ static const struct drm_crtc_funcs crtc_funcs = {
 	.disable_vblank = shmob_drm_disable_vblank,
 };
 
-static const uint32_t modeset_formats[] = {
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV21,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV61,
-	DRM_FORMAT_NV24,
-	DRM_FORMAT_NV42,
-};
-
-static const struct drm_plane_funcs primary_plane_funcs = {
-	DRM_PLANE_NON_ATOMIC_FUNCS,
-};
-
 int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 {
 	struct drm_crtc *crtc = &sdev->crtc.crtc;
-	struct drm_plane *primary;
+	struct drm_plane *primary, *plane;
+	unsigned int i;
 	int ret;
 
 	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
 
-	primary = __drm_universal_plane_alloc(&sdev->ddev, sizeof(*primary), 0,
-					      0, &primary_plane_funcs,
-					      modeset_formats,
-					      ARRAY_SIZE(modeset_formats),
-					      NULL, DRM_PLANE_TYPE_PRIMARY,
-					      NULL);
+	primary = shmob_drm_plane_create(sdev, DRM_PLANE_TYPE_PRIMARY, 0);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
+	for (i = 1; i < 5; ++i) {
+		plane = shmob_drm_plane_create(sdev, DRM_PLANE_TYPE_OVERLAY, i);
+		if (IS_ERR(plane))
+			return PTR_ERR(plane);
+	}
+
 	ret = drm_crtc_init_with_planes(&sdev->ddev, crtc, primary, NULL,
 					&crtc_funcs, NULL);
-	if (ret < 0) {
-		drm_plane_cleanup(primary);
-		kfree(primary);
+	if (ret < 0)
 		return ret;
-	}
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index a971c7bc1fd4b4be..0db41c6317109773 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -180,7 +180,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
 	struct shmob_drm_device *sdev;
 	struct drm_device *ddev;
-	unsigned int i;
 	int ret;
 
 	if (pdata == NULL) {
@@ -221,14 +220,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "failed to initialize mode setting\n");
 
-	for (i = 0; i < 4; ++i) {
-		ret = shmob_drm_plane_create(sdev, i);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to create plane %u\n", i);
-			goto err_modeset_cleanup;
-		}
-	}
-
 	ret = drm_vblank_init(ddev, 1);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to initialize vblank\n");
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index c58b9dca34736342..3518f8900c0d1f9e 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_plane_helper.h>
 
 #include "shmob_drm_drv.h"
 #include "shmob_drm_kms.h"
@@ -179,7 +180,12 @@ static int shmob_drm_plane_disable(struct drm_plane *plane,
 	return 0;
 }
 
-static const struct drm_plane_funcs shmob_drm_plane_funcs = {
+static const struct drm_plane_funcs shmob_drm_primary_plane_funcs = {
+	.update_plane = drm_plane_helper_update_primary,
+	.disable_plane = drm_plane_helper_disable_primary,
+};
+
+static const struct drm_plane_funcs shmob_drm_overlay_plane_funcs = {
 	.update_plane = shmob_drm_plane_update,
 	.disable_plane = shmob_drm_plane_disable,
 };
@@ -197,19 +203,28 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_NV42,
 };
 
-int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
+struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
+					 enum drm_plane_type type,
+					 unsigned int index)
 {
+	const struct drm_plane_funcs *funcs;
 	struct shmob_drm_plane *splane;
 
-	splane = drmm_universal_plane_alloc(&sdev->ddev, struct shmob_drm_plane,
-					    plane, 1, &shmob_drm_plane_funcs,
-					    formats, ARRAY_SIZE(formats), NULL,
-					    DRM_PLANE_TYPE_OVERLAY, NULL);
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		funcs = &shmob_drm_primary_plane_funcs;
+	else
+		funcs = &shmob_drm_overlay_plane_funcs;
+
+	splane = drmm_universal_plane_alloc(&sdev->ddev,
+					    struct shmob_drm_plane, plane, 1,
+					    funcs, formats,
+					    ARRAY_SIZE(formats),  NULL, type,
+					    NULL);
 	if (IS_ERR(splane))
-		return PTR_ERR(splane);
+		return ERR_CAST(splane);
 
 	splane->index = index;
 	splane->alpha = 255;
 
-	return 0;
+	return &splane->plane;
 }
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
index e72b21a4288fc23f..8ad12129014016fa 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
@@ -13,7 +13,9 @@
 struct drm_plane;
 struct shmob_drm_device;
 
-int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index);
+struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
+					 enum drm_plane_type type,
+					 unsigned int index);
 void shmob_drm_plane_setup(struct drm_plane *plane);
 
 #endif /* __SHMOB_DRM_PLANE_H__ */
-- 
2.34.1

