Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6274E372
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 03:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFC510E16D;
	Tue, 11 Jul 2023 01:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A5610E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 01:31:58 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5633b7e5f90so3498902eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 18:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689039117; x=1691631117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpwBmodhwsvfRNeyoAOeAuW7yxP/2tzZXjQNfZo3u6I=;
 b=LSpTy/7cLzrzE0X3lITQdibpjgQmNc3tQLqZYRa1cLB7JzjCNN0P14u1wwJZlYLz5m
 F0Xh3Nncn/sPiS43H8WZCqWeZNkjyVdNVSQMSOiEW6dV4CBCsXnSvjKIcpGJg9O9TQFv
 YFmjLTSLPnbZZtVI1od9sdPOfvxDgR2bMR/fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689039117; x=1691631117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EpwBmodhwsvfRNeyoAOeAuW7yxP/2tzZXjQNfZo3u6I=;
 b=kPxsWNoy6bDffNej9R+fyRh79IjKysvsG2CM3CkkLafyOpqzhDycDIgCvLExZg3z1q
 MS17edgAVFv/yMwwtX7/25cb0CRNWDvOniZtSHfpSMBw5fX/NyJv0nSIdHdIN2el+aNn
 /XI/EDWJbEN/0tMD0C10EAd/pX3ZbxrRMLY3nkUv1Hu0xIKQQ92UDH0DOvzFmA7N6KH+
 sg3mjo78MSw/5G/RI6hL/wLmeseIcxUEb29SUXQzNp912L2OLcsZ1WjWSJoSFmNuGs30
 COSbHKXjHT9xSAkiSzqrcKerY+9C24t1f36b3gnNvCynRiDy8P76HxcztgWhpfmok/xr
 Y+RQ==
X-Gm-Message-State: ABy/qLbXhynNRid/Zm4/1VkjUuDtif0Gea8hbPrY5VWUmZCb41AVCpG2
 XJ2Ks37RW+Q9K2qId6ycGzeQsw==
X-Google-Smtp-Source: APBJJlH8hP4nrcjUxuYj+cpS9JR4/nh/F49at4KoR2aEonRkd+yhndgtetXWOkYw0Sr2RSEkOJ/Lqg==
X-Received: by 2002:a05:6870:611f:b0:1b0:3d61:553e with SMTP id
 s31-20020a056870611f00b001b03d61553emr11819661oae.15.1689039116868; 
 Mon, 10 Jul 2023 18:31:56 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a17090a020600b00263dccf96a3sm582592pjc.54.2023.07.10.18.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 18:31:56 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: mairacanal@riseup.net, daniel@ffwll.ch, airlied@gmail.com,
 hamohammed.sa@gmail.com, corbet@lwn.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com,
 tzimmermann@suse.de, yixie@chromium.org
Subject: [PATCH v2] drm/vkms Add hotplug support via configfs to VKMS.
Date: Tue, 11 Jul 2023 01:29:42 +0000
Message-ID: <20230711013148.3155572-1-brpol@chromium.org>
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
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
Cc: jshargo@chromium.org, Brandon Pollack <brpol@chromium.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change adds the ability to read or write a "1" or a "0" to the
newly added "connected" attribute of a connector in the vkms entry in
configfs.

A write will trigger a call to drm_kms_helper_hotplug_event, causing a
hotplug uevent.

With this we can write virtualized multidisplay tests that involve
hotplugging displays (eg recompositing windows when a monitor is turned
off).

Signed-off-by: Brandon Pollack <brpol@chromium.org>
---

This is a first attempt and I am sure I could use some feedback.  I have
this working locally and I'm continuing to develop the test framework
around this prototype, but I'm ready to switch gears back to addressing
your feedback!  

This is also only my second patch ever to the kernel, so if my patch
sending process is a little strange or I'm missing something feedback is
appreciated.

I also am basing these off of jshargo's not yet submitted configFS
changes so I added an in-reply-to to that series.  Not sure if that is
alright.
---
 Documentation/gpu/vkms.rst            |  2 +-
 drivers/gpu/drm/vkms/vkms_configfs.c  | 96 ++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.h       | 11 +++
 drivers/gpu/drm/vkms/vkms_output.c    | 47 ++++++++++++-
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
 5 files changed, 138 insertions(+), 20 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 2c342ef0fb7b..1eaae9f48693 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -144,7 +144,7 @@ Runtime Configuration
 We want to vkms instances without having to reload the module. Such 
 configuration can be added as extensions to vkms's ConfigFS support. Use-cases:
 
-- Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
+- Hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index f5eed6d23dcd..a1ac7716ba1a 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "drm/drm_probe_helper.h"
 #include <linux/configfs.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
@@ -30,7 +31,7 @@
  *
  *   mkdir /config/vkms/test
  *
- * With your device created you'll find an new directory ready to be 
+ * With your device created you'll find an new directory ready to be
  * configured::
  *
  *   /config
@@ -39,6 +40,7 @@
  *       |   `-- enabled
  *       `-- test
  *           |-- connectors
+ *                `-- connected
  *           |-- crtcs
  *           |-- encoders
  *           |-- planes
@@ -48,25 +50,25 @@
  * directories will let you configure a new object of that type. Adding new
  * objects will automatically create a set of default files and folders you can
  * use to configure that object.
- * 
+ *
  * For instance, we can set up a two-output device like so::
- * 
+ *
  *   DRM_PLANE_TYPE_PRIMARY=1
  *   DRM_PLANE_TYPE_CURSOR=2
  *   DRM_PLANE_TYPE_OVERLAY=0
- * 
+ *
  *   mkdir /config/vkms/test/planes/primary
  *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type
- * 
+ *
  *   mkdir /config/vkms/test/planes/other_primary
  *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type
- * 
+ *
  *   mkdir /config/vkms/test/planes/cursor
  *   echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type
- * 
+ *
  *   mkdir /config/vkms/test/planes/overlay
  *   echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type
- * 
+ *
  *   mkdir /config/vkms/test/crtcs/crtc
  *   mkdir /config/vkms/test/crtcs/crtc_other
  *   mkdir /config/vkms/test/encoders/encoder
@@ -75,25 +77,33 @@
  * You can see that specific attributes, such as ``.../<plane>/type``, can be
  * configured by writing into them. Associating objects together can be done via
  * symlinks::
- * 
+ *
  *   ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
- * 
+ *
  *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
  *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
  *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
  *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
- * 
+ *
  *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
  *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/other_primary/possible_crtcs/
- * 
+ *
  * Finally, to enable your configured device, just write 1 to the ``enabled``
  * file::
- * 
+ *
  *   echo 1 > /config/vkms/test/enabled
  *
+ * By default no display is "connected" so to connect a connector you'll also
+ * have to write 1 to a connectors "connected" attribute::
+ *
+ *   echo 1 > /config/vkms/test/connectors/connector/connected
+ *
+ * One can verify that this is worked using the `modetest` utility or the
+ * equivalent for your platform.
+ *
  * When you're done with the virtual device, you can clean up the device like
  * so::
- * 
+ *
  *   echo 0 > /config/vkms/test/enabled
  *
  *   rm /config/vkms/test/connectors/connector/possible_encoders/encoder
@@ -236,7 +246,58 @@ static void add_possible_encoders(struct config_group *parent,
 
 /*  Connector item, e.g. /config/vkms/device/connectors/ID */
 
+static ssize_t connector_connected_show(struct config_item *item, char *buf)
+{
+	struct vkms_config_connector *connector =
+		item_to_config_connector(item);
+	struct vkms_configfs *configfs = connector_item_to_configfs(item);
+	bool connected = false;
+
+	mutex_lock(&configfs->lock);
+	connected = connector->connected;
+	mutex_unlock(&configfs->lock);
+
+	return sprintf(buf, "%d\n", connected);
+}
+
+static ssize_t connector_connected_store(struct config_item *item,
+					 const char *buf, size_t len)
+{
+	struct vkms_config_connector *connector =
+		item_to_config_connector(item);
+	struct vkms_configfs *configfs = connector_item_to_configfs(item);
+	int val, ret;
+
+	ret = kstrtouint(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val != 1 && val != 0)
+		return -EINVAL;
+
+	mutex_lock(&configfs->lock);
+	connector->connected = val;
+	if (!connector->connector) {
+		pr_info("VKMS Device %s is not yet enabled, connector will be enabled on start",
+			configfs->device_group.cg_item.ci_name);
+	}
+	mutex_unlock(&configfs->lock);
+
+	if (connector->connector)
+		drm_kms_helper_hotplug_event(connector->connector->dev);
+
+	return len;
+}
+
+CONFIGFS_ATTR(connector_, connected);
+
+static struct configfs_attribute *connector_attrs[] = {
+	&connector_attr_connected,
+	NULL,
+};
+
 static struct config_item_type connector_type = {
+	.ct_attrs = connector_attrs,
 	.ct_owner = THIS_MODULE,
 };
 
@@ -264,7 +325,7 @@ static ssize_t plane_type_show(struct config_item *item, char *buf)
 	plane_type = plane->type;
 	mutex_unlock(&configfs->lock);
 
-	return sprintf(buf, "%u", plane_type);
+	return sprintf(buf, "%u\n", plane_type);
 }
 
 static ssize_t plane_type_store(struct config_item *item, const char *buf,
@@ -319,6 +380,7 @@ static struct config_group *connectors_group_make(struct config_group *group,
 				    &connector_type);
 	add_possible_encoders(&connector->config_group,
 			      &connector->possible_encoders.group);
+	connector->connected = false;
 
 	return &connector->config_group;
 }
@@ -496,7 +558,7 @@ static ssize_t device_enabled_show(struct config_item *item, char *buf)
 	is_enabled = configfs->vkms_device != NULL;
 	mutex_unlock(&configfs->lock);
 
-	return sprintf(buf, "%d", is_enabled);
+	return sprintf(buf, "%d\n", is_enabled);
 }
 
 static ssize_t device_enabled_store(struct config_item *item, const char *buf,
@@ -553,7 +615,7 @@ static ssize_t device_id_show(struct config_item *item, char *buf)
 	}
 	mutex_unlock(&configfs->lock);
 
-	return sprintf(buf, "%d", id);
+	return sprintf(buf, "%d\n", id);
 }
 
 CONFIGFS_ATTR_RO(device_, id);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8f476ef4009b..7b9b189511c2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -3,6 +3,7 @@
 #ifndef _VKMS_DRV_H_
 #define _VKMS_DRV_H_
 
+#include "drm/drm_connector.h"
 #include <linux/configfs.h>
 #include <linux/hrtimer.h>
 
@@ -135,7 +136,9 @@ struct vkms_config_links {
 
 struct vkms_config_connector {
 	struct config_group config_group;
+	struct drm_connector *connector;
 	struct vkms_config_links possible_encoders;
+	bool connected;
 };
 
 struct vkms_config_crtc {
@@ -208,6 +211,10 @@ struct vkms_device {
 #define item_to_configfs(item) \
 	container_of(to_config_group(item), struct vkms_configfs, device_group)
 
+#define connector_item_to_configfs(item)                                     \
+	container_of(to_config_group(item->ci_parent), struct vkms_configfs, \
+		     connectors_group)
+
 #define item_to_config_connector(item)                                    \
 	container_of(to_config_group(item), struct vkms_config_connector, \
 		     config_group)
@@ -267,4 +274,8 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 int vkms_init_configfs(void);
 void vkms_unregister_configfs(void);
 
+/* Connector hotplugging */
+enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						bool force);
+
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 806ff01954ad..28a50d2149f5 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <drm/drm_print.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
@@ -8,10 +9,12 @@
 #include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <linux/printk.h>
 
 #include "vkms_drv.h"
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
+	.detect = vkms_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
@@ -19,6 +22,48 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static const struct vkms_config_connector *
+find_config_for_connector(struct drm_connector *connector)
+{
+	struct vkms_device *vkms = drm_device_to_vkms_device(connector->dev);
+	struct vkms_configfs *configfs = vkms->configfs;
+	struct config_item *item;
+
+	if (!configfs) {
+		pr_info("Default connector has no configfs entry");
+		return NULL;
+	}
+
+	list_for_each_entry(item, &configfs->connectors_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_connector *config_connector =
+			item_to_config_connector(item);
+		if (config_connector->connector == connector)
+			return config_connector;
+	}
+
+	pr_warn("Could not find config to match connector %s, but configfs was initialized",
+		connector->name);
+
+	return NULL;
+}
+
+enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						bool force)
+{
+	enum drm_connector_status status = connector_status_connected;
+	const struct vkms_config_connector *config_connector =
+		find_config_for_connector(connector);
+
+	if (!config_connector)
+		return connector_status_connected;
+
+	if (!config_connector->connected)
+		status = connector_status_disconnected;
+
+	return status;
+}
+
 static const struct drm_encoder_funcs vkms_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
@@ -218,12 +263,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		struct vkms_config_connector *config_connector =
 			item_to_config_connector(item);
 		struct drm_connector *connector = vkms_connector_init(vkmsdev);
-
 		if (IS_ERR(connector)) {
 			DRM_ERROR("Failed to init connector from config: %s",
 				  item->ci_name);
 			return PTR_ERR(connector);
 		}
+		config_connector->connector = connector;
 
 		for (int j = 0; j < output->num_connectors; j++) {
 			struct encoder_map *encoder = &encoder_map[j];
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index a77d9a6c9b74..47449979c564 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -145,7 +145,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	spin_lock_irq(&vkms_crtc->composer_lock);
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;
-	spin_unlock_irq(&output->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	wb_frame_info->offset = fb->offsets[0];
 	wb_frame_info->pitch = fb->pitches[0];
-- 
2.41.0.390.g38632f3daf-goog

