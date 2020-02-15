Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FDC15FF82
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 18:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94C96E21B;
	Sat, 15 Feb 2020 17:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E322E6E21B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 17:33:45 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C71F120021;
 Sat, 15 Feb 2020 18:33:43 +0100 (CET)
Date: Sat, 15 Feb 2020 18:33:42 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v1 1/1] drm: drop unused drm_crtc callback
Message-ID: <20200215173342.GA7458@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=C6ZuiBmJ15vxEN2zucAA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_encoder_helper_funcs included a callback
named drm_crtc.

There are no users left - so drop it.
There was one reference in drm_crtc_helper.c,
which checked if the value was not NULL.
As it was never assigned this check could be dropped.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---

Stumbled upon this and dediced to check if it was used.
Build tested with allyesconfig, allmodconfig for relevant architectures.

	Sam


 drivers/gpu/drm/drm_crtc_helper.c        |  4 ----
 include/drm/drm_modeset_helper_vtables.h | 16 ----------------
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 93a4eec429e8..a4d36aca45ea 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -244,10 +244,6 @@ drm_crtc_prepare_encoders(struct drm_device *dev)
 		/* Disable unused encoders */
 		if (encoder->crtc == NULL)
 			drm_encoder_disable(encoder);
-		/* Disable encoders whose CRTC is about to change */
-		if (encoder_funcs->get_crtc &&
-		    encoder->crtc != (*encoder_funcs->get_crtc)(encoder))
-			drm_encoder_disable(encoder);
 	}
 }
 
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 0afaf58da40d..7c20b1c8b6a7 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -692,22 +692,6 @@ struct drm_encoder_helper_funcs {
 				struct drm_crtc_state *crtc_state,
 				struct drm_connector_state *conn_state);
 
-	/**
-	 * @get_crtc:
-	 *
-	 * This callback is used by the legacy CRTC helpers to work around
-	 * deficiencies in its own book-keeping.
-	 *
-	 * Do not use, use atomic helpers instead, which get the book keeping
-	 * right.
-	 *
-	 * FIXME:
-	 *
-	 * Currently only nouveau is using this, and as soon as nouveau is
-	 * atomic we can ditch this hook.
-	 */
-	struct drm_crtc *(*get_crtc)(struct drm_encoder *encoder);
-
 	/**
 	 * @detect:
 	 *
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
