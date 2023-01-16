Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348366BBB2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C81E10E2D5;
	Mon, 16 Jan 2023 10:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EFA10E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=16wShf2sMymUFli3kqaNEBYO52swd+HkWFYPgVRyk5M=; b=aORDyTYugMtiorOPhL+twRJsqs
 avHr4yw+sMRN5lwEhKSAkLKqQSKY9GODAolYxGMMAzi61pKwoZD6jnHBKhQ1+ARFuGXz+zh3q2XKw
 zEvQLa3MPtjzd3sNNATmb7mcKHMgVqXQEGBuwLXPa7bhIVS3pK6+kuVqZ2LQJXZJr6NupNQaV6lrg
 7Gz0piDitOT/EUez4vkIJc689EbkUciRk/8xCJc3obXxDdy8Z/rfHM4pwcL7edwdIVhoAl/DbIJ3t
 ly41n908C9OAUqRyfMTRwLxgCpteaMHF+8JyuulndzvD9rutgfO6v489TdZNkjob+7XN6uMKp9Rh3
 lQtC4Zjw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHMkN-009j44-Df; Mon, 16 Jan 2023 11:29:47 +0100
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
Subject: [PATCH 1/6] drm/debugfs: Introduce wrapper for debugfs list
Date: Mon, 16 Jan 2023 07:28:11 -0300
Message-Id: <20230116102815.95063-2-mcanal@igalia.com>
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

Introduce a struct wrapper for all the debugfs-related stuff: the list
of debugfs files and the mutex that protects it. This will make it
easier to initialize all the debugfs list in a DRM object and will
create a good abstraction for a possible implementation of the debugfs
infrastructure for KMS objects.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c  | 11 +++++++++++
 drivers/gpu/drm/drm_internal.h | 11 +++++++++++
 include/drm/drm_debugfs.h      | 16 ++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4f643a490dc3..2f104a9e4276 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -218,6 +218,17 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 }
 EXPORT_SYMBOL(drm_debugfs_create_files);
 
+void drm_debugfs_list_init(struct drm_debugfs_list *debugfs_list)
+{
+	INIT_LIST_HEAD(&debugfs_list->list);
+	mutex_init(&debugfs_list->mutex);
+}
+
+void drm_debugfs_list_destroy(struct drm_debugfs_list *debugfs_list)
+{
+	mutex_destroy(&debugfs_list->mutex);
+}
+
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ed2103ee272c..8fdecefb50bd 100644
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
+void drm_debugfs_list_init(struct drm_debugfs_list *debugfs_list);
+void drm_debugfs_list_destroy(struct drm_debugfs_list *debugfs_list);
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root);
 void drm_debugfs_cleanup(struct drm_minor *minor);
@@ -193,6 +196,14 @@ void drm_debugfs_crtc_add(struct drm_crtc *crtc);
 void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
 void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
 #else
+static inline void drm_debugfs_list_init(struct drm_debugfs_list *debugfs_list)
+{
+}
+
+static inline void drm_debugfs_list_destroy(struct drm_debugfs_list *debugfs_list)
+{
+}
+
 static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 				   struct dentry *root)
 {
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7616f457ce70..8658e97a88cf 100644
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
+ * struct drm_debugfs_list - Encapsulates the debugfs list and its mutex
+ *
+ * This structure represents the debugfs list of files and is encapsulated
+ * with a mutex to protect the access of the list.
+ */
+struct drm_debugfs_list {
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
2.39.0

