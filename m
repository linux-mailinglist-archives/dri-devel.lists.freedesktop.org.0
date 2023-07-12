Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51337750396
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B7C10E41E;
	Wed, 12 Jul 2023 09:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E57410E3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-0001HI-UQ; Wed, 12 Jul 2023 11:47:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-00Dr40-OX; Wed, 12 Jul 2023 11:47:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR8-004GSX-SK; Wed, 12 Jul 2023 11:47:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 10/52] drm/fsl-dcu: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:20 +0200
Message-Id: <20230712094702.1770121-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3263;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ZWr/bCmKCs1ZopQClpXZXm/Q0ZP9PrvTEl+gTQ6tq8s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZh3SXLFIvi33TE1N1yIn+0QdcWrkm7gzDNo
 HqKxFnAYmCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52YQAKCRCPgPtYfRL+
 TifnB/sERTvW/ich6LBdetVFpVLqHLz1zZj3DgEM6TrpL7neH8S6+uJksXIFpKGcCvfuD1TQ1EE
 KW6zvsapYHeDsDwNKmXq980NHJjOyB6EWTwhxK0rmYy5HWD9rAcDkdLcmvL988kc++fs5zX3IJ5
 l4ek3s/9NxtevJ4GkPpCOTwtay2pLuRpEwi2h4+c9LmZ3lma77SZEimkXOmGnFN30HrTxNXgj7v
 fa+AiCrevKYWC3/Ft3HQWk0MlE3HY8yDVs//Gm5mhpZGRXwn+Y+7UlAGCUnHdYj+9+fvIuRuMUf
 4B14H1P400jA8QMrWzNkh0LKo3VghsH2/D3jfmjeSrtusSIx
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index 2af60d98f48f..8f55b3f56faa 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -23,7 +23,7 @@
 static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 					  struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 	struct drm_pending_vblank_event *event = crtc->state->event;
 
@@ -33,12 +33,12 @@ static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 	}
 }
 
@@ -47,7 +47,7 @@ static void fsl_dcu_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
 									      crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 
 	/* always disable planes on the CRTC */
@@ -66,7 +66,7 @@ static void fsl_dcu_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 static void fsl_dcu_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 
 	clk_prepare_enable(fsl_dev->pix_clk);
@@ -81,7 +81,7 @@ static void fsl_dcu_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 	struct drm_connector *con = &fsl_dev->connector.base;
 	struct drm_display_mode *mode = &crtc->state->mode;
@@ -134,7 +134,7 @@ static const struct drm_crtc_helper_funcs fsl_dcu_drm_crtc_helper_funcs = {
 
 static int fsl_dcu_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 	unsigned int value;
 
@@ -147,7 +147,7 @@ static int fsl_dcu_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void fsl_dcu_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 	unsigned int value;
 
-- 
2.39.2

