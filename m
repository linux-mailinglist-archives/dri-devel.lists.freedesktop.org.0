Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4610138660
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE616E506;
	Sun, 12 Jan 2020 12:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (unknown [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CDD6E175
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 01:07:40 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id D273FDFDFA;
 Sat, 11 Jan 2020 01:07:46 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id aNZD6b0bpy-r; Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 7972FDFDFC;
 Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4Q2aoFcT2k_i; Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 17BC5DFDFA;
 Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 1/3] drm/armada: add bus-width property to the output
 endpoint
Date: Sat, 11 Jan 2020 02:07:32 +0100
Message-Id: <20200111010734.286836-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111010734.286836-1-lkundrak@v3.sk>
References: <20200111010734.286836-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: David Airlie <airlied@linux.ie>, Lubomir Rintel <lkundrak@v3.sk>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it possible to choose a different pixel format for the
endpoint. Modelled after what other LCD controllers use, including
marvell,pxa2xx-lcdc and atmel,hlcdc-display-controller and perhaps more.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/gpu/drm/armada/armada_crtc.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index c2b92acd1e9ad..da9ba8be8b097 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -904,6 +904,8 @@ static int armada_drm_crtc_create(struct drm_device *drm, struct device *dev,
 	struct armada_private *priv = drm->dev_private;
 	struct armada_crtc *dcrtc;
 	struct drm_plane *primary;
+	struct device_node *endpoint;
+	u32 bus_width = 24;
 	void __iomem *base;
 	int ret;
 
@@ -923,8 +925,31 @@ static int armada_drm_crtc_create(struct drm_device *drm, struct device *dev,
 	dcrtc->variant = variant;
 	dcrtc->base = base;
 	dcrtc->num = drm->mode_config.num_crtc;
-	dcrtc->cfg_dumb_ctrl = DUMB24_RGB888_0;
+	dcrtc->clk = ERR_PTR(-EINVAL);
 	dcrtc->spu_iopad_ctrl = CFG_VSCALE_LN_EN | CFG_IOPAD_DUMB24;
+
+	endpoint = of_get_next_child(port, NULL);
+	of_property_read_u32(endpoint, "bus-width", &bus_width);
+	of_node_put(endpoint);
+
+	switch (bus_width) {
+	case 12:
+		dcrtc->cfg_dumb_ctrl = DUMB12_RGB444_0;
+		break;
+	case 16:
+		dcrtc->cfg_dumb_ctrl = DUMB16_RGB565_0;
+		break;
+	case 18:
+		dcrtc->cfg_dumb_ctrl = DUMB18_RGB666_0;
+		break;
+	case 24:
+		dcrtc->cfg_dumb_ctrl = DUMB24_RGB888_0;
+		break;
+	default:
+		DRM_ERROR("unsupported bus width: %d\n", bus_width);
+		return -EINVAL;
+	}
+
 	spin_lock_init(&dcrtc->irq_lock);
 	dcrtc->irq_ena = CLEAN_SPU_IRQ_ISR;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
