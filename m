Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CACF962A28
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038210E540;
	Wed, 28 Aug 2024 14:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AA910E53B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 14:26:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AE925A40D78;
 Wed, 28 Aug 2024 14:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6C5C4CEE5;
 Wed, 28 Aug 2024 14:26:19 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/7] media: v4l2-core: add v4l2_debugfs_if_alloc/free()
Date: Wed, 28 Aug 2024 16:24:08 +0200
Message-ID: <931a281c72e9c3081eaedc2d76806ebd770a0913.1724855053.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
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

Add new helpers to export received or transmitted HDMI InfoFrames to
debugfs.

This complements similar code in drm where the transmitted HDMI infoframes
are exported to debugfs.

The same names have been used as in drm, so this is consistent.

The exported infoframes can be parsed with the edid-decode utility.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dv-timings.c | 63 +++++++++++++++++++++++
 include/media/v4l2-dv-timings.h           | 48 +++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index 942d0005c55e..86a8627f4bcc 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -1154,3 +1154,66 @@ int v4l2_phys_addr_validate(u16 phys_addr, u16 *parent, u16 *port)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_phys_addr_validate);
+
+#ifdef CONFIG_DEBUG_FS
+
+#define DEBUGFS_FOPS(type, flag)					\
+static ssize_t								\
+infoframe_read_##type(struct file *filp,				\
+		      char __user *ubuf, size_t count, loff_t *ppos)	\
+{									\
+	struct v4l2_debugfs_if *infoframes = filp->private_data;	\
+									\
+	return infoframes->if_read((flag), infoframes->priv, filp,	\
+				   ubuf, count, ppos);			\
+}									\
+									\
+static const struct file_operations infoframe_##type##_fops = {		\
+	.owner   = THIS_MODULE,						\
+	.open    = simple_open,						\
+	.read    = infoframe_read_##type,				\
+}
+
+DEBUGFS_FOPS(avi, V4L2_DEBUGFS_IF_AVI);
+DEBUGFS_FOPS(audio, V4L2_DEBUGFS_IF_AUDIO);
+DEBUGFS_FOPS(spd, V4L2_DEBUGFS_IF_SPD);
+DEBUGFS_FOPS(hdmi, V4L2_DEBUGFS_IF_HDMI);
+
+struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
+					      void *priv,
+					      v4l2_debugfs_if_read_t if_read)
+{
+	struct v4l2_debugfs_if *infoframes;
+
+	if (IS_ERR_OR_NULL(root) || !if_types || !if_read)
+		return NULL;
+
+	infoframes = kzalloc(sizeof(*infoframes), GFP_KERNEL);
+	if (!infoframes)
+		return NULL;
+
+	infoframes->if_dir = debugfs_create_dir("infoframes", root);
+	infoframes->priv = priv;
+	infoframes->if_read = if_read;
+	if (if_types & V4L2_DEBUGFS_IF_AVI)
+		debugfs_create_file("avi", 0400, infoframes->if_dir, infoframes, &infoframe_avi_fops);
+	if (if_types & V4L2_DEBUGFS_IF_AUDIO)
+		debugfs_create_file("audio", 0400, infoframes->if_dir, infoframes, &infoframe_audio_fops);
+	if (if_types & V4L2_DEBUGFS_IF_SPD)
+		debugfs_create_file("spd", 0400, infoframes->if_dir, infoframes, &infoframe_spd_fops);
+	if (if_types & V4L2_DEBUGFS_IF_HDMI)
+		debugfs_create_file("hdmi", 0400, infoframes->if_dir, infoframes, &infoframe_hdmi_fops);
+	return infoframes;
+}
+EXPORT_SYMBOL_GPL(v4l2_debugfs_if_alloc);
+
+void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes)
+{
+	if (infoframes) {
+		debugfs_remove_recursive(infoframes->if_dir);
+		kfree(infoframes);
+	}
+}
+EXPORT_SYMBOL_GPL(v4l2_debugfs_if_free);
+
+#endif
diff --git a/include/media/v4l2-dv-timings.h b/include/media/v4l2-dv-timings.h
index 8fa963326bf6..13830411bd6c 100644
--- a/include/media/v4l2-dv-timings.h
+++ b/include/media/v4l2-dv-timings.h
@@ -8,6 +8,7 @@
 #ifndef __V4L2_DV_TIMINGS_H
 #define __V4L2_DV_TIMINGS_H
 
+#include <linux/debugfs.h>
 #include <linux/videodev2.h>
 
 /**
@@ -251,4 +252,51 @@ void v4l2_set_edid_phys_addr(u8 *edid, unsigned int size, u16 phys_addr);
 u16 v4l2_phys_addr_for_input(u16 phys_addr, u8 input);
 int v4l2_phys_addr_validate(u16 phys_addr, u16 *parent, u16 *port);
 
+/* Add support for exporting InfoFrames to debugfs */
+
+/*
+ * HDMI InfoFrames start with a 3 byte header, then a checksum,
+ * followed by the actual IF payload.
+ *
+ * The payload length is limited to 30 bytes according to the HDMI spec,
+ * but since the length is encoded in 5 bits, it can be 31 bytes theoretically.
+ * So set the max length as 31 + 3 (header) + 1 (checksum) = 35.
+ */
+#define V4L2_DEBUGFS_IF_MAX_LEN (35)
+
+#define V4L2_DEBUGFS_IF_AVI	BIT(0)
+#define V4L2_DEBUGFS_IF_AUDIO	BIT(1)
+#define V4L2_DEBUGFS_IF_SPD	BIT(2)
+#define V4L2_DEBUGFS_IF_HDMI	BIT(3)
+
+typedef ssize_t (*v4l2_debugfs_if_read_t)(u32 type, void *priv,
+					  struct file *filp, char __user *ubuf,
+					  size_t count, loff_t *ppos);
+
+struct v4l2_debugfs_if {
+	struct dentry *if_dir;
+	void *priv;
+
+	v4l2_debugfs_if_read_t if_read;
+};
+
+#ifdef CONFIG_DEBUG_FS
+struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
+					      void *priv,
+					      v4l2_debugfs_if_read_t if_read);
+void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes);
+#else
+static inline
+struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
+					      void *priv,
+					      v4l2_debugfs_if_read_t if_read)
+{
+	return NULL;
+}
+
+static inline void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes)
+{
+}
+#endif
+
 #endif
-- 
2.43.0

