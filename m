Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2AB5A36A1
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 11:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B6A10E6F3;
	Sat, 27 Aug 2022 09:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A71710E66D;
 Sat, 27 Aug 2022 09:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661593875; x=1693129875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mqBSHZdc3I5LuPaSmmg6YFNTQtRdx9sXUMJ/SXpc5Yg=;
 b=MX7nssXwnHl7Z3cDFIiNSidrx7GAGZHoKfK+VM3VclkIAW8H8p1ujB3O
 ey3YqDtckCc1DqZhvUzF7ZVxjfmgVm1pm45pxaQPv6vIvv/rDk3hgkRzJ
 XwmshRzoqlzMS3f+ooNkbRkLY2oAig84j9MIoaelWlzxAnseu9Sh2lJDf
 F1juqGQPPwRvO7FhW8pQ6Ho4SUDD2CsLmf6zJpP6QD20ja9EiJnBRQ8HH
 a6haq21jwytN/dSbBqZ4tKXL01R/f3LjLE+kPtm1tyO0k50P2GwPd4qrv
 z+wEkWeg5hmZzH1GbCm67qLAABVKT8bjHe12b5o35WQzcZ6MOYe+RJxQx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="295921585"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="295921585"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 02:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="640353976"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 27 Aug 2022 02:51:05 -0700
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
Subject: [PATCH 10/15] vfio/fsl-mc: Use the new device life cycle helpers
Date: Sun, 28 Aug 2022 01:10:32 +0800
Message-Id: <20220827171037.30297-11-kevin.tian@intel.com>
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

From: Yi Liu <yi.l.liu@intel.com>

Export symbol of vfio_release_device_set() so fsl-mc @init can handle
the error path cleanly instead of assuming certain vfio core API can
help release device_set afterwards.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 87 +++++++++++++++++++------------
 drivers/vfio/vfio_main.c          |  3 +-
 include/linux/vfio.h              |  1 +
 3 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 3feff729f3ce..eec3cb914f57 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -418,16 +418,7 @@ static int vfio_fsl_mc_mmap(struct vfio_device *core_vdev,
 	return vfio_fsl_mc_mmap_mmio(vdev->regions[index], vma);
 }
 
-static const struct vfio_device_ops vfio_fsl_mc_ops = {
-	.name		= "vfio-fsl-mc",
-	.open_device	= vfio_fsl_mc_open_device,
-	.close_device	= vfio_fsl_mc_close_device,
-	.ioctl		= vfio_fsl_mc_ioctl,
-	.read		= vfio_fsl_mc_read,
-	.write		= vfio_fsl_mc_write,
-	.mmap		= vfio_fsl_mc_mmap,
-};
-
+static const struct vfio_device_ops vfio_fsl_mc_ops;
 static int vfio_fsl_mc_bus_notifier(struct notifier_block *nb,
 				    unsigned long action, void *data)
 {
@@ -518,35 +509,49 @@ static void vfio_fsl_uninit_device(struct vfio_fsl_mc_device *vdev)
 	bus_unregister_notifier(&fsl_mc_bus_type, &vdev->nb);
 }
 
-static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
+static int vfio_fsl_mc_init_dev(struct vfio_device *core_vdev)
 {
-	struct vfio_fsl_mc_device *vdev;
-	struct device *dev = &mc_dev->dev;
+	struct vfio_fsl_mc_device *vdev =
+		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
+	struct fsl_mc_device *mc_dev = to_fsl_mc_device(core_vdev->dev);
 	int ret;
 
-	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
-	if (!vdev)
-		return -ENOMEM;
-
-	vfio_init_group_dev(&vdev->vdev, dev, &vfio_fsl_mc_ops);
 	vdev->mc_dev = mc_dev;
 	mutex_init(&vdev->igate);
 
 	if (is_fsl_mc_bus_dprc(mc_dev))
-		ret = vfio_assign_device_set(&vdev->vdev, &mc_dev->dev);
+		ret = vfio_assign_device_set(core_vdev, &mc_dev->dev);
 	else
-		ret = vfio_assign_device_set(&vdev->vdev, mc_dev->dev.parent);
+		ret = vfio_assign_device_set(core_vdev, mc_dev->dev.parent);
+
 	if (ret)
-		goto out_uninit;
+		return ret;
 
 	ret = vfio_fsl_mc_init_device(vdev);
 	if (ret)
-		goto out_uninit;
+		goto err_assign;
+	return 0;
+
+err_assign:
+	vfio_release_device_set(core_vdev);
+	return ret;
+}
+
+static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
+{
+	struct vfio_fsl_mc_device *vdev;
+	struct device *dev = &mc_dev->dev;
+	int ret;
+
+	vdev = vfio_alloc_device(vfio_fsl_mc_device, vdev, dev,
+				 &vfio_fsl_mc_ops);
+	if (IS_ERR(vdev))
+		return PTR_ERR(vdev);
 
 	ret = vfio_register_group_dev(&vdev->vdev);
 	if (ret) {
 		dev_err(dev, "VFIO_FSL_MC: Failed to add to vfio group\n");
-		goto out_device;
+		goto out_put_vdev;
 	}
 
 	ret = vfio_fsl_mc_scan_container(mc_dev);
@@ -557,30 +562,44 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 
 out_group_dev:
 	vfio_unregister_group_dev(&vdev->vdev);
-out_device:
-	vfio_fsl_uninit_device(vdev);
-out_uninit:
-	vfio_uninit_group_dev(&vdev->vdev);
-	kfree(vdev);
+out_put_vdev:
+	vfio_put_device(&vdev->vdev);
 	return ret;
 }
 
+void vfio_fsl_mc_release_dev(struct vfio_device *core_vdev)
+{
+	struct vfio_fsl_mc_device *vdev =
+		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
+
+	vfio_fsl_uninit_device(vdev);
+	mutex_destroy(&vdev->igate);
+	vfio_free_device(core_vdev);
+}
+
 static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
 {
 	struct device *dev = &mc_dev->dev;
 	struct vfio_fsl_mc_device *vdev = dev_get_drvdata(dev);
 
 	vfio_unregister_group_dev(&vdev->vdev);
-	mutex_destroy(&vdev->igate);
-
 	dprc_remove_devices(mc_dev, NULL, 0);
-	vfio_fsl_uninit_device(vdev);
-
-	vfio_uninit_group_dev(&vdev->vdev);
-	kfree(vdev);
+	vfio_put_device(&vdev->vdev);
 	return 0;
 }
 
+static const struct vfio_device_ops vfio_fsl_mc_ops = {
+	.name		= "vfio-fsl-mc",
+	.init		= vfio_fsl_mc_init_dev,
+	.release	= vfio_fsl_mc_release_dev,
+	.open_device	= vfio_fsl_mc_open_device,
+	.close_device	= vfio_fsl_mc_close_device,
+	.ioctl		= vfio_fsl_mc_ioctl,
+	.read		= vfio_fsl_mc_read,
+	.write		= vfio_fsl_mc_write,
+	.mmap		= vfio_fsl_mc_mmap,
+};
+
 static struct fsl_mc_driver vfio_fsl_mc_driver = {
 	.probe		= vfio_fsl_mc_probe,
 	.remove		= vfio_fsl_mc_remove,
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index af8aad116f2b..9485da17f2e6 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -141,7 +141,7 @@ int vfio_assign_device_set(struct vfio_device *device, void *set_id)
 }
 EXPORT_SYMBOL_GPL(vfio_assign_device_set);
 
-static void vfio_release_device_set(struct vfio_device *device)
+void vfio_release_device_set(struct vfio_device *device)
 {
 	struct vfio_device_set *dev_set = device->dev_set;
 
@@ -161,6 +161,7 @@ static void vfio_release_device_set(struct vfio_device *device)
 	}
 	xa_unlock(&vfio_device_set_xa);
 }
+EXPORT_SYMBOL_GPL(vfio_release_device_set);
 
 #ifdef CONFIG_VFIO_NOIOMMU
 static void *vfio_noiommu_open(unsigned long arg)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e1e9e8352903..b0928a81b45a 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -168,6 +168,7 @@ int vfio_register_emulated_iommu_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
 
 int vfio_assign_device_set(struct vfio_device *device, void *set_id);
+void vfio_release_device_set(struct vfio_device *device);
 
 int vfio_mig_get_next_state(struct vfio_device *device,
 			    enum vfio_device_mig_state cur_fsm,
-- 
2.21.3

