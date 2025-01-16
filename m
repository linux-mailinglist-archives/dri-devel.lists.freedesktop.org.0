Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C93A14136
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB4E10E9ED;
	Thu, 16 Jan 2025 17:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K67hMzqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19EB10E9FF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:50:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2D256000A;
 Thu, 16 Jan 2025 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737049826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNdbYbwEiFXz/MSftXWv5nbF5QsUpnFMphoZPTHXipQ=;
 b=K67hMzqWAcpD19Pm0WLtq389I2MhzRaNm6Uwn1ZsuxRau3U8S47afJAG7DBA4pk1fD8cEB
 HxvcI9e0mbGncn1ntXF1ZyfegmCIKb9zvf9I77VauirILN3EKJLmqQ9p6FucOOrll+fpyN
 kfm3PB3/1Yo7i4U5OfBS8Qcmd/AnBufVvWn5/MOc2A9Em0qwnxQbXAbkgUbtx8gU5iqcNi
 MywQxDtZ2ORn70/AUsEF2s12BxDyCPZAI/w8DS5ucm+quE6+TQLSdt9CAZqVSn/BIQdtjl
 anKEsiGVMfGRFg3tIkP98E/v+DE9Ac9GJDEY79i30jt83BYZPZlpzqwFJVQkhQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 Jan 2025 18:47:16 +0100
Subject: [PATCH v9 4/8] drm/vkms: Switch to managed for crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250116-google-vkms-managed-v9-4-3e4ae1bd05a0@bootlin.com>
References: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
In-Reply-To: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
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
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2560;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=n9xXUrclSXq7wRtakJH3mjseEyghccrgyUTnDFFh6xM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBniUbbeBEP6+NBmYskSSw5cGmsy0xzy9p1UerHu
 Wto1JXtXZ6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4lG2wAKCRAgrS7GWxAs
 4sdGD/9HQ5B9BvKNYSLfP6IDL8WDEvjvOTfWo4ct+D0+InW9oWbNKAgQcZmAalK+t6evbl/sGkW
 fhbrYvQXkh+lWGdSllsg3W8vMDFUFpy23XMXQsQSxyA9xJuImz4ywoDhYAJcOIoZZ5d/7aP9X66
 ZoomHkxLZzatxsHBic+QJWDHRr3nwZiitJVJD3YTywdpN8xwJGeEnG0oMXcmABftpFfqCBzG1j5
 0JhIx9Y0uZoAy/OQTnsqLhK9szFfhpp2VeDEm9xAXltCvhKE6K/EX6lrVTgqvs/Esb9lncxqyf+
 kXvQLIGubiRiceHjOS+4HwLC7PTaZHGEbp3w5kLlmYgMM6RysZZzjWFgOcTAPaERozlni20aoOo
 S2p5rkJosGRNq4iGZlV+nTgHLmKV89mbfCJMJb5jgro09AYHCRhPJ1OR/zmPA6eC7SkUL+CK94i
 o4uBQY9CUV406A7OJ965LfiexrugGACNCUDQdSDbRJZRXiBo+W8kDhYGxnV35C35ZTpc++AoG89
 91Gr14s7wt+uO8OoUdp9VFEaBOY/xmZVxAT2o1q37L0vi+pNFQX3O/PAG+Y9WGJ575vMl5SdiQQ
 Y4xhw4Ake7IrSWiUAUk3R+H/JF3fb9cxX686nn6k052qFiY5z1BD8Zb4bJ/TRWYIaBdYj0yFBJN
 M3q0btXfy6rcQEA==
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
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

