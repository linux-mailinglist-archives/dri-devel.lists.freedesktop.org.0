Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928311E6816
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 19:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D08B6E1A8;
	Thu, 28 May 2020 17:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70806E1A8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 17:06:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id 672F52A40DE
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6] drm/ioctl: Add a ioctl to set and get a label on GEM
 objects
Date: Thu, 28 May 2020 19:06:04 +0200
Message-Id: <20200528170604.22476-1-rohan.garg@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: kernel@collabora.com, emil.l.velikov@gmail.com
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

Changes in v6:
  - Wrap code to make better use of 80 char limit
  - Drop redundant copies of the label
  - Protect concurrent access to labels
  - Improved documentation
  - Refactor setter/getter ioctl's to be static
  - Return EINVAL when label length > PAGE_SIZE
  - Simplify code by calling the default GEM label'ing
    function for all drivers using GEM
  - Do not error out when fetching empty labels
  - Refactor flags to the u32 type and add documentation
  - Refactor ioctls to use correct DRM_IOCTL{R,W,WR} macros
  - Return length of copied label to userspace

Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
---
 drivers/gpu/drm/drm_gem.c      | 68 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  5 +++
 drivers/gpu/drm/drm_ioctl.c    | 70 ++++++++++++++++++++++++++++++++++
 include/drm/drm_drv.h          | 30 +++++++++++++++
 include/drm/drm_gem.h          | 19 +++++++++
 include/uapi/drm/drm.h         | 25 +++++++++++-
 6 files changed, 216 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index efc0367841e2..942479dc152f 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -154,8 +154,10 @@ void drm_gem_private_object_init(struct drm_device *dev,
 
 	obj->dev = dev;
 	obj->filp = NULL;
+	obj->label = NULL;
 
 	kref_init(&obj->refcount);
+	mutex_init(&obj->bo_lock);
 	obj->handle_count = 0;
 	obj->size = size;
 	dma_resv_init(&obj->_resv);
@@ -940,6 +942,69 @@ drm_gem_release(struct drm_device *dev, struct drm_file *file_private)
 	idr_destroy(&file_private->object_idr);
 }
 
+int drm_gem_set_label(struct drm_device *dev, struct drm_file *file_priv,
+		      struct drm_handle_label *args)
+{
+	struct drm_gem_object *gem_obj;
+	struct pid *_pid = get_task_pid(current, PIDTYPE_PID);
+	char *label;
+
+	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!gem_obj) {
+		DRM_DEBUG("Failed to look up GEM BO %d\n", args->handle);
+		return -ENOENT;
+	}
+
+	if (args->len && args->label)
+		label = strndup_user(u64_to_user_ptr(args->label),
+				     args->len + 1);
+	else
+		label = NULL;
+
+	drm_gem_adopt_label(gem_obj, label);
+	drm_gem_object_put(gem_obj);
+	return args->len;
+}
+EXPORT_SYMBOL(drm_gem_set_label);
+
+void drm_gem_adopt_label(struct drm_gem_object *gem_obj, const char *label)
+{
+	mutex_lock(&gem_obj->bo_lock);
+	kfree(gem_obj->label);
+	gem_obj->label = label;
+	mutex_unlock(&gem_obj->bo_lock);
+}
+EXPORT_SYMBOL(drm_gem_adopt_label);
+
+int drm_gem_get_label(struct drm_device *dev, struct drm_file *file_priv,
+		      struct drm_handle_label *args)
+{
+	struct drm_gem_object *gem_obj;
+	int len, ret;
+
+	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!gem_obj) {
+		DRM_DEBUG("Failed to look up GEM BO %d\n", args->handle);
+		return -ENOENT;
+	}
+
+	if (!gem_obj->label) {
+		args->label = NULL;
+		args->len = 0;
+		return 0;
+	}
+
+	mutex_lock(&gem_obj->bo_lock);
+	len = strlen(gem_obj->label);
+	ret = copy_to_user(u64_to_user_ptr(args->label), gem_obj->label,
+			   min(args->len, len));
+	mutex_unlock(&gem_obj->bo_lock);
+	args->len = len;
+	drm_gem_object_put(gem_obj);
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_get_label);
+
 /**
  * drm_gem_object_release - release GEM buffer object resources
  * @obj: GEM buffer object
@@ -957,6 +1022,9 @@ drm_gem_object_release(struct drm_gem_object *obj)
 
 	dma_resv_fini(&obj->_resv);
 	drm_gem_free_mmap_offset(obj);
+
+	kfree(obj->label);
+	mutex_destroy(&obj->bo_lock);
 }
 EXPORT_SYMBOL(drm_gem_object_release);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 2470a352730b..73fd87860100 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -161,6 +161,11 @@ int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
 void *drm_gem_vmap(struct drm_gem_object *obj);
 void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
+int drm_gem_set_label(struct drm_device *dev, struct drm_file *file_priv,
+		      struct drm_handle_label *args);
+void drm_gem_adopt_label(struct drm_gem_object *gem_obj, const char *label);
+int drm_gem_get_label(struct drm_device *dev, struct drm_file *file_priv,
+		      struct drm_handle_label *args);
 
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 0fb9da24eaa4..04ff75e53349 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -573,6 +573,72 @@ EXPORT_SYMBOL(drm_ioctl_permit);
 #define DRM_LEGACY_IOCTL_DEF(ioctl, _func, _flags) DRM_IOCTL_DEF(ioctl, drm_invalid_op, _flags)
 #endif
 
+/**
+ * drm_handle_set_label_ioctl - Assign a string label to a handle
+ * @dev: DRM device for the ioctl
+ * @data: user argument
+ * @file_priv: drm file-private structure
+ *
+ * This is typically targeted at user space drivers to label buffer objects
+ * with relevant information to provide human readable information about the
+ * contents of a buffer (for eg: a UBO, command buffer, shader, etc).
+ *
+ * Label length *must* not be larger than PAGE_SIZE.
+ *
+ * Returns:
+ * Length of label when setting a label succeeds, negative errno otherwise.
+ */
+
+static int drm_handle_set_label_ioctl(struct drm_device *dev,
+				      void *data, struct drm_file *file_priv)
+{
+	char *label;
+	struct drm_handle_label *args = data;
+
+	if (args->len > PAGE_SIZE)
+		return -EINVAL;
+
+	if (!dev->driver->set_label && !drm_core_check_feature(dev, DRIVER_GEM))
+		return -EOPNOTSUPP;
+
+	if (dev->driver->set_label)
+		return dev->driver->set_label(dev, file_priv, args);
+
+	if (drm_core_check_feature(dev, DRIVER_GEM))
+		return drm_gem_set_label(dev, file_priv, args);
+}
+
+/**
+ * drm_handle_get_label_ioctl - Fetches the label associated with a handle
+ * @dev: DRM device for the ioctl
+ * @data: user argument
+ * @file_priv: drm file-private structure
+ *
+ * This is targeted at user space drivers to read back the labels associated
+ * with a buffer object. You'll need to call this ioctl twice in order to be
+ * able to read back the entnire label. Optionally, userspace can also read
+ * back the label partially by passing a
+ * fixed length in `struct drm_handle_label`.
+ *
+ * Returns:
+ * Length of label copied back to userspace.
+ */
+
+static int drm_handle_get_label_ioctl(struct drm_device *dev,
+				      void *data, struct drm_file *file_priv)
+{
+	struct drm_handle_label *args = data;
+
+	if (!dev->driver->get_label && !drm_core_check_feature(dev, DRIVER_GEM))
+		return -EOPNOTSUPP;
+
+	if (dev->driver->get_label)
+		return dev->driver->get_label(dev, file_priv, args);
+
+	if (drm_core_check_feature(dev, DRIVER_GEM))
+		return drm_gem_get_label(dev, file_priv, args);
+}
+
 /* Ioctl table */
 static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
@@ -715,6 +781,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF(DRM_IOCTL_HANDLE_SET_LABEL, drm_handle_set_label_ioctl,
+		      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF(DRM_IOCTL_HANDLE_GET_LABEL, drm_handle_get_label_ioctl,
+		      DRM_RENDER_ALLOW),
 };
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index bb924cddc09c..6fcb7b9ff322 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -540,6 +540,36 @@ struct drm_driver {
 			    struct drm_device *dev,
 			    uint32_t handle);
 
+	/**
+	 * @set_label:
+	 *
+	 * Label a buffer object
+	 *
+	 * Called by the user via ioctl.
+	 *
+	 * Returns:
+	 *
+	 * Length of label on success, negative errno on failure.
+	 */
+	int (*set_label)(struct drm_device *dev,
+			 struct drm_file *file_priv,
+			 struct drm_handle_label *args);
+
+	/**
+	 * @get_label:
+	 *
+	 * Read the label of a buffer object.
+	 *
+	 * Called by the user via ioctl.
+	 *
+	 * Returns:
+	 *
+	 * Length of label on success, negative errno on failiure.
+	 */
+	char *(*get_label)(struct drm_device *dev,
+			   struct drm_file *file_priv,
+			   struct drm_handle_label *args);
+
 	/**
 	 * @gem_vm_ops: Driver private ops for this object
 	 *
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 2410ff0a8e86..064b080eb32f 100644
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
@@ -311,6 +318,13 @@ struct drm_gem_object {
 	 *
 	 */
 	const struct drm_gem_object_funcs *funcs;
+
+	/**
+	 * @bo_lock
+	 *
+	 * Protects buffer object labels
+	 */
+	struct mutex bo_lock;
 };
 
 /**
@@ -418,5 +432,10 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 int drm_gem_dumb_destroy(struct drm_file *file,
 			 struct drm_device *dev,
 			 uint32_t handle);
+int drm_gem_set_label(struct drm_device *dev, struct drm_file *file_priv,
+		      struct drm_handle_label *args);
+void drm_gem_adopt_label(struct drm_gem_object *gem_obj, const char *label);
+int drm_gem_get_label(struct drm_device *dev, struct drm_file *file_priv,
+		      struct drm_handle_label *args);
 
 #endif /* __DRM_GEM_H__ */
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a93330..2a7128271307 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -626,6 +626,27 @@ struct drm_gem_open {
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
+	/** Label and label length (len excludes the trailing NULL).
+	 *  Label length *MUST* be smaller than PAGE_SIZE.
+	 *  Label length can be smaller than actual length when reading
+	 *  the label back.
+	 */
+	__u32 len;
+	__u64 label;
+
+	/** Flags .. Currently no flags are defined */
+	__u32 flags;
+};
+
 #define DRM_CAP_DUMB_BUFFER		0x1
 #define DRM_CAP_VBLANK_HIGH_CRTC	0x2
 #define DRM_CAP_DUMB_PREFERRED_DEPTH	0x3
@@ -947,8 +968,10 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_timeline_array)
 #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
-
 #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
+#define DRM_IOCTL_HANDLE_SET_LABEL      DRM_IOW(0xCF, struct drm_handle_label)
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
