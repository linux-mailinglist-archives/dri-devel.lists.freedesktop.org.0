Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CED73C40A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 00:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3463310E6D7;
	Fri, 23 Jun 2023 22:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4D010E6D1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 22:25:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f918922954so12610305e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687559137; x=1690151137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqUbtFMW/jmB4bWtWPy/9dwRPlA/NBdqkzPUlPdRG/g=;
 b=iH+eXC4Dh/eDc9yKlipYTpCJ5wrBNd8I0lPIMoi1wTVxa9+eQ1tP2WvuieYEIy535Z
 1yDY0DLgQR3Zlz+XYUo59KPlkwmstiyB2q/C16YyGntJNtgv9WyH2cauUcxrCjanibj9
 SeLQkQn0kige973/4QNmLPZP6QgZg3ZVYAyYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687559137; x=1690151137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqUbtFMW/jmB4bWtWPy/9dwRPlA/NBdqkzPUlPdRG/g=;
 b=EraAaPWPv2a1WYSXwvDHqTdXKFQOZxS7gTDcwNnuwkkl50QF7paVYGdD2yxA4Wew+K
 iPhnX8cDaCIv4ZcfIJtMcykZbPT9j63JW8GJOfz73ucclJsTK2xFoa/r6a47bCIzVY7H
 62aA/y8BQCsxiMR69gL+cdQZYy9hVRqCVhC1QjD0NCx0EIRp80/0ye6OQutwErNmTq88
 i0XXX/OG+hArrJdfAz/+v0tPaqt149uJuFssjjfIAucgCjjoo/lpCb7GhS/9x3Q7Rgp7
 +2p3B6PXIpgGWX8JWHrt513U0uRjORurCPZnYts3g4MxuLD4ojfpFubHQQ6NyBMNmCE3
 Yn2w==
X-Gm-Message-State: AC+VfDw6ShCNmVDnkZioAVDCjTVNGc3rlWiUu2syr0Il1bPOLurqvmwy
 s7F98DscDuZ9H25tOI2hwj3k3w==
X-Google-Smtp-Source: ACHHUZ4q0AlcrgTGeQKGbuT50c0giLfjwZK3Y0uahcuSki4RwQBWGQLKxgAPmrOgAclhfw3z2KZRnA==
X-Received: by 2002:adf:cd87:0:b0:313:e1c0:3f5 with SMTP id
 q7-20020adfcd87000000b00313e1c003f5mr59344wrj.36.1687559136729; 
 Fri, 23 Jun 2023 15:25:36 -0700 (PDT)
Received: from big-boopo.mynetworksettings.com
 (pool-108-46-233-209.nycmny.fios.verizon.net. [108.46.233.209])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4106000000b0030c2e3c7fb3sm453223wrp.101.2023.06.23.15.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 15:25:36 -0700 (PDT)
From: Jim Shargo <jshargo@chromium.org>
To: mairacanal@riseup.net, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/6] drm/vkms: Add ConfigFS scaffolding to VKMS
Date: Fri, 23 Jun 2023 18:23:46 -0400
Message-ID: <20230623222353.97283-5-jshargo@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230623222353.97283-1-jshargo@chromium.org>
References: <20230623222353.97283-1-jshargo@chromium.org>
MIME-Version: 1.0
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
Cc: Jim Shargo <jshargo@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change adds the basic scaffolding for ConfigFS, including setting
up the default directories. It does not allow for the registration of
configfs-backed devices, which is complex and provided in a follow-up
commit.

This CL includes docs about using ConfigFS with VKMS, but I'll summarize
in brief here as well (assuming ConfigFS is mounted at /config/):

To create a new device, you can do so via `mkdir
/config/vkms/my-device`.

This will create a number of directories and files automatically:

	/config
	`-- vkms
	    `-- my-device
		|-- connectors
		|-- crtcs
		|-- encoders
		|-- planes
		`-- enabled

You can then configure objects by mkdir'ing in each of the directories.

When you're satisfied, you can `echo 1 > /config/vkms/my-device/enabled`.
This will create a new device according to your configuration.

For now, this will fail, but the next change will add support for it.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
---
 Documentation/gpu/vkms.rst           |  17 +-
 drivers/gpu/drm/Kconfig              |   1 +
 drivers/gpu/drm/vkms/Makefile        |   1 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 646 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c      |  52 ++-
 drivers/gpu/drm/vkms/vkms_drv.h      |  92 +++-
 drivers/gpu/drm/vkms/vkms_output.c   |   5 +
 7 files changed, 799 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ba04ac7c2167..2c342ef0fb7b 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -51,6 +51,12 @@ To disable the driver, use ::
 
   sudo modprobe -r vkms
 
+Configuration With ConfigFS
+===========================
+
+.. kernel-doc:: drivers/gpu/drm/vkms/vkms_configfs.c
+   :doc: ConfigFS Support for VKMS
+
 Testing With IGT
 ================
 
@@ -135,22 +141,15 @@ project.
 Runtime Configuration
 ---------------------
 
-We want to be able to reconfigure vkms instance without having to reload the
-module. Use/Test-cases:
+We want to vkms instances without having to reload the module. Such 
+configuration can be added as extensions to vkms's ConfigFS support. Use-cases:
 
 - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
-
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
 
-The currently proposed solution is to expose vkms configuration through
-configfs. All existing module options should be supported through configfs
-too.
-
 Writeback support
 -----------------
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..71eb913b378f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -262,6 +262,7 @@ config DRM_VKMS
 	depends on DRM && MMU
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
+	select CONFIGFS_FS
 	select CRC32
 	default n
 	help
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..6b83907ad554 100644
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
index 000000000000..544024735d19
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -0,0 +1,646 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/configfs.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+
+#include "vkms_drv.h"
+
+/**
+ * DOC: ConfigFS Support for VKMS
+ *
+ * VKMS is instrumented with support for configuration via :doc:`ConfigFS
+ * <../filesystems/configfs>`.
+ *
+ * With VKMS installed, you can mount ConfigFS at ``/config/`` like so::
+ *
+ *   mkdir -p /config/
+ *   sudo mount -t configfs none /config
+ *
+ * This allows you to configure multiple virtual devices in addition to an
+ * immutable "default" device created by the driver at initialization time. Note
+ * that the default device is immutable because we cannot pre-populate ConfigFS
+ * directories with normal files.
+ *
+ * To set up a new device, create a new directory under the VKMS configfs
+ * directory::
+ *
+ *   mkdir /config/vkms/test
+ *
+ * With your device created you'll find an new directory ready to be 
+ * configured::
+ *
+ *   /config
+ *   `-- vkms
+ *       |-- default
+ *       |   `-- enabled
+ *       `-- test
+ *           |-- connectors
+ *           |-- crtcs
+ *           |-- encoders
+ *           |-- planes
+ *           `-- enabled
+ *
+ * Each directory you add within the connectors, crtcs, encoders, and planes
+ * directories will let you configure a new object of that type. Adding new
+ * objects will automatically create a set of default files and folders you can
+ * use to configure that object.
+ * 
+ * For instance, we can set up a two-output device like so::
+ * 
+ *   DRM_PLANE_TYPE_PRIMARY=1
+ *   DRM_PLANE_TYPE_CURSOR=2
+ *   DRM_PLANE_TYPE_OVERLAY=0
+ * 
+ *   mkdir /config/vkms/test/planes/primary
+ *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type
+ * 
+ *   mkdir /config/vkms/test/planes/other_primary
+ *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type
+ * 
+ *   mkdir /config/vkms/test/planes/cursor
+ *   echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type
+ * 
+ *   mkdir /config/vkms/test/planes/overlay
+ *   echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type
+ * 
+ *   mkdir /config/vkms/test/crtcs/crtc
+ *   mkdir /config/vkms/test/crtcs/crtc_other
+ *   mkdir /config/vkms/test/encoders/encoder
+ *   mkdir /config/vkms/test/connectors/connector
+ *
+ * You can see that specific attributes, such as ``.../<plane>/type``, can be
+ * configured by writing into them. Associating objects together can be done via
+ * symlinks::
+ * 
+ *   ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
+ * 
+ *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
+ *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
+ *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
+ *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
+ * 
+ *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
+ *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/other_primary/possible_crtcs/
+ * 
+ * Finally, to enable your configured device, just write 1 to the ``enabled``
+ * file::
+ * 
+ *   echo 1 > /config/vkms/test/enabled
+ *
+ * When you're done with the virtual device, you can clean up the device like
+ * so::
+ * 
+ *   echo 0 > /config/vkms/test/enabled
+ *
+ *   rm /config/vkms/test/connectors/connector/possible_encoders/encoder
+ *   rm /config/vkms/test/encoders/encoder/possible_crtcs/crtc
+ *   rm /config/vkms/test/planes/primary/possible_crtcs/crtc
+ *   rm /config/vkms/test/planes/cursor/possible_crtcs/crtc
+ *   rm /config/vkms/test/planes/overlay/possible_crtcs/crtc
+ *   rm /config/vkms/test/planes/overlay/possible_crtcs/crtc_other
+ *   rm /config/vkms/test/planes/other_primary/possible_crtcs/crtc_other
+ *
+ *   rmdir /config/vkms/test/planes/primary
+ *   rmdir /config/vkms/test/planes/other_primary
+ *   rmdir /config/vkms/test/planes/cursor
+ *   rmdir /config/vkms/test/planes/overlay
+ *   rmdir /config/vkms/test/crtcs/crtc
+ *   rmdir /config/vkms/test/crtcs/crtc_other
+ *   rmdir /config/vkms/test/encoders/encoder
+ *   rmdir /config/vkms/test/connectors/connector
+ *
+ *   rmdir /config/vkms/test
+ */
+
+/*
+ * Common helpers (i.e. common sub-groups)
+ */
+
+/* Possible CRTCs, e.g. /config/vkms/device/<object>/possible_crtcs/<symlink> */
+
+static struct config_item_type crtc_type;
+
+static int possible_crtcs_allow_link(struct config_item *src,
+				     struct config_item *target)
+{
+	struct vkms_config_links *links = item_to_config_links(src);
+	struct vkms_config_crtc *crtc;
+
+	if (target->ci_type != &crtc_type) {
+		DRM_ERROR("Unable to link non-CRTCs.\n");
+		return -EINVAL;
+	}
+
+	crtc = item_to_config_crtc(target);
+
+	if (links->linked_object_bitmap & BIT(crtc->crtc_config_idx)) {
+		DRM_ERROR(
+			"Tried to add two symlinks to the same CRTC from the same object\n");
+		return -EINVAL;
+	}
+
+	links->linked_object_bitmap |= BIT(crtc->crtc_config_idx);
+
+	return 0;
+}
+
+static void possible_crtcs_drop_link(struct config_item *src,
+				     struct config_item *target)
+{
+	struct vkms_config_links *links = item_to_config_links(src);
+	struct vkms_config_crtc *crtc = item_to_config_crtc(target);
+
+	links->linked_object_bitmap &= ~BIT(crtc->crtc_config_idx);
+}
+
+static struct configfs_item_operations possible_crtcs_item_ops = {
+	.allow_link = &possible_crtcs_allow_link,
+	.drop_link = &possible_crtcs_drop_link,
+};
+
+static struct config_item_type possible_crtcs_group_type = {
+	.ct_item_ops = &possible_crtcs_item_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+static void add_possible_crtcs(struct config_group *parent,
+			       struct config_group *possible_crtcs)
+{
+	config_group_init_type_name(possible_crtcs, "possible_crtcs",
+				    &possible_crtcs_group_type);
+	configfs_add_default_group(possible_crtcs, parent);
+}
+
+/* Possible encoders, e.g. /config/vkms/device/connector/possible_encoders/<symlink> */
+
+static struct config_item_type encoder_type;
+
+static int possible_encoders_allow_link(struct config_item *src,
+					struct config_item *target)
+{
+	struct vkms_config_links *links = item_to_config_links(src);
+	struct vkms_config_encoder *encoder;
+
+	if (target->ci_type != &encoder_type) {
+		DRM_ERROR("Unable to link non-encoders.\n");
+		return -EINVAL;
+	}
+
+	encoder = item_to_config_encoder(target);
+
+	if (links->linked_object_bitmap & BIT(encoder->encoder_config_idx)) {
+		DRM_ERROR(
+			"Tried to add two symlinks to the same encoder from the same object\n");
+		return -EINVAL;
+	}
+
+	links->linked_object_bitmap |= BIT(encoder->encoder_config_idx);
+
+	return 0;
+}
+
+static void possible_encoders_drop_link(struct config_item *src,
+					struct config_item *target)
+{
+	struct vkms_config_links *links = item_to_config_links(src);
+	struct vkms_config_encoder *encoder = item_to_config_encoder(target);
+
+	links->linked_object_bitmap &= ~BIT(encoder->encoder_config_idx);
+}
+
+static struct configfs_item_operations possible_encoders_item_ops = {
+	.allow_link = &possible_encoders_allow_link,
+	.drop_link = &possible_encoders_drop_link,
+};
+
+static struct config_item_type possible_encoders_group_type = {
+	.ct_item_ops = &possible_encoders_item_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+static void add_possible_encoders(struct config_group *parent,
+				  struct config_group *possible_encoders)
+{
+	config_group_init_type_name(possible_encoders, "possible_encoders",
+				    &possible_encoders_group_type);
+	configfs_add_default_group(possible_encoders, parent);
+}
+
+/*
+ * Individual objects (connectors, crtcs, encoders, planes):
+ */
+
+/*  Connector item, e.g. /config/vkms/device/connectors/ID */
+
+static struct config_item_type connector_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+/*  Crtc item, e.g. /config/vkms/device/crtcs/ID */
+
+static struct config_item_type crtc_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+/*  Encoder item, e.g. /config/vkms/device/encoder/ID */
+
+static struct config_item_type encoder_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+/*  Plane item, e.g. /config/vkms/device/planes/ID */
+
+static ssize_t plane_type_show(struct config_item *item, char *buf)
+{
+	struct vkms_config_plane *plane = item_to_config_plane(item);
+	struct vkms_configfs *configfs = plane_item_to_configfs(item);
+	enum drm_plane_type plane_type;
+
+	mutex_lock(&configfs->lock);
+	plane_type = plane->type;
+	mutex_unlock(&configfs->lock);
+
+	return sprintf(buf, "%u", plane_type);
+}
+
+static ssize_t plane_type_store(struct config_item *item, const char *buf,
+				size_t len)
+{
+	struct vkms_config_plane *plane = item_to_config_plane(item);
+	struct vkms_configfs *configfs = plane_item_to_configfs(item);
+	int val, ret;
+
+	ret = kstrtouint(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val != DRM_PLANE_TYPE_PRIMARY && val != DRM_PLANE_TYPE_CURSOR &&
+	    val != DRM_PLANE_TYPE_OVERLAY)
+		return -EINVAL;
+
+	mutex_lock(&configfs->lock);
+	plane->type = val;
+	mutex_unlock(&configfs->lock);
+
+	return len;
+}
+
+CONFIGFS_ATTR(plane_, type);
+
+static struct configfs_attribute *plane_attrs[] = {
+	&plane_attr_type,
+	NULL,
+};
+
+static struct config_item_type plane_type = {
+	.ct_attrs = plane_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+/*
+ * Directory groups, e.g. /config/vkms/device/{planes, crtcs, ...}
+ */
+
+/* Connectors group: /config/vkms/device/connectors/ */
+
+static struct config_group *connectors_group_make(struct config_group *group,
+						  const char *name)
+{
+	struct vkms_config_connector *connector =
+		kzalloc(sizeof(*connector), GFP_KERNEL);
+	if (!connector)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&connector->config_group, name,
+				    &connector_type);
+	add_possible_encoders(&connector->config_group,
+			      &connector->possible_encoders.group);
+
+	return &connector->config_group;
+}
+
+static void connectors_group_drop(struct config_group *group,
+				  struct config_item *item)
+{
+	struct vkms_config_connector *connector =
+		item_to_config_connector(item);
+	kfree(connector);
+}
+
+static struct configfs_group_operations connectors_group_ops = {
+	.make_group = &connectors_group_make,
+	.drop_item = &connectors_group_drop,
+};
+
+static struct config_item_type connectors_group_type = {
+	.ct_group_ops = &connectors_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+/* CRTCs group: /config/vkms/device/crtcs/ */
+
+static struct config_group *crtcs_group_make(struct config_group *group,
+					     const char *name)
+{
+	struct vkms_configfs *configfs =
+		container_of(group, struct vkms_configfs, crtcs_group);
+	unsigned long next_idx;
+	struct vkms_config_crtc *crtc;
+
+	mutex_lock(&configfs->lock);
+
+	next_idx = find_first_zero_bit(&configfs->allocated_crtcs,
+				       VKMS_MAX_OUTPUT_OBJECTS);
+
+	if (next_idx == VKMS_MAX_OUTPUT_OBJECTS) {
+		DRM_ERROR("Unable to allocate another CRTC.\n");
+		mutex_unlock(&configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
+	if (!crtc) {
+		DRM_ERROR("Unable to allocate CRTC.\n");
+		mutex_unlock(&configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config_group_init_type_name(&crtc->config_group, name, &crtc_type);
+	crtc->crtc_config_idx = next_idx;
+
+	set_bit(next_idx, &configfs->allocated_crtcs);
+
+	mutex_unlock(&configfs->lock);
+
+	return &crtc->config_group;
+}
+
+static void crtcs_group_drop(struct config_group *group,
+			     struct config_item *item)
+{
+	struct vkms_config_crtc *crtc = item_to_config_crtc(item);
+	kfree(crtc);
+}
+
+static struct configfs_group_operations crtcs_group_ops = {
+	.make_group = &crtcs_group_make,
+	.drop_item = &crtcs_group_drop,
+};
+
+static struct config_item_type crtcs_group_type = {
+	.ct_group_ops = &crtcs_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+/* Encoders group: /config/vkms/device/encoders/ */
+
+static struct config_group *encoders_group_make(struct config_group *group,
+						const char *name)
+{
+	struct vkms_configfs *configfs =
+		container_of(group, struct vkms_configfs, encoders_group);
+	unsigned long next_idx;
+	struct vkms_config_encoder *encoder;
+
+	mutex_lock(&configfs->lock);
+
+	next_idx = find_first_zero_bit(&configfs->allocated_encoders,
+				       VKMS_MAX_OUTPUT_OBJECTS);
+
+	if (next_idx == VKMS_MAX_OUTPUT_OBJECTS) {
+		DRM_ERROR("Unable to allocate another encoder.\n");
+		mutex_unlock(&configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
+	if (!encoder) {
+		DRM_ERROR("Unable to allocate encoder.\n");
+		mutex_unlock(&configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config_group_init_type_name(&encoder->config_group, name,
+				    &encoder_type);
+	add_possible_crtcs(&encoder->config_group,
+			   &encoder->possible_crtcs.group);
+	encoder->encoder_config_idx = next_idx;
+	set_bit(next_idx, &configfs->allocated_encoders);
+
+	mutex_unlock(&configfs->lock);
+
+	return &encoder->config_group;
+}
+
+static void encoders_group_drop(struct config_group *group,
+				struct config_item *item)
+{
+	struct vkms_config_encoder *encoder = item_to_config_encoder(item);
+	kfree(encoder);
+}
+
+static struct configfs_group_operations encoders_group_ops = {
+	.make_group = &encoders_group_make,
+	.drop_item = &encoders_group_drop,
+};
+
+static struct config_item_type encoders_group_type = {
+	.ct_group_ops = &encoders_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+/* Planes group: /config/vkms/device/planes/ */
+
+static struct config_group *make_plane_group(struct config_group *group,
+					     const char *name)
+{
+	struct vkms_config_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+	if (!plane)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&plane->config_group, name, &plane_type);
+	add_possible_crtcs(&plane->config_group, &plane->possible_crtcs.group);
+
+	return &plane->config_group;
+}
+
+static void drop_plane_group(struct config_group *group,
+			     struct config_item *item)
+{
+	struct vkms_config_plane *plane = item_to_config_plane(item);
+	kfree(plane);
+}
+
+static struct configfs_group_operations plane_group_ops = {
+	.make_group = &make_plane_group,
+	.drop_item = &drop_plane_group,
+};
+
+static struct config_item_type planes_group_type = {
+	.ct_group_ops = &plane_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+/* Root directory group, e.g. /config/vkms/device */
+
+static ssize_t device_enabled_show(struct config_item *item, char *buf)
+{
+	struct vkms_configfs *configfs = item_to_configfs(item);
+	bool is_enabled;
+
+	mutex_lock(&configfs->lock);
+	is_enabled = configfs->vkms_device != NULL;
+	mutex_unlock(&configfs->lock);
+
+	return sprintf(buf, "%d", is_enabled);
+}
+
+static ssize_t device_enabled_store(struct config_item *item, const char *buf,
+				    size_t len)
+{
+	struct vkms_configfs *configfs = item_to_configfs(item);
+	struct vkms_device *device;
+	int value, ret;
+
+	ret = kstrtoint(buf, 0, &value);
+	if (ret)
+		return ret;
+
+	if (value != 1)
+		return -EINVAL;
+
+	mutex_lock(&configfs->lock);
+
+	if (configfs->vkms_device) {
+		mutex_unlock(&configfs->lock);
+		return len;
+	}
+
+	device = vkms_add_device(configfs);
+	mutex_unlock(&configfs->lock);
+
+	if (IS_ERR(device))
+		return -PTR_ERR(device);
+
+	return len;
+}
+
+CONFIGFS_ATTR(device_, enabled);
+
+static ssize_t device_id_show(struct config_item *item, char *buf)
+{
+	struct vkms_configfs *configfs = item_to_configfs(item);
+	int id = -1;
+
+	mutex_lock(&configfs->lock);
+	if (configfs->vkms_device) {
+		id = configfs->vkms_device->platform->id;
+	}
+	mutex_unlock(&configfs->lock);
+
+	return sprintf(buf, "%d", id);
+}
+
+CONFIGFS_ATTR_RO(device_, id);
+
+static struct configfs_attribute *device_group_attrs[] = {
+	&device_attr_id,
+	&device_attr_enabled,
+	NULL,
+};
+
+static struct config_item_type device_group_type = {
+	.ct_attrs = device_group_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+static void vkms_configfs_setup_default_groups(struct vkms_configfs *configfs,
+					       const char *name)
+{
+	config_group_init_type_name(&configfs->device_group, name,
+				    &device_group_type);
+
+	config_group_init_type_name(&configfs->connectors_group, "connectors",
+				    &connectors_group_type);
+	configfs_add_default_group(&configfs->connectors_group,
+				   &configfs->device_group);
+
+	config_group_init_type_name(&configfs->crtcs_group, "crtcs",
+				    &crtcs_group_type);
+	configfs_add_default_group(&configfs->crtcs_group,
+				   &configfs->device_group);
+
+	config_group_init_type_name(&configfs->encoders_group, "encoders",
+				    &encoders_group_type);
+	configfs_add_default_group(&configfs->encoders_group,
+				   &configfs->device_group);
+
+	config_group_init_type_name(&configfs->planes_group, "planes",
+				    &planes_group_type);
+	configfs_add_default_group(&configfs->planes_group,
+				   &configfs->device_group);
+}
+
+/* Root directory group and subsystem, e.g. /config/vkms/ */
+
+static struct config_group *make_root_group(struct config_group *group,
+					    const char *name)
+{
+	struct vkms_configfs *configfs = kzalloc(sizeof(*configfs), GFP_KERNEL);
+
+	if (!configfs)
+		return ERR_PTR(-ENOMEM);
+
+	vkms_configfs_setup_default_groups(configfs, name);
+	mutex_init(&configfs->lock);
+
+	return &configfs->device_group;
+}
+
+static void drop_root_group(struct config_group *group,
+			    struct config_item *item)
+{
+	struct vkms_configfs *configfs = item_to_configfs(item);
+
+	mutex_lock(&configfs->lock);
+	if (configfs->vkms_device)
+		vkms_remove_device(configfs->vkms_device);
+	mutex_unlock(&configfs->lock);
+
+	kfree(configfs);
+}
+
+static struct configfs_group_operations root_group_ops = {
+	.make_group = &make_root_group,
+	.drop_item = &drop_root_group,
+};
+
+static struct config_item_type vkms_type = {
+	.ct_group_ops = &root_group_ops,
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
+  .su_mutex = __MUTEX_INITIALIZER(vkms_subsys.su_mutex),
+};
+
+int vkms_init_configfs(void)
+{
+	config_group_init(&vkms_subsys.su_group);
+	return configfs_register_subsystem(&vkms_subsys);
+}
+
+void vkms_unregister_configfs(void)
+{
+	configfs_unregister_subsystem(&vkms_subsys);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index d43121addf66..1b5b7143792f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -9,7 +9,10 @@
  * the GPU in DRM API tests.
  */
 
+#include <linux/configfs.h>
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
@@ -152,8 +155,8 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-	return vkmsdev->is_default ? vkms_output_init_default(vkmsdev) :
-				     -ENOSYS;
+	return vkmsdev->configfs ? vkms_output_init(vkmsdev) :
+				   vkms_output_init_default(vkmsdev);
 }
 
 static int vkms_platform_probe(struct platform_device *pdev)
@@ -165,6 +168,7 @@ static int vkms_platform_probe(struct platform_device *pdev)
 
 	grp = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
 	if (!grp) {
+		DRM_ERROR("Could not open devres group\n");
 		return -ENOMEM;
 	}
 
@@ -179,7 +183,7 @@ static int vkms_platform_probe(struct platform_device *pdev)
 	vkms_device->config.cursor = enable_cursor;
 	vkms_device->config.writeback = enable_writeback;
 	vkms_device->config.overlay = enable_overlay;
-	vkms_device->is_default = vkms_device_setup->is_default;
+	vkms_device->configfs = vkms_device_setup->configfs;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
@@ -239,12 +243,43 @@ static struct platform_driver vkms_platform_driver = {
 	.driver.name = DRIVER_NAME,
 };
 
+struct vkms_device *vkms_add_device(struct vkms_configfs *configfs)
+{
+	struct device *dev = NULL;
+	struct platform_device *pdev;
+	int max_id = 1;
+	struct vkms_device_setup vkms_device_setup = {
+		.configfs = configfs,
+	};
+
+	while ((dev = platform_find_device_by_driver(
+			dev, &vkms_platform_driver.driver))) {
+		pdev = to_platform_device(dev);
+		max_id = max(max_id, pdev->id);
+	}
+
+	pdev = platform_device_register_data(NULL, DRIVER_NAME, max_id + 1,
+					     &vkms_device_setup,
+					     sizeof(vkms_device_setup));
+	if (IS_ERR(pdev)) {
+		DRM_ERROR("Unable to register vkms device'\n");
+		return ERR_PTR(PTR_ERR(pdev));
+	}
+
+	return platform_get_drvdata(pdev);
+}
+
+void vkms_remove_device(struct vkms_device *vkms_device)
+{
+	platform_device_unregister(vkms_device->platform);
+}
+
 static int __init vkms_init(void)
 {
 	int ret;
 	struct platform_device *pdev;
 	struct vkms_device_setup vkms_device_setup = {
-		.is_default = true,
+		.configfs = NULL,
 	};
 
 	ret = platform_driver_register(&vkms_platform_driver);
@@ -262,6 +297,13 @@ static int __init vkms_init(void)
 		return PTR_ERR(pdev);
 	}
 
+	ret = vkms_init_configfs();
+	if (ret) {
+		DRM_ERROR("Unable to initialize configfs\n");
+		platform_device_unregister(pdev);
+		platform_driver_unregister(&vkms_platform_driver);
+	}
+
 	return 0;
 }
 
@@ -269,6 +311,8 @@ static void __exit vkms_exit(void)
 {
 	struct device *dev;
 
+	vkms_unregister_configfs();
+
 	while ((dev = platform_find_device_by_driver(
 			NULL, &vkms_platform_driver.driver))) {
 		// platform_find_device_by_driver increments the refcount. Drop 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 84b35aa1dc5a..3634eeeb4548 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -3,6 +3,7 @@
 #ifndef _VKMS_DRV_H_
 #define _VKMS_DRV_H_
 
+#include <linux/configfs.h>
 #include <linux/hrtimer.h>
 
 #include <drm/drm.h>
@@ -10,6 +11,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_writeback.h>
 
 #define XRES_MIN    10
@@ -127,14 +129,65 @@ struct vkms_config {
 	bool overlay;
 };
 
+struct vkms_config_links {
+	struct config_group group;
+	unsigned long linked_object_bitmap;
+};
+
+struct vkms_config_connector {
+	struct config_group config_group;
+	struct vkms_config_links possible_encoders;
+};
+
+struct vkms_config_crtc {
+	struct config_group config_group;
+	unsigned long crtc_config_idx;
+};
+
+struct vkms_config_encoder {
+	struct config_group config_group;
+	struct vkms_config_links possible_crtcs;
+	unsigned long encoder_config_idx;
+};
+
+struct vkms_config_plane {
+	struct vkms_configfs *configfs;
+	struct config_group config_group;
+	struct vkms_config_links possible_crtcs;
+	enum drm_plane_type type;
+};
+
+struct vkms_configfs {
+	/* Directory group containing connector configs, e.g. /config/vkms/device/ */
+	struct config_group device_group;
+	/* Directory group containing connector configs, e.g. /config/vkms/device/connectors/ */
+	struct config_group connectors_group;
+	/* Directory group containing CRTC configs, e.g. /config/vkms/device/crtcs/ */
+	struct config_group crtcs_group;
+	/* Directory group containing encoder configs, e.g. /config/vkms/device/encoders/ */
+	struct config_group encoders_group;
+	/* Directory group containing plane configs, e.g. /config/vkms/device/planes/ */
+	struct config_group planes_group;
+
+	unsigned long allocated_crtcs;
+	unsigned long allocated_encoders;
+
+	struct mutex lock;
+
+	/* The platform device if this is registered, otherwise NULL */
+	struct vkms_device *vkms_device;
+};
+
 struct vkms_device_setup {
-	bool is_default;
+	// Is NULL in the case of the default card.
+	struct vkms_configfs *configfs;
 };
 
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
-	bool is_default;
+	// Is NULL in the case of the default card.
+	struct vkms_configfs *configfs;
 	struct vkms_output output;
 	struct vkms_config config;
 };
@@ -153,11 +206,42 @@ struct vkms_device {
 #define to_vkms_plane_state(target)\
 	container_of(target, struct vkms_plane_state, base.base)
 
+#define item_to_configfs(item) \
+	container_of(to_config_group(item), struct vkms_configfs, device_group)
+
+#define item_to_config_connector(item)                                    \
+	container_of(to_config_group(item), struct vkms_config_connector, \
+		     config_group)
+
+#define item_to_config_crtc(item)                                    \
+	container_of(to_config_group(item), struct vkms_config_crtc, \
+		     config_group)
+
+#define item_to_config_encoder(item)                                    \
+	container_of(to_config_group(item), struct vkms_config_encoder, \
+		     config_group)
+
+#define item_to_config_plane(item)                                    \
+	container_of(to_config_group(item), struct vkms_config_plane, \
+		     config_group)
+
+#define item_to_config_links(item) \
+	container_of(to_config_group(item), struct vkms_config_links, group)
+
+#define plane_item_to_configfs(item)                                         \
+	container_of(to_config_group(item->ci_parent), struct vkms_configfs, \
+		     planes_group)
+
+/* Devices */
+struct vkms_device *vkms_add_device(struct vkms_configfs *configfs);
+void vkms_remove_device(struct vkms_device *vkms_device);
+
 /* CRTC */
 struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 				 struct drm_plane *primary,
 				 struct drm_plane *cursor);
 
+int vkms_output_init(struct vkms_device *vkmsdev);
 int vkms_output_init_default(struct vkms_device *vkmsdev);
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
@@ -179,4 +263,8 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 				    struct vkms_crtc *vkms_crtc);
 
+/* ConfigFS Support */
+int vkms_init_configfs(void);
+void vkms_unregister_configfs(void);
+
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 3b5e272a8b33..c9e6c653de19 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -177,3 +177,8 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
 
 	return ret;
 }
+
+int vkms_output_init(struct vkms_device *vkmsdev)
+{
+	return -ENOTSUPP;
+}
-- 
2.41.0.162.gfafddb0af9-goog

