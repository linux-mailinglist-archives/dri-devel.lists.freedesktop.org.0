Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF6A17FF9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A65D10E1F7;
	Tue, 21 Jan 2025 14:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YfYXVkTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B184810E1F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73E41C0007;
 Tue, 21 Jan 2025 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhQEZOvn/jMO4/P3BnIFODEDvPs26ENlss6WZdWsqKA=;
 b=YfYXVkTpYotKFIJGWKVEaIVnZ8qTS5C3Wa7m+3Y9hNzd5AAxs6Z/sq5GySxzVWG54AfHYQ
 q1tFQZpLCyHUCau5/TzBgmhJuPmXhY5HgpH/+uqut6yHqmLj5AxEJkAUfizJZdS8ZvyafM
 oCupYSpwlXtICdatAehpER2TQkG48jWPXUGQIk4L61FysI3vFqEbR6j1hZwCOJFRDoXSFD
 YbLQx+OATlDjbHcBxtcDOwUXlxuNqpi7EiuyacROjF2hWuvAPoS9+EaYMgysoj33Vx1ljb
 bS8b2pfGVTP7wqj32L/bn/ZSQrINZiA3rjOKtVaMJBsuHW45++9H8z5rukIn8w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:47 +0100
Subject: [PATCH RFC v3 03/14] drm/vkms: Introduce ConfigFS interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-google-config-fs-v3-3-8154a6945142@bootlin.com>
References: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
In-Reply-To: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8290;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gW5kbPGah9wsQMOt1mWrt49HNN/XFyodHRvOUKhHbho=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FAVMbLB2XadPXbEWIwLqCqViaEhfA1i5RQX
 X8T9d7omi2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQAAKCRAgrS7GWxAs
 4twrD/4s5G9AJAI3vLHGHjDvbcmlL8O05gQHsIC87+mS2R6VOh3cj2Z4pe+biqG9YvuTgX+yZRY
 C7rM4gJWaVrZMY03Ig22HrE9S/CH5yJsI4u8NdbqRXGhD0aDNff4FsT01Od4uzzzcI3J6aLUuZA
 kVJSk9wOoYGUet8ZIK9qLaOfDc/YPMO6kRTXljINvoF8jWxnQb2zYsH7rWcBZi/dHHyQICpXifz
 7yDXO7BwrelYE/B/2pbTtkQ9o498fyVuLTCJ9JGRj+YYK6JJbDFSQiLePqzYZ9JHsYr5AB6BMXC
 lY8EsRSvDKRXhezt+EXvG1Z6lb1tZE5moCyNliszzxPC+zPCYES6olSkHknNEIzFec8XV+OGk2I
 ej4yD3GUSjhVyEa/e2O+rZTsFRyr24Dy3BTRuT6qNcTsuK0esU0SwPHwMbP0CJZbqGuGxknHu8E
 JE6GDGC6Ju4yOJP7ddXDEmbLXMHTxOyU2Hgfo0iINtvQqWndd5D6ggspoxICP8kxnX1o2NDzCIF
 v7t3BvHTXClUc6H2TeAQEG8IRSPLOQll3ckPsMt8e5ku/JbwwyzgknpjMDQKOmh8LG48LpkHW7b
 pqDPPI6021Y5AtoWpHl83iOSQ3hzoKFkVOvCzi0029DiJkf0v307A+zdRsz5gbLO6tfwF1OkCKV
 7LGHU3Px6uwKpOw==
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

VKMS is manly used to test userspace program and its behavior. The current
implementation is not very configurable as you can only have one device,
with few specific planes.

This is the introduction of a basic interface to dynamically create new
devices.

The new interface is:
/config/vkms
  DEVICE_1
  ┗━ enable
  DEVICE_2
  ┗━ enable

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/Kconfig         |   1 +
 drivers/gpu/drm/vkms/Makefile        |   1 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 144 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h |  35 +++++++++
 drivers/gpu/drm/vkms/vkms_drv.c      |  15 +++-
 5 files changed, 194 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 9def079f685bd30e1df3e4082e4818e402395391..742402dc09b981ee976cd06c4009c08969910556 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -6,6 +6,7 @@ config DRM_VKMS
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
+    select CONFIGFS_FS
 	select CRC32
 	default n
 	help
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index b371b5d70ee31e76343c2f09e6dc5a6e74a1c246..1d73b9cf64ff737cef65b82c79cd2e574a04377b 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 vkms-y := \
+	vkms_configfs.o \
 	vkms_drv.o \
 	vkms_plane.o \
 	vkms_output.o \
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..6535672f008401cf1ae008ff2ef74452b2575eab
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/configfs.h>
+#include <linux/mutex.h>
+#include <drm/drm_print.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "vkms_configfs.h"
+#include "vkms_drv.h"
+#include "vkms_config.h"
+
+static ssize_t device_enable_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%d\n",
+		       config_item_to_vkms_configfs_device(item)->enabled);
+}
+
+static ssize_t device_enable_store(struct config_item *item,
+				   const char *page, size_t count)
+{
+	struct vkms_configfs_device *vkms_configfs_device =
+		config_item_to_vkms_configfs_device(item);
+
+	bool value;
+	int ret;
+
+	ret = kstrtobool(page, &value);
+	if (ret)
+		return -EINVAL;
+
+	mutex_lock(&vkms_configfs_device->lock);
+
+	vkms_configfs_device->enabled = value;
+
+	if (value)
+		vkms_create(vkms_configfs_device->vkms_config);
+	else
+		vkms_destroy(vkms_configfs_device->vkms_config);
+
+	mutex_unlock(&vkms_configfs_device->lock);
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(device_, enable);
+
+static struct configfs_attribute *device_attrs[] = {
+	&device_attr_enable,
+	NULL,
+};
+
+static void device_release(struct config_item *item)
+{
+	struct vkms_configfs_device *vkms_configfs_device =
+					    config_item_to_vkms_configfs_device(item);
+
+	mutex_destroy(&vkms_configfs_device->lock);
+	vkms_config_destroy(vkms_configfs_device->vkms_config);
+
+	kfree(vkms_configfs_device);
+}
+
+static struct configfs_item_operations device_item_operations = {
+	.release	= &device_release,
+};
+
+static const struct config_item_type device_item_type = {
+	.ct_attrs	= device_attrs,
+	.ct_item_ops	= &device_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+/* Top directory management. Each new directory here is a new device */
+static struct config_group *root_make_group(struct config_group *group,
+					    const char *name)
+{
+	struct vkms_config_plane *plane;
+	struct vkms_config_crtc *crtc;
+	struct vkms_config_encoder *encoder;
+	struct vkms_configfs_device *configfs = kzalloc(sizeof(*configfs), GFP_KERNEL);
+
+	if (!configfs)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&configfs->lock);
+
+	configfs->vkms_config = vkms_config_create();
+
+	if (!configfs->vkms_config) {
+		kfree(configfs);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	plane = vkms_config_create_plane(configfs->vkms_config);
+	crtc = vkms_config_create_crtc(configfs->vkms_config);
+	encoder = vkms_config_create_encoder(configfs->vkms_config);
+
+	if (!plane || !crtc || !encoder ||
+	    vkms_config_plane_attach_crtc(plane, crtc) ||
+	    vkms_config_encoder_attach_crtc(encoder, crtc)) {
+		vkms_config_destroy(configfs->vkms_config);
+		kfree(configfs);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	plane->type = DRM_PLANE_TYPE_PRIMARY;
+
+	config_group_init_type_name(&configfs->group, name,
+				    &device_item_type);
+
+	return &configfs->group;
+}
+
+static struct configfs_group_operations root_group_operations = {
+	.make_group	= &root_make_group,
+};
+
+static struct config_item_type root_item_type = {
+	.ct_group_ops	= &root_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem vkms_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_name = "vkms",
+			.ci_type = &root_item_type,
+		},
+	},
+	.su_mutex = __MUTEX_INITIALIZER(vkms_subsys.su_mutex),
+};
+
+int vkms_init_configfs(void)
+{
+	config_group_init(&vkms_subsys.su_group);
+
+	return configfs_register_subsystem(&vkms_subsys);
+}
+
+void vkms_unregister_configfs(void)
+{
+	configfs_unregister_subsystem(&vkms_subsys);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
new file mode 100644
index 0000000000000000000000000000000000000000..ffacba6607018de44323fb6aa05cc6da8400a9f2
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <linux/configfs.h>
+#include <linux/mutex.h>
+
+#ifndef _VKMS_CONFIGFS_H
+#define _VKMS_CONFIGFS_H
+
+/**
+ * struct vkms_configfs_device - Internal object to manage all the configfs items related to one
+ * device
+ *
+ * @group: Main configfs group for a device
+ * @platform_device: If a device was created (@enabled = true), stores a pointer to it
+ * @lock: Mutex used to avoid conflicting edition of @vkms_config
+ * @enabled: Store if the device was created or not
+ * @vkms_config: Current vkms configuration, protected by @lock
+ */
+struct vkms_configfs_device {
+	struct config_group group;
+
+	struct mutex lock;
+	bool enabled;
+
+	struct vkms_config *vkms_config;
+};
+
+#define config_item_to_vkms_configfs_device(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_device, group)
+
+/* ConfigFS Support */
+int vkms_init_configfs(void);
+void vkms_unregister_configfs(void);
+
+#endif /* _VKMS_CONFIGFS_H */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index afbd1fbe00d469bea8367096a3aa0ed07b66ed1a..0b1fe3bce1fb370727ff7585e520e5eb64c9c0b6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -29,6 +29,7 @@
 
 #include "vkms_drv.h"
 #include "vkms_config.h"
+#include "vkms_configfs.h"
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -156,7 +157,7 @@ int vkms_create(struct vkms_config *config)
 	struct platform_device *pdev;
 	struct vkms_device *vkms_device;
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	pdev = platform_device_register_simple(DRIVER_NAME, PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
@@ -217,9 +218,17 @@ static int __init vkms_init(void)
 	if (IS_ERR(default_config))
 		return PTR_ERR(default_config);
 
+	ret = vkms_init_configfs();
+	if (ret) {
+		DRM_ERROR("Unable to initialize configfs\n");
+		vkms_config_destroy(default_config);
+	}
+
 	ret = vkms_create(default_config);
-	if (ret)
+	if (ret) {
+		vkms_unregister_configfs();
 		vkms_config_destroy(default_config);
+	}
 
 	return ret;
 }
@@ -249,6 +258,8 @@ static void __exit vkms_exit(void)
 		vkms_destroy(default_config);
 
 	vkms_config_destroy(default_config);
+
+	vkms_unregister_configfs();
 }
 
 module_init(vkms_init);

-- 
2.47.1

