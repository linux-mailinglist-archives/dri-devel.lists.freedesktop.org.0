Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A16836F5
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 21:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEE010E021;
	Tue, 31 Jan 2023 20:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF86F10E021
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/TrSV8xz8lwdG61pSHp3l0hHiRnz9dCbSLR++UMksgw=; b=U3dvp7dOqZ92a75kSkjIucAKTY
 ZGvE5AvDHh2xuEFBAYIZKaNgJjFV2Nol/9G3Go7ZGczEH9dG61yI2zZWOPE/RuM2Ipgg/ltkfmqnd
 xp5PYdujVNMKKidvVVr9TiQDEOiPaEKRPyP5tEeGov3uFbPuxoFlvOzXIcl9mizYQjbZFrXcCt7kW
 IipV0FTjYCi/d3KivumGHQrqDmLDKVDy0p74WO02dFG6gPVEyc/LFUioRWRbiJKwyDnfMO3sO9Zni
 O3QgaX0YKpdRDavyH7Xr1MpFzqh812445fGgnNuwOw5+2VrsJSyL93L5jBC5YuPcoQ4LcBbHJx5hK
 eDEi4Mqg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pMwpA-005kjr-D9; Tue, 31 Jan 2023 21:01:48 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 2/6] drm/debugfs: Make drm_device use the struct
 drm_debugfs_files
Date: Tue, 31 Jan 2023 16:58:22 -0300
Message-Id: <20230131195825.677487-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131195825.677487-1-mcanal@igalia.com>
References: <20230131195825.677487-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct drm_debugfs_files encapsulates all the debugfs-related
objects, so that they can be initialized and destroyed with two helpers.
Therefore, make the struct drm_device use the struct drm_debugfs_files
instead of instantiating the debugfs list and mutex separated.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 10 +++++-----
 drivers/gpu/drm/drm_drv.c     |  7 ++++---
 include/drm/drm_device.h      | 12 +++---------
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 8658d3929ea5..aa83f230c402 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -263,7 +263,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	if (dev->driver->debugfs_init)
 		dev->driver->debugfs_init(minor);
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
+	list_for_each_entry_safe(entry, tmp, &dev->debugfs_files->list, list) {
 		debugfs_create_file(entry->file.name, 0444,
 				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
 		list_del(&entry->list);
@@ -280,7 +280,7 @@ void drm_debugfs_late_register(struct drm_device *dev)
 	if (!minor)
 		return;
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
+	list_for_each_entry_safe(entry, tmp, &dev->debugfs_files->list, list) {
 		debugfs_create_file(entry->file.name, 0444,
 				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
 		list_del(&entry->list);
@@ -357,9 +357,9 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	entry->file.data = data;
 	entry->dev = dev;
 
-	mutex_lock(&dev->debugfs_mutex);
-	list_add(&entry->list, &dev->debugfs_list);
-	mutex_unlock(&dev->debugfs_mutex);
+	mutex_lock(&dev->debugfs_files->mutex);
+	list_add(&entry->list, &dev->debugfs_files->list);
+	mutex_unlock(&dev->debugfs_files->mutex);
 }
 EXPORT_SYMBOL(drm_debugfs_add_file);
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c6eb8972451a..50812cbe1d81 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -39,6 +39,7 @@
 #include <drm/drm_cache.h>
 #include <drm/drm_client.h>
 #include <drm/drm_color_mgmt.h>
+#include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
@@ -598,7 +599,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
-	mutex_destroy(&dev->debugfs_mutex);
+	drm_debugfs_files_destroy(dev->debugfs_files);
 	drm_legacy_destroy_members(dev);
 }
 
@@ -639,14 +640,14 @@ static int drm_dev_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&dev->filelist_internal);
 	INIT_LIST_HEAD(&dev->clientlist);
 	INIT_LIST_HEAD(&dev->vblank_event_list);
-	INIT_LIST_HEAD(&dev->debugfs_list);
 
 	spin_lock_init(&dev->event_lock);
 	mutex_init(&dev->struct_mutex);
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
-	mutex_init(&dev->debugfs_mutex);
+
+	dev->debugfs_files = drm_debugfs_files_init();
 
 	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
 	if (ret)
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 7cf4afae2e79..77290f4a06ff 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -16,6 +16,7 @@ struct drm_vblank_crtc;
 struct drm_vma_offset_manager;
 struct drm_vram_mm;
 struct drm_fb_helper;
+struct drm_debugfs_files;
 
 struct inode;
 
@@ -312,19 +313,12 @@ struct drm_device {
 	struct drm_fb_helper *fb_helper;
 
 	/**
-	 * @debugfs_mutex:
-	 *
-	 * Protects &debugfs_list access.
-	 */
-	struct mutex debugfs_mutex;
-
-	/**
-	 * @debugfs_list:
+	 * @debugfs_files:
 	 *
 	 * List of debugfs files to be created by the DRM device. The files
 	 * must be added during drm_dev_register().
 	 */
-	struct list_head debugfs_list;
+	struct drm_debugfs_files *debugfs_files;
 
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
-- 
2.39.1

