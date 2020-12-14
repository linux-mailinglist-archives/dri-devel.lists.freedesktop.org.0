Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79642DA1FA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 21:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300826E160;
	Mon, 14 Dec 2020 20:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F57D6E158
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 20:52:22 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 006DDD91;
 Mon, 14 Dec 2020 21:52:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607979140;
 bh=8ujjnY+qkizrwnbt44JqEWeQKc9YuOcFgEAQtwqtz64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJD8scBU+szBpzX8BRrS7KjEbhulDT2iktfGBFBA788esUeo+Ay/EemeWTvW4fh1d
 NFnl+amjL0FN0ia2CY5Ayg6SYJag73+YJ41yi3nYxSP8kOtH9SNv612mZXXcz1p3wz
 Xqj5vNAis5ZxH/YEGFJGeLuWhHTOOPdcXPE5GX6A=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm: rcar-du: Use DRM-managed allocation for encoders
Date: Mon, 14 Dec 2020 22:52:04 +0200
Message-Id: <20201214205208.10248-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_kzalloc() is the wrong API to allocate encoders, as the lifetime of
the encoders is tied to the DRM device, not the device to driver
binding. drmm_kzalloc() isn't a good option either, as it would result
in the encoder being freed before being unregistered during the managed
cleanup of the DRM objects. Use a plain kzalloc(), and register a drmm
action to cleanup the encoder.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 47 ++++++++++++++---------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index e4bac47caf16..55a0ecf45ebb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -8,12 +8,13 @@
  */
 
 #include <linux/export.h>
+#include <linux/slab.h>
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -44,6 +45,17 @@ static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
 	return num_ports;
 }
 
+static const struct drm_encoder_funcs rcar_du_encoder_funcs = {
+};
+
+static void rcar_du_encoder_release(struct drm_device *dev, void *res)
+{
+	struct rcar_du_encoder *renc = res;
+
+	drm_encoder_cleanup(&renc->base);
+	kfree(renc);
+}
+
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node)
@@ -53,7 +65,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	struct drm_bridge *bridge;
 	int ret;
 
-	renc = devm_kzalloc(rcdu->dev, sizeof(*renc), GFP_KERNEL);
+	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
 	if (renc == NULL)
 		return -ENOMEM;
 
@@ -75,20 +87,20 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 
 		if (IS_ERR(panel)) {
 			ret = PTR_ERR(panel);
-			goto done;
+			goto error;
 		}
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
 		if (IS_ERR(bridge)) {
 			ret = PTR_ERR(bridge);
-			goto done;
+			goto error;
 		}
 	} else {
 		bridge = of_drm_find_bridge(enc_node);
 		if (!bridge) {
 			ret = -EPROBE_DEFER;
-			goto done;
+			goto error;
 		}
 
 		if (output == RCAR_DU_OUTPUT_LVDS0 ||
@@ -103,28 +115,27 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
 		if (rcar_lvds_dual_link(bridge)) {
 			ret = -ENOLINK;
-			goto done;
+			goto error;
 		}
 	}
 
-	ret = drm_simple_encoder_init(rcdu->ddev, encoder,
-				      DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(rcdu->ddev, encoder, &rcar_du_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
-		goto done;
+		goto error;
+
+	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_encoder_release,
+				       renc);
+	if (ret)
+		return ret;
 
 	/*
 	 * Attach the bridge to the encoder. The bridge will create the
 	 * connector.
 	 */
-	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-	if (ret) {
-		drm_encoder_cleanup(encoder);
-		return ret;
-	}
-
-done:
-	if (ret < 0)
-		devm_kfree(rcdu->dev, renc);
+	return drm_bridge_attach(encoder, bridge, NULL, 0);
 
+error:
+	kfree(renc);
 	return ret;
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
