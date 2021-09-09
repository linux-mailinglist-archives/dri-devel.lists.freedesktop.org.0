Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800BB405D86
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D08C6E908;
	Thu,  9 Sep 2021 19:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E456E90A;
 Thu,  9 Sep 2021 19:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHViGpAFKyXh1sLTZDhsmELznC410A6yu2qVTBl/tpsV7j/JbzdVU2sxchLiAd0KzJpv/GbecnV3UYt31bimLDs4pAMFnbmZsUcOPXcSx3d1IhW0ufivjyTpAPWUgWeT1P/ScA+a/FESUh3iQYPiA+y2f/tt8lz37jGFe2/iaXcL0nK7/Fh3Lg78NC++mEtwKRyLdakLY5OGvsmvlw/3CirTgeptgo+tWcG774dBjA8QD9R/y61nsDWH2SNiDbvGNgy1MoSw7ZMU1P5ADBi92Kxr8IqPp0Z4qmNceSqoKtoO34cLj99Mzc2lMflO47dr2kOYIA1H5jZdBbyezY8+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=vLOFRwrfk6C+B7LsVn1Yr+1OfPjT1Qei/N+YURqHE4Y=;
 b=HZ3PymjZclt/fViGKtRc+WQaMRfbl5BvQCGAc90FTLm1Z1BlI7eZuIbwSs19Eri6yu5URoo3xamMB5zd/u6+6i5ZuSgyYEo/XQk1tapFKCC8D9ZtETokbbIpWXId+VgnPVzL3q3X+ryQgOQ4bAfieXg0v50K1oWcQUGd0HD3Dwro9+tTX+tzUZgwS+hScOzXIukk3khz9Ujcg+BboPN3HCuK1W0HcZkgTNKyvGFCvnE4YlsKkVQhofnUBtI5HuvJYQN66BOG7hVCpIyFca1dOVMjfEMtmDy9iiIvjJVZgJ6t8cs/YYKHmhzbyJHvzOpfI1wU/RUIsahe/WkJk8PELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLOFRwrfk6C+B7LsVn1Yr+1OfPjT1Qei/N+YURqHE4Y=;
 b=MMNPVpYrkAkBKw5JsX1qzrufneBWTsfENPrS5x1LDPDJtDlzdcNmfbzVe/HvRpROxUozWb2aZBjlhGhMVwZim7xvFFIuORbBlmDQxQtdUPPL+laC33JiWDmVS8TGEqkK4MD7SyLjnQTOL1+6ydnooyC+SPcLRng2a2LIkN0T4Qc5gJRBaqtDqnLGLuKfLqQ+EPkwzuog2uTcUh2CkDs6myYIZWS1Mz0dThubfOymw9AUIOMzVi1AFHMM2f9zqYqBTRX8FQpD2phkuqppPEmAAVxKaFQcEsQ4MZaeF/1YsURMHRKFU1+EnuFrcniMCOw+YdIcHLHdQ/EnxvXj10gWzw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5507.namprd12.prod.outlook.com (2603:10b6:208:1c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 19:38:53 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 19:38:53 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 6/9] vfio/mdev: Add mdev available instance checking to the
 core
Date: Thu,  9 Sep 2021 16:38:46 -0300
Message-Id: <6-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0035.prod.exchangelabs.com
 (2603:10b6:207:18::48) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR0102CA0035.prod.exchangelabs.com (2603:10b6:207:18::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 19:38:51 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLF6-MB; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e500e94-74cc-441f-da18-08d973c97384
X-MS-TrafficTypeDiagnostic: BL0PR12MB5507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5507FB49F5BDCA605DF90152C2D59@BL0PR12MB5507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ITzcgDIMzSxHcID0+TD4hMWAHZfYCnbcBMe2Im2f2JxyUkdkJkgJio2k7LNBHBLyLlTEwrG3wNvN9B6jV2PFKhqcIVR1Hypvy8QaTPRpLtwluE+fiBwp64d3RGrNSdKbAUhTme8k2UjrDEc/vjsBR1b3X8Nics1ZMw1s4VB8zziLF3rXsNNzxNUMONrCWUIx52fugifSxwiblTUOeTukZa2XxSUIjxohkaYL4EQEalK+5HFaWHbT9W7ArquToiQ6gSHMPSJu6cSzLRu6KSlgs06ty0zIeLica2eF/yVdITxN05q5My/HoIKP9ptQ+gyLw6XY4bFR1OeLruAzqtPZdiU3OBT/rwT1BzU/WKJ66opsBvVkvxmLBbnF38yfbo54xFUu5nGZA9ZYIg7ziA4CQoVmpzgdZ7mjUgDGyUaUrPy1dhzkHnmgKONeI+BsvKAzz01+vJ2dtMojMfONejTda8jSUxL55GeIAweADoiEe7P6pQ9xRJkx14NdEjduehRmkMoS7Ul8uSvUg2Um35dZ1fTDVIeErDY6+kPCm5Zx19SocZ+VxqFRomOt1ZdS0oBaQypmuD92lacuIvaoF1gSZH4FHKD9M4X2bRUiIsTApUqv3udFZPQWKIP+J5Y2cGTHBAe54kjJOxkQmkL0WdCmhb1w0jdmFRI1CR2u8StjBwxW23AXjpKbohsjCn5zGZw1TwGUo61GhvG1ENxyeiKO1F6aVaRWOrJDmQ2+MacKrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(8676002)(66476007)(478600001)(4326008)(66946007)(66556008)(30864003)(8936002)(921005)(5660300002)(186003)(26005)(86362001)(83380400001)(7416002)(2906002)(36756003)(426003)(2616005)(9746002)(9786002)(110136005)(6666004)(38100700002)(316002)(131093003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pGawlb7jU2Mkp3c2yrC2FwmEmc+t9vhFHqNiYBAI8lAm34wZZrabIwEvYfb18IslMqdncdDGZoTgk+r0jB12BTbT67xSX0eJKgdNUEZdkKqUR3dfbjPNVU3y3KmRslqTbHyS0mTeZO38vNzslaBJzyfUq2eQ6kY/Uf4Srgkys/hEjAxUjHOXhAJVDJWlkMfYjzvOPP6B3kD8JSCtskE/ipkHziRFqe/wQZDyxrTFuzWel3TRLwTxHAte+j599TuVxY0GkV8WVzWjVrV1npl/bSGGvSdzENySBqjayMx+7xAH6mB/3DmVTvS9T60zLhXuic3Q9WjguN57wLcwd9sPEytT7k3/ka+olb9nuARrtI7eDO8XVFUzVsjYBhx3CtpUvGZOcsBZZVyYG89EPUucFRQZqskAcr2JiorbVSg6cpd9L5aqq8fcZeWLHQ00E3k/7cDybSyl/dBm1JlJnjB4cj3+6cKGz6ABzxPS3eS07r790iaTN8vs2IQSK24Y9wrS8L/EEntIOvaxKCXTanVk+OiYStMtmrppP5y3WjfXR0ZlCHUSKd/hNo5Sez4c0wECQFqIbV8MxMmmnVgnYwSWl5rauC+D3CTSXXdtKq3w/VEJoiwhRj/Y0/XYcCnk4aGdPEy6fiGAyU+PUox0idKkFQuebdt/UM+3D5bO8oI3mzQw/ZJ/TLiECXic3BOSK7J/h/M18K2ZFBQ0/SONdFplt5u8ygsW7yNZk5haI7WMihiTbnmGEKC540FeyeY17G/o
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e500e94-74cc-441f-da18-08d973c97384
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:51.7026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJESOLhksMfQNHk0Y3HrITH0b/rIZibKzoqU3xDKpXJBI3vNX3JJNhXgW5xr8yAW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5507
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many of the mdev drivers use a simple counter for keeping track of the
available instances. Move this code to the core code and store the counter
in the mdev_type. Implement it using correct locking, fixing mdpy.

Drivers provide a get_available() callback to set the number of available
instances for their mtypes which is fixed at registration time. The core
provides a standard sysfs attribute to return the available_instances.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c       |  1 -
 drivers/s390/cio/vfio_ccw_ops.c       | 26 ++++++-------------
 drivers/s390/cio/vfio_ccw_private.h   |  2 --
 drivers/s390/crypto/vfio_ap_ops.c     | 32 ++++++-----------------
 drivers/s390/crypto/vfio_ap_private.h |  2 --
 drivers/vfio/mdev/mdev_core.c         | 11 +++++++-
 drivers/vfio/mdev/mdev_private.h      |  2 ++
 drivers/vfio/mdev/mdev_sysfs.c        | 37 +++++++++++++++++++++++++++
 include/linux/mdev.h                  |  2 ++
 samples/vfio-mdev/mdpy.c              | 22 +++++-----------
 10 files changed, 73 insertions(+), 64 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 99f2823361718f..de782e967a5474 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -106,7 +106,6 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 	INIT_LIST_HEAD(&private->crw);
 	INIT_WORK(&private->io_work, vfio_ccw_sch_io_todo);
 	INIT_WORK(&private->crw_work, vfio_ccw_crw_todo);
-	atomic_set(&private->avail, 1);
 
 	private->cp.guest_cp = kcalloc(CCWCHAIN_LEN_MAX, sizeof(struct ccw1),
 				       GFP_KERNEL);
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 18a48d1f1e8fff..38ab5c1f25ec09 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -70,20 +70,9 @@ static ssize_t name_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t available_instances_show(struct mdev_type *mtype,
-					struct mdev_type_attribute *attr,
-					char *buf)
-{
-	struct vfio_ccw_private *private =
-		dev_get_drvdata(mtype_get_parent_dev(mtype));
-
-	return sprintf(buf, "%d\n", atomic_read(&private->avail));
-}
-static MDEV_TYPE_ATTR_RO(available_instances);
 
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
 
@@ -102,9 +91,6 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
 	int ret;
 
-	if (atomic_dec_if_positive(&private->avail) < 0)
-		return -EPERM;
-
 	memset(&private->vdev, 0, sizeof(private->vdev));
 	vfio_init_group_dev(&private->vdev, &mdev->dev,
 			    &vfio_ccw_dev_ops);
@@ -118,13 +104,12 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 
 	ret = vfio_register_group_dev(&private->vdev);
 	if (ret)
-		goto err_atomic;
+		goto err_init;
 	dev_set_drvdata(&mdev->dev, private);
 	return 0;
 
-err_atomic:
+err_init:
 	vfio_uninit_group_dev(&private->vdev);
-	atomic_inc(&private->avail);
 	private->mdev = NULL;
 	return ret;
 }
@@ -141,7 +126,6 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 	vfio_unregister_group_dev(&private->vdev);
 	vfio_uninit_group_dev(&private->vdev);
 	private->mdev = NULL;
-	atomic_inc(&private->avail);
 }
 
 static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
@@ -610,6 +594,11 @@ static void vfio_ccw_mdev_request(struct vfio_device *vdev, unsigned int count)
 	}
 }
 
+static unsigned int vfio_ccw_get_available(struct mdev_type *mtype)
+{
+	return 1;
+}
+
 static const struct vfio_device_ops vfio_ccw_dev_ops = {
 	.open_device = vfio_ccw_mdev_open_device,
 	.close_device = vfio_ccw_mdev_close_device,
@@ -627,6 +616,7 @@ struct mdev_driver vfio_ccw_mdev_driver = {
 	},
 	.probe = vfio_ccw_mdev_probe,
 	.remove = vfio_ccw_mdev_remove,
+	.get_available = vfio_ccw_get_available,
 };
 
 static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index 5e98eacdf31074..bbc97eb9d9c6fc 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -72,7 +72,6 @@ struct vfio_ccw_crw {
  * @sch: pointer to the subchannel
  * @state: internal state of the device
  * @completion: synchronization helper of the I/O completion
- * @avail: available for creating a mediated device
  * @mdev: pointer to the mediated device
  * @nb: notifier for vfio events
  * @io_region: MMIO region to input/output I/O arguments/results
@@ -96,7 +95,6 @@ struct vfio_ccw_private {
 	struct subchannel	*sch;
 	int			state;
 	struct completion	*completion;
-	atomic_t		avail;
 	struct mdev_device	*mdev;
 	struct notifier_block	nb;
 	struct ccw_io_region	*io_region;
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 005c2a2b14af3f..737e8d137bd43b 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -332,14 +332,9 @@ static int vfio_ap_mdev_probe(struct mdev_device *mdev)
 	struct ap_matrix_mdev *matrix_mdev;
 	int ret;
 
-	if ((atomic_dec_if_positive(&matrix_dev->available_instances) < 0))
-		return -EPERM;
-
 	matrix_mdev = kzalloc(sizeof(*matrix_mdev), GFP_KERNEL);
-	if (!matrix_mdev) {
-		ret = -ENOMEM;
-		goto err_dec_available;
-	}
+	if (!matrix_mdev)
+		return -ENOMEM;
 	vfio_init_group_dev(&matrix_mdev->vdev, &mdev->dev,
 			    &vfio_ap_matrix_dev_ops);
 
@@ -362,8 +357,6 @@ static int vfio_ap_mdev_probe(struct mdev_device *mdev)
 	mutex_unlock(&matrix_dev->lock);
 	vfio_uninit_group_dev(&matrix_mdev->vdev);
 	kfree(matrix_mdev);
-err_dec_available:
-	atomic_inc(&matrix_dev->available_instances);
 	return ret;
 }
 
@@ -378,7 +371,6 @@ static void vfio_ap_mdev_remove(struct mdev_device *mdev)
 	list_del(&matrix_mdev->node);
 	vfio_uninit_group_dev(&matrix_mdev->vdev);
 	kfree(matrix_mdev);
-	atomic_inc(&matrix_dev->available_instances);
 	mutex_unlock(&matrix_dev->lock);
 }
 
@@ -390,20 +382,8 @@ static ssize_t name_show(struct mdev_type *mtype,
 
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t available_instances_show(struct mdev_type *mtype,
-					struct mdev_type_attribute *attr,
-					char *buf)
-{
-	return sprintf(buf, "%d\n",
-		       atomic_read(&matrix_dev->available_instances));
-}
-
-static MDEV_TYPE_ATTR_RO(available_instances);
-
-
 static struct attribute *vfio_ap_mdev_type_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
 
@@ -1371,6 +1351,11 @@ static ssize_t vfio_ap_mdev_ioctl(struct vfio_device *vdev,
 	return ret;
 }
 
+static unsigned int vfio_ap_mdev_get_available(struct mdev_type *mtype)
+{
+	return MAX_ZDEV_ENTRIES_EXT;
+}
+
 static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
 	.open_device = vfio_ap_mdev_open_device,
 	.close_device = vfio_ap_mdev_close_device,
@@ -1386,6 +1371,7 @@ static struct mdev_driver vfio_ap_matrix_driver = {
 	},
 	.probe = vfio_ap_mdev_probe,
 	.remove = vfio_ap_mdev_remove,
+	.get_available = vfio_ap_mdev_get_available,
 };
 
 static const struct mdev_parent_ops vfio_ap_matrix_ops = {
@@ -1399,8 +1385,6 @@ int vfio_ap_mdev_register(void)
 {
 	int ret;
 
-	atomic_set(&matrix_dev->available_instances, MAX_ZDEV_ENTRIES_EXT);
-
 	ret = mdev_register_driver(&vfio_ap_matrix_driver);
 	if (ret)
 		return ret;
diff --git a/drivers/s390/crypto/vfio_ap_private.h b/drivers/s390/crypto/vfio_ap_private.h
index 77760e2b546fe6..dd87c84605bcb6 100644
--- a/drivers/s390/crypto/vfio_ap_private.h
+++ b/drivers/s390/crypto/vfio_ap_private.h
@@ -28,7 +28,6 @@
 /**
  * ap_matrix_dev - the AP matrix device structure
  * @device:	generic device structure associated with the AP matrix device
- * @available_instances: number of mediated matrix devices that can be created
  * @info:	the struct containing the output from the PQAP(QCI) instruction
  * mdev_list:	the list of mediated matrix devices created
  * lock:	mutex for locking the AP matrix device. This lock will be
@@ -39,7 +38,6 @@
  */
 struct ap_matrix_dev {
 	struct device device;
-	atomic_t available_instances;
 	struct ap_config_info info;
 	struct list_head mdev_list;
 	struct mutex lock;
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index c3018e8e6d3258..33a5e738867488 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -25,7 +25,7 @@ static DEFINE_MUTEX(parent_list_lock);
 static struct class_compat *mdev_bus_compat_class;
 
 static LIST_HEAD(mdev_list);
-static DEFINE_MUTEX(mdev_list_lock);
+DEFINE_MUTEX(mdev_list_lock);
 
 struct device *mdev_parent_dev(struct mdev_device *mdev)
 {
@@ -245,6 +245,7 @@ static void mdev_device_release(struct device *dev)
 
 	mutex_lock(&mdev_list_lock);
 	list_del(&mdev->next);
+	mdev->type->available++;
 	mutex_unlock(&mdev_list_lock);
 
 	dev_dbg(&mdev->dev, "MDEV: destroying\n");
@@ -268,6 +269,14 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 		}
 	}
 
+	if (drv->get_available) {
+		if (!type->available) {
+			mutex_unlock(&mdev_list_lock);
+			return -EUSERS;
+		}
+		type->available--;
+	}
+
 	mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
 	if (!mdev) {
 		mutex_unlock(&mdev_list_lock);
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index afbad7b0a14a17..83586b07023334 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -29,6 +29,7 @@ struct mdev_type {
 	struct kobject *devices_kobj;
 	struct mdev_parent *parent;
 	struct list_head next;
+	unsigned int available;
 	unsigned int type_group_id;
 };
 
@@ -38,6 +39,7 @@ struct mdev_type {
 	container_of(_kobj, struct mdev_type, kobj)
 
 extern struct mdev_driver vfio_mdev_driver;
+extern struct mutex mdev_list_lock;
 
 int  parent_create_sysfs_files(struct mdev_parent *parent);
 void parent_remove_sysfs_files(struct mdev_parent *parent);
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index d4b99440d19e9a..b3129dfc27ef7d 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -93,8 +93,41 @@ static struct attribute_group mdev_type_std_group = {
 	.attrs = mdev_types_std_attrs,
 };
 
+/* mdev_type attribute used by drivers that have an get_available() op */
+static ssize_t available_instances_show(struct mdev_type *mtype,
+					struct mdev_type_attribute *attr,
+					char *buf)
+{
+	unsigned int available;
+
+	mutex_lock(&mdev_list_lock);
+	available = mtype->available;
+	mutex_unlock(&mdev_list_lock);
+
+	return sysfs_emit(buf, "%u\n", available);
+}
+static MDEV_TYPE_ATTR_RO(available_instances);
+static umode_t available_instances_is_visible(struct kobject *kobj,
+					      struct attribute *attr, int n)
+{
+	struct mdev_type *type = to_mdev_type(kobj);
+
+	if (!type->parent->ops->device_driver->get_available)
+		return 0;
+	return attr->mode;
+}
+static struct attribute *mdev_types_name_attrs[] = {
+	&mdev_type_attr_available_instances.attr,
+	NULL,
+};
+static struct attribute_group mdev_type_available_instances_group = {
+	.attrs = mdev_types_name_attrs,
+	.is_visible = available_instances_is_visible,
+};
+
 static const struct attribute_group *mdev_type_groups[] = {
 	&mdev_type_std_group,
+	&mdev_type_available_instances_group,
 	NULL,
 };
 
@@ -136,6 +169,10 @@ static struct mdev_type *add_mdev_supported_type(struct mdev_parent *parent,
 	mdev_get_parent(parent);
 	type->type_group_id = type_group_id;
 
+	if (parent->ops->device_driver->get_available)
+		type->available =
+			parent->ops->device_driver->get_available(type);
+
 	ret = kobject_init_and_add(&type->kobj, &mdev_type_ktype, NULL,
 				   "%s-%s", dev_driver_string(parent->dev),
 				   group->name);
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 7f1db354f45f14..819eaf98ffac73 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -140,12 +140,14 @@ struct mdev_type_attribute {
  * @probe: called when new device created
  * @remove: called when device removed
  * @driver: device driver structure
+ * @get_available: Return the max number of instances that can be created
  *
  **/
 struct mdev_driver {
 	int (*probe)(struct mdev_device *dev);
 	void (*remove)(struct mdev_device *dev);
 	struct device_driver driver;
+	unsigned int (*get_available)(struct mdev_type *mtype);
 };
 
 static inline void *mdev_get_drvdata(struct mdev_device *mdev)
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index b81d7848619cae..2ea8694a0ddb19 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -84,7 +84,6 @@ static dev_t		mdpy_devt;
 static struct class	*mdpy_class;
 static struct cdev	mdpy_cdev;
 static struct device	mdpy_dev;
-static u32		mdpy_count;
 static const struct vfio_device_ops mdpy_dev_ops;
 
 /* State of each mdev device */
@@ -225,9 +224,6 @@ static int mdpy_probe(struct mdev_device *mdev)
 	u32 fbsize;
 	int ret;
 
-	if (mdpy_count >= max_devices)
-		return -ENOMEM;
-
 	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
 	if (mdev_state == NULL)
 		return -ENOMEM;
@@ -256,8 +252,6 @@ static int mdpy_probe(struct mdev_device *mdev)
 	mdpy_create_config_space(mdev_state);
 	mdpy_reset(mdev_state);
 
-	mdpy_count++;
-
 	ret = vfio_register_group_dev(&mdev_state->vdev);
 	if (ret)
 		goto err_mem;
@@ -284,8 +278,6 @@ static void mdpy_remove(struct mdev_device *mdev)
 	kfree(mdev_state->vconfig);
 	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state);
-
-	mdpy_count--;
 }
 
 static ssize_t mdpy_read(struct vfio_device *vdev, char __user *buf,
@@ -662,18 +654,10 @@ static ssize_t description_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(description);
 
-static ssize_t available_instances_show(struct mdev_type *mtype,
-					struct mdev_type_attribute *attr,
-					char *buf)
-{
-	return sprintf(buf, "%d\n", max_devices - mdpy_count);
-}
-static MDEV_TYPE_ATTR_RO(available_instances);
 
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
 	&mdev_type_attr_description.attr,
-	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
 
@@ -706,6 +690,11 @@ static const struct vfio_device_ops mdpy_dev_ops = {
 	.mmap = mdpy_mmap,
 };
 
+static unsigned int mdpy_get_available(struct mdev_type *mtype)
+{
+	return max_devices;
+}
+
 static struct mdev_driver mdpy_driver = {
 	.driver = {
 		.name = "mdpy",
@@ -715,6 +704,7 @@ static struct mdev_driver mdpy_driver = {
 	},
 	.probe = mdpy_probe,
 	.remove	= mdpy_remove,
+	.get_available = mdpy_get_available,
 };
 
 static const struct mdev_parent_ops mdev_fops = {
-- 
2.33.0

