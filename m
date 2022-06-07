Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688153F301
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 02:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31EA112A7B;
	Tue,  7 Jun 2022 00:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C06410FBCF;
 Tue,  7 Jun 2022 00:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htixEmNFa+Jl0FItqT3vyjBkvuUKePzBMxUJuhGYNxLFvT2Rlm/p00ov73D66QbWPdL5l4O9SLmYfpT+WH+DrljGqNUjLeVDQX0oIQnU4Hv2UiQ9z9qNX0597e13bF+zRS8PiP2dHW8ykVNsVP1QChrw4ZuzG2W/A6Wo66rkttHN23ta6yrl7kz1AJmmfIiE722jBts5omKB2l8+1TWo33ccwfUk3NHQaCIbGSi3DKya5VdkOi8uGyw63X+tteLB+6X7AHSNzwzeVI/m8G043ANekNP2TZKp1AJ32KrQP1dv+FS/xxJa/tOm+rVPLFcfabpxVC/4c6ds30LB79cNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPtpXOYcanPo+YHfXSQeObx0p/KhPykFgGq5MYH9ekQ=;
 b=Mj+6cABbOmbnLk9ikNrgIlsJ+zXCQkDNH+lvRVc4CAQkInGR6w4xRHd0Czhb7DHyoOxP3p1son+mp+ocVChXcm4UUcCzBPNavQkUl2VrBIe8XL6QzJzlz2JAZOJC2LUuWfTIMbfCHR5RpvKXeUsXlxCimOlfEuPjlx1zPtcdyFPEDLOEsJB0gWwXspUJuMWr1l+px1V2zM8IdoHcfuAg39VvjvRU7ZuX5+BDaDMI3Oug3Q9pFw3aJD2HwhwMMyh39bsqXg8nMCIJYGHRY7k5jnudCcGgzNdNnCxXhkmo5+W8ZHoHfcxThGwnPValMU9dXJWr3aKNbauTdC5xZN7ifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPtpXOYcanPo+YHfXSQeObx0p/KhPykFgGq5MYH9ekQ=;
 b=egtcbZN3H8l2sNb931qHRZ3G0w0/GxSfugV7YSFGGHFFGL7uvCm4zvDWTWX1ncvRYnRPJwiIT5knWI622HeDnI35E3zbF9DberyfBkwJ9jVl5J78j8Bau6p8do7Z++dALc3lIt1azjr93slGoTZpuaJy2vKsoc5TIM/oL9UUuZ3yDi5mdZKvsDGKboZd0IlO7sPgjoaIkjyxseTxC71e8dinCEWs63D0hKX4+comCHfqgGpbnsrYPQMW2tpyyu5aF38e9haeOZ6p6od8J2nM2lQSafkqr08CfhGmVFRs8qIiiWg81SRgp+zO7H24gGg88SaMQHAZcDsRkLuKe6dEpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3758.namprd12.prod.outlook.com (2603:10b6:208:169::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 00:34:38 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 00:34:38 +0000
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
Subject: [PATCH 2/2] vfio: Replace the iommu notifier with a device list
Date: Mon,  6 Jun 2022 21:34:36 -0300
Message-Id: <2-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <0-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0009.namprd12.prod.outlook.com
 (2603:10b6:208:a8::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffc67675-87a8-4d74-680d-08da481d808e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3758:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3758838F674E2DEA5596DC95C2A59@MN2PR12MB3758.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FBRJa6FOopQegvGgGbse9kq8eeJs0vFxqDxqboipZVnwiO4oHl9H5UJMKwlC7V5q146HhrgRPq/JWE5O+E6bIPDuRnsfxbKcSbHcX8br4zW/n74aFNmKNIYkb1vYPLUxyIGEtEVRrZv/QrjVTcSyBskuoHvA5v9547RS19x4nTr8zulrd+bYdtvuPmT8uMY7JD3BgtI9pcwai5nPmXUa7LjTX81ERYbY+ku+p8kGszn7hOUZoKQ4UqquBkDk0fUwLdz9QMlJMHTPyFDlVwtuqeepnyUZ/sEHP1O7GG6/fGfBOsQu3O5xpAfflbf/xqAyUfk+1F1YwUOgHId/DViYS/TdKUh15tLEFNzEJ+D22RTNdTAumgYT+2bZGqeQOBVEojOFlRNQd+syE7i4xsOEZgXlU+xlluO4emDx4xUO5vYP7tfzQbCRXlemKFz+zzjnAazPGAHgkYxRfyRYPTmD9Va6HKreeoIUzxm8Es9Kc828bZKi0fGAC1ACd3QjxGmdl66EHn5k4VnmM1cMrjWl1u0fCWmkbVPG96BLSXocfzZO1Tu9BY44Lr03rly4Q5sWAfWJsxB8cdk9gzlDmNvbmP8rBilD6V3UeJUBx7pSbnMhm8gmzBOiE6TnCTpjTD8IAUZ/+UypAq55e0bfPhSAnl1E1+F/Bj8FaoBSNvGsLw+yM/aegKqZ4wOT+8OM2qHMsswrBiZEESnWYkKsG7EHNeO206Pp6WM+JzhQxfaFs5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(66476007)(38100700002)(66946007)(86362001)(6486002)(4326008)(8676002)(7416002)(2616005)(186003)(8936002)(36756003)(2906002)(5660300002)(66556008)(508600001)(83380400001)(6512007)(110136005)(316002)(26005)(921005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H/EQVjirAjrfX4htvyo5n1hX81dFnDsykdQGMVkNwcpjyLS06UAZUejGVqMg?=
 =?us-ascii?Q?7nYY6lHSbBdqXQBx0sAhsl8bYOo07rrxims2T2M2SzS3j5DosXdCZL87f/EP?=
 =?us-ascii?Q?fjkXeZa1JNFgKNx/Srn1Yo1xrRCzJnYwThJK6x4cWJLBspY78EgIwkXF5ZfG?=
 =?us-ascii?Q?UQ4vY2f83uvcv3wYCPpJDbHIPCt/HfF/CJLCBvlZK+6/JLMb4hN9CZCdh/t9?=
 =?us-ascii?Q?l8f9A6mH4MXULpshuOm0iKrXIzutX+ZsAeOo8E1/+4dVyci7opT5EjZbbwbE?=
 =?us-ascii?Q?LLXS9y/6OWqLFwKcBLsR/0R7pqVUrs5Ii7nW7zcZl0LswLdy3MO+nQL2enos?=
 =?us-ascii?Q?Ob8jGkH9q83FneMvJlOUpTYIhUmIsui0ww3EiHv11rSxyYa1XY0wKJdUGWjn?=
 =?us-ascii?Q?fhSKwoKK1JbGP3/LSwClkyak1e61YfXbvYJIrxuDhd53k71NWPdxE3Zxm1UK?=
 =?us-ascii?Q?aAC07bWAWEHJ9tj1clhhB8fpVBAuIcWwxPWTXRVW+QtnOFh7jbHoB2JtwcrT?=
 =?us-ascii?Q?a47j2llZ6aPwM5GosWLjgeBJQqhx7K4I13XZKt5+Ps2/UmhllQnY9ISzlP7q?=
 =?us-ascii?Q?btPquFga9b64yrrsLp+HnrIsjrrTTbtYoriwwQPnQua8r15x8NlwO1KGiYly?=
 =?us-ascii?Q?IIaZJ7Ply43WXzUkZA4+inOkExUMKfWYz6w2EFV9FxX8PZw8p5A+Jg0GtL2U?=
 =?us-ascii?Q?E+7SJ2DxQfefrFkxpAGOkwvESkYyTuS2M4iVxO55RGc65CPVpMco+NRhinxR?=
 =?us-ascii?Q?RNqBMjZ1PvHm23zQFcZK1oVshG+3JPq01dk8n72yHjOJjhaQdrtyOGGK0AUO?=
 =?us-ascii?Q?gDbKYpStWW67GXPxqVHgpb8xZ6Uzxradb6bv2f9yXPqtQ/0mFNVtxg8k+c80?=
 =?us-ascii?Q?wouRE/PQGBEDSvfrR/YIKnyFTpuNtZaaLzsbHTpU5EXLntOFRzVM9XOzMW8E?=
 =?us-ascii?Q?ei/SkKxznB1n5Vxrf2FM+3HOVJJuzWnWPjm7hPdHjEqURrLC8zjtqVhktBwq?=
 =?us-ascii?Q?AO2eBhfmgT7wJqrxoy1CPOk1smqs9jQNerdnjVH06RLPzlczo1XNl5at8t46?=
 =?us-ascii?Q?c+QqDalkS3Bgbre3Fv2WmIiV3+nrqH5s6Y9IDqXAvJ2SR9HRmT9hQqBmPipI?=
 =?us-ascii?Q?j5jwcPjgorznFn6ULgYP8A/tsbHyZB44WoQcR3SRnHHDcbjyhRaKF006+6jY?=
 =?us-ascii?Q?JJ2LO+bK0gHfKKyReciCDpHitNStIep/s3rQ0mEiT3UtVqXnoZStxX/1qj9+?=
 =?us-ascii?Q?dVl6fqcVo7Furr3Pr/TIg4yUjDkdiqNmZYYXsynipu3L52+0pKRC3ky3tyhh?=
 =?us-ascii?Q?IHZ/lRUVM9ke9VQA+aMwac9KU4fZyiRYCL3yWEWRAF9DI1r9EpZ0h9hb3xgD?=
 =?us-ascii?Q?KW/+lj6vTGxg3Y5X4jUCYmtCn92SrQASiiz96mnTfi6w1lqBfgKMpDVI9jNO?=
 =?us-ascii?Q?w6NlWGt8jcYOWynufnpnQXwccd9S4v/LiKBr/7MYWdCnbY84+sy3eiYKEypO?=
 =?us-ascii?Q?tXjTi2xGocdeGNqLTUgwF9t79nUELJi5N9Z0c02/9+yTB7N+ME1vzDDBZi2j?=
 =?us-ascii?Q?cqb88WZ0Z2Cjxl/mqRkBhjlAVIAQ3eekx9G6DVu3WSiAFcDeuw7ypAwZPr6S?=
 =?us-ascii?Q?Ry/W+PJDjgxExyxR2cXjdffpFLSndFeGm34t5wHHM/hL7EBMqzdOag/o6It4?=
 =?us-ascii?Q?Oed6uPTkRhKOsdrJiEly8/NfslkAiNcEeLhKoYtTm8fpW5AVDrsbAKHk5y5q?=
 =?us-ascii?Q?xGkpNioenA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc67675-87a8-4d74-680d-08da481d808e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 00:34:37.7070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4HZblzn8YvgqeXrZyMCRqYjGTULeChZG/NG/TNSXzFU5lP8AD62z4lyHKW3Jx4p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3758
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
 drivers/vfio/vfio.c             | 39 ++++-------------
 drivers/vfio/vfio.h             | 14 ++-----
 drivers/vfio/vfio_iommu_type1.c | 74 ++++++++++++++++++++-------------
 include/linux/vfio.h            |  2 +-
 4 files changed, 58 insertions(+), 71 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index f005b644ab9e69..05623f52e38d32 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1077,17 +1077,6 @@ static void vfio_device_unassign_container(struct vfio_device *device)
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
@@ -1123,15 +1112,9 @@ static struct file *vfio_device_open(struct vfio_device *device)
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
@@ -1171,11 +1154,9 @@ static struct file *vfio_device_open(struct vfio_device *device)
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
@@ -1380,11 +1361,9 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
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
index c13b9290e35759..7011fdeaf7db08 100644
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
@@ -1406,7 +1407,7 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 		}
 
 		if (!RB_EMPTY_ROOT(&dma->pfn_list)) {
-			struct vfio_iommu_type1_dma_unmap nb_unmap;
+			struct vfio_device *device;
 
 			if (dma_last == dma) {
 				BUG_ON(++retries > 10);
@@ -1415,20 +1416,25 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 				retries = 0;
 			}
 
-			nb_unmap.iova = dma->iova;
-			nb_unmap.size = dma->size;
-
 			/*
 			 * Notify anyone (mdev vendor drivers) to invalidate and
 			 * unmap iovas within the range we're about to unmap.
 			 * Vendor drivers MUST unpin pages in response to an
 			 * invalidation.
 			 */
-			mutex_unlock(&iommu->lock);
-			blocking_notifier_call_chain(&iommu->notifier,
-						    VFIO_IOMMU_NOTIFY_DMA_UNMAP,
-						    &nb_unmap);
-			mutex_lock(&iommu->lock);
+			if (!list_empty(&iommu->device_list)) {
+				mutex_lock(&iommu->device_list_lock);
+				mutex_unlock(&iommu->lock);
+
+				list_for_each_entry(device,
+						    &iommu->device_list,
+						    iommu_entry)
+					device->ops->dma_unmap(
+						device, dma->iova, dma->size);
+
+				mutex_unlock(&iommu->device_list_lock);
+				mutex_lock(&iommu->lock);
+			}
 			goto again;
 		}
 
@@ -2478,7 +2484,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 
 		if (list_empty(&iommu->emulated_iommu_groups) &&
 		    list_empty(&iommu->domain_list)) {
-			WARN_ON(iommu->notifier.head);
+			WARN_ON(!list_empty(&iommu->device_list));
 			vfio_iommu_unmap_unpin_all(iommu);
 		}
 		goto detach_group_done;
@@ -2510,7 +2516,8 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 		if (list_empty(&domain->group_list)) {
 			if (list_is_singular(&iommu->domain_list)) {
 				if (list_empty(&iommu->emulated_iommu_groups)) {
-					WARN_ON(iommu->notifier.head);
+					WARN_ON(!list_empty(
+						&iommu->device_list));
 					vfio_iommu_unmap_unpin_all(iommu);
 				} else {
 					vfio_iommu_unmap_unpin_reaccount(iommu);
@@ -2571,7 +2578,8 @@ static void *vfio_iommu_type1_open(unsigned long arg)
 	iommu->dma_avail = dma_entry_limit;
 	iommu->container_open = true;
 	mutex_init(&iommu->lock);
-	BLOCKING_INIT_NOTIFIER_HEAD(&iommu->notifier);
+	mutex_init(&iommu->device_list_lock);
+	INIT_LIST_HEAD(&iommu->device_list);
 	init_waitqueue_head(&iommu->vaddr_wait);
 	iommu->pgsize_bitmap = PAGE_MASK;
 	INIT_LIST_HEAD(&iommu->emulated_iommu_groups);
@@ -3008,28 +3016,34 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
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
@@ -3163,8 +3177,8 @@ static const struct vfio_iommu_driver_ops vfio_iommu_driver_ops_type1 = {
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

