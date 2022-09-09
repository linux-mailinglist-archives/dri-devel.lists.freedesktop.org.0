Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF315B2C75
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 05:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1961A10EA31;
	Fri,  9 Sep 2022 03:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CDA10E2EE;
 Fri,  9 Sep 2022 03:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662692703; x=1694228703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+yssjGnk2Zp3MQF/9zrQ2m7m/7YA8Wye4MlvVDEJ0Mk=;
 b=Gha9aL4LXuMdiVX5vfE46y+O8fbZiIyi+fx8FkOGTS1LUIfoaC+7hCmV
 OEECZWrgMKZZZ1rVW3qrLEtJDeERcITmJ+R62aJmjONzum7ZA92jcA58o
 dKWTRYaDdu2JyVlIi6QlWcjTZjjAdCh5isCZ1uhVXBXibOwvHX6x9o3q7
 boEc1n4pA5JZ7a53go2XjWQwQs/e8BZiP3z/mfNJqSSprPyGrZdrLOIEC
 hbcDs4v7OdRB3Pg18l1qLb50Ngl6CVbPNY+gVdLz86+0oarqFhf9VtQ1E
 X9u53XX1by+Hcwb6nJ+OnjKoDXgLTNrxyJ6Rj7MB68MU+HtdYY9IBkLHo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="280409963"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="280409963"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 20:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740908636"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 20:03:54 -0700
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
Subject: [PATCH v3 03/15] vfio/mlx5: Use the new device life cycle helpers
Date: Fri,  9 Sep 2022 18:22:35 +0800
Message-Id: <20220909102247.67324-4-kevin.tian@intel.com>
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

mlx5 has its own @init/@release for handling migration cap.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/mlx5/main.c | 50 ++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/vfio/pci/mlx5/main.c b/drivers/vfio/pci/mlx5/main.c
index 759a5f5f7b3f..fd6ccb8454a2 100644
--- a/drivers/vfio/pci/mlx5/main.c
+++ b/drivers/vfio/pci/mlx5/main.c
@@ -585,8 +585,35 @@ static const struct vfio_log_ops mlx5vf_pci_log_ops = {
 	.log_read_and_clear = mlx5vf_tracker_read_and_clear,
 };
 
+static int mlx5vf_pci_init_dev(struct vfio_device *core_vdev)
+{
+	struct mlx5vf_pci_core_device *mvdev = container_of(core_vdev,
+			struct mlx5vf_pci_core_device, core_device.vdev);
+	int ret;
+
+	ret = vfio_pci_core_init_dev(core_vdev);
+	if (ret)
+		return ret;
+
+	mlx5vf_cmd_set_migratable(mvdev, &mlx5vf_pci_mig_ops,
+				  &mlx5vf_pci_log_ops);
+
+	return 0;
+}
+
+static void mlx5vf_pci_release_dev(struct vfio_device *core_vdev)
+{
+	struct mlx5vf_pci_core_device *mvdev = container_of(core_vdev,
+			struct mlx5vf_pci_core_device, core_device.vdev);
+
+	mlx5vf_cmd_remove_migratable(mvdev);
+	vfio_pci_core_release_dev(core_vdev);
+}
+
 static const struct vfio_device_ops mlx5vf_pci_ops = {
 	.name = "mlx5-vfio-pci",
+	.init = mlx5vf_pci_init_dev,
+	.release = mlx5vf_pci_release_dev,
 	.open_device = mlx5vf_pci_open_device,
 	.close_device = mlx5vf_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
@@ -604,22 +631,19 @@ static int mlx5vf_pci_probe(struct pci_dev *pdev,
 	struct mlx5vf_pci_core_device *mvdev;
 	int ret;
 
-	mvdev = kzalloc(sizeof(*mvdev), GFP_KERNEL);
-	if (!mvdev)
-		return -ENOMEM;
-	vfio_pci_core_init_device(&mvdev->core_device, pdev, &mlx5vf_pci_ops);
-	mlx5vf_cmd_set_migratable(mvdev, &mlx5vf_pci_mig_ops,
-				  &mlx5vf_pci_log_ops);
+	mvdev = vfio_alloc_device(mlx5vf_pci_core_device, core_device.vdev,
+				  &pdev->dev, &mlx5vf_pci_ops);
+	if (IS_ERR(mvdev))
+		return PTR_ERR(mvdev);
+
 	dev_set_drvdata(&pdev->dev, &mvdev->core_device);
 	ret = vfio_pci_core_register_device(&mvdev->core_device);
 	if (ret)
-		goto out_free;
+		goto out_put_vdev;
 	return 0;
 
-out_free:
-	mlx5vf_cmd_remove_migratable(mvdev);
-	vfio_pci_core_uninit_device(&mvdev->core_device);
-	kfree(mvdev);
+out_put_vdev:
+	vfio_put_device(&mvdev->core_device.vdev);
 	return ret;
 }
 
@@ -628,9 +652,7 @@ static void mlx5vf_pci_remove(struct pci_dev *pdev)
 	struct mlx5vf_pci_core_device *mvdev = mlx5vf_drvdata(pdev);
 
 	vfio_pci_core_unregister_device(&mvdev->core_device);
-	mlx5vf_cmd_remove_migratable(mvdev);
-	vfio_pci_core_uninit_device(&mvdev->core_device);
-	kfree(mvdev);
+	vfio_put_device(&mvdev->core_device.vdev);
 }
 
 static const struct pci_device_id mlx5vf_pci_table[] = {
-- 
2.21.3

