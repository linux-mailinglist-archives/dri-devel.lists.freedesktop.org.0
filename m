Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFB341F3E6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3AF6EEAA;
	Fri,  1 Oct 2021 17:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0F16EE8E;
 Fri,  1 Oct 2021 17:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKXmE51OEucY70dQE6XTSadOJgnbwo20CAeB1IInSRAxOvYHpbUDNimqqmyZQrtfRSqnPrvFq0RHGIZf9LYtdiO7XVXUiGxcVeXK+21Wrd/hJJnlsfHSO3ncXgwF85IajcFhVUHSsE5OWll6AfhWNQlXXzMXuLPSWQiLmSuzi9EiDsEAqBu8nze7hZmsN9xJCys8sT0yOFXii9KJwvQ8gHR4/AtFNYmKsaeYgAzT8wTt8jHTZKes4keLvLS7mML9qLBrPKtifVNq+YgH/ksW36CZ5TGz88k2QF97JkWmHtsX034DTUcvSD3Gn2ReBloO8l59rxKtZtuM/pOKo2TIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCXsO4GSdk6PAZWLTIFUG529WdD+pJohNewSmaMy2Po=;
 b=A/gTIIndL/CO1NN5eMzfnRWffuGCJvSUyJXHANta2nsX51GkgbaNynbwuARXKcfaMj+hvOrD0iGRoC52Js6Zr/LBX1pGehfGNCjuwjq1rgH1/s4tgQhuoYuwHq4H+aP89dYalGdVWAWxlKKHi0H+1gxdeL34L5iAoDBs3Q8sUq9XJhpssItzgNc9D3WA0s4EDi+AhzLbxz/aPKDWxWRUV1O196Nj7XMqFLn0qsaE0UUuaW+ODJ483df3oQ8riCiLTojHPZXVW32k7dbkvy2Fm9WUWFXzYIsMF+3xKeaa3+7YWIelzUo75wckgd1ARqYnuJPQEFZXKnKDg4/ce7j96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCXsO4GSdk6PAZWLTIFUG529WdD+pJohNewSmaMy2Po=;
 b=Z37IcHP/jUl5xXFxmlJSEbU6HQvlbU/Z51lldj4mrO2dtgxgSKcv+T93zMcMTZNTzy6NIZW4mlxdGj18gf2KDsCC0Ppyc47nOQGrfQdDGzF3ky5RJ9DT9uASueNSwZ/eXSp1AOFEhIXsBAfzv/tiB/oWGUGdW6DLT7lZ5yyN1J9Kep2DfvfzrLBrOWMePr2RduA+AgNhsn5voEtNSba8CIr4UVT9z8V8Zvp/sFtNJHBxHANLdffO45eW41pVQ2OfkmHXYeoAvpwRqeH/lXUtJ23zjobbWvAYX3r2as4tb2EVrxHh2kPRImJyp1vXRuNeiIHKeNWNeAK3a6nktm3+8g==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 17:52:56 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 17:52:56 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 07/10] vfio/mdev: Add mdev available instance checking to
 the core
Date: Fri,  1 Oct 2021 14:52:48 -0300
Message-Id: <7-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::32) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:208:1a0::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-00989P-7L; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1726f3fe-189c-408a-219e-08d985044b43
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB520769F00755A502F326FC5EC2AB9@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:356;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BazDlNGmlp3/Ku1oBKM4z9SX+x+PfSutY58I3bHrDCV4+qZtwyJAFkZm868WLoZu+t7/XSpX+5uwNpVMkl+bQKl5hxdFNQClrdSP6/Iabq6bmNmzUBmDNSyyfAXJlC/ePwE70RKGkCQUIHvervOc2JaYsvSQ8VpEs3l1+ptE2+7TNpnfLWr7qWLATDXtKe4cGi0tg5xibOXLIi0diGcA3F/bR50B4czXIhXRzXx7J5gP+ZjVbTl2K+WuY6/d1K5oJZD/f04yWdcwNRYam8E0J5053scjt854KtVJyel3fPoID9opjR2aqtPv1H6SLzGlbtGf+Vuwms2Q8H8xaX8oGO5FT/qcOX/qXMOM42VT8IzSiXKGGyinWVyf5qopJ1j93Sdb5RZ5C/c4/8CZERHRzwlzc4Rhs/5OWEyMCUacXJ3K634TfuPBKrDSgS3mn0KxhUcO8SKxmkX35aNjer8P8xbsmGE/+iI2bmLAfu4Y+JeHNNhRhAaOGTHpx1BTh+VXI4zwkTgBlcVQuz/+wK8eEWZ6tXhiouUwb4yqux58pf2vFUiBQqOIUKIA/HDkSxuGiR4Rvdd6PPfxifXlVZgPxy4n4ODLvDDBssP5oyU6A/OxFtsPRlhNCJke4t+aTQUsJsg6La0r3iMjkBfseBy4HYp+JvIYciFbVVJU3mHzOhLVjUCafFyiegMjTqzUQLEW5KvR2Cer5HfjozXTwAF5m1wFmTsirK2X/JL3hq4gX5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(83380400001)(66556008)(8676002)(38100700002)(66476007)(5660300002)(2616005)(508600001)(426003)(9786002)(26005)(186003)(6666004)(9746002)(54906003)(36756003)(7416002)(4326008)(110136005)(86362001)(8936002)(921005)(30864003)(316002)(131093003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?olS/ANbK1wIhj2D+DoKU0ohvU6yLublMACkdNa3VjiYdLGXPPv5O0NiF9jSG?=
 =?us-ascii?Q?xgSd9OSaHYDVbP6mF0ZiAzyWg2zYHInqVFCaQeBbFT/o5r5ayL90Gyz/FYQN?=
 =?us-ascii?Q?K1gr10iBi9Ms0XSy+9W3QTAYOT5oux97IWdV3hDEPvnuGLbvivrLBL8QZciu?=
 =?us-ascii?Q?nTL4pb8GCOQjkYf0BRLrJ7jPl/MguTAcPrDI+2MK/cGQI/lpfPTK4aUigfpn?=
 =?us-ascii?Q?Co6MBEer4QtevjeFTq91AUPFXA6sebDcEt89nA80e5f+7UTjDT2V9gZm1Wd4?=
 =?us-ascii?Q?SdDyv/ZE+nWGLi/6/Cbi39bJeEVaYqiKRwdDiJYs3aUDzImAaiikawX2ahzr?=
 =?us-ascii?Q?J7r/Gnc92TEWenTpfenIW5ahNFcEjANKPz43GihhZK6ArtCGhDylgTvDmFPn?=
 =?us-ascii?Q?NuSQsSl5oj7Muq9oRKwAVo1zQgmellVYwzI/EQnPLg6docp7j1P8K2ytWXLO?=
 =?us-ascii?Q?qhSs9I6xKsCq8qJYdS/q8UN1AY2OB2wDwKB5VpuPMnNf4ARZhq1pimHORXq9?=
 =?us-ascii?Q?qbfpn71uTtECH7d1qZBaRv+BoYe8AAtmGkNLIK3yHA8PmkCVE/ZLhwrptOUn?=
 =?us-ascii?Q?rbr4X5jnKuBNUhALp40QFILj0TUX0dtqEM3GcLAezFe14COJJVMtj4VyH9kU?=
 =?us-ascii?Q?ZhV2W7ZNIEu18/0Dv4Gn+4qlbIl6eRhhkvs9Zr0f9tCv+4BmF92FotrI+wER?=
 =?us-ascii?Q?xFPFkvlPrJeden3qvUemO+VDdl9efJFcdTtmHKgb4wqImlH7c4jvEsU906ra?=
 =?us-ascii?Q?IuFkX8hptLY4nQA6vNJ1tf28vhDAluyauO9Cb2q7T3H2XYv+U2tszZ9RuGFh?=
 =?us-ascii?Q?8a+yo8EivJwOkwqveI8bCGJQnyFyLxRR2sz3SCreuHq6kNJLxwdPRkEllO1R?=
 =?us-ascii?Q?DNuvnDp3ej9Qfyugs1pW0p/e87ROTXWpeX0f9R112y8PsYerUGmqESF933DD?=
 =?us-ascii?Q?M4PvYXMezjVdnWgR0+TKXrLM9z9zCB5HX96JHeUzjFgHklkKtMPBFK6JFQe9?=
 =?us-ascii?Q?FIY/MRxqicqy7mCiCArPaGTfbk1QlOS6CEdnLhgH0Kv9FEflW0iWX7SEegxc?=
 =?us-ascii?Q?coJEPTUldQnIH/vIJj1Jdhm0d74LqJHDpM9e7/7QrtKM3SJfz3S/XONaGo6J?=
 =?us-ascii?Q?vkxXmVqZ7+RKkVm98jeRdBA3sKQ+QMakUZB85Rq3lOVoQJibLoJaBBjs35vq?=
 =?us-ascii?Q?hG8gyjzRtF4pJcdukisrSidxNjPZuv72ONtgKTJ5IvRvLduo+FCU8zE9gHPZ?=
 =?us-ascii?Q?fWRvvhCqJV0ppfnm2FQCIg8z3eQFNXiGEfFrDYYmy+sHdX1JuNK4qE0UZzdX?=
 =?us-ascii?Q?1k05En9a/O0AAUt3qVYPttg2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1726f3fe-189c-408a-219e-08d985044b43
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:54.0840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LT5WgRo5U8/Mme1QwUSEEWb9/7jqDaW5ex4H+mdIaYh6F4oZ7eml4fGLXi0QyPdJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
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

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  4 +-
 drivers/s390/cio/vfio_ccw_drv.c               |  1 -
 drivers/s390/cio/vfio_ccw_ops.c               | 26 ++++---------
 drivers/s390/cio/vfio_ccw_private.h           |  2 -
 drivers/s390/crypto/vfio_ap_ops.c             | 32 ++++------------
 drivers/s390/crypto/vfio_ap_private.h         |  2 -
 drivers/vfio/mdev/mdev_core.c                 | 11 +++++-
 drivers/vfio/mdev/mdev_private.h              |  2 +
 drivers/vfio/mdev/mdev_sysfs.c                | 37 +++++++++++++++++++
 include/linux/mdev.h                          |  2 +
 samples/vfio-mdev/mdpy.c                      | 22 +++--------
 11 files changed, 76 insertions(+), 65 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index f410a1cd98bb06..a4f7f1362fa8a5 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -106,6 +106,7 @@ structure to represent a mediated device's driver::
 	     int  (*probe)  (struct mdev_device *dev);
 	     void (*remove) (struct mdev_device *dev);
 	     struct device_driver    driver;
+	     unsigned int (*get_available)(struct mdev_type *mtype);
      };
 
 A mediated bus driver for mdev should use this structure in the function calls
@@ -232,7 +233,8 @@ Directories and files under the sysfs for Each Physical Device
 * available_instances
 
   This attribute should show the number of devices of type <type-id> that can be
-  created.
+  created. Drivers can supply a get_available() function pointer to have the
+  core code create and maintain this sysfs automatically.
 
 * [device]
 
diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 769edbbd164313..df9e1e265bca1a 100644
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
index a7f642be9c8898..97df5c711736c4 100644
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
 
 	ret = vfio_register_emulated_iommu_dev(&private->vdev);
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
index f80246b30aff30..b6eaee24f798a8 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -333,14 +333,9 @@ static int vfio_ap_mdev_probe(struct mdev_device *mdev)
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
 
@@ -363,8 +358,6 @@ static int vfio_ap_mdev_probe(struct mdev_device *mdev)
 	mutex_unlock(&matrix_dev->lock);
 	vfio_uninit_group_dev(&matrix_mdev->vdev);
 	kfree(matrix_mdev);
-err_dec_available:
-	atomic_inc(&matrix_dev->available_instances);
 	return ret;
 }
 
@@ -380,7 +373,6 @@ static void vfio_ap_mdev_remove(struct mdev_device *mdev)
 	mutex_unlock(&matrix_dev->lock);
 	vfio_uninit_group_dev(&matrix_mdev->vdev);
 	kfree(matrix_mdev);
-	atomic_inc(&matrix_dev->available_instances);
 }
 
 static ssize_t name_show(struct mdev_type *mtype,
@@ -391,20 +383,8 @@ static ssize_t name_show(struct mdev_type *mtype,
 
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
 
@@ -1359,6 +1339,11 @@ static ssize_t vfio_ap_mdev_ioctl(struct vfio_device *vdev,
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
@@ -1374,6 +1359,7 @@ static struct mdev_driver vfio_ap_matrix_driver = {
 	},
 	.probe = vfio_ap_mdev_probe,
 	.remove = vfio_ap_mdev_remove,
+	.get_available = vfio_ap_mdev_get_available,
 };
 
 static const struct mdev_parent_ops vfio_ap_matrix_ops = {
@@ -1387,8 +1373,6 @@ int vfio_ap_mdev_register(void)
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
index c3018e8e6d3258..bb27ca0db948ca 100644
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
 
+	if (drv && drv->get_available) {
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
index 8a5fc5d54f9b76..7cadbbac7de9d0 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -120,12 +120,14 @@ struct mdev_type_attribute {
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
index 402a7ebe656371..d7da6ed3565705 100644
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
 	ret = vfio_register_emulated_iommu_dev(&mdev_state->vdev);
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

