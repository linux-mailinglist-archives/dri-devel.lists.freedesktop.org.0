Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19770393931
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F156F510;
	Thu, 27 May 2021 23:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89416F510
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:22:26 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 10/11] drm/ingenic: Add doublescan feature
Date: Fri, 28 May 2021 00:22:05 +0100
Message-Id: <20210527232206.152771-1-paul@crapouillou.net>
In-Reply-To: <20210527232104.152577-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A lot of devices with an Ingenic SoC have a weird LCD panel attached,
where the pixels are not square. For instance, the AUO A030JTN01 and
Innolux EJ030NA panels have a resolution of 320x480 with a 4:3 aspect
ratio.

All userspace applications are built with the assumption that the
pixels are square. To be able to support these devices without too
much effort, add a doublescan feature, which allows the f0 and f1
planes to be used with only half of the screen's vertical resolution,
where each line of the input is displayed twice.

This is done using a chained list of DMA descriptors, one descriptor
per output line.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 93 +++++++++++++++++++++--
 1 file changed, 87 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 2761478b16e8..01d8490393d1 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -66,6 +66,8 @@ struct jz_soc_info {
 
 struct ingenic_gem_object {
 	struct drm_gem_cma_object base;
+	struct ingenic_dma_hwdesc *hwdescs;
+	dma_addr_t hwdescs_phys;
 };
 
 struct ingenic_drm_private_state {
@@ -73,6 +75,23 @@ struct ingenic_drm_private_state {
 
 	bool no_vblank;
 	bool use_palette;
+
+	/*
+	 * A lot of devices with an Ingenic SoC have a weird LCD panel attached,
+	 * where the pixels are not square. For instance, the AUO A030JTN01 and
+	 * Innolux EJ030NA panels have a resolution of 320x480 with a 4:3 aspect
+	 * ratio.
+	 *
+	 * All userspace applications are built with the assumption that the
+	 * pixels are square. To be able to support these devices without too
+	 * much effort, add a doublescan feature, which allows the f0 and f1
+	 * planes to be used with only half of the screen's vertical resolution,
+	 * where each line of the input is displayed twice.
+	 *
+	 * This is done using a chained list of DMA descriptors, one descriptor
+	 * per output line.
+	 */
+	bool doublescan;
 };
 
 struct ingenic_drm {
@@ -465,7 +484,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 		return PTR_ERR(priv_state);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  0x8000,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  priv->soc_info->has_osd,
 						  true);
@@ -482,6 +501,17 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	     (new_plane_state->src_h >> 16) != new_plane_state->crtc_h))
 		return -EINVAL;
 
+	/* Enable doublescan if the CRTC_H is twice the SRC_H. */
+	priv_state->doublescan = (new_plane_state->src_h >> 16) * 2 == new_plane_state->crtc_h;
+
+	/* Otherwise, fail if CRTC_H != SRC_H */
+	if (!priv_state->doublescan && (new_plane_state->src_h >> 16) != new_plane_state->crtc_h)
+		return -EINVAL;
+
+	/* Fail if CRTC_W != SRC_W */
+	if ((new_plane_state->src_w >> 16) != new_plane_state->crtc_w)
+		return -EINVAL;
+
 	priv_state->use_palette = new_plane_state->fb &&
 		new_plane_state->fb->format->format == DRM_FORMAT_C8;
 
@@ -647,7 +677,9 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct ingenic_drm_private_state *priv_state;
 	struct drm_crtc_state *crtc_state;
 	struct ingenic_dma_hwdesc *hwdesc;
-	unsigned int width, height, cpp;
+	unsigned int width, height, cpp, i;
+	struct drm_gem_object *gem_obj;
+	struct ingenic_gem_object *obj;
 	dma_addr_t addr, next_addr;
 	bool use_f1;
 	u32 fourcc;
@@ -664,17 +696,39 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
 
+		gem_obj = drm_gem_fb_get_obj(newstate->fb, 0);
+		obj = to_ingenic_gem_obj(gem_obj);
+
 		priv_state = ingenic_drm_get_new_priv_state(priv, state);
 		if (priv_state && priv_state->use_palette)
 			next_addr = dma_hwdesc_pal_addr(priv);
 		else
 			next_addr = dma_hwdesc_addr(priv, use_f1);
 
-		hwdesc = &priv->dma_hwdescs->hwdesc[use_f1];
+		if (priv_state->doublescan) {
+			hwdesc = &obj->hwdescs[0];
+			/*
+			 * Use one DMA descriptor per output line, and display
+			 * each input line twice.
+			 */
+			for (i = 0; i < newstate->crtc_h; i++) {
+				hwdesc[i].next = obj->hwdescs_phys
+					+ (i + 1) * sizeof(*hwdesc);
+				hwdesc[i].addr = addr + (i / 2) * newstate->fb->pitches[0];
+				hwdesc[i].cmd = newstate->fb->pitches[0] / 4;
+			}
 
-		hwdesc->addr = addr;
-		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
-		hwdesc->next = next_addr;
+			/* We want the EOF IRQ only on the very last transfer */
+			hwdesc[newstate->crtc_h - 1].cmd |= JZ_LCD_CMD_EOF_IRQ;
+			hwdesc[newstate->crtc_h - 1].next = next_addr;
+			priv->dma_hwdescs->hwdesc[use_f1] = *hwdesc;
+		} else {
+			/* Use one DMA descriptor for the whole frame. */
+			hwdesc = &priv->dma_hwdescs->hwdesc[use_f1];
+			hwdesc->addr = addr;
+			hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
+			hwdesc->next = next_addr;
+		}
 
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 			fourcc = newstate->fb->format->format;
@@ -848,6 +902,13 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
 
 static void ingenic_drm_gem_fb_destroy(struct drm_framebuffer *fb)
 {
+	struct ingenic_drm *priv = drm_device_get_priv(fb->dev);
+	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
+	struct ingenic_gem_object *obj = to_ingenic_gem_obj(gem_obj);
+
+	dma_free_coherent(priv->dev,
+			  sizeof(*obj->hwdescs) * fb->height,
+			  obj->hwdescs, obj->hwdescs_phys);
 	drm_gem_fb_destroy(fb);
 }
 
@@ -868,6 +929,8 @@ ingenic_drm_gem_fb_create(struct drm_device *drm, struct drm_file *file,
 {
 	struct ingenic_drm *priv = drm_device_get_priv(drm);
 	const struct drm_framebuffer_funcs *fb_funcs;
+	struct drm_gem_object *gem_obj;
+	struct ingenic_gem_object *obj;
 	struct drm_framebuffer *fb;
 
 	if (priv->soc_info->map_noncoherent)
@@ -876,6 +939,24 @@ ingenic_drm_gem_fb_create(struct drm_device *drm, struct drm_file *file,
 		fb_funcs = &ingenic_drm_gem_fb_funcs;
 
 	fb = drm_gem_fb_create_with_funcs(drm, file, mode_cmd, fb_funcs);
+	if (IS_ERR(fb))
+		return fb;
+
+	gem_obj = drm_gem_fb_get_obj(fb, 0);
+	obj = to_ingenic_gem_obj(gem_obj);
+
+	/*
+	 * Create (fb->height * 2) DMA descriptors, in case we want to use the
+	 * doublescan feature.
+	 */
+	obj->hwdescs = dma_alloc_coherent(priv->dev,
+					  sizeof(*obj->hwdescs) * fb->height * 2,
+					  &obj->hwdescs_phys,
+					  GFP_KERNEL);
+	if (!obj->hwdescs) {
+		drm_gem_fb_destroy(fb);
+		return ERR_PTR(-ENOMEM);
+	}
 
 	return fb;
 }
-- 
2.30.2

