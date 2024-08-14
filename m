Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDA3951D48
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F6810E4B9;
	Wed, 14 Aug 2024 14:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C458gg2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D374F10E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC08F1C000C;
 Wed, 14 Aug 2024 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2GRQG3+68xpPpdmixJy2qEGneq+xdxw04MgwhZUFtM=;
 b=C458gg2GmZDtWcF8qOuprNuR098Rm8vK3L5MDTpl/1CRSwXgH5Y1XHAynS7QFNKMi9UrNJ
 Hniv6JW6iwor668Yrbcw6rG8xkC0/ct3+f4HT/7b0lki3j0mOi/8h9EwuhoBp9b1F//r0t
 6npdxWWuP6eovNJ3iDGvdlyE0z+Xr5wNFmsGhhLA3/0548rS/POo5KA2S4aBHjFiJ1MYT1
 EKlaizPipzAZvN/TjP0Gjkl5TbIAYCXWY5W3607LL9sLsn+IjyuWVKs83NGvVMMdvEqcAj
 xVW2ZTpTzXmix9VCrcH9gG8FVnbc5i1CPrhKdNdUTDIVoSNFyzN29O2Qrthbgg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:25 +0200
Subject: [PATCH RFC 03/15] drm/vkms: Extract vkms_config header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-3-6e179abf9fd4@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7229;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=V7P72XzOB4k0LOPzKgUwfRqs4e+ciILS7LbVX8zwFZs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDq6PPu0VrIWlnaEBesNGvrZbbFATjh9YYcT
 98NU2GHstyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6gAKCRAgrS7GWxAs
 4qbREADM8hMudEHHQuHnXmAfj3M29YIany3F1dIca4TfK8ywIS+9T6RiGHhrI1fTC+fqV6QqJts
 kZT08CJv+zsgwUN6cPLPMWMni1WoE/Gp4oDpQb5l86LtnsxZMPV+ITROgbHPuB0dLAuIGhJ/94y
 irvQVIIJhhseYWKcyX6AA8SgJV2B+jgh0d83eoqvfFhuDBPf9Az8Nf3iB6t1VcEuV1HJH/S7N+7
 BQHuxK2oSGwWvObOd9YVDJoIBtEEYrAB9MGXcoS43Po2/ESa0r1fk8skLb2nnYlOZhEG0FJF3EM
 qKjC5q4Jc6NT6yh5dObtrS3rpmso+dF0TTKYEoJbKjb2BgtX6n2Fi6l1g/AkucN77jicr+o9eI1
 ocUnABmqx7U2K2I9Ki256+LvhKLWVySuyNBb4rkQioOYUBth90esjY+TUCtosu6pBGM/bxjzne2
 wB+L/9xCHlYokB0bkWIIscreVlv6SVfnIGN5dngf/ySQ7NxaNwuYhsxOwT3D7a1hicAyywiPCgo
 7fV2qLv9cRt5aRMQ5n0iperN3qRPu7yt8G1S0YqDsKqeHO/V+4x51Fl/4FpiVAPTCQasQMNoDLI
 Wv5Rgc2GsvQWTf8qsjc8KcuguUdAdAJXnw8t8W5pHHTNVZeWAhGEiJZlAa4VdgaeRiWxr4x/Gju
 NiQdbNVcSLLqIAw==
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
 drivers/gpu/drm/vkms/vkms_config.c | 45 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h | 32 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c    | 41 ++++++++++------------------------
 drivers/gpu/drm/vkms/vkms_drv.h    | 15 +------------
 5 files changed, 91 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 8d3e46dde635..2b6db5870b97 100644
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
index 000000000000..ad5d814e6e83
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+
+
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
+
+void vkms_config_destroy(struct vkms_config *config)
+{
+	kfree(config);
+}
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
index 000000000000..b28483173874
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
index e71b45fcb9b8..dbdb1f565a8f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -28,6 +28,7 @@
 
 #include "vkms_drv.h"
 #include "vkms_crtc.h"
+#include "vkms_config.h"
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -85,22 +86,6 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
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
@@ -325,8 +310,7 @@ static int vkms_create(struct vkms_config *config)
 	if (ret)
 		goto out_unregister;
 
-	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
-			      ARRAY_SIZE(vkms_config_debugfs_list));
+	vkms_config_register_debugfs(vkms_device);
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
@@ -344,21 +328,18 @@ static int vkms_create(struct vkms_config *config)
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
@@ -386,7 +367,7 @@ static void __exit vkms_exit(void)
 	if (default_config->dev)
 		vkms_destroy(default_config);
 
-	kfree(default_config);
+	vkms_config_destroy(default_config);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 08d0ef106e37..64574695f655 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -25,20 +25,7 @@
 
 #define VKMS_LUT_SIZE 256
 
-/**
- * struct vkms_config - General configuration for VKMS driver
- *
- * @writeback: If true, a writeback buffer can be attached to the CRTC
- * @cursor: If true, a cursor plane is created in the VKMS device
- * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
- * @dev: Used to store the current vkms device. Only set when the device is instancied.
- */
-struct vkms_config {
-	bool writeback;
-	bool cursor;
-	bool overlay;
-	struct vkms_device *dev;
-};
+struct vkms_config;
 
 /**
  * struct vkms_device - Description of a vkms device

-- 
2.44.2

