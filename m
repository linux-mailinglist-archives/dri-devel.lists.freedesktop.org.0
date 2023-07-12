Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90815750399
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D2E10E42E;
	Wed, 12 Jul 2023 09:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC81510E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-0001Qa-V3; Wed, 12 Jul 2023 11:47:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-00Dr5J-KM; Wed, 12 Jul 2023 11:47:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-004GTe-9A; Wed, 12 Jul 2023 11:47:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 27/52] drm/omapdrm: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:37 +0200
Message-Id: <20230712094702.1770121-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9930;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=8rS3gLorHeR0SqH48DVJdg0FvyoiLRqrAwj7ANqtkno=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZ100Nd36gVUMWajgp30T9izJGE1noGhpr3D
 xpDLVQWQYOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52dQAKCRCPgPtYfRL+
 TlvGB/4wWgaW37e3L06QYU5WBQ+chzB38vQJm2l0HG9tPlFktu2HhX+dU3dCdfe8pQH//xO7fiW
 tSxwGxSOgHZzJEsB+OqO69RGSoWSw591LpafIzA03JNM3npxo4lk9H38mMzi8gZ//5boIXiI1EC
 6PFpuk9KgchpzMaRLEDIxwXXmYoqb9DfQkHbQ+kRFTGJApYL/r1MMBCy+Ft5fLJpgJPd0AY46FK
 um68m4Ta93K+T6WZK8IBrbRDKwS/omsqaOTmDXCtuFLknKSlmXoYNsQsgdxfQwC02XC4deUG5oB
 jBvKJnWVfKAUknJQSfKiIyTRoK7r1crXMOImvtve9HnOnxj5
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
 drivers/gpu/drm/omapdrm/omap_crtc.c | 56 ++++++++++++++---------------
 drivers/gpu/drm/omapdrm/omap_irq.c  |  6 ++--
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 63ddc5127f7b..ab7bed69c1bd 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -70,9 +70,9 @@ static bool omap_crtc_is_pending(struct drm_crtc *crtc)
 	unsigned long flags;
 	bool pending;
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 	pending = omap_crtc->pending;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 
 	return pending;
 }
@@ -109,7 +109,7 @@ void omap_crtc_dss_start_update(struct omap_drm_private *priv,
 void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 {
 	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct omap_drm_private *priv = dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	enum omap_channel channel = omap_crtc->channel;
@@ -228,7 +228,7 @@ int omap_crtc_dss_register_framedone(
 {
 	struct drm_crtc *crtc = priv->channels[channel]->crtc;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct drm_device *dev = omap_crtc->base.dev;
+	struct drm_device *dev = omap_crtc->base.drm_dev;
 
 	if (omap_crtc->framedone_handler)
 		return -EBUSY;
@@ -247,7 +247,7 @@ void omap_crtc_dss_unregister_framedone(
 {
 	struct drm_crtc *crtc = priv->channels[channel]->crtc;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct drm_device *dev = omap_crtc->base.dev;
+	struct drm_device *dev = omap_crtc->base.drm_dev;
 
 	dev_dbg(dev->dev, "unregister framedone %s", omap_crtc->name);
 
@@ -278,17 +278,17 @@ void omap_crtc_error_irq(struct drm_crtc *crtc, u32 irqstatus)
 void omap_crtc_vblank_irq(struct drm_crtc *crtc)
 {
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct drm_device *dev = omap_crtc->base.dev;
+	struct drm_device *dev = omap_crtc->base.drm_dev;
 	struct omap_drm_private *priv = dev->dev_private;
 	bool pending;
 
-	spin_lock(&crtc->dev->event_lock);
+	spin_lock(&crtc->drm_dev->event_lock);
 	/*
 	 * If the dispc is busy we're racing the flush operation. Try again on
 	 * the next vblank interrupt.
 	 */
 	if (dispc_mgr_go_busy(priv->dispc, omap_crtc->channel)) {
-		spin_unlock(&crtc->dev->event_lock);
+		spin_unlock(&crtc->drm_dev->event_lock);
 		return;
 	}
 
@@ -300,7 +300,7 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
 
 	pending = omap_crtc->pending;
 	omap_crtc->pending = false;
-	spin_unlock(&crtc->dev->event_lock);
+	spin_unlock(&crtc->drm_dev->event_lock);
 
 	if (pending)
 		drm_crtc_vblank_put(crtc);
@@ -320,14 +320,14 @@ void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
 
 	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
 
-	spin_lock(&crtc->dev->event_lock);
+	spin_lock(&crtc->drm_dev->event_lock);
 	/* Send the vblank event if one has been requested. */
 	if (omap_crtc->event) {
 		drm_crtc_send_vblank_event(crtc, omap_crtc->event);
 		omap_crtc->event = NULL;
 	}
 	omap_crtc->pending = false;
-	spin_unlock(&crtc->dev->event_lock);
+	spin_unlock(&crtc->drm_dev->event_lock);
 
 	/* Wake up omap_atomic_complete. */
 	wake_up(&omap_crtc->pending_wait);
@@ -350,7 +350,7 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
 	struct omap_crtc *omap_crtc =
 			container_of(data, struct omap_crtc, update_work.work);
 	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
-	struct drm_device *dev = omap_crtc->base.dev;
+	struct drm_device *dev = omap_crtc->base.drm_dev;
 	int ret;
 
 	if (!dssdev || !dssdev->dsi_ops || !dssdev->dsi_ops->update)
@@ -394,7 +394,7 @@ static void omap_crtc_cpr_coefs_from_ctm(const struct drm_color_ctm *ctm,
 
 static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm_dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct omap_overlay_manager_info info;
 
@@ -447,7 +447,7 @@ static void omap_crtc_arm_event(struct drm_crtc *crtc)
 static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm_dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
 	int ret;
@@ -465,26 +465,26 @@ static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
 	ret = drm_crtc_vblank_get(crtc);
 	WARN_ON(ret != 0);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	omap_crtc_arm_event(crtc);
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 static void omap_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm_dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 
 	DBG("%s", omap_crtc->name);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 	cancel_delayed_work(&omap_crtc->update_work);
 
@@ -499,7 +499,7 @@ static void omap_crtc_atomic_disable(struct drm_crtc *crtc,
 static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
 					const struct drm_display_mode *mode)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm_dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct videomode vm = {0};
 	int r;
@@ -615,7 +615,7 @@ static void omap_crtc_atomic_begin(struct drm_crtc *crtc,
 static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm_dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct omap_crtc_state *omap_crtc_state = to_omap_crtc_state(crtc->state);
 	int ret;
@@ -644,20 +644,20 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	if (omap_crtc_state->manually_updated) {
 		/* send new image for page flips and modeset changes */
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		omap_crtc_flush(crtc);
 		omap_crtc_arm_event(crtc);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 		return;
 	}
 
 	ret = drm_crtc_vblank_get(crtc);
 	WARN_ON(ret != 0);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	dispc_mgr_go(priv->dispc, omap_crtc->channel);
 	omap_crtc_arm_event(crtc);
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 static int omap_crtc_atomic_set_property(struct drm_crtc *crtc,
@@ -665,7 +665,7 @@ static int omap_crtc_atomic_set_property(struct drm_crtc *crtc,
 					 struct drm_property *property,
 					 u64 val)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm_dev->dev_private;
 	struct drm_plane_state *plane_state;
 
 	/*
@@ -693,7 +693,7 @@ static int omap_crtc_atomic_get_property(struct drm_crtc *crtc,
 					 struct drm_property *property,
 					 u64 *val)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm_dev->dev_private;
 	struct omap_crtc_state *omap_state = to_omap_crtc_state(state);
 
 	if (property == crtc->primary->rotation_property)
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index a6f0bbc879d2..37c84851a054 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -78,7 +78,7 @@ int omap_irq_wait(struct drm_device *dev, struct omap_irq_wait *wait,
 
 int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct omap_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 	enum omap_channel channel = omap_crtc_channel(crtc);
@@ -112,7 +112,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
  */
 int omap_irq_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct omap_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 	enum omap_channel channel = omap_crtc_channel(crtc);
@@ -138,7 +138,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
  */
 void omap_irq_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct omap_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 	enum omap_channel channel = omap_crtc_channel(crtc);
-- 
2.39.2

