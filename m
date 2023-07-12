Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38697503AA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE8E10E467;
	Wed, 12 Jul 2023 09:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618E010E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001Lq-RO; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-00Dr4c-11; Wed, 12 Jul 2023 11:47:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-004GTG-9b; Wed, 12 Jul 2023 11:47:09 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH RFC v1 22/52] drm/meson: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:32 +0200
Message-Id: <20230712094702.1770121-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=T9q2HXZEW7FDLneroBJCnnqx5xfQev4NtPEI3hay5+I=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZv8rVAP69vqAp1qjsT4fg5haYABwGWUz6Ao
 h5s7UcAOKmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52bwAKCRCPgPtYfRL+
 TvsTB/9CXW6h33zDZLUa1e98TE1WPSWIXhTswX02ruQ/rLzZktJf/hnFPzNO43FOy2fjkv0l1HO
 cU5VRVSWZQk2ztfY3LFXO8O9DZPXMV9IKA6kxeguJ1yDZg8FXXOoj/+hJsTaL4PdC8akazeherg
 Ssr4gPTR0MHv5wJzy7d23opoyp7QBAGdqZQAWk0gb94QhvP8x3U5cRtFO86itZV0M36SywlRWPz
 UdvWkkrZJD/GKO+1Z+Vtx02KB8T0lNNnrNGsT5LRZk4aSIs4iBPqxEAM2am0J/6e38yi/e0W3FD
 frVNciYnTeGg33lmrhgc/J9WpdszEt1vjDEkb9FMp6X6N62C
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/meson/meson_crtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index d70616da8ce2..4bc082e45ed1 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -162,9 +162,9 @@ static void meson_g12a_crtc_atomic_disable(struct drm_crtc *crtc,
 	priv->viu.vd1_commit = false;
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -192,9 +192,9 @@ static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
 			    priv->io_base + _REG(VPP_MISC));
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -209,9 +209,9 @@ static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
 	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 		meson_crtc->event = crtc->state->event;
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 		crtc->state->event = NULL;
 	}
 }
-- 
2.39.2

