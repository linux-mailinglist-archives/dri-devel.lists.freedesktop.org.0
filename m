Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8052D5FF3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FB46EAA4;
	Thu, 10 Dec 2020 15:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757D06EA84
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:39:06 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knO24-00020b-LH; Thu, 10 Dec 2020 16:39:04 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 09/19] drm/imx: imx-tve: use local encoder and connector
 variables
Date: Thu, 10 Dec 2020 16:38:35 +0100
Message-Id: <20201210153845.12176-10-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210153845.12176-1-p.zabel@pengutronix.de>
References: <20201210153845.12176-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce local variables for encoder and connector.
This simplifies the following commits.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/imx/imx-tve.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 2a8d2e32e7b4..37771073a525 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -430,27 +430,28 @@ static int tve_clk_init(struct imx_tve *tve, void __iomem *base)
 
 static int imx_tve_register(struct drm_device *drm, struct imx_tve *tve)
 {
+	struct drm_encoder *encoder = &tve->encoder;
+	struct drm_connector *connector = &tve->connector;
 	int encoder_type;
 	int ret;
 
 	encoder_type = tve->mode == TVE_MODE_VGA ?
 				DRM_MODE_ENCODER_DAC : DRM_MODE_ENCODER_TVDAC;
 
-	ret = imx_drm_encoder_parse_of(drm, &tve->encoder, tve->dev->of_node);
+	ret = imx_drm_encoder_parse_of(drm, encoder, tve->dev->of_node);
 	if (ret)
 		return ret;
 
-	drm_encoder_helper_add(&tve->encoder, &imx_tve_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, &tve->encoder, encoder_type);
+	drm_encoder_helper_add(encoder, &imx_tve_encoder_helper_funcs);
+	drm_simple_encoder_init(drm, encoder, encoder_type);
 
-	drm_connector_helper_add(&tve->connector,
-			&imx_tve_connector_helper_funcs);
-	drm_connector_init_with_ddc(drm, &tve->connector,
+	drm_connector_helper_add(connector, &imx_tve_connector_helper_funcs);
+	drm_connector_init_with_ddc(drm, connector,
 				    &imx_tve_connector_funcs,
 				    DRM_MODE_CONNECTOR_VGA,
 				    tve->ddc);
 
-	drm_connector_attach_encoder(&tve->connector, &tve->encoder);
+	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
