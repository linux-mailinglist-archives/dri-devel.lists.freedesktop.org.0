Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8212F508A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 18:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5A16EB55;
	Wed, 13 Jan 2021 17:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096DA6EB55
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 17:03:00 +0000 (UTC)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net
 [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D01B22B3;
 Wed, 13 Jan 2021 18:02:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610557378;
 bh=k3L8DE43wWxyOWTYB2zxJjQ+TAFWQfp28bpyoPMCzTU=;
 h=From:To:Cc:Subject:Date:From;
 b=V73yK3oIqPmubHa1MlH5EqpYMif+Qp5wwbeUnCEKAZwXwyVLu9QpzxhnFTWT6GKpc
 HbgR6JTfmAtnpzho56DGxe+vQVdmj6FpsMatTxdQdZiR+5TsVPTPSGRMEONkiuDYhc
 sV/zTtfjiFgPxc7RnvrkC+0HzOccnHw2BBK9Xu20=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: rcar-du: Use drmm_encoder_alloc() to manage encoder
Date: Wed, 13 Jan 2021 17:02:53 +0000
Message-Id: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
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
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The encoder allocation was converted to a DRM managed resource at the
same time as the addition of a new helper drmm_encoder_alloc() which
simplifies the same process.

Convert the custom drm managed resource allocation of the encoder
with the helper to simplify the implementation, and prevent hitting a
WARN_ON() due to the handling the drm_encoder_init() call directly
without registering a .destroy() function op.

Fixes: f5f16725edbc ("drm: rcar-du: Use DRM-managed allocation for encoders")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 31 +++++------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ba8c6038cd63..ca3761772211 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -48,21 +48,12 @@ static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
 static const struct drm_encoder_funcs rcar_du_encoder_funcs = {
 };
 
-static void rcar_du_encoder_release(struct drm_device *dev, void *res)
-{
-	struct rcar_du_encoder *renc = res;
-
-	drm_encoder_cleanup(&renc->base);
-	kfree(renc);
-}
-
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node)
 {
 	struct rcar_du_encoder *renc;
 	struct drm_bridge *bridge;
-	int ret;
 
 	/*
 	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
@@ -101,26 +92,16 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			return -ENOLINK;
 	}
 
-	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
-	if (renc == NULL)
-		return -ENOMEM;
-
-	renc->output = output;
-
 	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
 		enc_node, output);
 
-	ret = drm_encoder_init(&rcdu->ddev, &renc->base, &rcar_du_encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
-	if (ret < 0) {
-		kfree(renc);
-		return ret;
-	}
+	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
+				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
+				  NULL);
+	if (!renc)
+		return -ENOMEM;
 
-	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_encoder_release,
-				       renc);
-	if (ret)
-		return ret;
+	renc->output = output;
 
 	/*
 	 * Attach the bridge to the encoder. The bridge will create the
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
