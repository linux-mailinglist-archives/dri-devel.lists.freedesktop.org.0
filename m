Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B87503A4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAAE10E42C;
	Wed, 12 Jul 2023 09:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9232A10E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001Lj-Sp; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-00Dr4a-W4; Wed, 12 Jul 2023 11:47:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-004GT5-QC; Wed, 12 Jul 2023 11:47:08 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 19/52] drm/logicvc: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:29 +0200
Message-Id: <20230712094702.1770121-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2955;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=qNX6nz5zZaZq49UrDlkMHAcXbkXA3LXsx9rDDhvGnnw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZstHr6DeXEiqOLjtIZ5mplErAm9nYI3u1fo
 7e/2dGDn4+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52bAAKCRCPgPtYfRL+
 Tt3MB/0ZqPeuiTXbR+7Ym5ECbBWLJJW6w+2nk/JYLw7ih/W8JJb/LN2HZRlbZ9EpgQNHqSizZwo
 Jzs/+rA1WaVJfAKZePuUXKN1rG9NoEB2nPrgCj3/5oTNKvgmmdtYzFfPOhUxclRSTLyj4qX0IsR
 /i8pe7nWMd/TMCc6HM59Amcwmp59YjultF5z08at5jeZ8GvkXK0KvnbuYV/NO0JR+R105tz3GPp
 vjndE299gqlq4CYhjj6BlR5chSZcbVVfz86PtIcVaTx4jDHGhPxMfV5TgXz/NsmeCAMbsjUWoMV
 Fc/Y7To71yAPQm7TVvaUuBpB9WJXKkH3rBKHypRCYyBL9wol
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
 drivers/gpu/drm/logicvc/logicvc_crtc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.c b/drivers/gpu/drm/logicvc/logicvc_crtc.c
index 43a675d03808..e7e65381ab6f 100644
--- a/drivers/gpu/drm/logicvc/logicvc_crtc.c
+++ b/drivers/gpu/drm/logicvc/logicvc_crtc.c
@@ -41,7 +41,7 @@ static void logicvc_crtc_atomic_begin(struct drm_crtc *drm_crtc,
 	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
 	struct drm_crtc_state *old_state =
 		drm_atomic_get_old_crtc_state(state, drm_crtc);
-	struct drm_device *drm_dev = drm_crtc->dev;
+	struct drm_device *drm_dev = drm_crtc->drm_dev;
 	unsigned long flags;
 
 	/*
@@ -63,14 +63,14 @@ static void logicvc_crtc_atomic_enable(struct drm_crtc *drm_crtc,
 				       struct drm_atomic_state *state)
 {
 	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
-	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->drm_dev);
 	struct drm_crtc_state *old_state =
 		drm_atomic_get_old_crtc_state(state, drm_crtc);
 	struct drm_crtc_state *new_state =
 		drm_atomic_get_new_crtc_state(state, drm_crtc);
 	struct drm_display_mode *mode = &new_state->adjusted_mode;
 
-	struct drm_device *drm_dev = drm_crtc->dev;
+	struct drm_device *drm_dev = drm_crtc->drm_dev;
 	unsigned int hact, hfp, hsl, hbp;
 	unsigned int vact, vfp, vsl, vbp;
 	unsigned long flags;
@@ -152,8 +152,8 @@ static void logicvc_crtc_atomic_enable(struct drm_crtc *drm_crtc,
 static void logicvc_crtc_atomic_disable(struct drm_crtc *drm_crtc,
 					struct drm_atomic_state *state)
 {
-	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
-	struct drm_device *drm_dev = drm_crtc->dev;
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->drm_dev);
+	struct drm_device *drm_dev = drm_crtc->drm_dev;
 
 	drm_crtc_vblank_off(drm_crtc);
 
@@ -190,7 +190,7 @@ static const struct drm_crtc_helper_funcs logicvc_crtc_helper_funcs = {
 
 static int logicvc_crtc_enable_vblank(struct drm_crtc *drm_crtc)
 {
-	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->drm_dev);
 
 	/* Clear any pending V_SYNC interrupt. */
 	regmap_write_bits(logicvc->regmap, LOGICVC_INT_STAT_REG,
@@ -205,7 +205,7 @@ static int logicvc_crtc_enable_vblank(struct drm_crtc *drm_crtc)
 
 static void logicvc_crtc_disable_vblank(struct drm_crtc *drm_crtc)
 {
-	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->drm_dev);
 
 	/* Mask V_SYNC interrupt. */
 	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
-- 
2.39.2

