Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D86266063
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054496EA34;
	Fri, 11 Sep 2020 13:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7056EA41
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:13 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGg-0005Is-Rz; Fri, 11 Sep 2020 15:39:10 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/21] drm/imx: imx-tve: use drm managed resources
Date: Fri, 11 Sep 2020 15:38:46 +0200
Message-Id: <20200911133855.29801-12-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911133855.29801-1-p.zabel@pengutronix.de>
References: <20200911133855.29801-1-p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drmm_kzalloc() to align encoder memory lifetime with the drm device,
and use drmm_add_action_or_reset() to make sure drm_encoder_cleanup() is
called before the memory is freed.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
Changes since v1:
 - Split some changes out into previous patches.
---
 drivers/gpu/drm/imx/imx-tve.c | 54 +++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index aa1c2ab34170..bac025eafa1f 100644
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
@@ -428,6 +433,13 @@ static int tve_clk_init(struct imx_tve *tve, void __iomem *base)
 	return 0;
 }
 
+static void imx_tve_encoder_cleanup(struct drm_device *drm, void *ptr)
+{
+	struct drm_encoder *encoder = ptr;
+
+	drm_encoder_cleanup(encoder);
+}
+
 static void imx_tve_disable_regulator(void *data)
 {
 	struct imx_tve *tve = data;
@@ -477,33 +489,45 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
 	struct imx_tve *tve = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &tve->encoder;
-	struct drm_connector *connector = &tve->connector;
+	struct imx_tve_encoder *tvee;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
 	int encoder_type;
 	int ret;
 
 	encoder_type = tve->mode == TVE_MODE_VGA ?
 		       DRM_MODE_ENCODER_DAC : DRM_MODE_ENCODER_TVDAC;
 
-	memset(connector, 0, sizeof(*connector));
-	memset(encoder, 0, sizeof(*encoder));
+	tvee = drmm_kzalloc(drm, sizeof(*tvee), GFP_KERNEL);
+	if (!tvee)
+		return -ENOMEM;
+
+	tvee->tve = tve;
+	encoder = &tvee->encoder;
+	connector = &tvee->connector;
+
+	ret = drm_simple_encoder_init(drm, encoder, encoder_type);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(drm, imx_tve_encoder_cleanup, encoder);
+	if (ret)
+		return ret;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, tve->dev->of_node);
 	if (ret)
 		return ret;
 
 	drm_encoder_helper_add(encoder, &imx_tve_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, encoder_type);
 
 	drm_connector_helper_add(connector, &imx_tve_connector_helper_funcs);
-	drm_connector_init_with_ddc(drm, connector,
-				    &imx_tve_connector_funcs,
-				    DRM_MODE_CONNECTOR_VGA,
-				    tve->ddc);
-
-	drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_init_with_ddc(drm, connector,
+					  &imx_tve_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA, tve->ddc);
+	if (ret)
+		return ret;
 
-	return 0;
+	return drm_connector_attach_encoder(connector, encoder);
 }
 
 static const struct component_ops imx_tve_ops = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
