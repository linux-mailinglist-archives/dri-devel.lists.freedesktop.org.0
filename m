Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F2FA17C58
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C1410E560;
	Tue, 21 Jan 2025 10:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NHQJxeRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B20C10E560
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31C6040007;
 Tue, 21 Jan 2025 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMm1JXHZ3IwcVSCGDPx/XjO13zJJ9xnGIZllfHmkiI4=;
 b=NHQJxeRVdeAdw2pFDUzwZzA/7Ic9eZZJ/3x/Jp/mn9+II0mjgEnknqOGaMuHRDp3es1fY5
 yk2GoHMSpXA47qL5baQxr3PeIua6+6nUpn1jplUoZamPq8tBHZHvdsU52OUd/KdsZJq4oc
 sUFrKiBNykNYxcSbUdS+IVf76HHEDkj4iXyvEuIkKcqM4N25CtNPX1uQtfkGX3k7wU+oDg
 gTGyXis5a9+c4wEWqkiO6P7eJagyZF4fW+RQj5jqF7C1RE5J+whvwBR47WjR9C2MYibCOt
 g9y8vKeQo18X1FELbKGxRYfdvrfzPM6sbf9y6dEET9LAnnuFJaC2k0/AwH0Rcw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:25 +0100
Subject: [PATCH v3 01/16] drm/vkms: Extract vkms_config header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-1-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8128;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gsiygt2fQ2wFhE4Zgg0i+3O3oWlk+bFZUumT4XOlZdU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30g6NBG9iIYnfgkAqQcgl2ahLsblntO0kYLg
 uADuzIq/ImJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IAAKCRAgrS7GWxAs
 4vIjEADWTC/tkJ09rL1yhXV4EtBcUc1C7MisH33176VJijVlQvUrjpZRP9p1c36hE1r7+T8VrdW
 5tzXG5sTrl5e2WvYKYPEd1WVUS8Osy2JioVBKO6ARpPQ7cvlw9hEIsRLBuD0C03buoPwAHwSn2d
 hUUUc4qAaFoJ34Fbzv5nfKdu026fzvhJDFw3HZPkhybba64JUQ+N8cUPdWDQkhG3azusTLhKTdR
 TEbrpU2jcFBkAkxpQybuMEPaD+xvfOKi/usAHcg/6z2DeSdLlV6eDyAMmXAcezdtFeCyJ6W5u/e
 5rlIje062Sl4tNTgRTHcGTUQVeCSPKCb78yaOE2qD+9xnLggu6wcDc8+VvOXmLSGRImVmkvOmt6
 k4jtnacc/cY8BuUCsrQIGjOAmrleIw8jI34OZgiyBJAqv9UjOiWhCAEqlg6iuWlPkh14mYjVwQc
 zQQic5LhloXOdL8u/DSzj3rWii7niM06gTQOwMDoKKCKCR9trs5mY3PXykLtTsoMuYd+NurXzo/
 +t7jNj3MjwPzxOubtzpi4WuCeAlQ80FH6wrg1/cbEskA7/RDxM+ykude4vgzgozV5aXEmgyTop6
 5HL5ZeFqx6kQrwVLIE3TB34VjEOYm3e6xNmFy/54b1rBJ4QRakM9JmgZSWDodTxYuNVxdhQ7XVI
 OvZlmuesN5Ap0aA==
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
index 1b28a6a32948b557867dda51d2ccfdea687a2b62..b371b5d70ee31e76343c2f09e6dc5a6e74a1c246 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -6,6 +6,7 @@ vkms-y := \
 	vkms_formats.o \
 	vkms_crtc.o \
 	vkms_composer.o \
-	vkms_writeback.o
+	vkms_writeback.o \
+	vkms_config.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
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
index 7c142bfc3bd9de9556621db3e7f570dc0a4fab3a..6b0e5fd0e26f04359b0d10252496c52b15d83896 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -28,6 +28,7 @@
 #include <drm/drm_vblank.h>
 
 #include "vkms_drv.h"
+#include "vkms_config.h"
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -81,22 +82,6 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
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
@@ -208,8 +193,7 @@ static int vkms_create(struct vkms_config *config)
 	if (ret)
 		goto out_devres;
 
-	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
-			      ARRAY_SIZE(vkms_config_debugfs_list));
+	vkms_config_register_debugfs(vkms_device);
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
@@ -229,21 +213,18 @@ static int vkms_create(struct vkms_config *config)
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
@@ -272,7 +253,7 @@ static void __exit vkms_exit(void)
 	if (default_config->dev)
 		vkms_destroy(default_config);
 
-	kfree(default_config);
+	vkms_config_destroy(default_config);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index abbb652be2b5389f96cec78837117ceb9acef656..af7081c940d6c074dc01cf8180556a3d902e386d 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -189,20 +189,7 @@ struct vkms_output {
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
index 22f0d678af3ac8177e43c4ea730af3f2109de5f3..78e389d832c16e4dbaccda34fbf3215f34adeadf 100644
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
2.47.1

