Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85478BDC6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 07:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5434A10E3B2;
	Tue, 29 Aug 2023 05:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075A310E3B1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 05:32:30 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bf3a2f4528so31275585ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693287149; x=1693891949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIko/pfmfBNdSwNrKy92dB84U18r5zxwiaqrbuGf80A=;
 b=GVzoIlZDIe2iucwo6PZtLUsc76tkdfPTXMqdXEZPNnsnEjiv1rCU71+zdwzk3UrMOH
 CoViq2PWJ0DsvAznqaTSwOHLBTNXNI+2FA3z5qZxFb6mB8KON3NrXLe5yO73VXikTO/Q
 ooa4l+FpkglPlFVTyAOn/yKLZlx5vqYuh16dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693287149; x=1693891949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zIko/pfmfBNdSwNrKy92dB84U18r5zxwiaqrbuGf80A=;
 b=ihy8Oayu1kHCq6hD7Io8nPfT85AXhfyZgxDImnBCE9De6sFzm9EGySndR8dSsFz9aR
 1Cg+9vc+gjr0B/GSimzFI5H78UnFRnP/z/sxLbCE9NHCnPl4ht6cQry+5ZKOBtn387bN
 VIOWdPI+MnzWnyq8QjukVhhNA8I2Bg4v4sHFyyKEuIFaO3/39TXwz7+7HuBZfHbWB6Ax
 5DFcRZxPJF2NnM7oQ8VTTH/zN5F0anVGSrEICObahru8w6ACN36q2ZWlkLRQMRgIJhbi
 ZEl+lL3Ip6pOP7XWDbVCkDKfLuXLS/NHFaRKLA5HPLkjHrt9jQHRk6POqySXvW4+7rxZ
 rArA==
X-Gm-Message-State: AOJu0Yxfz3fpoNLRuaWHLfz12VtE186KTqFZTZj7xXCHc63bpoO5k3mv
 8PQXeVxWgaKhGMFTVcAl79Wcmw==
X-Google-Smtp-Source: AGHT+IFUGa/BlgXJWxGcCYlZuKaAAgQjLsE+7T4pgGLrUAimwq0dcbXE3GHn/Aa5xHAduf0EY1XLKA==
X-Received: by 2002:a17:902:f681:b0:1bb:9c45:130f with SMTP id
 l1-20020a170902f68100b001bb9c45130fmr31290027plg.69.1693287149564; 
 Mon, 28 Aug 2023 22:32:29 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a170902c38600b001bdccf6b8c9sm8420874plg.127.2023.08.28.22.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 22:32:29 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	mairacanal@riseup.net,
	jshargo@chromium.org
Subject: [PATCH v6 7/7] drm/vkms Add hotplug support via configfs to VKMS.
Date: Tue, 29 Aug 2023 05:30:59 +0000
Message-ID: <20230829053201.423261-8-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230829053201.423261-1-brpol@chromium.org>
References: <20230829053201.423261-1-brpol@chromium.org>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mduggan@chromium.org, mripard@kernel.org,
 tzimmermann@suse.de, Brandon Pollack <brpol@chromium.org>
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
 Documentation/gpu/vkms.rst           |  2 +-
 drivers/gpu/drm/vkms/vkms_configfs.c | 68 ++++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++
 drivers/gpu/drm/vkms/vkms_output.c   | 47 ++++++++++++++++++-
 4 files changed, 123 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index c3875bf66dba..7f715097539c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -145,7 +145,7 @@ We want to be able to manipulate vkms instances without having to reload the
 module. Such configuration can be added as extensions to vkms's ConfigFS
 support. Use-cases:
 
-- Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
+- Hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index bc35dcc47585..d231e28101ae 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "drm/drm_probe_helper.h"
 #include <linux/configfs.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
@@ -40,6 +41,7 @@
  *   `-- vkms
  *       `-- test
  *           |-- connectors
+ *                `-- connected
  *           |-- crtcs
  *           |-- encoders
  *           |-- planes
@@ -89,6 +91,14 @@
  *
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
  *
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
@@ -500,7 +562,7 @@ static ssize_t device_enabled_show(struct config_item *item, char *buf)
 	is_enabled = configfs->vkms_device != NULL;
 	mutex_unlock(&configfs->lock);
 
-	return sprintf(buf, "%d", is_enabled);
+	return sprintf(buf, "%d\n", is_enabled);
 }
 
 static ssize_t device_enabled_store(struct config_item *item, const char *buf,
@@ -557,7 +619,7 @@ static ssize_t device_id_show(struct config_item *item, char *buf)
 
 	mutex_unlock(&configfs->lock);
 
-	return sprintf(buf, "%d", id);
+	return sprintf(buf, "%d\n", id);
 }
 
 CONFIGFS_ATTR_RO(device_, id);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 2b9545ada9c2..5336281f397e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -3,6 +3,7 @@
 #ifndef _VKMS_DRV_H_
 #define _VKMS_DRV_H_
 
+#include "drm/drm_connector.h"
 #include <linux/configfs.h>
 #include <linux/hrtimer.h>
 
@@ -147,7 +148,9 @@ struct vkms_config_links {
 
 struct vkms_config_connector {
 	struct config_group config_group;
+	struct drm_connector *connector;
 	struct vkms_config_links possible_encoders;
+	bool connected;
 };
 
 struct vkms_config_crtc {
@@ -220,6 +223,10 @@ struct vkms_device {
 #define item_to_configfs(item) \
 	container_of(to_config_group(item), struct vkms_configfs, device_group)
 
+#define connector_item_to_configfs(item)                                     \
+	container_of(to_config_group(item->ci_parent), struct vkms_configfs, \
+		     connectors_group)
+
 #define item_to_config_connector(item)                                    \
 	container_of(to_config_group(item), struct vkms_config_connector, \
 		     config_group)
@@ -279,4 +286,8 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 int vkms_init_configfs(void);
 void vkms_unregister_configfs(void);
 
+/* Connector hotplugging */
+enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						bool force);
+
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 0ee1f3f4a305..1a1cd0202c5f 100644
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
@@ -280,12 +325,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
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
 
 		for (int j = 0; j < output->num_encoders; j++) {
 			struct encoder_map *encoder = &encoder_map[j];
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

