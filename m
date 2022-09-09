Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9382A5B2C89
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 05:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F0610EA7C;
	Fri,  9 Sep 2022 03:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0914D10EA2F;
 Fri,  9 Sep 2022 03:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662692755; x=1694228755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PbZkT6ZZ7+I0M0O5egEk2E7n+Z432mjHEzIYI6vQUQU=;
 b=hGTQT4XVUe6UKEVkUKkbLCqm/VsZ8Dsaou4lBhWmA5UvDErWdK1ftg0n
 zet791oMi8Y9gwGeS2A12Bef4t6oOS/yGOCkwrBCKyLHMmhF1Ng6gmAXK
 Qq5jHK/I/RuVSeO76yF8NWUwL+N3W8ySB9aacIMlE5KWI1UaPwzhGLKmd
 yj+vzr1ApTpZnNIfRBuOxte/vZqy+8ohjvG0P0N8z6LdZN3OAfWzf4EiL
 kU4q56fDWFIA2seed4bUPil+pEfyWkztKaj+4YdRA/EFHrCKLmVhULUFK
 CT3Cn4ByNDwA50oqhVNalc86ZTImtqimUlcn1xYqzX5jNuaWMT8FTBT/j w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359109891"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="359109891"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 20:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740909360"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 20:05:45 -0700
From: Kevin Tian <kevin.tian@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Abhishek Sahu <abhsahu@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org
Subject: [PATCH v3 15/15] vfio: Add struct device to vfio_device
Date: Fri,  9 Sep 2022 18:22:47 +0800
Message-Id: <20220909102247.67324-16-kevin.tian@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220909102247.67324-1-kevin.tian@intel.com>
References: <20220909102247.67324-1-kevin.tian@intel.com>
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
Cc: Yi Liu <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yi Liu <yi.l.liu@intel.com>

and replace kref. With it a 'vfio-dev/vfioX' node is created under the
sysfs path of the parent, indicating the device is bound to a vfio
driver, e.g.:

/sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0

It is also a preparatory step toward adding cdev for supporting future
device-oriented uAPI.

Add Documentation/ABI/testing/sysfs-devices-vfio-dev.

Also take this chance to rename chardev 'vfio' to 'vfio-group' in
/proc/devices.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../ABI/testing/sysfs-devices-vfio-dev        |  8 +++
 MAINTAINERS                                   |  1 +
 drivers/vfio/vfio_main.c                      | 67 +++++++++++++++----
 include/linux/vfio.h                          |  6 +-
 4 files changed, 67 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-vfio-dev

diff --git a/Documentation/ABI/testing/sysfs-devices-vfio-dev b/Documentation/ABI/testing/sysfs-devices-vfio-dev
new file mode 100644
index 000000000000..e21424fd9666
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-vfio-dev
@@ -0,0 +1,8 @@
+What:		 /sys/.../<device>/vfio-dev/vfioX/
+Date:		 September 2022
+Contact:	 Yi Liu <yi.l.liu@intel.com>
+Description:
+		 This directory is created when the device is bound to a
+		 vfio driver. The layout under this directory matches what
+		 exists for a standard 'struct device'. 'X' is a unique
+		 index marking this device in vfio.
diff --git a/MAINTAINERS b/MAINTAINERS
index d30f26e07cd3..02c8f11b1c17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21312,6 +21312,7 @@ R:	Cornelia Huck <cohuck@redhat.com>
 L:	kvm@vger.kernel.org
 S:	Maintained
 T:	git git://github.com/awilliam/linux-vfio.git
+F:	Documentation/ABI/testing/sysfs-devices-vfio-dev
 F:	Documentation/driver-api/vfio.rst
 F:	drivers/vfio/
 F:	include/linux/vfio.h
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 37cbd10f3faf..cd23d35c878c 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -49,6 +49,8 @@ static struct vfio {
 	struct mutex			group_lock; /* locks group_list */
 	struct ida			group_ida;
 	dev_t				group_devt;
+	struct class			*device_class;
+	struct ida			device_ida;
 } vfio;
 
 struct vfio_iommu_driver {
@@ -485,12 +487,13 @@ static struct vfio_device *vfio_group_get_device(struct vfio_group *group,
  * VFIO driver API
  */
 /* Release helper called by vfio_put_device() */
-void vfio_device_release(struct kref *kref)
+static void vfio_device_release(struct device *dev)
 {
 	struct vfio_device *device =
-			container_of(kref, struct vfio_device, kref);
+			container_of(dev, struct vfio_device, device);
 
 	vfio_release_device_set(device);
+	ida_free(&vfio.device_ida, device->index);
 
 	/*
 	 * kvfree() cannot be done here due to a life cycle mess in
@@ -500,7 +503,6 @@ void vfio_device_release(struct kref *kref)
 	 */
 	device->ops->release(device);
 }
-EXPORT_SYMBOL_GPL(vfio_device_release);
 
 /*
  * Alloc and initialize vfio_device so it can be registered to vfio
@@ -548,6 +550,13 @@ int vfio_init_device(struct vfio_device *device, struct device *dev,
 {
 	int ret;
 
+	ret = ida_alloc_max(&vfio.device_ida, MINORMASK, GFP_KERNEL);
+	if (ret < 0) {
+		dev_dbg(dev, "Error to alloc index\n");
+		return ret;
+	}
+
+	device->index = ret;
 	init_completion(&device->comp);
 	device->dev = dev;
 	device->ops = ops;
@@ -558,11 +567,15 @@ int vfio_init_device(struct vfio_device *device, struct device *dev,
 			goto out_uninit;
 	}
 
-	kref_init(&device->kref);
+	device_initialize(&device->device);
+	device->device.release = vfio_device_release;
+	device->device.class = vfio.device_class;
+	device->device.parent = device->dev;
 	return 0;
 
 out_uninit:
 	vfio_release_device_set(device);
+	ida_free(&vfio.device_ida, device->index);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vfio_init_device);
@@ -659,6 +672,7 @@ static int __vfio_register_dev(struct vfio_device *device,
 		struct vfio_group *group)
 {
 	struct vfio_device *existing_device;
+	int ret;
 
 	if (IS_ERR(group))
 		return PTR_ERR(group);
@@ -675,16 +689,21 @@ static int __vfio_register_dev(struct vfio_device *device,
 		dev_WARN(device->dev, "Device already exists on group %d\n",
 			 iommu_group_id(group->iommu_group));
 		vfio_device_put_registration(existing_device);
-		if (group->type == VFIO_NO_IOMMU ||
-		    group->type == VFIO_EMULATED_IOMMU)
-			iommu_group_remove_device(device->dev);
-		vfio_group_put(group);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto err_out;
 	}
 
 	/* Our reference on group is moved to the device */
 	device->group = group;
 
+	ret = dev_set_name(&device->device, "vfio%d", device->index);
+	if (ret)
+		goto err_out;
+
+	ret = device_add(&device->device);
+	if (ret)
+		goto err_out;
+
 	/* Refcounting can't start until the driver calls register */
 	refcount_set(&device->refcount, 1);
 
@@ -693,6 +712,12 @@ static int __vfio_register_dev(struct vfio_device *device,
 	mutex_unlock(&group->device_lock);
 
 	return 0;
+err_out:
+	if (group->type == VFIO_NO_IOMMU ||
+	    group->type == VFIO_EMULATED_IOMMU)
+		iommu_group_remove_device(device->dev);
+	vfio_group_put(group);
+	return ret;
 }
 
 int vfio_register_group_dev(struct vfio_device *device)
@@ -779,6 +804,9 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 	list_del(&device->group_next);
 	mutex_unlock(&group->device_lock);
 
+	/* Balances device_add in register path */
+	device_del(&device->device);
+
 	if (group->type == VFIO_NO_IOMMU || group->type == VFIO_EMULATED_IOMMU)
 		iommu_group_remove_device(device->dev);
 
@@ -2362,6 +2390,7 @@ static int __init vfio_init(void)
 	int ret;
 
 	ida_init(&vfio.group_ida);
+	ida_init(&vfio.device_ida);
 	mutex_init(&vfio.group_lock);
 	mutex_init(&vfio.iommu_drivers_lock);
 	INIT_LIST_HEAD(&vfio.group_list);
@@ -2377,12 +2406,20 @@ static int __init vfio_init(void)
 	vfio.class = class_create(THIS_MODULE, "vfio");
 	if (IS_ERR(vfio.class)) {
 		ret = PTR_ERR(vfio.class);
-		goto err_class;
+		goto err_group_class;
 	}
 
 	vfio.class->devnode = vfio_devnode;
 
-	ret = alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1, "vfio");
+	/* /sys/class/vfio-dev/vfioX */
+	vfio.device_class = class_create(THIS_MODULE, "vfio-dev");
+	if (IS_ERR(vfio.device_class)) {
+		ret = PTR_ERR(vfio.device_class);
+		goto err_dev_class;
+	}
+
+	ret = alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1,
+				  "vfio-group");
 	if (ret)
 		goto err_alloc_chrdev;
 
@@ -2398,9 +2435,12 @@ static int __init vfio_init(void)
 err_driver_register:
 	unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
 err_alloc_chrdev:
+	class_destroy(vfio.device_class);
+	vfio.device_class = NULL;
+err_dev_class:
 	class_destroy(vfio.class);
 	vfio.class = NULL;
-err_class:
+err_group_class:
 	misc_deregister(&vfio_dev);
 	return ret;
 }
@@ -2412,8 +2452,11 @@ static void __exit vfio_cleanup(void)
 #ifdef CONFIG_VFIO_NOIOMMU
 	vfio_unregister_iommu_driver(&vfio_noiommu_ops);
 #endif
+	ida_destroy(&vfio.device_ida);
 	ida_destroy(&vfio.group_ida);
 	unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
+	class_destroy(vfio.device_class);
+	vfio.device_class = NULL;
 	class_destroy(vfio.class);
 	vfio.class = NULL;
 	misc_deregister(&vfio_dev);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 3cf857b1eec7..ee399a768070 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -47,7 +47,8 @@ struct vfio_device {
 	struct kvm *kvm;
 
 	/* Members below here are private, not for driver use */
-	struct kref kref;	/* object life cycle */
+	unsigned int index;
+	struct device device;	/* device.kref covers object life circle */
 	refcount_t refcount;	/* user count on registered device*/
 	unsigned int open_count;
 	struct completion comp;
@@ -178,10 +179,9 @@ struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
 int vfio_init_device(struct vfio_device *device, struct device *dev,
 		     const struct vfio_device_ops *ops);
 void vfio_free_device(struct vfio_device *device);
-void vfio_device_release(struct kref *kref);
 static inline void vfio_put_device(struct vfio_device *device)
 {
-	kref_put(&device->kref, vfio_device_release);
+	put_device(&device->device);
 }
 
 int vfio_register_group_dev(struct vfio_device *device);
-- 
2.21.3

