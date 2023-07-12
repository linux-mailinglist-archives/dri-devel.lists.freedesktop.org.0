Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307477503BB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9887910E4BD;
	Wed, 12 Jul 2023 09:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE9910E45E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001fH-9X; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-00Dr6Z-RW; Wed, 12 Jul 2023 11:47:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-004GUo-SL; Wed, 12 Jul 2023 11:47:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 47/52] drm/virtio: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:57 +0200
Message-Id: <20230712094702.1770121-48-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ngGezo9nbeXWq8tEIHb3F37bQ6emLk1+9aHWzHZdljU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaMMQ6SOp8SYl2+I2YuyFiHoQw/dQJRuzFk1
 JxmhNvIybuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52jAAKCRCPgPtYfRL+
 Tp3oCACGqvj0VL84uZ7tVxHNyKgnFak7QRXEU1gMpw2M3CU/rcHX3MbSwa6LE1cmivVU4/8PHKp
 bLBSHV3WqYbr8NIBhXTIHk677Fm76YWVVx12eVR4Fvk0xZgaQXwya0v8FYZ5VK8xMzj+3xHmXAA
 sqqH7wS7A1frZ2i8gbZQaqbW4PhoVc18gZVSDQ0V2gJ6RX+OgkwLP/kKFJ5Pslrl/ruKccMGIwW
 TI+dnnuh4QmSDnQg7q8VVszP+5F4XjRPB1cSv35utplpmpJ1QfOejwrLYQN5i6ZZg/xgRLAtcLV
 JpJimuHWO3HcmVvqCpqeBQRyI06rN1FFXbtviM4WI3z2ewRn
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
Cc: kernel@pengutronix.de, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ad924a8502e9..bc7c537706ca 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -85,7 +85,7 @@ virtio_gpu_framebuffer_init(struct drm_device *dev,
 
 static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
@@ -103,7 +103,7 @@ static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
 static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
 					   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
-- 
2.39.2

