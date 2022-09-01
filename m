Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD855A8FBA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BAB10E613;
	Thu,  1 Sep 2022 07:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642BC10E613;
 Thu,  1 Sep 2022 07:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662016715; x=1693552715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eaCLetd3P35bUmOh4svxRrc/KVF//VLSz2q4OGmo054=;
 b=PQVjiS1mEneAw2o3H2EKARQO05ZOK4bLPRjErXOpspOqpi+08KBoRlt8
 uGWeEXbboUzzMGWDHumbzG15wcSldIV0oucXfKWY78ErL4UZ9MbllCgrl
 VGjBeAbRXFl6zlBvYNRBlpAGdqmMduUVifiiJn/noRxu8N4DEd4LD+S2O
 jiReh2Iu7VBZMqvfyfFB85anRXigyEaAF1JHPtr+wLLW9XzqC3DCE8X14
 07Z7uKplI3LBG3jMLsYzL/rsNk67h3S30TgzdOQoO91d5hrX4rRbpyyyA
 jLonPF7E7137Jyanxv8+5AyD6IV9AD0iqQDArBURiaQ2LLJIHlwJIRJEX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="278655704"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="278655704"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 00:18:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="673720179"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2022 00:18:18 -0700
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
Subject: [PATCH v2 06/15] vfio/mtty: Use the new device life cycle helpers
Date: Thu,  1 Sep 2022 22:37:38 +0800
Message-Id: <20220901143747.32858-7-kevin.tian@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220901143747.32858-1-kevin.tian@intel.com>
References: <20220901143747.32858-1-kevin.tian@intel.com>
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
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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

