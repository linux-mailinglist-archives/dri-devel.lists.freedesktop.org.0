Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE061E615
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 22:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505B310E1BF;
	Sun,  6 Nov 2022 21:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED6E10E0E2
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 21:02:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41975B80D15;
 Sun,  6 Nov 2022 21:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F73AC433C1;
 Sun,  6 Nov 2022 21:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667768571;
 bh=BA86wt9qy7BhHqwygVEIPzDOnzGpw90IgpGJ0BKnjow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EZN0JbtuSGI/GOHNSA119TPi5Luxjec1iYJsO/HhPn0IenOXsDBJN6Qp4w+9bxJRn
 ULg3IYFcQVQIENTpPCYegqn/rSESGomFJNhk26a4hEQMf+0c7NZ5FQ4BP55qLkI0+y
 Ak+j6frEeuprsmbZcREgAPPI/mzxpxQMg328yWKDvJi2bcH7al+TTLDaWHJyeCkbGQ
 0McbJvl27RKkQFY8RGusUrega0ix6TWh5W7Y+LLHLvL+E5zkMV6PtIAOwdZFNvSvey
 uLkltG2abNCcLbP+XRA+GHEEZek+6AtTJZbXOS0HiT9ckfDbwVy+hpOGUJUPejakKZ
 QKsXU548MJjyg==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH v3 3/3] drm: initialize accel framework
Date: Sun,  6 Nov 2022 23:02:25 +0200
Message-Id: <20221106210225.2065371-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221106210225.2065371-1-ogabbay@kernel.org>
References: <20221106210225.2065371-1-ogabbay@kernel.org>
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
 Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
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
Changes in v3:
 - Call the new accel_debugfs_init() to initalize debugfs per minor.
 - accel_minor_replace() is void so no need to check return value.

 drivers/gpu/drm/drm_drv.c   | 102 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/drm_sysfs.c |  24 ++++++---
 2 files changed, 91 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..1aec019f6389 100644
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
@@ -161,10 +172,14 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 	if (!minor)
 		return 0;

-	ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
-	if (ret) {
-		DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
-		goto err_debugfs;
+	if (minor->type == DRM_MINOR_ACCEL) {
+		accel_debugfs_init(minor, minor->index);
+	} else {
+		ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
+		if (ret) {
+			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
+			goto err_debugfs;
+		}
 	}

 	ret = device_add(minor->kdev);
@@ -172,9 +187,13 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 		goto err_debugfs;

 	/* replace NULL with @minor so lookups will succeed from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, minor, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	if (minor->type == DRM_MINOR_ACCEL) {
+		accel_minor_replace(minor, minor->index);
+	} else {
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		idr_replace(&drm_minors_idr, minor, minor->index);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+	}

 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -194,9 +213,13 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
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
@@ -603,6 +626,14 @@ static int drm_dev_init(struct drm_device *dev,
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
@@ -628,15 +659,21 @@ static int drm_dev_init(struct drm_device *dev,

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
@@ -883,6 +920,10 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto err_minors;

+	ret = drm_minor_register(dev, DRM_MINOR_ACCEL);
+	if (ret)
+		goto err_minors;
+
 	ret = create_compat_control_link(dev);
 	if (ret)
 		goto err_minors;
@@ -902,12 +943,13 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
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
@@ -950,6 +992,7 @@ void drm_dev_unregister(struct drm_device *dev)
 	drm_legacy_rmmaps(dev);

 	remove_compat_control_link(dev);
+	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
 	drm_minor_unregister(dev, DRM_MINOR_RENDER);
 }
@@ -1034,6 +1077,7 @@ static const struct file_operations drm_stub_fops = {
 static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
+	accel_core_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
@@ -1061,6 +1105,10 @@ static int __init drm_core_init(void)
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

