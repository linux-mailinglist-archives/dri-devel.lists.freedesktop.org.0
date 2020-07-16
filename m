Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431872235CF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F676ED42;
	Fri, 17 Jul 2020 07:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7834B6E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594917537; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I67TKVIY1e4ZkLqZjG9x1H1pYXC+YO1iY3ebFaSwTp8=;
 b=OekZQwf9XjY/0YNju7G0LwsIBszB8lEwnEDd7epaaC1MT8HNLrHPjUPoqJn633L3WVyGPi
 sz8kfqySUQ2I5vUSw9jm532nLstiMSRav9BkoeimMlyhV652Vg+N9q+M4Q4cHb0i9YrWpK
 Z7kOlA+hhAZzYgTlgO+iZnzHFD6G2a4=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 05/12] drm/ingenic: Add missing CR in debug strings
Date: Thu, 16 Jul 2020 18:38:39 +0200
Message-Id: <20200716163846.174790-5-paul@crapouillou.net>
In-Reply-To: <20200716163846.174790-1-paul@crapouillou.net>
References: <20200716163846.174790-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If you pass a string that is not terminated with a carriage return to
dev_err(), it will eventually be printed with a carriage return, but
not right away, since the kernel will wait for a pr_cont().

v2: New patch
v3: No change

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 30 +++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 606d8acb0954..9e845234c7b5 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -623,14 +623,14 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
-		dev_err(dev, "Failed to get memory resource");
+		dev_err(dev, "Failed to get memory resource\n");
 		return PTR_ERR(base);
 	}
 
 	priv->map = devm_regmap_init_mmio(dev, base,
 					  &ingenic_drm_regmap_config);
 	if (IS_ERR(priv->map)) {
-		dev_err(dev, "Failed to create regmap");
+		dev_err(dev, "Failed to create regmap\n");
 		return PTR_ERR(priv->map);
 	}
 
@@ -641,21 +641,21 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	if (soc_info->needs_dev_clk) {
 		priv->lcd_clk = devm_clk_get(dev, "lcd");
 		if (IS_ERR(priv->lcd_clk)) {
-			dev_err(dev, "Failed to get lcd clock");
+			dev_err(dev, "Failed to get lcd clock\n");
 			return PTR_ERR(priv->lcd_clk);
 		}
 	}
 
 	priv->pix_clk = devm_clk_get(dev, "lcd_pclk");
 	if (IS_ERR(priv->pix_clk)) {
-		dev_err(dev, "Failed to get pixel clock");
+		dev_err(dev, "Failed to get pixel clock\n");
 		return PTR_ERR(priv->pix_clk);
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get panel handle");
+			dev_err(dev, "Failed to get panel handle\n");
 		return ret;
 	}
 
@@ -684,7 +684,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 				       ARRAY_SIZE(ingenic_drm_primary_formats),
 				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret) {
-		dev_err(dev, "Failed to register primary plane: %i", ret);
+		dev_err(dev, "Failed to register primary plane: %i\n", ret);
 		return ret;
 	}
 
@@ -693,7 +693,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	ret = drm_crtc_init_with_planes(drm, &priv->crtc, &priv->primary,
 					NULL, &ingenic_drm_crtc_funcs, NULL);
 	if (ret) {
-		dev_err(dev, "Failed to init CRTC: %i", ret);
+		dev_err(dev, "Failed to init CRTC: %i\n", ret);
 		return ret;
 	}
 
@@ -705,25 +705,25 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	ret = drm_simple_encoder_init(drm, &priv->encoder,
 				      DRM_MODE_ENCODER_DPI);
 	if (ret) {
-		dev_err(dev, "Failed to init encoder: %i", ret);
+		dev_err(dev, "Failed to init encoder: %i\n", ret);
 		return ret;
 	}
 
 	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
 	if (ret) {
-		dev_err(dev, "Unable to attach bridge");
+		dev_err(dev, "Unable to attach bridge\n");
 		return ret;
 	}
 
 	ret = drm_irq_install(drm, irq);
 	if (ret) {
-		dev_err(dev, "Unable to install IRQ handler");
+		dev_err(dev, "Unable to install IRQ handler\n");
 		return ret;
 	}
 
 	ret = drm_vblank_init(drm, 1);
 	if (ret) {
-		dev_err(dev, "Failed calling drm_vblank_init()");
+		dev_err(dev, "Failed calling drm_vblank_init()\n");
 		return ret;
 	}
 
@@ -731,7 +731,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(priv->pix_clk);
 	if (ret) {
-		dev_err(dev, "Unable to start pixel clock");
+		dev_err(dev, "Unable to start pixel clock\n");
 		return ret;
 	}
 
@@ -746,20 +746,20 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		 */
 		ret = clk_set_rate(priv->lcd_clk, parent_rate);
 		if (ret) {
-			dev_err(dev, "Unable to set LCD clock rate");
+			dev_err(dev, "Unable to set LCD clock rate\n");
 			goto err_pixclk_disable;
 		}
 
 		ret = clk_prepare_enable(priv->lcd_clk);
 		if (ret) {
-			dev_err(dev, "Unable to start lcd clock");
+			dev_err(dev, "Unable to start lcd clock\n");
 			goto err_pixclk_disable;
 		}
 	}
 
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
-		dev_err(dev, "Failed to register DRM driver");
+		dev_err(dev, "Failed to register DRM driver\n");
 		goto err_devclk_disable;
 	}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
