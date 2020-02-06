Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5131541B9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 11:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17C189F5F;
	Thu,  6 Feb 2020 10:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3F689FC8;
 Thu,  6 Feb 2020 10:19:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3A729B1B0;
 Thu,  6 Feb 2020 10:19:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bskeggs@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 4/4] drm/nouveau: Remove struct nouveau_framebuffer
Date: Thu,  6 Feb 2020 11:19:42 +0100
Message-Id: <20200206101942.1412-5-tzimmermann@suse.de>
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

After its cleanup, struct nouveau_framebuffer is only a wrapper around
struct drm_framebuffer. Use the latter directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c   | 26 +++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_display.c | 14 ++++++------
 drivers/gpu/drm/nouveau/nouveau_display.h | 12 +----------
 drivers/gpu/drm/nouveau/nouveau_fbcon.c   | 14 ++++++------
 4 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index ba1399965a1c..4a67a656e007 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -40,11 +40,11 @@ nv50_wndw_ctxdma_del(struct nv50_wndw_ctxdma *ctxdma)
 }
 
 static struct nv50_wndw_ctxdma *
-nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct nouveau_framebuffer *fb)
+nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 {
-	struct nouveau_drm *drm = nouveau_drm(fb->base.dev);
+	struct nouveau_drm *drm = nouveau_drm(fb->dev);
 	struct nv50_wndw_ctxdma *ctxdma;
-	struct nouveau_bo *nvbo = nouveau_gem_object(fb->base.obj[0]);
+	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
 	const u8    kind = nvbo->kind;
 	const u32 handle = 0xfb000000 | kind;
 	struct {
@@ -236,16 +236,16 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 			       struct nv50_wndw_atom *asyw,
 			       struct nv50_head_atom *asyh)
 {
-	struct nouveau_framebuffer *fb = nouveau_framebuffer(asyw->state.fb);
+	struct drm_framebuffer *fb = asyw->state.fb;
 	struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
-	struct nouveau_bo *nvbo = nouveau_gem_object(fb->base.obj[0]);
+	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
 	int ret;
 
 	NV_ATOMIC(drm, "%s acquire\n", wndw->plane.name);
 
-	if (asyw->state.fb != armw->state.fb || !armw->visible || modeset) {
-		asyw->image.w = fb->base.width;
-		asyw->image.h = fb->base.height;
+	if (fb != armw->state.fb || !armw->visible || modeset) {
+		asyw->image.w = fb->width;
+		asyw->image.h = fb->height;
 		asyw->image.kind = nvbo->kind;
 
 		ret = nv50_wndw_atomic_check_acquire_rgb(asyw);
@@ -261,13 +261,13 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 				asyw->image.blockh = nvbo->mode >> 4;
 			else
 				asyw->image.blockh = nvbo->mode;
-			asyw->image.blocks[0] = fb->base.pitches[0] / 64;
+			asyw->image.blocks[0] = fb->pitches[0] / 64;
 			asyw->image.pitch[0] = 0;
 		} else {
 			asyw->image.layout = 1;
 			asyw->image.blockh = 0;
 			asyw->image.blocks[0] = 0;
-			asyw->image.pitch[0] = fb->base.pitches[0];
+			asyw->image.pitch[0] = fb->pitches[0];
 		}
 
 		if (!asyh->state.async_flip)
@@ -486,16 +486,16 @@ nv50_wndw_cleanup_fb(struct drm_plane *plane, struct drm_plane_state *old_state)
 static int
 nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
-	struct nouveau_framebuffer *fb = nouveau_framebuffer(state->fb);
+	struct drm_framebuffer *fb = state->fb;
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
 	struct nv50_wndw *wndw = nv50_wndw(plane);
 	struct nv50_wndw_atom *asyw = nv50_wndw_atom(state);
-	struct nouveau_bo *nvbo = nouveau_gem_object(state->fb->obj[0]);
+	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
 	int ret;
 
-	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, state->fb);
+	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
 	if (!asyw->state.fb)
 		return 0;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index bbbff55eb5d5..94f7fd48e1cf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -207,10 +207,10 @@ int
 nouveau_framebuffer_new(struct drm_device *dev,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *gem,
-			struct nouveau_framebuffer **pfb)
+			struct drm_framebuffer **pfb)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nouveau_framebuffer *fb;
+	struct drm_framebuffer *fb;
 	int ret;
 
         /* YUV overlays have special requirements pre-NV50 */
@@ -236,10 +236,10 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
 		return -ENOMEM;
 
-	drm_helper_mode_fill_fb_struct(dev, &fb->base, mode_cmd);
-	fb->base.obj[0] = gem;
+	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+	fb->obj[0] = gem;
 
-	ret = drm_framebuffer_init(dev, &fb->base, &nouveau_framebuffer_funcs);
+	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
 	if (ret)
 		kfree(fb);
 	return ret;
@@ -250,7 +250,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 				struct drm_file *file_priv,
 				const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct nouveau_framebuffer *fb;
+	struct drm_framebuffer *fb;
 	struct drm_gem_object *gem;
 	int ret;
 
@@ -260,7 +260,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 
 	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
 	if (ret == 0)
-		return &fb->base;
+		return fb;
 
 	drm_gem_object_put_unlocked(gem);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 56c1dec8fc28..082bb067d575 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -8,21 +8,11 @@
 
 #include <drm/drm_framebuffer.h>
 
-struct nouveau_framebuffer {
-	struct drm_framebuffer base;
-};
-
-static inline struct nouveau_framebuffer *
-nouveau_framebuffer(struct drm_framebuffer *fb)
-{
-	return container_of(fb, struct nouveau_framebuffer, base);
-}
-
 int
 nouveau_framebuffer_new(struct drm_device *dev,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *gem,
-			struct nouveau_framebuffer **pfb);
+			struct drm_framebuffer **pfb);
 
 struct nouveau_display {
 	void *priv;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 02b36b44409c..d78bc03ad3b8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -312,7 +312,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_device *device = &drm->client.device;
 	struct fb_info *info;
-	struct nouveau_framebuffer *fb;
+	struct drm_framebuffer *fb;
 	struct nouveau_channel *chan;
 	struct nouveau_bo *nvbo;
 	struct drm_mode_fb_cmd2 mode_cmd;
@@ -367,7 +367,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 	}
 
 	/* setup helper */
-	fbcon->helper.fb = &fb->base;
+	fbcon->helper.fb = fb;
 
 	if (!chan)
 		info->flags = FBINFO_HWACCEL_DISABLED;
@@ -393,7 +393,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 
 	/* To allow resizeing without swapping buffers */
 	NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
-		fb->base.width, fb->base.height, nvbo->bo.offset, nvbo);
+		fb->width, fb->height, nvbo->bo.offset, nvbo);
 
 	vga_switcheroo_client_fb_set(dev->pdev, info);
 	return 0;
@@ -413,18 +413,18 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 static int
 nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev *fbcon)
 {
-	struct nouveau_framebuffer *nouveau_fb = nouveau_framebuffer(fbcon->helper.fb);
+	struct drm_framebuffer *fb = fbcon->helper.fb;
 	struct nouveau_bo *nvbo;
 
 	drm_fb_helper_unregister_fbi(&fbcon->helper);
 	drm_fb_helper_fini(&fbcon->helper);
 
-	if (nouveau_fb && nouveau_fb->base.obj[0]) {
-		nvbo = nouveau_gem_object(nouveau_fb->base.obj[0]);
+	if (fb && fb->obj[0]) {
+		nvbo = nouveau_gem_object(fb->obj[0]);
 		nouveau_vma_del(&fbcon->vma);
 		nouveau_bo_unmap(nvbo);
 		nouveau_bo_unpin(nvbo);
-		drm_framebuffer_put(&nouveau_fb->base);
+		drm_framebuffer_put(fb);
 	}
 
 	return 0;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
