Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DDE5A367B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 11:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC58D10EB0D;
	Sat, 27 Aug 2022 09:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A756310EA42;
 Sat, 27 Aug 2022 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661593805; x=1693129805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pZ2n2dr9aQVhIM3k3w4/+FkGW9/EiD1RXEbKITXctZU=;
 b=gTxjZ871N2koXm6fpH7qJZy5Me6sWl0YFOyX8Bld/vou8Al1nzHKBhHj
 QoXrK169uTCRmFJykDKvfh86MJsZ20/5922Fi5oIIXzysopStMlAiWQpC
 8tINJideSbVgoiA/z8tDotJsAt1TfBUPRTXifgLCljcClvPqHsRy/a9gw
 q0n5OuUNJV5aC0pVu0q2CuZHVXuG6Vy+Xq5O2mNF0BFjMOGre04UIMOih
 CZZFxP8osSlbkckMPwuIEGtcfgIl8ExwiuqzeeNpx9nqcfJLQzN13P0jr
 atGdfbHBwaZB0wxiHE0yZ7e1H6IfnoVThMtnX1Ra+5hTb+mMyeKFy6yx3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="277666362"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="277666362"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 02:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="640353801"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 27 Aug 2022 02:49:55 -0700
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
Subject: [PATCH 02/15] vfio/pci: Use the new device life cycle helpers
Date: Sun, 28 Aug 2022 01:10:24 +0800
Message-Id: <20220827171037.30297-3-kevin.tian@intel.com>
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

Also introduce two pci core helpers as @init/@release for pci drivers:

 - vfio_pci_core_init_dev()
 - vfio_pci_core_release_dev()

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/vfio/pci/vfio_pci.c      | 20 +++++++++---------
 drivers/vfio/pci/vfio_pci_core.c | 35 ++++++++++++++++++++++++++++++++
 include/linux/vfio_pci_core.h    |  2 ++
 3 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 4d1a97415a27..c1223c458615 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -127,6 +127,8 @@ static int vfio_pci_open_device(struct vfio_device *core_vdev)
 
 static const struct vfio_device_ops vfio_pci_ops = {
 	.name		= "vfio-pci",
+	.init		= vfio_pci_core_init_dev,
+	.release	= vfio_pci_core_release_dev,
 	.open_device	= vfio_pci_open_device,
 	.close_device	= vfio_pci_core_close_device,
 	.ioctl		= vfio_pci_core_ioctl,
@@ -146,20 +148,19 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (vfio_pci_is_denylisted(pdev))
 		return -EINVAL;
 
-	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
-	if (!vdev)
-		return -ENOMEM;
-	vfio_pci_core_init_device(vdev, pdev, &vfio_pci_ops);
+	vdev = vfio_alloc_device(vfio_pci_core_device, vdev, &pdev->dev,
+				 &vfio_pci_ops);
+	if (IS_ERR(vdev))
+		return PTR_ERR(vdev);
 
 	dev_set_drvdata(&pdev->dev, vdev);
 	ret = vfio_pci_core_register_device(vdev);
 	if (ret)
-		goto out_free;
+		goto out_put_vdev;
 	return 0;
 
-out_free:
-	vfio_pci_core_uninit_device(vdev);
-	kfree(vdev);
+out_put_vdev:
+	vfio_put_device(&vdev->vdev);
 	return ret;
 }
 
@@ -168,8 +169,7 @@ static void vfio_pci_remove(struct pci_dev *pdev)
 	struct vfio_pci_core_device *vdev = dev_get_drvdata(&pdev->dev);
 
 	vfio_pci_core_unregister_device(vdev);
-	vfio_pci_core_uninit_device(vdev);
-	kfree(vdev);
+	vfio_put_device(&vdev->vdev);
 }
 
 static int vfio_pci_sriov_configure(struct pci_dev *pdev, int nr_virtfn)
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index c8d3b0450fb3..708b61d1b364 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1825,6 +1825,41 @@ static void vfio_pci_vga_uninit(struct vfio_pci_core_device *vdev)
 					      VGA_RSRC_LEGACY_MEM);
 }
 
+int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
+{
+	struct vfio_pci_core_device *vdev =
+		container_of(core_vdev, struct vfio_pci_core_device, vdev);
+
+	vdev->pdev = to_pci_dev(core_vdev->dev);
+	vdev->irq_type = VFIO_PCI_NUM_IRQS;
+	mutex_init(&vdev->igate);
+	spin_lock_init(&vdev->irqlock);
+	mutex_init(&vdev->ioeventfds_lock);
+	INIT_LIST_HEAD(&vdev->dummy_resources_list);
+	INIT_LIST_HEAD(&vdev->ioeventfds_list);
+	mutex_init(&vdev->vma_lock);
+	INIT_LIST_HEAD(&vdev->vma_list);
+	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
+	init_rwsem(&vdev->memory_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vfio_pci_core_init_dev);
+
+void vfio_pci_core_release_dev(struct vfio_device *core_vdev)
+{
+	struct vfio_pci_core_device *vdev =
+		container_of(core_vdev, struct vfio_pci_core_device, vdev);
+
+	mutex_destroy(&vdev->igate);
+	mutex_destroy(&vdev->ioeventfds_lock);
+	mutex_destroy(&vdev->vma_lock);
+	kfree(vdev->region);
+	kfree(vdev->pm_save);
+	vfio_free_device(core_vdev);
+}
+EXPORT_SYMBOL_GPL(vfio_pci_core_release_dev);
+
 void vfio_pci_core_init_device(struct vfio_pci_core_device *vdev,
 			       struct pci_dev *pdev,
 			       const struct vfio_device_ops *vfio_pci_ops)
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index 5579ece4347b..98c8c66e2400 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -233,6 +233,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev);
 void vfio_pci_core_init_device(struct vfio_pci_core_device *vdev,
 			       struct pci_dev *pdev,
 			       const struct vfio_device_ops *vfio_pci_ops);
+int vfio_pci_core_init_dev(struct vfio_device *core_vdev);
+void vfio_pci_core_release_dev(struct vfio_device *core_vdev);
 int vfio_pci_core_register_device(struct vfio_pci_core_device *vdev);
 void vfio_pci_core_uninit_device(struct vfio_pci_core_device *vdev);
 void vfio_pci_core_unregister_device(struct vfio_pci_core_device *vdev);
-- 
2.21.3

