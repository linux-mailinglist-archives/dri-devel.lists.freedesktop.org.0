Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D005B7503A6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC3310E4A9;
	Wed, 12 Jul 2023 09:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A469410E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-0001dP-LS; Wed, 12 Jul 2023 11:47:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-00Dr6D-7q; Wed, 12 Jul 2023 11:47:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-004GUC-W0; Wed, 12 Jul 2023 11:47:12 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 36/52] drm/sti: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:46 +0200
Message-Id: <20230712094702.1770121-37-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2871;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=koJLNYUccdG9oI/UKZpuBnJnpUsjCyVm3iJwa43osFM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaAN8BWpKWnCSjZnBqIMh2ocME/CDUVRsO44
 7zsxzb3mcmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52gAAKCRCPgPtYfRL+
 Tnh1B/9BBjumO2MmVyIKEdzaMnAgTk7uGK5vLtmworJiG2Vk0+g6UAh4Ag7DcCubp69+KJW72kJ
 eGFmIdRs7VIjl0BXjyuG5/lO7/xuxY92ffiyBTfHm9r7i3Oiv1lYCBKwX6Oglwhp7kh5WLhmkFD
 xyD54qlMx8lJiMEak4XCuiyJXdZHpiJj/lo10mXgCf0EaeaduLyNOb0vIe1GC7tAluXJ+Kgvlje
 EaSpgn16ERR7polTTZOZhq6P/P/VqodAhmaORhAxxWySCDPeHuj6Ux1zCYfsEPFadSbA47IHcmf
 YG8E4KZALcNxRntqec7tY0GENi0wwfsBnypk+uw66zbtGy/i
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
 drivers/gpu/drm/sti/sti_crtc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 3c7154f2d5f3..ce648439d0a3 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -134,7 +134,7 @@ sti_crtc_mode_set_nofb(struct drm_crtc *crtc)
 static void sti_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct sti_mixer *mixer = to_sti_mixer(crtc);
 	struct sti_compositor *compo = dev_get_drvdata(mixer->dev);
 	struct drm_plane *p;
@@ -209,12 +209,12 @@ static void sti_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 	}
 }
 
@@ -264,7 +264,7 @@ int sti_crtc_vblank_cb(struct notifier_block *nb,
 
 		/* Disable mixer only if all overlay planes (GDP and VDP)
 		 * are disabled */
-		list_for_each_entry(p, &crtc->dev->mode_config.plane_list,
+		list_for_each_entry(p, &crtc->drm_dev->mode_config.plane_list,
 				    head) {
 			struct sti_plane *plane = to_sti_plane(p);
 
@@ -280,7 +280,7 @@ int sti_crtc_vblank_cb(struct notifier_block *nb,
 
 static int sti_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct sti_private *dev_priv = dev->dev_private;
 	struct sti_compositor *compo = dev_priv->compo;
@@ -299,7 +299,7 @@ static int sti_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void sti_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct sti_private *priv = drm_dev->dev_private;
 	struct sti_compositor *compo = priv->compo;
@@ -318,7 +318,7 @@ static int sti_crtc_late_register(struct drm_crtc *crtc)
 	struct sti_compositor *compo = dev_get_drvdata(mixer->dev);
 
 	if (drm_crtc_index(crtc) == 0)
-		sti_compositor_debugfs_init(compo, crtc->dev->primary);
+		sti_compositor_debugfs_init(compo, crtc->drm_dev->primary);
 
 	return 0;
 }
-- 
2.39.2

