Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 964321D464F
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E826EBED;
	Fri, 15 May 2020 06:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330B16E9A5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:42:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i15so20440097wrx.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YP+d9/dq/sXlLEDeKgo4gmuAm44JZmEwEc/B8NPryAk=;
 b=PJTw3mXfA0pGvMPUfhyZ+wYXdLrM4k+rQ1gGzmyTz0zZfGc3BhDe48hME9/Xo4MhUZ
 FejxqMs3EWifUhmvLUnGxywNQ7OO2zaaAS+JEbHEn3uY6iZH1KQG0I7aZWSROEs0yN7j
 wpcBxiUqgeuh7uhqQMxKqyqi5gcs0hHrTQ6bsakX5g2Gr2X863w3yzZPOwx5rIJalgs9
 PDxTDEMMFhcCKvBCJmyqF32Vt7DJ3oA/iNUUVKzTBBuvqwArk861MrRsmtcpFlasHouk
 14kN+X1gkpWlKOmilURK37m2V/nPjnbPKXAu+CMPwl8lAbxt9FGJoJce6OMuniwIljdF
 M/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YP+d9/dq/sXlLEDeKgo4gmuAm44JZmEwEc/B8NPryAk=;
 b=tn8NpCJUI9n12b6kFqu8QoZucYgI7G7CxAGfLoazSgNA/bYskrxHtweI0eefq0syxr
 +iCw1fRT3wLGw5a213JUU+/03LdMGaDeXfbv5R4HEBovUCAkosd+8eAmhoYImKYFDBWZ
 9U6LpXcFRqR36AJcHNpygp6BLm8U3SGxCt2oYkv1gOyI9Dzd3ED/8i1r16aTJ3pJvfzz
 yp2I9J2sTGtLO+mFOSSkBP0Odat4kmSQ+0n6+I6Ur4frzKqHuQNh7f6fyW3SRf0Mhwxp
 bqscthN5kzMe53VbxFr/Qi5mkgmGqrawDjoimt5nvWa6qbhJKngWRZyryJmBsX/WaeiB
 vtcQ==
X-Gm-Message-State: AGi0Pub4zqQa54nbnxG9waBaTP69yO9k4ZrVsGQte+2ekwL4YIvIjXUU
 ZNUngFOjuiOYNG50e5oqrZ8=
X-Google-Smtp-Source: APiQypKpT6+gjrGX79Q2AnRngu91qTVMOyHP22MKMIDa0Gr85kegTFU9FObqDJZrAchCSJScudtYmQ==
X-Received: by 2002:a5d:4d05:: with SMTP id z5mr30111428wrt.130.1589370156877; 
 Wed, 13 May 2020 04:42:36 -0700 (PDT)
Received: from wambui.zuku.co.ke ([197.237.182.195])
 by smtp.googlemail.com with ESMTPSA id j2sm27484540wrp.47.2020.05.13.04.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 04:42:36 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH 1/3] drm/debugfs: create debugfs files during
 drm_dev_register().
Date: Wed, 13 May 2020 14:41:27 +0300
Message-Id: <20200513114130.28641-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513114130.28641-1-wambui.karugax@gmail.com>
References: <20200513114130.28641-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the ability to track requests for the addition of drm debugfs
files at any time and have them added all at once during
drm_dev_register().

Drivers can add drm debugfs file requests to a new list tied to drm_device.
During drm_dev_register(), the new function drm_debugfs_create_file()
will iterate over the list of added files on a given minor to create
them.

Two new structs are introduced in this change: struct drm_simple_info
which represents a drm debugfs file entry and struct
drm_simple_info_entry which is used to track file requests and is the
main parameter of choice passed by functions. Each drm_simple_info_entry is
added to the new struct drm_device->debugfs_list for file requests.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_debugfs.c | 59 ++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/drm_drv.c     |  2 ++
 include/drm/drm_debugfs.h     | 38 ++++++++++++++++++++++
 include/drm/drm_device.h      | 12 +++++++
 4 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 2bea22130703..03b0588ede68 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -145,9 +145,10 @@ static const struct drm_info_list drm_debugfs_list[] = {
 
 static int drm_debugfs_open(struct inode *inode, struct file *file)
 {
-	struct drm_info_node *node = inode->i_private;
+	struct drm_simple_info_entry *entry = inode->i_private;
+	struct drm_simple_info *node = &entry->file;
 
-	return single_open(file, node->info_ent->show, node);
+	return single_open(file, node->show_fn, entry);
 }
 
 
@@ -159,6 +160,25 @@ static const struct file_operations drm_debugfs_fops = {
 	.release = single_release,
 };
 
+/**
+ * drm_debugfs_create_file - create DRM debugfs file.
+ * @dev: drm_device that the file belongs to
+ *
+ * Create a DRM debugfs file from the list of files to be created
+ * from dev->debugfs_list.
+ */
+static void drm_debugfs_create_file(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct drm_simple_info_entry *entry;
+
+	list_for_each_entry(entry, &dev->debugfs_list, list) {
+		debugfs_create_file(entry->file.name,
+				    S_IFREG | S_IRUGO, minor->debugfs_root,
+				    entry,
+				    &drm_debugfs_fops);
+	}
+}
 
 /**
  * drm_debugfs_create_files - Initialize a given set of debugfs files for DRM
@@ -213,8 +233,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	sprintf(name, "%d", minor_id);
 	minor->debugfs_root = debugfs_create_dir(name, root);
 
-	drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+	drm_debugfs_create_file(minor);
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
 		drm_atomic_debugfs_init(minor);
@@ -449,4 +468,36 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	crtc->debugfs_entry = NULL;
 }
 
+void drm_debugfs_add_file(struct drm_device *dev, const char *name,
+			  drm_simple_show_t show_fn, void *data)
+{
+	struct drm_simple_info_entry *entry =
+		kzalloc(sizeof(*entry), GFP_KERNEL);
+
+	if (!entry)
+		return;
+
+	entry->file.name = name;
+	entry->file.show_fn = show_fn;
+	entry->file.data = data;
+	entry->dev = dev;
+
+	mutex_lock(&dev->debugfs_mutex);
+	list_add(&entry->list, &dev->debugfs_list);
+	mutex_unlock(&dev->debugfs_mutex);
+}
+EXPORT_SYMBOL(drm_debugfs_add_file);
+
+void drm_debugfs_add_files(struct drm_device *dev,
+			   const struct drm_simple_info *files, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		drm_debugfs_add_file(dev, files[i].name, files[i].show_fn,
+				     files[i].data);
+	}
+}
+EXPORT_SYMBOL(drm_debugfs_add_files);
+
 #endif /* CONFIG_DEBUG_FS */
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index bc38322f306e..c68df4e31aa0 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -646,12 +646,14 @@ int drm_dev_init(struct drm_device *dev,
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
index 2188dc83957f..bbce580c3b38 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -34,6 +34,44 @@
 
 #include <linux/types.h>
 #include <linux/seq_file.h>
+
+struct drm_device;
+
+typedef int (*drm_simple_show_t)(struct seq_file *, void *);
+
+/**
+ * struct drm_simple_info - debugfs file entry
+ *
+ * This struct represents a debugfs file to be created.
+ */
+struct drm_simple_info {
+	const char *name;
+	drm_simple_show_t show_fn;
+	u32 driver_features;
+	void *data;
+};
+
+/**
+ * struct drm_simple_info_entry - debugfs list entry
+ *
+ * This struct is used in tracking requests for new debugfs files
+ * to be created.
+ */
+struct drm_simple_info_entry {
+	struct drm_device *dev;
+	struct drm_simple_info file;
+	struct list_head list;
+};
+
+void drm_debugfs_add_file(struct drm_device *dev,
+			  const char *name,
+			  drm_simple_show_t show_fn,
+			  void *data);
+
+void drm_debugfs_add_files(struct drm_device *dev,
+			   const struct drm_simple_info *files,
+			   int count);
+
 /**
  * struct drm_info_list - debugfs info list entry
  *
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index a55874db9dd4..b84dfdac27b7 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -326,6 +326,18 @@ struct drm_device {
 	 */
 	struct drm_fb_helper *fb_helper;
 
+	/**
+	 * @debugfs_mutex:
+	 * Protects debugfs_list access.
+	 */
+	struct mutex debugfs_mutex;
+
+	/** @debugfs_list:
+	 * List of debugfs files to add.
+	 * Files are added during drm_dev_register().
+	 */
+	struct list_head debugfs_list;
+
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
