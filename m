Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A786750390
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E4710E3FA;
	Wed, 12 Jul 2023 09:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE8310E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-0001V6-I3; Wed, 12 Jul 2023 11:47:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-00Dr5f-F2; Wed, 12 Jul 2023 11:47:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-004GU0-CV; Wed, 12 Jul 2023 11:47:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 33/52] drm/rockchip: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:43 +0200
Message-Id: <20230712094702.1770121-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4041;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fzTkzJ2crxvB0YLT3xbxIaqmdKh8jjxij3HqLKEm5PY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZ8rkrJTPSo7Q7VWyz6pZBFJotWpQXtY4bLU
 lY8/Ee2UpmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52fAAKCRCPgPtYfRL+
 TubhB/9pOJGXkc/cyv7BNxmrRzypJDTk3FSpHNvbRozIfGcXy53Tu/yD21H+UiyEryA7fGyHZRI
 PJrBDh4JeY5AxFL7g+JOBchnonP408coRmx0FP82u+aysOUTgfEBk9Ap7m1BmM1z2uwjM6mEsca
 Y8MZI20ZWiTTo4acJbP1djyOAfZTRN1ZC2kfVS3JIkVtxjtFMmDeKkT2TsFw7SY2Rs7ye9Hg3gJ
 187shJh4768S3OFzXeEjMX1LZ7cKEHKf/fpihqrl1RjyjZkCKiYuUcffD6Het+qn8v+N2S/Qo3W
 6VvkRBk9XatONJ2eNyRUgcIob7MWVREYVP4LkOJe2tUIEPc6
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
Cc: kernel@pengutronix.de, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c  |  8 ++++----
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 15 ++++++++-------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index a530ecc4d207..811ddfd06d3e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -758,9 +758,9 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
 
 out:
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -1567,7 +1567,7 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
 	 */
 	vop_wait_for_irq_handler(vop);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 		WARN_ON(vop->event);
@@ -1575,7 +1575,7 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
 		vop->event = crtc->state->event;
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state,
 				       new_plane_state, i) {
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index ca73b8ccc29f..6cbdef324d82 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -924,9 +924,9 @@ static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
 	vop2_unlock(vop2);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -1564,7 +1564,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		polflags |= BIT(VSYNC_POSITIVE);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
+				  crtc_state->encoder_mask) {
 		struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
 
 		rk3568_set_intf_mux(vp, rkencoder->crtc_endpoint_id, polflags);
@@ -2060,7 +2061,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	vop2_cfg_done(vp);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 
 	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc));
@@ -2068,7 +2069,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
@@ -2162,7 +2163,7 @@ static irqreturn_t vop2_isr(int irq, void *data)
 
 		if (irqs & VP_INT_FS_FIELD) {
 			drm_crtc_handle_vblank(crtc);
-			spin_lock(&crtc->dev->event_lock);
+			spin_lock(&crtc->drm_dev->event_lock);
 			if (vp->event) {
 				u32 val = vop2_readl(vop2, RK3568_REG_CFG_DONE);
 
@@ -2172,7 +2173,7 @@ static irqreturn_t vop2_isr(int irq, void *data)
 					drm_crtc_vblank_put(crtc);
 				}
 			}
-			spin_unlock(&crtc->dev->event_lock);
+			spin_unlock(&crtc->drm_dev->event_lock);
 
 			ret = IRQ_HANDLED;
 		}
-- 
2.39.2

