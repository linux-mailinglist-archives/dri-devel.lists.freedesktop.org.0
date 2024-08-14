Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ACE951E4C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 17:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F69210E4C4;
	Wed, 14 Aug 2024 15:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="f2+rjyMf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D5810E497
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 15:16:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D3626000B;
 Wed, 14 Aug 2024 15:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723648562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8AQ78HzLONhDO3dQgXuU0bOwsL1VtElUuiVHAP3BCbs=;
 b=f2+rjyMfOPAez9QvdJoHwWhObt07jzULSbChy+avi+6inh5V3CtDlOJZHDUgW8unUm31yf
 FJMJQaZI2MZKdaLGG6GZ9TeXN7jL3w3uS75Zx5rrRZ95yD4QDgB+8J9laILG3W6rhwhoiw
 fNLIzmZZgx2DLFoWoYgsIYxKSeLHu4LxP84niosECe0+jvZcQPtLMKyFPFLbnRyQCMIrHB
 6JDGczZJdPzDjvBQ8KmR2hVltVonGbAwv1zlJ0cnfMZvE3ShKQfXQPrQ+d8tXpWTVAeXOE
 AfLE4R/Pnae0g8whHJxVt8+DkaXhMZWniFfAKJvLIUu0ucIiOWfzuO4cb2K8dA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 17:15:49 +0200
Subject: [PATCH RFC 2/7] drm/vkms: Introduce ConfigFS interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240814-google-config-fs-v1-2-8363181907a6@bootlin.com>
References: <20240814-google-config-fs-v1-0-8363181907a6@bootlin.com>
In-Reply-To: <20240814-google-config-fs-v1-0-8363181907a6@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8006;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ocjr/5bqUg2swyfu92asLp4bqmPVBLRlfv+QzOrgZMI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMot6Hu5CCL0I0a8AwlDdMqi1xSKyFaAl68VM
 Y93JU955U2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzKLQAKCRAgrS7GWxAs
 4pHgD/4sHulyaNE7aXKDCnU+V9JLoKyvc0HrCt2WBhmLRw3oxNUVOZItGLy1i2Cpqo/97bD6KLh
 DlJqwU9NWDD87+dFVwTtH4mCq9HKt63N/7WI0xT0+WKFo/AjV6QdHjFKA2wllUWhKBE5f127byU
 G6CLLZVKP05wRrw+odYWp8TgNPjii4FnNP2N2WN96FJbQWQLv6zqJWemscTPEo3Gdnf603c8Zm9
 lGaxyOy2c1rEOWuPfuOlP/dpJVw5u1xzw4cQdqOlEKVP987sSaSJN0vJ9wH7nKSALNIF6nyj6t6
 l/uxQ3c4kVJd3b+QjD0er1ygNUF325EYZX0sZLkerB5IUwE/Fgqzt32o2fhJy5Eeelf9yHT8K0o
 3poIoA3RtM6eHMG1yC/EsW3Ua+uUJxnxevoplZeqmks1xEPFJJQOSvhN39++HQem/C4oTctc6O1
 w7xnIFML03q9X1f1Bgey/KqXySn20LJG2QvBCcybVha/9PlvEyL5IuYb2J10V9Ehv4wpAyxuI15
 jOyLzYrSIxH+SENo0FEE0IoUS0uNwb3PoJ4NPRFe3pgnT7j4GBGvDexU4fwhLoQoDgFqSAUBUIG
 N1wAuTvFiFnoKi2o0vdr2/4ENpW5rRG+lCSCKSUECYLaQ8w3puQAL0B2aLq2KEiixXwqSOOZpnK
 F7aSgXCh8qs4oPg==
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
index 59c4a32adb9d..8dddc9ba2e33 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -5,6 +5,7 @@ config DRM_VKMS
 	depends on DRM && MMU
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
+    select CONFIGFS_FS
 	select CRC32
 	default n
 	help
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 2b6db5870b97..9ecf6bc4779f 100644
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
index 000000000000..6535672f0084
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
index 000000000000..3de89c9c552c
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
+ * @vkms_config: Current vkms configuration
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
index 9ea379f4338f..e0ae21bcd590 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -29,6 +29,7 @@
 #include "vkms_drv.h"
 #include "vkms_crtc.h"
 #include "vkms_config.h"
+#include "vkms_configfs.h"
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -270,7 +271,7 @@ int vkms_create(struct vkms_config *config)
 	struct platform_device *pdev;
 	struct vkms_device *vkms_device;
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	pdev = platform_device_register_simple(DRIVER_NAME, PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
@@ -324,9 +325,17 @@ static int __init vkms_init(void)
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
@@ -355,6 +364,8 @@ static void __exit vkms_exit(void)
 		vkms_destroy(default_config);
 
 	vkms_config_destroy(default_config);
+
+	vkms_unregister_configfs();
 }
 
 module_init(vkms_init);

-- 
2.44.2

