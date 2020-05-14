Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CCB1D3463
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5E56E086;
	Thu, 14 May 2020 15:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDC36E086
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 15:05:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id 91FB82A2F32
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/2] drm/ioctl: Add a ioctl to set and get a label on GEM
 objects
Date: Thu, 14 May 2020 17:05:32 +0200
Message-Id: <a0806974b5c0203ed824500dc2e780eb7af02837.1589468282.git.rohan.garg@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589468282.git.rohan.garg@collabora.com>
References: <cover.1589468282.git.rohan.garg@collabora.com>
In-Reply-To: <cover.1589468282.git.rohan.garg@collabora.com>
References: <cover.1589468282.git.rohan.garg@collabora.com>
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
Cc: kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_IOCTL_HANDLE_SET_LABEL lets you label buffers associated
with a handle, making it easier to debug issues in userspace
applications.

DRM_IOCTL_HANDLE_GET_LABEL lets you read the label associated
with a buffer.

Changes in v2:
  - Hoist the IOCTL up into the drm_driver framework

Changes in v3:
  - Introduce a drm_gem_set_label for drivers to use internally
    in order to label a GEM object
  - Hoist string copying up into the IOCTL
  - Fix documentation
  - Move actual gem labeling into drm_gem_adopt_label

Changes in v4:
  - Refactor IOCTL call to only perform string duplication and move
    all gem lookup logic into GEM specific call

Changes in v5:
  - Fix issues pointed out by kbuild test robot
  - Cleanup minor issues around kfree and out/err labels
  - Fixed API documentation issues
  - Rename to DRM_IOCTL_HANDLE_SET_LABEL
  - Introduce a DRM_IOCTL_HANDLE_GET_LABEL to read labels
  - Added some documentation for consumers of this IOCTL
  - Ensure that label's cannot be longer than PAGE_SIZE
  - Set a default label value
  - Drop useless warning
  - Properly return length of label to userspace even if
    userspace did not allocate memory for label.

Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_gem.c      | 54 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h | 14 +++++++
 drivers/gpu/drm/drm_ioctl.c    | 74 ++++++++++++++++++++++++++++++++++
 include/drm/drm_drv.h          | 32 +++++++++++++++
 include/drm/drm_gem.h          | 16 +++++++-
 include/uapi/drm/drm.h         | 21 +++++++++-
 6 files changed, 209 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7bf628e13023..3b2645906281 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -154,6 +154,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 
 	obj->dev = dev;
 	obj->filp = NULL;
+	obj->label = NULL;
 
 	kref_init(&obj->refcount);
 	obj->handle_count = 0;
@@ -940,6 +941,57 @@ drm_gem_release(struct drm_device *dev, struct drm_file *file_private)
 	idr_destroy(&file_private->object_idr);
 }
 
+int drm_gem_set_label(struct drm_device *dev,
+		       struct drm_file *file_priv,
+			   uint32_t handle,
+			   const char *label)
+{
+	struct drm_gem_object *gem_obj;
+	int ret = 0;
+
+	gem_obj = drm_gem_object_lookup(file_priv, handle);
+	if (!gem_obj) {
+		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
+		ret = -ENOENT;
+		goto out;
+	}
+	drm_gem_adopt_label(gem_obj, label);
+
+out:
+	drm_gem_object_put_unlocked(gem_obj);
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_set_label);
+
+void drm_gem_adopt_label(struct drm_gem_object *gem_obj, const char *label)
+{
+	char *adopted_label = NULL;
+
+	if (label)
+		adopted_label = kstrdup(label, GFP_KERNEL);
+
+	kfree(gem_obj->label);
+
+	gem_obj->label = adopted_label;
+}
+EXPORT_SYMBOL(drm_gem_adopt_label);
+
+char *drm_gem_get_label(struct drm_device *dev,
+		       struct drm_file *file_priv,
+			   uint32_t handle)
+{
+	struct drm_gem_object *gem_obj;
+
+	gem_obj = drm_gem_object_lookup(file_priv, handle);
+	if (!gem_obj) {
+		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
+		return NULL;
+	}
+
+	return gem_obj->label;
+}
+EXPORT_SYMBOL(drm_gem_get_label);
+
 /**
  * drm_gem_object_release - release GEM buffer object resources
  * @obj: GEM buffer object
@@ -957,6 +1009,8 @@ drm_gem_object_release(struct drm_gem_object *obj)
 
 	dma_resv_fini(&obj->_resv);
 	drm_gem_free_mmap_offset(obj);
+
+	kfree(obj->label);
 }
 EXPORT_SYMBOL(drm_gem_object_release);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 2470a352730b..c1fc65097e14 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -161,6 +161,20 @@ int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
 void *drm_gem_vmap(struct drm_gem_object *obj);
 void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
+int drm_handle_set_label_ioctl(struct drm_device *dev,
+			void *data,
+			struct drm_file *file_priv);
+int drm_handle_get_label_ioctl(struct drm_device *dev,
+			void *data,
+			struct drm_file *file_priv);
+int drm_gem_set_label(struct drm_device *dev,
+			struct drm_file *file_priv,
+			uint32_t handle,
+			const char *label);
+void drm_gem_adopt_label(struct drm_gem_object *gem_obj, const char *label);
+char *drm_gem_get_label(struct drm_device *dev,
+			struct drm_file *file_priv,
+			uint32_t handle);
 
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 73e31dd4e442..b2f628fdf026 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -715,6 +715,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF(DRM_IOCTL_HANDLE_SET_LABEL, drm_handle_set_label_ioctl,
+		      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF(DRM_IOCTL_HANDLE_GET_LABEL, drm_handle_get_label_ioctl,
+		      DRM_RENDER_ALLOW),
 };
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
@@ -928,3 +932,73 @@ bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
 	return true;
 }
 EXPORT_SYMBOL(drm_ioctl_flags);
+
+/**
+ * drm_handle_set_label_ioctl - Assign a string label with a handle
+ * @data: user argument
+ * @file_priv: drm file-private structure
+ *
+ * This ioctl can be used by whoever decides the purpose of a buffer to
+ * label the buffer object associated with the handle.
+ *
+ * This is typically targeted at user space drivers to label buffer objects
+ * with relevant information to provide human readable information about the
+ * contents of a buffer (for eg: a UBO, command buffer, shader, etc).
+ *
+ * Label length *must* not be larger than PAGE_SIZE.
+ *
+ * Returns:
+ * 0 if setting a label succeeded, negative errno otherwise.
+ */
+
+int drm_handle_set_label_ioctl(struct drm_device *dev,
+				void *data, struct drm_file *file_priv)
+{
+	char *label;
+	struct drm_handle_label *args = data;
+	int ret = 0;
+
+	if (!dev->driver->set_label || args->len > PAGE_SIZE)
+		return -EOPNOTSUPP;
+
+	if (!args->len)
+		label = NULL;
+	else if (args->len && args->label)
+		label = strndup_user(u64_to_user_ptr(args->label), args->len);
+	else
+		return -EINVAL;
+
+	if (IS_ERR(label)) {
+		ret = PTR_ERR(label);
+		return ret;
+	}
+
+	ret = dev->driver->set_label(dev, file_priv, args->handle, label);
+
+	kfree(label);
+	return ret;
+}
+
+int drm_handle_get_label_ioctl(struct drm_device *dev,
+				void *data, struct drm_file *file_priv)
+{
+	struct drm_handle_label *args = data;
+	int ret = 0;
+	char *label;
+
+	if (!dev->driver->get_label)
+		return -EOPNOTSUPP;
+
+	label = dev->driver->get_label(dev, file_priv, args->handle);
+	args->len = strlen(label) + 1;
+
+	if (!label)
+		return -EFAULT;
+
+	if (args->label)
+		ret = copy_to_user(u64_to_user_ptr(args->label),
+				   label,
+				   args->len);
+
+	return ret;
+}
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 6d457652f199..7da95a3157cb 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -550,6 +550,38 @@ struct drm_driver {
 			    struct drm_device *dev,
 			    uint32_t handle);
 
+	/**
+	 * @set_label:
+	 *
+	 * This label's a buffer object.
+	 *
+	 * Called by the user via ioctl.
+	 *
+	 * Returns:
+	 *
+	 * Zero on success, negative errno on failure.
+	 */
+	int (*set_label)(struct drm_device *dev,
+				struct drm_file *file_priv,
+				uint32_t handle,
+				const char *label);
+
+
+	/**
+	 * @get_label:
+	 *
+	 * This reads's the label of a buffer object.
+	 *
+	 * Called by the user via ioctl.
+	 *
+	 * Returns:
+	 *
+	 * Zero on success, negative errno on failiure.
+	 */
+	char *(*get_label)(struct drm_device *dev,
+				struct drm_file *file_priv,
+				uint32_t handle);
+
 	/**
 	 * @gem_vm_ops: Driver private ops for this object
 	 *
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 0b375069cd48..f3e2feae1be3 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -250,6 +250,13 @@ struct drm_gem_object {
 	 */
 	int name;
 
+	/**
+	 * @label:
+	 *
+	 * Label for this object, should be a human readable string.
+	 */
+	char *label;
+
 	/**
 	 * @dma_buf:
 	 *
@@ -419,5 +426,12 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 int drm_gem_dumb_destroy(struct drm_file *file,
 			 struct drm_device *dev,
 			 uint32_t handle);
-
+int drm_gem_set_label(struct drm_device *dev,
+		       struct drm_file *file_priv,
+			   uint32_t handle,
+			   const char *label);
+void drm_gem_adopt_label(struct drm_gem_object *gem_obj, const char *label);
+char *drm_gem_get_label(struct drm_device *dev,
+		       struct drm_file *file_priv,
+			   uint32_t handle);
 #endif /* __DRM_GEM_H__ */
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a93330..905bb8960753 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -626,6 +626,23 @@ struct drm_gem_open {
 	__u64 size;
 };
 
+/** struct drm_handle_label - ioctl argument for labelling BOs.
+ *
+ * This label's a BO with a userspace label
+ *
+ */
+struct drm_handle_label {
+	/** Handle for the object being labelled. */
+	__u32 handle;
+
+	/** Label and label length (len includes the trailing NUL). */
+	__u32 len;
+	__u64 label;
+
+	/** Flags */
+	int flags;
+};
+
 #define DRM_CAP_DUMB_BUFFER		0x1
 #define DRM_CAP_VBLANK_HIGH_CRTC	0x2
 #define DRM_CAP_DUMB_PREFERRED_DEPTH	0x3
@@ -947,8 +964,10 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_timeline_array)
 #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
-
 #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
+#define DRM_IOCTL_HANDLE_SET_LABEL      DRM_IOWR(0xCF, struct drm_handle_label)
+#define DRM_IOCTL_HANDLE_GET_LABEL      DRM_IOWR(0xD0, struct drm_handle_label)
+
 
 /**
  * Device specific ioctls should only be in their respective headers
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
