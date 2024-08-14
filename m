Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C454E951D3E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D545E10E4AE;
	Wed, 14 Aug 2024 14:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X6J02Nz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E651710E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B76161C000B;
 Wed, 14 Aug 2024 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zlMFKXhNy+QFNkiK0joc1nv/SfFzfMcnr1sereJaSMs=;
 b=X6J02Nz3n2BflHni7sipfFKg7daLubwcy+5ZXOyeoh9yCbqFT/9L7mPiMCnVT/9uoMlM+h
 4h5yl9STXBFFLXIiGGq/t0BrOL8gkfG1F/Y6v2P4bVDdIxn7vcnHzaonMTH9ub8uuh9uRn
 BrNKQgvEG/AhBEJauYjnkfjqiWc3Uw3hJjF7i5C2kmZatRNY7qeGnFAE1FyVQHKX39LXwf
 XwDku/VGAr6iUEgxopDLjyD1d8U0f5fWkNthymdXD9mBYJZciN9BDyyUitUHl04oGr3QBs
 6LWQvk9giCnY/3tylERnIU+/vz4dtOsom7C5vWWUkfW9EotaCyRxoBHJXV0wyg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:26 +0200
Subject: [PATCH RFC 04/15] drm/vkms: Add a validation function for vkms
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-4-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=k7I96F7fMqbLXLeLk7zFFk8rPM2kYDQilJV7tZIaSXM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDqcjf8hNFzSHEsjIFpOkdKSbr2Zb+Illq2/
 Lz3M5mZo8CJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6gAKCRAgrS7GWxAs
 4u6+D/9X3Kjuc5A5W9Lp00RntaOrtOOO76OkBUCrm5i8YJ9Kupap4BDAycCpD6fTyFVLqipz93X
 qLSu2oFLXzxaCfqgByXJKrCv5l1Xeu1RdGJuO/Qk/TiZM0wqOggwX+/s3K0QA5j6Iz7VT7sMZhX
 ywWWIkDFE8lYUx89p8FKNS+stC8HTQIVD2G/A/YnhMVsZISLXb2aRulGCbX8zWIK1WGjleWDYGl
 5YrJ0BJMHi5BBRl3Rhm8s+zpUSEPRKnDirT6CqOBKI3QtRREmrMb3OvZFv6JdynWXU5bo1OCKcg
 R86QOhfQyvFov9lJKDXMLYKLnX9cXxHyHXuhp2a3MKmPH2CdBX0AcI2s0zbeMgeElgT/ReGKE37
 py88o7S/Prd3X4XhuwxzNRkUaEJJk8V4cTWz+CAG1DHpSClpdKDeP2TEDQL0VhS8S8too/H9vqd
 xMWB1+9A+k55LFmh6and/1MFPgF4OL2BVJuB+DL6j1zK15JMwEKbPQBf5wTNdxpgPSZpTofz535
 VEfB0fEDXiD0xfnfDyBbCF+dW5uUQ/jsn6Q15bvOee5XIbX3xCR7Bu/bwxE1H96IkPx4Q/oE/Vw
 leF1zvyHTdMu8h/PAKGv6sy9jiZWmnby1uaPP6eMJHhPVhI9FKvm8P4KDHx88jD0qrgpWRXdpBl
 oK9TOCYYe6x+/Sg==
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

As the configuration will be used by userspace, add a validator to avoid
creating a broken DRM device

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.h | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index ad5d814e6e83..d8348af9587e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -21,6 +21,11 @@ void vkms_config_destroy(struct vkms_config *config)
 	kfree(config);
 }
 
+bool vkms_config_is_valid(struct vkms_config *config)
+{
+	return true;
+}
+
 static int vkms_config_show(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index b28483173874..363f5bc8f64b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -29,4 +29,18 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
 struct vkms_config *vkms_config_create(void);
 void vkms_config_destroy(struct vkms_config *config);
 
+/**
+ * vkms_config_is_valid() - Validate a configuration
+ *
+ * Check if all the property defined in the configuration are valids. This will return false for
+ * example if:
+ * - no or many primary planes are present;
+ * - the default rotation of a plane is not in its supported rotation;
+ * - a CRTC don't have any encoder...
+ *
+ * @vkms_config: Configuration to validate
+ */
+bool vkms_config_is_valid(struct vkms_config *vkms_config);
+
+
 #endif //_VKMS_CONFIG_H

-- 
2.44.2

