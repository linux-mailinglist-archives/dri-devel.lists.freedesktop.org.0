Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C31528A0F1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 19:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4CF6F388;
	Sat, 10 Oct 2020 17:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE096E090
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 17:01:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09AH12Qr129423;
 Sat, 10 Oct 2020 12:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602349262;
 bh=JqhLKPovan6Z21UCULrhU15ObT7LtlMOvXEYuKEVwdw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=VRgJqslmjzUHADgUJ4CTsA5e1a76IcdzZvmOOX/DMQhj4ZXh4uPM66bwt4+jpqyNR
 RdCTOSm135LIuo5kVL5Rb/aF4V1rMxy8FBmbKQCHWyZS2rXgfBf2g4Zf9h+TAASp68
 9ucDLRbQ5CcNdfDn3Kv0iFYQaxFhnuNTZ2VOGY8Q=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09AH12ds053889
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 10 Oct 2020 12:01:02 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 10
 Oct 2020 12:01:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 10 Oct 2020 12:01:02 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09AH0xKK012138;
 Sat, 10 Oct 2020 12:01:01 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/2] drm/tilcdc: Do not keep vblank interrupts enabled all
 the time
Date: Sat, 10 Oct 2020 20:00:58 +0300
Message-ID: <fb87adebaffe8c7cb4fe7e909a45d47af08d7c6e.1602349100.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602349100.git.jsarha@ti.com>
References: <cover.1602349100.git.jsarha@ti.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 36 +++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index cf4ead0dc2e3..0fd3dafe6404 100644
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
