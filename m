Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E3C56696F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D11110F6AE;
	Tue,  5 Jul 2022 11:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D04910EBD6;
 Tue,  5 Jul 2022 06:54:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgDD8yI4zZ9YX7oSP+t6FPFwil7GuAHVmFEdxp+QpLTXNNA1waK2Nmbj5lSGx+mjJQbA6MBxRaBmwcvPpNM2COy7jXsiWAzuvhdyHPVXyghUK7/etXUmSPUiDubLy0iiSEYz0DgVeRyALBNBHB5bEN/Be6uAeORWjxUkWPUFsQMQVGpmWbq3ZU6UCYoVfZPFtTrLXDplFUotSXuikbrGNuSeKG+IcG0zrcFTUUmqUI5wnfdvGaZzR+r24PwKVDgYwX/5ogULJzQtPUCep74zrdR0A+vUnjWQIJHywml2RkEfoDFBElKL7F4vVkvqNQ8L/J+u/0wi0l7KjNo9FlXMag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gwj0RViNwpyF8BjbSXegSC7KXflXMfkeyYaM4Ob3JY=;
 b=Ge08+GqWwhE3LFr8dUhbVEDovicEuNfK0+NIJgS52STuTW8BR2EDZ1bnIZwRGP298FLW5LwYbu5p97RiVo/N5i1n5SeqiJW48AFomN4QV9RFa65TmcZ3YGMvBcg6IPcZOjX1SRFYogaJEfIfHbysMm1qSx0WZO3C4o/fT3EXEhPj18Ck/qIWpt5D1g1XzuqpRWW4TRmUUuLY20crOdXrZHJe1y5sMstC0XLxLG8WdZo/Dvu+SDKEL0mksbsen+o3mxMrdKN+8kpYANm0qu25AucIXAusI6qGH48uoIKea1yuS2Gh6qMe0yq3KWebqnncPrO4InNpc4nae4hbm9oyVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gwj0RViNwpyF8BjbSXegSC7KXflXMfkeyYaM4Ob3JY=;
 b=Oa7M8g4ASyHk138KXfoBzLf6cFI1OSeXsYoKH5KpB9Y7yMCbsO8VyqBpVvCmJ2kvNtae/XVEmesG6zvXziR3IPvTnl82POn4CjtNzgXamFiWQtVS0L1UF7u0DCe5mm50uobe+vjOL2Y04OqZTBSWrJV0Z3pOJCSsElEW84T7TTDJ1VryNbS7L2x08Shmqa52n1ELKO8sLyhnokp/uW5QPhdqzvDOfrZLJ3hEcz7z2omexu71keEoQK2UUPHKYCRQICsDg80Fq3363j/JuIOjwPvOxhOFL66NXwe6rFb1Gi5LH+1h22oWNADMjf4ogRa5P1pmTlmc/mTX8rNzSxJbFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1173.namprd12.prod.outlook.com (2603:10b6:903:41::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 00:59:06 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 00:59:06 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v3 2/2] vfio: Replace the iommu notifier with a device list
Date: Mon,  4 Jul 2022 21:59:04 -0300
Message-Id: <2-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b5f1d46-7825-409a-1f56-08da5e218f11
X-MS-TrafficTypeDiagnostic: CY4PR12MB1173:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/VM+SoK2HWPFTKu031MPO5oC6rmm4Wn2JGO3d8/FvGEwi4BcSGNm3pr0um/xY0R5oTlD/LQy8Bghg6XuDvFCMhhyO7C2WK30FrdeHqp06+Gd4h9Qc8LWQmen1XwF9n80jxkKfkKBromggSFfylc3ZVt1BlKscMhxakyec6Rnc49vcPh73M5jS6qNUnHQWU4B6fSMJCCnD6MnQ67Sw9Cxu6k/XN3PNTSSfpQqH+UCUEA2/Ln2AuQqLjl/akRqYRzwXo5o3qHWjsB0n/M+vjaUgE1xUgmmfhjlP9cdN0WewheWD2rw+ryxfbkN3tHZuyKOX7Z2c6yS4WDQ1jCLO/Jah7g+BuGmhrDQjl10j37jlLAc/8p1jU2xHfYfWxWQCLq+saNUJTYw8kghVRhlgp8EiCfR66CuLmKot4I19H1QMrZvZb3/AG7Mk/aDnN9wuUvv4+epXkTYOxb/VVSjqRxRFiuX7jjkN9dCeFGEwAmgUqLjJQXtIYMGWAhllKtSxjyJFPKAQDvdQ5qdQ8JPv48QkC/1xA76ZIzlugFhD0TsL1R5rCHbPZ1dP+b1I1kPM7Kb/4fu1iMOPU7nHKrtX+LDG4Ym/KBwaPVSDfaQrF+i1RFjFf7SYbnZGKnGs2yg2SGjHoZKgRCUhcOg2wZooX4KJec/cPuo54niWoIyVURgtoKbl2ylPGT1wUSfBS2C0osyLf8gYKJGs5ksWK/60CwgJgB/g8VvAFPrf6eyrGdHYuwlPU/5c/5So1gHxYdNqVXdOAV7TSmTjBFdMoqVCqFuYXvs9S5M6DAe/TWy+q5FSVolFnRTloMtyu2weWyoyn1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(110136005)(6486002)(26005)(54906003)(6512007)(186003)(36756003)(316002)(83380400001)(66946007)(86362001)(2616005)(5660300002)(2906002)(7416002)(7406005)(478600001)(6506007)(8936002)(30864003)(4326008)(66476007)(66556008)(38100700002)(8676002)(41300700001)(921005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jzfwxuYtCSKsmZJZNw/TIRiYjeN2ZbN3He7bLxxx7tTHdul8/nEMkNg9Q/tT?=
 =?us-ascii?Q?+/Yra32wZ/PcpiUyH1u9XU9lIGe6J31nBFOMmBCie8Uc3T1HeNeq+k/llSPM?=
 =?us-ascii?Q?8L6O2Q3wnMuSYIcApqSDFThwyXvvuePDptGvSJ1Sh98yHndeOmiyaL9Q7Ryp?=
 =?us-ascii?Q?d50nUbbvNgdWaVe3o5VK6NC0GOOLGYoBxIx0dOB8m+RUW8w0RrX3FrZnmIty?=
 =?us-ascii?Q?86f0wuJIHxlj4wJBg/boAg13MW46P1wPtQNYLK5hhsVYT2ue61DrISTzMEaO?=
 =?us-ascii?Q?74FMnq+9ayb9FRj88gX49EpZvUTMs+xpcmtwS5F4pW72B01cfk1ovqCrmjlq?=
 =?us-ascii?Q?IYEqd2sEmParm/LnrNmvdAxN7ZdavXDfts4JbSfoW6nwZ+6H0zD0LM73K3XR?=
 =?us-ascii?Q?WRomNiHbwuA6kq3cznX1FMiij8+8YVD3R8OzRmW/2/k1mn+WCpKlUqrbyIin?=
 =?us-ascii?Q?CaBst6C+EqvtvsxPGRbpO49J4hVtr/cey4RPVV9MORKtvgl2kFf9ElZ2WY5f?=
 =?us-ascii?Q?0Zj9BlNQ5phOweNxrvPSRfNLOcwAzQsqrmSTjG3XBynsJ7gzDCOAeJenI1U+?=
 =?us-ascii?Q?uVaZZH1Vp5F/QykGdaOdjkxjrf1ll794k8eVIhAlzJQKJjQB1jWUCMtXWpoR?=
 =?us-ascii?Q?/QOmhxjKJwx2P+hEntE/IeDC8l6IO2D1CGFxVS6bDvySDLw7N8PJCdyrLTCW?=
 =?us-ascii?Q?/SOTDv9hynTELsCn4uihyjuMhWhii/ap64QK6I5vjRsgv0sfihBCz1Aq/G/d?=
 =?us-ascii?Q?fnBEn+02sj9vlrAmm/3/fq/tYwz1ASs6qwlu5tMoQ6lh1jbtfBzXEPKmkOYp?=
 =?us-ascii?Q?Qc/yJxR13dur2BdVAS6Lgo1TEjiFW9XV4AN9+x76YJqJ6rH1e5yMfFCwur9+?=
 =?us-ascii?Q?ZMmLi/OzPjg4Qv3tvhogWY5Upjz55do/gFR5fvAcliJT3rZwNBMVKo6Uf/wI?=
 =?us-ascii?Q?rgmOtdlP98RMf7cPH5U7EPL82V2KBGNOD0tMGmHlSCzFtE6nyU5oDGe7k0Gf?=
 =?us-ascii?Q?cs3Rq+wgbKwtVlAHcJsRC0FdynJmJdV2g+AedP4jkLGJTgtNOZm4ae7VHWYL?=
 =?us-ascii?Q?cwbEg87wHT2+ZaAO/48L0VEsEXoATvA1t7X8+QWhDMOceO9yFZWGKbp+sIC+?=
 =?us-ascii?Q?mbM/LoW9py/pRqIbqdIxNduv0wnjyk3JvTUgANhjrI2j6HUhEGcD01j1ZW6N?=
 =?us-ascii?Q?dU70+z7x89RK4NrFz28FiRKFd7aQetuVyOmZNqY+uEwnXMFdyO/tBMkuN6yY?=
 =?us-ascii?Q?XVCnQjyWA9dmXa9DcZLc3AEDNOaFWRI02YA3/S1GytqVrVaO+7iXYsvSGcqO?=
 =?us-ascii?Q?XzoV5v0edurEepZbsPD5s6e3tAQt2WLDee0lt1TYRHeRJcjf7jaDjHhCmHRi?=
 =?us-ascii?Q?dV17CSRVniG9cvrMoER4tBtS8pkzXf+zYQU44Adn60vF77iVKWp7usqiNeBL?=
 =?us-ascii?Q?z32acgb/HVxsVLrwmcTazKnxjYDcX1QTKn1JvOWUYai/6cx4Z++gFoJmtrh+?=
 =?us-ascii?Q?Zrj12skI4wT/cVOXnWcblHKG3FlFlk39J/LNHNk7HZA66xGyw1bPIQnUDof2?=
 =?us-ascii?Q?NgnYI0Q3UOrUdg0VG74OoLBUt+xTLIA6lC9epaTY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5f1d46-7825-409a-1f56-08da5e218f11
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 00:59:05.5416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viFMw/SJ84cBvOnhKHYGL2fuOrgH25xSTHCwztDMJJ5Soqxsdl1ffYnNIZ2eEo4A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1173
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of bouncing the function call to the driver op through a blocking
notifier just have the iommu layer call it directly.

Register each device that is being attached to the iommu with the lower
driver which then threads them on a linked list and calls the appropriate
driver op at the right time.

Currently the only use is if dma_unmap() is defined.

Also, fully lock all the debugging tests on the pinning path that a
dma_unmap is registered.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio.c             |  41 ++++---------
 drivers/vfio/vfio.h             |  12 ++--
 drivers/vfio/vfio_iommu_type1.c | 103 ++++++++++++++++++++------------
 include/linux/vfio.h            |   2 +-
 4 files changed, 81 insertions(+), 77 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 610bb884d9197b..e43b9496464bbf 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -231,7 +231,7 @@ int vfio_register_iommu_driver(const struct vfio_iommu_driver_ops *ops)
 {
 	struct vfio_iommu_driver *driver, *tmp;
 
-	if (WARN_ON(!ops->register_notifier != !ops->unregister_notifier))
+	if (WARN_ON(!ops->register_device != !ops->unregister_device))
 		return -EINVAL;
 
 	driver = kzalloc(sizeof(*driver), GFP_KERNEL);
@@ -1080,17 +1080,6 @@ static void vfio_device_unassign_container(struct vfio_device *device)
 	up_write(&device->group->group_rwsem);
 }
 
-static int vfio_iommu_notifier(struct notifier_block *nb, unsigned long action,
-			       void *data)
-{
-	struct vfio_device *vfio_device =
-		container_of(nb, struct vfio_device, iommu_nb);
-	struct vfio_iommu_type1_dma_unmap *unmap = data;
-
-	vfio_device->ops->dma_unmap(vfio_device, unmap->iova, unmap->size);
-	return NOTIFY_OK;
-}
-
 static struct file *vfio_device_open(struct vfio_device *device)
 {
 	struct vfio_iommu_driver *iommu_driver;
@@ -1126,15 +1115,9 @@ static struct file *vfio_device_open(struct vfio_device *device)
 		}
 
 		iommu_driver = device->group->container->iommu_driver;
-		if (device->ops->dma_unmap && iommu_driver &&
-		    iommu_driver->ops->register_notifier) {
-			unsigned long events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-
-			device->iommu_nb.notifier_call = vfio_iommu_notifier;
-			iommu_driver->ops->register_notifier(
-				device->group->container->iommu_data, &events,
-				&device->iommu_nb);
-		}
+		if (iommu_driver && iommu_driver->ops->register_device)
+			iommu_driver->ops->register_device(
+				device->group->container->iommu_data, device);
 
 		up_read(&device->group->group_rwsem);
 	}
@@ -1174,11 +1157,9 @@ static struct file *vfio_device_open(struct vfio_device *device)
 		device->ops->close_device(device);
 
 		iommu_driver = device->group->container->iommu_driver;
-		if (device->ops->dma_unmap && iommu_driver &&
-		    iommu_driver->ops->unregister_notifier)
-			iommu_driver->ops->unregister_notifier(
-				device->group->container->iommu_data,
-				&device->iommu_nb);
+		if (iommu_driver && iommu_driver->ops->unregister_device)
+			iommu_driver->ops->unregister_device(
+				device->group->container->iommu_data, device);
 	}
 err_undo_count:
 	device->open_count--;
@@ -1383,11 +1364,9 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 		device->ops->close_device(device);
 
 	iommu_driver = device->group->container->iommu_driver;
-	if (device->ops->dma_unmap && iommu_driver &&
-	    iommu_driver->ops->unregister_notifier)
-		iommu_driver->ops->unregister_notifier(
-			device->group->container->iommu_data,
-			&device->iommu_nb);
+	if (iommu_driver && iommu_driver->ops->unregister_device)
+		iommu_driver->ops->unregister_device(
+			device->group->container->iommu_data, device);
 	up_read(&device->group->group_rwsem);
 	device->open_count--;
 	if (device->open_count == 0)
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 25da02ca1568fc..4a7db1f3c33e7e 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -33,9 +33,6 @@ enum vfio_iommu_notify_type {
 	VFIO_IOMMU_CONTAINER_CLOSE = 0,
 };
 
-/* events for register_notifier() */
-#define VFIO_IOMMU_NOTIFY_DMA_UNMAP BIT(0)
-
 /**
  * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
  */
@@ -58,11 +55,10 @@ struct vfio_iommu_driver_ops {
 				     unsigned long *phys_pfn);
 	int		(*unpin_pages)(void *iommu_data,
 				       unsigned long *user_pfn, int npage);
-	int		(*register_notifier)(void *iommu_data,
-					     unsigned long *events,
-					     struct notifier_block *nb);
-	int		(*unregister_notifier)(void *iommu_data,
-					       struct notifier_block *nb);
+	void		(*register_device)(void *iommu_data,
+					   struct vfio_device *vdev);
+	void		(*unregister_device)(void *iommu_data,
+					     struct vfio_device *vdev);
 	int		(*dma_rw)(void *iommu_data, dma_addr_t user_iova,
 				  void *data, size_t count, bool write);
 	struct iommu_domain *(*group_iommu_domain)(void *iommu_data,
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index c13b9290e35759..4ddb1f1abd238b 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -67,7 +67,8 @@ struct vfio_iommu {
 	struct list_head	iova_list;
 	struct mutex		lock;
 	struct rb_root		dma_list;
-	struct blocking_notifier_head notifier;
+	struct list_head	device_list;
+	struct mutex		device_list_lock;
 	unsigned int		dma_avail;
 	unsigned int		vaddr_invalid_count;
 	uint64_t		pgsize_bitmap;
@@ -865,8 +866,8 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 		}
 	}
 
-	/* Fail if notifier list is empty */
-	if (!iommu->notifier.head) {
+	/* Fail if no dma_umap notifier is registered */
+	if (list_empty(&iommu->device_list)) {
 		ret = -EINVAL;
 		goto pin_done;
 	}
@@ -1287,6 +1288,35 @@ static int verify_bitmap_size(uint64_t npages, uint64_t bitmap_size)
 	return 0;
 }
 
+/*
+ * Notify VFIO drivers using vfio_register_emulated_iommu_dev() to invalidate
+ * and unmap iovas within the range we're about to unmap. Drivers MUST unpin
+ * pages in response to an invalidation.
+ */
+static void vfio_notify_dma_unmap(struct vfio_iommu *iommu,
+				  struct vfio_dma *dma)
+{
+	struct vfio_device *device;
+
+	if (list_empty(&iommu->device_list))
+		return;
+
+	/*
+	 * The device is expected to call vfio_unpin_pages() for any IOVA it has
+	 * pinned within the range. Since vfio_unpin_pages() will eventually
+	 * call back down to this code and try to obtain the iommu->lock we must
+	 * drop it.
+	 */
+	mutex_lock(&iommu->device_list_lock);
+	mutex_unlock(&iommu->lock);
+
+	list_for_each_entry(device, &iommu->device_list, iommu_entry)
+		device->ops->dma_unmap(device, dma->iova, dma->size);
+
+	mutex_unlock(&iommu->device_list_lock);
+	mutex_lock(&iommu->lock);
+}
+
 static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 			     struct vfio_iommu_type1_dma_unmap *unmap,
 			     struct vfio_bitmap *bitmap)
@@ -1406,8 +1436,6 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 		}
 
 		if (!RB_EMPTY_ROOT(&dma->pfn_list)) {
-			struct vfio_iommu_type1_dma_unmap nb_unmap;
-
 			if (dma_last == dma) {
 				BUG_ON(++retries > 10);
 			} else {
@@ -1415,20 +1443,7 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 				retries = 0;
 			}
 
-			nb_unmap.iova = dma->iova;
-			nb_unmap.size = dma->size;
-
-			/*
-			 * Notify anyone (mdev vendor drivers) to invalidate and
-			 * unmap iovas within the range we're about to unmap.
-			 * Vendor drivers MUST unpin pages in response to an
-			 * invalidation.
-			 */
-			mutex_unlock(&iommu->lock);
-			blocking_notifier_call_chain(&iommu->notifier,
-						    VFIO_IOMMU_NOTIFY_DMA_UNMAP,
-						    &nb_unmap);
-			mutex_lock(&iommu->lock);
+			vfio_notify_dma_unmap(iommu, dma);
 			goto again;
 		}
 
@@ -2478,7 +2493,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 
 		if (list_empty(&iommu->emulated_iommu_groups) &&
 		    list_empty(&iommu->domain_list)) {
-			WARN_ON(iommu->notifier.head);
+			WARN_ON(!list_empty(&iommu->device_list));
 			vfio_iommu_unmap_unpin_all(iommu);
 		}
 		goto detach_group_done;
@@ -2510,7 +2525,8 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 		if (list_empty(&domain->group_list)) {
 			if (list_is_singular(&iommu->domain_list)) {
 				if (list_empty(&iommu->emulated_iommu_groups)) {
-					WARN_ON(iommu->notifier.head);
+					WARN_ON(!list_empty(
+						&iommu->device_list));
 					vfio_iommu_unmap_unpin_all(iommu);
 				} else {
 					vfio_iommu_unmap_unpin_reaccount(iommu);
@@ -2571,7 +2587,8 @@ static void *vfio_iommu_type1_open(unsigned long arg)
 	iommu->dma_avail = dma_entry_limit;
 	iommu->container_open = true;
 	mutex_init(&iommu->lock);
-	BLOCKING_INIT_NOTIFIER_HEAD(&iommu->notifier);
+	mutex_init(&iommu->device_list_lock);
+	INIT_LIST_HEAD(&iommu->device_list);
 	init_waitqueue_head(&iommu->vaddr_wait);
 	iommu->pgsize_bitmap = PAGE_MASK;
 	INIT_LIST_HEAD(&iommu->emulated_iommu_groups);
@@ -3008,28 +3025,40 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 	}
 }
 
-static int vfio_iommu_type1_register_notifier(void *iommu_data,
-					      unsigned long *events,
-					      struct notifier_block *nb)
+static void vfio_iommu_type1_register_device(void *iommu_data,
+					     struct vfio_device *vdev)
 {
 	struct vfio_iommu *iommu = iommu_data;
 
-	/* clear known events */
-	*events &= ~VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-
-	/* refuse to register if still events remaining */
-	if (*events)
-		return -EINVAL;
+	if (!vdev->ops->dma_unmap)
+		return;
 
-	return blocking_notifier_chain_register(&iommu->notifier, nb);
+	/*
+	 * list_empty(&iommu->device_list) is tested under the iommu->lock while
+	 * iteration for dma_unmap must be done under the device_list_lock.
+	 * Holding both locks here allows avoiding the device_list_lock in
+	 * several fast paths. See vfio_notify_dma_unmap()
+	 */
+	mutex_lock(&iommu->lock);
+	mutex_lock(&iommu->device_list_lock);
+	list_add(&vdev->iommu_entry, &iommu->device_list);
+	mutex_unlock(&iommu->device_list_lock);
+	mutex_unlock(&iommu->lock);
 }
 
-static int vfio_iommu_type1_unregister_notifier(void *iommu_data,
-						struct notifier_block *nb)
+static void vfio_iommu_type1_unregister_device(void *iommu_data,
+					       struct vfio_device *vdev)
 {
 	struct vfio_iommu *iommu = iommu_data;
 
-	return blocking_notifier_chain_unregister(&iommu->notifier, nb);
+	if (!vdev->ops->dma_unmap)
+		return;
+
+	mutex_lock(&iommu->lock);
+	mutex_lock(&iommu->device_list_lock);
+	list_del(&vdev->iommu_entry);
+	mutex_unlock(&iommu->device_list_lock);
+	mutex_unlock(&iommu->lock);
 }
 
 static int vfio_iommu_type1_dma_rw_chunk(struct vfio_iommu *iommu,
@@ -3163,8 +3192,8 @@ static const struct vfio_iommu_driver_ops vfio_iommu_driver_ops_type1 = {
 	.detach_group		= vfio_iommu_type1_detach_group,
 	.pin_pages		= vfio_iommu_type1_pin_pages,
 	.unpin_pages		= vfio_iommu_type1_unpin_pages,
-	.register_notifier	= vfio_iommu_type1_register_notifier,
-	.unregister_notifier	= vfio_iommu_type1_unregister_notifier,
+	.register_device	= vfio_iommu_type1_register_device,
+	.unregister_device	= vfio_iommu_type1_unregister_device,
 	.dma_rw			= vfio_iommu_type1_dma_rw,
 	.group_iommu_domain	= vfio_iommu_type1_group_iommu_domain,
 	.notify			= vfio_iommu_type1_notify,
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 8c5c389d42d918..cd76b73f22d64c 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -44,7 +44,7 @@ struct vfio_device {
 	unsigned int open_count;
 	struct completion comp;
 	struct list_head group_next;
-	struct notifier_block iommu_nb;
+	struct list_head iommu_entry;
 };
 
 /**
-- 
2.37.0

