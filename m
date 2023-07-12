Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96F750395
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B8010E42B;
	Wed, 12 Jul 2023 09:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133C710E41E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001Ln-Sc; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-00Dr4b-0I; Wed, 12 Jul 2023 11:47:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-004GT1-LJ; Wed, 12 Jul 2023 11:47:08 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 18/52] drm/kmb: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:28 +0200
Message-Id: <20230712094702.1770121-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fsr7NLbBT3wwl6n8r3U+GwOutE1imxyARsoxL6ar2cw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZrRfiqFOKIl6zCjI1kciqNWrlaDtXYkh4x4
 2WI6minG4aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52awAKCRCPgPtYfRL+
 TkQ8B/9VIG9Sf6ktD7Y9ukn/fFlrOh6afrjNJwy7/RbRFr6XuoUpku496/k3X0B93WcOZDaKzir
 mIMT/B9Zt5/MPRPWbpxSdOAKW4X6kiEdlyHyenYTOOatIooeyTOduzLxPiu5/54U4M4KBp7d0Sb
 4o7icT6lVDI+Q3WoYkRD2RTgrZa+XUWBuKpybCirpLoboH6spa2Jiqdns5og0e1hak3RdbdtKK5
 dN5VfadjUOfFtLkJbZ07WnCdlIl5zRIrU+xAaGAULEIK9OYr3hXGdS+4HJ4fF3qePV/CvWYLk+8
 WrigIl3ebMW0efkBXTrnkQqAYBYH3sU+czQ93WHQrPrASdrj
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/kmb/kmb_crtc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 647872f65bff..5be50909d63b 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -28,7 +28,7 @@ struct kmb_crtc_timing {
 
 static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct kmb_drm_private *kmb = to_kmb(dev);
 
 	/* Clear interrupt */
@@ -44,7 +44,7 @@ static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct kmb_drm_private *kmb = to_kmb(dev);
 
 	/* Clear interrupt */
@@ -68,7 +68,7 @@ static const struct drm_crtc_funcs kmb_crtc_funcs = {
 static void kmb_crtc_set_mode(struct drm_crtc *crtc,
 			      struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_display_mode *m = &crtc->state->adjusted_mode;
 	struct kmb_crtc_timing vm;
 	struct kmb_drm_private *kmb = to_kmb(dev);
@@ -158,7 +158,7 @@ static void kmb_crtc_atomic_disable(struct drm_crtc *crtc,
 static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct kmb_drm_private *kmb = to_kmb(dev);
 
 	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
@@ -168,13 +168,13 @@ static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
 static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct kmb_drm_private *kmb = to_kmb(dev);
 
 	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
 			    LCD_INT_VERT_COMP);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (crtc->state->event) {
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
@@ -182,7 +182,7 @@ static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
 			drm_crtc_send_vblank_event(crtc, crtc->state->event);
 	}
 	crtc->state->event = NULL;
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 static enum drm_mode_status
@@ -190,7 +190,7 @@ static enum drm_mode_status
 				    const struct drm_display_mode *mode)
 {
 	int refresh;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	int vfp = mode->vsync_start - mode->vdisplay;
 
 	if (mode->vdisplay < KMB_CRTC_MAX_HEIGHT) {
-- 
2.39.2

