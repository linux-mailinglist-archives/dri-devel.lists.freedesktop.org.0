Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C914BBE4EF0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D456110E311;
	Thu, 16 Oct 2025 17:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y1r6GG9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A08310E311
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4711810948aso1426005e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637404; x=1761242204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKP1Ta3BfHb/8wlxAanz9De+XRrWGVKj4Da9wjd+w5A=;
 b=Y1r6GG9ayz13WfSSRm7AuhE4USGKwYmUYLvMTjeu0Hy63m2f9BU9FSDroc59A8GMTe
 32WDwST2+3EyVVu8X0s242gCoO8K3xcfrMdqeflQWzsFiiW+cjiNtEf4KBmFS4dXGrq0
 UdIWn1lyNa/n0OG2vZn/m2qa7OjyNb6clbLuMBk7vNt8UZBuq7q3TCNM6I35d8HOsUb9
 dIjsVFiPIOJ706NRgC4EyhJvvZVxN15UGgP1nmIlLMB29BsEKINWq9AYVU2fYj/5VzIz
 /YUPz77MKpRtpqgjUYRLRJ7gt3wXxxPpOiEj4Sv9pY9xxVcftkMGqycyQqmCce8+AKYV
 CDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637404; x=1761242204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKP1Ta3BfHb/8wlxAanz9De+XRrWGVKj4Da9wjd+w5A=;
 b=Xqc6AKWhld1vRIfjq2St+5ZVcVlgfcXV/tdUCBNDH+LCtkQdoRx0imzGpRfQR2UR/K
 8uDRd6ISKoSpfjMVhtdmQCqAeNWl4DXSZgzI0kAkruGtoJXAyBVRQMUDrcDSYb6GfpkX
 JNHBgDC9i9VkIUkVGEvJmJWZ3ZMxvaEOOod3LhRhFNHPTTJx9lZ0yo12zMN+GVOqYcxn
 byIW98Pyx4q/1/CmOEYb3mTmt6rdUfGyzIekmYxtmNgs4osf9VDCQMFxwT2zedEzt9uT
 yg2vr3WTYZOilkGr9ZMfsn1w6rkWQUjrMwiOCS2E6n4G6+5nUjb2OIwPnguehQr/w2iQ
 7vZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/F6CUoCLT7r18mAQvG1zYG4meMilZhTJKZXGkatavhGrgcyKHrwUIFQ31WXNNDFTfTttLM22XooA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTfxjAdhHAvMKLprKSbOznGWY6wU6Sf+jMYk9ZvxXhIDJGE+py
 2m/hPT1yZWdBwJo8F00GLbQ6R3YED6SOmB+tLzr1oh+zxfsaCzfE2fhK
X-Gm-Gg: ASbGncsMYwpVEEcGtnmRgZzm2DWn/ZZz7hk2VtysQk1SchjOyQ/clVcooneokIjMR2f
 q1QOiSfBfLCc1PKL6wB3Qk6aSF6rR3NSaWISksI0xdWqar+15ySrEJhfBp9EY0KzzFQ3xaX00hf
 jfAiMm5oKZ4Zd3SaboZxvcIRrM9X1M3jjMLqkxpkIuM/b3uLiHSvTgYmqGLQR8UlsnKPJLFLq3Z
 fU/r1tsyZLsQJ5nuPnDLqnaX9pxS46lvNBL2Vy5CT9ONraYwXIOZrPdAauv5hoqpMzDVZ7IS1oU
 4180e8zD8dD1Rb6HUH98XUMpjUPMwd+eDfXdfo+gtDQNBvgo8TEdWVBcmCEdNkp73YgKcb+qlNM
 wE3x3slaOmBZDGsPlH0eFUKqipOYEQeZi+HUrXa43lL7zgJv0bAtbIaPjBjp10ZxoEGXA3bpyu7
 hxJg4wtXZ9wA==
X-Google-Smtp-Source: AGHT+IFblAy5GAIp1r8QzuJtiDYDa0ypR0JAOuaVZe/d+x+4Bl8CWH2kZcRnkZPVR8FiiPrGRmKQEw==
X-Received: by 2002:a5d:5f82:0:b0:3ec:db87:e8fa with SMTP id
 ffacd0b85a97d-42704d768b6mr761730f8f.26.1760637404162; 
 Thu, 16 Oct 2025 10:56:44 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v7 02/16] drm/vkms: Add and remove VKMS instances via configfs
Date: Thu, 16 Oct 2025 19:56:04 +0200
Message-ID: <20251016175618.10051-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016175618.10051-1-jose.exposito89@gmail.com>
References: <20251016175618.10051-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Allow to create, enable, disable and destroy VKMS instances using
configfs.

For the moment, it is not possible to add pipeline items, so trying to
enable the device will fail printing an informative error to the log.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  32 +++++
 drivers/gpu/drm/vkms/Kconfig         |   1 +
 drivers/gpu/drm/vkms/Makefile        |   3 +-
 drivers/gpu/drm/vkms/vkms_configfs.c | 172 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h |   8 ++
 drivers/gpu/drm/vkms/vkms_drv.c      |   7 ++
 6 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 8a8b1002931f..73521b9ff0c3 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -51,6 +51,38 @@ To disable the driver, use ::
 
   sudo modprobe -r vkms
 
+Configuring With Configfs
+=========================
+
+It is possible to create and configure multiple VKMS instances via configfs.
+
+Start by mounting configfs and loading VKMS::
+
+  sudo mount -t configfs none /config
+  sudo modprobe vkms
+
+Once VKMS is loaded, ``/config/vkms`` is created automatically. Each directory
+under ``/config/vkms`` represents a VKMS instance, create a new one::
+
+  sudo mkdir /config/vkms/my-vkms
+
+By default, the instance is disabled::
+
+  cat /config/vkms/my-vkms/enabled
+  0
+
+Once you are done configuring the VKMS instance, enable it::
+
+  echo "1" | sudo tee /config/vkms/my-vkms/enabled
+
+Finally, you can remove the VKMS instance disabling it::
+
+  echo "0" | sudo tee /config/vkms/my-vkms/enabled
+
+And removing the top level directory::
+
+  sudo rmdir /config/vkms/my-vkms
+
 Testing With IGT
 ================
 
diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 3c02f928ffe6..3977bbb99f7d 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -7,6 +7,7 @@ config DRM_VKMS
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select CRC32
+	select CONFIGFS_FS
 	default n
 	help
 	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index d657865e573f..939991fc8233 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -8,7 +8,8 @@ vkms-y := \
 	vkms_composer.o \
 	vkms_writeback.o \
 	vkms_connector.o \
-	vkms_config.o
+	vkms_config.o \
+	vkms_configfs.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
new file mode 100644
index 000000000000..ee186952971b
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/cleanup.h>
+#include <linux/configfs.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+
+#include "vkms_drv.h"
+#include "vkms_config.h"
+#include "vkms_configfs.h"
+
+/* To avoid registering configfs more than once or unregistering on error */
+static bool is_configfs_registered;
+
+/**
+ * struct vkms_configfs_device - Configfs representation of a VKMS device
+ *
+ * @group: Top level configuration group that represents a VKMS device.
+ * Initialized when a new directory is created under "/config/vkms/"
+ * @lock: Lock used to project concurrent access to the configuration attributes
+ * @config: Protected by @lock. Configuration of the VKMS device
+ * @enabled: Protected by @lock. The device is created or destroyed when this
+ * option changes
+ */
+struct vkms_configfs_device {
+	struct config_group group;
+
+	struct mutex lock;
+	struct vkms_config *config;
+	bool enabled;
+};
+
+#define device_item_to_vkms_configfs_device(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_device, \
+		     group)
+
+static ssize_t device_enabled_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_device *dev;
+	bool enabled;
+
+	dev = device_item_to_vkms_configfs_device(item);
+
+	scoped_guard(mutex, &dev->lock)
+		enabled = dev->enabled;
+
+	return sprintf(page, "%d\n", enabled);
+}
+
+static ssize_t device_enabled_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs_device *dev;
+	bool enabled;
+	int ret = 0;
+
+	dev = device_item_to_vkms_configfs_device(item);
+
+	if (kstrtobool(page, &enabled))
+		return -EINVAL;
+
+	scoped_guard(mutex, &dev->lock) {
+		if (!dev->enabled && enabled) {
+			if (!vkms_config_is_valid(dev->config))
+				return -EINVAL;
+
+			ret = vkms_create(dev->config);
+			if (ret)
+				return ret;
+		} else if (dev->enabled && !enabled) {
+			vkms_destroy(dev->config);
+		}
+
+		dev->enabled = enabled;
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(device_, enabled);
+
+static struct configfs_attribute *device_item_attrs[] = {
+	&device_attr_enabled,
+	NULL,
+};
+
+static void device_release(struct config_item *item)
+{
+	struct vkms_configfs_device *dev;
+
+	dev = device_item_to_vkms_configfs_device(item);
+
+	if (dev->enabled)
+		vkms_destroy(dev->config);
+
+	mutex_destroy(&dev->lock);
+	vkms_config_destroy(dev->config);
+	kfree(dev);
+}
+
+static struct configfs_item_operations device_item_operations = {
+	.release	= &device_release,
+};
+
+static const struct config_item_type device_item_type = {
+	.ct_attrs	= device_item_attrs,
+	.ct_item_ops	= &device_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_device_group(struct config_group *group,
+					      const char *name)
+{
+	struct vkms_configfs_device *dev;
+
+	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
+		return ERR_PTR(-EINVAL);
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->config = vkms_config_create(name);
+	if (IS_ERR(dev->config)) {
+		kfree(dev);
+		return ERR_CAST(dev->config);
+	}
+
+	config_group_init_type_name(&dev->group, name, &device_item_type);
+	mutex_init(&dev->lock);
+
+	return &dev->group;
+}
+
+static struct configfs_group_operations device_group_ops = {
+	.make_group = &make_device_group,
+};
+
+static const struct config_item_type device_group_type = {
+	.ct_group_ops	= &device_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem vkms_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_name = "vkms",
+			.ci_type = &device_group_type,
+		},
+	},
+	.su_mutex = __MUTEX_INITIALIZER(vkms_subsys.su_mutex),
+};
+
+int vkms_configfs_register(void)
+{
+	int ret;
+
+	if (is_configfs_registered)
+		return 0;
+
+	config_group_init(&vkms_subsys.su_group);
+	ret = configfs_register_subsystem(&vkms_subsys);
+
+	is_configfs_registered = ret == 0;
+
+	return ret;
+}
+
+void vkms_configfs_unregister(void)
+{
+	if (is_configfs_registered)
+		configfs_unregister_subsystem(&vkms_subsys);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
new file mode 100644
index 000000000000..e9020b0043db
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#ifndef _VKMS_CONFIGFS_H_
+#define _VKMS_CONFIGFS_H_
+
+int vkms_configfs_register(void);
+void vkms_configfs_unregister(void);
+
+#endif /* _VKMS_CONFIGFS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 78af37c7bd83..c1f23e6a4b07 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -28,6 +28,7 @@
 #include <drm/drm_vblank.h>
 
 #include "vkms_config.h"
+#include "vkms_configfs.h"
 #include "vkms_drv.h"
 
 #define DRIVER_NAME	"vkms"
@@ -214,6 +215,10 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
+	ret = vkms_configfs_register();
+	if (ret)
+		return ret;
+
 	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
@@ -250,6 +255,8 @@ void vkms_destroy(struct vkms_config *config)
 
 static void __exit vkms_exit(void)
 {
+	vkms_configfs_unregister();
+
 	if (!default_config)
 		return;
 
-- 
2.51.0

