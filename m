Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1716AA10884
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5898C10E33A;
	Tue, 14 Jan 2025 14:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X/yQjhHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD8910E339
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:06:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D548DC0012;
 Tue, 14 Jan 2025 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736863563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfdz9rSCDQ54knSY4hUZlk54DeodeqvA4IAtHVLDF8M=;
 b=X/yQjhHP9hKFW57aSRrDwvs36p39zAmt7S07+ATNYTa+YRjPoA4L0Jtz7x67CVdX2nS4Nq
 v2NltYt5HrIM9sJEeNNfrUkGsRfK15NPIs29jX3oo3cYeF82mvGUxijzp1RdeVLrfVqM26
 DTI4EFxVNA+QH6t/xLotzbQSAPCWXYGkQNM5sFxmnRP9nVG2zVAmWJnyMGbTwLT+bD7X40
 VgWitW7bHJ/NVw5nfUTQoxU8pJMcvhBy63qN7ssCP1rvof+/Cjfdl7OvBKDjBpdnCAO5b9
 usRj4pNUF8tEH6F07KOnoU9P8i74PPaDkf5BF2csGuCNVzsPVGFL+FkwMlPiNg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 14 Jan 2025 15:05:46 +0100
Subject: [PATCH v8 4/8] drm/vkms: Switch to managed for crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-google-vkms-managed-v8-4-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
In-Reply-To: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9FLY9VcgEbXvm/v9Z9EKyaY0lfzgPQJzxtOCb24c+0I=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGeGb0SiPXqeFv/Jj1ha5aeQYK0lcwexOogpCriXqr0mrJR6B
 IkCMwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJnhm9EAAoJECCtLsZbECziwswQANMO
 UvP7kWq7bzK6tMeovMoQWZ3WlDBhGJ0Kr7s0xiEZ5JtdstSwLDy3wmAVF2IRoVOXNAuGs0/7XM3
 y6Fp6HzMr3JMUvQfN6uR4DIEd1K5uUyAeHofQb/raoj/2/az4v9DYxq1NKTUUvoxS/Ec9vO6+gO
 xCLWfWQYwEgnRhhPgOYY2kjrWUTs2hIEAGY2Cr3Gyoq9eV5xkYZZqGIZJWtIiMt0pS6u6Y2NSLG
 K7i3ENPrYaSwc8GDHTMRGhWDlbjOomCcsekDTdlzbJuyzbMx4/4aBubO1bQKN1Oe7R9rGOjYM5y
 V1iIHIQcyf3GrtSGhA06FEdEh7CL53f0ko4PDuI1JIcwq6IzP9q1eU/wJjMw5wztoeo2uPRaY2i
 B2z6e4PhcdT1rzxFGgIpuzfWXgS/tW1l71ZCZKqFej/CMNmvF5EfS1crJSLGYB188xLnZBSRcK2
 jw/8vNiRiMZQUKDY37lvufZSVdgSFBfsg9eHY2p7pWTQ7IdOGjsQT2TlnvvHUc3pJHt4JytqVa9
 YljyTkYOFzZPEmxUMs5FtuxkleRkp1jkxIB1sTjL/82Ed8UnB9Tta4z4s+XxwXplMv8fd+ljTV0
 Kl538o4+bOZCjXK1NUbfhoRk0B5WgU7RVy16qJyr7+1UhwcLr6uWayQaPKklkZBd+oj4XPHaHeF
 NFuVD
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 ++++-
 drivers/gpu/drm/vkms/vkms_drv.c  | 9 ---------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 28a57ae109fcc05af3fe74f94518c462c09119e3..434c35d5e9477d2961826262591db8ab43838e09 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -296,7 +297,9 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
 
-	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
+	vkms_out->composer_workq = drmm_alloc_ordered_workqueue(dev, "vkms_composer", 0);
+	if (IS_ERR(vkms_out->composer_workq))
+		return PTR_ERR(vkms_out->composer_workq);
 	if (!vkms_out->composer_workq)
 		return -ENOMEM;
 
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

