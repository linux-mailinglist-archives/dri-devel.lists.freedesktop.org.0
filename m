Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29DE7503A9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF04D10E4A8;
	Wed, 12 Jul 2023 09:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02A410E3EB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001LA-Rv; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-00Dr4T-RD; Wed, 12 Jul 2023 11:47:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-004GT9-VY; Wed, 12 Jul 2023 11:47:08 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 20/52] drm/mcde: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:30 +0200
Message-Id: <20230712094702.1770121-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3542;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=IJvlLEembzLcOuCvRsCkrD68tzgOJUkK+dYTuAcj0Yk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZtu9Vcq7bmlTUWJyHUqVczG/IWTPDK8/O+O
 SlrjwJvleGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52bQAKCRCPgPtYfRL+
 TjmvB/0RgBhS1V2etnGrSIJKLPJRlSFEqcFXJDiSsh52/Kel04d5mcdIcxC0BP5TQaDihjsmarX
 jkBUffyujM3xWzDCxMir5Q1QTuUrjjRLI8IWe9il2zfuM5j5hGBaNbPPzPsNr0nRRmOhCmoxbp9
 L/Gj7oUd+oTa0AverxNZSnHZoVfeBZ1A4DVntjITnApJDO66eZm9otYVI00XCRFaUWSQ3ZUv8oI
 7TZBrsVhC8ll/Y0JLmY+mTPTN/YEleKUC6RH+dPiX3c6iGW0js6bWvAVjW/ivlU/M8WJ7e/eeW9
 dQ7CYgBZTDT3dXcVRxgphS8YjDhl+P+vwASz4SfQzF7wVR/W
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
 drivers/gpu/drm/mcde/mcde_display.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 52043a12a2e8..3d5e3639d4af 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -1154,7 +1154,7 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_plane *plane = &pipe->plane;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct mcde *mcde = to_mcde(drm);
 	const struct drm_display_mode *mode = &cstate->mode;
 	struct drm_framebuffer *fb = plane->state->fb;
@@ -1300,7 +1300,7 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event;
 	int ret;
@@ -1321,9 +1321,9 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 	}
 
 	ret = regulator_disable(mcde->epod);
@@ -1384,7 +1384,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *old_pstate)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event = crtc->state->event;
 	struct drm_plane *plane = &pipe->plane;
@@ -1399,7 +1399,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		/*
 		 * Hardware must be on before we can arm any vblank event,
 		 * this is not a scanout controller where there is always
@@ -1415,7 +1415,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 			drm_crtc_send_vblank_event(crtc, event);
 		}
 
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 	}
 
 	/*
@@ -1445,7 +1445,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct mcde *mcde = to_mcde(drm);
 	u32 val;
 
@@ -1464,7 +1464,7 @@ static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct mcde *mcde = to_mcde(drm);
 
 	/* Disable all VBLANK IRQs */
-- 
2.39.2

