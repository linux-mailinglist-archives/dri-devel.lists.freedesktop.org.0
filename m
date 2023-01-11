Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AADB666212
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C839010E7B6;
	Wed, 11 Jan 2023 17:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C351D10E7AF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4tYyIZNSlv7m//YlLx72QWeadgOG/5RxFbxtTBQS9Ik=; b=mWvmi4aKdxjdQ5oYrsK1PUku7v
 li1Cb9pxfvAJJXN+rRGw/JpRgqIVRYuIzP/gL/RylSJUKEz9D23IUzcpC8c8gb4jiVZ46Dg2eVGp0
 GtrMjej33cHC+eh1X84VpArH5ww0wLVAZIFyYNbO4ZBxXPCUUb/Q72bgTDV6IstxXzt+aj2J7gTZj
 +4fcNgxZfBG0sl5tL2utRYIsBFdq0QOFF2VJe2ZfTLtKR9PtbYLu1N/Ir8f9mrYN91Rw/cHPuYM+u
 O6JL1aenIDGbYDPYTnqrumxAH97TN0Y2DR5OIsgFK3j4A/AJXdjiS1Z0qp1/Ku4hLcPqEdkxw1HYJ
 yHHy/zZg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf3c-005Sku-Ui; Wed, 11 Jan 2023 18:38:37 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 03/13] drm/debugfs: Create a debugfs infrastructure for
 connectors
Date: Wed, 11 Jan 2023 14:37:38 -0300
Message-Id: <20230111173748.752659-4-mcanal@igalia.com>
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
connector and, during drm_connector_register(), all added files will be
created at once.

Moreover, introduce some typesafety as struct drm_debugfs_connector_entry
holds a drm_connector instead of a drm_device. So, the drivers can get
a connector object directly from the struct drm_debugfs_connector_entry
in the show() callback.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_connector.c |  5 +++++
 drivers/gpu/drm/drm_debugfs.c   | 35 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h  |  5 +++++
 include/drm/drm_connector.h     | 15 ++++++++++++++
 include/drm/drm_debugfs.h       | 26 ++++++++++++++++++++++++
 5 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8d92777e57dd..c93655bb0edf 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -273,8 +273,10 @@ static int __drm_connector_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->global_connector_list_entry);
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
+	INIT_LIST_HEAD(&connector->debugfs_list);
 	mutex_init(&connector->mutex);
 	mutex_init(&connector->edid_override_mutex);
+	mutex_init(&connector->debugfs_mutex);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -581,6 +583,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 						       connector->state);
 
 	mutex_destroy(&connector->mutex);
+	mutex_destroy(&connector->debugfs_mutex);
 
 	memset(connector, 0, sizeof(*connector));
 
@@ -627,6 +630,8 @@ int drm_connector_register(struct drm_connector *connector)
 			goto err_debugfs;
 	}
 
+	drm_debugfs_connector_init(connector);
+
 	drm_mode_object_register(connector->dev, &connector->base);
 
 	connector->registration_state = DRM_CONNECTOR_REGISTERED;
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 23f6ed7b5d68..d9ec1ed5a7ec 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -260,6 +260,17 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
+void drm_debugfs_connector_init(struct drm_connector *connector)
+{
+	struct drm_minor *minor = connector->dev->primary;
+	struct drm_debugfs_connector_entry *entry, *tmp;
+
+	if (!minor)
+		return;
+
+	drm_create_file_from_list(connector);
+}
+
 void drm_debugfs_late_register(struct drm_device *dev)
 {
 	struct drm_minor *minor = dev->primary;
@@ -369,6 +380,30 @@ void drm_debugfs_add_files(struct drm_device *dev, const struct drm_debugfs_info
 }
 EXPORT_SYMBOL(drm_debugfs_add_files);
 
+/**
+ * drm_debugfs_connector_add_file - Add a given file to the DRM connector debugfs file list
+ * @connector: DRM connector object
+ * @name: debugfs file name
+ * @show: show callback
+ * @data: driver-private data, should not be device-specific
+ *
+ * Add a given file entry to the DRM connector debugfs file list to be created on
+ * drm_debugfs_connector_init().
+ */
+void drm_debugfs_connector_add_file(struct drm_connector *connector, const char *name,
+				    int (*show)(struct seq_file*, void*), void *data)
+{
+	struct drm_debugfs_connector_entry *entry = drmm_kzalloc(connector->dev,
+								 sizeof(*entry),
+								 GFP_KERNEL);
+
+	if (!entry)
+		return;
+
+	drm_debugfs_add_file_to_list(connector);
+}
+EXPORT_SYMBOL(drm_debugfs_connector_add_file);
+
 static int connector_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ed2103ee272c..dd9d7b8b45bd 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -185,6 +185,7 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
 #if defined(CONFIG_DEBUG_FS)
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root);
+void drm_debugfs_connector_init(struct drm_connector *connector);
 void drm_debugfs_cleanup(struct drm_minor *minor);
 void drm_debugfs_late_register(struct drm_device *dev);
 void drm_debugfs_connector_add(struct drm_connector *connector);
@@ -199,6 +200,10 @@ static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
+static inline void drm_debugfs_connector_init(struct drm_connector *connector)
+{
+}
+
 static inline void drm_debugfs_cleanup(struct drm_minor *minor)
 {
 }
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 9037f1317aee..51340f3162ed 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1720,6 +1720,21 @@ struct drm_connector {
 	/** @debugfs_entry: debugfs directory for this connector */
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
+	 * List of debugfs files to be created by the DRM connector. The files
+	 * must be added during drm_connector_register().
+	 */
+	struct list_head debugfs_list;
+
 	/**
 	 * @state:
 	 *
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7616f457ce70..c09c82274622 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -122,6 +122,23 @@ struct drm_debugfs_entry {
 	struct list_head list;
 };
 
+/**
+ * struct drm_debugfs_connector_entry - Per-connector debugfs node structure
+ *
+ * This structure represents a debugfs file, as an instantiation of a &struct
+ * drm_debugfs_info on a &struct drm_connector.
+ */
+struct drm_debugfs_connector_entry {
+	/** @connector: &struct drm_connector for this node. */
+	struct drm_connector *connector;
+
+	/** @file: Template for this node. */
+	struct drm_debugfs_info file;
+
+	/** @list: Linked list of all connector nodes. */
+	struct list_head list;
+};
+
 #if defined(CONFIG_DEBUG_FS)
 void drm_debugfs_create_files(const struct drm_info_list *files,
 			      int count, struct dentry *root,
@@ -134,6 +151,9 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 
 void drm_debugfs_add_files(struct drm_device *dev,
 			   const struct drm_debugfs_info *files, int count);
+
+void drm_debugfs_connector_add_file(struct drm_connector *connector, const char *name,
+				    int (*show)(struct seq_file*, void*), void *data);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -155,6 +175,12 @@ static inline void drm_debugfs_add_files(struct drm_device *dev,
 					 const struct drm_debugfs_info *files,
 					 int count)
 {}
+
+static inline void drm_debugfs_connector_add_file(struct drm_connector *connector,
+						  const char *name,
+						  int (*show)(struct seq_file*, void*),
+						  void *data)
+{}
 #endif
 
 #endif /* _DRM_DEBUGFS_H_ */
-- 
2.39.0

