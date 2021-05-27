Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7C393923
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DE16F508;
	Thu, 27 May 2021 23:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD346F508
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:21:39 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 04/11] drm/ingenic: Move no_vblank to private state
Date: Fri, 28 May 2021 00:20:58 +0100
Message-Id: <20210527232104.152577-5-paul@crapouillou.net>
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

This information is carried from the ".atomic_check" to the
".atomic_commit_tail"; as such it is state-specific, and should be moved
to the private state structure.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 41 ++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index e81084eb3b0e..639994329c60 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -66,6 +66,8 @@ struct jz_soc_info {
 
 struct ingenic_drm_private_state {
 	struct drm_private_state base;
+
+	bool no_vblank;
 };
 
 struct ingenic_drm {
@@ -87,7 +89,6 @@ struct ingenic_drm {
 	dma_addr_t dma_hwdescs_phys;
 
 	bool panel_is_sharp;
-	bool no_vblank;
 
 	/*
 	 * clk_mutex is used to synchronize the pixel clock rate update with
@@ -113,6 +114,30 @@ to_ingenic_drm_priv_state(struct drm_private_state *state)
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
@@ -268,6 +293,7 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
 	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
+	struct ingenic_drm_private_state *priv_state;
 
 	if (crtc_state->gamma_lut &&
 	    drm_color_lut_size(crtc_state->gamma_lut) != ARRAY_SIZE(priv->dma_hwdescs->palette)) {
@@ -299,9 +325,13 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 			}
 		}
 
+		priv_state = ingenic_drm_get_priv_state(priv, state);
+		if (IS_ERR(priv_state))
+			return PTR_ERR(priv_state);
+
 		/* If all the planes are disabled, we won't get a VBLANK IRQ */
-		priv->no_vblank = !f1_state->fb && !f0_state->fb &&
-				  !(ipu_state && ipu_state->fb);
+		priv_state->no_vblank = !f1_state->fb && !f0_state->fb &&
+					!(ipu_state && ipu_state->fb);
 	}
 
 	return 0;
@@ -727,6 +757,7 @@ static void ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
 	 */
 	struct drm_device *dev = old_state->dev;
 	struct ingenic_drm *priv = drm_device_get_priv(dev);
+	struct ingenic_drm_private_state *priv_state;
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
@@ -736,7 +767,9 @@ static void ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
 
 	drm_atomic_helper_commit_hw_done(old_state);
 
-	if (!priv->no_vblank)
+	priv_state = ingenic_drm_get_new_priv_state(priv, old_state);
+
+	if (!priv_state || !priv_state->no_vblank)
 		drm_atomic_helper_wait_for_vblanks(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
-- 
2.30.2

