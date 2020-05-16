Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8B1D64BE
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 01:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D2F6E2B8;
	Sat, 16 May 2020 23:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658EA6E270
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 21:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589665875; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DZ3mFeVx2083BRizDxURnQKM6dH9xQ+CWBzj61Y2Hu0=;
 b=vbzCiBCHi2wej+JngAjvf72avQu2zmvEjGXRV4S8rZwzj3OiHwLirhPDrZIV79X7E1Etru
 sPbnhTEeclFFCBfsq/swJjUAlrYLxrvQXiU1IkUutFN0w+8tDl4FZPYpUOAfgRhIQe0A6y
 KFq2HVbrV0grSPM8QP0+bxJVklxVTTI=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH 07/12] gpu/drm: ingenic: Set DMA descriptor chain address in
 probe
Date: Sat, 16 May 2020 23:50:52 +0200
Message-Id: <20200516215057.392609-7-paul@crapouillou.net>
In-Reply-To: <20200516215057.392609-1-paul@crapouillou.net>
References: <20200516215057.392609-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 May 2020 23:30:50 +0000
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

The address of the DMA descriptor never changes. It can therefore be set
in the probe function.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 3207105755c9..e43318938e9e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -358,8 +358,6 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 		ingenic_drm_crtc_update_ctrl(priv, finfo);
 
 		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
-
-		regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc->next);
 	}
 
 	if (event) {
@@ -768,6 +766,9 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Set address of our DMA descriptor chain */
+	regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc_phys);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register DRM driver");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
