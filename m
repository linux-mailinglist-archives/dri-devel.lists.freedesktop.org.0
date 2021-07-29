Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ADD3D9A6D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAE46EB71;
	Thu, 29 Jul 2021 00:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739186E05A;
 Thu, 29 Jul 2021 00:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0tq9aOSYwQyknreeBGNeEeE+J+LP8Nd8PMetY1x2ovuzfHspHM/G5ikORmFU7EHWsWavK7m7F8HzWowjJR7jsAX3eHXzF4OmzJOs+s++019YpdXBf/9CfEEcnJixkMbzAdOnB5Rspopu12nlW0l7t8iv7mmc+0M4Ym9XDCYxHPHcbtnWRAn7AWbLeO5ToI4RBSfyBfa6UAmeb7QPj+lFsh1OlVJyqxVY5u7eNil/IHma3sGPS97BBDtpf0E+DAiFaDKDkCc6o/DA4ErGf+19esnO0fmVtcaBoKkROUSVRS0rZj+r6yPMUMHRcPWaOQiqGsSRtYKfwAEymN3k9LDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moxLV+hVhBsqbz6EaZ4AyQsrmAqI9phoBFzkze1TquE=;
 b=LTkeVlp4X9maEFR/sGVbItMsx97LQR1H0CT9caXr4TQwG0fn9xvSUCnylNmZzZrCRal0vYZeULsv/V7Zh23G1BtIqdpkuo7YqbUMqZFBhYQYCfOeOneFiszOnrmRmH2AsAScCZZznFMD5qIMzuu3jM6DVwyGnsVzcru/981fcH/UBto/E+OF92sDx49JybCjTKcBMbn8bw2mIWeRZFStcI1m2ho+XBE99jtzDbSNvmkaXyMz7M8PGvp1g1UPSlGWVCjBwGeZjwE6ULnb5SWnPAPVYzc5qhJkVg5dd48FnO6BGWzNnXItQijjw9zhCEg71KFP4Pojp+JHQ+RNj0453Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moxLV+hVhBsqbz6EaZ4AyQsrmAqI9phoBFzkze1TquE=;
 b=nwW+VPmQlJPmTJ0h39vrBISlxgIv1axz6LntpL/suqv9ejeCppWAMrRniExqWCKxcd7m6+0OPuYrVV4h3YWxSfVYwKBzfeSJF8tZ0FS4azAC7axpuZjrSEosOXEYdtJo0Wpu/IAcp2GO1nmswT2FPxrhB1NnPKQkQ/Xq87sWSLVuMLA6SRueDG+ZzjgisjziaNx3e+fqUVqV8/MLg3VttLJBH2+bP9Adi7QTgRFXIWynJNMnHMg3tHAIPKakOQPPCDkkXMxF78bUtPDcJ/8yZjG6mX4dWHzddxQu5u2OxVWqAtjH37ZLf13tvqwzhf84T2cr15vcgStAV/GT9VY6Cw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:29 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:29 +0000
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
Subject: [PATCH v3 04/14] vfio: Provide better generic support for
 open/release vfio_device_ops
Date: Wed, 28 Jul 2021 21:49:13 -0300
Message-Id: <4-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::18) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Thu, 29 Jul 2021 00:49:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEl-009pms-RW; Wed, 28 Jul 2021 21:49:23 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5946cbcd-be98-4579-bf06-08d9522ab74a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5160FC8CDCB6148E33E6306CC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RQAGUyL0Wboy2Am4NYF0EgvyHeMVF2+Nn32Wljzt69QRpU7Ll4Ejf+1gFS1LpA3udu4drXrsTX3NAb7c7hwwA+7eNiD4IEWUVNdEjdTCDRzC7KgxVXHqgudG4V8CsRuuPAShyYhMjjOKaOZ5yQa85edikx3fzwS0mLxaV/YsWvij3PFGyIKLKIGdf36UHDwR2urmp6Hj7JwaR+5Ldg+os0Mr7fEkWfwqbrmMBbqIydg8KznfLcJhOAGOovrw+4ERRo/eoch2d+zrAaCtFSG8AUsXI93eKmKNpiWL+GwsFKOWSEZFLzztILQNefZSI/66/qkJGt13pek2WZ19r1PeJVWE9w6dXAoRF64TvNYJyLYxQJhVgBeiBaZiuo9WfPmIaYSHD4jKLGt9IVQP+nU1cOIp+jUdz0ZTUTsZQb/uHs8o8E4PnNXYurElArvG1mFrRa1dJfNSNeQWiSN6MS7qrnduTyxt3iiUu2IBmWyrgMgnPztfHz40EhucS+7dKXfvvmDCs64BuoOHkfilpUynh9kWbxCIcF7rXb6fQ4kSeeN0KV/JQTvHEJRobNq5tYgoT+M5fwN1cDg6/3uE8XsF2kNwKlkBoZQmMNJa71eW/+6x9PUZ2QUYaNUPojeWGsqgBdIqp9Ns5xwa5NmEKxnOHfTn09YoDCav4zDWEGuYw5Xv0JRj5i9CUqb+7Pp4Gf2NWHn2fjVWaQWhpTKQOU3PCLIWrQZUG8/z3Pl3YXRIsns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(30864003)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002)(4216001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gmiO2LvmgOqfZTx33JYipEGw8Ynfgsd0JWuNELKsI42TVBOTVQ64fd3waE+h?=
 =?us-ascii?Q?ahabks+Vv5I82m0m1g8u0f2YPgWdiMFFP6IpLtAKkIcp9h1Cq2OWMnM1ZR40?=
 =?us-ascii?Q?BgRB19rpdMIW8FEq8nZAeGFsfQhp4nyKNoRSNY+gkb16dUzQRTcI133PhBr8?=
 =?us-ascii?Q?ckaIx8DZpEILDmSXqtEsSm6FD315l4hiHDvThvPopdMA1MyeGq4MyxLcT2mj?=
 =?us-ascii?Q?MZP4gV174KNdp6m7jqgU20Myif0wIYOfuFQqNVsngYcPWyXhUkAUdqdsUU+O?=
 =?us-ascii?Q?nFjwUCfSK4jUXqWtIx2vyiCvUT+plxbwbnpnoV35yeK+c+px1YGqkSoB90UT?=
 =?us-ascii?Q?GcVY0tYJ12rJHUBLzH+8z0myRYSEji/qUm9FumyH7c9oy1a+ozNI0BeKXG6A?=
 =?us-ascii?Q?bHvHlX76Kk6yLgehJBMYjFcJKNiFTiZ4M8g44szYMd7VNXsLrfcjmrL+gi/z?=
 =?us-ascii?Q?678fzi4zqTFyNeUHdkjfu+S1zOL/q7cT3wP88qoWSGStFb2PIpJSTd3FPIrk?=
 =?us-ascii?Q?qk0U7lPz9PevMAXKfMf7CdNHrp+2xkcM3je3WJgEeyKZw4Z2FT1eiRfMZkrp?=
 =?us-ascii?Q?Ecclg32PP8g3bL7AOf/VfRONGR8nwJ9xuufQvifO4BTfoBX0/nPHEjTxKjLP?=
 =?us-ascii?Q?qRd0G6E1S1+UWRyBW5mfI9P1sfRbIZirUwSp0x/mf6ISlh4U30cw+dGZEYqe?=
 =?us-ascii?Q?jSkvedudpBWHWIqA/S4S+cPBcAXryT4wm9NdwmHbXmgV0nuSIZBJSQzL8gkz?=
 =?us-ascii?Q?SokPM+5xEfWheUN/b+j0EA12u9EDmggAcbbwSqJHnPVG4gGGoQXobLE9ZSgb?=
 =?us-ascii?Q?DJstqw8iqTKB+CGx1B3FTxFSAPS0Kudh5wZy4dzn6N6xVGzD6oNbfHumXdu0?=
 =?us-ascii?Q?uRJST5dEIRXzSEv22Nw6Ft0snLFEEDPDqFgaXyDK+/Tyfx8nfbAlp4mmfwNK?=
 =?us-ascii?Q?tWccNBHqFpypJLIih0WjfRdKRFFLRFqq7qZj1VQncbZOGI0qPzK3bFa3wBac?=
 =?us-ascii?Q?GQFsLTy6IW5EUHCRCl8Rt0Fbc33JaPvVK9SFnEV3k75t11hOi4JVJnbfnsL3?=
 =?us-ascii?Q?9U8GQXXMwbr12H0lDU+dRd/VzV1AOSNJJHRXW9wcIurT6QqIa2lHqbUG5Gdm?=
 =?us-ascii?Q?Wnk1FKghWSFJ/bEOjNcqg4jFCt6o1plKxwOgi548D2Nd8azytxrYCZI90bzO?=
 =?us-ascii?Q?f2AQJUU8cYXc1piw9gyiabztzho9AWvHkhoDfPX0YulufKT9+YJhIxxa/8xJ?=
 =?us-ascii?Q?XQlC4GDavS8X82G+7oFBZ0c0w3o1qWUrHdJJMlo7gn/xAM13QfE+D8Ct6Zrq?=
 =?us-ascii?Q?c7eDsWNj3CyKJOFyvLW1y3t6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5946cbcd-be98-4579-bf06-08d9522ab74a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:26.9129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22hDJ8zxb7rbAQIJkI4alq7UY6Ye053yy/4oVkYFZ4ZUq4q5JGOBcZ1bMNmkHILm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/mdev/vfio_mdev.c |  22 +++++
 drivers/vfio/vfio.c           | 149 +++++++++++++++++++++++++++++-----
 include/linux/mdev.h          |   2 +
 include/linux/vfio.h          |  21 +++++
 4 files changed, 172 insertions(+), 22 deletions(-)

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

