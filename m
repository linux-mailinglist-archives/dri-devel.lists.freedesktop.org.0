Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B2608FD9
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 23:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB6310E039;
	Sat, 22 Oct 2022 21:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCEF10E027
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 21:46:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A3EA60B35;
 Sat, 22 Oct 2022 21:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD3BC43470;
 Sat, 22 Oct 2022 21:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666475212;
 bh=xeTBNUS1yJ8fc02OPNA8l/J4d0SGkzeo5LKZwIGkp5g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i/rt+2Ormdyue9xspQi0odG3Jh6dm7z1E7ixUoqmt2vmvbemk7uKHH6aDE6oDnmAC
 qqYWu6VfvtJ8gzL6k40Tt8fNHt8Zct3exKkvN7cnM5ETxBWpp0XNJ88AmYT/Sl+m+E
 YRMP0PwD2MbpmmuKv8XYae8CL4aPsSnBIZeX9U7WPhuIJETlMzBnuiMX+KqM1BpKcy
 JK6LmkMwE9pXvC6Wxw+Exp0aT8G+vDUYZ7DkRoDKug+2ktu88oDFboWSIVGtnIlu/a
 sXGdaXSM+wPxKD+LwHniw4ybiz0oqWRVNZBIhlwq8b+oy3Oxm8Pgkxk+9QK/zThPH+
 0YU1VO0W9s7Xg==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
Date: Sun, 23 Oct 2022 00:46:22 +0300
Message-Id: <20221022214622.18042-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022214622.18042-1-ogabbay@kernel.org>
References: <20221022214622.18042-1-ogabbay@kernel.org>
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
the rest of the drm devices. However, to avoid code duplication, we
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

In addition, we define a different idr to handle the accelerators
minors. This is done to make the minor's index be identical to the
device index in /dev/. In most places, this is hidden inside the drm
core functions except when calling drm_minor_acquire(), where I had to
add an extra parameter to specify the idr to use (because the
accelerators minors index and the drm primary minor index both begin
at 0).

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/gpu/drm/drm_drv.c      | 171 +++++++++++++++++++++++++--------
 drivers/gpu/drm/drm_file.c     |  69 +++++++++----
 drivers/gpu/drm/drm_internal.h |   2 +-
 drivers/gpu/drm/drm_sysfs.c    |  29 ++++--
 include/drm/drm_device.h       |   3 +
 include/drm/drm_drv.h          |   8 ++
 include/drm/drm_file.h         |  21 +++-
 7 files changed, 235 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index b58ffb1433d6..c13701a8d4be 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
 static DEFINE_SPINLOCK(drm_minor_lock);
 static struct idr drm_minors_idr;
 
+static DEFINE_SPINLOCK(accel_minor_lock);
+static struct idr accel_minors_idr;
+
 /*
  * If the drm core fails to init for whatever reason,
  * we should prevent any drivers from registering with it.
@@ -94,6 +97,8 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 		return &dev->primary;
 	case DRM_MINOR_RENDER:
 		return &dev->render;
+	case DRM_MINOR_ACCEL:
+		return &dev->accel;
 	default:
 		BUG();
 	}
@@ -108,9 +113,15 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 
 	put_device(minor->kdev);
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_remove(&drm_minors_idr, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	if (minor->type == DRM_MINOR_ACCEL) {
+		spin_lock_irqsave(&accel_minor_lock, flags);
+		idr_remove(&accel_minors_idr, minor->index);
+		spin_unlock_irqrestore(&accel_minor_lock, flags);
+	} else {
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		idr_remove(&drm_minors_idr, minor->index);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+	}
 }
 
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
@@ -127,13 +138,23 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	minor->dev = dev;
 
 	idr_preload(GFP_KERNEL);
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	r = idr_alloc(&drm_minors_idr,
-		      NULL,
-		      64 * type,
-		      64 * (type + 1),
-		      GFP_NOWAIT);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	if (type == DRM_MINOR_ACCEL) {
+		spin_lock_irqsave(&accel_minor_lock, flags);
+		r = idr_alloc(&accel_minors_idr,
+			NULL,
+			64 * (type - DRM_MINOR_ACCEL),
+			64 * (type - DRM_MINOR_ACCEL + 1),
+			GFP_NOWAIT);
+		spin_unlock_irqrestore(&accel_minor_lock, flags);
+	} else {
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		r = idr_alloc(&drm_minors_idr,
+			NULL,
+			64 * type,
+			64 * (type + 1),
+			GFP_NOWAIT);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+	}
 	idr_preload_end();
 
 	if (r < 0)
@@ -167,7 +188,11 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 
 	ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
 	if (ret) {
-		DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
+		if (minor->type == DRM_MINOR_ACCEL)
+			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/accel.\n");
+		else
+			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
+
 		goto err_debugfs;
 	}
 
@@ -176,9 +201,15 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 		goto err_debugfs;
 
 	/* replace NULL with @minor so lookups will succeed from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, minor, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	if (minor->type == DRM_MINOR_ACCEL) {
+		spin_lock_irqsave(&accel_minor_lock, flags);
+		idr_replace(&accel_minors_idr, minor, minor->index);
+		spin_unlock_irqrestore(&accel_minor_lock, flags);
+	} else {
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		idr_replace(&drm_minors_idr, minor, minor->index);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+	}
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -198,9 +229,15 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, NULL, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	if (minor->type == DRM_MINOR_ACCEL) {
+		spin_lock_irqsave(&accel_minor_lock, flags);
+		idr_replace(&accel_minors_idr, NULL, minor->index);
+		spin_unlock_irqrestore(&accel_minor_lock, flags);
+	} else {
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		idr_replace(&drm_minors_idr, NULL, minor->index);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+	}
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -216,16 +253,24 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
  * minor->dev pointer will stay valid! However, the device may get unplugged and
  * unregistered while you hold the minor.
  */
-struct drm_minor *drm_minor_acquire(unsigned int minor_id)
+struct drm_minor *drm_minor_acquire(unsigned int minor_id, bool is_accel_minor)
 {
 	struct drm_minor *minor;
 	unsigned long flags;
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	minor = idr_find(&drm_minors_idr, minor_id);
-	if (minor)
-		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	if (is_accel_minor) {
+		spin_lock_irqsave(&accel_minor_lock, flags);
+		minor = idr_find(&accel_minors_idr, minor_id);
+		if (minor)
+			drm_dev_get(minor->dev);
+		spin_unlock_irqrestore(&accel_minor_lock, flags);
+	} else {
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		minor = idr_find(&drm_minors_idr, minor_id);
+		if (minor)
+			drm_dev_get(minor->dev);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+	}
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
@@ -607,6 +652,14 @@ static int drm_dev_init(struct drm_device *dev,
 	/* no per-device feature limits by default */
 	dev->driver_features = ~0u;
 
+	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
+				(drm_core_check_feature(dev, DRIVER_RENDER) ||
+				drm_core_check_feature(dev, DRIVER_MODESET))) {
+
+		DRM_ERROR("DRM driver can't be both a compute acceleration and graphics driver\n");
+		return -EINVAL;
+	}
+
 	drm_legacy_init_members(dev);
 	INIT_LIST_HEAD(&dev->filelist);
 	INIT_LIST_HEAD(&dev->filelist_internal);
@@ -632,15 +685,21 @@ static int drm_dev_init(struct drm_device *dev,
 
 	dev->anon_inode = inode;
 
-	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
-		ret = drm_minor_alloc(dev, DRM_MINOR_RENDER);
+	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL)) {
+		ret = drm_minor_alloc(dev, DRM_MINOR_ACCEL);
 		if (ret)
 			goto err;
-	}
+	} else {
+		if (drm_core_check_feature(dev, DRIVER_RENDER)) {
+			ret = drm_minor_alloc(dev, DRM_MINOR_RENDER);
+			if (ret)
+				goto err;
+		}
 
-	ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
-	if (ret)
-		goto err;
+		ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
+		if (ret)
+			goto err;
+	}
 
 	ret = drm_legacy_create_map_hash(dev);
 	if (ret)
@@ -887,6 +946,10 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto err_minors;
 
+	ret = drm_minor_register(dev, DRM_MINOR_ACCEL);
+	if (ret)
+		goto err_minors;
+
 	ret = create_compat_control_link(dev);
 	if (ret)
 		goto err_minors;
@@ -906,12 +969,13 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 		 driver->name, driver->major, driver->minor,
 		 driver->patchlevel, driver->date,
 		 dev->dev ? dev_name(dev->dev) : "virtual device",
-		 dev->primary->index);
+		 dev->primary ? dev->primary->index : dev->accel->index);
 
 	goto out_unlock;
 
 err_minors:
 	remove_compat_control_link(dev);
+	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
 	drm_minor_unregister(dev, DRM_MINOR_RENDER);
 out_unlock:
@@ -954,6 +1018,7 @@ void drm_dev_unregister(struct drm_device *dev)
 	drm_legacy_rmmaps(dev);
 
 	remove_compat_control_link(dev);
+	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
 	drm_minor_unregister(dev, DRM_MINOR_RENDER);
 }
@@ -999,18 +1064,11 @@ EXPORT_SYMBOL(drm_dev_set_unique);
  * registered minor.
  */
 
-static int drm_stub_open(struct inode *inode, struct file *filp)
+static int stub_open(struct inode *inode, struct file *filp, struct drm_minor *minor)
 {
 	const struct file_operations *new_fops;
-	struct drm_minor *minor;
 	int err;
 
-	DRM_DEBUG("\n");
-
-	minor = drm_minor_acquire(iminor(inode));
-	if (IS_ERR(minor))
-		return PTR_ERR(minor);
-
 	new_fops = fops_get(minor->dev->driver->fops);
 	if (!new_fops) {
 		err = -ENODEV;
@@ -1029,18 +1087,51 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
 	return err;
 }
 
+static int drm_stub_open(struct inode *inode, struct file *filp)
+{
+	struct drm_minor *minor;
+
+	DRM_DEBUG("\n");
+
+	minor = drm_minor_acquire(iminor(inode), false);
+	if (IS_ERR(minor))
+		return PTR_ERR(minor);
+
+	return stub_open(inode, filp, minor);
+}
+
+static int accel_stub_open(struct inode *inode, struct file *filp)
+{
+	struct drm_minor *minor;
+
+	DRM_DEBUG("\n");
+
+	minor = drm_minor_acquire(iminor(inode), true);
+	if (IS_ERR(minor))
+		return PTR_ERR(minor);
+
+	return stub_open(inode, filp, minor);
+}
+
 static const struct file_operations drm_stub_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_stub_open,
 	.llseek = noop_llseek,
 };
 
+static const struct file_operations accel_stub_fops = {
+	.owner = THIS_MODULE,
+	.open = accel_stub_open,
+	.llseek = noop_llseek,
+};
+
 static void accel_core_exit(void)
 {
 #ifdef CONFIG_ACCEL
 	unregister_chrdev(ACCEL_MAJOR, "accel");
 	debugfs_remove(accel_debugfs_root);
 	accel_sysfs_destroy();
+	idr_destroy(&accel_minors_idr);
 #endif
 }
 
@@ -1060,6 +1151,8 @@ static int __init accel_core_init(void)
 #ifdef CONFIG_ACCEL
 	int ret;
 
+	idr_init(&accel_minors_idr);
+
 	ret = accel_sysfs_init();
 	if (ret < 0) {
 		DRM_ERROR("Cannot create ACCEL class: %d\n", ret);
@@ -1068,7 +1161,7 @@ static int __init accel_core_init(void)
 
 	accel_debugfs_root = debugfs_create_dir("accel", NULL);
 
-	ret = register_chrdev(ACCEL_MAJOR, "accel", &drm_stub_fops);
+	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
 	if (ret < 0)
 		goto error;
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index a8b4d918e9a3..d9c60108ab7b 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -389,30 +389,12 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
 	return 0;
 }
 
-/**
- * drm_open - open method for DRM file
- * @inode: device inode
- * @filp: file pointer.
- *
- * This function must be used by drivers as their &file_operations.open method.
- * It looks up the correct DRM device and instantiates all the per-file
- * resources for it. It also calls the &drm_driver.open driver callback.
- *
- * RETURNS:
- *
- * 0 on success or negative errno value on failure.
- */
-int drm_open(struct inode *inode, struct file *filp)
+static int __drm_open(struct inode *inode, struct file *filp, struct drm_minor *minor)
 {
 	struct drm_device *dev;
-	struct drm_minor *minor;
 	int retcode;
 	int need_setup = 0;
 
-	minor = drm_minor_acquire(iminor(inode));
-	if (IS_ERR(minor))
-		return PTR_ERR(minor);
-
 	dev = minor->dev;
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
@@ -446,8 +428,57 @@ int drm_open(struct inode *inode, struct file *filp)
 	drm_minor_release(minor);
 	return retcode;
 }
+
+/**
+ * drm_open - open method for DRM file
+ * @inode: device inode
+ * @filp: file pointer.
+ *
+ * This function must be used by drivers as their &file_operations.open method.
+ * It looks up the correct DRM device and instantiates all the per-file
+ * resources for it. It also calls the &drm_driver.open driver callback.
+ *
+ * RETURNS:
+ *
+ * 0 on success or negative errno value on failure.
+ */
+int drm_open(struct inode *inode, struct file *filp)
+{
+	struct drm_minor *minor;
+
+	minor = drm_minor_acquire(iminor(inode), false);
+	if (IS_ERR(minor))
+		return PTR_ERR(minor);
+
+	return __drm_open(inode, filp, minor);
+}
 EXPORT_SYMBOL(drm_open);
 
+/**
+ * accel_open - open method for ACCEL file
+ * @inode: device inode
+ * @filp: file pointer.
+ *
+ * This function must be used by drivers as their &file_operations.open method.
+ * It looks up the correct ACCEL device and instantiates all the per-file
+ * resources for it. It also calls the &drm_driver.open driver callback.
+ *
+ * RETURNS:
+ *
+ * 0 on success or negative errno value on failure.
+ */
+int accel_open(struct inode *inode, struct file *filp)
+{
+	struct drm_minor *minor;
+
+	minor = drm_minor_acquire(iminor(inode), true);
+	if (IS_ERR(minor))
+		return PTR_ERR(minor);
+
+	return __drm_open(inode, filp, minor);
+}
+EXPORT_SYMBOL(accel_open);
+
 void drm_lastclose(struct drm_device * dev)
 {
 	DRM_DEBUG("\n");
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index cbeb9bd3c312..e12efc243527 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -78,7 +78,7 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 				 uint32_t handle);
 
 /* drm_drv.c */
-struct drm_minor *drm_minor_acquire(unsigned int minor_id);
+struct drm_minor *drm_minor_acquire(unsigned int minor_id, bool is_accel_minor);
 void drm_minor_release(struct drm_minor *minor);
 
 /* drm_managed.c */
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 70b2a28f55c4..1335476ad373 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -51,6 +51,10 @@ static struct device_type drm_sysfs_device_minor = {
 	.name = "drm_minor"
 };
 
+static struct device_type accel_sysfs_device_minor = {
+	.name = "accel_minor"
+};
+
 static struct device_type drm_sysfs_device_connector = {
 	.name = "drm_connector",
 };
@@ -523,19 +527,28 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 	struct device *kdev;
 	int r;
 
-	if (minor->type == DRM_MINOR_RENDER)
-		minor_str = "renderD%d";
-	else
-		minor_str = "card%d";
-
 	kdev = kzalloc(sizeof(*kdev), GFP_KERNEL);
 	if (!kdev)
 		return ERR_PTR(-ENOMEM);
 
 	device_initialize(kdev);
-	kdev->devt = MKDEV(DRM_MAJOR, minor->index);
-	kdev->class = drm_class;
-	kdev->type = &drm_sysfs_device_minor;
+
+	if (minor->type == DRM_MINOR_ACCEL) {
+		minor_str = "accel%d";
+		kdev->devt = MKDEV(ACCEL_MAJOR, minor->index);
+		kdev->class = accel_class;
+		kdev->type = &accel_sysfs_device_minor;
+	} else {
+		if (minor->type == DRM_MINOR_RENDER)
+			minor_str = "renderD%d";
+		else
+			minor_str = "card%d";
+
+		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
+		kdev->class = drm_class;
+		kdev->type = &drm_sysfs_device_minor;
+	}
+
 	kdev->parent = minor->dev->dev;
 	kdev->release = drm_sysfs_release;
 	dev_set_drvdata(kdev, minor);
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
index f6159acb8856..4f64102ba8d9 100644
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
+	DRIVER_COMPUTE_ACCEL     = BIT(7),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index d780fd151789..e0895a90f394 100644
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
+int accel_open(struct inode *inode, struct file *filp);
 ssize_t drm_read(struct file *filp, char __user *buffer,
 		 size_t count, loff_t *offset);
 int drm_release(struct inode *inode, struct file *filp);
-- 
2.34.1

