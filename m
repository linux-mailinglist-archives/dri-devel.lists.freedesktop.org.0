Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A45A36A5
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 11:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA39010EC13;
	Sat, 27 Aug 2022 09:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4F710EA2E;
 Sat, 27 Aug 2022 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661593883; x=1693129883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n8C9SfqQ3/On3nfSqWBK0Lf6LBRijUTmV1hHWFBwOug=;
 b=GejaKWFWlDVrRwGFX/6eK6774MfZkEsa9SnmjY9odJWNo3G8EUueh8w8
 QGp6uI8KhalDF/Jq/vCfUuJ793I9XhZ1mpaHGj6AQNfQoqsv72SkjPXps
 klmGAu3b0Y7uf84cZW3/HWdjaI9YRUq0XuWTB4rIZAvcWub4SfCpwpZ0C
 3zno23yDz74jzNmASmAMiVc/omO5LiRiuGyqMbbaWw/9O2Ut7QBFzHSKl
 TllCCZ1bZAf62NrDlRd+cSkvSFJ8dM5m5pq00RmVAfcKmQXW2OJeeAKId
 O4MznyZHwdLP6niy0qwTqKrbus6yJahfcm26gZ6kgtxcprae5t1SY1OrS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="294659638"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="294659638"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 02:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="640353996"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 27 Aug 2022 02:51:14 -0700
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
 Abhishek Sahu <abhsahu@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
Subject: [PATCH 11/15] vfio/platform: Use the new device life cycle helpers
Date: Sun, 28 Aug 2022 01:10:33 +0800
Message-Id: <20220827171037.30297-12-kevin.tian@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220827171037.30297-1-kevin.tian@intel.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
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

Move vfio_device_ops from platform core to platform drivers so device
specific init/cleanup can be added.

Introduce two new helpers vfio_platform_init/release_common() for the
use in driver @init/@release.

vfio_platform_probe/remove_common() will be deprecated.

Signed-off-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/vfio/platform/vfio_platform.c         | 66 +++++++++++++++----
 drivers/vfio/platform/vfio_platform_common.c  | 53 ++++++++++++---
 drivers/vfio/platform/vfio_platform_private.h | 15 +++++
 3 files changed, 111 insertions(+), 23 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
index 04f40c5acfd6..82cedcebfd90 100644
--- a/drivers/vfio/platform/vfio_platform.c
+++ b/drivers/vfio/platform/vfio_platform.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/vfio.h>
+#include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
 
 #include "vfio_platform_private.h"
@@ -36,14 +37,11 @@ static int get_platform_irq(struct vfio_platform_device *vdev, int i)
 	return platform_get_irq_optional(pdev, i);
 }
 
-static int vfio_platform_probe(struct platform_device *pdev)
+static int vfio_platform_init_dev(struct vfio_device *core_vdev)
 {
-	struct vfio_platform_device *vdev;
-	int ret;
-
-	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
-	if (!vdev)
-		return -ENOMEM;
+	struct vfio_platform_device *vdev =
+		container_of(core_vdev, struct vfio_platform_device, vdev);
+	struct platform_device *pdev = to_platform_device(core_vdev->dev);
 
 	vdev->opaque = (void *) pdev;
 	vdev->name = pdev->name;
@@ -52,24 +50,64 @@ static int vfio_platform_probe(struct platform_device *pdev)
 	vdev->get_irq = get_platform_irq;
 	vdev->reset_required = reset_required;
 
-	ret = vfio_platform_probe_common(vdev, &pdev->dev);
-	if (ret) {
-		kfree(vdev);
-		return ret;
-	}
+	return vfio_platform_init_common(vdev);
+}
+
+static const struct vfio_device_ops vfio_platform_ops;
+static int vfio_platform_probe(struct platform_device *pdev)
+{
+	struct vfio_platform_device *vdev;
+	int ret;
+
+	vdev = vfio_alloc_device(vfio_platform_device, vdev, &pdev->dev,
+				 &vfio_platform_ops);
+	if (IS_ERR(vdev))
+		return PTR_ERR(vdev);
+
+	ret = vfio_register_group_dev(&vdev->vdev);
+	if (ret)
+		goto out_put_vdev;
+
+	pm_runtime_enable(&pdev->dev);
 	dev_set_drvdata(&pdev->dev, vdev);
 	return 0;
+
+out_put_vdev:
+	vfio_put_device(&vdev->vdev);
+	return ret;
+}
+
+static void vfio_platform_release_dev(struct vfio_device *core_vdev)
+{
+	struct vfio_platform_device *vdev =
+		container_of(core_vdev, struct vfio_platform_device, vdev);
+
+	vfio_platform_release_common(vdev);
+	vfio_free_device(core_vdev);
 }
 
 static int vfio_platform_remove(struct platform_device *pdev)
 {
 	struct vfio_platform_device *vdev = dev_get_drvdata(&pdev->dev);
 
-	vfio_platform_remove_common(vdev);
-	kfree(vdev);
+	vfio_unregister_group_dev(&vdev->vdev);
+	pm_runtime_disable(vdev->device);
+	vfio_put_device(&vdev->vdev);
 	return 0;
 }
 
+static const struct vfio_device_ops vfio_platform_ops = {
+	.name		= "vfio-platform",
+	.init		= vfio_platform_init_dev,
+	.release	= vfio_platform_release_dev,
+	.open_device	= vfio_platform_open_device,
+	.close_device	= vfio_platform_close_device,
+	.ioctl		= vfio_platform_ioctl,
+	.read		= vfio_platform_read,
+	.write		= vfio_platform_write,
+	.mmap		= vfio_platform_mmap,
+};
+
 static struct platform_driver vfio_platform_driver = {
 	.probe		= vfio_platform_probe,
 	.remove		= vfio_platform_remove,
diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index 256f55b84e70..4c01bf0adebb 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -218,7 +218,7 @@ static int vfio_platform_call_reset(struct vfio_platform_device *vdev,
 	return -EINVAL;
 }
 
-static void vfio_platform_close_device(struct vfio_device *core_vdev)
+void vfio_platform_close_device(struct vfio_device *core_vdev)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
@@ -236,8 +236,9 @@ static void vfio_platform_close_device(struct vfio_device *core_vdev)
 	vfio_platform_regions_cleanup(vdev);
 	vfio_platform_irq_cleanup(vdev);
 }
+EXPORT_SYMBOL_GPL(vfio_platform_close_device);
 
-static int vfio_platform_open_device(struct vfio_device *core_vdev)
+int vfio_platform_open_device(struct vfio_device *core_vdev)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
@@ -273,9 +274,10 @@ static int vfio_platform_open_device(struct vfio_device *core_vdev)
 	vfio_platform_regions_cleanup(vdev);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vfio_platform_open_device);
 
-static long vfio_platform_ioctl(struct vfio_device *core_vdev,
-				unsigned int cmd, unsigned long arg)
+long vfio_platform_ioctl(struct vfio_device *core_vdev,
+			 unsigned int cmd, unsigned long arg)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
@@ -382,6 +384,7 @@ static long vfio_platform_ioctl(struct vfio_device *core_vdev,
 
 	return -ENOTTY;
 }
+EXPORT_SYMBOL_GPL(vfio_platform_ioctl);
 
 static ssize_t vfio_platform_read_mmio(struct vfio_platform_region *reg,
 				       char __user *buf, size_t count,
@@ -438,8 +441,8 @@ static ssize_t vfio_platform_read_mmio(struct vfio_platform_region *reg,
 	return -EFAULT;
 }
 
-static ssize_t vfio_platform_read(struct vfio_device *core_vdev,
-				  char __user *buf, size_t count, loff_t *ppos)
+ssize_t vfio_platform_read(struct vfio_device *core_vdev,
+			   char __user *buf, size_t count, loff_t *ppos)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
@@ -460,6 +463,7 @@ static ssize_t vfio_platform_read(struct vfio_device *core_vdev,
 
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(vfio_platform_read);
 
 static ssize_t vfio_platform_write_mmio(struct vfio_platform_region *reg,
 					const char __user *buf, size_t count,
@@ -515,8 +519,8 @@ static ssize_t vfio_platform_write_mmio(struct vfio_platform_region *reg,
 	return -EFAULT;
 }
 
-static ssize_t vfio_platform_write(struct vfio_device *core_vdev, const char __user *buf,
-				   size_t count, loff_t *ppos)
+ssize_t vfio_platform_write(struct vfio_device *core_vdev, const char __user *buf,
+			    size_t count, loff_t *ppos)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
@@ -537,6 +541,7 @@ static ssize_t vfio_platform_write(struct vfio_device *core_vdev, const char __u
 
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(vfio_platform_write);
 
 static int vfio_platform_mmap_mmio(struct vfio_platform_region region,
 				   struct vm_area_struct *vma)
@@ -558,7 +563,7 @@ static int vfio_platform_mmap_mmio(struct vfio_platform_region region,
 			       req_len, vma->vm_page_prot);
 }
 
-static int vfio_platform_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma)
+int vfio_platform_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
@@ -598,6 +603,7 @@ static int vfio_platform_mmap(struct vfio_device *core_vdev, struct vm_area_stru
 
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(vfio_platform_mmap);
 
 static const struct vfio_device_ops vfio_platform_ops = {
 	.name		= "vfio-platform",
@@ -639,6 +645,35 @@ static int vfio_platform_of_probe(struct vfio_platform_device *vdev,
  * If the firmware is ACPI type, then acpi_disabled is 0. All other checks are
  * valid checks. We cannot claim that this system is DT.
  */
+int vfio_platform_init_common(struct vfio_platform_device *vdev)
+{
+	int ret;
+	struct device *dev = vdev->vdev.dev;
+
+	ret = vfio_platform_acpi_probe(vdev, dev);
+	if (ret)
+		ret = vfio_platform_of_probe(vdev, dev);
+
+	if (ret)
+		return ret;
+
+	vdev->device = dev;
+	mutex_init(&vdev->igate);
+
+	ret = vfio_platform_get_reset(vdev);
+	if (ret && vdev->reset_required)
+		dev_err(dev, "No reset function found for device %s\n",
+			vdev->name);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vfio_platform_init_common);
+
+void vfio_platform_release_common(struct vfio_platform_device *vdev)
+{
+	vfio_platform_put_reset(vdev);
+}
+EXPORT_SYMBOL_GPL(vfio_platform_release_common);
+
 int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 			       struct device *dev)
 {
diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
index 691b43f4b2b2..a769d649fb97 100644
--- a/drivers/vfio/platform/vfio_platform_private.h
+++ b/drivers/vfio/platform/vfio_platform_private.h
@@ -81,6 +81,21 @@ struct vfio_platform_reset_node {
 int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 			       struct device *dev);
 void vfio_platform_remove_common(struct vfio_platform_device *vdev);
+int vfio_platform_init_common(struct vfio_platform_device *vdev);
+void vfio_platform_release_common(struct vfio_platform_device *vdev);
+
+int vfio_platform_open_device(struct vfio_device *core_vdev);
+void vfio_platform_close_device(struct vfio_device *core_vdev);
+long vfio_platform_ioctl(struct vfio_device *core_vdev,
+			 unsigned int cmd, unsigned long arg);
+ssize_t vfio_platform_read(struct vfio_device *core_vdev,
+			   char __user *buf, size_t count,
+			   loff_t *ppos);
+ssize_t vfio_platform_write(struct vfio_device *core_vdev,
+			    const char __user *buf,
+			    size_t count, loff_t *ppos);
+int vfio_platform_mmap(struct vfio_device *core_vdev,
+		       struct vm_area_struct *vma);
 
 int vfio_platform_irq_init(struct vfio_platform_device *vdev);
 void vfio_platform_irq_cleanup(struct vfio_platform_device *vdev);
-- 
2.21.3

