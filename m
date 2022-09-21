Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBCE5BF48C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 05:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C6710E806;
	Wed, 21 Sep 2022 03:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8C210E1F9;
 Wed, 21 Sep 2022 03:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663730857; x=1695266857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B6KCuKXzBeZe6OvWGgPHzWOHrAzPHxMmmQYQw0sU8zU=;
 b=HqO1RnoUTqvm4GaBoKc2lRdozmu9mDTlB7yl9uSMY+m/N6vtGEDpGijl
 QHuaqRGLGxGzP5eEj1EXcqZy8Vws0q9eA5vjCxnNiRqUonM1CPGfepZRh
 7vc6bScd095/8+TYXyYle6bCfb1NUgQPsd/ucfiz1Jkq5ArdKshpN6IQf
 pW7VReYjtEBeRs41K8wxnETrTo7NHKGK0Kwnv4QGDG5m40TtT26vYR+1i
 N51TjqA7o5jkzUt5fuiTdORX5ngXwTFSuh7GBoAU3b+bRagBzivmK3Px5
 1TDjTnLwhx3aIuIOZ3Uvbp6oEB7ViAccAftV6JbAK6jM1x6dFTju8TyYV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="279612636"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="279612636"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 20:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="761574371"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2022 20:27:28 -0700
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
Subject: [PATCH v4 09/15] vfio/ap: Use the new device life cycle helpers
Date: Wed, 21 Sep 2022 18:43:55 +0800
Message-Id: <20220921104401.38898-10-kevin.tian@intel.com>
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

and manage available_instances inside @init/@release.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/crypto/vfio_ap_ops.c | 50 ++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 6c8c41fac4e1..161597357a64 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -684,42 +684,44 @@ static bool vfio_ap_mdev_filter_matrix(unsigned long *apm, unsigned long *aqm,
 			     AP_DOMAINS);
 }
 
-static int vfio_ap_mdev_probe(struct mdev_device *mdev)
+static int vfio_ap_mdev_init_dev(struct vfio_device *vdev)
 {
-	struct ap_matrix_mdev *matrix_mdev;
-	int ret;
+	struct ap_matrix_mdev *matrix_mdev =
+		container_of(vdev, struct ap_matrix_mdev, vdev);
 
 	if ((atomic_dec_if_positive(&matrix_dev->available_instances) < 0))
 		return -EPERM;
 
-	matrix_mdev = kzalloc(sizeof(*matrix_mdev), GFP_KERNEL);
-	if (!matrix_mdev) {
-		ret = -ENOMEM;
-		goto err_dec_available;
-	}
-	vfio_init_group_dev(&matrix_mdev->vdev, &mdev->dev,
-			    &vfio_ap_matrix_dev_ops);
-
-	matrix_mdev->mdev = mdev;
+	matrix_mdev->mdev = to_mdev_device(vdev->dev);
 	vfio_ap_matrix_init(&matrix_dev->info, &matrix_mdev->matrix);
 	matrix_mdev->pqap_hook = handle_pqap;
 	vfio_ap_matrix_init(&matrix_dev->info, &matrix_mdev->shadow_apcb);
 	hash_init(matrix_mdev->qtable.queues);
 
+	return 0;
+}
+
+static int vfio_ap_mdev_probe(struct mdev_device *mdev)
+{
+	struct ap_matrix_mdev *matrix_mdev;
+	int ret;
+
+	matrix_mdev = vfio_alloc_device(ap_matrix_mdev, vdev, &mdev->dev,
+					&vfio_ap_matrix_dev_ops);
+	if (IS_ERR(matrix_mdev))
+		return PTR_ERR(matrix_mdev);
+
 	ret = vfio_register_emulated_iommu_dev(&matrix_mdev->vdev);
 	if (ret)
-		goto err_list;
+		goto err_put_vdev;
 	dev_set_drvdata(&mdev->dev, matrix_mdev);
 	mutex_lock(&matrix_dev->mdevs_lock);
 	list_add(&matrix_mdev->node, &matrix_dev->mdev_list);
 	mutex_unlock(&matrix_dev->mdevs_lock);
 	return 0;
 
-err_list:
-	vfio_uninit_group_dev(&matrix_mdev->vdev);
-	kfree(matrix_mdev);
-err_dec_available:
-	atomic_inc(&matrix_dev->available_instances);
+err_put_vdev:
+	vfio_put_device(&matrix_mdev->vdev);
 	return ret;
 }
 
@@ -766,6 +768,12 @@ static void vfio_ap_mdev_unlink_fr_queues(struct ap_matrix_mdev *matrix_mdev)
 	}
 }
 
+static void vfio_ap_mdev_release_dev(struct vfio_device *vdev)
+{
+	atomic_inc(&matrix_dev->available_instances);
+	vfio_free_device(vdev);
+}
+
 static void vfio_ap_mdev_remove(struct mdev_device *mdev)
 {
 	struct ap_matrix_mdev *matrix_mdev = dev_get_drvdata(&mdev->dev);
@@ -779,9 +787,7 @@ static void vfio_ap_mdev_remove(struct mdev_device *mdev)
 	list_del(&matrix_mdev->node);
 	mutex_unlock(&matrix_dev->mdevs_lock);
 	mutex_unlock(&matrix_dev->guests_lock);
-	vfio_uninit_group_dev(&matrix_mdev->vdev);
-	kfree(matrix_mdev);
-	atomic_inc(&matrix_dev->available_instances);
+	vfio_put_device(&matrix_mdev->vdev);
 }
 
 static ssize_t name_show(struct mdev_type *mtype,
@@ -1794,6 +1800,8 @@ static const struct attribute_group vfio_queue_attr_group = {
 };
 
 static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
+	.init = vfio_ap_mdev_init_dev,
+	.release = vfio_ap_mdev_release_dev,
 	.open_device = vfio_ap_mdev_open_device,
 	.close_device = vfio_ap_mdev_close_device,
 	.ioctl = vfio_ap_mdev_ioctl,
-- 
2.21.3

