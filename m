Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8450415220
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 22:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAF96EC75;
	Wed, 22 Sep 2021 20:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF456EC75
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 20:56:09 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: linux-mips@vger.kernel.org, list@opendingux.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 1/6] drm/ingenic: Simplify code by using hwdescs array
Date: Wed, 22 Sep 2021 21:55:50 +0100
Message-Id: <20210922205555.496871-2-paul@crapouillou.net>
In-Reply-To: <20210922205555.496871-1-paul@crapouillou.net>
References: <20210922205555.496871-1-paul@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of having one 'hwdesc' variable for the plane #0, one for the
plane #1 and one for the palette, use a 'hwdesc[3]' array, where the
DMA hardware descriptors are indexed by the plane's number.

v2: dma_hwdesc_addr() extended to support palette hwdesc. The palette
    hwdesc is now hwdesc[3] to simplify things. Add
    ingenic_drm_configure_hwdesc*() functions to factorize code.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 78 ++++++++++++++---------
 1 file changed, 48 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a5df1c8d34cd..95c12c2aba14 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -41,6 +41,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
+#define HWDESC_PALETTE 2
+
 struct ingenic_dma_hwdesc {
 	u32 next;
 	u32 addr;
@@ -49,9 +51,7 @@ struct ingenic_dma_hwdesc {
 } __aligned(16);
 
 struct ingenic_dma_hwdescs {
-	struct ingenic_dma_hwdesc hwdesc_f0;
-	struct ingenic_dma_hwdesc hwdesc_f1;
-	struct ingenic_dma_hwdesc hwdesc_pal;
+	struct ingenic_dma_hwdesc hwdesc[3];
 	u16 palette[256] __aligned(16);
 };
 
@@ -141,6 +141,14 @@ static inline struct ingenic_drm *drm_nb_get_priv(struct notifier_block *nb)
 	return container_of(nb, struct ingenic_drm, clock_nb);
 }
 
+static inline dma_addr_t dma_hwdesc_addr(const struct ingenic_drm *priv,
+					 unsigned int idx)
+{
+	u32 offset = offsetof(struct ingenic_dma_hwdescs, hwdesc[idx]);
+
+	return priv->dma_hwdescs_phys + offset;
+}
+
 static int ingenic_drm_update_pixclk(struct notifier_block *nb,
 				     unsigned long action,
 				     void *data)
@@ -558,9 +566,9 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
 	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
+	unsigned int width, height, cpp, next_id, plane_id;
 	struct drm_crtc_state *crtc_state;
 	struct ingenic_dma_hwdesc *hwdesc;
-	unsigned int width, height, cpp, offset;
 	dma_addr_t addr;
 	u32 fourcc;
 
@@ -569,16 +577,14 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 			drm_fb_cma_sync_non_coherent(&priv->drm, oldstate, newstate);
 
 		crtc_state = newstate->crtc->state;
+		plane_id = !!(priv->soc_info->has_osd && plane != &priv->f0);
 
 		addr = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
 		width = newstate->src_w >> 16;
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
 
-		if (!priv->soc_info->has_osd || plane == &priv->f0)
-			hwdesc = &priv->dma_hwdescs->hwdesc_f0;
-		else
-			hwdesc = &priv->dma_hwdescs->hwdesc_f1;
+		hwdesc = &priv->dma_hwdescs->hwdesc[plane_id];
 
 		hwdesc->addr = addr;
 		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
@@ -588,12 +594,8 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 
 			ingenic_drm_plane_config(priv->dev, plane, fourcc);
 
-			if (fourcc == DRM_FORMAT_C8)
-				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_pal);
-			else
-				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
-
-			priv->dma_hwdescs->hwdesc_f0.next = priv->dma_hwdescs_phys + offset;
+			next_id = fourcc == DRM_FORMAT_C8 ? HWDESC_PALETTE : 0;
+			priv->dma_hwdescs->hwdesc[0].next = dma_hwdesc_addr(priv, next_id);
 
 			crtc_state->color_mgmt_changed = fourcc == DRM_FORMAT_C8;
 		}
@@ -846,6 +848,35 @@ static void __maybe_unused ingenic_drm_release_rmem(void *d)
 	of_reserved_mem_device_release(d);
 }
 
+static void ingenic_drm_configure_hwdesc(struct ingenic_drm *priv,
+					 unsigned int hwdesc,
+					 unsigned int next_hwdesc, u32 id)
+{
+	struct ingenic_dma_hwdesc *desc = &priv->dma_hwdescs->hwdesc[hwdesc];
+
+	desc->next = dma_hwdesc_addr(priv, next_hwdesc);
+	desc->id = id;
+}
+
+static void ingenic_drm_configure_hwdesc_palette(struct ingenic_drm *priv)
+{
+	struct ingenic_dma_hwdesc *desc;
+
+	ingenic_drm_configure_hwdesc(priv, HWDESC_PALETTE, 0, 0xc0);
+
+	desc = &priv->dma_hwdescs->hwdesc[HWDESC_PALETTE];
+	desc->addr = priv->dma_hwdescs_phys
+		+ offsetof(struct ingenic_dma_hwdescs, palette);
+	desc->cmd = JZ_LCD_CMD_ENABLE_PAL
+		| (sizeof(priv->dma_hwdescs->palette) / 4);
+}
+
+static void ingenic_drm_configure_hwdesc_plane(struct ingenic_drm *priv,
+					       unsigned int plane)
+{
+	ingenic_drm_configure_hwdesc(priv, plane, plane, 0xf0 | plane);
+}
+
 static int ingenic_drm_bind(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -942,27 +973,14 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	if (!priv->dma_hwdescs)
 		return -ENOMEM;
 
-
 	/* Configure DMA hwdesc for foreground0 plane */
-	dma_hwdesc_phys_f0 = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
-	priv->dma_hwdescs->hwdesc_f0.next = dma_hwdesc_phys_f0;
-	priv->dma_hwdescs->hwdesc_f0.id = 0xf0;
+	ingenic_drm_configure_hwdesc_plane(priv, 0);
 
 	/* Configure DMA hwdesc for foreground1 plane */
-	dma_hwdesc_phys_f1 = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f1);
-	priv->dma_hwdescs->hwdesc_f1.next = dma_hwdesc_phys_f1;
-	priv->dma_hwdescs->hwdesc_f1.id = 0xf1;
+	ingenic_drm_configure_hwdesc_plane(priv, 1);
 
 	/* Configure DMA hwdesc for palette */
-	priv->dma_hwdescs->hwdesc_pal.next = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
-	priv->dma_hwdescs->hwdesc_pal.id = 0xc0;
-	priv->dma_hwdescs->hwdesc_pal.addr = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, palette);
-	priv->dma_hwdescs->hwdesc_pal.cmd = JZ_LCD_CMD_ENABLE_PAL
-		| (sizeof(priv->dma_hwdescs->palette) / 4);
+	ingenic_drm_configure_hwdesc_palette(priv);
 
 	primary = priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
 
-- 
2.33.0

