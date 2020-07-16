Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA23223596
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DBA6ECE8;
	Fri, 17 Jul 2020 07:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DE96EC8A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594917538; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9ifTY1m3M2BZvpvyxKFluHrLjILBFcZljDwob1WLiY=;
 b=voLL/W4t1hP3L7Qfd7lzjvVLiMO3HYF7LECYrIWIS69OKHkEur22pt/Xqut6Vhr/Zb0J6U
 4/yEL8p/MseMMNU9MUc0a5fVHxeSKlUvayOr7rHDsasCuFtvdbE0FZkuQhNidYx8VxEJbG
 k4Lh4TkCVaEBHRc0GdO8v1kHZYYD9Sc=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 06/12] drm/ingenic: Set DMA descriptor chain address in
 probe
Date: Thu, 16 Jul 2020 18:38:40 +0200
Message-Id: <20200716163846.174790-6-paul@crapouillou.net>
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

The address of the DMA descriptor never changes. It can therefore be set
in the probe function.

v2-v3: No change

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 9e845234c7b5..c769a54f0274 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -358,8 +358,6 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 		ingenic_drm_crtc_update_ctrl(priv, finfo);
 
 		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
-
-		regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc->next);
 	}
 
 	if (event) {
@@ -757,6 +755,9 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Set address of our DMA descriptor chain */
+	regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc_phys);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register DRM driver\n");
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
