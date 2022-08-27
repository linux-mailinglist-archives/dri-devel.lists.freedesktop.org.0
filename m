Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE5B5A3689
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 11:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247EB10EBAC;
	Sat, 27 Aug 2022 09:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8634A10EB0E;
 Sat, 27 Aug 2022 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661593831; x=1693129831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qvPOaqGgZaHDEugiMOpjQQzg+bfunscn94ERCaYHXtA=;
 b=CtIYKNL3GiGP5ao2HmJvpZP80Dr7Gjtl5ojnKMnY27JrWupHq1ZEkxqe
 YzYAwsDwVtwnu0ppBl6uF7sPGXA0CVLMAnQcCXMD8auBEAGWK8fOV8uyO
 47pIfbhUmb5ZqFZVDfTnG7h5OGCEX81ZgAUAR3Snj3JD60L4f4cOD+2E3
 8tlEyHgcVYHyQ9lZf+IQw1xYnnplToripxrcTY7Z1hQ8h8GOieOMNpeN8
 wxOFRJqNN1lWLpUYmsoDxhGlJgGebLJrMIWBAAwsfWwngmprZ22p1TOYJ
 KF2d/V9gr/iUqzHIjqU2iNJwwNQBBP/ljaRSSHnCKq+EDKwSK63Z/arxa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="380954432"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="380954432"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 02:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="640353869"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 27 Aug 2022 02:50:22 -0700
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
Subject: [PATCH 05/15] vfio/mdpy: Use the new device life cycle helpers
Date: Sun, 28 Aug 2022 01:10:27 +0800
Message-Id: <20220827171037.30297-6-kevin.tian@intel.com>
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

and manage mdpy_count inside @init/@release.

Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
---
 samples/vfio-mdev/mdpy.c | 81 +++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 34 deletions(-)

diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index e8c46eb2e246..a07dac16d873 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -216,61 +216,77 @@ static int mdpy_reset(struct mdev_state *mdev_state)
 	return 0;
 }
 
-static int mdpy_probe(struct mdev_device *mdev)
+static int mdpy_init_dev(struct vfio_device *vdev)
 {
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+	struct mdev_device *mdev = to_mdev_device(vdev->dev);
 	const struct mdpy_type *type =
 		&mdpy_types[mdev_get_type_group_id(mdev)];
-	struct device *dev = mdev_dev(mdev);
-	struct mdev_state *mdev_state;
 	u32 fbsize;
-	int ret;
+	int ret = -ENOMEM;
 
 	if (mdpy_count >= max_devices)
-		return -ENOMEM;
-
-	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
-	if (mdev_state == NULL)
-		return -ENOMEM;
-	vfio_init_group_dev(&mdev_state->vdev, &mdev->dev, &mdpy_dev_ops);
+		return ret;
 
 	mdev_state->vconfig = kzalloc(MDPY_CONFIG_SPACE_SIZE, GFP_KERNEL);
-	if (mdev_state->vconfig == NULL) {
-		ret = -ENOMEM;
-		goto err_state;
-	}
+	if (!mdev_state->vconfig)
+		return ret;
 
 	fbsize = roundup_pow_of_two(type->width * type->height * type->bytepp);
 
 	mdev_state->memblk = vmalloc_user(fbsize);
-	if (!mdev_state->memblk) {
-		ret = -ENOMEM;
-		goto err_vconfig;
-	}
-	dev_info(dev, "%s: %s (%dx%d)\n", __func__, type->name, type->width,
-		 type->height);
+	if (!mdev_state->memblk)
+		goto out_vconfig;
 
 	mutex_init(&mdev_state->ops_lock);
 	mdev_state->mdev = mdev;
-	mdev_state->type    = type;
+	mdev_state->type = type;
 	mdev_state->memsize = fbsize;
 	mdpy_create_config_space(mdev_state);
 	mdpy_reset(mdev_state);
 
+	dev_info(vdev->dev, "%s: %s (%dx%d)\n", __func__, type->name, type->width,
+		 type->height);
+
 	mdpy_count++;
+	return 0;
+
+out_vconfig:
+	kfree(mdev_state->vconfig);
+	return ret;
+}
+
+static int mdpy_probe(struct mdev_device *mdev)
+{
+	struct mdev_state *mdev_state;
+	int ret;
+
+	mdev_state = vfio_alloc_device(mdev_state, vdev, &mdev->dev,
+				       &mdpy_dev_ops);
+	if (IS_ERR(mdev_state))
+		return PTR_ERR(mdev_state);
 
 	ret = vfio_register_emulated_iommu_dev(&mdev_state->vdev);
 	if (ret)
-		goto err_mem;
+		goto err_put_vdev;
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
-err_mem:
+
+err_put_vdev:
+	vfio_put_device(&mdev_state->vdev);
+	return ret;
+}
+
+static void mdpy_release_dev(struct vfio_device *vdev)
+{
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+
 	vfree(mdev_state->memblk);
-err_vconfig:
 	kfree(mdev_state->vconfig);
-err_state:
-	vfio_uninit_group_dev(&mdev_state->vdev);
-	kfree(mdev_state);
-	return ret;
+	vfio_free_device(vdev);
+	mdpy_count--;
 }
 
 static void mdpy_remove(struct mdev_device *mdev)
@@ -280,12 +296,7 @@ static void mdpy_remove(struct mdev_device *mdev)
 	dev_info(&mdev->dev, "%s\n", __func__);
 
 	vfio_unregister_group_dev(&mdev_state->vdev);
-	vfree(mdev_state->memblk);
-	kfree(mdev_state->vconfig);
-	vfio_uninit_group_dev(&mdev_state->vdev);
-	kfree(mdev_state);
-
-	mdpy_count--;
+	vfio_put_device(&mdev_state->vdev);
 }
 
 static ssize_t mdpy_read(struct vfio_device *vdev, char __user *buf,
@@ -708,6 +719,8 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mdpy_dev_ops = {
+	.init = mdpy_init_dev,
+	.release = mdpy_release_dev,
 	.read = mdpy_read,
 	.write = mdpy_write,
 	.ioctl = mdpy_ioctl,
-- 
2.21.3

