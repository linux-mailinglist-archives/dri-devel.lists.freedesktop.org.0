Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5AD1D4842
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAF46EC1D;
	Fri, 15 May 2020 08:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F946EC17
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E1AA3B008;
 Fri, 15 May 2020 08:32:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 13/15] drm/mgag200: Use simple-display data structures
Date: Fri, 15 May 2020 10:32:31 +0200
Message-Id: <20200515083233.32036-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515083233.32036-1-tzimmermann@suse.de>
References: <20200515083233.32036-1-tzimmermann@suse.de>
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
Cc: John Donnelly <John.p.donnelly@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MGA CRTC data structure struct mga_crtc contains unused additional
fields; so it can removed. The standard DRM CRTC and encoder structures
are embedded now in struct drm_simple_display_pipe. Done in preparation
of converting mgag200 to simple KMS helpers.

v3:
	* remove now-unused define MGAG200FB_CONN_LIMIT
	* remove unused define MATROX_DPMS_CLEARED

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  | 15 ++------------
 drivers/gpu/drm/mgag200/mgag200_mode.c | 28 ++++++--------------------
 2 files changed, 8 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 0cf498d1e900c..d929ca3a767a3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -19,6 +19,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "mgag200_reg.h"
 
@@ -32,8 +33,6 @@
 #define DRIVER_MINOR		0
 #define DRIVER_PATCHLEVEL	0
 
-#define MGAG200FB_CONN_LIMIT 1
-
 #define RREG8(reg) ioread8(((void __iomem *)mdev->rmmio) + (reg))
 #define WREG8(reg, v) iowrite8(v, ((void __iomem *)mdev->rmmio) + (reg))
 #define RREG32(reg) ioread32(((void __iomem *)mdev->rmmio) + (reg))
@@ -103,18 +102,8 @@
 #define MGAG200_MAX_FB_HEIGHT 4096
 #define MGAG200_MAX_FB_WIDTH 4096
 
-#define MATROX_DPMS_CLEARED (-1)
-
-#define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
 #define to_mga_connector(x) container_of(x, struct mga_connector, base)
 
-struct mga_crtc {
-	struct drm_crtc base;
-	u8 lut_r[256], lut_g[256], lut_b[256];
-	int last_dpms;
-	bool enabled;
-};
-
 struct mga_i2c_chan {
 	struct i2c_adapter adapter;
 	struct drm_device *dev;
@@ -175,7 +164,7 @@ struct mga_device {
 	u32 unique_rev_id;
 
 	struct mga_connector connector;
-	struct drm_encoder encoder;
+	struct drm_simple_display_pipe display_pipe;
 };
 
 static inline struct mga_device *to_mga_device(struct drm_device *dev)
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index d6f9763a4a450..00bbc1f9b7db3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1475,15 +1475,6 @@ static int mga_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green,
 	return 0;
 }
 
-/* Simple cleanup function */
-static void mga_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct mga_crtc *mga_crtc = to_mga_crtc(crtc);
-
-	drm_crtc_cleanup(crtc);
-	kfree(mga_crtc);
-}
-
 static void mga_crtc_disable(struct drm_crtc *crtc)
 {
 	DRM_DEBUG_KMS("\n");
@@ -1501,7 +1492,7 @@ static void mga_crtc_disable(struct drm_crtc *crtc)
 static const struct drm_crtc_funcs mga_crtc_funcs = {
 	.gamma_set = mga_crtc_gamma_set,
 	.set_config = drm_crtc_helper_set_config,
-	.destroy = mga_crtc_destroy,
+	.destroy = drm_crtc_cleanup,
 };
 
 static const struct drm_crtc_helper_funcs mga_helper_funcs = {
@@ -1517,20 +1508,13 @@ static const struct drm_crtc_helper_funcs mga_helper_funcs = {
 static void mga_crtc_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
-	struct mga_crtc *mga_crtc;
-
-	mga_crtc = kzalloc(sizeof(struct mga_crtc) +
-			      (MGAG200FB_CONN_LIMIT * sizeof(struct drm_connector *)),
-			      GFP_KERNEL);
-
-	if (mga_crtc == NULL)
-		return;
+	struct drm_crtc *crtc = &mdev->display_pipe.crtc;
 
-	drm_crtc_init(dev, &mga_crtc->base, &mga_crtc_funcs);
+	drm_crtc_init(dev, crtc, &mga_crtc_funcs);
 
-	drm_mode_crtc_set_gamma_size(&mga_crtc->base, MGAG200_LUT_SIZE);
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 
-	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
+	drm_crtc_helper_add(crtc, &mga_helper_funcs);
 }
 
 /*
@@ -1718,7 +1702,7 @@ static unsigned int mgag200_preferred_depth(struct mga_device *mdev)
 int mgag200_modeset_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
-	struct drm_encoder *encoder = &mdev->encoder;
+	struct drm_encoder *encoder = &mdev->display_pipe.encoder;
 	struct drm_connector *connector = &mdev->connector.base;
 	int ret;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
