Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D825750394
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D51F10E3EC;
	Wed, 12 Jul 2023 09:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD2F10E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001gi-MR; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-00Dr6z-B1; Wed, 12 Jul 2023 11:47:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-004GV2-E6; Wed, 12 Jul 2023 11:47:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 50/52] drm/xen: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:47:00 +0200
Message-Id: <20230712094702.1770121-51-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=4JQln/Shv9usfMfN5P2qRiulxlrxKajP/CdCtAPx/7U=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaQzs1+wM39L5Obw+FywgTwC3eOlZMVvXLLy
 L6tpeE2RweJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52kAAKCRCPgPtYfRL+
 Tn/YCACCUWng2jWALKbLH4qxPQvGq5Z/APgLNJrfFTJf8vPpxFtMWv/NLsAXpOspDsvDwQs5snR
 PdDagtck9c/rTw5xkc+FR+kyX1c9zr7/qsl6eXXc8N/NzGpND7wHNlx/sDt2Vzu8luds3CGgUih
 AZxR1FBnBrPHlbM+2B5QqfEcACftPs8BOtUmklcZ7frvRl6e/eYmJfZMcROhue4NE3DQkWj+m5O
 0HYPqP2HQoIZ1z2TO/0hHUA2CZJqg6B3l45aokWGHUGnZO1NB5dLVJsp0iTl1OXiPVDM6/rfLiA
 sTf3BoRj+yGkLCfOIj5lz3iyYh0Vl9STjCw0VlnEQyi0Ulxd
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
Cc: xen-devel@lists.xenproject.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index dfa78a49a6d9..72042139b73a 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -93,7 +93,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 {
 	struct drm_crtc *crtc = &pipeline->pipe.crtc;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -113,7 +113,7 @@ static void display_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = plane_state->fb;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx))
 		return;
 
 	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
@@ -135,7 +135,7 @@ static void display_disable(struct drm_simple_display_pipe *pipe)
 			to_xen_drm_pipeline(pipe);
 	int ret = 0, idx;
 
-	if (drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (drm_dev_enter(pipe->crtc.drm_dev, &idx)) {
 		ret = xen_drm_front_mode_set(pipeline, 0, 0, 0, 0, 0,
 					     xen_drm_front_fb_to_cookie(NULL));
 		drm_dev_exit(idx);
@@ -251,7 +251,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 
 	event = crtc->state->event;
 	if (event) {
-		struct drm_device *dev = crtc->dev;
+		struct drm_device *dev = crtc->drm_dev;
 		unsigned long flags;
 
 		WARN_ON(pipeline->pending_event);
@@ -263,7 +263,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (!drm_dev_enter(pipe->crtc.drm_dev, &idx)) {
 		send_pending_event(pipeline);
 		return;
 	}
-- 
2.39.2

