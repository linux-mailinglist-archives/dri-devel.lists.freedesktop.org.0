Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925A739CC3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D4F10E53B;
	Thu, 22 Jun 2023 09:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D1D10E527
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:46 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by laurent.telenet-ops.be with bizsmtp
 id C9Nj2A00c1yfRTD019Njli; Thu, 22 Jun 2023 11:22:43 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWX-000Bwo-Uv;
 Thu, 22 Jun 2023 11:22:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWZ-003VxS-I3;
 Thu, 22 Jun 2023 11:22:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 24/39] drm: renesas: shmobile: Unify plane allocation
Date: Thu, 22 Jun 2023 11:21:36 +0200
Message-Id: <95c2af42a89c65ca603126e56c0423407dfc873f.1687423204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687423204.git.geert+renesas@glider.be>
References: <cover.1687423204.git.geert+renesas@glider.be>
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

As overlay plane index zero now means the primary plane, this requires
shifting all overlay plane indices by one.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Perhaps it would be better to not use dynamic allocation, but store
"struct drm_plane primary" and "struct shmob_drm_plane planes[5]" in
struct drm_shmob_device instead, like is done for the crtc and encoder?
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 39 ++------
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  9 --
 .../drm/renesas/shmobile/shmob_drm_plane.c    | 96 +++++++++++--------
 .../drm/renesas/shmobile/shmob_drm_plane.h    |  3 +-
 4 files changed, 70 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 28a70536693f7788..3f6af12f45988124 100644
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
@@ -501,47 +500,29 @@ static const struct drm_crtc_funcs crtc_funcs = {
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
+	primary = shmob_drm_plane_create(sdev, 0);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
+	for (i = 1; i < 5; ++i) {
+		plane = shmob_drm_plane_create(sdev, i);
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
index c15ebbe74cac501f..c98e2bdd888c3274 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -154,7 +154,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
 	struct shmob_drm_device *sdev;
 	struct drm_device *ddev;
-	unsigned int i;
 	int ret;
 
 	if (pdata == NULL) {
@@ -195,14 +194,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
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
index c58b9dca34736342..63886015baaebfc0 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_plane_helper.h>
 
 #include "shmob_drm_drv.h"
 #include "shmob_drm_kms.h"
@@ -64,57 +65,58 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 				    struct drm_framebuffer *fb)
 {
 	struct shmob_drm_device *sdev = to_shmob_device(splane->plane.dev);
+	unsigned int ovl_idx = splane->index - 1;
 	u32 format;
 
 	/* TODO: Support ROP3 mode */
 	format = LDBBSIFR_EN | (splane->alpha << LDBBSIFR_LAY_SHIFT) |
 		 splane->format->ldbbsifr;
 
-#define plane_reg_dump(sdev, splane, reg) \
+#define plane_reg_dump(sdev, ovl_idx, reg) \
 	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x 0x%08x\n", __func__, \
-		splane->index, #reg, \
-		lcdc_read(sdev, reg(splane->index)), \
-		lcdc_read(sdev, reg(splane->index) + LCDC_SIDE_B_OFFSET))
-
-	plane_reg_dump(sdev, splane, LDBnBSIFR);
-	plane_reg_dump(sdev, splane, LDBnBSSZR);
-	plane_reg_dump(sdev, splane, LDBnBLOCR);
-	plane_reg_dump(sdev, splane, LDBnBSMWR);
-	plane_reg_dump(sdev, splane, LDBnBSAYR);
-	plane_reg_dump(sdev, splane, LDBnBSACR);
-
-	lcdc_write(sdev, LDBCR, LDBCR_UPC(splane->index));
-	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
+		ovl_idx, #reg, \
+		lcdc_read(sdev, reg(ovl_idx)), \
+		lcdc_read(sdev, reg(ovl_idx) + LCDC_SIDE_B_OFFSET))
+
+	plane_reg_dump(sdev, ovl_idx, LDBnBSIFR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBSSZR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBLOCR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBSMWR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBSAYR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBSACR);
+
+	lcdc_write(sdev, LDBCR, LDBCR_UPC(ovl_idx));
+	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, ovl_idx,
 		"LDBCR", lcdc_read(sdev, LDBCR));
 
-	lcdc_write(sdev, LDBnBSIFR(splane->index), format);
+	lcdc_write(sdev, LDBnBSIFR(ovl_idx), format);
 
-	lcdc_write(sdev, LDBnBSSZR(splane->index),
+	lcdc_write(sdev, LDBnBSSZR(ovl_idx),
 		   (splane->crtc_h << LDBBSSZR_BVSS_SHIFT) |
 		   (splane->crtc_w << LDBBSSZR_BHSS_SHIFT));
-	lcdc_write(sdev, LDBnBLOCR(splane->index),
+	lcdc_write(sdev, LDBnBLOCR(ovl_idx),
 		   (splane->crtc_y << LDBBLOCR_CVLC_SHIFT) |
 		   (splane->crtc_x << LDBBLOCR_CHLC_SHIFT));
-	lcdc_write(sdev, LDBnBSMWR(splane->index),
+	lcdc_write(sdev, LDBnBSMWR(ovl_idx),
 		   fb->pitches[0] << LDBBSMWR_BSMW_SHIFT);
 
 	shmob_drm_plane_compute_base(splane, fb, splane->src_x, splane->src_y);
 
-	lcdc_write(sdev, LDBnBSAYR(splane->index), splane->dma[0]);
+	lcdc_write(sdev, LDBnBSAYR(ovl_idx), splane->dma[0]);
 	if (shmob_drm_format_is_yuv(splane->format))
-		lcdc_write(sdev, LDBnBSACR(splane->index), splane->dma[1]);
+		lcdc_write(sdev, LDBnBSACR(ovl_idx), splane->dma[1]);
 
 	lcdc_write(sdev, LDBCR,
-		   LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
-	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
+		   LDBCR_UPF(ovl_idx) | LDBCR_UPD(ovl_idx));
+	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, ovl_idx,
 		"LDBCR", lcdc_read(sdev, LDBCR));
 
-	plane_reg_dump(sdev, splane, LDBnBSIFR);
-	plane_reg_dump(sdev, splane, LDBnBSSZR);
-	plane_reg_dump(sdev, splane, LDBnBLOCR);
-	plane_reg_dump(sdev, splane, LDBnBSMWR);
-	plane_reg_dump(sdev, splane, LDBnBSAYR);
-	plane_reg_dump(sdev, splane, LDBnBSACR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBSIFR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBSSZR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBLOCR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBSMWR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBSAYR);
+	plane_reg_dump(sdev, ovl_idx, LDBnBSACR);
 }
 
 void shmob_drm_plane_setup(struct drm_plane *plane)
@@ -169,16 +171,22 @@ static int shmob_drm_plane_disable(struct drm_plane *plane,
 {
 	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
 	struct shmob_drm_plane *splane = to_shmob_plane(plane);
+	unsigned int ovl_idx = splane->index - 1;
 
 	splane->format = NULL;
 
-	lcdc_write(sdev, LDBCR, LDBCR_UPC(splane->index));
-	lcdc_write(sdev, LDBnBSIFR(splane->index), 0);
+	lcdc_write(sdev, LDBCR, LDBCR_UPC(ovl_idx));
+	lcdc_write(sdev, LDBnBSIFR(ovl_idx), 0);
 	lcdc_write(sdev, LDBCR,
-		   LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
+		   LDBCR_UPF(ovl_idx) | LDBCR_UPD(ovl_idx));
 	return 0;
 }
 
+static const struct drm_plane_funcs primary_plane_funcs = {
+	.update_plane = drm_plane_helper_update_primary,
+	.disable_plane = drm_plane_helper_disable_primary,
+};
+
 static const struct drm_plane_funcs shmob_drm_plane_funcs = {
 	.update_plane = shmob_drm_plane_update,
 	.disable_plane = shmob_drm_plane_disable,
@@ -197,19 +205,31 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_NV42,
 };
 
-int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
+struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
+					 unsigned int index)
 {
+	const struct drm_plane_funcs *funcs;
 	struct shmob_drm_plane *splane;
+	enum drm_plane_type type;
+
+	if (!index) {
+		type = DRM_PLANE_TYPE_PRIMARY;
+		funcs = &primary_plane_funcs;
+	} else {
+		type = DRM_PLANE_TYPE_OVERLAY;
+		funcs = &shmob_drm_plane_funcs;
+	}
 
-	splane = drmm_universal_plane_alloc(&sdev->ddev, struct shmob_drm_plane,
-					    plane, 1, &shmob_drm_plane_funcs,
-					    formats, ARRAY_SIZE(formats), NULL,
-					    DRM_PLANE_TYPE_OVERLAY, NULL);
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
index e72b21a4288fc23f..29cf6732d479a509 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
@@ -13,7 +13,8 @@
 struct drm_plane;
 struct shmob_drm_device;
 
-int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index);
+struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
+					 unsigned int index);
 void shmob_drm_plane_setup(struct drm_plane *plane);
 
 #endif /* __SHMOB_DRM_PLANE_H__ */
-- 
2.34.1

