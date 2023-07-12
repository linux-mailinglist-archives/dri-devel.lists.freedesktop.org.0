Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7567B7503B3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E781610E4AF;
	Wed, 12 Jul 2023 09:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C8110E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001gM-Nb; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-00Dr6n-4f; Wed, 12 Jul 2023 11:47:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-004GUx-8l; Wed, 12 Jul 2023 11:47:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Zack Rusin <zackr@vmware.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 49/52] drm/vmwgfx: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:59 +0200
Message-Id: <20230712094702.1770121-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4778;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=9zUwA7B2WGXoeNrB+Uyz3NXAmQG5LSCc9QK3KoNZKcc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaP3h0i+AwQZ8rapXramcL00Q+jKafWQFYXk
 4y9DiqD2DOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52jwAKCRCPgPtYfRL+
 TqQHCACgkVA69XH4qBxQT6LCnJYPrwtUY9fDucpmJ2FDustWNvXp1mwA8eP9+xKeB+lkvc+MghB
 69tOY78x9V/vcWOaeHJogf0rRW9ZLRP4UhMbzy16AYrW0xBuGpc7P4S/4ID/88zJj78JOnFHc6m
 uQpsMsWmhhpheOqcSxIJDB0RlOGYJZ91g7sdHwWEQi2wyMyotqQUj/Ptbm1z7stBhMSejk0vfvv
 mnjyh2Xegzxf4TqUIZzRM8lCGV1TWmJSSDHbZ5nAo0gjo2DtBNJPEp2rUupal80C1qkcwxzWAGS
 QAPY0+WH+dLHY97WqCvuVBZ9clhzgyJw16t3XK/hTm8JrHRZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 10 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index b62207be3363..f26b89eee8b0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -762,7 +762,7 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
 	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
-	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+	struct vmw_private *dev_priv = vmw_priv(crtc->drm_dev);
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
 	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
@@ -2240,7 +2240,7 @@ int vmw_du_crtc_gamma_set(struct drm_crtc *crtc,
 			  uint32_t size,
 			  struct drm_modeset_acquire_ctx *ctx)
 {
-	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+	struct vmw_private *dev_priv = vmw_priv(crtc->drm_dev);
 	int i;
 
 	for (i = 0; i < size; i++) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 556a403b7eb5..5d653a624b74 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -219,7 +219,7 @@ static void vmw_sou_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	int ret;
 
 	sou = vmw_crtc_to_sou(crtc);
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm_dev);
 	ps = crtc->primary->state;
 	fb = ps->fb;
 	vps = vmw_plane_state_to_vps(ps);
@@ -303,7 +303,7 @@ static void vmw_sou_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 
 	sou = vmw_crtc_to_sou(crtc);
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm_dev);
 
 	if (sou->defined) {
 		ret = vmw_sou_fifo_destroy(dev_priv, sou);
@@ -384,7 +384,7 @@ vmw_sou_primary_plane_cleanup_fb(struct drm_plane *plane,
 		plane->state->crtc : old_state->crtc;
 
 	if (vps->bo)
-		vmw_bo_unpin(vmw_priv(crtc->dev), vps->bo, false);
+		vmw_bo_unpin(vmw_priv(crtc->drm_dev), vps->bo, false);
 	vmw_bo_unreference(&vps->bo);
 	vps->bo_size = 0;
 
@@ -426,7 +426,7 @@ vmw_sou_primary_plane_prepare_fb(struct drm_plane *plane,
 	}
 
 	bo_params.size = new_state->crtc_w * new_state->crtc_h * 4;
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm_dev);
 
 	if (vps->bo) {
 		if (vps->bo_size == bo_params.size) {
@@ -730,7 +730,7 @@ vmw_sou_primary_plane_atomic_update(struct drm_plane *plane,
 
 	/* In case of device error, maintain consistent atomic state */
 	if (crtc && new_state->fb) {
-		struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+		struct vmw_private *dev_priv = vmw_priv(crtc->drm_dev);
 		struct vmw_framebuffer *vfb =
 			vmw_framebuffer_to_vfb(new_state->fb);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index ba0c0e12cfe9..a08d81ea9c94 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -371,7 +371,7 @@ static void vmw_stdu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	int x, y, ret;
 
 	stdu = vmw_crtc_to_stdu(crtc);
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm_dev);
 	conn_state = stdu->base.connector.state;
 	vmw_conn_state = vmw_connector_state_to_vcs(conn_state);
 
@@ -427,7 +427,7 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 
 	stdu     = vmw_crtc_to_stdu(crtc);
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm_dev);
 
 	if (stdu->defined) {
 		ret = vmw_stdu_bind_st(dev_priv, stdu, NULL);
@@ -1363,7 +1363,7 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 		struct vmw_framebuffer *vfb =
 			vmw_framebuffer_to_vfb(new_state->fb);
 		stdu = vmw_crtc_to_stdu(crtc);
-		dev_priv = vmw_priv(crtc->dev);
+		dev_priv = vmw_priv(crtc->drm_dev);
 
 		stdu->display_srf = vps->surf;
 		stdu->content_fb_type = vps->content_fb_type;
@@ -1385,7 +1385,7 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 	} else {
 		crtc = old_state->crtc;
 		stdu = vmw_crtc_to_stdu(crtc);
-		dev_priv = vmw_priv(crtc->dev);
+		dev_priv = vmw_priv(crtc->drm_dev);
 
 		/* Blank STDU when fb and crtc are NULL */
 		if (!stdu->defined)
-- 
2.39.2

