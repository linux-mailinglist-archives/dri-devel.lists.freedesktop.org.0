Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C13E3A9C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 15:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8DA89B98;
	Sun,  8 Aug 2021 13:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D8B89B98
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 13:46:35 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 7/8] drm/ingenic: Upload palette before frame
Date: Sun,  8 Aug 2021 15:45:25 +0200
Message-Id: <20210808134526.119198-8-paul@crapouillou.net>
In-Reply-To: <20210808134526.119198-1-paul@crapouillou.net>
References: <20210808134526.119198-1-paul@crapouillou.net>
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

When using C8 color mode, make sure that the palette is always uploaded
before a frame; otherwise the very first frame will have wrong colors.

Do that by changing the link order of the DMA descriptors.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 69 +++++++++++++++++++----
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 2eef174165a2..7ae48ead3ab6 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -65,6 +65,7 @@ struct jz_soc_info {
 
 struct ingenic_drm_private_state {
 	struct drm_private_state base;
+	bool use_palette;
 };
 
 struct ingenic_drm {
@@ -112,6 +113,30 @@ to_ingenic_drm_priv_state(struct drm_private_state *state)
 	return container_of(state, struct ingenic_drm_private_state, base);
 }
 
+static struct ingenic_drm_private_state *
+ingenic_drm_get_priv_state(struct ingenic_drm *priv, struct drm_atomic_state *state)
+{
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_private_obj_state(state, &priv->private_obj);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_ingenic_drm_priv_state(priv_state);
+}
+
+static struct ingenic_drm_private_state *
+ingenic_drm_get_new_priv_state(struct ingenic_drm *priv, struct drm_atomic_state *state)
+{
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_new_private_obj_state(state, &priv->private_obj);
+	if (!priv_state)
+		return NULL;
+
+	return to_ingenic_drm_priv_state(priv_state);
+}
+
 static bool ingenic_drm_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -159,6 +184,13 @@ static inline dma_addr_t dma_hwdesc_addr(const struct ingenic_drm *priv, bool us
 	return priv->dma_hwdescs_phys + offset;
 }
 
+static inline dma_addr_t dma_hwdesc_pal_addr(const struct ingenic_drm *priv)
+{
+	u32 offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_pal);
+
+	return priv->dma_hwdescs_phys + offset;
+}
+
 static int ingenic_drm_update_pixclk(struct notifier_block *nb,
 				     unsigned long action,
 				     void *data)
@@ -181,11 +213,19 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
+	struct ingenic_drm_private_state *priv_state;
+
+	priv_state = ingenic_drm_get_new_priv_state(priv, state);
+	if (WARN_ON(!priv_state))
+		return;
 
 	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
 
 	/* Set address of our DMA descriptor chain */
-	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
+	if (priv_state->use_palette)
+		regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_pal_addr(priv));
+	else
+		regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
 	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
 
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
@@ -391,6 +431,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+	struct ingenic_drm_private_state *priv_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
 	int ret;
@@ -403,6 +444,10 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	priv_state = ingenic_drm_get_priv_state(priv, state);
+	if (IS_ERR(priv_state))
+		return PTR_ERR(priv_state);
+
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
@@ -421,6 +466,9 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	     (new_plane_state->src_h >> 16) != new_plane_state->crtc_h))
 		return -EINVAL;
 
+	priv_state->use_palette = new_plane_state->fb &&
+		new_plane_state->fb->format->format == DRM_FORMAT_C8;
+
 	/*
 	 * Require full modeset if enabling or disabling a plane, or changing
 	 * its position, size or depth.
@@ -580,10 +628,11 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
 	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
+	struct ingenic_drm_private_state *priv_state;
 	struct drm_crtc_state *crtc_state;
 	struct ingenic_dma_hwdesc *hwdesc;
-	unsigned int width, height, cpp, offset;
-	dma_addr_t addr;
+	unsigned int width, height, cpp;
+	dma_addr_t addr, next_addr;
 	bool use_f1;
 	u32 fourcc;
 
@@ -599,23 +648,23 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
 
+		priv_state = ingenic_drm_get_new_priv_state(priv, state);
+		if (priv_state && priv_state->use_palette)
+			next_addr = dma_hwdesc_pal_addr(priv);
+		else
+			next_addr = dma_hwdesc_addr(priv, use_f1);
+
 		hwdesc = &priv->dma_hwdescs->hwdesc[use_f1];
 
 		hwdesc->addr = addr;
 		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
+		hwdesc->next = next_addr;
 
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 			fourcc = newstate->fb->format->format;
 
 			ingenic_drm_plane_config(priv->dev, plane, fourcc);
 
-			if (fourcc == DRM_FORMAT_C8)
-				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_pal);
-			else
-				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc[0]);
-
-			priv->dma_hwdescs->hwdesc[0].next = priv->dma_hwdescs_phys + offset;
-
 			crtc_state->color_mgmt_changed = fourcc == DRM_FORMAT_C8;
 		}
 
-- 
2.30.2

