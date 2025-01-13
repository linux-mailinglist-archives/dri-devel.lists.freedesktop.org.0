Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EA4A0BE57
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5606710E74C;
	Mon, 13 Jan 2025 17:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZCV437Jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C96B10E74C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:09:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45D601C0009;
 Mon, 13 Jan 2025 17:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736788155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LY2O50zsA6s/xcwj2ByPp9+wVZ9Z+1qLAMiiqprNuz8=;
 b=ZCV437JpmRS4CzVRIZ+4MIcfq/oPx9gLzp2IpQHR7QZR2PXGJ11FcF2m2XOoY3NBKLWTcP
 vrV9k8UrASVDDYmyIFNlfYxjoSLpEeO80llV31gZVZV0kG5vzT8D4ZJJR46JL4Bzqm+Y4I
 rgMnwgXdnKa5jS5TgfBRn4Dbj/a6YGnMV7YVwkpnYe16QfRpI61+5BJ4jCO/TnMiHjWF1N
 uam/PvcmXXKqSwlhaheg0p3WDZ0Tdh1F7MW6f9nVkbOhJRf1GWWO38CkCJkOIHJXMtm4xl
 R/Es0n6wNfizCrjQqiXCm2b9nM+tYxZwJbeDT/V5k0XLpa4aql3oCmPHQ3MPrw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 Jan 2025 18:09:04 +0100
Subject: [PATCH v7 3/7] drm/vkms: Switch to managed for crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250113-google-vkms-managed-v7-3-4f81d1893e0b@bootlin.com>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
In-Reply-To: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=n0VghhJrbrmKmRsfwMlZZWoRm6homaUFqv46ilHrHUU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhUi0EOT+tSz+mKudb80r7D1seKhbcRp5b+63Z
 11TagifUX2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4VItAAKCRAgrS7GWxAs
 4l5YD/9qhZOBYzss8Gx42CU8RP4RiU69gx5UdEM6nUYCARc5nJhaJGeioRE7vtLA9B/B3WB2BfS
 r23187KPM03uvq3Hj6GjGbtnYhlCMrQtvl5xihsJ424lqPxxMjG7i0YJpPwbV0Z/MPeF9hPwOAN
 9S0X+IHZd+GAzQoMH5QCpWJBzgQgc8Un1el/gtiptfE0pIx5AsmA/5Vu4TTcrjUkZgwsAFOIARk
 w7uK/wDAyGks6mgwilK83Gi3YpYuZdYfBdBvZIpH0LbY2yNZFfqZrWzYtoQNmixDz5pzM84lKiV
 8dTqCNCgz5FXLlAkKLDOH7JpxXk1gwGyP+FobcgHmI6xwkRniuxyQO5D18Hn1/hGLKcwxps2hOr
 QaA76EkxA9YfO4i6Sn8lNi56ZnSZzCfvs333iWJ8VcRfqVrsKkzVd/XAiM6P+5crnLPzAuxs6o0
 TMxUL5+bRYVD7cK02wBqCxeAw3970ICqHBcPsxYjHSnyfyoTuTwVFwexNfJ8k5FSstwhY7lwIoT
 qL4j+NXD8KINi0WhVcL0V2QAr96OanUt6ghchSSg84ce60HsgIsqAbqLl+cvLvQTKniJ/TcBphf
 XxwM7bmNlMRNFo4LZKdhfAvz/IN0TI6iEzDg7GITVm3/uJ+ZeX8rUyiLjgGRRjLiTXWl1ARL/Az
 sPLpiJSoVsbnLBg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current VKMS driver uses managed function to create crtc, but
don't use it to properly clean the crtc workqueue. It is not an
issue yet, but in order to support multiple devices easily,
convert this code to use drm and device managed helpers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 14 ++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c  |  9 ---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 28a57ae109fcc05af3fe74f94518c462c09119e3..ace8d293f7da611110c1e117b6cf2f3c9e9b4381 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_managed.h>
 
 #include "vkms_drv.h"
 
@@ -270,6 +271,14 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_disable	= vkms_crtc_atomic_disable,
 };
 
+static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
+					void *raw_vkms_out)
+{
+	struct vkms_output *vkms_out = raw_vkms_out;
+
+	destroy_workqueue(vkms_out->composer_workq);
+}
+
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		   struct drm_plane *primary, struct drm_plane *cursor)
 {
@@ -300,5 +309,10 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	if (!vkms_out->composer_workq)
 		return -ENOMEM;
 
+	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
+				       vkms_out);
+	if (ret)
+		return ret;
+
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e0409aba93496932b32a130ebb608ee53b1a9c59..7c142bfc3bd9de9556621db3e7f570dc0a4fab3a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -53,14 +53,6 @@ MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
-static void vkms_release(struct drm_device *dev)
-{
-	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
-
-	if (vkms->output.composer_workq)
-		destroy_workqueue(vkms->output.composer_workq);
-}
-
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
@@ -108,7 +100,6 @@ static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
 
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
-	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,

-- 
2.47.1

