Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5041541BE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 11:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F526FA27;
	Thu,  6 Feb 2020 10:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6347189F5F;
 Thu,  6 Feb 2020 10:19:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 045ADB1B1;
 Thu,  6 Feb 2020 10:19:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bskeggs@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 3/4] drm/nouveau: Remove field nvbo from struct
 nouveau_framebuffer
Date: Thu,  6 Feb 2020 11:19:41 +0100
Message-Id: <20200206101942.1412-4-tzimmermann@suse.de>
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

The buffer object stored in nvbo is also available GEM object in obj[0]
of struct drm_framebuffer. Therefore remove nvbo in favor obj[0] and
replace all references accordingly. This may require an additional cast.

With this change we can already replace nouveau_user_framebuffer_destroy()
and nouveau_user_framebuffer_create_handle() with generic GEM helpers.
Calls to nouveau_framebuffer_new() receive a GEM object.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c    | 19 ++++++------
 drivers/gpu/drm/nouveau/dispnv04/disp.c    | 21 ++++++-------
 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 21 +++++++------
 drivers/gpu/drm/nouveau/dispnv50/wndw.c    | 25 +++++++++-------
 drivers/gpu/drm/nouveau/nouveau_display.c  | 35 ++++------------------
 drivers/gpu/drm/nouveau/nouveau_display.h  |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c    | 28 +++++++++--------
 7 files changed, 74 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 37c50ea8f847..ece877c727cd 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -605,15 +605,16 @@ static int
 nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_framebuffer *old_fb)
 {
 	struct nv04_display *disp = nv04_display(crtc->dev);
-	struct nouveau_framebuffer *nvfb = nouveau_framebuffer(crtc->primary->fb);
+	struct drm_framebuffer *fb = crtc->primary->fb;
+	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	int ret;
 
-	ret = nouveau_bo_pin(nvfb->nvbo, TTM_PL_FLAG_VRAM, false);
+	ret = nouveau_bo_pin(nvbo, TTM_PL_FLAG_VRAM, false);
 	if (ret == 0) {
 		if (disp->image[nv_crtc->index])
 			nouveau_bo_unpin(disp->image[nv_crtc->index]);
-		nouveau_bo_ref(nvfb->nvbo, &disp->image[nv_crtc->index]);
+		nouveau_bo_ref(nvbo, &disp->image[nv_crtc->index]);
 	}
 
 	return ret;
@@ -822,8 +823,8 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
+	struct nouveau_bo *nvbo;
 	struct drm_framebuffer *drm_fb;
-	struct nouveau_framebuffer *fb;
 	int arb_burst, arb_lwm;
 
 	NV_DEBUG(drm, "index %d\n", nv_crtc->index);
@@ -839,13 +840,12 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	 */
 	if (atomic) {
 		drm_fb = passed_fb;
-		fb = nouveau_framebuffer(passed_fb);
 	} else {
 		drm_fb = crtc->primary->fb;
-		fb = nouveau_framebuffer(crtc->primary->fb);
 	}
 
-	nv_crtc->fb.offset = fb->nvbo->bo.offset;
+	nvbo = nouveau_gem_object(drm_fb->obj[0]);
+	nv_crtc->fb.offset = nvbo->bo.offset;
 
 	if (nv_crtc->lut.depth != drm_fb->format->depth) {
 		nv_crtc->lut.depth = drm_fb->format->depth;
@@ -1143,8 +1143,9 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	const int swap_interval = (flags & DRM_MODE_PAGE_FLIP_ASYNC) ? 0 : 1;
 	struct drm_device *dev = crtc->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nouveau_bo *old_bo = nouveau_framebuffer(crtc->primary->fb)->nvbo;
-	struct nouveau_bo *new_bo = nouveau_framebuffer(fb)->nvbo;
+	struct drm_framebuffer *old_fb = crtc->primary->fb;
+	struct nouveau_bo *old_bo = nouveau_gem_object(old_fb->obj[0]);
+	struct nouveau_bo *new_bo = nouveau_gem_object(fb->obj[0]);
 	struct nv04_page_flip_state *s;
 	struct nouveau_channel *chan;
 	struct nouveau_cli *cli;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 44ee82d0c9b6..0f4ebefed1fd 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -30,6 +30,7 @@
 #include "nouveau_encoder.h"
 #include "nouveau_connector.h"
 #include "nouveau_bo.h"
+#include "nouveau_gem.h"
 
 #include <nvif/if0004.h>
 
@@ -52,13 +53,13 @@ nv04_display_fini(struct drm_device *dev, bool suspend)
 
 	/* Un-pin FB and cursors so they'll be evicted to system memory. */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		struct nouveau_framebuffer *nouveau_fb;
+		struct drm_framebuffer *fb = crtc->primary->fb;
+		struct nouveau_bo *nvbo;
 
-		nouveau_fb = nouveau_framebuffer(crtc->primary->fb);
-		if (!nouveau_fb || !nouveau_fb->nvbo)
+		if (!fb || !fb->obj[0])
 			continue;
-
-		nouveau_bo_unpin(nouveau_fb->nvbo);
+		nvbo = nouveau_gem_object(fb->obj[0]);
+		nouveau_bo_unpin(nvbo);
 	}
 
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
@@ -104,13 +105,13 @@ nv04_display_init(struct drm_device *dev, bool resume, bool runtime)
 
 	/* Re-pin FB/cursors. */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		struct nouveau_framebuffer *nouveau_fb;
+		struct drm_framebuffer *fb = crtc->primary->fb;
+		struct nouveau_bo *nvbo;
 
-		nouveau_fb = nouveau_framebuffer(crtc->primary->fb);
-		if (!nouveau_fb || !nouveau_fb->nvbo)
+		if (!fb || !fb->obj[0])
 			continue;
-
-		ret = nouveau_bo_pin(nouveau_fb->nvbo, TTM_PL_FLAG_VRAM, true);
+		nvbo = nouveau_gem_object(fb->obj[0]);
+		ret = nouveau_bo_pin(nvbo, TTM_PL_FLAG_VRAM, true);
 		if (ret)
 			NV_ERROR(drm, "Could not pin framebuffer\n");
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index a3a0a73ae8ab..6248fd1dbc6d 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -31,6 +31,7 @@
 #include "nouveau_bo.h"
 #include "nouveau_connector.h"
 #include "nouveau_display.h"
+#include "nouveau_gem.h"
 #include "nvreg.h"
 #include "disp.h"
 
@@ -120,9 +121,9 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	struct nvif_object *dev = &drm->client.device.object;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
-	struct nouveau_framebuffer *nv_fb = nouveau_framebuffer(fb);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_bo *cur = nv_plane->cur;
+	struct nouveau_bo *nvbo;
 	bool flip = nv_plane->flip;
 	int soff = NV_PCRTC0_SIZE * nv_crtc->index;
 	int soff2 = NV_PCRTC0_SIZE * !nv_crtc->index;
@@ -140,17 +141,18 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ret = nouveau_bo_pin(nv_fb->nvbo, TTM_PL_FLAG_VRAM, false);
+	nvbo = nouveau_gem_object(fb->obj[0]);
+	ret = nouveau_bo_pin(nvbo, TTM_PL_FLAG_VRAM, false);
 	if (ret)
 		return ret;
 
-	nv_plane->cur = nv_fb->nvbo;
+	nv_plane->cur = nvbo;
 
 	nvif_mask(dev, NV_PCRTC_ENGINE_CTRL + soff, NV_CRTC_FSEL_OVERLAY, NV_CRTC_FSEL_OVERLAY);
 	nvif_mask(dev, NV_PCRTC_ENGINE_CTRL + soff2, NV_CRTC_FSEL_OVERLAY, 0);
 
 	nvif_wr32(dev, NV_PVIDEO_BASE(flip), 0);
-	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->bo.offset);
+	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nvbo->bo.offset);
 	nvif_wr32(dev, NV_PVIDEO_SIZE_IN(flip), src_h << 16 | src_w);
 	nvif_wr32(dev, NV_PVIDEO_POINT_IN(flip), src_y << 16 | src_x);
 	nvif_wr32(dev, NV_PVIDEO_DS_DX(flip), (src_w << 20) / crtc_w);
@@ -172,7 +174,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	if (format & NV_PVIDEO_FORMAT_PLANAR) {
 		nvif_wr32(dev, NV_PVIDEO_UVPLANE_BASE(flip), 0);
 		nvif_wr32(dev, NV_PVIDEO_UVPLANE_OFFSET_BUFF(flip),
-			nv_fb->nvbo->bo.offset + fb->offsets[1]);
+			nvbo->bo.offset + fb->offsets[1]);
 	}
 	nvif_wr32(dev, NV_PVIDEO_FORMAT(flip), format | fb->pitches[0]);
 	nvif_wr32(dev, NV_PVIDEO_STOP, 0);
@@ -368,8 +370,8 @@ nv04_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	struct nvif_object *dev = &nouveau_drm(plane->dev)->client.device.object;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
-	struct nouveau_framebuffer *nv_fb = nouveau_framebuffer(fb);
 	struct nouveau_bo *cur = nv_plane->cur;
+	struct nouveau_bo *nvbo;
 	uint32_t overlay = 1;
 	int brightness = (nv_plane->brightness - 512) * 62 / 512;
 	int ret, i;
@@ -384,11 +386,12 @@ nv04_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ret = nouveau_bo_pin(nv_fb->nvbo, TTM_PL_FLAG_VRAM, false);
+	nvbo = nouveau_gem_object(fb->obj[0]);
+	ret = nouveau_bo_pin(nvbo, TTM_PL_FLAG_VRAM, false);
 	if (ret)
 		return ret;
 
-	nv_plane->cur = nv_fb->nvbo;
+	nv_plane->cur = nvbo;
 
 	nvif_wr32(dev, NV_PVIDEO_OE_STATE, 0);
 	nvif_wr32(dev, NV_PVIDEO_SU_STATE, 0);
@@ -396,7 +399,7 @@ nv04_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 
 	for (i = 0; i < 2; i++) {
 		nvif_wr32(dev, NV_PVIDEO_BUFF0_START_ADDRESS + 4 * i,
-			  nv_fb->nvbo->bo.offset);
+			  nvbo->bo.offset);
 		nvif_wr32(dev, NV_PVIDEO_BUFF0_PITCH_LENGTH + 4 * i,
 			  fb->pitches[0]);
 		nvif_wr32(dev, NV_PVIDEO_BUFF0_OFFSET + 4 * i, 0);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 890315291b01..ba1399965a1c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -29,6 +29,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "nouveau_bo.h"
+#include "nouveau_gem.h"
 
 static void
 nv50_wndw_ctxdma_del(struct nv50_wndw_ctxdma *ctxdma)
@@ -43,7 +44,8 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct nouveau_framebuffer *fb)
 {
 	struct nouveau_drm *drm = nouveau_drm(fb->base.dev);
 	struct nv50_wndw_ctxdma *ctxdma;
-	const u8    kind = fb->nvbo->kind;
+	struct nouveau_bo *nvbo = nouveau_gem_object(fb->base.obj[0]);
+	const u8    kind = nvbo->kind;
 	const u32 handle = 0xfb000000 | kind;
 	struct {
 		struct nv_dma_v0 base;
@@ -236,6 +238,7 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 {
 	struct nouveau_framebuffer *fb = nouveau_framebuffer(asyw->state.fb);
 	struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
+	struct nouveau_bo *nvbo = nouveau_gem_object(fb->base.obj[0]);
 	int ret;
 
 	NV_ATOMIC(drm, "%s acquire\n", wndw->plane.name);
@@ -243,7 +246,7 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 	if (asyw->state.fb != armw->state.fb || !armw->visible || modeset) {
 		asyw->image.w = fb->base.width;
 		asyw->image.h = fb->base.height;
-		asyw->image.kind = fb->nvbo->kind;
+		asyw->image.kind = nvbo->kind;
 
 		ret = nv50_wndw_atomic_check_acquire_rgb(asyw);
 		if (ret) {
@@ -255,9 +258,9 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 		if (asyw->image.kind) {
 			asyw->image.layout = 0;
 			if (drm->client.device.info.chipset >= 0xc0)
-				asyw->image.blockh = fb->nvbo->mode >> 4;
+				asyw->image.blockh = nvbo->mode >> 4;
 			else
-				asyw->image.blockh = fb->nvbo->mode;
+				asyw->image.blockh = nvbo->mode;
 			asyw->image.blocks[0] = fb->base.pitches[0] / 64;
 			asyw->image.pitch[0] = 0;
 		} else {
@@ -469,14 +472,15 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struct drm_plane_state *state)
 static void
 nv50_wndw_cleanup_fb(struct drm_plane *plane, struct drm_plane_state *old_state)
 {
-	struct nouveau_framebuffer *fb = nouveau_framebuffer(old_state->fb);
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	struct nouveau_bo *nvbo;
 
 	NV_ATOMIC(drm, "%s cleanup: %p\n", plane->name, old_state->fb);
 	if (!old_state->fb)
 		return;
 
-	nouveau_bo_unpin(fb->nvbo);
+	nvbo = nouveau_gem_object(old_state->fb->obj[0]);
+	nouveau_bo_unpin(nvbo);
 }
 
 static int
@@ -486,6 +490,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
 	struct nv50_wndw *wndw = nv50_wndw(plane);
 	struct nv50_wndw_atom *asyw = nv50_wndw_atom(state);
+	struct nouveau_bo *nvbo = nouveau_gem_object(state->fb->obj[0]);
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
 	int ret;
@@ -494,22 +499,22 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	if (!asyw->state.fb)
 		return 0;
 
-	ret = nouveau_bo_pin(fb->nvbo, TTM_PL_FLAG_VRAM, true);
+	ret = nouveau_bo_pin(nvbo, TTM_PL_FLAG_VRAM, true);
 	if (ret)
 		return ret;
 
 	if (wndw->ctxdma.parent) {
 		ctxdma = nv50_wndw_ctxdma_new(wndw, fb);
 		if (IS_ERR(ctxdma)) {
-			nouveau_bo_unpin(fb->nvbo);
+			nouveau_bo_unpin(nvbo);
 			return PTR_ERR(ctxdma);
 		}
 
 		asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_rcu(fb->nvbo->bo.base.resv);
-	asyw->image.offset[0] = fb->nvbo->bo.offset;
+	asyw->state.fence = dma_resv_get_excl_rcu(nvbo->bo.base.resv);
+	asyw->image.offset[0] = nvbo->bo.offset;
 
 	if (wndw->func->prepare) {
 		asyh = nv50_head_atom_get(asyw->state.state, asyw->state.crtc);
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 53f9bceaf17a..bbbff55eb5d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -31,6 +31,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -197,37 +198,15 @@ nouveau_display_vblank_init(struct drm_device *dev)
 	return 0;
 }
 
-static void
-nouveau_user_framebuffer_destroy(struct drm_framebuffer *drm_fb)
-{
-	struct nouveau_framebuffer *fb = nouveau_framebuffer(drm_fb);
-
-	if (fb->nvbo)
-		drm_gem_object_put_unlocked(&fb->nvbo->bo.base);
-
-	drm_framebuffer_cleanup(drm_fb);
-	kfree(fb);
-}
-
-static int
-nouveau_user_framebuffer_create_handle(struct drm_framebuffer *drm_fb,
-				       struct drm_file *file_priv,
-				       unsigned int *handle)
-{
-	struct nouveau_framebuffer *fb = nouveau_framebuffer(drm_fb);
-
-	return drm_gem_handle_create(file_priv, &fb->nvbo->bo.base, handle);
-}
-
 static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
-	.destroy = nouveau_user_framebuffer_destroy,
-	.create_handle = nouveau_user_framebuffer_create_handle,
+	.destroy = drm_gem_fb_destroy,
+	.create_handle = drm_gem_fb_create_handle,
 };
 
 int
 nouveau_framebuffer_new(struct drm_device *dev,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
-			struct nouveau_bo *nvbo,
+			struct drm_gem_object *gem,
 			struct nouveau_framebuffer **pfb)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -258,7 +237,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 		return -ENOMEM;
 
 	drm_helper_mode_fill_fb_struct(dev, &fb->base, mode_cmd);
-	fb->nvbo = nvbo;
+	fb->base.obj[0] = gem;
 
 	ret = drm_framebuffer_init(dev, &fb->base, &nouveau_framebuffer_funcs);
 	if (ret)
@@ -272,16 +251,14 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 				const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct nouveau_framebuffer *fb;
-	struct nouveau_bo *nvbo;
 	struct drm_gem_object *gem;
 	int ret;
 
 	gem = drm_gem_object_lookup(file_priv, mode_cmd->handles[0]);
 	if (!gem)
 		return ERR_PTR(-ENOENT);
-	nvbo = nouveau_gem_object(gem);
 
-	ret = nouveau_framebuffer_new(dev, mode_cmd, nvbo, &fb);
+	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
 	if (ret == 0)
 		return &fb->base;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 0b3eb04b95a7..56c1dec8fc28 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -10,7 +10,6 @@
 
 struct nouveau_framebuffer {
 	struct drm_framebuffer base;
-	struct nouveau_bo *nvbo;
 };
 
 static inline struct nouveau_framebuffer *
@@ -19,9 +18,11 @@ nouveau_framebuffer(struct drm_framebuffer *fb)
 	return container_of(fb, struct nouveau_framebuffer, base);
 }
 
-int nouveau_framebuffer_new(struct drm_device *,
-			    const struct drm_mode_fb_cmd2 *,
-			    struct nouveau_bo *, struct nouveau_framebuffer **);
+int
+nouveau_framebuffer_new(struct drm_device *dev,
+			const struct drm_mode_fb_cmd2 *mode_cmd,
+			struct drm_gem_object *gem,
+			struct nouveau_framebuffer **pfb);
 
 struct nouveau_display {
 	void *priv;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 6b2f46b0c115..02b36b44409c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -335,7 +335,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 		goto out;
 	}
 
-	ret = nouveau_framebuffer_new(dev, &mode_cmd, nvbo, &fb);
+	ret = nouveau_framebuffer_new(dev, &mode_cmd, &nvbo->bo.base, &fb);
 	if (ret)
 		goto out_unref;
 
@@ -376,12 +376,12 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 			      FBINFO_HWACCEL_FILLRECT |
 			      FBINFO_HWACCEL_IMAGEBLIT;
 	info->fbops = &nouveau_fbcon_sw_ops;
-	info->fix.smem_start = fb->nvbo->bo.mem.bus.base +
-			       fb->nvbo->bo.mem.bus.offset;
-	info->fix.smem_len = fb->nvbo->bo.mem.num_pages << PAGE_SHIFT;
+	info->fix.smem_start = nvbo->bo.mem.bus.base +
+			       nvbo->bo.mem.bus.offset;
+	info->fix.smem_len = nvbo->bo.mem.num_pages << PAGE_SHIFT;
 
-	info->screen_base = nvbo_kmap_obj_iovirtual(fb->nvbo);
-	info->screen_size = fb->nvbo->bo.mem.num_pages << PAGE_SHIFT;
+	info->screen_base = nvbo_kmap_obj_iovirtual(nvbo);
+	info->screen_size = nvbo->bo.mem.num_pages << PAGE_SHIFT;
 
 	drm_fb_helper_fill_info(info, &fbcon->helper, sizes);
 
@@ -393,7 +393,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 
 	/* To allow resizeing without swapping buffers */
 	NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
-		fb->base.width, fb->base.height, fb->nvbo->bo.offset, nvbo);
+		fb->base.width, fb->base.height, nvbo->bo.offset, nvbo);
 
 	vga_switcheroo_client_fb_set(dev->pdev, info);
 	return 0;
@@ -401,11 +401,11 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 out_unlock:
 	if (chan)
 		nouveau_vma_del(&fbcon->vma);
-	nouveau_bo_unmap(fb->nvbo);
+	nouveau_bo_unmap(nvbo);
 out_unpin:
-	nouveau_bo_unpin(fb->nvbo);
+	nouveau_bo_unpin(nvbo);
 out_unref:
-	nouveau_bo_ref(NULL, &fb->nvbo);
+	nouveau_bo_ref(NULL, &nvbo);
 out:
 	return ret;
 }
@@ -414,14 +414,16 @@ static int
 nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev *fbcon)
 {
 	struct nouveau_framebuffer *nouveau_fb = nouveau_framebuffer(fbcon->helper.fb);
+	struct nouveau_bo *nvbo;
 
 	drm_fb_helper_unregister_fbi(&fbcon->helper);
 	drm_fb_helper_fini(&fbcon->helper);
 
-	if (nouveau_fb && nouveau_fb->nvbo) {
+	if (nouveau_fb && nouveau_fb->base.obj[0]) {
+		nvbo = nouveau_gem_object(nouveau_fb->base.obj[0]);
 		nouveau_vma_del(&fbcon->vma);
-		nouveau_bo_unmap(nouveau_fb->nvbo);
-		nouveau_bo_unpin(nouveau_fb->nvbo);
+		nouveau_bo_unmap(nvbo);
+		nouveau_bo_unpin(nvbo);
 		drm_framebuffer_put(&nouveau_fb->base);
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
