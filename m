Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3455E680DB8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB9B10E22F;
	Mon, 30 Jan 2023 12:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AA410E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I87PVW+WlnnJaBbmogt509JSZCesUEBejNuwsVAZcIg=; b=n/VSWQThCptf8hqmaak0YVm4TD
 63sIJrOKLh6LmI/wxoeA2yxBPYqB88PCtav5NoBYqQ3GYz7jJboNqZB2fGDN9cshAiUepBdf3TPpH
 wXE0NQjO0PTU6T5Ug9G2q+TOvSGO8hBZnVYG7evZ2iqJql/gzjFww2vBU8pK8+8+pXiMS6HBgVvx+
 eg8nNaGANOVSLPD6favBZD6fF1RoQzyHOuNbet+4Lp1/KyUU6LqJIztEJ7A/WguHK3qFYyFUZYRI/
 igBq0c9vA+V4xIougTeUM/Jjssg2K7ayxjfVMIX+bGTAMEKZlvMZ0aFrcimDu4PfqeeyxRDOPEtDQ
 Ll16ZrBA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pMTKU-004TG3-VR; Mon, 30 Jan 2023 13:32:11 +0100
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
Subject: [PATCH v2 1/6] drm/debugfs: Introduce wrapper for debugfs list
Date: Mon, 30 Jan 2023 09:30:05 -0300
Message-Id: <20230130123008.287141-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130123008.287141-1-mcanal@igalia.com>
References: <20230130123008.287141-1-mcanal@igalia.com>
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

Introduce a struct wrapper for all the debugfs-related stuff: the list
of debugfs files and the mutex that protects it. This will make it
easier to initialize all the debugfs list in a DRM object and will
create a good abstraction for a possible implementation of the debugfs
infrastructure for KMS objects.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/drm_internal.h | 12 ++++++++++++
 include/drm/drm_debugfs.h      | 16 ++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4f643a490dc3..8658d3929ea5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -218,6 +218,24 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 }
 EXPORT_SYMBOL(drm_debugfs_create_files);
 
+struct drm_debugfs_files *drm_debugfs_files_init(void)
+{
+	struct drm_debugfs_files *debugfs_files;
+
+	debugfs_files = kzalloc(sizeof(*debugfs_files), GFP_KERNEL);
+
+	INIT_LIST_HEAD(&debugfs_files->list);
+	mutex_init(&debugfs_files->mutex);
+
+	return debugfs_files;
+}
+
+void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
+{
+	mutex_destroy(&debugfs_files->mutex);
+	kfree(debugfs_files);
+}
+
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ed2103ee272c..71dd38796d28 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -23,6 +23,7 @@
 
 #include <linux/kthread.h>
 
+#include <drm/drm_debugfs.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_vblank.h>
 
@@ -183,6 +184,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
 
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
+struct drm_debugfs_files *drm_debugfs_files_init(void);
+void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files);
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root);
 void drm_debugfs_cleanup(struct drm_minor *minor);
@@ -193,6 +196,15 @@ void drm_debugfs_crtc_add(struct drm_crtc *crtc);
 void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
 void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
 #else
+static inline struct drm_debugfs_files *drm_debugfs_list_init(void)
+{
+	return NULL;
+}
+
+static inline void drm_debugfs_list_destroy(struct drm_debugfs_files *debugfs_files)
+{
+}
+
 static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 				   struct dentry *root)
 {
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7616f457ce70..423aa3de506a 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -32,6 +32,8 @@
 #ifndef _DRM_DEBUGFS_H_
 #define _DRM_DEBUGFS_H_
 
+#include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/seq_file.h>
 /**
@@ -79,6 +81,20 @@ struct drm_info_node {
 	struct dentry *dent;
 };
 
+/**
+ * struct drm_debugfs_files - Encapsulates the debugfs list and its mutex
+ *
+ * This structure represents the debugfs list of files and is encapsulated
+ * with a mutex to protect the access of the list.
+ */
+struct drm_debugfs_files {
+	/** @list: List of debugfs files to be created by the DRM object. */
+	struct list_head list;
+
+	/** @mutex: Protects &list access. */
+	struct mutex mutex;
+};
+
 /**
  * struct drm_debugfs_info - debugfs info list entry
  *
-- 
2.39.1

