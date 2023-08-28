Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1A78A780
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 10:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F20410E242;
	Mon, 28 Aug 2023 08:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0305910E23F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 08:19:57 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68becf931bfso1974064b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693210797; x=1693815597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iVTvcZiHxFxltz6f+bgL+HM2NzaLDuzBOhsim/LHad0=;
 b=kgij3udxKwnh/c57jCAn5ad42jfoTwsec2SKS1ynaKZTNbpia+dhlUFquhkzYQD1gD
 VkaZJvu1m3RRFPGtlbgR2YBhXekdY40JiSJGThgyPM3lxLEdPbM7DApuMJPwa7ZGFGHE
 G5/vOxs+EIK9eqXKRt6qk1R/dTdtGVvspTnSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693210797; x=1693815597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iVTvcZiHxFxltz6f+bgL+HM2NzaLDuzBOhsim/LHad0=;
 b=U/8xp3RG+ik1h+FAPMy7OKDIfoOhl3oEZ6wdgCiV7gPXq0MSOkGickynOkaSYTeRx9
 05myYgDEVN1aRY3FBcy/q91X8e8BLkpzi02ZU/QvcN77Jv1iirN9QSN//TWYQR/0HV1h
 yigxX9dLiAk6Mk3iDgw3NXV8ZtX+VTfpo9+3XRxhTY/M/QcA1DFhvRsJUWUqVw2zn31V
 zGfhMj7dKB/fbEhmdoLtiLYgGmLx9pnToRibmrAkUZROF6ReWxkm92jaeC80aMgGLLgT
 bt4OqtMMuKQPL1X36k7+2axprhMUYzsJSNZiQZxEoYjj6wD/Nwqv10IKUxVWFUZ5BLOl
 YRcQ==
X-Gm-Message-State: AOJu0YzCnRrpQoQiIf1VjByDavjfUMPJP9aeHmeyI1PGbFMoF3UXOERT
 waVqTiBTMnK+Z63hCAntupxXRA==
X-Google-Smtp-Source: AGHT+IHuGk9YbzMFbAJsmNSOIDeEhzeBQaGvw1vY0izACKKLmvjwghl81ECD3JxFfQJo3KZrKVWShg==
X-Received: by 2002:a05:6a20:a127:b0:148:97d9:4a71 with SMTP id
 q39-20020a056a20a12700b0014897d94a71mr20125344pzk.39.1693210797525; 
 Mon, 28 Aug 2023 01:19:57 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a170902d91800b001bf6ea340b3sm6616779plz.116.2023.08.28.01.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 01:19:57 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	mairacanal@riseup.net,
	jshargo@chromium.org
Subject: [PATCH v5 7/7] drm/vkms Add hotplug support via configfs to VKMS.
Date: Mon, 28 Aug 2023 08:17:09 +0000
Message-ID: <20230828081929.3574228-8-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230828081929.3574228-1-brpol@chromium.org>
References: <20230828081929.3574228-1-brpol@chromium.org>
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
index c28fa87c196e..fd97511c394f 100644
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
@@ -234,7 +244,58 @@ static void add_possible_encoders(struct config_group *parent,
 
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
 
@@ -262,7 +323,7 @@ static ssize_t plane_type_show(struct config_item *item, char *buf)
 	plane_type = plane->type;
 	mutex_unlock(&configfs->lock);
 
-	return sprintf(buf, "%u", plane_type);
+	return sprintf(buf, "%u\n", plane_type);
 }
 
 static ssize_t plane_type_store(struct config_item *item, const char *buf,
@@ -317,6 +378,7 @@ static struct config_group *connectors_group_make(struct config_group *group,
 				    &connector_type);
 	add_possible_encoders(&connector->config_group,
 			      &connector->possible_encoders.group);
+	connector->connected = false;
 
 	return &connector->config_group;
 }
@@ -498,7 +560,7 @@ static ssize_t device_enabled_show(struct config_item *item, char *buf)
 	is_enabled = configfs->vkms_device != NULL;
 	mutex_unlock(&configfs->lock);
 
-	return sprintf(buf, "%d", is_enabled);
+	return sprintf(buf, "%d\n", is_enabled);
 }
 
 static ssize_t device_enabled_store(struct config_item *item, const char *buf,
@@ -555,7 +617,7 @@ static ssize_t device_id_show(struct config_item *item, char *buf)
 
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
index 883862e2c5f2..360765df2bbe 100644
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
@@ -281,12 +326,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
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
2.42.0.rc1.204.g551eb34607-goog

