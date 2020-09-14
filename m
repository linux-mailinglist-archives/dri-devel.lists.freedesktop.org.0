Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7B268743
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 10:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41FD89F8B;
	Mon, 14 Sep 2020 08:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B27C6E408
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 08:35:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08E8YsGw073101;
 Mon, 14 Sep 2020 03:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600072494;
 bh=7TxC7i9RQm4QMehNtuGUx7qULqV6uO9W3S+bEveglmE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wv7XiGMPkPDezoov9O9jMlM1JtjBxGlavm57DQgInRj26X6ecyhG+aw0cqO3vuvKD
 +5jsQOlIHnM6qO9K3S2T/q1sUZOMuKHa6gKD1WuFWTzjayWcAJb0F6niiU+6zAkWaP
 KBmhi1sL+LKISknOsGgM7a+7tXt1mgNDrsNSsEmk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08E8YsCo080299
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Sep 2020 03:34:54 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Sep 2020 03:34:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Sep 2020 03:34:54 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08E8YpKx095196;
 Mon, 14 Sep 2020 03:34:53 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/tilcdc: Do not keep vblank interrupts enabled all the
 time
Date: Mon, 14 Sep 2020 11:34:49 +0300
Message-ID: <f22f53c569ee2722d909c4673b5c7cd43628bfd6.1600072407.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600072407.git.jsarha@ti.com>
References: <cover.1600072407.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

END_OF_FRAME interrupts have been enabled all the time since the
beginning of this driver. It is about time to add this feature.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 36 +++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 1856962411c7..29f263e1975a 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -147,12 +147,9 @@ static void tilcdc_crtc_enable_irqs(struct drm_device *dev)
 		tilcdc_set(dev, LCDC_RASTER_CTRL_REG,
 			LCDC_V1_SYNC_LOST_INT_ENA | LCDC_V1_FRAME_DONE_INT_ENA |
 			LCDC_V1_UNDERFLOW_INT_ENA);
-		tilcdc_set(dev, LCDC_DMA_CTRL_REG,
-			LCDC_V1_END_OF_FRAME_INT_ENA);
 	} else {
 		tilcdc_write(dev, LCDC_INT_ENABLE_SET_REG,
 			LCDC_V2_UNDERFLOW_INT_ENA |
-			LCDC_V2_END_OF_FRAME0_INT_ENA |
 			LCDC_FRAME_DONE | LCDC_SYNC_LOST);
 	}
 }
@@ -678,11 +675,44 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
 
 static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
+	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+	struct tilcdc_drm_private *priv = dev->dev_private;
+	unsigned long flags;
+
+	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
+
+	tilcdc_clear_irqstatus(dev, LCDC_END_OF_FRAME0);
+
+	if (priv->rev == 1)
+		tilcdc_set(dev, LCDC_DMA_CTRL_REG,
+			   LCDC_V1_END_OF_FRAME_INT_ENA);
+	else
+		tilcdc_set(dev, LCDC_INT_ENABLE_SET_REG,
+			   LCDC_V2_END_OF_FRAME0_INT_ENA);
+
+	spin_unlock_irqrestore(&tilcdc_crtc->irq_lock, flags);
+
 	return 0;
 }
 
 static void tilcdc_crtc_disable_vblank(struct drm_crtc *crtc)
 {
+	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+	struct tilcdc_drm_private *priv = dev->dev_private;
+	unsigned long flags;
+
+	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
+
+	if (priv->rev == 1)
+		tilcdc_clear(dev, LCDC_DMA_CTRL_REG,
+			     LCDC_V1_END_OF_FRAME_INT_ENA);
+	else
+		tilcdc_clear(dev, LCDC_INT_ENABLE_SET_REG,
+			     LCDC_V2_END_OF_FRAME0_INT_ENA);
+
+	spin_unlock_irqrestore(&tilcdc_crtc->irq_lock, flags);
 }
 
 static void tilcdc_crtc_reset(struct drm_crtc *crtc)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
