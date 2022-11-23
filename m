Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C598636CC9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 23:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500D310E63C;
	Wed, 23 Nov 2022 22:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA6A10E246
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 22:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D6mhxzPI3AXJZyVQSsxzTy/eQgD7j3ym67rSsd+3JqI=; b=PcMa8oIv7edVv9FOyGMVv9oObo
 +vK1vwDwFvFU77yPu7FhkWSGOOqa3egqqfWdCAfwjg7uObQYZhlMC0VM7e2T7LdXNIuPOcxnPfJ9d
 fe5K4nFBwQUqnXkATxiweBDK32joQyHtlzyjULgf/Hsu6NiMKJATNihB03cHplc32Yu2OemIBHrBK
 qVfx5H+qvYggSfvLj7JrucMrAqYC+mTiu14xTJ5nw22gbyrSZuMKb2osJ/kO5Wyd7Hgev6G1D0kEw
 vgbphCh8WLud+KHyPLhrIpjWtOKV25NDszFKnZJjE6X5MbrMMJVK2wzj+M4H8xeX7MPEj9a3bvd6Q
 wb7hfmFg==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oxxuM-0080ww-6z; Wed, 23 Nov 2022 23:07:54 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2 1/6] drm/debugfs: create device-centered debugfs functions
Date: Wed, 23 Nov 2022 19:07:20 -0300
Message-Id: <20221123220725.1272155-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123220725.1272155-1-mcanal@igalia.com>
References: <20221123220725.1272155-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wambui Karuga <wambui@karuga.org>, Melissa Wen <mwen@igalia.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the ability to track requests for the addition of DRM debugfs
files at any time and have them added all at once during
drm_dev_register().

Drivers can add DRM debugfs files to a device-managed list and, during
drm_dev_register(), all added files will be created at once.

Now, the drivers can use the functions drm_debugfs_add_file() and
drm_debugfs_add_files() to create DRM debugfs files instead of using the
drm_debugfs_create_files() function.

Co-developed-by: Wambui Karuga <wambui.karugax@gmail.com>
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 70 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_drv.c     |  3 ++
 include/drm/drm_debugfs.h     | 41 ++++++++++++++++++++
 include/drm/drm_device.h      | 15 ++++++++
 4 files changed, 129 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index ee445f4605ba..988fc07b94b4 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -38,6 +38,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_managed.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -151,6 +152,21 @@ static int drm_debugfs_open(struct inode *inode, struct file *file)
 	return single_open(file, node->info_ent->show, node);
 }
 
+static int drm_debugfs_entry_open(struct inode *inode, struct file *file)
+{
+	struct drm_debugfs_entry *entry = inode->i_private;
+	struct drm_debugfs_info *node = &entry->file;
+
+	return single_open(file, node->show, entry);
+}
+
+static const struct file_operations drm_debugfs_entry_fops = {
+	.owner = THIS_MODULE,
+	.open = drm_debugfs_entry_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
 
 static const struct file_operations drm_debugfs_fops = {
 	.owner = THIS_MODULE,
@@ -207,6 +223,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
 	struct drm_device *dev = minor->dev;
+	struct drm_debugfs_entry *entry, *tmp;
 	char name[64];
 
 	INIT_LIST_HEAD(&minor->debugfs_list);
@@ -230,6 +247,12 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	if (dev->driver->debugfs_init)
 		dev->driver->debugfs_init(minor);
 
+	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
+		debugfs_create_file(entry->file.name, S_IFREG | S_IRUGO,
+				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
+		list_del(&entry->list);
+	}
+
 	return 0;
 }
 
@@ -281,6 +304,53 @@ void drm_debugfs_cleanup(struct drm_minor *minor)
 	minor->debugfs_root = NULL;
 }
 
+/**
+ * drm_debugfs_add_file - Add a given file to the DRM device debugfs file list
+ * @dev: drm device for the ioctl
+ * @name: debugfs file name
+ * @show: show callback
+ * @data: driver-private data, should not be device-specific
+ *
+ * Add a given file entry to the DRM device debugfs file list to be created on
+ * drm_debugfs_init.
+ */
+void drm_debugfs_add_file(struct drm_device *dev, const char *name,
+			  int (*show)(struct seq_file*, void*), void *data)
+{
+	struct drm_debugfs_entry *entry = drmm_kzalloc(dev, sizeof(*entry), GFP_KERNEL);
+
+	if (!entry)
+		return;
+
+	entry->file.name = name;
+	entry->file.show = show;
+	entry->file.data = data;
+	entry->dev = dev;
+
+	mutex_lock(&dev->debugfs_mutex);
+	list_add(&entry->list, &dev->debugfs_list);
+	mutex_unlock(&dev->debugfs_mutex);
+}
+EXPORT_SYMBOL(drm_debugfs_add_file);
+
+/**
+ * drm_debugfs_add_files - Add an array of files to the DRM device debugfs file list
+ * @dev: drm device for the ioctl
+ * @files: The array of files to create
+ * @count: The number of files given
+ *
+ * Add a given set of debugfs files represented by an array of
+ * &struct drm_debugfs_info in the DRM device debugfs file list.
+ */
+void drm_debugfs_add_files(struct drm_device *dev, const struct drm_debugfs_info *files, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		drm_debugfs_add_file(dev, files[i].name, files[i].show, files[i].data);
+}
+EXPORT_SYMBOL(drm_debugfs_add_files);
+
 static int connector_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..803942008fcb 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -575,6 +575,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
+	mutex_destroy(&dev->debugfs_mutex);
 	drm_legacy_destroy_members(dev);
 }
 
@@ -608,12 +609,14 @@ static int drm_dev_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&dev->filelist_internal);
 	INIT_LIST_HEAD(&dev->clientlist);
 	INIT_LIST_HEAD(&dev->vblank_event_list);
+	INIT_LIST_HEAD(&dev->debugfs_list);
 
 	spin_lock_init(&dev->event_lock);
 	mutex_init(&dev->struct_mutex);
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
+	mutex_init(&dev->debugfs_mutex);
 
 	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
 	if (ret)
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 2188dc83957f..53b7297260a5 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -79,12 +79,43 @@ struct drm_info_node {
 	struct dentry *dent;
 };
 
+/**
+ * struct drm_debugfs_info - debugfs info list entry
+ *
+ * This structure represents a debugfs file to be created by the drm
+ * core.
+ */
+struct drm_debugfs_info {
+	const char *name;
+	int (*show)(struct seq_file*, void*);
+	u32 driver_features;
+	void *data;
+};
+
+/**
+ * struct drm_debugfs_entry - Per-device debugfs node structure
+ *
+ * This structure represents a debugfs file, as an instantiation of a &struct
+ * drm_debugfs_info on a &struct drm_device.
+ */
+struct drm_debugfs_entry {
+	struct drm_device *dev;
+	struct drm_debugfs_info file;
+	struct list_head list;
+};
+
 #if defined(CONFIG_DEBUG_FS)
 void drm_debugfs_create_files(const struct drm_info_list *files,
 			      int count, struct dentry *root,
 			      struct drm_minor *minor);
 int drm_debugfs_remove_files(const struct drm_info_list *files,
 			     int count, struct drm_minor *minor);
+
+void drm_debugfs_add_file(struct drm_device *dev, const char *name,
+			  int (*show)(struct seq_file*, void*), void *data);
+
+void drm_debugfs_add_files(struct drm_device *dev,
+			   const struct drm_debugfs_info *files, int count);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -96,6 +127,16 @@ static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
 {
 	return 0;
 }
+
+static inline void drm_debugfs_add_file(struct drm_device *dev, const char *name,
+					int (*show)(struct seq_file*, void*),
+					void *data)
+{}
+
+static inline void drm_debugfs_add_files(struct drm_device *dev,
+					 const struct drm_debugfs_info *files,
+					 int count)
+{}
 #endif
 
 #endif /* _DRM_DEBUGFS_H_ */
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 9923c7a6885e..fa6af1d57929 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -295,6 +295,21 @@ struct drm_device {
 	 */
 	struct drm_fb_helper *fb_helper;
 
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
+	 * List of debugfs files to be created by the DRM device. The files
+	 * must be added during drm_dev_register().
+	 */
+	struct list_head debugfs_list;
+
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
-- 
2.38.1

