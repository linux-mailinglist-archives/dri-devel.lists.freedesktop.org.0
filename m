Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675AE9502E8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DC610E2F7;
	Tue, 13 Aug 2024 10:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LMXBYb21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D738C10E2EE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:54 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-428e3129851so39288225e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546313; x=1724151113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HVBRH0DnuLVDwokIb7HrZrE7ZLWioaYtKcu7A5ZTgas=;
 b=LMXBYb217wEuOUKaV2hA3yTlz2/z1Qz6JiVQGHdxU1Nr9S3oUvzquxY7qkabmFYbaP
 Vi7J/PvyxofjF4Ghm+51Y+nSkXxF6BAl5edb7EB1NWrRT0LtP/DwBnFiXhaQm/ZBPWlK
 v5unDJNfqTzwBgNTPuyQpuLZKeoBJfGxqjFV3rNwWFlqWzGVhOyfLm6CWRppCpZVDObJ
 oC6tWx/isgk4Edg6NHpsiHyNgqcLmuRuCvncJw2sG7MbGHNjJEVdJ2MsiYor3Bik6fnt
 yrLa51NfTLABikRVfpfDjsiqvc/e8hsv5B3HTMzRZROosCM6F63wDOLND1El0MY96tke
 GEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546313; x=1724151113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HVBRH0DnuLVDwokIb7HrZrE7ZLWioaYtKcu7A5ZTgas=;
 b=m/KHEwGgai+FBX+RCF3Y5ZNHEJPcocbN/oEv7VvYlkPkMH7NZdFMHD1JAnDg/cxU5E
 u/nV8bYJMGlRVTimd/2Mkq9DSkGtnuZSkxkEdc8M8CYx4f8/HVVaiOMk4rWsDSwQfTng
 hGC5Ku+AxMGlb68P/P9ZFKJmARekBKnzNZXA5onGmDtfE5y4EfEo48WEvTpGMmhRpMbh
 3eLrx7zU/aKOszueCeXsWWLWEdZhtq0AJ/FIJKsEr/mbr5RO+IfutEWIcPLKkAE9yhYV
 C9a6QGadm7zOPGU0R+5i+8BUcRxqq77eCziUq1r0xsoMfZh8Qj5S4bO46WQvWyRgtQ8o
 uBUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC1Kx1Bsr5r1m0wBk0uq+cV1frujtOqqzhU78v2jATNkGwhpKkCLlWatF9itYWg4TfB7XGY4zvZ0Xue6444ywb+N4VhO/rf8jBFrUUrc0F
X-Gm-Message-State: AOJu0Yz9iePG+jvTtgCKoearohy38JbFyP3Z5MCVYK8hqhE0wd6jl/Q7
 O1vYLeF6mEUCJffHoU1HNLzPBRatatGb/8h3Fh1uBepc70qfpLOW
X-Google-Smtp-Source: AGHT+IGx0zK/ifNLLcqjgImibQLg2NAxwokcq14IJSh6ZqPBkiUD5RKQjid95Vj2DBXdcE20rEuz4A==
X-Received: by 2002:a05:600c:3b1f:b0:427:ffa4:32d0 with SMTP id
 5b1f17b1804b1-429d48711f6mr24333315e9.28.1723546313053; 
 Tue, 13 Aug 2024 03:51:53 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:52 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 12/17] drm/vkms: Allow to configure multiple CRTCs via
 configfs
Date: Tue, 13 Aug 2024 12:44:23 +0200
Message-ID: <20240813105134.17439-13-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813105134.17439-1-jose.exposito89@gmail.com>
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/crtcs to allow to create as
many CRTCs as required. When a CRTC is created, allow to configure the
equivalent of the module parameters enable_cursor and enable_writeback.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  22 +++-
 drivers/gpu/drm/vkms/vkms_config.h   |   3 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 149 +++++++++++++++++++++++++--
 3 files changed, 166 insertions(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 9895a9ae76f4..0886349ad4a0 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -71,6 +71,25 @@ By default, the instance is disabled::
   cat /config/vkms/my-vkms/enabled
   0
 
+And directories are created for each configurable item of the display pipeline::
+
+  tree /config/vkms/my-vkms
+    /config/vkms/my-vkms
+    ├── crtcs
+    └── enabled
+
+To add items to the display pipeline, create one or more directories under the
+available paths.
+
+Start by creating one or more CRTCs::
+
+  sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
+
+CRTCs have 2 configurable attributes:
+
+- cursor: Enable or disable cursor plane support
+- writeback: Enable or disable writeback connector support
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -79,8 +98,9 @@ Finally, you can remove the VKMS instance disabling it::
 
   echo "0" | sudo tee /config/vkms/my-vkms/enabled
 
-Or removing the top level directory::
+Or removing the top level directory and its subdirectories::
 
+  sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 3237406fa3a3..f96a0456a3d7 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -3,6 +3,7 @@
 #ifndef _VKMS_CONFIG_H_
 #define _VKMS_CONFIG_H_
 
+#include <linux/configfs.h>
 #include <linux/list.h>
 #include <linux/types.h>
 
@@ -20,6 +21,8 @@ struct vkms_config_crtc {
 	unsigned int index;
 	bool cursor;
 	bool writeback;
+	/* only used if created from configfs */
+	struct config_group crtc_group;
 };
 
 struct vkms_config_encoder {
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 3f25295f7788..04278a39cd3c 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -17,6 +17,8 @@ static bool is_configfs_registered;
  * @vkms_config: Configuration of the VKMS device
  * @device_group: Top level configuration group that represents a VKMS device.
  * Initialized when a new directory is created under "/config/vkms/"
+ * @crtcs_group: Default subgroup of @device_group at "/config/vkms/crtcs".
+ * Each of its items represent a CRTC
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @enabled: Protected by @lock. The device is created or destroyed when this
  * option changes
@@ -24,6 +26,7 @@ static bool is_configfs_registered;
 struct vkms_configfs {
 	struct vkms_config *vkms_config;
 	struct config_group device_group;
+	struct config_group crtcs_group;
 
 	/* protected by @lock */
 	struct mutex lock;
@@ -33,6 +36,141 @@ struct vkms_configfs {
 #define config_item_to_vkms_configfs(item) \
 	container_of(to_config_group(item), struct vkms_configfs, device_group)
 
+#define crtcs_group_to_vkms_configfs(group) \
+	container_of(group, struct vkms_configfs, crtcs_group)
+
+#define crtcs_item_to_vkms_configfs(item) \
+	container_of(to_config_group(item), struct vkms_configfs, crtcs_group)
+
+#define crtcs_item_to_vkms_config_crtc(item) \
+	container_of(to_config_group(item), struct vkms_config_crtc, crtc_group)
+
+static ssize_t crtc_cursor_show(struct config_item *item, char *page)
+{
+	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
+
+	return sprintf(page, "%d\n", crtc_cfg->cursor);
+}
+
+static ssize_t crtc_cursor_store(struct config_item *item, const char *page,
+				 size_t count)
+{
+	struct vkms_configfs *configfs = crtcs_item_to_vkms_configfs(item->ci_parent);
+	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
+	bool cursor;
+
+	if (kstrtobool(page, &cursor))
+		return -EINVAL;
+
+	mutex_lock(&configfs->lock);
+
+	if (configfs->enabled) {
+		mutex_unlock(&configfs->lock);
+		return -EINVAL;
+	}
+
+	crtc_cfg->cursor = cursor;
+
+	mutex_unlock(&configfs->lock);
+
+	return (ssize_t)count;
+}
+
+static ssize_t crtc_writeback_show(struct config_item *item, char *page)
+{
+	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
+
+	return sprintf(page, "%d\n", crtc_cfg->writeback);
+}
+
+static ssize_t crtc_writeback_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs *configfs = crtcs_item_to_vkms_configfs(item->ci_parent);
+	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
+	bool writeback;
+
+	if (kstrtobool(page, &writeback))
+		return -EINVAL;
+
+	mutex_lock(&configfs->lock);
+
+	if (configfs->enabled) {
+		mutex_unlock(&configfs->lock);
+		return -EINVAL;
+	}
+
+	crtc_cfg->writeback = writeback;
+
+	mutex_unlock(&configfs->lock);
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(crtc_, cursor);
+CONFIGFS_ATTR(crtc_, writeback);
+
+static struct configfs_attribute *crtc_group_attrs[] = {
+	&crtc_attr_cursor,
+	&crtc_attr_writeback,
+	NULL,
+};
+
+static const struct config_item_type crtc_group_type = {
+	.ct_attrs = crtc_group_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+static struct config_group *make_crtcs_group(struct config_group *group,
+					     const char *name)
+{
+	struct vkms_configfs *configfs = crtcs_group_to_vkms_configfs(group);
+	struct vkms_config_crtc *crtc_cfg;
+	int ret;
+
+	mutex_lock(&configfs->lock);
+
+	if (configfs->enabled) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	crtc_cfg = vkms_config_add_crtc(configfs->vkms_config, false, false);
+	if (IS_ERR(crtc_cfg)) {
+		ret = PTR_ERR(crtc_cfg);
+		goto err_unlock;
+	}
+
+	config_group_init_type_name(&crtc_cfg->crtc_group, name, &crtc_group_type);
+
+	mutex_unlock(&configfs->lock);
+
+	return &crtc_cfg->crtc_group;
+
+err_unlock:
+	mutex_unlock(&configfs->lock);
+	return ERR_PTR(ret);
+}
+
+static void drop_crtcs_group(struct config_group *group,
+			     struct config_item *item)
+{
+	struct vkms_configfs *configfs = crtcs_group_to_vkms_configfs(group);
+	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
+
+	vkms_config_destroy_crtc(configfs->vkms_config, crtc_cfg);
+}
+
+static struct configfs_group_operations crtcs_group_ops = {
+	.make_group = &make_crtcs_group,
+	.drop_item = &drop_crtcs_group,
+};
+
+static struct config_item_type crtcs_group_type = {
+	.ct_group_ops = &crtcs_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs *configfs = config_item_to_vkms_configfs(item);
@@ -87,7 +225,6 @@ static struct config_group *make_device_group(struct config_group *group,
 					      const char *name)
 {
 	struct vkms_configfs *configfs;
-	struct vkms_config_crtc *crtc_cfg = NULL;
 	struct vkms_config_encoder *encoder_cfg = NULL;
 	struct vkms_config_connector *connector_cfg = NULL;
 	char *config_name;
@@ -110,11 +247,10 @@ static struct config_group *make_device_group(struct config_group *group,
 		goto err_kfree;
 	}
 
-	crtc_cfg = vkms_config_add_crtc(configfs->vkms_config, false, false);
-	if (IS_ERR(crtc_cfg)) {
-		ret = PTR_ERR(crtc_cfg);
-		goto err_kfree;
-	}
+	config_group_init_type_name(&configfs->crtcs_group, "crtcs",
+				    &crtcs_group_type);
+	configfs_add_default_group(&configfs->crtcs_group,
+				   &configfs->device_group);
 
 	encoder_cfg = vkms_config_add_encoder(configfs->vkms_config, BIT(0));
 	if (IS_ERR(encoder_cfg)) {
@@ -133,7 +269,6 @@ static struct config_group *make_device_group(struct config_group *group,
 
 err_kfree:
 	kfree(configfs);
-	kfree(crtc_cfg);
 	kfree(encoder_cfg);
 	kfree(connector_cfg);
 	return ERR_PTR(ret);
-- 
2.46.0

