Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300D3D007C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A016E4B6;
	Tue, 20 Jul 2021 17:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927616E4AA;
 Tue, 20 Jul 2021 17:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuqUMoc38dGBbEqhKhpaLbzeTV9KPNTcgcLe8YJOUn+53THPRq1H1g4Ghi0PkqpgFMTFdl1/8tGCykTCk7YsLWQH2OVmELYpChxHczUNDtJ/nOZlJZI5gWSLOXgvFAs293hrBWDSeegcmNU6ss18G2jkRZLLJL5v3gdfEMl3wwtAiDOZ7FnnVkozok5VeN8Kw47Hs+7v3qTPlOntSBQlJ5BRoOBiwxiJV+DJ6a35EYGd7cOzUtQIt9gGrAlGCT7AEXcaCe6tv4cM61V7SPEmn1vZhYtjzAZWGep4x0K52OTi29rWMS0zqg/it6xXfsqIQE2cLXGP1zkBB74yf3VS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wfi1e3jIbfgXw/VVQzuHe6iSz9OsFAUqnUBtq2yCag=;
 b=mUXKO3Gl+YXNH4XpiJlcC7Zyd3BqREI3Kto8YyQtyGgSKGB2efyePCVXrPKiNxbgV0HhVsqpgqAHXmv2pPPfO/VV/zl8m+CdW+s50KnfonSf9BpxnJWn9EYXzrxH+gzqfnmKOw82jS9fvFE2Mw5s/FgUxLIGspmFi/jxjxNYZlwb/MZ91ngphIfyc5hJDsd116HtA6yJ7J4LzuORvR0yZpz2HP7VZOUmY5yjbHZurFErBir9R/8kmETCMIg6SAdbOofPEcqWpkWrq+hD25G4NMZErRjum0KanjIuQSfKqlgRgKWSvse9duoJKJWnAfKieQUDxZIRsXuHuOvPTUmBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wfi1e3jIbfgXw/VVQzuHe6iSz9OsFAUqnUBtq2yCag=;
 b=NzYb3LB7zhkj3k3FHr14CzW+Bqx9KnnuBWyf8ZsF3rikHvChEDm8Yl2xzmGcM/5kCVlUFlgaKxZrbgWFuC29PX8jO1htm8rsE0+GsUa4UAnXt6GKLlfM/RpE1s4V1Ni6IaD/A1WS41+FhepoGGqot07C9em9ddhZqc/afRwRb8rJKDRwf0nhl6qrtk3ABGDn+/UhTDb/y2vLPX+QFvxPVFtDIXQbhZFloPD87fZ+jFteaSFYIel0BoXamgyJg5ERIWQ7MNMaMvau2J8te9BrFJkIk9W7+bl/wziSpLnSA4WU7mHJ31MD9y9b4gLp8KM6R2Q20nOC0zj1zvNuPXMAug==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:03 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:03 +0000
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
Subject: [PATCH v2 04/14] vfio: Provide better generic support for
 open/release vfio_device_ops
Date: Tue, 20 Jul 2021 14:42:50 -0300
Message-Id: <4-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0032.prod.exchangelabs.com (2603:10b6:208:71::45)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR01CA0032.prod.exchangelabs.com (2603:10b6:208:71::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 17:43:02 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051Ek-7i; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9888313-3efa-4fb4-919e-08d94ba5d25e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5288886C042D98366BE8B3E3C2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHcnqkzHBJP8fi+LbGf9UFHVvB1F2MyAz4HeIMR440hZadpub2OiCaKVcohG/soYz5h/sg1mmv0OM2DBHOBCPCBbxNZAHkyYCS+RjxsUuHwTHFVJfZ3D0NpQdNbnwfm84aPSSfv6p/io2VSHL22wVQmon+X7wVE2pTG6XR+uq+Zdv28Q4WjNcYd6V7eXt2MIUT5T2PAExHCyR2O8ePf88hv6mzb6qxMTAFE1rdLlZ7iSEjNYwYk483JSpY3KqkxBNmACPVjpzCGRAmwx6VxD/q4B4O1JeTKjTm6yAkQGg1mrCyb49C/eo5GK4ovjuQMKiutldbSV3QwOxAwUid9LatzhcioKTkaTN0LfMjfvs773hAOhLmQALEKZ1bPWCRCJgltamAowveVnWaX0PUNxprPSLGHK3q2sF2TSHF/n4aKpI1bGPaQIhnp7NmIvgXDOp2XP9NPPJC5TYobuXdDrPCRo0ed4cOl9jisoKIwuF5B6OZ1o75knsQMVnmp3t+R7mieoQyE/UHYX36VGB57Qvis8ObdZcZbhKPhGSYSLMvhan7LXcDnYS7zgkRQ5fESkRi4TWgH5JoJnPnmMo69RT/c76loJp5837CLIjHKWXGpED3xOlW+1jOCohYwbveZAtJO1f9FBjKPgH5yp9ap/SncCUtyI1Lmx24svrNq0vtESVZuXmhsLnqv1e0R1a/w9FVcps1Y8g0ulazOu18mCoHLp5XASgUJftL8TvSPqSlg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(30864003)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005)(4216001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dI3A7WqjCR1FW9DLOgzBfQZ6V3emnwyIWom2aUArDUQqB1fhGSZYCVyxoib9?=
 =?us-ascii?Q?gTorRkn4ILYPW9dmLhuUKMu0XAMXpdU3OohyeYI36gcLDQnrDQCZAUPdzPDA?=
 =?us-ascii?Q?aMa2b5Rn/lzYdDZGL9LgyHXN7uSOgWV/ZRTsd6mrHaKGe7ZJynePcG8vSnml?=
 =?us-ascii?Q?VGHtvdv7LsRQ2XdppsnJHv2Of3wiKyU2NC1arlT9IwCwT27rrI3UnWFB0Igf?=
 =?us-ascii?Q?61OZAWISqXSqOdQSdsM79QJZ4PCjCjKTgtlGcsjc5lxhFfwO8W6EzgxkOSD0?=
 =?us-ascii?Q?fg1JcXQE56+1CRaneRlQASkAgVlcefFxMaDGaev2v2Qcpbd0KptYPZ3uU0St?=
 =?us-ascii?Q?sHDbqO7Hm1auetRyU96fNRcXWQiXh2oYErLM82bw5JMKUdcc/Ce7MUHrclOv?=
 =?us-ascii?Q?63Z7qbDtNj4nnp9iFCj66CKqVTgiiL/KUrWSpP2ogi3mNEcCgH9gWRZFNPHO?=
 =?us-ascii?Q?xotyebdMN2JbZ6XDJQ6KMztJmK/xGdUO/2uMHX3aB8uIQJ018eaZ9KTJkdWZ?=
 =?us-ascii?Q?TS/bvtmBxFKVAZdfmyOI3/M89ygo9By+vs8FwrXi15VqqN3pn2nluldIGgEa?=
 =?us-ascii?Q?MFcmyZ4L+HMoZskbO4ZFN0bMIMNO6yP6IYlFm5fFUf28CuxnL0Q4Y/LIjUww?=
 =?us-ascii?Q?3+j0p9sdL63mOtOc7B9RvYQdAF3SwD7NNpIN9OAPFhbaXYi0TdJU8t8KaC7p?=
 =?us-ascii?Q?Um9v//PvXX53NuaB7PKIIcZAEm0tNxVM3eGUnJYeDfw63di8L1N/5SJ1qjxt?=
 =?us-ascii?Q?zSowyTP1w28jbw2m8sMr8eTR1FOXzjdU/5GtAEhTiks9b9y1IP/NVNHU1Zgx?=
 =?us-ascii?Q?ATV9YK64y10ZDMgEH5w2qh/vu6J58q6KcNjRJ2jjEfNCR+LN+85qNXtP2dQp?=
 =?us-ascii?Q?k9MXzhVrwvHt8B17ubWGWNJ404AtgTVcHoXc7Jq4QiHLwp676POv+Frvs2mA?=
 =?us-ascii?Q?RANf4mBc4neCk8jwZr7rPw75Kgy5Mejx3v2Kd3nqc3DiORJlcxQxddRBGzo7?=
 =?us-ascii?Q?WCUZobSovBWrKXtB5Go4hydX/c42D+BhtifPvnrLi0SHbVy/jlTrwB6oW86g?=
 =?us-ascii?Q?OR+UYJ+kcO2QxRHlcjU/BNhoS025XDVqIMd725FWX+tPeQKd3RPnrZLJvJ6p?=
 =?us-ascii?Q?2QqmBGRPR7FCFXXpNlZlgjdAye6QzYtUaAjj02TYscZ40vrV9l1XXDfOG1tV?=
 =?us-ascii?Q?cQMo/Wr5DcmLlPPwMVu8IWzepZlQNJR4/Pfl//Y0Mdq9Wl3T9TD9l0hKlAox?=
 =?us-ascii?Q?QFVOlPWypyrc/LnaQh0b2dBG0CF/p6hPHtA+hzyitva+0tZ3fJerkP3u4GHH?=
 =?us-ascii?Q?ZD2xM/KTSL0RwPRI8z9fbIFl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9888313-3efa-4fb4-919e-08d94ba5d25e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:02.3892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r54xWb/vFbbNKY2GwTL11fekKj/8yrWYOuKS5IT5FUBRKEsMhXswto2mGMH0qr8W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
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
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/mdev/vfio_mdev.c |  22 +++++
 drivers/vfio/vfio.c           | 146 +++++++++++++++++++++++++++++-----
 include/linux/mdev.h          |   2 +
 include/linux/vfio.h          |  19 +++++
 4 files changed, 167 insertions(+), 22 deletions(-)

diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index a5c77ccb24f70a..725cd2fe675190 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -17,6 +17,26 @@
 
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
@@ -100,6 +120,8 @@ static void vfio_mdev_request(struct vfio_device *core_vdev, unsigned int count)
 
 static const struct vfio_device_ops vfio_mdev_dev_ops = {
 	.name		= "vfio-mdev",
+	.open_device	= vfio_mdev_open_device,
+	.close_device	= vfio_mdev_close_device,
 	.open		= vfio_mdev_open,
 	.release	= vfio_mdev_release,
 	.ioctl		= vfio_mdev_unlocked_ioctl,
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index cc375df0fd5dda..8572d943320214 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -96,6 +96,76 @@ module_param_named(enable_unsafe_noiommu_mode,
 MODULE_PARM_DESC(enable_unsafe_noiommu_mode, "Enable UNSAFE, no-IOMMU mode.  This mode provides no device isolation, no DMA translation, no host kernel protection, cannot be used for device assignment to virtual machines, requires RAWIO permissions, and will taint the kernel.  If you do not know what this is for, step away. (default: false)");
 #endif
 
+static DEFINE_XARRAY(vfio_device_set_xa);
+
+int vfio_assign_device_set(struct vfio_device *device, void *set_id)
+{
+	struct vfio_device_set *alloc_dev_set = NULL;
+	struct vfio_device_set *dev_set;
+
+	if (WARN_ON(!set_id))
+		return -EINVAL;
+
+	/*
+	 * Atomically acquire a singleton object in the xarray for this set_id
+	 */
+again:
+	xa_lock(&vfio_device_set_xa);
+	if (alloc_dev_set) {
+		dev_set = __xa_cmpxchg(&vfio_device_set_xa,
+				       (unsigned long)set_id, NULL,
+				       alloc_dev_set, GFP_KERNEL);
+		if (xa_is_err(dev_set)) {
+			xa_unlock(&vfio_device_set_xa);
+			kfree(alloc_dev_set);
+			return xa_err(dev_set);
+		}
+		if (!dev_set)
+			dev_set = alloc_dev_set;
+	} else {
+		dev_set = xa_load(&vfio_device_set_xa, (unsigned long)set_id);
+	}
+
+	if (dev_set) {
+		dev_set->device_count++;
+		xa_unlock(&vfio_device_set_xa);
+		device->dev_set = dev_set;
+		if (dev_set != alloc_dev_set)
+			kfree(alloc_dev_set);
+		return 0;
+	}
+	xa_unlock(&vfio_device_set_xa);
+
+	if (WARN_ON(alloc_dev_set))
+		return -EINVAL;
+
+	alloc_dev_set = kzalloc(sizeof(*alloc_dev_set), GFP_KERNEL);
+	if (!alloc_dev_set)
+		return -ENOMEM;
+	mutex_init(&alloc_dev_set->lock);
+	alloc_dev_set->set_id = set_id;
+	goto again;
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
+	xa_lock(&vfio_device_set_xa);
+	dev_set->device_count--;
+	if (!dev_set->device_count) {
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
@@ -751,6 +821,7 @@ EXPORT_SYMBOL_GPL(vfio_init_group_dev);
 
 void vfio_uninit_group_dev(struct vfio_device *device)
 {
+	vfio_release_device_set(device);
 }
 EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
 
@@ -760,6 +831,13 @@ int vfio_register_group_dev(struct vfio_device *device)
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
@@ -1361,7 +1439,8 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 {
 	struct vfio_device *device;
 	struct file *filep;
-	int ret;
+	int fdno;
+	int ret = 0;
 
 	if (0 == atomic_read(&group->container_users) ||
 	    !group->container->iommu_driver || !vfio_group_viable(group))
@@ -1375,38 +1454,38 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
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
@@ -1418,12 +1497,28 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 
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
 
@@ -1561,7 +1656,13 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
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
 
@@ -2364,6 +2465,7 @@ static void __exit vfio_cleanup(void)
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
index b0875cf8e496bb..128b4db00adc57 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -15,13 +15,26 @@
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
+	unsigned int device_count;
+};
+
 struct vfio_device {
 	struct device *dev;
 	const struct vfio_device_ops *ops;
 	struct vfio_group *group;
+	struct vfio_device_set *dev_set;
 
 	/* Members below here are private, not for driver use */
 	refcount_t refcount;
+	unsigned int open_count;
 	struct completion comp;
 	struct list_head group_next;
 };
@@ -29,6 +42,8 @@ struct vfio_device {
 /**
  * struct vfio_device_ops - VFIO bus driver device callbacks
  *
+ * @open_device: Called when the first file descriptor is opened for this device
+ * @close_device: Opposite of open_device
  * @open: Called when userspace creates new file descriptor for device
  * @release: Called when userspace releases file descriptor for device
  * @read: Perform read(2) on device file descriptor
@@ -43,6 +58,8 @@ struct vfio_device {
  */
 struct vfio_device_ops {
 	char	*name;
+	int	(*open_device)(struct vfio_device *vdev);
+	void	(*close_device)(struct vfio_device *vdev);
 	int	(*open)(struct vfio_device *vdev);
 	void	(*release)(struct vfio_device *vdev);
 	ssize_t	(*read)(struct vfio_device *vdev, char __user *buf,
@@ -67,6 +84,8 @@ void vfio_unregister_group_dev(struct vfio_device *device);
 extern struct vfio_device *vfio_device_get_from_dev(struct device *dev);
 extern void vfio_device_put(struct vfio_device *device);
 
+int vfio_assign_device_set(struct vfio_device *device, void *set_id);
+
 /* events for the backend driver notify callback */
 enum vfio_iommu_notify_type {
 	VFIO_IOMMU_CONTAINER_CLOSE = 0,
-- 
2.32.0

