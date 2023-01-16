Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9B066BBB1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FC110E2CC;
	Mon, 16 Jan 2023 10:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671C810E2CE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rvUyhBI0p9mKbIQ6G2ck3ZzU8mGQdsnv+Z6Waiy56uU=; b=hLoD1GbuxfXoiwhtMlbwUjmHQE
 Rg+3+Y6fgTRsQFHQiyLGLK7mPPzdfSXoaMQANtCEYjbGhf0bVm56hriWVzPgD12nO3gCurcus/I8q
 xXTzL2uyEseWfuNaFJi4bu/eIxKt0FgHNebDpF2pZM7KAghcd6SrfoCs+lDqE9XaTbPNkehDr7qiG
 JpAfD0jGP18AKPgzFd37S61iIrAhdNU4bFaBdxvQeA0eWvl02qggM2+/WxqZJON7vf7mPWE4u5DgY
 TBwdzfV54fJVnmgy5Qk/LxRs5y8w7I9ZzYW8FrtTvrty0qU405XS5YBV152Zxd90MphkioThhyY8S
 LBFhh/jw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHMkS-009j44-Ix; Mon, 16 Jan 2023 11:29:53 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 2/6] drm/debugfs: Make drm_device use the struct
 drm_debugfs_list
Date: Mon, 16 Jan 2023 07:28:12 -0300
Message-Id: <20230116102815.95063-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116102815.95063-1-mcanal@igalia.com>
References: <20230116102815.95063-1-mcanal@igalia.com>
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

The struct drm_debugfs_list encapsulates all the debugfs-related
objects, so that they can be initialized and destroyed with two helpers.
Therefore, make the struct drm_device use the struct drm_debugfs_list
instead of instantiating the debugfs list and mutex separated.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c | 10 +++++-----
 drivers/gpu/drm/drm_drv.c     |  7 ++++---
 include/drm/drm_debugfs.h     |  3 +++
 include/drm/drm_device.h      | 10 ++--------
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 2f104a9e4276..176b0f8614e5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -256,7 +256,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	if (dev->driver->debugfs_init)
 		dev->driver->debugfs_init(minor);
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
+	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list.list, list) {
 		debugfs_create_file(entry->file.name, 0444,
 				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
 		list_del(&entry->list);
@@ -273,7 +273,7 @@ void drm_debugfs_late_register(struct drm_device *dev)
 	if (!minor)
 		return;
 
-	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
+	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list.list, list) {
 		debugfs_create_file(entry->file.name, 0444,
 				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
 		list_del(&entry->list);
@@ -350,9 +350,9 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	entry->file.data = data;
 	entry->dev = dev;
 
-	mutex_lock(&dev->debugfs_mutex);
-	list_add(&entry->list, &dev->debugfs_list);
-	mutex_unlock(&dev->debugfs_mutex);
+	mutex_lock(&dev->debugfs_list.mutex);
+	list_add(&entry->list, &dev->debugfs_list.list);
+	mutex_unlock(&dev->debugfs_list.mutex);
 }
 EXPORT_SYMBOL(drm_debugfs_add_file);
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 11748dd513c3..89c63ead8653 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -38,6 +38,7 @@
 #include <drm/drm_cache.h>
 #include <drm/drm_client.h>
 #include <drm/drm_color_mgmt.h>
+#include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
@@ -575,7 +576,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
-	mutex_destroy(&dev->debugfs_mutex);
+	drm_debugfs_list_destroy(&dev->debugfs_list);
 	drm_legacy_destroy_members(dev);
 }
 
@@ -609,14 +610,14 @@ static int drm_dev_init(struct drm_device *dev,
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
+	drm_debugfs_list_init(&dev->debugfs_list);
 
 	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
 	if (ret)
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 8658e97a88cf..b4e22e7d4016 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -36,6 +36,9 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/seq_file.h>
+
+struct drm_device;
+
 /**
  * struct drm_info_list - debugfs info list entry
  *
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 282a171164ee..6ce10f9c7bae 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -6,6 +6,7 @@
 #include <linux/mutex.h>
 #include <linux/idr.h>
 
+#include <drm/drm_debugfs.h>
 #include <drm/drm_legacy.h>
 #include <drm/drm_mode_config.h>
 
@@ -308,20 +309,13 @@ struct drm_device {
 	 */
 	struct drm_fb_helper *fb_helper;
 
-	/**
-	 * @debugfs_mutex:
-	 *
-	 * Protects &debugfs_list access.
-	 */
-	struct mutex debugfs_mutex;
-
 	/**
 	 * @debugfs_list:
 	 *
 	 * List of debugfs files to be created by the DRM device. The files
 	 * must be added during drm_dev_register().
 	 */
-	struct list_head debugfs_list;
+	struct drm_debugfs_list debugfs_list;
 
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
-- 
2.39.0

