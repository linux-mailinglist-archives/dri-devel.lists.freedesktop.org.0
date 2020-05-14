Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660211D3471
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457C66E358;
	Thu, 14 May 2020 15:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81DA6E356
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 15:07:09 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0125B259;
 Thu, 14 May 2020 17:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589468828;
 bh=5FGPTrgZceHOPzO7FIcH6Gx6954XCnoKXy/ymuM7vRw=;
 h=From:To:Cc:Subject:Date:From;
 b=Hu1B2QGa8y4CLA/2jsXnrzrx6EmI5yvQ0OnCej0ui4hkzVnA4lhdcjkMb8QG6yG8H
 dw2ST8/8B0QOCd8udHw+Sh8Kgz/IKflwouWjg6LgVKD0gQEshTMmLegpTzuJ7KKWBo
 nzseT5fgqD7e80TsB7TjOhbrSsg43Mr4asib72lQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: rcar-du: Iterate over connectors in
 rcar_du_crtc_atomic_check()
Date: Thu, 14 May 2020 18:06:56 +0300
Message-Id: <20200514150657.25431-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
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

Replace iteration over encoders with iteration over connectors. This is
a bit more aligned with the atomic framework, but more importantly, the
change prepares for code that will need to access the connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index d73e88ddecd0..fbe927278634 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -685,7 +685,9 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 				     struct drm_crtc_state *state)
 {
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(state);
-	struct drm_encoder *encoder;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *connector;
+	unsigned int i;
 	int ret;
 
 	ret = rcar_du_cmm_check(crtc, state);
@@ -695,15 +697,17 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 	/* Store the routes from the CRTC output to the DU outputs. */
 	rstate->outputs = 0;
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, state->encoder_mask) {
-		struct rcar_du_encoder *renc;
+	for_each_new_connector_in_state(state->state, connector, conn_state, i) {
+		struct drm_encoder *encoder = conn_state->best_encoder;
+
+		if (!encoder)
+			continue;
 
 		/* Skip the writeback encoder. */
 		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
 			continue;
 
-		renc = to_rcar_encoder(encoder);
-		rstate->outputs |= BIT(renc->output);
+		rstate->outputs |= BIT(to_rcar_encoder(encoder)->output);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
