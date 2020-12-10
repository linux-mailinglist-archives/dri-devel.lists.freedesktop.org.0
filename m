Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F72D5FF4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA52F6EAAA;
	Thu, 10 Dec 2020 15:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DE16EA88
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:39:06 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knO24-00020b-RH; Thu, 10 Dec 2020 16:39:04 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 16/19] drm/imx: imx-tve: use drm managed resources
Date: Thu, 10 Dec 2020 16:38:42 +0100
Message-Id: <20201210153845.12176-17-p.zabel@pengutronix.de>
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
the drm device. drm_encoder_cleanup() is called automatically before
the memory is freed.
Also fold imx_tve_register() into imx_tve_bind().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/imx/imx-tve.c | 74 ++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 3ef71f688f79..bc8c3f802a15 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -19,6 +19,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -99,9 +100,13 @@ enum {
 	TVE_MODE_VGA,
 };
 
-struct imx_tve {
+struct imx_tve_encoder {
 	struct drm_connector connector;
 	struct drm_encoder encoder;
+	struct imx_tve *tve;
+};
+
+struct imx_tve {
 	struct device *dev;
 	int mode;
 	int di_hsync_pin;
@@ -118,12 +123,12 @@ struct imx_tve {
 
 static inline struct imx_tve *con_to_tve(struct drm_connector *c)
 {
-	return container_of(c, struct imx_tve, connector);
+	return container_of(c, struct imx_tve_encoder, connector)->tve;
 }
 
 static inline struct imx_tve *enc_to_tve(struct drm_encoder *e)
 {
-	return container_of(e, struct imx_tve, encoder);
+	return container_of(e, struct imx_tve_encoder, encoder)->tve;
 }
 
 static void tve_enable(struct imx_tve *tve)
@@ -428,37 +433,6 @@ static int tve_clk_init(struct imx_tve *tve, void __iomem *base)
 	return 0;
 }
 
-static int imx_tve_register(struct drm_device *drm, struct imx_tve *tve)
-{
-	struct drm_encoder *encoder = &tve->encoder;
-	struct drm_connector *connector = &tve->connector;
-	int encoder_type;
-	int ret;
-
-	encoder_type = tve->mode == TVE_MODE_VGA ?
-				DRM_MODE_ENCODER_DAC : DRM_MODE_ENCODER_TVDAC;
-
-	memset(connector, 0, sizeof(*connector));
-	memset(encoder, 0, sizeof(*encoder));
-
-	ret = imx_drm_encoder_parse_of(drm, encoder, tve->dev->of_node);
-	if (ret)
-		return ret;
-
-	drm_encoder_helper_add(encoder, &imx_tve_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, encoder_type);
-
-	drm_connector_helper_add(connector, &imx_tve_connector_helper_funcs);
-	drm_connector_init_with_ddc(drm, connector,
-				    &imx_tve_connector_funcs,
-				    DRM_MODE_CONNECTOR_VGA,
-				    tve->ddc);
-
-	drm_connector_attach_encoder(connector, encoder);
-
-	return 0;
-}
-
 static void imx_tve_disable_regulator(void *data)
 {
 	struct imx_tve *tve = data;
@@ -508,8 +482,38 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
 	struct imx_tve *tve = dev_get_drvdata(dev);
+	struct imx_tve_encoder *tvee;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+	int encoder_type;
+	int ret;
+
+	encoder_type = tve->mode == TVE_MODE_VGA ?
+		       DRM_MODE_ENCODER_DAC : DRM_MODE_ENCODER_TVDAC;
+
+	tvee = drmm_simple_encoder_alloc(drm, struct imx_tve_encoder, encoder,
+					 encoder_type);
+	if (IS_ERR(tvee))
+		return PTR_ERR(tvee);
+
+	tvee->tve = tve;
+	encoder = &tvee->encoder;
+	connector = &tvee->connector;
+
+	ret = imx_drm_encoder_parse_of(drm, encoder, tve->dev->of_node);
+	if (ret)
+		return ret;
+
+	drm_encoder_helper_add(encoder, &imx_tve_encoder_helper_funcs);
+
+	drm_connector_helper_add(connector, &imx_tve_connector_helper_funcs);
+	ret = drm_connector_init_with_ddc(drm, connector,
+					  &imx_tve_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA, tve->ddc);
+	if (ret)
+		return ret;
 
-	return imx_tve_register(drm, tve);
+	return drm_connector_attach_encoder(connector, encoder);
 }
 
 static const struct component_ops imx_tve_ops = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
