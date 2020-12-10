Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DDC2D5FEE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED64C6EA8F;
	Thu, 10 Dec 2020 15:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13D36EA8F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:39:06 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knO24-00020b-Pj; Thu, 10 Dec 2020 16:39:04 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 14/19] drm/imx: dw_hdmi-imx: use drm managed resources
Date: Thu, 10 Dec 2020 16:38:40 +0100
Message-Id: <20201210153845.12176-15-p.zabel@pengutronix.de>
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

Use drmm_simple_encoder_alloc() to align encoder memory lifetime with
the drm device. drm_encoder_cleanup() is called automatically.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/imx/dw_hdmi-imx.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index bbd0a0cd7c3d..87428fb23d9f 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -18,14 +18,21 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "imx-drm.h"
 
+struct imx_hdmi;
+
+struct imx_hdmi_encoder {
+	struct drm_encoder encoder;
+	struct imx_hdmi *hdmi;
+};
+
 struct imx_hdmi {
 	struct device *dev;
-	struct drm_encoder encoder;
 	struct drm_bridge *bridge;
 	struct dw_hdmi *hdmi;
 	struct regmap *regmap;
@@ -33,7 +40,7 @@ struct imx_hdmi {
 
 static inline struct imx_hdmi *enc_to_imx_hdmi(struct drm_encoder *e)
 {
-	return container_of(e, struct imx_hdmi, encoder);
+	return container_of(e, struct imx_hdmi_encoder, encoder)->hdmi;
 }
 
 static const struct dw_hdmi_mpll_config imx_mpll_cfg[] = {
@@ -185,23 +192,25 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 			    void *data)
 {
 	struct drm_device *drm = data;
+	struct imx_hdmi_encoder *hdmi_encoder;
 	struct drm_encoder *encoder;
-	struct imx_hdmi *hdmi;
 	int ret;
 
-	hdmi = dev_get_drvdata(dev);
-	memset(&hdmi->encoder, 0, sizeof(hdmi->encoder));
+	hdmi_encoder = drmm_simple_encoder_alloc(drm, struct imx_hdmi_encoder,
+						 encoder, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(hdmi_encoder))
+		return PTR_ERR(hdmi_encoder);
 
-	encoder = &hdmi->encoder;
+	hdmi_encoder->hdmi = dev_get_drvdata(dev);
+	encoder = &hdmi_encoder->encoder;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, dev->of_node);
 	if (ret)
 		return ret;
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_imx_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 
-	return drm_bridge_attach(encoder, hdmi->bridge, NULL, 0);
+	return drm_bridge_attach(encoder, hdmi_encoder->hdmi->bridge, NULL, 0);
 }
 
 static const struct component_ops dw_hdmi_imx_ops = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
