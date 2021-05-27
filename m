Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D634C39391B
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ABC6F503;
	Thu, 27 May 2021 23:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659326F503
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:21:26 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 02/11] drm/ingenic: Simplify code by using hwdescs array
Date: Fri, 28 May 2021 00:20:56 +0100
Message-Id: <20210527232104.152577-3-paul@crapouillou.net>
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

Instead of having one 'hwdesc' variable for the plane #0 and one for the
plane #1, use a 'hwdesc[2]' array, where the DMA hardware descriptors
are indexed by the plane's number.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 38 ++++++++++++-----------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 93c099e7464d..4e41bdf2f3fd 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -50,8 +50,7 @@ struct ingenic_dma_hwdesc {
 } __aligned(16);
 
 struct ingenic_dma_hwdescs {
-	struct ingenic_dma_hwdesc hwdesc_f0;
-	struct ingenic_dma_hwdesc hwdesc_f1;
+	struct ingenic_dma_hwdesc hwdesc[2];
 	struct ingenic_dma_hwdesc hwdesc_pal;
 	u16 palette[256] __aligned(16);
 };
@@ -142,6 +141,13 @@ static inline struct ingenic_drm *drm_nb_get_priv(struct notifier_block *nb)
 	return container_of(nb, struct ingenic_drm, clock_nb);
 }
 
+static inline dma_addr_t dma_hwdesc_addr(const struct ingenic_drm *priv, bool use_f1)
+{
+	u32 offset = offsetof(struct ingenic_dma_hwdescs, hwdesc[use_f1]);
+
+	return priv->dma_hwdescs_phys + offset;
+}
+
 static int ingenic_drm_update_pixclk(struct notifier_block *nb,
 				     unsigned long action,
 				     void *data)
@@ -563,6 +569,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct ingenic_dma_hwdesc *hwdesc;
 	unsigned int width, height, cpp, offset;
 	dma_addr_t addr;
+	bool use_f1;
 	u32 fourcc;
 
 	if (newstate && newstate->fb) {
@@ -570,16 +577,14 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 			drm_fb_cma_sync_non_coherent(&priv->drm, oldstate, newstate);
 
 		crtc_state = newstate->crtc->state;
+		use_f1 = priv->soc_info->has_osd && plane != &priv->f0;
 
 		addr = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
 		width = newstate->src_w >> 16;
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
 
-		if (!priv->soc_info->has_osd || plane == &priv->f0)
-			hwdesc = &priv->dma_hwdescs->hwdesc_f0;
-		else
-			hwdesc = &priv->dma_hwdescs->hwdesc_f1;
+		hwdesc = &priv->dma_hwdescs->hwdesc[use_f1];
 
 		hwdesc->addr = addr;
 		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
@@ -592,9 +597,9 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 			if (fourcc == DRM_FORMAT_C8)
 				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_pal);
 			else
-				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
+				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc[0]);
 
-			priv->dma_hwdescs->hwdesc_f0.next = priv->dma_hwdescs_phys + offset;
+			priv->dma_hwdescs->hwdesc[0].next = priv->dma_hwdescs_phys + offset;
 
 			crtc_state->color_mgmt_changed = fourcc == DRM_FORMAT_C8;
 		}
@@ -968,20 +973,17 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 
 	/* Configure DMA hwdesc for foreground0 plane */
-	dma_hwdesc_phys_f0 = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
-	priv->dma_hwdescs->hwdesc_f0.next = dma_hwdesc_phys_f0;
-	priv->dma_hwdescs->hwdesc_f0.id = 0xf0;
+	dma_hwdesc_phys_f0 = dma_hwdesc_addr(priv, 0);
+	priv->dma_hwdescs->hwdesc[0].next = dma_hwdesc_phys_f0;
+	priv->dma_hwdescs->hwdesc[0].id = 0xf0;
 
 	/* Configure DMA hwdesc for foreground1 plane */
-	dma_hwdesc_phys_f1 = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f1);
-	priv->dma_hwdescs->hwdesc_f1.next = dma_hwdesc_phys_f1;
-	priv->dma_hwdescs->hwdesc_f1.id = 0xf1;
+	dma_hwdesc_phys_f1 = dma_hwdesc_addr(priv, 1);
+	priv->dma_hwdescs->hwdesc[1].next = dma_hwdesc_phys_f1;
+	priv->dma_hwdescs->hwdesc[1].id = 0xf1;
 
 	/* Configure DMA hwdesc for palette */
-	priv->dma_hwdescs->hwdesc_pal.next = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
+	priv->dma_hwdescs->hwdesc_pal.next = dma_hwdesc_phys_f0;
 	priv->dma_hwdescs->hwdesc_pal.id = 0xc0;
 	priv->dma_hwdescs->hwdesc_pal.addr = priv->dma_hwdescs_phys
 		+ offsetof(struct ingenic_dma_hwdescs, palette);
-- 
2.30.2

