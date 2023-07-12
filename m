Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6A7503AC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F6D10E42F;
	Wed, 12 Jul 2023 09:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859110E426
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-0001Qf-92; Wed, 12 Jul 2023 11:47:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-00Dr5K-Kc; Wed, 12 Jul 2023 11:47:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-004GTk-JY; Wed, 12 Jul 2023 11:47:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 29/52] drm/pl111: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:39 +0200
Message-Id: <20230712094702.1770121-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3406;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=qG92UlBNaqfzJ56czMioCqflxCinPQ5rTWwjwsKPotA=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpR1ZRU8WWnMJ7g+7prJtkfv3LJdrpv/nze7eObJzVdN/
 3/lnPJo72Q0ZmFg5GKQFVNksW9ck2lVJRfZufbfZZhBrEwgUxi4OAVgIgf72H+zR3Yfv5L8Zvvz
 Gsu1Sb9nWl6LaPSI7TxZsMEpOe4pX9yD3uvsOVYrFQ4sfxfXc9swIjV446tdFyf6l0zP4Fjar2d
 q3/vlbot2jUgxk1DXe6vLc5kyZ36w72LdYdbG8CVm7pt9b7uvLTE9Uhug/LHz1uvsHUsUrjkmNN
 xo7FwlbfOr71CF9kbH3pWrMl98DM6ZUCZgW5IwxyPU55zVGc6c0uvsmbkGASq7I7IfTA+otGxfL
 xqRe3Cz08y4vfuWeB6TkDPgzLfJzDih/KmNUzZ40USxM40CDWzLt9WwF7+8fKFnfe+6B/V6jBs9
 zgU7StnVc7kKcUUJ2Z9cmu8sVcftf+uqTflxoeScucpKAA==
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
 drivers/gpu/drm/pl111/pl111_display.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8..6d16933ff7e5 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -51,7 +51,7 @@ static enum drm_mode_status
 pl111_mode_valid(struct drm_simple_display_pipe *pipe,
 		 const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = pipe->crtc.dev;
+	struct drm_device *drm = pipe->crtc.drm_dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	u32 cpp = DIV_ROUND_UP(priv->variant->fb_depth, 8);
 	u64 bw;
@@ -122,7 +122,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_plane *plane = &pipe->plane;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	const struct drm_display_mode *mode = &cstate->mode;
 	struct drm_framebuffer *fb = plane->state->fb;
@@ -357,7 +357,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	u32 cntl;
 
@@ -390,7 +390,7 @@ static void pl111_display_update(struct drm_simple_display_pipe *pipe,
 				 struct drm_plane_state *old_pstate)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	struct drm_pending_vblank_event *event = crtc->state->event;
 	struct drm_plane *plane = &pipe->plane;
@@ -406,19 +406,19 @@ static void pl111_display_update(struct drm_simple_display_pipe *pipe,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 	}
 }
 
 static int pl111_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
 	writel(CLCD_IRQ_NEXTBASE_UPDATE, priv->regs + priv->ienb);
@@ -429,7 +429,7 @@ static int pl111_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 static void pl111_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
 	writel(0, priv->regs + priv->ienb);
-- 
2.39.2

