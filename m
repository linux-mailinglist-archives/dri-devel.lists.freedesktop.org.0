Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595EF1D482F
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5656EC14;
	Fri, 15 May 2020 08:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684F66E3AC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7562EAFEC;
 Fri, 15 May 2020 08:32:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 01/15] drm/mgag200: Remove HW cursor
Date: Fri, 15 May 2020 10:32:19 +0200
Message-Id: <20200515083233.32036-2-tzimmermann@suse.de>
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

The HW cursor of Matrox G200 cards only supports a 16-color palette
format. Univeral planes require at least ARGB or a similar component-
based format, so remove the HW cursor.

Alternatively, the driver could dither a cursor image from ARGB to
16 colors. But this does not produce pleasent-looking results in
general, so it's useless for modern compositors.

Without HW support, compositors will use software rendering.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/Makefile       |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h  | 13 -------------
 drivers/gpu/drm/mgag200/mgag200_main.c |  5 -----
 drivers/gpu/drm/mgag200/mgag200_mode.c |  2 --
 4 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index 04b281bcf6558..63403133638a3 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mgag200-y   := mgag200_main.o mgag200_mode.o mgag200_cursor.o \
+mgag200-y   := mgag200_main.o mgag200_mode.o \
 	mgag200_drv.o mgag200_i2c.o mgag200_ttm.o
 
 obj-$(CONFIG_DRM_MGAG200) += mgag200.o
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index d9b7e96b214f8..bc372c2ec79e9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -116,11 +116,6 @@ struct mga_connector {
 	struct mga_i2c_chan *i2c;
 };
 
-struct mga_cursor {
-	struct drm_gem_vram_object *gbo[2];
-	unsigned int next_index;
-};
-
 struct mga_mc {
 	resource_size_t			vram_size;
 	resource_size_t			vram_base;
@@ -156,8 +151,6 @@ struct mga_device {
 
 	struct mga_mc			mc;
 
-	struct mga_cursor cursor;
-
 	size_t vram_fb_available;
 
 	bool				suspended;
@@ -207,10 +200,4 @@ int mgag200_mm_init(struct mga_device *mdev);
 void mgag200_mm_fini(struct mga_device *mdev);
 int mgag200_mmap(struct file *filp, struct vm_area_struct *vma);
 
-int mgag200_cursor_init(struct mga_device *mdev);
-void mgag200_cursor_fini(struct mga_device *mdev);
-int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
-			    uint32_t handle, uint32_t width, uint32_t height);
-int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
-
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 86df799fd38c5..3298eff7bd1b4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -135,10 +135,6 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 		goto err_mgag200_mm_fini;
 	}
 
-	ret = mgag200_cursor_init(mdev);
-	if (ret)
-		drm_err(dev, "Could not initialize cursors. Not doing hardware cursors.\n");
-
 	return 0;
 
 err_mgag200_mm_fini:
@@ -154,7 +150,6 @@ void mgag200_driver_unload(struct drm_device *dev)
 
 	if (mdev == NULL)
 		return;
-	mgag200_cursor_fini(mdev);
 	mgag200_mm_fini(mdev);
 	dev->dev_private = NULL;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 5f4ac36a97760..c68ed8b6faf9b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1412,8 +1412,6 @@ static void mga_crtc_disable(struct drm_crtc *crtc)
 
 /* These provide the minimum set of functions required to handle a CRTC */
 static const struct drm_crtc_funcs mga_crtc_funcs = {
-	.cursor_set = mgag200_crtc_cursor_set,
-	.cursor_move = mgag200_crtc_cursor_move,
 	.gamma_set = mga_crtc_gamma_set,
 	.set_config = drm_crtc_helper_set_config,
 	.destroy = mga_crtc_destroy,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
