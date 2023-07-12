Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD97503AE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C3E10E47B;
	Wed, 12 Jul 2023 09:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7A10E3F5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001fL-Ft; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-00Dr6b-SY; Wed, 12 Jul 2023 11:47:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-004GUV-Ri; Wed, 12 Jul 2023 11:47:12 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 41/52] drm/tilcdc: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:51 +0200
Message-Id: <20230712094702.1770121-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7537;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=9kC9sYcb7STLgDDn2FpHEjmjrrcCMQgUsvUfIppcJ9c=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaGWiqb31kdlr69qNK3Si0dDDpLTAwsohx41
 wIi1w28sXKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52hgAKCRCPgPtYfRL+
 TiBgCACcqbprO1q04WJebdrPOGfFWVmP+oDfVP9z7RPwmHdg6uFaReJd2N+lzS8sRQXallMGNhX
 JTIf77hqMpqzQUa6QgjBVj+vC1UyrvameSXH5vvhqK7MwxD+bbvfmZTtxwamn5dH7pBDB5nrL/s
 bof9J3kFObeX4mSfPt7bQkSu0+UOSnAluITsba9x+EWj1WAJfpYVOn2Ep2uLEkg5AdR1faHfk+/
 5xhmfIrj1+r/RTWHKwp+Xv6KG+07JcuYKb8pAWrz5dD2miO45L6XmGWOKL517r06oV3B1RGwSt0
 mQ8u+9UBsn38b4uDLuassi4ZVhBE0ak7gs4g1bHsge8Q1SdO
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 43 ++++++++++++++--------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b5f60b2b2d0e..43134fef8282 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -62,7 +62,7 @@ struct tilcdc_crtc {
 
 static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct drm_gem_dma_object *gem;
 	dma_addr_t start, end;
@@ -97,7 +97,7 @@ static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 static void tilcdc_crtc_load_palette(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	int ret;
 
@@ -176,7 +176,7 @@ static void tilcdc_crtc_disable_irqs(struct drm_device *dev)
 
 static void reset(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 
 	if (priv->rev != 2)
@@ -201,7 +201,7 @@ static unsigned int tilcdc_pclk_diff(unsigned long rate,
 
 static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	unsigned long clk_rate, real_pclk_rate, pclk_rate;
@@ -273,7 +273,7 @@ static uint tilcdc_mode_hvtotal(const struct drm_display_mode *mode)
 static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	const struct tilcdc_panel_info *info = tilcdc_crtc->info;
 	uint32_t reg, hbp, hfp, hsw, vbp, vfp, vsw;
@@ -442,7 +442,7 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 
 static void tilcdc_crtc_enable(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	unsigned long flags;
 
@@ -491,7 +491,7 @@ static void tilcdc_crtc_atomic_enable(struct drm_crtc *crtc,
 static void tilcdc_crtc_off(struct drm_crtc *crtc, bool shutdown)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	int ret;
 
 	mutex_lock(&tilcdc_crtc->enable_lock);
@@ -517,14 +517,14 @@ static void tilcdc_crtc_off(struct drm_crtc *crtc, bool shutdown)
 
 	drm_crtc_vblank_off(crtc);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
 
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 	tilcdc_crtc_disable_irqs(dev);
 
@@ -551,10 +551,10 @@ static void tilcdc_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (!crtc->state->event)
 		return;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	drm_crtc_send_vblank_event(crtc, crtc->state->event);
 	crtc->state->event = NULL;
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc)
@@ -573,7 +573,7 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 		container_of(work, struct tilcdc_crtc, recover_work);
 	struct drm_crtc *crtc = &tilcdc_crtc->base;
 
-	dev_info(crtc->dev->dev, "%s: Reset CRTC", __func__);
+	dev_info(crtc->drm_dev->dev, "%s: Reset CRTC", __func__);
 
 	drm_modeset_lock(&crtc->mutex, NULL);
 
@@ -588,7 +588,7 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 
 static void tilcdc_crtc_destroy(struct drm_crtc *crtc)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = crtc->drm_dev->dev_private;
 
 	tilcdc_crtc_shutdown(crtc);
 
@@ -603,7 +603,7 @@ int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
 		struct drm_pending_vblank_event *event)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 
 	if (tilcdc_crtc->event) {
 		dev_err(dev->dev, "already pending page flip!\n");
@@ -679,7 +679,8 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
 	if (state->planes[0].ptr != crtc->primary ||
 	    state->planes[0].state == NULL ||
 	    state->planes[0].state->crtc != crtc) {
-		dev_dbg(crtc->dev->dev, "CRTC primary plane must be present");
+		dev_dbg(crtc->drm_dev->dev,
+			"CRTC primary plane must be present");
 		return -EINVAL;
 	}
 
@@ -689,7 +690,7 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
 static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 
@@ -712,7 +713,7 @@ static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 static void tilcdc_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 
@@ -731,7 +732,7 @@ static void tilcdc_crtc_disable_vblank(struct drm_crtc *crtc)
 static void tilcdc_crtc_reset(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	int ret;
 
 	drm_atomic_helper_crtc_reset(crtc);
@@ -771,7 +772,7 @@ static enum drm_mode_status
 tilcdc_crtc_mode_valid(struct drm_crtc *crtc,
 		       const struct drm_display_mode *mode)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = crtc->drm_dev->dev_private;
 	unsigned int bandwidth;
 	uint32_t hbp, hfp, hsw, vbp, vfp, vsw;
 
@@ -883,7 +884,7 @@ void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
 
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 
@@ -907,7 +908,7 @@ void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	uint32_t stat, reg;
 
-- 
2.39.2

