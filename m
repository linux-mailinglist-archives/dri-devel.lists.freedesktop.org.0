Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A814B2DF792
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 02:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F956E425;
	Mon, 21 Dec 2020 01:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69BC6E424
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 01:57:47 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A3FA14D9;
 Mon, 21 Dec 2020 02:57:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608515864;
 bh=5+RS6cOm3Iu6Jt/Zjsv5wFxyRLQB3lly6l2CYs0IKLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HrW7I0w6o8+UgPk5N9pURo1PjjxRXG+p1VuC7zOcfXWsVnvY92fKPZJgMJVZzaZ6x
 TykdBLW5dQm8mE63Md/NFmFgd6FDKicW1sk0XElNtCZYgrogaci4wIIzIhiII89Q2V
 uhEPw3i+RvZfBF6v6wne73w8wyRPxjdPsNITRzY0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm: rcar-du: kms: Configure the CLU
Date: Mon, 21 Dec 2020 03:57:30 +0200
Message-Id: <20201221015730.28333-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Link the DRM 3D-CLU configuration to the CMM setup configuration.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 426b1870b3cb..5c77017084ed 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -484,19 +484,23 @@ static int rcar_du_cmm_check(struct drm_crtc *crtc,
 			     struct drm_crtc_state *state)
 {
 	struct drm_property_blob *drm_lut = state->gamma_lut;
+	struct drm_property_blob *drm_clu = state->cubic_lut;
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct device *dev = rcrtc->dev->dev;
 
-	if (!drm_lut)
-		return 0;
-
-	/* We only accept fully populated LUT tables. */
-	if (drm_color_lut_size(drm_lut) != CM2_LUT_SIZE) {
+	/* We only accept fully populated LUTs. */
+	if (drm_lut && drm_color_lut_size(drm_lut) != CM2_LUT_SIZE) {
 		dev_err(dev, "invalid gamma lut size: %zu bytes\n",
 			drm_lut->length);
 		return -EINVAL;
 	}
 
+	if (drm_clu && drm_color_lut_size(drm_clu) != CM2_CLU_SIZE) {
+		dev_err(dev, "invalid cubic lut size: %zu bytes\n",
+			drm_clu->length);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -518,6 +522,15 @@ static void rcar_du_cmm_setup(struct rcar_du_crtc *rcrtc,
 				     ? new_state->gamma_lut->data : NULL;
 	}
 
+	if (!old_state ||
+	    !old_state->cubic_lut != !new_state->cubic_lut ||
+	    (old_state->cubic_lut && new_state->cubic_lut &&
+	     old_state->cubic_lut->base.id != new_state->cubic_lut->base.id)) {
+		cmm_config.clu.update = true;
+		cmm_config.clu.table = new_state->cubic_lut
+				     ? new_state->cubic_lut->data : NULL;
+	}
+
 	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
 }
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
