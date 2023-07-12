Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A837503B6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF6610E4B0;
	Wed, 12 Jul 2023 09:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A8A10E42E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-0001Gi-P6; Wed, 12 Jul 2023 11:47:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-00Dr3h-QN; Wed, 12 Jul 2023 11:47:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR8-004GSP-I1; Wed, 12 Jul 2023 11:47:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH RFC v1 08/52] drm/atmel-hlcdc: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:18 +0200
Message-Id: <20230712094702.1770121-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2475;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=G9EAxie1ecF7yyh5SQzDSGkDZ+j/lRyi3cgilOj0dqc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZfjHrlIHLBHWTZaQQTkgNk5HmvpjyWUdQs1
 5SHocd0ec+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52XwAKCRCPgPtYfRL+
 TullCACyF4Bf+/dfg+BX3SFun0vlI/BLyKd5lhz3y/bqt/cvx5SiDyGCPgYnQsTMi7I/NmjgMS7
 vun/Sx9LWOLOXVLrSWmEjY7wdlMdt0BQhiXTM76yKWZjIl+Os2/L9ByLsKWKQqJFZBSSn2G+L0I
 4xOHH6lwyQaozk3Uz9DK4PoPrXAwf8W+FvpeCYPBngaJrWAxTKq92XJMAKNmqU7QnO3OVQeluHe
 TDi+iwFigYyz1xMt37we5jRbdYq2xqEAaQtj0i4zhCoYJIvQCbbNWQoV3ILfcSCM0Hj0mWaA0mK
 M3kCIZjiNvCep84Q8xnNt9GpQkZbUK0gpq4w88kCgWs9D9tq
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 58184cd6ab0b..40573991568d 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -168,7 +168,7 @@ atmel_hlcdc_crtc_mode_valid(struct drm_crtc *c,
 static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 					    struct drm_atomic_state *state)
 {
-	struct drm_device *dev = c->dev;
+	struct drm_device *dev = c->drm_dev;
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
 	struct regmap *regmap = crtc->dc->hlcdc->regmap;
 	unsigned int status;
@@ -203,7 +203,7 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 					   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = c->dev;
+	struct drm_device *dev = c->drm_dev;
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
 	struct regmap *regmap = crtc->dc->hlcdc->regmap;
 	unsigned int status;
@@ -353,7 +353,7 @@ static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *c,
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
 	unsigned long flags;
 
-	spin_lock_irqsave(&c->dev->event_lock, flags);
+	spin_lock_irqsave(&c->drm_dev->event_lock, flags);
 
 	if (c->state->event) {
 		c->state->event->pipe = drm_crtc_index(c);
@@ -363,7 +363,7 @@ static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *c,
 		crtc->event = c->state->event;
 		c->state->event = NULL;
 	}
-	spin_unlock_irqrestore(&c->dev->event_lock, flags);
+	spin_unlock_irqrestore(&c->drm_dev->event_lock, flags);
 }
 
 static const struct drm_crtc_helper_funcs lcdc_crtc_helper_funcs = {
@@ -386,7 +386,7 @@ static void atmel_hlcdc_crtc_destroy(struct drm_crtc *c)
 
 static void atmel_hlcdc_crtc_finish_page_flip(struct atmel_hlcdc_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
-- 
2.39.2

