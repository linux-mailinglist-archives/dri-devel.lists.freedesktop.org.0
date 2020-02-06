Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3612F1541BF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 11:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9695E6FA29;
	Thu,  6 Feb 2020 10:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6242489E43;
 Thu,  6 Feb 2020 10:19:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C1AEAB1AF;
 Thu,  6 Feb 2020 10:19:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bskeggs@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 2/4] drm/nouveau: Move struct nouveau_framebuffer.vma to
 struct nouveau_fbdev
Date: Thu,  6 Feb 2020 11:19:40 +0100
Message-Id: <20200206101942.1412-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206101942.1412-1-tzimmermann@suse.de>
References: <20200206101942.1412-1-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vma field of struct nouveau_framebuffer is a special field for the
the accelerated fbdev console. Hence there's at most one single instance
for the active console. Moving it into struct nouveau_fbdev makes struct
nouveau_framebuffer slightly smaller and brings it closer to struct
drm_framebuffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_display.h | 1 -
 drivers/gpu/drm/nouveau/nouveau_fbcon.c   | 6 +++---
 drivers/gpu/drm/nouveau/nouveau_fbcon.h   | 3 +++
 drivers/gpu/drm/nouveau/nv50_fbcon.c      | 9 ++++-----
 drivers/gpu/drm/nouveau/nvc0_fbcon.c      | 9 ++++-----
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index e397b3d246e5..0b3eb04b95a7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -11,7 +11,6 @@
 struct nouveau_framebuffer {
 	struct drm_framebuffer base;
 	struct nouveau_bo *nvbo;
-	struct nouveau_vma *vma;
 };
 
 static inline struct nouveau_framebuffer *
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 0c5cdda3c336..6b2f46b0c115 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -353,7 +353,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 
 	chan = nouveau_nofbaccel ? NULL : drm->channel;
 	if (chan && device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
-		ret = nouveau_vma_new(nvbo, chan->vmm, &fb->vma);
+		ret = nouveau_vma_new(nvbo, chan->vmm, &fbcon->vma);
 		if (ret) {
 			NV_ERROR(drm, "failed to map fb into chan: %d\n", ret);
 			chan = NULL;
@@ -400,7 +400,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 
 out_unlock:
 	if (chan)
-		nouveau_vma_del(&fb->vma);
+		nouveau_vma_del(&fbcon->vma);
 	nouveau_bo_unmap(fb->nvbo);
 out_unpin:
 	nouveau_bo_unpin(fb->nvbo);
@@ -419,7 +419,7 @@ nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev *fbcon)
 	drm_fb_helper_fini(&fbcon->helper);
 
 	if (nouveau_fb && nouveau_fb->nvbo) {
-		nouveau_vma_del(&nouveau_fb->vma);
+		nouveau_vma_del(&fbcon->vma);
 		nouveau_bo_unmap(nouveau_fb->nvbo);
 		nouveau_bo_unpin(nouveau_fb->nvbo);
 		drm_framebuffer_put(&nouveau_fb->base);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.h b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
index 73a7eeba3973..1796d8824580 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
@@ -31,6 +31,8 @@
 
 #include "nouveau_display.h"
 
+struct nouveau_vma;
+
 struct nouveau_fbdev {
 	struct drm_fb_helper helper; /* must be first */
 	unsigned int saved_flags;
@@ -41,6 +43,7 @@ struct nouveau_fbdev {
 	struct nvif_object gdi;
 	struct nvif_object blit;
 	struct nvif_object twod;
+	struct nouveau_vma *vma;
 
 	struct mutex hotplug_lock;
 	bool hotplug_waiting;
diff --git a/drivers/gpu/drm/nouveau/nv50_fbcon.c b/drivers/gpu/drm/nouveau/nv50_fbcon.c
index facd18564e0d..47428f79ede8 100644
--- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
@@ -149,7 +149,6 @@ int
 nv50_fbcon_accel_init(struct fb_info *info)
 {
 	struct nouveau_fbdev *nfbdev = info->par;
-	struct nouveau_framebuffer *fb = nouveau_framebuffer(nfbdev->helper.fb);
 	struct drm_device *dev = nfbdev->helper.dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_channel *chan = drm->channel;
@@ -240,8 +239,8 @@ nv50_fbcon_accel_init(struct fb_info *info)
 	OUT_RING(chan, info->fix.line_length);
 	OUT_RING(chan, info->var.xres_virtual);
 	OUT_RING(chan, info->var.yres_virtual);
-	OUT_RING(chan, upper_32_bits(fb->vma->addr));
-	OUT_RING(chan, lower_32_bits(fb->vma->addr));
+	OUT_RING(chan, upper_32_bits(nfbdev->vma->addr));
+	OUT_RING(chan, lower_32_bits(nfbdev->vma->addr));
 	BEGIN_NV04(chan, NvSub2D, 0x0230, 2);
 	OUT_RING(chan, format);
 	OUT_RING(chan, 1);
@@ -249,8 +248,8 @@ nv50_fbcon_accel_init(struct fb_info *info)
 	OUT_RING(chan, info->fix.line_length);
 	OUT_RING(chan, info->var.xres_virtual);
 	OUT_RING(chan, info->var.yres_virtual);
-	OUT_RING(chan, upper_32_bits(fb->vma->addr));
-	OUT_RING(chan, lower_32_bits(fb->vma->addr));
+	OUT_RING(chan, upper_32_bits(nfbdev->vma->addr));
+	OUT_RING(chan, lower_32_bits(nfbdev->vma->addr));
 	FIRE_RING(chan);
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nvc0_fbcon.c b/drivers/gpu/drm/nouveau/nvc0_fbcon.c
index c0deef4fe727..cb56163ed608 100644
--- a/drivers/gpu/drm/nouveau/nvc0_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nvc0_fbcon.c
@@ -150,7 +150,6 @@ nvc0_fbcon_accel_init(struct fb_info *info)
 {
 	struct nouveau_fbdev *nfbdev = info->par;
 	struct drm_device *dev = nfbdev->helper.dev;
-	struct nouveau_framebuffer *fb = nouveau_framebuffer(nfbdev->helper.fb);
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_channel *chan = drm->channel;
 	int ret, format;
@@ -240,8 +239,8 @@ nvc0_fbcon_accel_init(struct fb_info *info)
 	OUT_RING  (chan, info->fix.line_length);
 	OUT_RING  (chan, info->var.xres_virtual);
 	OUT_RING  (chan, info->var.yres_virtual);
-	OUT_RING  (chan, upper_32_bits(fb->vma->addr));
-	OUT_RING  (chan, lower_32_bits(fb->vma->addr));
+	OUT_RING  (chan, upper_32_bits(nfbdev->vma->addr));
+	OUT_RING  (chan, lower_32_bits(nfbdev->vma->addr));
 	BEGIN_NVC0(chan, NvSub2D, 0x0230, 10);
 	OUT_RING  (chan, format);
 	OUT_RING  (chan, 1);
@@ -251,8 +250,8 @@ nvc0_fbcon_accel_init(struct fb_info *info)
 	OUT_RING  (chan, info->fix.line_length);
 	OUT_RING  (chan, info->var.xres_virtual);
 	OUT_RING  (chan, info->var.yres_virtual);
-	OUT_RING  (chan, upper_32_bits(fb->vma->addr));
-	OUT_RING  (chan, lower_32_bits(fb->vma->addr));
+	OUT_RING  (chan, upper_32_bits(nfbdev->vma->addr));
+	OUT_RING  (chan, lower_32_bits(nfbdev->vma->addr));
 	FIRE_RING (chan);
 
 	return 0;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
