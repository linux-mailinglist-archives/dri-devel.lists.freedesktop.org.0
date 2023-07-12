Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB27503C2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4582F10E4B7;
	Wed, 12 Jul 2023 09:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ADD10E3FB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001gY-T2; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-00Dr6v-84; Wed, 12 Jul 2023 11:47:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-004GV6-JC; Wed, 12 Jul 2023 11:47:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>
Subject: [PATCH RFC v1 51/52] drm/xlnx: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:47:01 +0200
Message-Id: <20230712094702.1770121-52-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=JHRZ4fcH9UBW/l5ZUL2HbtKnny+MzFwu5NuITX9kfck=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaRnZKgAfZldZXv47kgfzwidtAge96EN5T5g
 YZHd+RF2oGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52kQAKCRCPgPtYfRL+
 Ts6FB/4kSbq0w/atxXIIkKBG6CBVwHIxF8dKX9Q/PtSmSTj7gZuQe7OWAJpsLLCcyylrZBMjACu
 SBGP965GVr/NRzFLhzA7DE4np5Q/7MdnjZebLA0/dSwpCIjiOovnllxQXWGZNyD8X4G5LK3lwEr
 asBy6I2KsRqecFPxkQOpBi43vIaiQ9oY3nIWQg83P6xORvAaY4OdbJyQKMIT1yIdGcRzh5TAE5c
 556KTg2krPC38nvGaGLjfn2Dy6uMF4FFzUq8TIzVnwJok2cNBnPwbuzcxtKJmdFr+VG6PmEZyH+
 ksf9IX1FhSCLXHcFdLVTWphx61zo302o4zRS89ait71sb+mN
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
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index a7f8611be6f4..ba12efc4b9e4 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -232,12 +232,12 @@ static void zynqmp_dpsub_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 	clk_disable_unprepare(dpsub->vid_clk);
 	pm_runtime_put_sync(dpsub->dev);
@@ -269,9 +269,9 @@ static void zynqmp_dpsub_crtc_atomic_flush(struct drm_crtc *crtc,
 
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		drm_crtc_arm_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 	}
 }
 
-- 
2.39.2

