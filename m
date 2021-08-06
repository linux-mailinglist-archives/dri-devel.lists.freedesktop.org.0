Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DC93E20D2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5076E930;
	Fri,  6 Aug 2021 01:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978B06E90E;
 Fri,  6 Aug 2021 01:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6JAPy4BRxH4n2HT8xPt7fgfwXjNxBuJc+yzhx9fh25S5j4p9OldI+lt4EOwwFGCTrNhiuiIUAmKzCqx0lmKnMJ2sxPWjt5whZDBCCstQXo0ZLFpvchRW+tMZthv70SYuRCHjU7mg73dGaRkGpr7+bObGosc9TDohV1p0vxgmktlIAjguBp+dc26Y9cXtQ4eS0a7mwwV14K+p3rvAB6B0VkIG7/Oxb4FsdPArhPvf+o9VlHOJh/OsM4jc76Qeg65DS2h5Bbb588630dgbpV8zWiQ1vE3T9HNO4Om67BGeqho8mQ07fpXJB/jqHD3scRDvztBo+Ti03dIKxuqqgM6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83SvNNMFxShsSJHbYYBvHzZmrJdQnCIO0bn6/ZQpYN4=;
 b=QDgllX/yd6kRx+GVyxsGg1LmFOyTxsI2Xq1aZeNYkQXtoANpexxh2ZeZjx7nwKPxpE0URlltl6VEWlPVdylrknDIt0KFoodQZUCOJaJdFU82jp6RHzHsxKMJwZGRbRNc9T5WDhMWZkUZUVBiuv+M9dPp7lxpScrg3d1f+PswvPQXaPkzrKbfOJF901pp7nWMvECppMWlPr+w6J/uVvCwY+SMXPdP52f8BEj16dZDMTIz2DxHZtua+P+YLZ9WVDMY7meXpTg39Y9BVKPS9xQX8LgKvhAPKc2Wd67IZ/Q0gGU067RG+KjXYt4JV6xtq9QoHS+YPBrU30xzoCD0DJXIaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83SvNNMFxShsSJHbYYBvHzZmrJdQnCIO0bn6/ZQpYN4=;
 b=O1naC78VubeI3zlLYrcjRQUXb3Zp0X9qLdJPYk6kCKgTU+3XBayhz694bGqFR1Bs+UFXoDKqsqkhWZQC+zB9B0Z3zuyksCrODo+uYlZKKCHYM+GOq1Zhkxnj7zPBS9eLT2Rsn0wEg+WV2v58QLH1dUzckoZgPCzmcOshffcoyVdfHaPl3QyAtjAKmBigVohHvaMmAxUI8djPzDGFreJnk6Qfb7uQGmO0JJvgydXqApXuMyOjd5v6PwUd5RAJaP3PmNbW/fSXseR4JDKyvCTKGTC/FbK61+iFrTTYfk8RQVG2IWechNXSpHcH8I1EFRgSUTxJRXA32bQcf8dF6+Cxbg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:15 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:15 +0000
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
Subject: [PATCH v4 14/14] vfio: Remove struct vfio_device_ops open/release
Date: Thu,  5 Aug 2021 22:19:10 -0300
Message-Id: <14-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:207:3d::18) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0041.namprd02.prod.outlook.com (2603:10b6:207:3d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.21 via Frontend Transport; Fri, 6 Aug 2021 01:19:14 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt7i-Gb; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45fecf0d-4cec-4ad0-8d8a-08d9587833f7
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52063831F7D330717414574DC2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUTD5yBdQ/EXgEFgfcs1uxZfEUQJNQo5K6IYqCOVO+M175ggCAFFMzM5OCHVIWWb1WCgj8XBDWUgPs+zOe6AhKx9Qw7sOzYHClb6STJ5Cg8KVbM/NXw1vCBB/DeQ6aWxA6IigzibgnzSPbj1R0g3lRoALOHI2+NqGasLDgYJ92b+JzVueflZD7rF2kxjCTUxlwjg81XLkmC4QzJ/Rc8SzK2tY3PrSIabf/Pd2EFdlPIZPo1YMlHzx5glxaoO98owAIHyGRGvl8Mg2aP+zTD9nz+mIiWz1fxNFXIZKpXFGf1ITNHMjsShCjINy6yrbqWTrx8ZFNql+abhQxKKGipD4jSwWLnV/FLMcz8Rd/pcV6shiHY6pB6tKROReRJpZxeWmziopOCGjSQ0FJIdJ/GbA0iUQQNtLdgyTgwSBSFzH697aUf8I9yp3KyRPR1+AtNSM2CsuNFuMh8cZ9t49uINy43RXbZBcl/MoIrhFP4RrHDfhlF3u2VCYQNduyejkYV3Q2wWBDLajMt1mGGQgeDhxlZ/SBMsdogfv4IYxxOdGiFScx2lT5GEbvHwgikqiS2vLZyqN7LuvzolK4PGBzLHFMA9RhpxtLTcYywBYmbj6O0HnpND8Da8mnyJwcRGWFEJjD+keRSMaU6hOwN1aU+O86bX8d2XAvLlIK7eaWVmTZvGYKekoDThsu5D+LA/M4iu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(66476007)(316002)(4326008)(66556008)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4JN2mRiHTAQ2278J+lwwpnMHW79h8EBQak5V3KG55D13mcWkC6HaELv/c2Dx?=
 =?us-ascii?Q?7Wo0a2N30ol2r3ABO0vBgN2gtk+RfGf2u4msC5Y7gpQxvU6yR8WtWo3IsWm2?=
 =?us-ascii?Q?y3J6YX4q5lUhSuxedw0Rg0ohwQaGL2EbdlKR3/VnEEeXXgGWCqW5QWZLpXs5?=
 =?us-ascii?Q?V2mQhZ/W+eSYPhBvGYKSYwGm4Zni8IgBPud6d3aJY8nu1YJbXbPLqK1QNt6B?=
 =?us-ascii?Q?5VyKFIhK0+Osamr7QfTK8It81FPNYkZ+wnF/fLatp+2ZI8qRhkeZx2szrf5M?=
 =?us-ascii?Q?sHgh1oftIz8A/RbAxtDYGsMhPt8dJHyqz9/y8eFDakoakwY/a4EBxkA5dis/?=
 =?us-ascii?Q?sK73fJ+DP8CGA869Fcqtkm/RVZBfpzsW91kC3Ci7wPidwfyka0iwFYkXUdIC?=
 =?us-ascii?Q?4cJ43WHHHfYJuM+NfseIdHNEDU3XQepH8scZDlH4x87bK5oaJN/qdU/aX81+?=
 =?us-ascii?Q?glfMAoCjwgxtZVWjTb+3dflroXwG01pNLVQB8s1ozLh/yoPlBHt2cx/255hJ?=
 =?us-ascii?Q?GeNE90EgwFg96cpOChwlvZXw9mF8fWlx2EaFQ6lOoWL+qX4G7llMLWS45xXE?=
 =?us-ascii?Q?X0bIPQb5d2Ma7PHsvW85jbgdEb6pYESRhWazrwiCCsRejngUv3SFg7oPQfKf?=
 =?us-ascii?Q?SLOSvMSmbfyhM0g6geiRSKh/Wh+uLFijwE+o29TW4vT1j+bICpeAeSdxXE1X?=
 =?us-ascii?Q?mpPPEV8CX1xZXVAnHKNtwKKvNONqXXc4esOsFHaHxoEL7ZnPOKuVNKn1QJMd?=
 =?us-ascii?Q?NudkRfEaAh84cXu8rAs92yfkTYRD+cquckJkHxYptexYiJDf8unT0/88vd8d?=
 =?us-ascii?Q?P64OdeK7D6iN9v3Toq6FXpwqGWN5aJ3Q0tY2Z1XH7AelyUo77SiyqdCq1Iqp?=
 =?us-ascii?Q?Js3zSS6CHfPPNl9anbKSxkj2s8mmGZoApVnhe+AqCzQD5CUEzxyXH1nQHKIm?=
 =?us-ascii?Q?hv1Znj9dPG80IC4ud7iTgJi2E1vjiusP/Xfw7ljjjksVy7UNOdZXHelIismY?=
 =?us-ascii?Q?rRfEFJ6NcMng72AiFruTLA+tB9coatuWoH3MPXnAigkOAHxY+//TXEjzriZO?=
 =?us-ascii?Q?irgyQbd1YRH4er0nO2+9th285MCLSmhSIBlcshYI+bAUo4o+V72jEnjAzN7K?=
 =?us-ascii?Q?NOXOMjb8yj1MwlfbZ8aSbxM/U2JBefDESogCifREHUM0IMyeXMIizP9pjNxE?=
 =?us-ascii?Q?sqiZqlh08xpHcQhtk+QorULfTUa7cYL1KSvOEDzSjRD6Uii0kN4cLcWKpwN+?=
 =?us-ascii?Q?PVCjEwOqZZU5S4mo7fGvUSeRRuLf97EDxZJq0vNb1hDHzPA2La7MbsmEuaki?=
 =?us-ascii?Q?IiAirqgl4aBlO3ahOtSWjYSp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fecf0d-4cec-4ad0-8d8a-08d9587833f7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:14.2430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jImWaXGRa791OI5M2OFGENALduXXMo27QRVTmRe/neYZSpAi8uz7l+7YaOyi8IvC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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

Nothing uses this anymore, delete it.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/mdev/vfio_mdev.c | 22 ----------------------
 drivers/vfio/vfio.c           | 14 +-------------
 include/linux/mdev.h          |  7 -------
 include/linux/vfio.h          |  4 ----
 4 files changed, 1 insertion(+), 46 deletions(-)

diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index e12196ffd48718..7a9883048216e7 100644
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
-		return 0;
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
index 9cc17768c42554..3c034fe14ccb03 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1470,19 +1470,13 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
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
@@ -1509,9 +1503,6 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 
 err_fd:
 	put_unused_fd(fdno);
-err_release:
-	if (device->ops->release)
-		device->ops->release(device);
 err_close_device:
 	mutex_lock(&device->dev_set->lock);
 	if (device->open_count == 1 && device->ops->close_device)
@@ -1659,9 +1650,6 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
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

