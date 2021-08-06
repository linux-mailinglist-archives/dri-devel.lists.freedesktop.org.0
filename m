Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6C3E20C6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69166E91A;
	Fri,  6 Aug 2021 01:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709356E8F4;
 Fri,  6 Aug 2021 01:19:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjXkJWdxIjCAKj6zJo/fhS6LWlFvP69UJvXfZj5kaiq4Z0vdNVJC5B84Tpz2xh+QWWV1tphA5MLxLZKoG61he2gZ+xBNb6BqwP094rEa8CNtUudvB4sk9gRiWiYA7SbYGpYen9nP42tx6jnLg0Gk1yxOUfY2d4OEzyS/0jCMoylXX63WXTV0rhxtPI8FUPlvO+oWe5uVpvL1SkONas8A6hoRci4Q2XozaxIhh2bc5PCA+Wc1Bwf83PkJH6meWL1bbFNh1oRLE/2DVR2y6lQ2Q+YjCvXIfEVojNT++YLsAP9Z5rSz6X211SpHjf6k6A7uSwxLDhSXekl6gPFKmgct4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lHTCfphAoVvXZILRSkEZFpws09lwRQSHBYMOXPAZM8=;
 b=JKtu3hphfBuLEcJieHABW1eeyoAbdEZOYRSFFMzUKK14M3oqR+bexUyFtHsrJyo2/v9Oh0lsZB9zyDcvAXXgYq1eib0SlNb4XxpiJQ1je3mDxfE5DLy8vwbPpf5T492Bnacdl8ruLj1Ga7TofacszxlYoFPoWR4afplPxaHWD5rQIbZLiug8IxE1ofsiRGRIMgxbvjdks/QSerOAFWp1F2zPF/nJTU2QHqv8VEI/ga6KaWoMFP/myIQVgFQAQZe9fgYLy8ThsxysrKzhFbsKILpanM2zNr0osGtkMtUl/OX3IkiceW/P/vuiaNTc80hHU9sJAb6kYPoJLQqavPdljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lHTCfphAoVvXZILRSkEZFpws09lwRQSHBYMOXPAZM8=;
 b=BplQfjgfN1UfVw28lkLXrDEpByrE3tHJj9CRRzPoageDkio53WZCVougmo3wZ72mg+33QzxlaQ//KWpz11IOhKPd9lKeNwspny5HN6BDtLmhNUwgxydhkorkqSFiQMeENu++n2ldOd/Z+0eBwq4iKmZNwZ0vCvbneDrApg1jcEIqLKAMTwRZgA0HyWNBpvgqwhXQ8dN9RSeiZLQO9b+JsbBicLP/EO6GmIMD+ItuyaSRPk2kwSFSbllCGaup6WaRnVluF7fiUVNdRyvpA3IlcG369Y+28Lcg1Ps4hUSeUMl5k/KtJLJyroyTlCmRFpuYE/mkFm9V+TKbxuOjGKk0Aw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5507.namprd12.prod.outlook.com (2603:10b6:208:1c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Fri, 6 Aug
 2021 01:19:12 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:12 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
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
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v4 04/14] vfio: Provide better generic support for
 open/release vfio_device_ops
Date: Thu,  5 Aug 2021 22:19:00 -0300
Message-Id: <4-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:208:256::24) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0019.namprd13.prod.outlook.com (2603:10b6:208:256::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.16 via Frontend
 Transport; Fri, 6 Aug 2021 01:19:11 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt73-2r; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 990f019d-e778-4b6a-d7f6-08d95878329e
X-MS-TrafficTypeDiagnostic: BL0PR12MB5507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB550719D490CBD95CAFB28EBEC2F39@BL0PR12MB5507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwmZ02RnVm3TNix2zV0kDAl+yxIGXx8v9r3ChDBPJ2ljXhtM9q2P7ywQyY9z1mzMwVuGLul8p1mQEla/HOLuyYK0RLOlFWZeB0JnO85Fd8xVQ5F/CHcHjRzK2wjwjB+wzEiZamUqaknwGfhAaYK4cts1y1wP5HvRmtzpSKlkzIuKFIZAASJk5LMc61pyNB0YbjUs6yKEonu1dKWKcdaZZOaKB+Z0lOTKURylZAMEsVA5CfGwuHF6oIsBLKsHRMZAUPTTfATz5CY2YkAOTLlOiXo6dNYUhq89N2nL2VRz12usBENgg18PxRqYpzmVuzqjpOWOQJkyCH1BSsYqKM/GPrrCkVz5Rfaf4Nq5Xz3mJyRX5II8MYWV6njor37x5HjXxY5lS/0zc2xms9zU4VdL0h9CARRT+ABJZD75rx/xKLkrPUFW+FPPF7WjHyFmm+jo246BcnxXcR+E64Bpe1cKbeCOXZA0eO+qvlHnQ3hi2uPcS8Ni9Ss0Use4erQYn4cfCybVnuhdQNEWC+8IMwbYTvPxkg8Qp92qaKVqflflFDWu4sqYQ1OSNWq33CQ6hRuQZuODVX7Ayxo7EAGoZxMK7n0tx2wg8XbwPR34+Fd5umi+5kFVoysYTMqOgtZaJv9wk0ImLBcQz+U2vyHpH/Mc2jtrua6nOgInd/DNWtGLtHPQnmyPFob1lGQXkQfSnk1+HWSzkpBlpzAkGQuA6nyLDGr/S19LglXTQMu5O51vJF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(4326008)(66556008)(110136005)(2616005)(66946007)(66476007)(316002)(186003)(426003)(9786002)(54906003)(8936002)(5660300002)(9746002)(26005)(6666004)(7406005)(86362001)(7416002)(30864003)(2906002)(83380400001)(921005)(478600001)(36756003)(38100700002)(8676002)(4216001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B9Hu7QLg9YoFfAMffKi6rbGWGBzoNaoA1+H+GRWy2IfJIepjLb14wG+5NBm/?=
 =?us-ascii?Q?sLDJg338A+RocTwfZsycmd+HBjcYtgie3I04M1KLtG4PP3PQEWRHGDk8t3+H?=
 =?us-ascii?Q?CjgSj8UyCm3sk22/CIHhNIRSPYBnF8WyncF9IKTtS32/Ij3hCxls9Z2UDpE3?=
 =?us-ascii?Q?NAot5JznGChdrrT+YVzlaYfRn1B3PVz/oz9QEhpwskAgvT5atPzBcBPVVhCc?=
 =?us-ascii?Q?VkWGAZoooSpiFDDZQ/+MeyC5emDOmYtruUHcVH5ZxPRfcUezbzdtkk+T4M4x?=
 =?us-ascii?Q?gpHwYyBkJgAuvjg8lxa43zMIL4GD/6p/O/JovRGq5eNtJ+5204y0Or1pLRuG?=
 =?us-ascii?Q?3UnX7TJL2U6m/BcqJwfXCEtxi6v7ACAS2jS+IFpXYUOhztctQYjJ56QrzOJy?=
 =?us-ascii?Q?6zkSzR0uzTDz1eNsaILouIDRoDKpPiqUrYYpIUp9Gm4BJyZ7osg00bZepbva?=
 =?us-ascii?Q?LrVRxfgZFus4TGDRdqWLw970IXJuj2J/rRCHkeY5hkNvRMoXjq5qO6FfC6n2?=
 =?us-ascii?Q?PMRGSzoq+KCAq46/GBZ+L0y4TeWEUgUQihin7myubcMGwHdQseEnCjvxz29H?=
 =?us-ascii?Q?yUObe+i2VwMDOiD7wDJLe4eReY33FAgxdj4FoXnIav4A+Qw0AxN5VOtM3W7U?=
 =?us-ascii?Q?NoHozav2rSOaVi1h/70dzE86yqXParsbIi+DCmi9jCWcPFwDAz3vijhe/339?=
 =?us-ascii?Q?b1AWIixHDPbsGsBQaSYBg/75JaylJZyZuhuhRmuqWivNkBfprO9haleVcn50?=
 =?us-ascii?Q?sSByQdtJy+HfrZS6U1/hpHZR2e3C6tkc0oGM0Gyg1630oKoQKGvv1b8gqMFa?=
 =?us-ascii?Q?nNGVHZBT9bM3sCvDhugyUo0Je6kumqiaEWT7tRVpEpu9nFKadZSyCLE4rWr9?=
 =?us-ascii?Q?+lIR8VQUQUOA0kwVzSISrfjJzoxIGRBlYAfEr+d6sjxztgfwGLPrxYUjQwiv?=
 =?us-ascii?Q?598XIm/3BWY78N9UJWjC36aJ4NqhBDwQbi3R713eKF3NgIHz/J67LYBQ7Vml?=
 =?us-ascii?Q?dRHkEGwyKB7TMloCtB9v3Nq7vsV9vq0H16x1s75cGIHZwh4bydS2BamOFDE7?=
 =?us-ascii?Q?DY3VDrQkgVyMcZpF2WpFX5eHEYU3M+Gn5FXH2rMhoVbgvK57X8Gg+Pc1zJ88?=
 =?us-ascii?Q?yuvhvHh5hKwYLRjy8sRk32wjuEUsHRYri47e4f/VkdZX7meC5DHwTqFCNqus?=
 =?us-ascii?Q?vcj4A/SC1IEU+xQzZenW3ScBaMPgsRjPFIGjREMIR0ADxzXIx0F8tCnq5HX0?=
 =?us-ascii?Q?0wsYhSh3q3+ZbyzOn9jirsLPwwmt86ZwKEF1kZwjFeUxNEhKtZRbPBU2YSRN?=
 =?us-ascii?Q?r04DX+7dkuqlLXG83eoutHii?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990f019d-e778-4b6a-d7f6-08d95878329e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:11.9769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSk0yUWHgF+7stlMgvw5MpiAgYxhFYJ/knvHkqJSjnfdFAiTgVZpZS6Cum1UzrfB
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

Currently the driver ops have an open/release pair that is called once
each time a device FD is opened or closed. Add an additional set of
open/close_device() ops which are called when the device FD is opened for
the first time and closed for the last time.

An analysis shows that all of the drivers require this semantic. Some are
open coding it as part of their reflck implementation, and some are just
buggy and miss it completely.

To retain the current semantics PCI and FSL depend on, introduce the idea
of a "device set" which is a grouping of vfio_device's that share the same
lock around opening.

The device set is established by providing a 'set_id' pointer. All
vfio_device's that provide the same pointer will be joined to the same
singleton memory and lock across the whole set. This effectively replaces
the oddly named reflck.

After conversion the set_id will be sourced from:
 - A struct device from a fsl_mc_device (fsl)
 - A struct pci_slot (pci)
 - A struct pci_bus (pci)
 - The struct vfio_device (everything)

The design ensures that the above pointers are live as long as the
vfio_device is registered, so they form reliable unique keys to group
vfio_devices into sets.

This implementation uses xarray instead of searching through the driver
core structures, which simplifies the somewhat tricky locking in this
area.

Following patches convert all the drivers.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/mdev/vfio_mdev.c |  26 +++++-
 drivers/vfio/vfio.c           | 149 +++++++++++++++++++++++++++++-----
 include/linux/mdev.h          |   2 +
 include/linux/vfio.h          |  21 +++++
 4 files changed, 174 insertions(+), 24 deletions(-)

diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index a5c77ccb24f70a..e12196ffd48718 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -17,13 +17,33 @@
 
 #include "mdev_private.h"
 
+static int vfio_mdev_open_device(struct vfio_device *core_vdev)
+{
+	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
+	struct mdev_parent *parent = mdev->type->parent;
+
+	if (unlikely(!parent->ops->open_device))
+		return 0;
+
+	return parent->ops->open_device(mdev);
+}
+
+static void vfio_mdev_close_device(struct vfio_device *core_vdev)
+{
+	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
+	struct mdev_parent *parent = mdev->type->parent;
+
+	if (likely(parent->ops->close_device))
+		parent->ops->close_device(mdev);
+}
+
 static int vfio_mdev_open(struct vfio_device *core_vdev)
 {
 	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
 	struct mdev_parent *parent = mdev->type->parent;
 
 	if (unlikely(!parent->ops->open))
-		return -EINVAL;
+		return 0;
 
 	return parent->ops->open(mdev);
 }
@@ -44,7 +64,7 @@ static long vfio_mdev_unlocked_ioctl(struct vfio_device *core_vdev,
 	struct mdev_parent *parent = mdev->type->parent;
 
 	if (unlikely(!parent->ops->ioctl))
-		return -EINVAL;
+		return 0;
 
 	return parent->ops->ioctl(mdev, cmd, arg);
 }
@@ -100,6 +120,8 @@ static void vfio_mdev_request(struct vfio_device *core_vdev, unsigned int count)
 
 static const struct vfio_device_ops vfio_mdev_dev_ops = {
 	.name		= "vfio-mdev",
+	.open_device	= vfio_mdev_open_device,
+	.close_device	= vfio_mdev_close_device,
 	.open		= vfio_mdev_open,
 	.release	= vfio_mdev_release,
 	.ioctl		= vfio_mdev_unlocked_ioctl,
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index cc375df0fd5dda..9cc17768c42554 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -96,6 +96,79 @@ module_param_named(enable_unsafe_noiommu_mode,
 MODULE_PARM_DESC(enable_unsafe_noiommu_mode, "Enable UNSAFE, no-IOMMU mode.  This mode provides no device isolation, no DMA translation, no host kernel protection, cannot be used for device assignment to virtual machines, requires RAWIO permissions, and will taint the kernel.  If you do not know what this is for, step away. (default: false)");
 #endif
 
+static DEFINE_XARRAY(vfio_device_set_xa);
+
+int vfio_assign_device_set(struct vfio_device *device, void *set_id)
+{
+	unsigned long idx = (unsigned long)set_id;
+	struct vfio_device_set *new_dev_set;
+	struct vfio_device_set *dev_set;
+
+	if (WARN_ON(!set_id))
+		return -EINVAL;
+
+	/*
+	 * Atomically acquire a singleton object in the xarray for this set_id
+	 */
+	xa_lock(&vfio_device_set_xa);
+	dev_set = xa_load(&vfio_device_set_xa, idx);
+	if (dev_set)
+		goto found_get_ref;
+	xa_unlock(&vfio_device_set_xa);
+
+	new_dev_set = kzalloc(sizeof(*new_dev_set), GFP_KERNEL);
+	if (!new_dev_set)
+		return -ENOMEM;
+	mutex_init(&new_dev_set->lock);
+	INIT_LIST_HEAD(&new_dev_set->device_list);
+	new_dev_set->set_id = set_id;
+
+	xa_lock(&vfio_device_set_xa);
+	dev_set = __xa_cmpxchg(&vfio_device_set_xa, idx, NULL, new_dev_set,
+			       GFP_KERNEL);
+	if (!dev_set) {
+		dev_set = new_dev_set;
+		goto found_get_ref;
+	}
+
+	kfree(new_dev_set);
+	if (xa_is_err(dev_set)) {
+		xa_unlock(&vfio_device_set_xa);
+		return xa_err(dev_set);
+	}
+
+found_get_ref:
+	dev_set->device_count++;
+	xa_unlock(&vfio_device_set_xa);
+	mutex_lock(&dev_set->lock);
+	device->dev_set = dev_set;
+	list_add_tail(&device->dev_set_list, &dev_set->device_list);
+	mutex_unlock(&dev_set->lock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vfio_assign_device_set);
+
+static void vfio_release_device_set(struct vfio_device *device)
+{
+	struct vfio_device_set *dev_set = device->dev_set;
+
+	if (!dev_set)
+		return;
+
+	mutex_lock(&dev_set->lock);
+	list_del(&device->dev_set_list);
+	mutex_unlock(&dev_set->lock);
+
+	xa_lock(&vfio_device_set_xa);
+	if (!--dev_set->device_count) {
+		__xa_erase(&vfio_device_set_xa,
+			   (unsigned long)dev_set->set_id);
+		mutex_destroy(&dev_set->lock);
+		kfree(dev_set);
+	}
+	xa_unlock(&vfio_device_set_xa);
+}
+
 /*
  * vfio_iommu_group_{get,put} are only intended for VFIO bus driver probe
  * and remove functions, any use cases other than acquiring the first
@@ -751,6 +824,7 @@ EXPORT_SYMBOL_GPL(vfio_init_group_dev);
 
 void vfio_uninit_group_dev(struct vfio_device *device)
 {
+	vfio_release_device_set(device);
 }
 EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
 
@@ -760,6 +834,13 @@ int vfio_register_group_dev(struct vfio_device *device)
 	struct iommu_group *iommu_group;
 	struct vfio_group *group;
 
+	/*
+	 * If the driver doesn't specify a set then the device is added to a
+	 * singleton set just for itself.
+	 */
+	if (!device->dev_set)
+		vfio_assign_device_set(device, device);
+
 	iommu_group = iommu_group_get(device->dev);
 	if (!iommu_group)
 		return -EINVAL;
@@ -1361,7 +1442,8 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 {
 	struct vfio_device *device;
 	struct file *filep;
-	int ret;
+	int fdno;
+	int ret = 0;
 
 	if (0 == atomic_read(&group->container_users) ||
 	    !group->container->iommu_driver || !vfio_group_viable(group))
@@ -1375,38 +1457,38 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 		return PTR_ERR(device);
 
 	if (!try_module_get(device->dev->driver->owner)) {
-		vfio_device_put(device);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_device_put;
 	}
 
-	ret = device->ops->open(device);
-	if (ret) {
-		module_put(device->dev->driver->owner);
-		vfio_device_put(device);
-		return ret;
+	mutex_lock(&device->dev_set->lock);
+	device->open_count++;
+	if (device->open_count == 1 && device->ops->open_device) {
+		ret = device->ops->open_device(device);
+		if (ret)
+			goto err_undo_count;
+	}
+	mutex_unlock(&device->dev_set->lock);
+
+	if (device->ops->open) {
+		ret = device->ops->open(device);
+		if (ret)
+			goto err_close_device;
 	}
 
 	/*
 	 * We can't use anon_inode_getfd() because we need to modify
 	 * the f_mode flags directly to allow more than just ioctls
 	 */
-	ret = get_unused_fd_flags(O_CLOEXEC);
-	if (ret < 0) {
-		device->ops->release(device);
-		module_put(device->dev->driver->owner);
-		vfio_device_put(device);
-		return ret;
-	}
+	fdno = ret = get_unused_fd_flags(O_CLOEXEC);
+	if (ret < 0)
+		goto err_release;
 
 	filep = anon_inode_getfile("[vfio-device]", &vfio_device_fops,
 				   device, O_RDWR);
 	if (IS_ERR(filep)) {
-		put_unused_fd(ret);
 		ret = PTR_ERR(filep);
-		device->ops->release(device);
-		module_put(device->dev->driver->owner);
-		vfio_device_put(device);
-		return ret;
+		goto err_fd;
 	}
 
 	/*
@@ -1418,12 +1500,28 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 
 	atomic_inc(&group->container_users);
 
-	fd_install(ret, filep);
+	fd_install(fdno, filep);
 
 	if (group->noiommu)
 		dev_warn(device->dev, "vfio-noiommu device opened by user "
 			 "(%s:%d)\n", current->comm, task_pid_nr(current));
+	return fdno;
 
+err_fd:
+	put_unused_fd(fdno);
+err_release:
+	if (device->ops->release)
+		device->ops->release(device);
+err_close_device:
+	mutex_lock(&device->dev_set->lock);
+	if (device->open_count == 1 && device->ops->close_device)
+		device->ops->close_device(device);
+err_undo_count:
+	device->open_count--;
+	mutex_unlock(&device->dev_set->lock);
+	module_put(device->dev->driver->owner);
+err_device_put:
+	vfio_device_put(device);
 	return ret;
 }
 
@@ -1561,7 +1659,13 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 {
 	struct vfio_device *device = filep->private_data;
 
-	device->ops->release(device);
+	if (device->ops->release)
+		device->ops->release(device);
+
+	mutex_lock(&device->dev_set->lock);
+	if (!--device->open_count && device->ops->close_device)
+		device->ops->close_device(device);
+	mutex_unlock(&device->dev_set->lock);
 
 	module_put(device->dev->driver->owner);
 
@@ -2364,6 +2468,7 @@ static void __exit vfio_cleanup(void)
 	class_destroy(vfio.class);
 	vfio.class = NULL;
 	misc_deregister(&vfio_dev);
+	xa_destroy(&vfio_device_set_xa);
 }
 
 module_init(vfio_init);
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 3a38598c260559..cb5b7ed1d7c30d 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -111,6 +111,8 @@ struct mdev_parent_ops {
 
 	int     (*create)(struct mdev_device *mdev);
 	int     (*remove)(struct mdev_device *mdev);
+	int     (*open_device)(struct mdev_device *mdev);
+	void    (*close_device)(struct mdev_device *mdev);
 	int     (*open)(struct mdev_device *mdev);
 	void    (*release)(struct mdev_device *mdev);
 	ssize_t (*read)(struct mdev_device *mdev, char __user *buf,
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index b0875cf8e496bb..f0e6a72875e471 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -15,13 +15,28 @@
 #include <linux/poll.h>
 #include <uapi/linux/vfio.h>
 
+/*
+ * VFIO devices can be placed in a set, this allows all devices to share this
+ * structure and the VFIO core will provide a lock that is held around
+ * open_device()/close_device() for all devices in the set.
+ */
+struct vfio_device_set {
+	void *set_id;
+	struct mutex lock;
+	struct list_head device_list;
+	unsigned int device_count;
+};
+
 struct vfio_device {
 	struct device *dev;
 	const struct vfio_device_ops *ops;
 	struct vfio_group *group;
+	struct vfio_device_set *dev_set;
+	struct list_head dev_set_list;
 
 	/* Members below here are private, not for driver use */
 	refcount_t refcount;
+	unsigned int open_count;
 	struct completion comp;
 	struct list_head group_next;
 };
@@ -29,6 +44,8 @@ struct vfio_device {
 /**
  * struct vfio_device_ops - VFIO bus driver device callbacks
  *
+ * @open_device: Called when the first file descriptor is opened for this device
+ * @close_device: Opposite of open_device
  * @open: Called when userspace creates new file descriptor for device
  * @release: Called when userspace releases file descriptor for device
  * @read: Perform read(2) on device file descriptor
@@ -43,6 +60,8 @@ struct vfio_device {
  */
 struct vfio_device_ops {
 	char	*name;
+	int	(*open_device)(struct vfio_device *vdev);
+	void	(*close_device)(struct vfio_device *vdev);
 	int	(*open)(struct vfio_device *vdev);
 	void	(*release)(struct vfio_device *vdev);
 	ssize_t	(*read)(struct vfio_device *vdev, char __user *buf,
@@ -67,6 +86,8 @@ void vfio_unregister_group_dev(struct vfio_device *device);
 extern struct vfio_device *vfio_device_get_from_dev(struct device *dev);
 extern void vfio_device_put(struct vfio_device *device);
 
+int vfio_assign_device_set(struct vfio_device *device, void *set_id);
+
 /* events for the backend driver notify callback */
 enum vfio_iommu_notify_type {
 	VFIO_IOMMU_CONTAINER_CLOSE = 0,
-- 
2.32.0

