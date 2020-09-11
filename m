Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19BE266067
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05C76EA44;
	Fri, 11 Sep 2020 13:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEEB6E952
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:12 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGg-0005Is-O7; Fri, 11 Sep 2020 15:39:10 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/21] drm/imx: dw_hdmi-imx: use drm managed resources
Date: Fri, 11 Sep 2020 15:38:37 +0200
Message-Id: <20200911133855.29801-3-p.zabel@pengutronix.de>
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
 - Split from patch "drm/imx: dw_hdmi-imx: use drm managed resources, switch to
   dw_hdmi_probe"
---
 drivers/gpu/drm/imx/dw_hdmi-imx.c | 34 ++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index bbd0a0cd7c3d..16be8bd92653 100644
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
@@ -181,18 +188,27 @@ static const struct of_device_id dw_hdmi_imx_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_hdmi_imx_dt_ids);
 
+static void dw_hdmi_imx_encoder_cleanup(struct drm_device *drm, void *data)
+{
+	struct drm_encoder *encoder = data;
+
+	drm_encoder_cleanup(encoder);
+}
+
 static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 			    void *data)
 {
 	struct drm_device *drm = data;
+	struct imx_hdmi_encoder *hdmi_encoder;
 	struct drm_encoder *encoder;
-	struct imx_hdmi *hdmi;
 	int ret;
 
-	hdmi = dev_get_drvdata(dev);
-	memset(&hdmi->encoder, 0, sizeof(hdmi->encoder));
+	hdmi_encoder = drmm_kzalloc(drm, sizeof(*hdmi_encoder), GFP_KERNEL);
+	if (!hdmi_encoder)
+		return -ENOMEM;
 
-	encoder = &hdmi->encoder;
+	hdmi_encoder->hdmi = dev_get_drvdata(dev);
+	encoder = &hdmi_encoder->encoder;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, dev->of_node);
 	if (ret)
@@ -201,7 +217,11 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, &dw_hdmi_imx_encoder_helper_funcs);
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 
-	return drm_bridge_attach(encoder, hdmi->bridge, NULL, 0);
+	ret = drmm_add_action_or_reset(drm, dw_hdmi_imx_encoder_cleanup, encoder);
+	if (ret)
+		return ret;
+
+	return drm_bridge_attach(encoder, hdmi_encoder->hdmi->bridge, NULL, 0);
 }
 
 static const struct component_ops dw_hdmi_imx_ops = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
