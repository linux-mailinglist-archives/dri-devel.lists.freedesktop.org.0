Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755025B2C7F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 05:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EE810EA3E;
	Fri,  9 Sep 2022 03:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0669510EA26;
 Fri,  9 Sep 2022 03:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662692710; x=1694228710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZjHKIhNQ5crLbCocdtut4IalrADZup4adNWcaf5dXk=;
 b=WrnjoThTRgEXRhBVVcDJ33ElKehNTQIRBMoo1WDDUrhNGETQq1jYJJWg
 xp4jvPUW0lsvXIesGfr2thZoZSszkR6uuxtebK+ndwHB6krZnfjFyazSt
 QXyjz0uty/ywM5mjTD3WfYWPCRfWiSm/xo8jrOMr+WeEvJwaoe1bI05wy
 KocNx2/jTGE9AdlRSIiuvzJrVCo5f1BQA6LF28B8qLquWYTBzHuUlwBNJ
 QBZCyr5CPPrjW+Z/hJ2FX11Cg8DXRfm9E4R9mT1DoZQCsCVL4wFgpI57c
 yQ0OvM917C05OZFC/zX14aUI7qMtdPfiAXeGtgSHndRxy1Ow4m/jAq+xB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294963251"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="294963251"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 20:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740909210"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 20:04:59 -0700
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
Subject: [PATCH v3 10/15] vfio/fsl-mc: Use the new device life cycle helpers
Date: Fri,  9 Sep 2022 18:22:42 +0800
Message-Id: <20220909102247.67324-11-kevin.tian@intel.com>
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

