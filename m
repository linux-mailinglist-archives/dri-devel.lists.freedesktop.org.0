Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250203C9516
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390B6E520;
	Thu, 15 Jul 2021 00:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F37D6E50D;
 Thu, 15 Jul 2021 00:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpZ/ZiZDfNt9Y15zxAkGIliyQWPZEUjRKaQ0IZWGkZs892wYyweFm9lN2vntc/kbN1K/kgU5N9ebBfGx1XjBD9yVDnzxHicgK0GnZsUntCmGe5W6EwRd60GJoMwn3lxJajFZnjREhAtmJbEmV7JC7uurBQ0Ub8IHCLTf38lD8v/lmUAVc3XyY3yDkmpF4oxO1cEcm60Zkb8Y2xyuPRccSjxEyzPbh3cV0guAX0jaBlo2Ejlg/grFcl1/Aq9C7Fd/3tkQ0Ey5mo6f3jYdI05tj8tHhGQqFfnXAa6f9eWZwc+UzqqB6bTksBTSqH/F0VPkyMrPWWG2lrdFH25XJkfvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJPAm2QI0LQQw4M7Eo31B6OAx+ud8GUHZgfpPhVVEcU=;
 b=LpkS4aoL1fCK1AVlOYmuNc3ymrtudE9raYjuJi5XH/Uuju6Kis29TjCvIqvT1Z+qMFyn8OrVmYRuq5bD5K71k4IlVQbZHANyjzCxYx8DPxlQTuK3uZvJWOk1P4lpNAsfNOcyAeKrlg1RCk3sd5X8yASk9kFjFDHuoGtAabom3lij2WYb31BXNj48sDm43qQAYpb5UXIOGbCsoZxcyYFCN7blamdXrGNcCj/ZECdGl/bcL3RrZ4H9v6spJEsLixL5Pvela/g8QXQDqmvk7WEMXW6u40LyndOchIZxUXi4/UZRGzpwvaowsCEhIO9kXRLAmomdvdE7thqoHZ/5olJsxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJPAm2QI0LQQw4M7Eo31B6OAx+ud8GUHZgfpPhVVEcU=;
 b=KnlmQKAXh/LrJQoiPdlt/053os9cgmbom4LpzNDtks0czXRDbhqi7maXDVfRE3i1IAQy3XoJudQMeQiVTLTAiYtXtVO/NGa8U6yUZe1KIXZFx/uQtCsJohFLQ6qrM4Gx/mWwpJs6UIBJnga/uuPW54WPE4ywRvqgqu2bpqwqHfsuLecAGgG5ZXFjtD4ohgGuh21YAkjC/9/ju3gjI7rgQk5sP6U25BHaLbYgY397DxhBPKIU8jSiIL7h7qhIWbka/AgrmMZ3U3RQ/TlbHbFXtjKw0HxAgBJQczKBXmhKY+4u+GcjB3JNo7HEgzyuh5dGUJfNcnAa/Y5NLQEB1D4BGw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:46 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:46 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 03/13] vfio: Provide better generic support for open/release
 vfio_device_ops
Date: Wed, 14 Jul 2021 21:20:32 -0300
Message-Id: <3-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0061.namprd04.prod.outlook.com
 (2603:10b6:610:74::6) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR04CA0061.namprd04.prod.outlook.com (2603:10b6:610:74::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Thu, 15 Jul 2021 00:20:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002UxF-FR; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae43550d-9129-4f96-50f6-08d94726626b
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5555589DC21EADEB505508A9C2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJrQLStFm+wHXUnr4soVnFSAeyG3/2g5rKsupx2XnGC5LF0p1XAp1muQGMBUbCqfROjYxyGg9/196iQpdHh59Z77SVDq49vS8vo2yUbviVzLoGbx3ZwuijQv3MaJ2BZCQzfBvXA3waom+AwIi/cjjMvNhobTB/OWK6uTT2X84avM0Ix2jXBnxKj4/rZm23kWSvZvoQco4HA4dvB68C1os2oXXEMB+OEWLxEQIZoFf2e56dHQk8e6/nzHFtJ0ipBhEHeABL9IO5tLTItDbKmYTf33c/3AHW5yvL8POonp99lTT3YXK3Ogtc/p9MK3fZZ7u0SDyF7XBLIjCX0gMw6WLzji4ZQLSvazi3jt1uLEpp3oc34MzWf6LYujR1qcNvz7I5gnHGe8VZE9rLzb6LdS5b5JieVqLibptK9XmAQcdBaszL45nFCncBLZ7YUde2RMuO1gCOD6qJaaydS7ICjdP6eAiFwX4jQ74gdEupZAR68r1GjxnxeMD1/0EuvgZuP9wy9LNuCFCqprj5OzVC0BnHdecszv2nE2WB3TILNiXGTE140lsx1G7FjXizn7hlQiaF7C1GHBXvZxn2nAy3kx5deC2heGx84E128vjZC/+MhK1gLi3CXQKY0J8WXVlS5kEKn7pp1MYkIDJy8dBBRm67Gre+45SSb7FwFcwD31g0QvhKwhfZeyN8rZwvJ1Th20NkT1V83+vhPZf4HnrrFosB2i3KEeRZ45r5g33UYEmSTbi8le5X+ppL4P5Mh/6OJv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(30864003)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(6666004)(186003)(4216001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?papJLHftwil39tQdUnwQZmfAlluLKsSfn9vthEnt5Xox/Wte0bDQayihtDKb?=
 =?us-ascii?Q?uSSmdQruDyDQPYMjpotYpG3aVq2cI47etPr79amcxNJQ2wWqA8xXnfYyN46C?=
 =?us-ascii?Q?8o1glFo5Qghjk5zlqfa84IC1p9um+B4D8XhT+6MYJ/7h/vxPK2+1GExhDY3d?=
 =?us-ascii?Q?g8IdGqNJnktFguJp9LrlcFmnwX0Bi15oActxoaZwwdKq5ndJRnxvIg5zVe0Z?=
 =?us-ascii?Q?5hNUN+jnBFDd2RC1ab0JVrzC5uzvDrKxZ4xMdEOEhD+PEjW6T4M6yb0fZADS?=
 =?us-ascii?Q?IKhcphFfz9Zx1/Xu2NtRGeuc0IeFpM3QUtscFwXDHyz7sfpRcG2LCl6e6cxU?=
 =?us-ascii?Q?slqVLqpiqaoBsMFItiQgsM1HuuIdWsajOXsT+6Wk4gfN6aLxdgMqaeL3PymB?=
 =?us-ascii?Q?X7b6J4bXVf0TIjlqj71FX/cDzEDhTDTS5MuZ32ceWcymaNBstaoD399famQP?=
 =?us-ascii?Q?GyReaGtT9tkT9J0O6myJzSk+wGDBZ0CqjLnXzBPFXlR/RPbOOP7cl1GJlhgc?=
 =?us-ascii?Q?2yDv3jH7+/6LLlpRaZCFtNRrYQB/AdiXfCmQX1cIhf3J78FNqedrulEH9PQd?=
 =?us-ascii?Q?mISc0UOk5W3zcvJSXAyNUvkDX6/tBQCxOUwNxIlZKDJ/Y5c4NgZbk8Z48wFX?=
 =?us-ascii?Q?+8+Wvl7zQpX71VEAA++/Y+09WWfSsc6WaWFjhXcw8zYHd6mhtfZ5Ev1GyvHv?=
 =?us-ascii?Q?yG9gP9dspyahxpudEaFs184qNiEaDuflYbv0iT4BM07vxWLjObKzHLMiv2sw?=
 =?us-ascii?Q?BMrhj1SXMG9Wq7qqdfq1ZcDCNO8K0TTrYCvauMWl1833MMHbvzqj2Qce8l02?=
 =?us-ascii?Q?Rf/rtt3JTpUelFYBXH6nifDcQVcS/+MGgARagKtUtNd7HkfKlNs0g9zZ6zi2?=
 =?us-ascii?Q?pbr+2ZCP5WjDgZbJaeC/+p7ZdLKDO1fQt5jPZW1WyZmXx+q9+iWteuXfvKrw?=
 =?us-ascii?Q?/srpNv8IbQ4SX1lvBLWNJddpGnLt5UQeYmVOO1M/L1lsNuA87Fftl4Sjtudt?=
 =?us-ascii?Q?TtysrW/+QTc9qAbBo6dPKafA+NwyQaISfZpkxZUCShXp56xBqVWUhJW6P7tR?=
 =?us-ascii?Q?5EhMUGrLLZrkogPkHABtf/1bvASIIkbtJmthG+Xg+pagQejjnXtdomV7D8ie?=
 =?us-ascii?Q?2o+3GBF+PO825ftlcBQwFYbEQljyhH2yDXtMym/iIeDAgvdLwGDFuQqTz/n1?=
 =?us-ascii?Q?CMwlIgA1jR7E90NkQKWygrtceZbEHG0n7VRl6sUKftLAKzno8tBV9Hyvetix?=
 =?us-ascii?Q?KNaTj6RvEUWX4EP3lTCa3hcD3FY1k03Lf27rmCQtkOV/5pzC4ug8MCJrDIUB?=
 =?us-ascii?Q?/BmN6NyVB9fgECeu8J/EWm97?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae43550d-9129-4f96-50f6-08d94726626b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:43.9018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dnbW2oqJ0vKdYlRSstTja22JfMSig56nlk5+e7tEMbr5hZ9Yp462iNQwy2GBFKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
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
 drivers/vfio/mdev/vfio_mdev.c |  22 ++++++
 drivers/vfio/vfio.c           | 144 ++++++++++++++++++++++++++++------
 include/linux/mdev.h          |   2 +
 include/linux/vfio.h          |  19 +++++
 4 files changed, 165 insertions(+), 22 deletions(-)

diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index a5c77ccb24f70a..3c384d2350b64a 100644
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
+		return -EINVAL;
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
index cc375df0fd5dda..6908c2ae9b36f6 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -96,6 +96,74 @@ module_param_named(enable_unsafe_noiommu_mode,
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
+	} else
+		dev_set = xa_load(&vfio_device_set_xa, (unsigned long)set_id);
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
@@ -751,6 +819,7 @@ EXPORT_SYMBOL_GPL(vfio_init_group_dev);
 
 void vfio_uninit_group_dev(struct vfio_device *device)
 {
+	vfio_release_device_set(device);
 }
 EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
 
@@ -760,6 +829,13 @@ int vfio_register_group_dev(struct vfio_device *device)
 	struct iommu_group *iommu_group;
 	struct vfio_group *group;
 
+	/*
+	 * If the driver doesn't specify a set then the device is added to a
+	 * signleton set just for itself.
+	 */
+	if (!device->dev_set)
+		vfio_assign_device_set(device, device);
+
 	iommu_group = iommu_group_get(device->dev);
 	if (!iommu_group)
 		return -EINVAL;
@@ -1361,7 +1437,8 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 {
 	struct vfio_device *device;
 	struct file *filep;
-	int ret;
+	int fdno;
+	int ret = 0;
 
 	if (0 == atomic_read(&group->container_users) ||
 	    !group->container->iommu_driver || !vfio_group_viable(group))
@@ -1375,38 +1452,38 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
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
@@ -1418,12 +1495,28 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 
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
 
@@ -1561,7 +1654,13 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
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
 
@@ -2364,6 +2463,7 @@ static void __exit vfio_cleanup(void)
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

