Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B507E750381
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E783F10E3DE;
	Wed, 12 Jul 2023 09:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5543910E3DE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-0001GZ-Bd; Wed, 12 Jul 2023 11:47:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-00Dr3W-Du; Wed, 12 Jul 2023 11:47:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR8-004GSF-0k; Wed, 12 Jul 2023 11:47:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 05/52] drm/arm: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:15 +0200
Message-Id: <20230712094702.1770121-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8050;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=sd+exg70aJOgrWULjMNLCgbQjwTVrVq+7B6qHJ2WeiY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZcc/Ci4J4Tk1ggrOFA63QJxsn2Unux3rgF1
 AAoiSdm1yKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52XAAKCRCPgPtYfRL+
 TpmmB/4rbT8SD2jrmFgRrXQdNNwl9ePV1GeGzdxe/sbXLfujeAyDQltPDnq8yvbiIqpRLcJ1f8t
 PQWpgXU7PewqXsft+HwSSMw8FZgSCMbN+RyYINiXl2p9/2fd2Dbhydf7CqiZ2+VQAGb/Zqnhuob
 Q7sR6Mdeb8iqYJBlr5hfInU9braEmu2722Jw2R75vTlxBA5GktPGX8BHgre0bFc3ybjHfq68kQK
 hK7kExTdjSuR9UFNrJtCOwlCcGXbI8oSzIMm+cnjHrnRp8so0F1ORPuyH4CxUKdhW6TOZvK5XYh
 upVyUaPHO0YWWotZlc7BKkjGA3+fQxGVdPhmIQISOgPY/ZPs
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
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 24 +++++++++----------
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  2 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c              |  4 ++--
 drivers/gpu/drm/arm/malidp_crtc.c             |  7 +++---
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index cea3fd5772b5..7055505818a8 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -108,7 +108,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
 static int
 komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 {
-	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
+	struct komeda_dev *mdev = kcrtc->base.drm_dev->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	struct komeda_crtc_state *kcrtc_st = to_kcrtc_st(kcrtc->base.state);
 	struct drm_display_mode *mode = &kcrtc_st->base.adjusted_mode;
@@ -161,7 +161,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 static int
 komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
 {
-	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
+	struct komeda_dev *mdev = kcrtc->base.drm_dev->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	u32 new_mode;
 	int err;
@@ -220,7 +220,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 		unsigned long flags;
 		struct drm_pending_vblank_event *event;
 
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 		if (kcrtc->disable_done) {
 			complete_all(kcrtc->disable_done);
 			kcrtc->disable_done = NULL;
@@ -236,7 +236,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 			DRM_WARN("CRTC[%d]: FLIP happened but no pending commit.\n",
 				 drm_crtc_index(&kcrtc->base));
 		}
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 	}
 }
 
@@ -246,7 +246,7 @@ komeda_crtc_do_flush(struct drm_crtc *crtc,
 {
 	struct komeda_crtc *kcrtc = to_kcrtc(crtc);
 	struct komeda_crtc_state *kcrtc_st = to_kcrtc_st(crtc->state);
-	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
+	struct komeda_dev *mdev = kcrtc->base.drm_dev->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	struct komeda_pipeline *slave = kcrtc->slave;
 	struct komeda_wb_connector *wb_conn = kcrtc->wb_conn;
@@ -277,7 +277,7 @@ komeda_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *old = drm_atomic_get_old_crtc_state(state,
 								   crtc);
-	pm_runtime_get_sync(crtc->dev->dev);
+	pm_runtime_get_sync(crtc->drm_dev->dev);
 	komeda_crtc_prepare(to_kcrtc(crtc));
 	drm_crtc_vblank_on(crtc);
 	WARN_ON(drm_crtc_vblank_get(crtc));
@@ -288,7 +288,7 @@ void
 komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 					 struct completion *input_flip_done)
 {
-	struct drm_device *drm = kcrtc->base.dev;
+	struct drm_device *drm = kcrtc->base.drm_dev;
 	struct komeda_dev *mdev = kcrtc->master->mdev;
 	struct completion *flip_done;
 	struct completion temp;
@@ -378,7 +378,7 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_put(crtc);
 	drm_crtc_vblank_off(crtc);
 	komeda_crtc_unprepare(kcrtc);
-	pm_runtime_put(crtc->dev->dev);
+	pm_runtime_put(crtc->drm_dev->dev);
 }
 
 static void
@@ -414,7 +414,7 @@ komeda_calc_min_aclk_rate(struct komeda_crtc *kcrtc,
 unsigned long komeda_crtc_get_aclk(struct komeda_crtc_state *kcrtc_st)
 {
 	struct drm_crtc *crtc = kcrtc_st->base.crtc;
-	struct komeda_dev *mdev = crtc->dev->dev_private;
+	struct komeda_dev *mdev = crtc->drm_dev->dev_private;
 	unsigned long pxlclk = kcrtc_st->base.adjusted_mode.crtc_clock * 1000;
 	unsigned long min_aclk;
 
@@ -426,7 +426,7 @@ unsigned long komeda_crtc_get_aclk(struct komeda_crtc_state *kcrtc_st)
 static enum drm_mode_status
 komeda_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *m)
 {
-	struct komeda_dev *mdev = crtc->dev->dev_private;
+	struct komeda_dev *mdev = crtc->drm_dev->dev_private;
 	struct komeda_crtc *kcrtc = to_kcrtc(crtc);
 	struct komeda_pipeline *master = kcrtc->master;
 	unsigned long min_pxlclk, min_aclk;
@@ -532,7 +532,7 @@ static void komeda_crtc_atomic_destroy_state(struct drm_crtc *crtc,
 
 static int komeda_crtc_vblank_enable(struct drm_crtc *crtc)
 {
-	struct komeda_dev *mdev = crtc->dev->dev_private;
+	struct komeda_dev *mdev = crtc->drm_dev->dev_private;
 	struct komeda_crtc *kcrtc = to_kcrtc(crtc);
 
 	mdev->funcs->on_off_vblank(mdev, kcrtc->master->id, true);
@@ -541,7 +541,7 @@ static int komeda_crtc_vblank_enable(struct drm_crtc *crtc)
 
 static void komeda_crtc_vblank_disable(struct drm_crtc *crtc)
 {
-	struct komeda_dev *mdev = crtc->dev->dev_private;
+	struct komeda_dev *mdev = crtc->drm_dev->dev_private;
 	struct komeda_crtc *kcrtc = to_kcrtc(crtc);
 
 	mdev->funcs->on_off_vblank(mdev, kcrtc->master->id, false);
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 62dc64550793..2a5fd5d8e524 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -168,7 +168,7 @@ static int komeda_crtc_normalize_zpos(struct drm_crtc *crtc,
 	INIT_LIST_HEAD(&zorder_list);
 
 	/* This loop also added all effected planes into the new state */
-	drm_for_each_plane_mask(plane, crtc->dev, crtc_st->plane_mask) {
+	drm_for_each_plane_mask(plane, crtc->drm_dev, crtc_st->plane_mask) {
 		plane_st = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_st))
 			return PTR_ERR(plane_st);
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 3cfefadc7c9d..a1515516fe8b 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -211,12 +211,12 @@ static void hdlcd_crtc_atomic_begin(struct drm_crtc *crtc,
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
 
diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index dc01c43f6193..63761b0b79ec 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -52,7 +52,7 @@ static void malidp_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct videomode vm;
-	int err = pm_runtime_get_sync(crtc->dev->dev);
+	int err = pm_runtime_get_sync(crtc->drm_dev->dev);
 
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to enable runtime power management: %d\n", err);
@@ -87,7 +87,7 @@ static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	clk_disable_unprepare(hwdev->pxlclk);
 
-	err = pm_runtime_put(crtc->dev->dev);
+	err = pm_runtime_put(crtc->drm_dev->dev);
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to disable runtime power management: %d\n", err);
 	}
@@ -186,7 +186,8 @@ static int malidp_crtc_atomic_check_gamma(struct drm_crtc *crtc,
 		 * changing the gamma LUT doesn't depend on any external
 		 * resources, it is safe to call it only once.
 		 */
-		ret = drm_atomic_helper_check_modeset(crtc->dev, state->state);
+		ret = drm_atomic_helper_check_modeset(crtc->drm_dev,
+						      state->state);
 		if (ret)
 			return ret;
 	}
-- 
2.39.2

