Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E8616ED3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 21:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B815F10E61A;
	Wed,  2 Nov 2022 20:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CCE10E61A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 20:34:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9F85B81AA7;
 Wed,  2 Nov 2022 20:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F44FC433D7;
 Wed,  2 Nov 2022 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667421271;
 bh=B8ZEkF3UEHgt25u9TF8HM/CN0QZSm2SPbFW9ClyIvc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bOAQBo+NX3kP7xE+u3pc8SQtvmSr4c8vXE/SpGNs6bbf3XAX2UMmmgoWR+9FIQXN7
 q+uE6lz0/5Zftv9MTAzkneJyP9qA62OAR6/YYNuL5Ko6KlL3eAmrq9JmmEvgZMYgui
 5tIfMUvOaZ00QbnGPqADLmw79EhJxnEhCTzekX1OiszIN14gm6N6DLZwnsF+ee0ZLw
 BnscPWImWRxpclb6FPQZ+Gxus+oYr/laUfRtH5g/YwA9rNPZ5FIhBGEyydDzmVciFm
 6oWTEMxHIWq0LYznCK3UG86+X9MijwwLPdwS7O9cdJ0Y4+sQBgsOTIb7opemPho+Ns
 vZAX2cQ8p5q5g==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH v2 3/3] drm: initialize accel framework
Date: Wed,  2 Nov 2022 22:34:05 +0200
Message-Id: <20221102203405.1797491-4-ogabbay@kernel.org>
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

Now that we have the accel framework code ready, let's call the
accel functions from all the appropriate places. These places are the
drm module init/exit functions, and all the drm_minor handling
functions.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/gpu/drm/drm_drv.c   | 98 ++++++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_sysfs.c | 24 ++++++---
 2 files changed, 90 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..c8ea57a974b7 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -35,6 +35,7 @@
 #include <linux/slab.h>
 #include <linux/srcu.h>
 
+#include <drm/drm_accel.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_client.h>
 #include <drm/drm_color_mgmt.h>
@@ -90,6 +91,8 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 		return &dev->primary;
 	case DRM_MINOR_RENDER:
 		return &dev->render;
+	case DRM_MINOR_ACCEL:
+		return &dev->accel;
 	default:
 		BUG();
 	}
@@ -104,9 +107,13 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 
 	put_device(minor->kdev);
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_remove(&drm_minors_idr, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	if (minor->type == DRM_MINOR_ACCEL) {
+		accel_minor_remove(minor->index);
+	} else {
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		idr_remove(&drm_minors_idr, minor->index);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+	}
 }
 
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
@@ -123,13 +130,17 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
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
+		r = accel_minor_alloc();
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
@@ -163,7 +174,11 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 
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
 
@@ -172,9 +187,15 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 		goto err_debugfs;
 
 	/* replace NULL with @minor so lookups will succeed from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, minor, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	if (minor->type == DRM_MINOR_ACCEL) {
+		ret = accel_minor_replace(minor, minor->index);
+		if (ret < 0)
+			goto err_debugfs;
+	} else {
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		idr_replace(&drm_minors_idr, minor, minor->index);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+	}
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -194,9 +215,13 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, NULL, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	if (minor->type == DRM_MINOR_ACCEL) {
+		accel_minor_replace(NULL, minor->index);
+	} else {
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		idr_replace(&drm_minors_idr, NULL, minor->index);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+	}
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -603,6 +628,14 @@ static int drm_dev_init(struct drm_device *dev,
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
@@ -628,15 +661,21 @@ static int drm_dev_init(struct drm_device *dev,
 
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
@@ -883,6 +922,10 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto err_minors;
 
+	ret = drm_minor_register(dev, DRM_MINOR_ACCEL);
+	if (ret)
+		goto err_minors;
+
 	ret = create_compat_control_link(dev);
 	if (ret)
 		goto err_minors;
@@ -902,12 +945,13 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
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
@@ -950,6 +994,7 @@ void drm_dev_unregister(struct drm_device *dev)
 	drm_legacy_rmmaps(dev);
 
 	remove_compat_control_link(dev);
+	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
 	drm_minor_unregister(dev, DRM_MINOR_RENDER);
 }
@@ -1034,6 +1079,7 @@ static const struct file_operations drm_stub_fops = {
 static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
+	accel_core_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
@@ -1061,6 +1107,10 @@ static int __init drm_core_init(void)
 	if (ret < 0)
 		goto error;
 
+	ret = accel_core_init();
+	if (ret < 0)
+		goto error;
+
 	drm_privacy_screen_lookup_init();
 
 	drm_core_init_complete = true;
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 430e00b16eec..b8da978d85bb 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -19,6 +19,7 @@
 #include <linux/kdev_t.h>
 #include <linux/slab.h>
 
+#include <drm/drm_accel.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -471,19 +472,26 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
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
+		accel_set_device_instance_params(kdev, minor->index);
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
-- 
2.25.1

