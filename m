Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D82DB7F0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 01:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D288997A;
	Wed, 16 Dec 2020 00:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6708997A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 00:50:35 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A088D95;
 Wed, 16 Dec 2020 01:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608079832;
 bh=lsoHVe4tePe5S30+UZ7AFMTvL8M0aFLZnLxaRmvrdWQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gw0JnK5iubpEt8Wlg+tdwK2B02eXU6hphJN0oF9M/2dqr/2YJOoGtPmOn7SWjzwyW
 Op0WRSNCEdhjAw1zuUHghvNf/KVppwz5MvE4NMrCkLMPkZYt5HiNUi71MPDrY69xRq
 51rYpTIur/qkBlTJB+txDTgCE9x3pdSF7KxNceUc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm: rcar-du: Use drm_bridge_connector_init() helper
Date: Wed, 16 Dec 2020 02:50:21 +0200
Message-Id: <20201216005021.19518-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the drm_bridge_connector_init() helper to create a drm_connector for
each output, instead of relying on the bridge drivers doing so. Attach
the bridges with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to instruct
them not to create a connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 25 ++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ba8c6038cd63..10a66091391a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -61,6 +62,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 struct device_node *enc_node)
 {
 	struct rcar_du_encoder *renc;
+	struct drm_connector *connector;
 	struct drm_bridge *bridge;
 	int ret;
 
@@ -122,9 +124,22 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	if (ret)
 		return ret;
 
-	/*
-	 * Attach the bridge to the encoder. The bridge will create the
-	 * connector.
-	 */
-	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
+	/* Attach the bridge to the encoder. */
+	ret = drm_bridge_attach(&renc->base, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(rcdu->dev, "failed to attach bridge for output %u\n",
+			output);
+		return ret;
+	}
+
+	/* Create the connector for the chain of bridges. */
+	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
+	if (IS_ERR(connector)) {
+		dev_err(rcdu->dev,
+			"failed to created connector for output %u\n", output);
+		return PTR_ERR(connector);
+	}
+
+	return drm_connector_attach_encoder(connector, &renc->base);
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
