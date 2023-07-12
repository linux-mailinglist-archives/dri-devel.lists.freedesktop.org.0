Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B494750392
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2FE10E426;
	Wed, 12 Jul 2023 09:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBA310E3FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-0001P4-ND; Wed, 12 Jul 2023 11:47:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-00Dr5D-8a; Wed, 12 Jul 2023 11:47:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-004GTT-Pv; Wed, 12 Jul 2023 11:47:09 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH RFC v1 25/52] drm/mxsfb: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:35 +0200
Message-Id: <20230712094702.1770121-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7036;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=gpt+F9kS0s64hluoVlrA9JcpD5SE/+Zxz3kgGt3VTVY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZz0y9qsY+x8ichJJa50pU3MRevcAeD+hhQg
 H2MJl0558uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52cwAKCRCPgPtYfRL+
 TrvuB/4uwleiXcbsG1xK1cWxATOia/1jfvB+RKSQYe05Avpo2j3DcspArkjM2/7u3l2TZE8klAY
 BKFyiWXMlJKBtJRrfni6VOn6sjoan23DosDlYd0UnvkeMgwy5v6XP3nfLUiIVRMJU1fmRR/b5wg
 CZEUopA04UoiNr3O5d6rHa5telAQ6906hoko/hw88F72r1L3xEOuUweHgfUP+EBt9/FkREk0Num
 3gMANz1t3Yb+RbAtCyu4QDEWQmYMuowVOiJLHzIq1AEcxZlnuTESC85htMsLnl/L6vp2N4F7gz/
 tdGrJoxFLtrSvOKWd5XTcLCRCarEkxW4KxtpGLnysCUxpBGi
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
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 18 +++++++++---------
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 16 ++++++++--------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 2541d2de4e45..28353ad09119 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -402,7 +402,7 @@ static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state *crtc_state,
 				     struct drm_plane_state *plane_state)
 {
 	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
-	struct drm_device *drm = crtc_state->crtc->dev;
+	struct drm_device *drm = crtc_state->crtc->drm_dev;
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
 	struct drm_display_mode *m = &crtc_state->adjusted_mode;
 
@@ -424,7 +424,7 @@ static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state *crtc_state,
 static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
 	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
@@ -505,7 +505,7 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm_dev);
 	struct drm_pending_vblank_event *event;
 	u32 reg;
 
@@ -519,18 +519,18 @@ static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (!event)
 		return;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (drm_crtc_vblank_get(crtc) == 0)
 		drm_crtc_arm_vblank_event(crtc, event);
 	else
 		drm_crtc_send_vblank_event(crtc, event);
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm_dev);
 	struct drm_crtc_state *new_cstate = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    crtc->primary);
@@ -560,7 +560,7 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm_dev);
 	struct drm_device *drm = lcdif->drm;
 	struct drm_pending_vblank_event *event;
 
@@ -623,7 +623,7 @@ lcdif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 
 static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm_dev);
 
 	/* Clear and enable VBLANK IRQ */
 	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + LCDC_V8_INT_STATUS_D0);
@@ -634,7 +634,7 @@ static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void lcdif_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm_dev);
 
 	/* Disable and clear VBLANK IRQ */
 	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D0);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 3bcc9c0f2019..934529b785ff 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -279,7 +279,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 				     struct drm_bridge_state *bridge_state,
 				     const u32 bus_format)
 {
-	struct drm_device *drm = mxsfb->crtc.dev;
+	struct drm_device *drm = mxsfb->crtc.drm_dev;
 	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
 	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
 	int err;
@@ -335,18 +335,18 @@ static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (!event)
 		return;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	if (drm_crtc_vblank_get(crtc) == 0)
 		drm_crtc_arm_vblank_event(crtc, event);
 	else
 		drm_crtc_send_vblank_event(crtc, event);
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 }
 
 static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->drm_dev);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    crtc->primary);
 	struct drm_bridge_state *bridge_state = NULL;
@@ -400,7 +400,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->drm_dev);
 	struct drm_device *drm = mxsfb->drm;
 	struct drm_pending_vblank_event *event;
 
@@ -422,7 +422,7 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 
 static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->drm_dev);
 
 	/* Clear and enable VBLANK IRQ */
 	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
@@ -433,7 +433,7 @@ static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void mxsfb_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->drm_dev);
 
 	/* Disable and clear VBLANK IRQ */
 	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
@@ -447,7 +447,7 @@ static int mxsfb_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
 	if (!crtc)
 		return -ENODEV;
 
-	mxsfb = to_mxsfb_drm_private(crtc->dev);
+	mxsfb = to_mxsfb_drm_private(crtc->drm_dev);
 
 	if (source && strcmp(source, "auto") == 0)
 		mxsfb->crc_active = true;
-- 
2.39.2

