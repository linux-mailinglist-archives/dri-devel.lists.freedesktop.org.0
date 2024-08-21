Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80F959FC2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ABD10E620;
	Wed, 21 Aug 2024 14:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153FD10E621
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:26:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7057FA41C74;
 Wed, 21 Aug 2024 14:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF5FC4AF09;
 Wed, 21 Aug 2024 14:16:44 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 1/7] media: v4l2-core: add v4l2_debugfs_root()
Date: Wed, 21 Aug 2024 16:10:15 +0200
Message-ID: <7992e2e6f05bcf31ba8b646fbe179f1d3eabfae7.1724249420.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new function returns the dentry of the top-level debugfs "v4l2"
directory. If it does not exist yet, then it is created first.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 14 ++++++++++++++
 include/media/v4l2-dev.h           | 15 +++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index be2ba7ca5de2..4bbf279a0c8b 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -93,6 +93,8 @@ static struct attribute *video_device_attrs[] = {
 };
 ATTRIBUTE_GROUPS(video_device);
 
+static struct dentry *v4l2_debugfs_root_dir;
+
 /*
  *	Active devices
  */
@@ -1104,6 +1106,16 @@ void video_unregister_device(struct video_device *vdev)
 }
 EXPORT_SYMBOL(video_unregister_device);
 
+#ifdef CONFIG_DEBUG_FS
+struct dentry *v4l2_debugfs_root(void)
+{
+	if (!v4l2_debugfs_root_dir)
+		v4l2_debugfs_root_dir = debugfs_create_dir("v4l2", NULL);
+	return v4l2_debugfs_root_dir;
+}
+EXPORT_SYMBOL_GPL(v4l2_debugfs_root);
+#endif
+
 #if defined(CONFIG_MEDIA_CONTROLLER)
 
 __must_check int video_device_pipeline_start(struct video_device *vdev,
@@ -1208,6 +1220,8 @@ static void __exit videodev_exit(void)
 
 	class_unregister(&video_class);
 	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
+	debugfs_remove_recursive(v4l2_debugfs_root_dir);
+	v4l2_debugfs_root_dir = NULL;
 }
 
 subsys_initcall(videodev_init);
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index d82dfdbf6e58..1b6222fab24e 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -62,6 +62,7 @@ struct v4l2_ioctl_callbacks;
 struct video_device;
 struct v4l2_device;
 struct v4l2_ctrl_handler;
+struct dentry;
 
 /**
  * enum v4l2_video_device_flags - Flags used by &struct video_device
@@ -539,6 +540,20 @@ static inline int video_is_registered(struct video_device *vdev)
 	return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
 }
 
+/**
+ * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
+ *
+ * If this directory does not yet exist, then it will be created.
+ */
+#ifdef CONFIG_DEBUG_FS
+struct dentry *v4l2_debugfs_root(void);
+#else
+static inline struct dentry *v4l2_debugfs_root(void)
+{
+	return NULL;
+}
+#endif
+
 #if defined(CONFIG_MEDIA_CONTROLLER)
 
 /**
-- 
2.43.0

