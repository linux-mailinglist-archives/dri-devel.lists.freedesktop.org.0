Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D7351D584
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5855110FA70;
	Fri,  6 May 2022 10:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AAE10E22C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 00:18:27 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id i186so5723409vsc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 17:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8UKEnVRuCYJ+gkZMjFQWvY0qkZbqr0ZtBrmxWu5QQSs=;
 b=iqxHpy7Y+wBsNu8YbtDz4I5bhOI9XZS4bwsz68D+mLKQ+rvPXAjnlDO5guXPxn3yCI
 YcCXpmQLaoEtI3qynLFH+mEvA1BvRyPP/aaUdFPoO3pErL4WzZ7yAe2PD0wEznr5bICf
 ietRiykov9UpuJyibKthibMyqcq5czDr0WeNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8UKEnVRuCYJ+gkZMjFQWvY0qkZbqr0ZtBrmxWu5QQSs=;
 b=Upg9enD+3gwSajtgAw0xOslhUbrVV1OXhoXFZQwL1jGNeyzAyNyCbSvJO1OCVlCj4T
 mgbldjx4UNEunP3+Np7KPctLibjKqLYilNqNkA+8Rz1LQC9m1GnQMNr9ygNjz8iozSzR
 ULW+9KKx8ZSnaHMBRfqyvrhhqsodix70WU/IuV3w6CCmI2wbhZ1m1f7fdE1q/IrOqdrg
 A5iCscTxGhHG4ilGUpbGmMuN05vKKGPtI7duQ9+cwTlhbq/oN586fjwizmoC0B67x7cf
 sJpgNeLqznNJmI8QB7Mldtbxg8GOmVdljt+ygkF/QR9XBAiq0CwX79H+IEDRO1PaFkFp
 4LLQ==
X-Gm-Message-State: AOAM531bCZIAHvu2FOLwWkQ767qlqO3ZE8L6Yq3ebk8VQzmF6XqGI0kW
 ODZw5z06kZRIW3t4QaH0mrwNnQ==
X-Google-Smtp-Source: ABdhPJyrzFlcGqjTsiwBXomWulAwwYp/75pKwca2NGVBIz6jD1bAT9O4E8vGY2yiVgCFoNRHc2gnKA==
X-Received: by 2002:a67:1c05:0:b0:32d:3692:489d with SMTP id
 c5-20020a671c05000000b0032d3692489dmr191896vsc.25.1651796306262; 
 Thu, 05 May 2022 17:18:26 -0700 (PDT)
Received: from big-jim.c.googlers.com
 (241.36.196.104.bc.googleusercontent.com. [104.196.36.241])
 by smtp.gmail.com with ESMTPSA id
 e190-20020a1fe7c7000000b0034e6f1fd06esm363742vkh.56.2022.05.05.17.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 17:18:25 -0700 (PDT)
From: Jim Shargo <jshargo@chromium.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [RFC PATCH 1/1] drm/vkms: Add basic support for ConfigFS to VKMS
Date: Fri,  6 May 2022 00:18:21 +0000
Message-Id: <20220506001822.890772-2-jshargo@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220506001822.890772-1-jshargo@chromium.org>
References: <20220506001822.890772-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 May 2022 10:19:04 +0000
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jim Shargo <jshargo@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change adds boilerplate setup for ConfigFS, resulting in a config
directory that looks like this (assuming it's mounted under /config/):

	/config
	`-- vkms
	    |-- connectors
	    |   `-- 52
	    |-- crtcs
	    |   `-- 51
	    |-- encoders
	    |   `-- 53
	    `-- planes
		|-- 31
		|-- 33
		|-- 35
		|-- 37
		|-- 39
		|-- 41
		|-- 43
		|-- 45
		|-- 47
		`-- 49

Notes on the ConfigFS setup:

- Each `vkms/<type>s/<id>/` is a config group/item based directory that
  can have readable and writable attributes set within them.
- Each `vkms/<type>s` directory can have ConfigFS groupops set on them
  to respond to mkdir calls, allowing for the creation of new objects
  within vkms (such as hotplugging a new connector).
---
 Documentation/gpu/vkms.rst           |  23 +++++
 drivers/gpu/drm/Kconfig              |   1 +
 drivers/gpu/drm/vkms/Makefile        |   1 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 129 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c      |  10 +++
 drivers/gpu/drm/vkms/vkms_drv.h      |  25 ++++++
 drivers/gpu/drm/vkms/vkms_output.c   |   2 +
 drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
 8 files changed, 193 insertions(+)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 9c873c3912cc..13233fc87b53 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -51,6 +51,29 @@ To disable the driver, use ::
 
   sudo modprobe -r vkms
 
+Configuration With ConfigFS
+===========================
+
+VKMS is instrumented with support for configuration via `ConfigFS`. With VKMS
+installed, you can mount ConfigFS at /config/ like so::
+
+  mkdir -p /config/
+  sudo mount -t configfs none /config
+
+This will create a directory tree that looks something like this::
+
+  - /config/vkms/
+    - connectors/ -- a list of all the planes available in the VKMS driver
+      - N/ -- the connector with ID=N
+    - crtc/ -- a list of all the crtcs available in the VKMS driver
+      - N/ -- the crtc with ID=N
+    - encoders/ -- a list of all the encoders available in the VKMS driver
+      - N/ -- the encoder with ID=N
+    - planes/ -- a list of all the planes available in the VKMS driver
+      - N/ -- the plane with ID=N.
+
+Settings for each object will appear in the ``/config/vkms/<type>/<N>/`` directory.
+
 Testing With IGT
 ================
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f1422bee3dcc..5c90c82fab6d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -307,6 +307,7 @@ config DRM_VKMS
 	depends on DRM && MMU
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
+	select CONFIGFS_FS
 	select CRC32
 	default n
 	help
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 72f779cbfedd..3efb7b0f5319 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -3,6 +3,7 @@ vkms-y := \
 	vkms_drv.o \
 	vkms_plane.o \
 	vkms_output.o \
+	vkms_configfs.o \
 	vkms_crtc.o \
 	vkms_composer.o \
 	vkms_writeback.o
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
new file mode 100644
index 000000000000..edaa041a830c
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/configfs.h>
+#include <linux/export.h>
+#include <linux/mutex.h>
+
+#include "vkms_drv.h"
+
+static void setup_configfs_object(uint32_t id, struct config_group *object,
+				  struct config_group *parent,
+				  struct config_item_type *type)
+{
+	char name[CONFIGFS_ITEM_NAME_LEN];
+
+	snprintf(name, CONFIGFS_ITEM_NAME_LEN, "%d", id);
+	config_group_init_type_name(object, name, type);
+	configfs_add_default_group(object, parent);
+}
+
+/* connector item, e.g. /config/vkms/connectors/ID */
+
+static struct config_item_type connector_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+/*  crtc item, e.g. /config/vkms/crtc/ID */
+
+static struct config_item_type crtc_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+/*  encoder item, e.g. /config/vkms/encoder/ID */
+
+static struct config_item_type encoder_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+void vkms_init_output_configfs(struct vkms_device *vkmsdev,
+				   struct vkms_output *output)
+{
+	setup_configfs_object(output->connector.base.id,
+				  &output->connector_config_group,
+				  &vkmsdev->configfs.connectors_group,
+				  &connector_type);
+
+	setup_configfs_object(output->crtc.base.id, &output->crtc_config_group,
+				  &vkmsdev->configfs.crtcs_group, &crtc_type);
+
+	setup_configfs_object(output->encoder.base.id,
+				  &output->encoder_config_group,
+				  &vkmsdev->configfs.encoders_group, &encoder_type);
+}
+
+/* Plane item, e.g. /config/vkms/planes/ID */
+
+static struct config_item_type plane_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+void vkms_init_plane_configfs(struct vkms_device *vkmsdev,
+				  struct vkms_plane *plane)
+{
+	setup_configfs_object(plane->base.base.id, &plane->config_group,
+				  &vkmsdev->configfs.planes_group, &plane_type);
+}
+
+/* Directory groups, e.g. /config/vkms/planes */
+
+static struct config_item_type connectors_group_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+static struct config_item_type crtcs_group_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+static struct config_item_type encoders_group_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+static struct config_item_type planes_group_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+/* Root directory group, e.g. /config/vkms/ */
+
+static struct config_item_type vkms_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+static struct configfs_subsystem vkms_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_name = "vkms",
+			.ci_type = &vkms_type,
+		},
+	},
+};
+
+void vkms_init_configfs(struct vkms_device *vkmsdev)
+{
+	config_group_init(&vkms_subsys.su_group);
+	mutex_init(&vkms_subsys.su_mutex);
+
+	config_group_init_type_name(&vkmsdev->configfs.connectors_group,
+					"connectors", &connectors_group_type);
+	configfs_add_default_group(&vkmsdev->configfs.connectors_group,
+				   &vkms_subsys.su_group);
+
+	config_group_init_type_name(&vkmsdev->configfs.crtcs_group, "crtcs",
+					&crtcs_group_type);
+	configfs_add_default_group(&vkmsdev->configfs.crtcs_group,
+				   &vkms_subsys.su_group);
+
+	config_group_init_type_name(&vkmsdev->configfs.encoders_group,
+					"encoders", &encoders_group_type);
+	configfs_add_default_group(&vkmsdev->configfs.encoders_group,
+				   &vkms_subsys.su_group);
+
+	config_group_init_type_name(&vkmsdev->configfs.planes_group, "planes",
+					&planes_group_type);
+	configfs_add_default_group(&vkmsdev->configfs.planes_group,
+				   &vkms_subsys.su_group);
+}
+
+int vkms_register_configfs(void)
+{
+	return configfs_register_subsystem(&vkms_subsys);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..92ca8cf2d104 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -9,6 +9,7 @@
  * the GPU in DRM API tests.
  */
 
+#include <linux/configfs.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
@@ -191,6 +192,8 @@ static int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
+	vkms_init_configfs(vkms_device);
+
 	ret = drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
@@ -207,8 +210,15 @@ static int vkms_create(struct vkms_config *config)
 
 	drm_fbdev_generic_setup(&vkms_device->drm, 0);
 
+	ret = vkms_register_configfs();
+	if (ret)
+		goto out_drmres;
+
+
 	return 0;
 
+out_drmres:
+	drm_dev_unregister(&vkms_device->drm);
 out_devres:
 	devres_release_group(&pdev->dev, NULL);
 out_unregister:
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 91e63b12f60f..873b91f63309 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -3,6 +3,7 @@
 #ifndef _VKMS_DRV_H_
 #define _VKMS_DRV_H_
 
+#include <linux/configfs.h>
 #include <linux/hrtimer.h>
 
 #include <drm/drm.h>
@@ -48,6 +49,7 @@ struct vkms_plane_state {
 
 struct vkms_plane {
 	struct drm_plane base;
+	struct config_group config_group;
 };
 
 /**
@@ -86,6 +88,10 @@ struct vkms_output {
 	/* protects concurrent access to composer */
 	spinlock_t lock;
 
+	struct config_group crtc_config_group;
+	struct config_group encoder_config_group;
+	struct config_group connector_config_group;
+
 	/* protected by @lock */
 	bool composer_enabled;
 	struct vkms_crtc_state *composer_state;
@@ -103,10 +109,22 @@ struct vkms_config {
 	struct vkms_device *dev;
 };
 
+struct vkms_configfs {
+	/* Directory group containing connector configs, e.g. /config/vkms/connectors/ */
+	struct config_group connectors_group;
+	/* Directory group containing CRTC configs, e.g. /config/vkms/crtcs/ */
+	struct config_group crtcs_group;
+	/* Directory group containing encoder configs, e.g. /config/vkms/encoders/ */
+	struct config_group encoders_group;
+	/* Directory group containing plane configs, e.g. /config/vkms/planes/ */
+	struct config_group planes_group;
+};
+
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
 	struct vkms_output output;
+	struct vkms_configfs configfs;
 	const struct vkms_config *config;
 };
 
@@ -145,4 +163,11 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
 
+/* ConfigFS Support */
+void vkms_init_configfs(struct vkms_device *vkmsdev);
+int vkms_register_configfs(void);
+
+void vkms_init_plane_configfs(struct vkms_device *vkmsdev, struct  vkms_plane *plane);
+void vkms_init_output_configfs(struct vkms_device *vkmsdev, struct vkms_output *output);
+
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index ba0e82ae549a..fa80d27118c8 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -111,6 +111,8 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	drm_mode_config_reset(dev);
 
+	vkms_init_output_configfs(vkmsdev, output);
+
 	return 0;
 
 err_attach:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d8eb674b49a6..4b93cfa1bb19 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -195,5 +195,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, funcs);
 
+	vkms_init_plane_configfs(vkmsdev, plane);
+
 	return plane;
 }
-- 
2.36.0.512.ge40c2bad7a-goog

