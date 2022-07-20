Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3957AAC7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 02:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243CE2ADE0;
	Wed, 20 Jul 2022 00:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863A42AC49;
 Wed, 20 Jul 2022 00:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8PE1e7FNonsLnELSkAIlyCvw1+3a9oUVZzMvlZupQXvruDTFhjWlUzkr9zI4quJCJ6d2Pxqx+7Kh3wBMri6UTVVUhbUlWnYofnFgzpooNYiFYBIvB/HBDVYIyudKElLNaHcZn8byakvmshAZTP9X+UMgTh7jUAFkiOZIa6sfjrVbA3ljfM1UnJDgtGLIz7gfFKcWoNMQlcwDrPF3ec2IzQnN2wOzW3xlfGns43yqin4uCJ1QRuPmUtwP3NxpkuGufANyBrcDAnsK/9lKIxZ2zVNJPCy4i5Qbv8gfd2o52usPEfM2Sg58MBGR1c7Nj5j6q7vZPu+4ibvLUxWKUL2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jffTCUoVGTls3WpNqwvEq41XNytvWwdXld3D76fDWG4=;
 b=JYvo5uqScte/UKZy73ISANGrY5JmabP5/7NGGwRCsRgnd1PwtDKxdXEa3EV/mXy6VO8+K/155EkyRBYiw6FzuyivPznU4JBPlYU5alJT51hi/ghvClm1QKbhxCh0jTELmZ0c61Ox71F9tqHpLYUBmFgOYENEhj27BCdRNzzRBqGz7luC9tbaql/5z6w+JUfsiy9bgSAj/r6xsooqlhRSUNe2L+hSXBTDMkd5uhcgBzXuplUk+IOep+3nWmaT+TSxc2n6vKu56Dcx9AFqjR3w7r/ye28wSzpIwxG+AhWmrYMnrDxEsdxkjL2FTun7TRMz10wePM9CMHP++IxnyMBjzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jffTCUoVGTls3WpNqwvEq41XNytvWwdXld3D76fDWG4=;
 b=Mv7lyTqnUwYxKthLc6EF9Wf2qIQ2dpMmydDh/DLwXPWIk4uJ6TiED2OmQlqJcbG6SSMOo9UOEmZCCX4FXM2CP8at27VccQLwdXLv5Fyw0cGDhIgK8aAFmyOfMyXvrWpydE53qsjZVtus9mvRSCWxK+2PJo/1AsztT4TltQrd2n+os0jBWMq31aRXv9VtfFaPaCtjVZUpbt7YYCbOLLIOcHqBPH7rWgVv62dx9mhcZLJVm6uTriZbAdeM6Me0+VCpLm6VKkojCyEGMu8Sc8eNl0/WfFrqQy+k56twQbIqxIro21offFNaCxybVs1QZErVJKXvZdVqnko0o9WtLntWuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3134.namprd12.prod.outlook.com (2603:10b6:208:c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Wed, 20 Jul
 2022 00:02:53 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5438.024; Wed, 20 Jul 2022
 00:02:53 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v4 2/2] vfio: Replace the iommu notifier with a device list
Date: Tue, 19 Jul 2022 21:02:49 -0300
Message-Id: <2-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:c0::39) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2fcfbe2-a0cb-4344-8570-08da69e32ff2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PmCVVvKq88vLVZc++YJxiGM9LuJT6TCZ03oma2twpVSeURWNCodKvafSdOtYLTmJPe2u1kxF+CEbYW/j8ceFg1rYS0McoF5M4s0MaJx1lu0eshbhe8cGIxj2S4Sg9reRbVK+EhgebF4EbCUKmqoSRY0E9ZvaU30tHE/pyRWl0d5aNR2WWbHLpgHffLXeAjv9RkD+phE1gg16BKSMeSCqfaYgYfhoZkoHom/WQz+LE8l8w299ChqLzKY1JuUYba5npLfl2Rg135ndyAfwrMdc5RxZ04t15AhZ/UXk/MUrxisUpYXbNRg0XAOV6vApxJi6ZWNlEX9491aqZWQCkJMUPd3QS8giwWKwC5tcx5JO+vYjNzwIa07jrttFRcnpuKN6aTfI+uDmWHhGgKwoXzVSfmdMl9syXM4SA4dOnpHnZs+L7D1XcCKnXDvaVuOfJGrOrHSUDWbMiwR6a2Va5MBWPJZa3w5QRED1IGhWJSRG1ca4XZkoAC3LiuzfQeYq1PdmFma0K1bss1IiAjE3joxHkoGnzMS48cJltB4dJbiaLiEVJEu91w+ycUZpUwMjxcPzAW028ls3lvz2JssSTJodywje+vtajxhc1nXobVcv8AkENLvRwEUqywzjd1K2dYgXFepH3P3gkBIGhSeE/MkvTWgPhTOJmg4P0/ytvacWru4lQx8GMak2Tjw23VRAFUWf4BAFcvZvL9O1mMbfOzQT3q1OR165kfT9SsBZSl90TwkcEtM3M54rC2qqh0KPfSynCuhAM0oOg6qTyBA0i4fB4rxZc/j/LZq5WuGr4UUBqqaGxzXemP76zmNCO57lqE+H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(36756003)(83380400001)(86362001)(186003)(921005)(38100700002)(8936002)(6486002)(41300700001)(2616005)(26005)(30864003)(54906003)(2906002)(7406005)(6666004)(4326008)(6506007)(110136005)(478600001)(5660300002)(7416002)(66476007)(8676002)(316002)(6512007)(66556008)(66946007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jj8jtYAcEzlq0x6/6RPDBRtmJ01bZMPixnB9wmDijS4o9X8KShF36G8szfUn?=
 =?us-ascii?Q?DvHq3BOnFfwDo9RjlzXGGv14lMtXnI6fExY6oodyNf25gg+95CNamlTzfhEr?=
 =?us-ascii?Q?AQNad9dLG5msq+hQuWH9zaqT0tGV5VO7q/FVUGCRcz69C2SfutWOQdg1SVtY?=
 =?us-ascii?Q?DC/pDmjzRU2zD6AYWmLNaHHJ9lQ3A2pfDaNPM5v2Co7Up47UCIXdC5S995aF?=
 =?us-ascii?Q?mvPYwZx7324oR+SbCvSWSmJPU+j5HI45fV5x2Ir0A/0MVvq4BwwX5UrXUorS?=
 =?us-ascii?Q?v8ASdJOo3xGGpOAOG7y/ApR472ORWuAXgiFp1ktHt2T1z+hGngr/bsJmWGs4?=
 =?us-ascii?Q?I96iQnLUlMHKjG4J/nSbx+AfoFQS0mutAZ+HqHX23LIPlIwPoaF+b/fflN5T?=
 =?us-ascii?Q?GznRA/O128ZzKMx5FiJKzIqgTakwho7SrN2tUmIhkG3RELqIo9g+uSu4ZnaI?=
 =?us-ascii?Q?m+30lJ0ot09Myhk3XPq0VM3b1/ow+0smEC5CochCquWgcw4zvqLs6ofquhNz?=
 =?us-ascii?Q?ZFJeROVvseIf0agAO3t/UnlC+VuR4bzFkv69RwT4jEnikvBg1HlRdi7jjnUj?=
 =?us-ascii?Q?dP/vJrDVKvaT4KYqZDZerOaLJbRpV0wzvTle04vKd8a1fnTJQIjIjaMeOlg1?=
 =?us-ascii?Q?tQgeKzhfr+Tj7FdEtUyuuoxxMsPXYLw9+K+sAGJk1SSfINRlEpnWENKVALCi?=
 =?us-ascii?Q?78xIMb/XTA4NnGkk+Hw/ToAgwTcGiXmdPaA8NlUNJkZCibxG/ydOuOPHrrlQ?=
 =?us-ascii?Q?TRky6uSaCAn6++mx9+U8Yrm6esDHvPkOOkwHaBPwsJJiTm4LCwufD3A3qnji?=
 =?us-ascii?Q?XDNG892r5SSYTYeJm7oiGBirkLiGf+/vCAh9Xzv6U5WGA/MnpOESSKQYZsBM?=
 =?us-ascii?Q?s0BU1eG+5kTX6jYpJZe0+ZvXptGkTLQr62D6UxltqrxR2WO8Tc8BDlxQ1Xnh?=
 =?us-ascii?Q?bdLqslXNKswZTCrNg894TbeUDXDTkDNp2aIGwj0DJp48jxRqlGdZWs2s0a1l?=
 =?us-ascii?Q?OlY2lVXAFKZ5Yx5nV9Tsxqz0WeLx7xeQYyL3x9dehjC1aBfJRKLMTQf3AcDh?=
 =?us-ascii?Q?7h62TCreYHLHR93vK+6SC0fldfXESYHY2ERBrF3fjTySaCL2mPflaVza+842?=
 =?us-ascii?Q?8yx81HkD0FJBWtWv9KO3Cx/LfoPvJZhpkqyZVvxLthfkLn4KcsmCOZ+ZAsh/?=
 =?us-ascii?Q?f0taN2rkxXZ0Sp4+aXt9XOaPL6WMPGe/VFZ7sGaCLnNNTdhm0bgWKuX49jkt?=
 =?us-ascii?Q?8eqdgNjUJuHSIjspCo8QqJYL7TskiJO/GjlCTGwSfm8f9nvHRZPPGcVGIGVR?=
 =?us-ascii?Q?4ykxM/rsGt5dQHBJ8IexglbdZrjoLzrS9+JMTKc9mIXHufLCIjIQpUfPG8Be?=
 =?us-ascii?Q?vyVvGYYutcxykzl/legBAKf26P9pRQn/+wf6qSGmHvl9OJDFEwkRae+VfJ1r?=
 =?us-ascii?Q?AP6rCKVMmE5kikV2k7QcqSJZVZYoPMpOrEuf/ee9/z1YnjphCkLzQ/Kp18cf?=
 =?us-ascii?Q?TfmRPUbvx5Jyzv3E/o+oUF/T9+r5d4cRt5YyWmqTkXjX45gsn6opvE9LXVLa?=
 =?us-ascii?Q?QfrGJ5Ev/sTInL3kfy4LQcyPMmOcxhOChHlnmHq4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fcfbe2-a0cb-4344-8570-08da69e32ff2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 00:02:51.0838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wz1J+HKpJBiWaOID81uB0MwG8ZqfdBHucEuvz7or/4ZMyMm8/fj7RrnWJgRUzu+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3134
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
index 83c375fa242121..b3ce8073cfb1fe 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -231,7 +231,7 @@ int vfio_register_iommu_driver(const struct vfio_iommu_driver_ops *ops)
 {
 	struct vfio_iommu_driver *driver, *tmp;
 
-	if (WARN_ON(!ops->register_notifier != !ops->unregister_notifier))
+	if (WARN_ON(!ops->register_device != !ops->unregister_device))
 		return -EINVAL;
 
 	driver = kzalloc(sizeof(*driver), GFP_KERNEL);
@@ -1082,17 +1082,6 @@ static void vfio_device_unassign_container(struct vfio_device *device)
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
@@ -1128,15 +1117,9 @@ static struct file *vfio_device_open(struct vfio_device *device)
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
@@ -1176,11 +1159,9 @@ static struct file *vfio_device_open(struct vfio_device *device)
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
 	up_read(&device->group->group_rwsem);
@@ -1385,11 +1366,9 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
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
index db24062fb34335..026a1d2553a269 100644
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
@@ -1400,8 +1430,6 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 		}
 
 		if (!RB_EMPTY_ROOT(&dma->pfn_list)) {
-			struct vfio_iommu_type1_dma_unmap nb_unmap;
-
 			if (dma_last == dma) {
 				BUG_ON(++retries > 10);
 			} else {
@@ -1409,20 +1437,7 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
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
 
@@ -2475,7 +2490,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 
 		if (list_empty(&iommu->emulated_iommu_groups) &&
 		    list_empty(&iommu->domain_list)) {
-			WARN_ON(iommu->notifier.head);
+			WARN_ON(!list_empty(&iommu->device_list));
 			vfio_iommu_unmap_unpin_all(iommu);
 		}
 		goto detach_group_done;
@@ -2507,7 +2522,8 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 		if (list_empty(&domain->group_list)) {
 			if (list_is_singular(&iommu->domain_list)) {
 				if (list_empty(&iommu->emulated_iommu_groups)) {
-					WARN_ON(iommu->notifier.head);
+					WARN_ON(!list_empty(
+						&iommu->device_list));
 					vfio_iommu_unmap_unpin_all(iommu);
 				} else {
 					vfio_iommu_unmap_unpin_reaccount(iommu);
@@ -2568,7 +2584,8 @@ static void *vfio_iommu_type1_open(unsigned long arg)
 	iommu->dma_avail = dma_entry_limit;
 	iommu->container_open = true;
 	mutex_init(&iommu->lock);
-	BLOCKING_INIT_NOTIFIER_HEAD(&iommu->notifier);
+	mutex_init(&iommu->device_list_lock);
+	INIT_LIST_HEAD(&iommu->device_list);
 	init_waitqueue_head(&iommu->vaddr_wait);
 	iommu->pgsize_bitmap = PAGE_MASK;
 	INIT_LIST_HEAD(&iommu->emulated_iommu_groups);
@@ -3005,28 +3022,40 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
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
@@ -3160,8 +3189,8 @@ static const struct vfio_iommu_driver_ops vfio_iommu_driver_ops_type1 = {
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
index 1f9fc7a9be9efa..19cefbaa3d06a0 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -49,7 +49,7 @@ struct vfio_device {
 	unsigned int open_count;
 	struct completion comp;
 	struct list_head group_next;
-	struct notifier_block iommu_nb;
+	struct list_head iommu_entry;
 };
 
 /**
-- 
2.37.1

