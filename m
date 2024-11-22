Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AAC9D62DA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B16610EC23;
	Fri, 22 Nov 2024 17:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CLo1lUIU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C98A10EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FC1A1C0007;
 Fri, 22 Nov 2024 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eu7h5ilmMqLJECKzMclaLaNavWHuvKtTDIPmJsUemdk=;
 b=CLo1lUIUsiNvCpq9BgXZll0Q7QePH8QKNx4jd9MJomEQ3U5Tbl8anYsXL9ne9QopLf6/jN
 bDurQ+4TFH7jrL+3KbvS3PfGvvrFX/Rohk7R7hPBMcn+HnavXjwtJAdgUze1xFg2MKuEUa
 0ZMcIL6w+8alLOHzcA4aF2Ma/Fb3oPbWXypELq/KK+f/pVphFNuH6pq8xFvSdDg8E+Q82m
 EPdzIU0vR9iwJpHxv3eUCTDxVN4HfKwpW4oQMrw072L1s3GqXHQGoRrjxwjVbv7ojIJA2H
 yrxakjbYBxKq6UwbMelKuN7gZzgDKlCEiYpof2XQxvko/u8SUKSx/6Ib9D90kw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:05 +0100
Subject: [PATCH RFC v2 01/18] drm/vkms: Extract vkms_config header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-1-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8173;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=taBxjKE927SBRvVW38khWBgHEz1/XX80j/rtAWPpCuQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1MDnNrWxVEv6/B3PvsG0UOgenKVPTiTTKHb
 l3BE549KamJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9TAAKCRAgrS7GWxAs
 4tmJD/4t/4nVKMaZyL/1YsSkLQdb4ddgbJLBu4s+r3TC4oj1OfFDXw55/2rQ211DTE40zUK/f+U
 FpCuZXL3Wj9wVDRLK455mXHVNyugRUFc2OzpHCOpK8lZ1EExYTPMi441qoLycbp2Ggosm1e1EEH
 5h3HOqBNzMn0U9d3VsiUhLmg644Ay3jxi1reAvr1q4XmgSqjWgZUequbZ5ZBubUOTQRtihe5T2j
 8CfZrAZVAXX8xIEOQ82x9hLVb2AkQoRJwXvegcmY6BIKZikelPyPhUPOfxsWwLFId0drtLU1szH
 lhRUYkVV0yHpqkCf+i5zFLggb9Zz0fn0tav2dz2JtEkyytJmAZZQYu8bzz33ZvOr/9eF25tfJ0i
 t/ePUXI52Ta+sayZWlNCt2i3zWOidIe0Hp9aP81pbDBdGHTrPlZIPRXyGBqEKUMSAa8p+QLslGv
 dPz7sBIFZGH4CNskYH3WrJfKRFKiio6D7hqFH3C4RjBq/1oGrgA1fvb0p1cpoeqv4E3qmKoKmoI
 pa/kTZIsqsvKsmVMT178+XH6YqDKhAjeIJ85ZmChC/JQclZ9q7ppEWJuKHKzUwRfRv9dOdwDPKh
 oPe19qbpzwrty+OzYGlEGWp3Hgg6tz8wGB0iix7IvRlNcYiTLyHpGB/5rvcLrlXkWWg0d22WuYo
 alcCAdqoTp4dAnw==
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

Creating a new vkms_config structure will be more complex once we
start adding more options.

Extract the vkms_config structure to its own header and source files
and add functions to create and delete a vkms_config and to initialize
debugfs.

Refactor, no functional changes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
[Changes: Cherry picked and conflict solve]
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile      |  3 ++-
 drivers/gpu/drm/vkms/vkms_config.c | 48 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h | 32 +++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c    | 41 +++++++++-----------------------
 drivers/gpu/drm/vkms/vkms_drv.h    | 15 +-----------
 drivers/gpu/drm/vkms/vkms_output.c |  1 +
 6 files changed, 95 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 8d3e46dde6350558a0aab4254df0dfe863f9c6ce..2b6db5870b977f6e5013982af89a48aec6c11983 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -6,7 +6,8 @@ vkms-y := \
 	vkms_formats.o \
 	vkms_crtc.o \
 	vkms_composer.o \
-	vkms_writeback.o
+	vkms_writeback.o \
+	vkms_config.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
 obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
new file mode 100644
index 0000000000000000000000000000000000000000..76355174a6ca54b880218c2bd458c8339a3dabaa
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/visibility.h>
+#include <drm/drm_debugfs.h>
+
+#include "vkms_config.h"
+#include "vkms_drv.h"
+
+struct vkms_config *vkms_config_create(void)
+{
+	struct vkms_config *config;
+
+	config = kzalloc(sizeof(*config), GFP_KERNEL);
+	if (!config)
+		return ERR_PTR(-ENOMEM);
+
+	return config;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
+
+void vkms_config_destroy(struct vkms_config *config)
+{
+	kfree(config);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
+
+static int vkms_config_show(struct seq_file *m, void *data)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+
+	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
+	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
+	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+
+	return 0;
+}
+
+static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
+	{ "vkms_config", vkms_config_show, 0 },
+};
+
+void vkms_config_register_debugfs(struct vkms_device *vkms_device)
+{
+	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
+			      ARRAY_SIZE(vkms_config_debugfs_list));
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
new file mode 100644
index 0000000000000000000000000000000000000000..b284831738743f6d7c452be03f917a7d3975d173
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_CONFIG_H
+#define _VKMS_CONFIG_H
+
+#include <linux/types.h>
+#include "vkms_drv.h"
+
+/**
+ * struct vkms_config - General configuration for VKMS driver
+ *
+ * @writeback: If true, a writeback buffer can be attached to the CRTC
+ * @cursor: If true, a cursor plane is created in the VKMS device
+ * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
+ * @dev: Used to store the current vkms device. Only set when the device is instancied.
+ */
+struct vkms_config {
+	bool writeback;
+	bool cursor;
+	bool overlay;
+	struct vkms_device *dev;
+};
+
+/**
+ * vkms_config_register_debugfs() - Register the debugfs file to display current configuration
+ */
+void vkms_config_register_debugfs(struct vkms_device *vkms_device);
+
+struct vkms_config *vkms_config_create(void);
+void vkms_config_destroy(struct vkms_config *config);
+
+#endif //_VKMS_CONFIG_H
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index c54504e590a18ae8af07cc1cc48179c38c4e6c0f..e399566a5b5d6a6cf92a41c72910e857fc4e743f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -28,6 +28,7 @@
 #include <drm/drm_vblank.h>
 
 #include "vkms_drv.h"
+#include "vkms_config.h"
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -82,22 +83,6 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-static int vkms_config_show(struct seq_file *m, void *data)
-{
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
-
-	return 0;
-}
-
-static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
-	{ "vkms_config", vkms_config_show, 0 },
-};
 
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
@@ -210,8 +195,7 @@ static int vkms_create(struct vkms_config *config)
 	if (ret)
 		goto out_devres;
 
-	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
-			      ARRAY_SIZE(vkms_config_debugfs_list));
+	vkms_config_register_debugfs(vkms_device);
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
@@ -231,21 +215,18 @@ static int vkms_create(struct vkms_config *config)
 static int __init vkms_init(void)
 {
 	int ret;
-	struct vkms_config *config;
-
-	config = kmalloc(sizeof(*config), GFP_KERNEL);
-	if (!config)
-		return -ENOMEM;
 
-	default_config = config;
+	default_config = vkms_config_create();
+	if (IS_ERR(default_config))
+		return PTR_ERR(default_config);
 
-	config->cursor = enable_cursor;
-	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
+	default_config->cursor = enable_cursor;
+	default_config->writeback = enable_writeback;
+	default_config->overlay = enable_overlay;
 
-	ret = vkms_create(config);
+	ret = vkms_create(default_config);
 	if (ret)
-		kfree(config);
+		vkms_config_destroy(default_config);
 
 	return ret;
 }
@@ -274,7 +255,7 @@ static void __exit vkms_exit(void)
 	if (default_config->dev)
 		vkms_destroy(default_config);
 
-	kfree(default_config);
+	vkms_config_destroy(default_config);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index ddb6bf94514d9364521ff7c38a04d9aa69fc09dc..6dde780d0515394faf2a4763f9bb7447a28d1472 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -212,20 +212,7 @@ struct vkms_crtc {
 	spinlock_t composer_lock;
 };
 
-/**
- * struct vkms_config - General configuration for VKMS driver
- *
- * @writeback: If true, a writeback buffer can be attached to the CRTC
- * @cursor: If true, a cursor plane is created in the VKMS device
- * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
- * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
- */
-struct vkms_config {
-	bool writeback;
-	bool cursor;
-	bool overlay;
-	struct vkms_device *dev;
-};
+struct vkms_config;
 
 /**
  * struct vkms_device - Description of a VKMS device
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 1c6d41856e317eb7b9b79f56fdf7473d0a339250..34b6e761bce8a1f2153e1e47c795bad1a52a3454 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include "vkms_drv.h"
+#include "vkms_config.h"
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>

-- 
2.47.0

