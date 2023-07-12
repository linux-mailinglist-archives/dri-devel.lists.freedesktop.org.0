Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BD87503B7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE6F10E4B5;
	Wed, 12 Jul 2023 09:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D08810E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001fn-EY; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-00Dr6j-0q; Wed, 12 Jul 2023 11:47:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-004GUs-3S; Wed, 12 Jul 2023 11:47:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH RFC v1 48/52] drm/vkms: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:58 +0200
Message-Id: <20230712094702.1770121-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=EyM2iPQhDvSPqDEjd9geStTXsdRjOM0xRmDL0b5HYoM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaOfFHENcqS6fm5Q3R16sKBXJ1asWWGsRkp+
 EmsHZ+KKaSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52jgAKCRCPgPtYfRL+
 ToJqB/9FuHWHZRWW6jAGRBCB5p3Xt49pRtXqlL0IpNM9bSbp9dfzee+U275JUWAQZOkvL0t9Et4
 ja7mykuNC/VNso4nSukzia3wv3/R2UGSQ+ltvUBmsQp6NDefF7g2S3VXCs8V5yswsoFevLykGq6
 NMCpYqoP6k6i0XQIE0rgMGUkIT9pBFyI6lxPc6eJQAmkW6Bq4Ulg6TEIR7F5atp/mcuNnrbmtbF
 aQPr2x1ZnTo9Kz/eILOgstLTaaQv0t4sF0AXCzbuwy2o8rRbfEW0Ij9qHf5tbGp89BqkROjvOv4
 BFsUAosP7dLp5fpUcv8YTxuzEwVroaZy73y5lCaJiY5FcMsa
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
Cc: kernel@pengutronix.de, Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 515f6772b866..4935690ec475 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -61,7 +61,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
@@ -87,7 +87,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      int *max_error, ktime_t *vblank_time,
 				      bool in_vblank_irq)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_output *output = &vkmsdev->output;
@@ -190,7 +190,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret < 0)
 		return ret;
 
-	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
+	drm_for_each_plane_mask(plane, crtc->drm_dev, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state,
 								  plane);
 		WARN_ON(!plane_state);
@@ -207,7 +207,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	vkms_state->num_active_planes = i;
 
 	i = 0;
-	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
+	drm_for_each_plane_mask(plane, crtc->drm_dev, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state,
 								  plane);
 
@@ -250,14 +250,14 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
 
 	if (crtc->state->event) {
-		spin_lock(&crtc->dev->event_lock);
+		spin_lock(&crtc->drm_dev->event_lock);
 
 		if (drm_crtc_vblank_get(crtc) != 0)
 			drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		else
 			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
 
-		spin_unlock(&crtc->dev->event_lock);
+		spin_unlock(&crtc->drm_dev->event_lock);
 
 		crtc->state->event = NULL;
 	}
-- 
2.39.2

