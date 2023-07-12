Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B4750384
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0D410E3E3;
	Wed, 12 Jul 2023 09:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7910E3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-0001GA-MN; Wed, 12 Jul 2023 11:47:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR8-00Dr3J-O4; Wed, 12 Jul 2023 11:47:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR7-004GS9-PT; Wed, 12 Jul 2023 11:47:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 04/52] drm/armada: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:14 +0200
Message-Id: <20230712094702.1770121-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=2RSZDS3VzANWyLVdCVf7Z/TLYcQwnDcSkpCOqLkzBo8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZaWmVHX6JudLlUDu95Q2MvmJVSd/Is7LziK
 +pOAy8Iq5iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52WgAKCRCPgPtYfRL+
 TuvrB/wNbHkbzm4UAVbEQfOUoIhsNMkXQ17Emeh6pHK+/3pvOntEYe423Y5peLa0xVCkiHfTchy
 NDKEZ/cunTpNuD4HC+qFB8c0cxTk166iqPzu1RPAEXXUQvY2VtsupwRTQPkwgcq8APImBFDqxSf
 kpn4acENJT7JF9v+6NvkIgy+C401Em8GTyrSiweA8c43niBgPiSK7Xe33nxquOhHgvFFaVdkS9q
 hO8BYQI9yjFruZwrDJq62icjwrKBhfATl/14V2dUCE85/yIbYLBv4sgby1f7/1EhElw/KyGqUJQ
 0XaDR/8UYIS+KQLsRUiTpVcU/gpdhXg92X3WAKpU0D/m4/n4
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
 drivers/gpu/drm/armada/armada_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index 15dd667aa2e7..b6f9b2bdfe8d 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -293,9 +293,9 @@ static void armada_drm_crtc_irq(struct armada_crtc *dcrtc, u32 stat)
 	if (stat & VSYNC_IRQ && !dcrtc->update_pending) {
 		event = xchg(&dcrtc->event, NULL);
 		if (event) {
-			spin_lock(&dcrtc->crtc.dev->event_lock);
+			spin_lock(&dcrtc->crtc.drm_dev->event_lock);
 			drm_crtc_send_vblank_event(&dcrtc->crtc, event);
-			spin_unlock(&dcrtc->crtc.dev->event_lock);
+			spin_unlock(&dcrtc->crtc.drm_dev->event_lock);
 			drm_crtc_vblank_put(&dcrtc->crtc);
 		}
 	}
@@ -502,9 +502,9 @@ static void armada_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 		event = crtc->state->event;
 		crtc->state->event = NULL;
 		if (event) {
-			spin_lock_irq(&crtc->dev->event_lock);
+			spin_lock_irq(&crtc->drm_dev->event_lock);
 			drm_crtc_send_vblank_event(crtc, event);
-			spin_unlock_irq(&crtc->dev->event_lock);
+			spin_unlock_irq(&crtc->drm_dev->event_lock);
 		}
 	}
 }
@@ -766,7 +766,7 @@ static int armada_drm_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 static void armada_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct armada_crtc *dcrtc = drm_to_armada_crtc(crtc);
-	struct armada_private *priv = drm_to_armada_dev(crtc->dev);
+	struct armada_private *priv = drm_to_armada_dev(crtc->drm_dev);
 
 	if (dcrtc->cursor_obj)
 		drm_gem_object_put(&dcrtc->cursor_obj->obj);
-- 
2.39.2

