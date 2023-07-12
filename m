Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8997503A7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8655610E4A4;
	Wed, 12 Jul 2023 09:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A0610E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001ed-1L; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-00Dr6M-HS; Wed, 12 Jul 2023 11:47:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRE-004GUS-ML; Wed, 12 Jul 2023 11:47:12 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 40/52] drm/tidss: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:50 +0200
Message-Id: <20230712094702.1770121-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4857;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=b2rlkeqp1bX9iOG2ZlwCT2i3BIrrDXXjZqrvU77ekdw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaEzahLUOX6J8ZYCYzzGazR035THfQj03jnL
 gg+tjeSueOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52hAAKCRCPgPtYfRL+
 TjxiB/0QFfpjDRoKqyI1Oh/4ZAA0blN7jRYLeFbXPYP2NT4kPYMztoSiFZjYKYDmVqT3ySee2qj
 r3CsRXbwcH0p+QPyxvG6Qh/dDbh+4eQQ9ssa0VIYxd61ottCF9KK9KfO0r4VUT6fTFNH/T6xaMY
 jshGMODI26hI5NWcDfY5a2TWgDkHALeos1vROWxqACIuND7AuRIEAnK93CYju5PwvkKVj0wuaXH
 WRh7Tt85P/Ya5MFq/iM0DwqICpDj3BTZK+QQJnPFgGW/tPhf1MRAB5jFBMxLagyWNya03Oo1iZN
 SYpXpV6qh9asGOCde5/Q9ITYRo9nB9/+e+vwvGn92pP06Ozz
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
 drivers/gpu/drm/tidss/tidss_crtc.c | 19 ++++++++++---------
 drivers/gpu/drm/tidss/tidss_irq.c  |  4 ++--
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 5e5e466f35d1..d3399d6ca5e5 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -20,7 +20,7 @@
 
 static void tidss_crtc_finish_page_flip(struct tidss_crtc *tcrtc)
 {
-	struct drm_device *ddev = tcrtc->crtc.dev;
+	struct drm_device *ddev = tcrtc->crtc.drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct drm_pending_vblank_event *event;
 	unsigned long flags;
@@ -75,7 +75,8 @@ void tidss_crtc_error_irq(struct drm_crtc *crtc, u64 irqstatus)
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 
-	dev_err_ratelimited(crtc->dev->dev, "CRTC%u SYNC LOST: (irq %llx)\n",
+	dev_err_ratelimited(crtc->drm_dev->dev,
+			    "CRTC%u SYNC LOST: (irq %llx)\n",
 			    tcrtc->hw_videoport, irqstatus);
 }
 
@@ -86,7 +87,7 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct dispc_device *dispc = tidss->dispc;
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
@@ -165,7 +166,7 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
 									      crtc);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
 
@@ -218,7 +219,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
 									 crtc);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	unsigned long flags;
@@ -261,7 +262,7 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
 
@@ -297,7 +298,7 @@ enum drm_mode_status tidss_crtc_mode_valid(struct drm_crtc *crtc,
 					   const struct drm_display_mode *mode)
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 
 	return dispc_vp_mode_valid(tidss->dispc, tcrtc->hw_videoport, mode);
@@ -316,7 +317,7 @@ static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs = {
 
 static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
@@ -330,7 +331,7 @@ static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void tidss_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 0c681c7600bc..a30964e02a57 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -25,7 +25,7 @@ static void tidss_irq_update(struct tidss_device *tidss)
 
 void tidss_irq_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	u32 hw_videoport = tcrtc->hw_videoport;
@@ -40,7 +40,7 @@ void tidss_irq_enable_vblank(struct drm_crtc *crtc)
 
 void tidss_irq_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm_dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	u32 hw_videoport = tcrtc->hw_videoport;
-- 
2.39.2

