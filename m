Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEA85A368A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 11:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A32310EBC6;
	Sat, 27 Aug 2022 09:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1A310EBC9;
 Sat, 27 Aug 2022 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661593840; x=1693129840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RFiDvWq8VKfBS7PjqJZ6ZCNvrU9X/j1iQrG4Gq1OtTA=;
 b=PI4eAe28l1nBrIAcAvX21Ymbe9uDniV3qGCd43Ee7+owUh3obXyhzEej
 VKa7zCvwQHhNI4SQmq/6dtJe1laEYxvcKjfBb7jQ1yVJByexj2NFFPW97
 7JMqL/MzDobsxUZ+8KBa6eSuqI2UXu2jD1oUx2CTSm+DDlVv4trqM+Nrk
 TAM6eLs7Qg8KUQUdZPJ8e859wASDbBlOZtOLwqubkm8YtNSbN3G2Kz1TB
 zQ17f/LSLuJqMw9NThMdMIS2Amfhv1yYP9vTlQLvcsE4iShc+N9eG92ft
 TaZUSdVRh4HnHwXGyGz7o4XV1gPk/x4d0zvwsKhxUEML3C0zhjprTvLwf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="274401790"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="274401790"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 02:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="640353890"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 27 Aug 2022 02:50:30 -0700
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
Subject: [PATCH 06/15] vfio/mtty: Use the new device life cycle helpers
Date: Sun, 28 Aug 2022 01:10:28 +0800
Message-Id: <20220827171037.30297-7-kevin.tian@intel.com>
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

and manage available ports inside @init/@release.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
---
 samples/vfio-mdev/mtty.c | 67 +++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 28 deletions(-)

diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index f42a59ed2e3f..41301d50b247 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -703,9 +703,11 @@ static ssize_t mdev_access(struct mdev_state *mdev_state, u8 *buf, size_t count,
 	return ret;
 }
 
-static int mtty_probe(struct mdev_device *mdev)
+static int mtty_init_dev(struct vfio_device *vdev)
 {
-	struct mdev_state *mdev_state;
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+	struct mdev_device *mdev = to_mdev_device(vdev->dev);
 	int nr_ports = mdev_get_type_group_id(mdev) + 1;
 	int avail_ports = atomic_read(&mdev_avail_ports);
 	int ret;
@@ -716,58 +718,65 @@ static int mtty_probe(struct mdev_device *mdev)
 	} while (!atomic_try_cmpxchg(&mdev_avail_ports,
 				     &avail_ports, avail_ports - nr_ports));
 
-	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
-	if (mdev_state == NULL) {
-		ret = -ENOMEM;
-		goto err_nr_ports;
-	}
-
-	vfio_init_group_dev(&mdev_state->vdev, &mdev->dev, &mtty_dev_ops);
-
 	mdev_state->nr_ports = nr_ports;
 	mdev_state->irq_index = -1;
 	mdev_state->s[0].max_fifo_size = MAX_FIFO_SIZE;
 	mdev_state->s[1].max_fifo_size = MAX_FIFO_SIZE;
 	mutex_init(&mdev_state->rxtx_lock);
-	mdev_state->vconfig = kzalloc(MTTY_CONFIG_SPACE_SIZE, GFP_KERNEL);
 
-	if (mdev_state->vconfig == NULL) {
+	mdev_state->vconfig = kzalloc(MTTY_CONFIG_SPACE_SIZE, GFP_KERNEL);
+	if (!mdev_state->vconfig) {
 		ret = -ENOMEM;
-		goto err_state;
+		goto err_nr_ports;
 	}
 
 	mutex_init(&mdev_state->ops_lock);
 	mdev_state->mdev = mdev;
-
 	mtty_create_config_space(mdev_state);
+	return 0;
+
+err_nr_ports:
+	atomic_add(nr_ports, &mdev_avail_ports);
+	return ret;
+}
+
+static int mtty_probe(struct mdev_device *mdev)
+{
+	struct mdev_state *mdev_state;
+	int ret;
+
+	mdev_state = vfio_alloc_device(mdev_state, vdev, &mdev->dev,
+				       &mtty_dev_ops);
+	if (IS_ERR(mdev_state))
+		return PTR_ERR(mdev_state);
 
 	ret = vfio_register_emulated_iommu_dev(&mdev_state->vdev);
 	if (ret)
-		goto err_vconfig;
+		goto err_put_vdev;
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
 
-err_vconfig:
-	kfree(mdev_state->vconfig);
-err_state:
-	vfio_uninit_group_dev(&mdev_state->vdev);
-	kfree(mdev_state);
-err_nr_ports:
-	atomic_add(nr_ports, &mdev_avail_ports);
+err_put_vdev:
+	vfio_put_device(&mdev_state->vdev);
 	return ret;
 }
 
+static void mtty_release_dev(struct vfio_device *vdev)
+{
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+
+	kfree(mdev_state->vconfig);
+	vfio_free_device(vdev);
+	atomic_add(mdev_state->nr_ports, &mdev_avail_ports);
+}
+
 static void mtty_remove(struct mdev_device *mdev)
 {
 	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
-	int nr_ports = mdev_state->nr_ports;
 
 	vfio_unregister_group_dev(&mdev_state->vdev);
-
-	kfree(mdev_state->vconfig);
-	vfio_uninit_group_dev(&mdev_state->vdev);
-	kfree(mdev_state);
-	atomic_add(nr_ports, &mdev_avail_ports);
+	vfio_put_device(&mdev_state->vdev);
 }
 
 static int mtty_reset(struct mdev_state *mdev_state)
@@ -1287,6 +1296,8 @@ static struct attribute_group *mdev_type_groups[] = {
 
 static const struct vfio_device_ops mtty_dev_ops = {
 	.name = "vfio-mtty",
+	.init = mtty_init_dev,
+	.release = mtty_release_dev,
 	.read = mtty_read,
 	.write = mtty_write,
 	.ioctl = mtty_ioctl,
-- 
2.21.3

