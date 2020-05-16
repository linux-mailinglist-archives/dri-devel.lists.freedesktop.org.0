Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB721D64B8
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 01:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52606E29A;
	Sat, 16 May 2020 23:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D666E287
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 21:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589665877; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOY1oU2rRO4Q+4cHrFnKs0PPlA92WcTXpAekE+Jbo80=;
 b=ZCYderukPgL9cIcJTen933/c78ca5M2soLPog7UcZMZhaOYqkBhF2naAs7xBMX5o7VdA0L
 1LBnAq2spCCXrWw1HT5+qWYy9ZWx41FOF87NxLx9y0EaTfKKJQeOfsVLbHMaVOrNNryIBz
 s7jcGsRp3BTT93s/f2X0azNui7LBAyE=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH 09/12] gpu/drm: Ingenic: Add support for OSD mode
Date: Sat, 16 May 2020 23:50:54 +0200
Message-Id: <20200516215057.392609-9-paul@crapouillou.net>
In-Reply-To: <20200516215057.392609-1-paul@crapouillou.net>
References: <20200516215057.392609-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 May 2020 23:30:51 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All Ingenic SoCs starting from the JZ4725B support OSD mode.

In this mode, two separate planes can be used. They can have different
positions and sizes, and one can be overlayed on top of the other.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 275 +++++++++++++++++++++-----
 drivers/gpu/drm/ingenic/ingenic-drm.h |  35 ++++
 2 files changed, 258 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 92c63d1303f9..f139af5b7a40 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -43,12 +43,13 @@ struct ingenic_dma_hwdesc {
 
 struct jz_soc_info {
 	bool needs_dev_clk;
+	bool has_osd;
 	unsigned int max_width, max_height;
 };
 
 struct ingenic_drm {
 	struct drm_device drm;
-	struct drm_plane primary;
+	struct drm_plane f0, f1;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 
@@ -57,8 +58,8 @@ struct ingenic_drm {
 	struct clk *lcd_clk, *pix_clk;
 	const struct jz_soc_info *soc_info;
 
-	struct ingenic_dma_hwdesc *dma_hwdesc;
-	dma_addr_t dma_hwdesc_phys;
+	struct ingenic_dma_hwdesc *dma_hwdesc[2];
+	dma_addr_t dma_hwdesc_phys[2];
 
 	bool panel_is_sharp;
 };
@@ -90,7 +91,7 @@ static const struct regmap_config ingenic_drm_regmap_config = {
 	.val_bits = 32,
 	.reg_stride = 4,
 
-	.max_register = JZ_REG_LCD_CMD1,
+	.max_register = JZ_REG_LCD_SIZE1,
 	.writeable_reg = ingenic_drm_writeable_reg,
 };
 
@@ -110,11 +111,6 @@ drm_encoder_get_priv(struct drm_encoder *encoder)
 	return container_of(encoder, struct ingenic_drm, encoder);
 }
 
-static inline struct ingenic_drm *drm_plane_get_priv(struct drm_plane *plane)
-{
-	return container_of(plane, struct ingenic_drm, primary);
-}
-
 static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_crtc_state *state)
 {
@@ -185,34 +181,17 @@ static void ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
 		regmap_write(priv->map, JZ_REG_LCD_SPL, hpe << 16 | (hpe + 1));
 		regmap_write(priv->map, JZ_REG_LCD_REV, mode->htotal << 16);
 	}
-}
-
-static void ingenic_drm_crtc_update_ctrl(struct ingenic_drm *priv,
-					 const struct drm_format_info *finfo)
-{
-	unsigned int ctrl = JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16;
-
-	switch (finfo->format) {
-	case DRM_FORMAT_XRGB1555:
-		ctrl |= JZ_LCD_CTRL_RGB555;
-		/* fall-through */
-	case DRM_FORMAT_RGB565:
-		ctrl |= JZ_LCD_CTRL_BPP_15_16;
-		break;
-	case DRM_FORMAT_XRGB8888:
-		ctrl |= JZ_LCD_CTRL_BPP_18_24;
-		break;
-	}
 
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
-			   JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16 |
-			   JZ_LCD_CTRL_BPP_MASK, ctrl);
+			   JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16,
+			   JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16);
 }
 
 static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 					 struct drm_crtc_state *state)
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
+	struct drm_plane_state *f1_state, *f0_state;
 	long rate;
 
 	if (!drm_atomic_crtc_needs_modeset(state))
@@ -227,6 +206,17 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 	if (rate < 0)
 		return rate;
 
+	if (priv->soc_info->has_osd) {
+		f1_state = drm_atomic_get_plane_state(state->state,
+						      &priv->f1);
+		f0_state = drm_atomic_get_plane_state(state->state,
+						      &priv->f0);
+
+		/* If all the planes are disabled, we won't get a VBLANK IRQ */
+		if (!f1_state->fb && !f0_state->fb)
+			state->no_vblank = true;
+	}
+
 	return 0;
 }
 
@@ -236,14 +226,9 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
 	struct drm_crtc_state *state = crtc->state;
 	struct drm_pending_vblank_event *event = state->event;
-	struct drm_framebuffer *drm_fb = crtc->primary->state->fb;
-	const struct drm_format_info *finfo;
 
 	if (drm_atomic_crtc_needs_modeset(state)) {
-		finfo = drm_format_info(drm_fb->format->format);
-
 		ingenic_drm_crtc_update_timings(priv, &state->mode);
-		ingenic_drm_crtc_update_ctrl(priv, finfo);
 
 		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
 	}
@@ -260,12 +245,149 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	}
 }
 
+static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
+					  struct drm_plane_state *state)
+{
+	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc = state->crtc ?: plane->state->crtc;
+	int ret;
+
+	if (!crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_existing_crtc_state(state->state, crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  priv->soc_info->has_osd,
+						  true);
+	if (ret)
+		return ret;
+
+	if (!priv->soc_info->has_osd &&
+	    (state->src_x != 0 ||
+	     (state->src_w >> 16) != state->crtc_w ||
+	     (state->src_h >> 16) != state->crtc_h))
+		return -EINVAL;
+
+	/*
+	 * Require full modeset if if enabling or disabling a plane, or changing
+	 * its position, size or depth.
+	 */
+	if (priv->soc_info->has_osd &&
+	    (!plane->state->fb || !state->fb ||
+	     plane->state->crtc_x != state->crtc_x ||
+	     plane->state->crtc_y != state->crtc_y ||
+	     plane->state->crtc_w != state->crtc_w ||
+	     plane->state->crtc_h != state->crtc_h ||
+	     plane->state->fb->format->format != state->fb->format->format))
+		crtc_state->mode_changed = true;
+
+	return 0;
+}
+
+static void ingenic_drm_plane_enable(struct ingenic_drm *priv,
+				      struct drm_plane *plane)
+{
+	unsigned int en_bit;
+
+	if (priv->soc_info->has_osd) {
+		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+			en_bit = JZ_LCD_OSDC_F1EN;
+		else
+			en_bit = JZ_LCD_OSDC_F0EN;
+
+		regmap_update_bits(priv->map, JZ_REG_LCD_OSDC, en_bit, en_bit);
+	}
+}
+
+static void ingenic_drm_plane_atomic_disable(struct drm_plane *plane,
+					     struct drm_plane_state *old_state)
+{
+	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+	unsigned int en_bit;
+
+	if (priv->soc_info->has_osd) {
+		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+			en_bit = JZ_LCD_OSDC_F1EN;
+		else
+			en_bit = JZ_LCD_OSDC_F0EN;
+
+		regmap_update_bits(priv->map, JZ_REG_LCD_OSDC, en_bit, 0);
+	}
+}
+
+static void ingenic_drm_plane_config(struct ingenic_drm *priv,
+				     struct drm_plane *plane, u32 fourcc)
+{
+	struct drm_plane_state *state = plane->state;
+	unsigned int xy_reg, size_reg;
+	unsigned int ctrl = 0;
+
+	ingenic_drm_plane_enable(priv, plane);
+
+	if (priv->soc_info->has_osd &&
+	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
+		switch (fourcc) {
+		case DRM_FORMAT_XRGB1555:
+			ctrl |= JZ_LCD_OSDCTRL_RGB555;
+			fallthrough;
+		case DRM_FORMAT_RGB565:
+			ctrl |= JZ_LCD_OSDCTRL_BPP_15_16;
+			break;
+		case DRM_FORMAT_XRGB8888:
+			ctrl |= JZ_LCD_OSDCTRL_BPP_18_24;
+			break;
+		}
+
+		regmap_update_bits(priv->map, JZ_REG_LCD_OSDCTRL,
+				   JZ_LCD_OSDCTRL_BPP_MASK, ctrl);
+	} else {
+		switch (fourcc) {
+		case DRM_FORMAT_XRGB1555:
+			ctrl |= JZ_LCD_CTRL_RGB555;
+			fallthrough;
+		case DRM_FORMAT_RGB565:
+			ctrl |= JZ_LCD_CTRL_BPP_15_16;
+			break;
+		case DRM_FORMAT_XRGB8888:
+			ctrl |= JZ_LCD_CTRL_BPP_18_24;
+			break;
+		}
+
+		regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
+				   JZ_LCD_CTRL_BPP_MASK, ctrl);
+	}
+
+	if (priv->soc_info->has_osd) {
+		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
+			xy_reg = JZ_REG_LCD_XYP1;
+			size_reg = JZ_REG_LCD_SIZE1;
+		} else {
+			xy_reg = JZ_REG_LCD_XYP0;
+			size_reg = JZ_REG_LCD_SIZE0;
+		}
+
+		regmap_write(priv->map, xy_reg,
+			     state->crtc_x << JZ_LCD_XYP01_XPOS_LSB |
+			     state->crtc_y << JZ_LCD_XYP01_YPOS_LSB);
+		regmap_write(priv->map, size_reg,
+			     state->crtc_w << JZ_LCD_SIZE01_WIDTH_LSB |
+			     state->crtc_h << JZ_LCD_SIZE01_HEIGHT_LSB);
+	}
+}
+
 static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_plane_state *oldstate)
 {
-	struct ingenic_drm *priv = drm_plane_get_priv(plane);
+	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
 	struct drm_plane_state *state = plane->state;
 	unsigned int width, height, cpp;
+	unsigned int hwdesc_idx;
 	dma_addr_t addr;
 
 	if (state && state->fb) {
@@ -274,9 +396,18 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		height = state->src_h >> 16;
 		cpp = state->fb->format->cpp[0];
 
-		priv->dma_hwdesc->addr = addr;
-		priv->dma_hwdesc->cmd = width * height * cpp / 4;
-		priv->dma_hwdesc->cmd |= JZ_LCD_CMD_EOF_IRQ;
+		if (!priv->soc_info->has_osd)
+			hwdesc_idx = 0;
+		else
+			hwdesc_idx = plane->type == DRM_PLANE_TYPE_PRIMARY;
+
+		priv->dma_hwdesc[hwdesc_idx]->addr = addr;
+		priv->dma_hwdesc[hwdesc_idx]->cmd = width * height * cpp / 4;
+		priv->dma_hwdesc[hwdesc_idx]->cmd |= JZ_LCD_CMD_EOF_IRQ;
+
+		if (drm_atomic_crtc_needs_modeset(state->crtc->state))
+			ingenic_drm_plane_config(priv, plane,
+						 state->fb->format->format);
 	}
 }
 
@@ -448,6 +579,8 @@ static const struct drm_crtc_funcs ingenic_drm_crtc_funcs = {
 
 static const struct drm_plane_helper_funcs ingenic_drm_plane_helper_funcs = {
 	.atomic_update		= ingenic_drm_plane_atomic_update,
+	.atomic_check		= ingenic_drm_plane_atomic_check,
+	.atomic_disable		= ingenic_drm_plane_atomic_disable,
 	.prepare_fb		= drm_gem_fb_prepare_fb,
 };
 
@@ -474,8 +607,10 @@ static void ingenic_drm_free_dma_hwdesc(void *d)
 {
 	struct ingenic_drm *priv = d;
 
-	dma_free_coherent(priv->dev, sizeof(*priv->dma_hwdesc),
-			  priv->dma_hwdesc, priv->dma_hwdesc_phys);
+	dma_free_coherent(priv->dev, sizeof(*priv->dma_hwdesc[0]),
+			  priv->dma_hwdesc[0], priv->dma_hwdesc_phys[0]);
+	dma_free_coherent(priv->dev, sizeof(*priv->dma_hwdesc[1]),
+			  priv->dma_hwdesc[1], priv->dma_hwdesc_phys[1]);
 }
 
 static int ingenic_drm_probe(struct platform_device *pdev)
@@ -560,23 +695,34 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		bridge = devm_drm_panel_bridge_add_typed(dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
 
-	priv->dma_hwdesc = dma_alloc_coherent(dev, sizeof(*priv->dma_hwdesc),
-					      &priv->dma_hwdesc_phys,
-					      GFP_KERNEL);
-	if (!priv->dma_hwdesc)
+	priv->dma_hwdesc[0] = dma_alloc_coherent(dev,
+						 sizeof(*priv->dma_hwdesc[0]),
+						 &priv->dma_hwdesc_phys[0],
+						 GFP_KERNEL);
+	if (!priv->dma_hwdesc[0])
+		return -ENOMEM;
+
+	priv->dma_hwdesc[0]->next = priv->dma_hwdesc_phys[0];
+	priv->dma_hwdesc[0]->id = 0xdeafbead;
+
+	priv->dma_hwdesc[1] = dma_alloc_coherent(dev,
+						 sizeof(*priv->dma_hwdesc[1]),
+						 &priv->dma_hwdesc_phys[1],
+						 GFP_KERNEL);
+	if (!priv->dma_hwdesc[1])
 		return -ENOMEM;
 
+	priv->dma_hwdesc[1]->next = priv->dma_hwdesc_phys[1];
+	priv->dma_hwdesc[1]->id = 0xdeadbabe;
+
 	ret = devm_add_action_or_reset(dev, ingenic_drm_free_dma_hwdesc, priv);
 	if (ret)
 		return ret;
 
-	priv->dma_hwdesc->next = priv->dma_hwdesc_phys;
-	priv->dma_hwdesc->id = 0xdeafbead;
-
-	drm_plane_helper_add(&priv->primary, &ingenic_drm_plane_helper_funcs);
+	drm_plane_helper_add(&priv->f1, &ingenic_drm_plane_helper_funcs);
 
-	ret = drm_universal_plane_init(drm, &priv->primary,
-				       0, &ingenic_drm_primary_plane_funcs,
+	ret = drm_universal_plane_init(drm, &priv->f1, 1,
+				       &ingenic_drm_primary_plane_funcs,
 				       ingenic_drm_primary_formats,
 				       ARRAY_SIZE(ingenic_drm_primary_formats),
 				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
@@ -587,13 +733,30 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 
 	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
 
-	ret = drm_crtc_init_with_planes(drm, &priv->crtc, &priv->primary,
+	ret = drm_crtc_init_with_planes(drm, &priv->crtc, &priv->f1,
 					NULL, &ingenic_drm_crtc_funcs, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to init CRTC: %i", ret);
 		return ret;
 	}
 
+	if (soc_info->has_osd) {
+		drm_plane_helper_add(&priv->f0,
+				     &ingenic_drm_plane_helper_funcs);
+
+		ret = drm_universal_plane_init(drm, &priv->f0, 1,
+					       &ingenic_drm_primary_plane_funcs,
+					       ingenic_drm_primary_formats,
+					       ARRAY_SIZE(ingenic_drm_primary_formats),
+					       NULL, DRM_PLANE_TYPE_OVERLAY,
+					       NULL);
+		if (ret) {
+			dev_err(dev, "Failed to register overlay plane: %i\n",
+				ret);
+			return ret;
+		}
+	}
+
 	priv->encoder.possible_crtcs = 1;
 
 	drm_encoder_helper_add(&priv->encoder,
@@ -655,7 +818,12 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	}
 
 	/* Set address of our DMA descriptor chain */
-	regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc_phys);
+	regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc_phys[0]);
+	regmap_write(priv->map, JZ_REG_LCD_DA1, priv->dma_hwdesc_phys[1]);
+
+	/* Enable OSD if available */
+	if (soc_info->has_osd)
+		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
@@ -691,18 +859,21 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 
 static const struct jz_soc_info jz4740_soc_info = {
 	.needs_dev_clk = true,
+	.has_osd = false,
 	.max_width = 800,
 	.max_height = 600,
 };
 
 static const struct jz_soc_info jz4725b_soc_info = {
 	.needs_dev_clk = false,
+	.has_osd = true,
 	.max_width = 800,
 	.max_height = 600,
 };
 
 static const struct jz_soc_info jz4770_soc_info = {
 	.needs_dev_clk = false,
+	.has_osd = true,
 	.max_width = 1280,
 	.max_height = 720,
 };
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h b/drivers/gpu/drm/ingenic/ingenic-drm.h
index 4186708a67bc..b9d0bb0c9310 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.h
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
@@ -31,6 +31,18 @@
 #define JZ_REG_LCD_SA1				0x54
 #define JZ_REG_LCD_FID1				0x58
 #define JZ_REG_LCD_CMD1				0x5C
+#define JZ_REG_LCD_OSDC				0x100
+#define JZ_REG_LCD_OSDCTRL			0x104
+#define JZ_REG_LCD_OSDS				0x108
+#define JZ_REG_LCD_BGC				0x10c
+#define JZ_REG_LCD_KEY0				0x110
+#define JZ_REG_LCD_KEY1				0x114
+#define JZ_REG_LCD_ALPHA			0x118
+#define JZ_REG_LCD_IPUR				0x11c
+#define JZ_REG_LCD_XYP0				0x120
+#define JZ_REG_LCD_XYP1				0x124
+#define JZ_REG_LCD_SIZE0			0x128
+#define JZ_REG_LCD_SIZE1			0x12c
 
 #define JZ_LCD_CFG_SLCD				BIT(31)
 #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
@@ -124,4 +136,27 @@
 #define JZ_LCD_STATE_SOF_IRQ			BIT(4)
 #define JZ_LCD_STATE_DISABLED			BIT(0)
 
+#define JZ_LCD_OSDC_OSDEN			BIT(0)
+#define JZ_LCD_OSDC_F0EN			BIT(3)
+#define JZ_LCD_OSDC_F1EN			BIT(4)
+
+#define JZ_LCD_OSDCTRL_IPU			BIT(15)
+#define JZ_LCD_OSDCTRL_RGB555			BIT(4)
+#define JZ_LCD_OSDCTRL_CHANGE			BIT(3)
+#define JZ_LCD_OSDCTRL_BPP_15_16		0x4
+#define JZ_LCD_OSDCTRL_BPP_18_24		0x5
+#define JZ_LCD_OSDCTRL_BPP_30			0x7
+#define JZ_LCD_OSDCTRL_BPP_MASK			(JZ_LCD_OSDCTRL_RGB555 | 0x7)
+
+#define JZ_LCD_OSDS_READY			BIT(0)
+
+#define JZ_LCD_IPUR_IPUREN			BIT(31)
+#define JZ_LCD_IPUR_IPUR_LSB			0
+
+#define JZ_LCD_XYP01_XPOS_LSB			0
+#define JZ_LCD_XYP01_YPOS_LSB			16
+
+#define JZ_LCD_SIZE01_WIDTH_LSB			0
+#define JZ_LCD_SIZE01_HEIGHT_LSB		16
+
 #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
