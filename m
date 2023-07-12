Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09187503C3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F34E10E4C3;
	Wed, 12 Jul 2023 09:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4BA10E431
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-0001H2-7W; Wed, 12 Jul 2023 11:47:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-00Dr3q-Dl; Wed, 12 Jul 2023 11:47:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-004GSg-Em; Wed, 12 Jul 2023 11:47:07 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH RFC v1 13/52] drm/hisilicon: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:23 +0200
Message-Id: <20230712094702.1770121-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4765;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=yfAW/Re6ZRnsBjQHToIDsKvGnWBEBa1UC/jDC3vR1u8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZl9DcFgoiWuOaTLVNT1EZTRfFPsJRfdSwx4
 2xj6YPwmSGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52ZQAKCRCPgPtYfRL+
 TheuB/9tLvDo7XPwRGOj3imtjE62ITItnYrMMHJSZZdNSSWrjEG065eb9xT3DP3IEnIt02VAu4U
 IhU7jAzuZIJ/kNgaaspLVq1UuvrIx10DmxNxwYiE+QT4SYTNkZUw5CnS5fnwIYt3xiqnP+d1FI2
 lZIlBGvOuCS7pQlQJZSl5WK8hv3Mt7Jwcko96XYgLXMKR8gf1rJugsqTznnhdejAYcwxM/ia+cV
 JIniw7e4mUKkkpx+ZXg3KAyEOks5QR+ZuUHAcLWUmmf68dr2tlPSsZYdBhpDtcXYMwgXHZCCegY
 1AK0TvvsW7wXhK4GzJTkdv5KuPtx8rXNH1/rbasvSVrGqWE2
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
Cc: dri-devel@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, John Stultz <jstultz@google.com>,
 kernel@pengutronix.de, Yongqin Liu <yongqin.liu@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 20 +++++++++----------
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 89bed78f1466..4682b17fc5ff 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -159,7 +159,7 @@ static const struct drm_plane_helper_funcs hibmc_plane_helper_funcs = {
 
 static void hibmc_crtc_dpms(struct drm_crtc *crtc, u32 dpms)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm_dev);
 	u32 reg;
 
 	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
@@ -175,7 +175,7 @@ static void hibmc_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	u32 reg;
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm_dev);
 
 	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
 
@@ -194,7 +194,7 @@ static void hibmc_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
 	u32 reg;
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm_dev);
 
 	hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_OFF);
 	drm_crtc_vblank_off(crtc);
@@ -361,7 +361,7 @@ static void hibmc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	u32 val;
 	struct drm_display_mode *mode = &crtc->state->mode;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	u32 width = mode->hsync_end - mode->hsync_start;
 	u32 height = mode->vsync_end - mode->vsync_start;
@@ -395,7 +395,7 @@ static void hibmc_crtc_atomic_begin(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
 	u32 reg;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 
 	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
@@ -417,16 +417,16 @@ static void hibmc_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 	if (crtc->state->event)
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 	crtc->state->event = NULL;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 }
 
 static int hibmc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm_dev);
 
 	writel(HIBMC_RAW_INTERRUPT_EN_VBLANK(1),
 	       priv->mmio + HIBMC_RAW_INTERRUPT_EN);
@@ -436,7 +436,7 @@ static int hibmc_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void hibmc_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm_dev);
 
 	writel(HIBMC_RAW_INTERRUPT_EN_VBLANK(0),
 	       priv->mmio + HIBMC_RAW_INTERRUPT_EN);
@@ -444,7 +444,7 @@ static void hibmc_crtc_disable_vblank(struct drm_crtc *crtc)
 
 static void hibmc_crtc_load_lut(struct drm_crtc *crtc)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm_dev);
 	void __iomem   *mmio = priv->mmio;
 	u16 *r, *g, *b;
 	u32 reg;
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 871f79a6b17e..a3cfae5d17dd 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -516,12 +516,12 @@ static void ade_crtc_atomic_flush(struct drm_crtc *crtc,
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
 
-- 
2.39.2

