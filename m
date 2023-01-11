Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D1666213
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A197910E7B0;
	Wed, 11 Jan 2023 17:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9990C10E7B4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CZyeTL029zzJuVyDEXThSkwV4MZhrZheSD+yYbbMM5I=; b=cBNe5bj0Y7YpCtqw9Gn8VPmNSh
 ZmJcx3eCslVX35mw8g8l/PrfRzgsd8cy3IgT1nXrAZAVNxHZCiHvTYBFnQhmn5IEWd1NUK/UphuYS
 pcO0BAaYm/9d4p500o/9IMhvkdOxM5Oli8spFHsrVl2I8WSUaDLY4dgoHEDrMxv/ObfE5dsg5fB4l
 cJmUcU3cXwRYyIM75QqrNt88GWmTxjRg9V/C2LQqwhjkrBjdA9rZ7QNKXZ5cQcSasfk3VpgKI8V65
 HCRAOHwNMaS4SZbR4mwVQ0EbuE71EicXbS1T6GMlyvhZMFryOLoU8KiJNiq17fi1QdVGVWi7zu+/D
 xcSozKkQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf3l-005Sku-Rk; Wed, 11 Jan 2023 18:38:46 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 05/13] drm/debugfs: Create a debugfs infrastructure for CRTC
Date: Wed, 11 Jan 2023 14:37:40 -0300
Message-Id: <20230111173748.752659-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111173748.752659-1-mcanal@igalia.com>
References: <20230111173748.752659-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the ability to add DRM debugfs files to a list managed by the
crtc and, during drm_crtc_register_all(), all added files will be
created at once.

Moreover, introduce some typesafety as struct drm_debugfs_crtc_entry
holds a drm_crtc instead of a drm_device. So, the drivers can get
a crtc object directly from the struct drm_debugfs_crtc_entry
in the show() callback.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_crtc.c     |  5 +++++
 drivers/gpu/drm/drm_debugfs.c  | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  5 +++++
 include/drm/drm_crtc.h         | 15 +++++++++++++++
 include/drm/drm_debugfs.h      | 25 +++++++++++++++++++++++++
 5 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index df9bf3c9206e..2953eef3e88e 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -131,6 +131,8 @@ int drm_crtc_register_all(struct drm_device *dev)
 			ret = crtc->funcs->late_register(crtc);
 		if (ret)
 			return ret;
+
+		drm_debugfs_crtc_init(crtc);
 	}
 
 	return 0;
@@ -268,7 +270,9 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
 	crtc->funcs = funcs;
 
 	INIT_LIST_HEAD(&crtc->commit_list);
+	INIT_LIST_HEAD(&crtc->debugfs_list);
 	spin_lock_init(&crtc->commit_lock);
+	mutex_init(&crtc->debugfs_mutex);
 
 	drm_modeset_lock_init(&crtc->mutex);
 	ret = drm_mode_object_add(dev, &crtc->base, DRM_MODE_OBJECT_CRTC);
@@ -508,6 +512,7 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
 	crtc->gamma_store = NULL;
 
 	drm_modeset_lock_fini(&crtc->mutex);
+	mutex_destroy(&crtc->debugfs_mutex);
 
 	drm_mode_object_unregister(dev, &crtc->base);
 	list_del(&crtc->head);
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6a763fe1b031..e1f71a03a581 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -261,6 +261,17 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
+void drm_debugfs_crtc_init(struct drm_crtc *crtc)
+{
+	struct drm_minor *minor = crtc->dev->primary;
+	struct drm_debugfs_crtc_entry *entry, *tmp;
+
+	if (!minor)
+		return;
+
+	drm_create_file_from_list(crtc);
+}
+
 void drm_debugfs_connector_init(struct drm_connector *connector)
 {
 	struct drm_minor *minor = connector->dev->primary;
@@ -392,6 +403,28 @@ void drm_debugfs_add_files(struct drm_device *dev, const struct drm_debugfs_info
 }
 EXPORT_SYMBOL(drm_debugfs_add_files);
 
+/**
+ * drm_debugfs_crtc_add_file - Add a given file to the DRM crtc debugfs file list
+ * @crtc: DRM crtc object
+ * @name: debugfs file name
+ * @show: show callback
+ * @data: driver-private data, should not be device-specific
+ * Add a given file entry to the DRM crtc debugfs file list to be created on
+ * drm_debugfs_crtc_init().
+ */
+void drm_debugfs_crtc_add_file(struct drm_crtc *crtc, const char *name,
+			       int (*show)(struct seq_file*, void*), void *data)
+{
+	struct drm_debugfs_crtc_entry *entry = drmm_kzalloc(crtc->dev, sizeof(*entry),
+							    GFP_KERNEL);
+
+	if (!entry)
+		return;
+
+	drm_debugfs_add_file_to_list(crtc);
+}
+EXPORT_SYMBOL(drm_debugfs_crtc_add_file);
+
 /**
  * drm_debugfs_connector_add_file - Add a given file to the DRM connector debugfs file list
  * @connector: DRM connector object
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 363936ee8628..9be697f7f8f9 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -185,6 +185,7 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
 #if defined(CONFIG_DEBUG_FS)
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root);
+void drm_debugfs_crtc_init(struct drm_crtc *crtc);
 void drm_debugfs_connector_init(struct drm_connector *connector);
 void drm_debugfs_encoder_init(struct drm_encoder *encoder);
 void drm_debugfs_cleanup(struct drm_minor *minor);
@@ -201,6 +202,10 @@ static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
+static inline void drm_debugfs_crtc_init(struct drm_crtc *crtc)
+{
+}
+
 static inline void drm_debugfs_connector_init(struct drm_connector *connector)
 {
 }
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8e1cbc75143e..612928929646 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1139,6 +1139,21 @@ struct drm_crtc {
 	 */
 	struct dentry *debugfs_entry;
 
+	/**
+	 * @debugfs_mutex:
+	 *
+	 * Protects &debugfs_list access.
+	 */
+	struct mutex debugfs_mutex;
+
+	/**
+	 * @debugfs_list:
+	 *
+	 * List of debugfs files to be created by the DRM crtc. The files
+	 * must be added during drm_crtc_register_all().
+	 */
+	struct list_head debugfs_list;
+
 	/**
 	 * @crc:
 	 *
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 677ed3fee5e1..47f23615139f 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -122,6 +122,23 @@ struct drm_debugfs_entry {
 	struct list_head list;
 };
 
+/**
+ * struct drm_debugfs_crtc_entry - Per-crtc debugfs node structure
+ *
+ * This structure represents a debugfs file, as an instantiation of a &struct
+ * drm_debugfs_info on a &struct drm_crtc.
+ */
+struct drm_debugfs_crtc_entry {
+	/** @crtc: &struct drm_crtc for this node. */
+	struct drm_crtc *crtc;
+
+	/** @file: Template for this node. */
+	struct drm_debugfs_info file;
+
+	/** @list: Linked list of all crtc nodes. */
+	struct list_head list;
+};
+
 /**
  * struct drm_debugfs_connector_entry - Per-connector debugfs node structure
  *
@@ -169,6 +186,9 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 void drm_debugfs_add_files(struct drm_device *dev,
 			   const struct drm_debugfs_info *files, int count);
 
+void drm_debugfs_crtc_add_file(struct drm_crtc *crtc, const char *name,
+			       int (*show)(struct seq_file*, void*), void *data);
+
 void drm_debugfs_connector_add_file(struct drm_connector *connector, const char *name,
 				    int (*show)(struct seq_file*, void*), void *data);
 
@@ -196,6 +216,11 @@ static inline void drm_debugfs_add_files(struct drm_device *dev,
 					 int count)
 {}
 
+static inline void drm_debugfs_crtc_add_file(struct drm_crtc *crtc, const char *name,
+					     int (*show)(struct seq_file*, void*),
+					     void *data)
+{}
+
 static inline void drm_debugfs_connector_add_file(struct drm_connector *connector,
 						  const char *name,
 						  int (*show)(struct seq_file*, void*),
-- 
2.39.0

