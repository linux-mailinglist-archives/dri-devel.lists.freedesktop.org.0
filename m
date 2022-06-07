Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B28541F45
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 01:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A4A112037;
	Tue,  7 Jun 2022 23:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BAA112033;
 Tue,  7 Jun 2022 23:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/GGC9DIHeyfDamB8raRjz21I2FcvJMnRDabYNaGnBTE8dX+KB1xzVNrfXz3QKKce5BJXpTt2fxlhIaWihdwakeaN4UkyTn6EX2M0EQp8YLKBWBghoUFJyI6a9b3zkHo9vLg2GOT1S1Eye4RkIrOUuUF5E/kyO49rC6icw4wcVj3i0elU1ORmbNdKeX7PVxeXyXohb5KLOXBhQXaMgfMdNWkKvYJkLIf1ewkdxlhx6ErhqM78Gq7cvybmLUzVGb/3mScrs3T+o3Ws9wQS/W5s9MUhOiX5U5GulR5el9VjVnnU0rAQF4BRmiIp6F04w3vyehtu3pv1CviWxKi/OaLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1zwNYxGH0ZRGcYyk7cGljTTKLM2Y5IWLDr/DwFo8KU=;
 b=MMNPpp+d0rE2T4J48BfosqCCxBDfGoUUjiImr2ZIchkEgF9l6cCL9/+8toBdF7rbZhfkPoLBdU6ZjwxWMOzeAt/2Ws7vSsj85JljBlV6LhXkYhv+/a5PfZj8PPWGd1Tq4vRRHKBkP3a532nnEDIa54wjTpQJAQye/STbFjyVARhvKxA5LHBA0IwlYfmCZXJadz3NB2XzMNxWKA1F8J3BfZaf53uYog0HFGhGJGQ+t55/zU2E4/zogTbf3yIpdr6nCwXVXex0rkqAWIXm1ByjlQXRXzPtiHUCoYUcl2fZhzLkt3JLv6Z70wqAjRokZxt5zYVQaysRV5rdcGgVM72y8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1zwNYxGH0ZRGcYyk7cGljTTKLM2Y5IWLDr/DwFo8KU=;
 b=pJWyw/l73dMuHz9DTM+4FcprGcSxjXxmLyUHiZaljp1JVrM6g94GWMiKTmPSg7/vyt40Hl1/vWbSE3Aku7o6UCZMhb44pY+/4xKj73hGQoNgk+3dLQk6WOw31OcqmKzbPdUgO5dQp9kuc3sAyOApUhTs9HJ2uRHSHsIPBBKS0V3gaiT/oldWyXnkpslZERxPsDz1Hs7AFQLgECJL4E/MRTqzK9RonhY5JUI3pxD7pgeY6gRLNPpdmQrliMn0EHACxHSm5tdBj71/YFafPiR9m/pZUWK2meYpagG4jVzujP6LIYA79zgt6oKbHGiW3K19B2spqy/BpFSrYHq2fO3Jcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3593.namprd12.prod.outlook.com (2603:10b6:5:11c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 23:02:14 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 23:02:14 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
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
Subject: [PATCH v2 2/2] vfio: Replace the iommu notifier with a device list
Date: Tue,  7 Jun 2022 20:02:12 -0300
Message-Id: <2-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <0-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:207:3d::44) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4be6758-912c-4c45-f9de-08da48d9c277
X-MS-TrafficTypeDiagnostic: DM6PR12MB3593:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB359327C619F6FDAB6CB36AF9C2A59@DM6PR12MB3593.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HF2XGy0kYirQTbjagiNNy2SKhziODZptmtqZMwhlFVW54HDCZto8itxqJXoaxEGGlEcknMOjel15FbMOrPWBwDvLV3p123r+MgBnDbnOZ7ha06zvMDdx645llPKyy8rRDQqWA6TWJIKaKcsmRxdV8dw2csQsPf7Q2AQk281rFWzncMjzzDfguNHphX7C99/1cQT1Q0DZ7KlzS0bOd4JXxLP+9vb8YWi4ZikF7k+9xRL9bBzs0CyKltXovqkDA2EtD9Ye7NG4kQ/w+9Svrg9uYnTCrp+kH9PWP9XvmbFVal9dOGTretJTkevyDl3HceK/9exLh+bstK53Ct6pHjg6hgECHgobaZxdyK+MsaKkjPemoAAqRIJUO0FJ7lUi+LJ8QgCLyR9gm0yHG9lVUsmmAvZQCJMjuoPusTW7Aax67o8w1xJIzKWeFWnwmVphIBIK9pgH2EeRbTvwLbTZcBgpS4OjbWbDEtQfpYDkOHktRTm56yM0uR5m68XF0gBTf3HZj/9bFxTM6JZDN+BSOkl2Wwdquk2fqanVT6NZnKDq2SJXYv6iN7LHTdn9gXxFIwoxqwr3XvMGosSJfWRjqsV4BkJhWI728vN13SL/kKSJ/jSQeEJphu/1tLVEUTcIBMS14jDTxVJeA4ERBFkvuvmYQ0VAI32mxYCMHugjHO+uKjBqTcuaYgCxrPv4u6+ZZ5IoHzwSXUMD7PIIg238KcVgkRh3yGqN/9mUrRTr6XWtzeM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(38100700002)(86362001)(316002)(110136005)(921005)(2906002)(66476007)(66556008)(8676002)(4326008)(5660300002)(8936002)(30864003)(186003)(2616005)(83380400001)(6486002)(508600001)(6512007)(26005)(6506007)(36756003)(7416002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EbG8vYTCuful9tfH0/4t/ymG6XE2m72DbvGLNweZv8AdE1sa7Z1x8RcN4o8n?=
 =?us-ascii?Q?yqDW4mOs3YFJvClJQxpKCTqauj1St9pjscAhebXqr4a6u6yq8kSTP9RTfpf5?=
 =?us-ascii?Q?f2wuHSfTgzGxlcCvQO65pIszVAeoV2DeXNMDtHrSPKAHueIga6cFAHg3LQVT?=
 =?us-ascii?Q?EU6P4aLDrOpEmiIHU1yqEpYQVAZVeeoq5RJUVgKkMPbWr/RqmmRzE6intcx0?=
 =?us-ascii?Q?S9Yu/BS21PtRmxaAaV3tKRlTo3oublLOgpc4ejKYhx9H9QLnnmAFIeqBx3fq?=
 =?us-ascii?Q?gMyYGvl4XXFGvEmTL9bvP1SyLixJI1d9e9R5zsePnSpKCWn5HtHD8l6reiLd?=
 =?us-ascii?Q?xlQz4xZK2vNfW08ry1+cWn3wQB4aID7bQHowsoJx12nIOVrWbuyQuFVyydNO?=
 =?us-ascii?Q?/gSbaJwPcBqfZ8ha5A9Rvg5/UeJ6mNax5k5umGHpQMZyrU+sPLZh/ZvlkXru?=
 =?us-ascii?Q?Fww4ciwPHQQXh8qF6Xc2cg+4QyU5X5j/PdNSsaUfRZHde0Ro69xSukHJ2DNR?=
 =?us-ascii?Q?y5pDASpl/sD9QytUkqTR4Fw9Ts4Cb8Qsf3aTeSh2BtlS35PS8Dy1yILxfgdF?=
 =?us-ascii?Q?bCzlE1+fgBeQvhwgoni+CL1k9+n3X+6BWTDEWUteR+NeUn7sZhJYWc0HnX8X?=
 =?us-ascii?Q?nR0Wj21YsYLHJPj7KWtafrsGCC4dKwcEIxmk+MS+TibQ6j024FFetKI4t0vE?=
 =?us-ascii?Q?9Dz+ohLCSzsE1XZcUC4TGAfaFO4Bcanrzgjzq55R1Yd1zGSORODZb4XC4I8X?=
 =?us-ascii?Q?W2cfcKuv0bldQumOMYKf+mrz8XNGuefYTcrgMbQeQynD8rF6YHwpSFxfuHPJ?=
 =?us-ascii?Q?kJrZhAfn/eJ7qiQxvekMSNgdxt4P/4rJPkdthBixKnXvaOHDeqZ8ExYcCAen?=
 =?us-ascii?Q?ZB2M8pWZTX17yvEWL+v8A45i0QVkl4I+cIEWAcSwJpx0D2xghv7AIThNnoXK?=
 =?us-ascii?Q?WV6vBG5m4RHk1tUebh9aHyXE1gIRr+3LULXwdOOyxZCJfSeXyAoGdNjgca9d?=
 =?us-ascii?Q?hcH49emTsqG5PMyH2HDxacuDWoWtCro4t8+lTgxBAzHkkrHq3iUyBR18f15x?=
 =?us-ascii?Q?MIfdfvpT7xkuwjiB+Ntjdy8RnxdEKgU29vex4YlysVazqVzfetsdmoXwPoN0?=
 =?us-ascii?Q?NnZtElQ1cl2nqZf1CZY15uBgsjP8Lgad1fRa0RhWYwa6HcYqgKOOogmj7VXO?=
 =?us-ascii?Q?q3n1wwvnhMgjq4TykPerCu9sJANdhQYmZArVWQsJWpm/pCK9+8EkO+GM2L7V?=
 =?us-ascii?Q?Th4H+Mh8F1ORy4962p6RH6eci+H/g0ZZDWMsXLfuGSPMmr8LCQ90AzF5G26S?=
 =?us-ascii?Q?HH30bESdWTSCLzHbtjNFmCsFYGWCHYdoqYH673kkUtDyH1XE9MIwzJ9n8+So?=
 =?us-ascii?Q?H/ICo4xHaKDTdVXT9mJWDnSw93ze/R0dizfyRGnk4OBa53msVYUzOTyFr/xL?=
 =?us-ascii?Q?rRTkCXxjqnT6rMYImtRHHnJTv2mHCOasLgzY0rUa97aFx15sBeU3VlcseOqB?=
 =?us-ascii?Q?49IM1R3uDJ9yy+LoHsWutK8Jk5AMFpVQfeFapMSUUSfxV+i6C8jp8IPJMY30?=
 =?us-ascii?Q?8LW3SWOtNYmDO8bcDhX6Bq+SVYiU09SCZ3+EI8Bn+gW9x3bH6bLYt5hZWs40?=
 =?us-ascii?Q?apE36uWjeJK71rLxTpVxyDah0RAZ+8mOIdtzdy4LDygn9DOVwLVSfy4o+C1V?=
 =?us-ascii?Q?hVPT6qtd6fXFf11rbJKoJJArH1GCnWJO/KIMzZLpGt3qyxqd/7iiIVb0eAo7?=
 =?us-ascii?Q?Go8oaLuBhQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4be6758-912c-4c45-f9de-08da48d9c277
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 23:02:13.7516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZ4G/IhI6UcCTNeb4wmuoMWkvAL5uykXxk1fHwNuihXgDqA9dTadq8iquzM6Rgx6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3593
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
Cc: Christoph Hellwig <hch@lst.de>
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

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio.c             |  42 ++++---------
 drivers/vfio/vfio.h             |  14 ++---
 drivers/vfio/vfio_iommu_type1.c | 103 ++++++++++++++++++++------------
 include/linux/vfio.h            |   2 +-
 4 files changed, 83 insertions(+), 78 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index f005b644ab9e69..065b57e601bff7 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -619,6 +619,9 @@ EXPORT_SYMBOL_GPL(vfio_register_group_dev);
  */
 int vfio_register_emulated_iommu_dev(struct vfio_device *device)
 {
+	if (WARN_ON(!device->ops->dma_unmap))
+		return -EINVAL;
+
 	return __vfio_register_dev(device,
 		vfio_noiommu_group_alloc(device->dev, VFIO_EMULATED_IOMMU));
 }
@@ -1077,17 +1080,6 @@ static void vfio_device_unassign_container(struct vfio_device *device)
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
@@ -1123,15 +1115,9 @@ static struct file *vfio_device_open(struct vfio_device *device)
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
@@ -1171,11 +1157,9 @@ static struct file *vfio_device_open(struct vfio_device *device)
 		device->ops->close_device(device);
 
 		iommu_driver = device->group->container->iommu_driver;
-		if (device->ops->dma_unmap && iommu_driver &&
-		    iommu_driver->ops->register_notifier)
-			iommu_driver->ops->unregister_notifier(
-				device->group->container->iommu_data,
-				&device->iommu_nb);
+		if (iommu_driver && iommu_driver->ops->register_device)
+			iommu_driver->ops->unregister_device(
+				device->group->container->iommu_data, device);
 	}
 err_undo_count:
 	device->open_count--;
@@ -1380,11 +1364,9 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 		device->ops->close_device(device);
 
 	iommu_driver = device->group->container->iommu_driver;
-	if (device->ops->dma_unmap && iommu_driver &&
-	    iommu_driver->ops->register_notifier)
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
index cb2e4e9baa8fe8..4a7db1f3c33e7e 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -33,11 +33,6 @@ enum vfio_iommu_notify_type {
 	VFIO_IOMMU_CONTAINER_CLOSE = 0,
 };
 
-/* events for register_notifier() */
-enum {
-	VFIO_IOMMU_NOTIFY_DMA_UNMAP = 1,
-};
-
 /**
  * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
  */
@@ -60,11 +55,10 @@ struct vfio_iommu_driver_ops {
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
index b76623e3b92fca..c22d3f1e13b66c 100644
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
2.36.1

