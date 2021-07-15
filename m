Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F300D3C951E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080AF6E558;
	Thu, 15 Jul 2021 00:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0531D6E519;
 Thu, 15 Jul 2021 00:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7ts2h6hX79aIciH4XzLTjhzwfARdAvrG/ybrqC8/YNoFMB8DgG1jGAcuoIgMpvxAXyABIxB9JHe0QBlfkPN1fWI9Brguce790/PX4vcACJRv3WftTWv6wIGh8Bx0i8PHvAdRwLGeoTzaMbjqEjkLcOC9wUILGZRtur6YB+D1GNKi303JDNJyognChCDoXlL3L0YFvUk48uCYgrBJ9hn53wVvGHcW29IAtvb7PfmzCZ4GP6hNfiqksHqXxgfcGNnxYf3NGPa1Sy/oqG3no40jDG2LEODayxyzgx6w2x2RtDuCWRjNHsYKdjZfxU9JnhRftZ3idvR9s6a+4VV5eUC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auqkl+rokSHj5l9mCa24igTtZT4ZWOHO3IXhLaR0Z54=;
 b=jNbRUTae8nARiemlb6ZsJxIJRWXrakUziuOixqc9xB6KPY+Di1jD/kQVPmVAGEynSejPKyrnu7KaXDY2C0we0jE4/9Fy/pw/XbgCswi7wTT2srtHGifoTlZzYg2evyzEzwB1ctFGwnRiuuS+gyCtoUUSxu5uyEUWDXf4k7/ei3Vmg2/XWgkHq456kdg4vCc/FsC6LgFdLK8YCbEQuEO0D3fPkI4YbTMYnqXdatpMWx+Bz9DwRHxitjYSH7tzYxkAO8c/t4u9dD4gg4GjAzqr2I1v2nD10O21g03g5hItZx6aiqgZiDvQ9LNhr2c9tlOdh/9oDNEQJ7fBdqsRwyNi+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auqkl+rokSHj5l9mCa24igTtZT4ZWOHO3IXhLaR0Z54=;
 b=SuzG6SfSjmtMp8jq6ewDjTewCN80vG5gS4v8nvh0mHe/hXZdlYOfi9UpNcLc5bd9iXQL+B30n6FtK3ecgVGxttbKyIBPBb0dM26Dne0y72RWoazI88A7QYyLPuZ6ecAqneTurSaKbLBhQ0awEkqxM4SQdg9LR7NZKSXYXFqybrTURV1AG5M6DLnjgiSUmmrMkaA+AGqj2rFcQnhEdhVBq7VOs3/OKVaPD/clTJlG78aewelOGgpNfSFL5MNj7RTieHHCyZEpSDjjMnh7RfaDIGiZNFRIngyK/u4shv12Xt3mqdg2M/YXW8Jgn4oHFhIeptUWUOrSUtxMBTXE/VW+dw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:48 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:48 +0000
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
Subject: [PATCH 13/13] vfio: Remove struct vfio_device_ops open/release
Date: Wed, 14 Jul 2021 21:20:42 -0300
Message-Id: <13-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:610:5a::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR08CA0025.namprd08.prod.outlook.com (2603:10b6:610:5a::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Thu, 15 Jul 2021 00:20:44 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7L-002Uxu-4K; Wed, 14 Jul 2021 21:20:43 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21dfe0e1-d42a-4473-75c8-08d9472662d9
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55553B489657B1BE26A684EDC2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5pctMBqs8wGC2K3EdG7gJlsAVCRFyiDgNQ072PtIjdGN49q1bVsyjYw088Oy1D6iDL0BSZqSvDGH4xgsfyk1mxhL3kt8lxGbLComXULc7EQL+tEymWcDQ+1cOe68jHw11660QS1RL6h13Veo9ShKlmxOQROb8Q4zFGzn/gi7DlLKYpZTJ4jRxHvvBeSckRhC9MlwaTemswSAehmP1AnPQTwG7EC8j31b7cYbEoi9SQ0sPv4o3TbHxBId1CyyFs5PPPBnXZHVs0OSrBQnNDQCvpdbUiEMy1Z+sUxcl8HMZIxpXOXf5/gXrSDIq0Ye4dBK9OdVcGsqyGxb/H3oF3T/LmzrqoJvilxe717iCEiH0XbjOzT8IKRvHFnmpUN4FI6NaLL0FEIjnzmf+lyQEQ9S9GDQy9WkLZRxrd/kRF0sAqLtP+rVIBUFugPLo1Td4X2fNJQHVflKLlZJpwEnS2hIFFIRznn4tzQ9hHD2aNSLCiC5XLgxDglkAbQ/Fhv8XrsM0S4w4YvUwbbBErUhn+F+aEG0d06H4R9SiHQre7Vs3g2kG9ANFnCg77qVrmZ7F0C5CH75HPxpL57sheJmsvKZx0zTH69xYVINh9CWvd8ATTJudq7iInFWa534uiguba587qqEqBzb5F1RFES78usqMZwwYgpdAl7JkHgCJxP6rnLscTn4sQr0Pz5NKtWNm45X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nkADaqwYe+pzWhpUqF7Op09XUR10GMqIo/gjNwoIi1kNhwe1WyNAm/YVUwtp?=
 =?us-ascii?Q?D8JnJURq6T1Xs5CWEln+0gqDVVDf3R/0gglErCPQzo0oMyC+wwRfy0Eya48X?=
 =?us-ascii?Q?+8v3UL2GF+X9DU8RL9I76JS8NZv8Qf+GEuTzZ1GuA9wpp/bS4voSf0kTIi06?=
 =?us-ascii?Q?NWFuYCka7rRhkl4vVz7mjrkNYfm+a4D8xpcT75mYdyyrhrrIrHumFk+ft8tx?=
 =?us-ascii?Q?2ktb0kyp2iZaSiPA9P3hmOH66IM4PqWnl4tVKceF4OzTVm2cvyaGPokxoNkN?=
 =?us-ascii?Q?aj7NCrEgZ4nwZ8zCIvT9WeWGofKKGWz5jHmMymmt9WJ1LFqqJoJP/12fGyTf?=
 =?us-ascii?Q?wlNGnwqk+LhoUs5Z9fYdMbparBKzM2lK3hA95t1nXFQX/Y/8xMjJWI1yE4m1?=
 =?us-ascii?Q?J1y94cZHJf7dm1CkOD72SDKhP8TBtacnjIMwGPpglToCVkK1RwC4bVScv5Kl?=
 =?us-ascii?Q?D2aitOeBRVI/eco9Mh0prs0a7ucsyh7MnzUKCgFE0vio6BBUS9OaK8OLTrsy?=
 =?us-ascii?Q?LCNn9cqH0i365MioiZUMQNFUfqdS6M/0tvS0HZ0ZH1oWxDgF46OE0ruX0EHG?=
 =?us-ascii?Q?PDrYX1j4fmf14nM00cFa6rj1qPDeaRmD8EgTe5BVRXxPd4rNfDZaDtUhYi7J?=
 =?us-ascii?Q?Euf/9mgC37k1RUoF6uL8POzAggvLTScvJEQmRlQoSJ1aFfImAzd+oOYDvUaA?=
 =?us-ascii?Q?znP18dqk0/zWcqV3vJkVa7QfddJFM2Bq1uuX6j8o234Y6rt0Oz8udSNnSf1/?=
 =?us-ascii?Q?/92IQizBPF+zLVyZh2BZLeO1vH6Y/G4pW3hPp7k6oBJd9EmCVAxaFobdIoRU?=
 =?us-ascii?Q?nzZMlXLDg6A2f6lacS6ZZd6oWNTVkm8bE4WayXqTpV7r+cg/BESc0a1Tp3M6?=
 =?us-ascii?Q?9QOpv3lu0yyUjjw/JBYSt3JJ+H2GIDpjMaivYzKi45PmAfXCMy8bdvL1VbA6?=
 =?us-ascii?Q?iS0coPeYlhj8EU+T/UL8U58jrDsBXaP/BDqsqbrOvF5Cua/zSOFShFvpAqLB?=
 =?us-ascii?Q?jrLDDxQ608RdM68cWlRCDf1aZ7bRyJ1orC+2E6kC+GflUYaI6kPAHi/n6iCg?=
 =?us-ascii?Q?jvBrL4HZIxNvp1rhR/dZkhZhFbE7GY4Orq5DW1qLj2pQcrkT69ZFyA8xPB0N?=
 =?us-ascii?Q?A0bL0IQ5ue4nPn8N1U42k3GuaYpfvFQTkvC+unhKdX6zrtbUPhqIBz/1n0xa?=
 =?us-ascii?Q?6LuW/3y3d0vWjJSaBPUdeOEicxvRqBZtYVmkzUqTp8IGEVXpEs/7F9mh0xFc?=
 =?us-ascii?Q?LiSIw4r2AOeuutGGR0i8OMsYajxUkloBNpPWrEmbrF2pviw6nUyCx6Biwkmm?=
 =?us-ascii?Q?jsLbaKsVQl4cqMgJcgCrblG1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21dfe0e1-d42a-4473-75c8-08d9472662d9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:44.4166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdSFu6CrWc4OvzZCjXa0wGsgrOGAiUiL9/Z4edVflNA1f60ITQt4sMnQHirYSRCp
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

Nothing uses this anymore, delete it.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/mdev/vfio_mdev.c | 22 ----------------------
 drivers/vfio/vfio.c           | 14 +-------------
 include/linux/mdev.h          |  7 -------
 include/linux/vfio.h          |  4 ----
 4 files changed, 1 insertion(+), 46 deletions(-)

diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index 3c384d2350b64a..9e39f23ca2f546 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -37,26 +37,6 @@ static void vfio_mdev_close_device(struct vfio_device *core_vdev)
 		parent->ops->close_device(mdev);
 }
 
-static int vfio_mdev_open(struct vfio_device *core_vdev)
-{
-	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
-	struct mdev_parent *parent = mdev->type->parent;
-
-	if (unlikely(!parent->ops->open))
-		return -EINVAL;
-
-	return parent->ops->open(mdev);
-}
-
-static void vfio_mdev_release(struct vfio_device *core_vdev)
-{
-	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
-	struct mdev_parent *parent = mdev->type->parent;
-
-	if (likely(parent->ops->release))
-		parent->ops->release(mdev);
-}
-
 static long vfio_mdev_unlocked_ioctl(struct vfio_device *core_vdev,
 				     unsigned int cmd, unsigned long arg)
 {
@@ -122,8 +102,6 @@ static const struct vfio_device_ops vfio_mdev_dev_ops = {
 	.name		= "vfio-mdev",
 	.open_device	= vfio_mdev_open_device,
 	.close_device	= vfio_mdev_close_device,
-	.open		= vfio_mdev_open,
-	.release	= vfio_mdev_release,
 	.ioctl		= vfio_mdev_unlocked_ioctl,
 	.read		= vfio_mdev_read,
 	.write		= vfio_mdev_write,
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 26d340283044e7..1d68e82137a735 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1475,19 +1475,13 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 	}
 	mutex_unlock(&device->dev_set->lock);
 
-	if (device->ops->open) {
-		ret = device->ops->open(device);
-		if (ret)
-			goto err_close_device;
-	}
-
 	/*
 	 * We can't use anon_inode_getfd() because we need to modify
 	 * the f_mode flags directly to allow more than just ioctls
 	 */
 	fdno = ret = get_unused_fd_flags(O_CLOEXEC);
 	if (ret < 0)
-		goto err_release;
+		goto err_close_device;
 
 	filep = anon_inode_getfile("[vfio-device]", &vfio_device_fops,
 				   device, O_RDWR);
@@ -1514,9 +1508,6 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 
 err_fd:
 	put_unused_fd(fdno);
-err_release:
-	if (device->ops->release)
-		device->ops->release(device);
 err_close_device:
 	mutex_lock(&device->dev_set->lock);
 	if (device->open_count == 1 && device->ops->close_device)
@@ -1664,9 +1655,6 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 {
 	struct vfio_device *device = filep->private_data;
 
-	if (device->ops->release)
-		device->ops->release(device);
-
 	mutex_lock(&device->dev_set->lock);
 	if (!--device->open_count && device->ops->close_device)
 		device->ops->close_device(device);
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index cb5b7ed1d7c30d..68427e8fadebd6 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -72,11 +72,6 @@ struct device *mtype_get_parent_dev(struct mdev_type *mtype);
  *			@mdev: mdev_device device structure which is being
  *			       destroyed
  *			Returns integer: success (0) or error (< 0)
- * @open:		Open mediated device.
- *			@mdev: mediated device.
- *			Returns integer: success (0) or error (< 0)
- * @release:		release mediated device
- *			@mdev: mediated device.
  * @read:		Read emulation callback
  *			@mdev: mediated device structure
  *			@buf: read buffer
@@ -113,8 +108,6 @@ struct mdev_parent_ops {
 	int     (*remove)(struct mdev_device *mdev);
 	int     (*open_device)(struct mdev_device *mdev);
 	void    (*close_device)(struct mdev_device *mdev);
-	int     (*open)(struct mdev_device *mdev);
-	void    (*release)(struct mdev_device *mdev);
 	ssize_t (*read)(struct mdev_device *mdev, char __user *buf,
 			size_t count, loff_t *ppos);
 	ssize_t (*write)(struct mdev_device *mdev, const char __user *buf,
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index f0e6a72875e471..b53a9557884ada 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -46,8 +46,6 @@ struct vfio_device {
  *
  * @open_device: Called when the first file descriptor is opened for this device
  * @close_device: Opposite of open_device
- * @open: Called when userspace creates new file descriptor for device
- * @release: Called when userspace releases file descriptor for device
  * @read: Perform read(2) on device file descriptor
  * @write: Perform write(2) on device file descriptor
  * @ioctl: Perform ioctl(2) on device file descriptor, supporting VFIO_DEVICE_*
@@ -62,8 +60,6 @@ struct vfio_device_ops {
 	char	*name;
 	int	(*open_device)(struct vfio_device *vdev);
 	void	(*close_device)(struct vfio_device *vdev);
-	int	(*open)(struct vfio_device *vdev);
-	void	(*release)(struct vfio_device *vdev);
 	ssize_t	(*read)(struct vfio_device *vdev, char __user *buf,
 			size_t count, loff_t *ppos);
 	ssize_t	(*write)(struct vfio_device *vdev, const char __user *buf,
-- 
2.32.0

