Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD45BF48D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 05:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9685E10E808;
	Wed, 21 Sep 2022 03:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0542310E808;
 Wed, 21 Sep 2022 03:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663730866; x=1695266866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZjHKIhNQ5crLbCocdtut4IalrADZup4adNWcaf5dXk=;
 b=Vcr5OdrkI/X/EfQuOZQCRqV08SjKeHsuni24PnyqTZk8o6GV6iYAcPJO
 eCEAyqOy/+XOsMIxHXpY0twG/ImqH1qbhjtfl9V2lFWRmB9bQAC1IdniL
 teaxeR16C8m/ml9g9h/TxcIME6JXcsGiKVZU1GaiqIZkIdeze6LV64Mky
 Km+VBle/8Xsdld2Tjw2fO4H/YOT3+NhLTi0xkyElu0GBNwDwfczC2pllY
 2OzyNMLDUbuCPG5OwGlcZxBzYZVMWrkDXsEBiZjNMpvmgqfOxwzs7Fasu
 E8/Ey4WOzxONnlOYaOLneLxdPjLEGdu6pWLJTdaFF39/s4u8Xmm/Bw4bh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282933775"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="282933775"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 20:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="761574399"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2022 20:27:36 -0700
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
Subject: [PATCH v4 10/15] vfio/fsl-mc: Use the new device life cycle helpers
Date: Wed, 21 Sep 2022 18:43:56 +0800
Message-Id: <20220921104401.38898-11-kevin.tian@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220921104401.38898-1-kevin.tian@intel.com>
References: <20220921104401.38898-1-kevin.tian@intel.com>
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

Also add a comment to mark that vfio core releases device_set if @init
fails.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 85 ++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 42b344bd7cd5..b16874e913e4 100644
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
@@ -518,35 +509,43 @@ static void vfio_fsl_uninit_device(struct vfio_fsl_mc_device *vdev)
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
-	if (ret)
-		goto out_uninit;
+		ret = vfio_assign_device_set(core_vdev, mc_dev->dev.parent);
 
-	ret = vfio_fsl_mc_init_device(vdev);
 	if (ret)
-		goto out_uninit;
+		return ret;
+
+	/* device_set is released by vfio core if @init fails */
+	return vfio_fsl_mc_init_device(vdev);
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
@@ -557,30 +556,44 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 
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
 
+static void vfio_fsl_mc_release_dev(struct vfio_device *core_vdev)
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
-- 
2.21.3

