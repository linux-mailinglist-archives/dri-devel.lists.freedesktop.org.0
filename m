Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB57616ED2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 21:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C8710E623;
	Wed,  2 Nov 2022 20:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A5710E60D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 20:34:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24A02B82494;
 Wed,  2 Nov 2022 20:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A1FC433C1;
 Wed,  2 Nov 2022 20:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667421265;
 bh=ATXrtyCVY8SWg2oejMlYWzbqx44OoY28tztz/qRQuUE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F+s73xivFwNUPpe2t3rohK3K116c2C27UiaLaAYwu/cHlVPkQc23snOR3VRtpOIOi
 +yb+0rQl3N9c0PT/kCJqZH/qXHTsfvI0rXkL4ByBkvA2I3YVeS4sZLyhQl6prmuP2Y
 EcxviBKK4lWD7aZ2z/ZPAOlEetIJFB+Ft8My172SgnkaxnvSXL5LLOT1Pvl0HjtRO5
 mXFscuNkQMyDCn5IWvAbupf0+DxylxwfzBc2aCYjZeVLBL/mXVLFyQuE3CWv9tqopq
 2Hz7mFhJ+1dcxFU7NYSu9IBQH6oOq2AeDL/qBvMBlmWx5Syw1NSoX3mw5GraZzKWKU
 b5IEWfzDAgDgg==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH v2 2/3] accel: add dedicated minor for accelerator devices
Date: Wed,  2 Nov 2022 22:34:04 +0200
Message-Id: <20221102203405.1797491-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102203405.1797491-1-ogabbay@kernel.org>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jiho Chu <jiho.chu@samsung.com>,
 Christoph Hellwig <hch@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The accelerator devices are exposed to user-space using a dedicated
major. In addition, they are represented in /dev with new, dedicated
device char names: /dev/accel/accel*. This is done to make sure any
user-space software that tries to open a graphic card won't open
the accelerator device by mistake.

The above implies that the minor numbering should be separated from
the rest of the DRM devices. However, to avoid code duplication, we
want the drm_minor structure to be able to represent the accelerator
device.

To achieve this, we add a new drm_minor* to drm_device that represents
the accelerator device. This pointer is initialized for drivers that
declare they handle compute accelerator, using a new driver feature
flag called DRIVER_COMPUTE_ACCEL. It is important to note that this
driver feature is mutually exclusive with DRIVER_RENDER. Devices that
want to expose both graphics and compute device char files should be
handled by two drivers that are connected using the auxiliary bus
framework.

In addition, we define a different xarray to handle the accelerators
minors. This is done to make the minor's index be identical to the
device index in /dev/. Any access to the xarray is done solely
by functions in accel_drv.c, as the xarray is define as static. The
DRM core functions call those functions in case they detect the minor's
type is DRM_MINOR_ACCEL.

We define a separate accel_open function (from drm_open) that the
accel drivers should set as their open callback function. Both these
functions eventually call the same drm_open_helper(), which had to be
changed to be non-static so it can be called from accel_drv.c.
accel_open() partially duplicates drm_open as I removed some code from
it that handles legacy devices.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
Changes in v2:
 - Moved all accel minor handling code to accel_drv.c
 - Replaced deprecated idr with xarray

 drivers/accel/accel_drv.c  | 205 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/drm_file.c |   2 +-
 include/drm/drm_accel.h    |  29 +++++-
 include/drm/drm_device.h   |   3 +
 include/drm/drm_drv.h      |   8 ++
 include/drm/drm_file.h     |  21 +++-
 6 files changed, 247 insertions(+), 21 deletions(-)

diff --git a/drivers/accel/accel_drv.c b/drivers/accel/accel_drv.c
index 6132765ea054..964a93799936 100644
--- a/drivers/accel/accel_drv.c
+++ b/drivers/accel/accel_drv.c
@@ -9,13 +9,22 @@
 #include <linux/module.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
+#include <linux/xarray.h>

 #include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_print.h>

+static DEFINE_XARRAY_ALLOC(accel_minors_xa);
+
 static struct dentry *accel_debugfs_root;
-struct class *accel_class;
+static struct class *accel_class;
+
+static struct device_type accel_sysfs_device_minor = {
+	.name = "accel_minor"
+};

 static char *accel_devnode(struct device *dev, umode_t *mode)
 {
@@ -24,16 +33,6 @@ static char *accel_devnode(struct device *dev, umode_t *mode)

 static CLASS_ATTR_STRING(accel_version, 0444, "accel 1.0.0 20221018");

-/**
- * accel_sysfs_init - initialize sysfs helpers
- *
- * This is used to create the ACCEL class, which is the implicit parent of any
- * other top-level ACCEL sysfs objects.
- *
- * You must call accel_sysfs_destroy() to release the allocated resources.
- *
- * Return: 0 on success, negative error code on failure.
- */
 static int accel_sysfs_init(void)
 {
 	int err;
@@ -54,11 +53,6 @@ static int accel_sysfs_init(void)
 	return 0;
 }

-/**
- * accel_sysfs_destroy - destroys ACCEL class
- *
- * Destroy the ACCEL device class.
- */
 static void accel_sysfs_destroy(void)
 {
 	if (IS_ERR_OR_NULL(accel_class))
@@ -68,11 +62,185 @@ static void accel_sysfs_destroy(void)
 	accel_class = NULL;
 }

+/**
+ * accel_set_device_instance_params() - Set some device parameters for accel device
+ * @kdev: Pointer to the device instance.
+ * @index: The minor's index
+ *
+ * This function creates the dev_t of the device using the accel major and
+ * the device's minor number. In addition, it sets the class and type of the
+ * device instance to the accel sysfs class and device type, respectively.
+ */
+void accel_set_device_instance_params(struct device *kdev, int index)
+{
+	kdev->devt = MKDEV(ACCEL_MAJOR, index);
+	kdev->class = accel_class;
+	kdev->type = &accel_sysfs_device_minor;
+}
+
+/**
+ * accel_minor_alloc() - Allocates a new accel minor
+ *
+ * This function access the accel minors xarray and allocates from it
+ * a new id to represent a new accel minor
+ *
+ * Return: A new id on success or error code in case xa_alloc failed
+ */
+int accel_minor_alloc(void)
+{
+	int rc, index;
+
+	rc = xa_alloc(&accel_minors_xa, &index, NULL,
+			XA_LIMIT(0, ACCEL_MAX_MINORS - 1), GFP_KERNEL);
+	if (rc < 0)
+		return rc;
+
+	return index;
+}
+
+/**
+ * accel_minor_remove() - Remove an accel minor
+ * @index: The minor id to remove.
+ *
+ * This function access the accel minors xarray and removes from
+ * it the member with the id that is passed to this function.
+ */
+void accel_minor_remove(int index)
+{
+	xa_erase(&accel_minors_xa, index);
+}
+
+/**
+ * accel_minor_replace() - Replace minor pointer in accel minors xarray.
+ * @minor: Pointer to the new minor.
+ * @index: The minor id to replace.
+ *
+ * This function access the accel minors xarray structure and replaces the pointer
+ * that is associated with an existing id. Because the minor pointer can be
+ * NULL, we need to explicitly pass the index.
+ *
+ * Return: 0 for success, negative value for error
+ */
+int accel_minor_replace(struct drm_minor *minor, int index)
+{
+	if (minor) {
+		void *entry;
+
+		entry = xa_cmpxchg(&accel_minors_xa, index, NULL, minor, GFP_KERNEL);
+		if (xa_is_err(entry))
+			return xa_err(entry);
+	} else {
+		xa_store(&accel_minors_xa, index, NULL, GFP_KERNEL);
+	}
+
+	return 0;
+}
+
+/*
+ * Looks up the given minor-ID and returns the respective DRM-minor object. The
+ * refence-count of the underlying device is increased so you must release this
+ * object with accel_minor_release().
+ *
+ * The object can be only a drm_minor that represents an accel device.
+ *
+ * As long as you hold this minor, it is guaranteed that the object and the
+ * minor->dev pointer will stay valid! However, the device may get unplugged and
+ * unregistered while you hold the minor.
+ */
+static struct drm_minor *accel_minor_acquire(unsigned int minor_id)
+{
+	struct drm_minor *minor;
+
+	xa_lock(&accel_minors_xa);
+	minor = xa_load(&accel_minors_xa, minor_id);
+	if (minor)
+		drm_dev_get(minor->dev);
+	xa_unlock(&accel_minors_xa);
+
+	if (!minor) {
+		return ERR_PTR(-ENODEV);
+	} else if (drm_dev_is_unplugged(minor->dev)) {
+		drm_dev_put(minor->dev);
+		return ERR_PTR(-ENODEV);
+	}
+
+	return minor;
+}
+
+static void accel_minor_release(struct drm_minor *minor)
+{
+	drm_dev_put(minor->dev);
+}
+
+/**
+ * accel_open - open method for ACCEL file
+ * @inode: device inode
+ * @filp: file pointer.
+ *
+ * This function must be used by drivers as their &file_operations.open method.
+ * It looks up the correct ACCEL device and instantiates all the per-file
+ * resources for it. It also calls the &drm_driver.open driver callback.
+ *
+ * Return: 0 on success or negative errno value on failure.
+ */
+int accel_open(struct inode *inode, struct file *filp)
+{
+	struct drm_device *dev;
+	struct drm_minor *minor;
+	int retcode;
+
+	minor = accel_minor_acquire(iminor(inode));
+	if (IS_ERR(minor))
+		return PTR_ERR(minor);
+
+	dev = minor->dev;
+
+	atomic_fetch_inc(&dev->open_count);
+
+	/* share address_space across all char-devs of a single device */
+	filp->f_mapping = dev->anon_inode->i_mapping;
+
+	retcode = drm_open_helper(filp, minor);
+	if (retcode)
+		goto err_undo;
+
+	return 0;
+
+err_undo:
+	atomic_dec(&dev->open_count);
+	accel_minor_release(minor);
+	return retcode;
+}
+EXPORT_SYMBOL_GPL(accel_open);
+
 static int accel_stub_open(struct inode *inode, struct file *filp)
 {
-	DRM_DEBUG("Operation not supported");
+	const struct file_operations *new_fops;
+	struct drm_minor *minor;
+	int err;
+
+	DRM_DEBUG("\n");
+
+	minor = accel_minor_acquire(iminor(inode));
+	if (IS_ERR(minor))
+		return PTR_ERR(minor);
+
+	new_fops = fops_get(minor->dev->driver->fops);
+	if (!new_fops) {
+		err = -ENODEV;
+		goto out;
+	}
+
+	replace_fops(filp, new_fops);
+	if (filp->f_op->open)
+		err = filp->f_op->open(inode, filp);
+	else
+		err = 0;
+
+out:
+	accel_minor_release(minor);

-	return -EOPNOTSUPP;
+	return err;
 }

 static const struct file_operations accel_stub_fops = {
@@ -86,6 +254,7 @@ void accel_core_exit(void)
 	unregister_chrdev(ACCEL_MAJOR, "accel");
 	debugfs_remove(accel_debugfs_root);
 	accel_sysfs_destroy();
+	WARN_ON(!xa_empty(&accel_minors_xa));
 }

 int __init accel_core_init(void)
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index a8b4d918e9a3..64b4a3a87fbb 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -326,7 +326,7 @@ static int drm_cpu_valid(void)
  * Creates and initializes a drm_file structure for the file private data in \p
  * filp and add it into the double linked list in \p dev.
  */
-static int drm_open_helper(struct file *filp, struct drm_minor *minor)
+int drm_open_helper(struct file *filp, struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
 	struct drm_file *priv;
diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index cf43a7b30f34..0c0ae387d075 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -8,12 +8,20 @@
 #ifndef DRM_ACCEL_H_
 #define DRM_ACCEL_H_

-#define ACCEL_MAJOR     261
+#include <drm/drm_file.h>
+
+#define ACCEL_MAJOR		261
+#define ACCEL_MAX_MINORS	256

 #if IS_ENABLED(CONFIG_ACCEL)

 void accel_core_exit(void);
 int accel_core_init(void);
+void accel_minor_remove(int index);
+int accel_minor_alloc(void);
+int accel_minor_replace(struct drm_minor *minor, int index);
+void accel_set_device_instance_params(struct device *kdev, int index);
+int accel_open(struct inode *inode, struct file *filp);

 #else

@@ -23,9 +31,28 @@ static inline void accel_core_exit(void)

 static inline int __init accel_core_init(void)
 {
+	/* Return 0 to allow drm_core_init to complete successfully */
 	return 0;
 }

+static inline void accel_minor_remove(int index)
+{
+}
+
+static inline int accel_minor_alloc(void)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int accel_minor_replace(struct drm_minor *minor, int index)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void accel_set_device_instance_params(struct device *kdev, int index)
+{
+}
+
 #endif /* IS_ENABLED(CONFIG_ACCEL) */

 #endif /* DRM_ACCEL_H_ */
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 9923c7a6885e..933ce2048e20 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -93,6 +93,9 @@ struct drm_device {
 	/** @render: Render node */
 	struct drm_minor *render;

+	/** @accel: Compute Acceleration node */
+	struct drm_minor *accel;
+
 	/**
 	 * @registered:
 	 *
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..706e68ca5116 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -94,6 +94,14 @@ enum drm_driver_feature {
 	 * synchronization of command submission.
 	 */
 	DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
+	/**
+	 * @DRIVER_COMPUTE_ACCEL:
+	 *
+	 * Driver supports compute acceleration devices. This flag is mutually exclusive with
+	 * @DRIVER_RENDER and @DRIVER_MODESET. Devices that support both graphics and compute
+	 * acceleration should be handled by two drivers that are connected using auxiliry bus.
+	 */
+	DRIVER_COMPUTE_ACCEL            = BIT(7),

 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index d780fd151789..0d1f853092ab 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -51,11 +51,15 @@ struct file;

 /* Note that the order of this enum is ABI (it determines
  * /dev/dri/renderD* numbers).
+ *
+ * Setting DRM_MINOR_ACCEL to 32 gives enough space for more drm minors to
+ * be implemented before we hit any future
  */
 enum drm_minor_type {
 	DRM_MINOR_PRIMARY,
 	DRM_MINOR_CONTROL,
 	DRM_MINOR_RENDER,
+	DRM_MINOR_ACCEL = 32,
 };

 /**
@@ -70,7 +74,7 @@ enum drm_minor_type {
 struct drm_minor {
 	/* private: */
 	int index;			/* Minor device number */
-	int type;                       /* Control or render */
+	int type;                       /* Control or render or accel */
 	struct device *kdev;		/* Linux device */
 	struct drm_device *dev;

@@ -397,7 +401,22 @@ static inline bool drm_is_render_client(const struct drm_file *file_priv)
 	return file_priv->minor->type == DRM_MINOR_RENDER;
 }

+/**
+ * drm_is_accel_client - is this an open file of the compute acceleration node
+ * @file_priv: DRM file
+ *
+ * Returns true if this is an open file of the compute acceleration node, i.e.
+ * &drm_file.minor of @file_priv is a accel minor.
+ *
+ * See also the :ref:`section on accel nodes <drm_accel_node>`.
+ */
+static inline bool drm_is_accel_client(const struct drm_file *file_priv)
+{
+	return file_priv->minor->type == DRM_MINOR_ACCEL;
+}
+
 int drm_open(struct inode *inode, struct file *filp);
+int drm_open_helper(struct file *filp, struct drm_minor *minor);
 ssize_t drm_read(struct file *filp, char __user *buffer,
 		 size_t count, loff_t *offset);
 int drm_release(struct inode *inode, struct file *filp);
--
2.25.1

