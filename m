Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E53D9A7E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5C6EC02;
	Thu, 29 Jul 2021 00:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148836EB72;
 Thu, 29 Jul 2021 00:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4bKw0PQvg2tP6alGI8D6Ah0DZTyjgD4vYTy1DHRH8aFbNWmBdt4ekC2qYfmYgkfPfQK4+ZcVumHAAylQXSbw/AmlIfHdf49fB6cXuUC4ALFywQIf4O85bAdD4Lo+NE8pe+4NskOao62RpR/qJr05ThU9lxNY3/wCQO5XxYhNQeQH6gnvm7fC/qzeONqjS/fmxWG2n1mFrVU3m3En9X+SUoXOWmWY5+1E6wi446yGcM5IC2XZCK1V3bdlb6Aj9EnNGwgtlqi/W0B0r0Jdwg83tOgwTKAcMnQLhESMl9fZDBMO0lmZVnjaORbOlp/1IJzWw5HSPbbeOPqISUyBMDSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kGzbdLOAyqwMUL/7tzX4tOpWDuigyAjkq4OsdYLB+c=;
 b=Z+1LvznOkyzQgLtjAhk/JGl+tCDZAca4N/qdQ24tyy6D7MwfER58/swPa7JYv/9UlBRphR3oA/xzdomeetfVOsUCQNmsqk4D7I84Isrp4e6Ac9PyjZGPum+CUa0oIo76MhAvxKIEaeKBnQzOy1En3E4/yJZpTEFkBw4MO5xY5EKXASHJ+ED1H52C4nUGictKOUwRO1sXVypzNGJ5oiDeFLf+n3ORyp9mZU1GKXxkPhMJ17mzBRFmywY5TrsujDwtc+zLXHXtRYXww2x2XzjQmkgVsEYWiAchRrEBUml1z5dfE6z1/3kjB1P3q6TSOT21rMI7YANopnxL8ubyynC5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kGzbdLOAyqwMUL/7tzX4tOpWDuigyAjkq4OsdYLB+c=;
 b=G37Jbyv1n7jAI7VEKbvZ02nw7qtmGxeXIBvsupA8eNCorKI8KTjFnTSCiaYgpO6mMqviIZ0XeCohRthM0HC1KPdEX/ntie/u0f301EGZ1GVQ1U9hu7gDxqowBwOH6fxz/ynCu3OnI6wcOsjudS1vCWZo4Lm3MPgBqUrGF/oxkaBAhqWbOrRmn0VXpF6+ziXdLvG39HcT2QOmIB/bnIKzLjCCOcyQsN/2nnNih1GRWDTCEZ4Xj4v/E70xoXFkOD6p994IPjZxpcTKJDiKqQh250nobbmvHxgZkLlLnz8kBbSa80NsZuegHllwRbY13zE7eQVInRV63H7PL2NV4TjW9w==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:31 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:31 +0000
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
Subject: [PATCH v3 14/14] vfio: Remove struct vfio_device_ops open/release
Date: Wed, 28 Jul 2021 21:49:23 -0300
Message-Id: <14-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Thu, 29 Jul 2021 00:49:28 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEm-009pnX-BZ; Wed, 28 Jul 2021 21:49:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04bd2f64-b219-4afe-5254-08d9522ab871
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB516089EFE21C49650133EEBBC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DtUbLP12ZMjwOvdmRlq3B0iZfDZXHLXsCMAbKEpBz0YIZUNuNkj1prCp272ixDFGCSdgye+OnUMSMoZLdZXbC1higb4cI0LNoig05vZL+xhZEY2zC0f6UTb9Pj3GiDVNdF++qrObbRCnhVTJ+TWcIBAefLFnAhSw6oRvJrCUg68RRkbDjcOj6A1niA/4DaZ5S6dSwIS3gs+617lpSWSD9dPghdhYP16jz5MknNksejBjcqU3oSaFAeYKLxTg8eaNAI8yvZw/DLsvvcuwNDRkbs0qYzYdRHV2asUPQTKC5kYhVG+sgHVb1qZtgvcvCPXuJ/jCUBGdZk3aaA3Tx16VRbvpFJ2RkE72YIK5mCRVrwtIrQqMpD2Bux/v0ocK2Qygc0fjMAqSIAE4SixReexxbauMlq+YNZnnh8sK0QFtku8fDb+bbIS24TGvyQbjPaVAgEchQPrT1lkxqkw9o0p/NjWfqcJHrglTSxEw65tdZ0b/H8I14FXCr86YEYUSCjXeZU3dB5spqiT+14yUeyocHUu+eMvDwrvuWzRcz+enRz6/IOMX35AcPSU3Uze+Io2eAIL6qf1fOPCNms4xX7ogz/D87M/FlBeJWj2GyQQqfTAwAh63fwAgde9LYSuMuEa2jZ3p1vZH1cHUkh1kfZFX2kYNQthv4faOnF6R4ykkuxsD74+KSEpaNS71+NCG28Pa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EQvDIZ/FXUxZymMlmm/RbnDv5jX+Ety4YksUiCSNuL6/QIp0ky41yDb7EG+c?=
 =?us-ascii?Q?tL2Udkuv6qku+ChibkTyqaIHKCP4aZEHFqTC/UV9UZvkipC9gtq23MLC9Mz4?=
 =?us-ascii?Q?i6HmHvpJ/kxXJTQmd2ji9sZa50/QksmQKI8kL1SGCNvhjJoqWr2h6+dHMcX8?=
 =?us-ascii?Q?rzsaPh2Fx6J15sTWnDd7+HUHtlotNJHLRtFC6ubVG3TU1G3Dcm83csQScRkB?=
 =?us-ascii?Q?K1SgS+JD5WQjuDofQrdRdQ7hA9whxEPktIPManHESbb3MK0tQFwG2CRaDLO9?=
 =?us-ascii?Q?wKs6LOncmw6AwUy74KD9rTZhpBRr49aFbNOldVLpkvfGpohQRsaNPH2KHmho?=
 =?us-ascii?Q?l1HtEenO5ah4PjKzV0VLYbNB2tlrNfV+9wp8rr2Pe9lXiKfMaD1RghtTh0WO?=
 =?us-ascii?Q?XRzEk9SCXWoXhnkQOsba6uX/f74kilkBd8V4QgqnN1zVdqRmskuyQuV7Ff7h?=
 =?us-ascii?Q?Sj/1wHLzqTMcFZAP/DqtSSRA/rbsjbTenPKXa18Fu4qxzpu5NrjQGW9QeZjA?=
 =?us-ascii?Q?+Mxi9JRyinAic6EEbHLZ2YkRV3TrykSDsuc1GEun2BRYRKs5FvJGqW2ENG8j?=
 =?us-ascii?Q?EjEqgTsJDixjg8x1eROxUg2P1yROpidv26vD8jtU35Hm/7wtRgKkKUSfAmmm?=
 =?us-ascii?Q?klPHIL+3aDiWiRt+sioyBtdEDkfbCIRX3dInlG/AWodmoDk6wgGfBLSop1QX?=
 =?us-ascii?Q?8/WqLsV5UItVt3AkM5lmrujwkmdFV6CFscN0rhQozFn4huH+Trm7uzDNsbX2?=
 =?us-ascii?Q?NowciUbvqCGtaZmTsbIWAAeciytK0XtuW1ZxUWKCrOwpOz+yJMAeTiOADcUw?=
 =?us-ascii?Q?nYsmQKemMRWPKVWzb2dpD4LlZcxtGBSRLE4c7kZ6u4XhIcuYn9yvPXeJGWYW?=
 =?us-ascii?Q?6dWf9bTtP/fNLhPsiLt7f15nJP6tgRXieMrvvq97pF+Uo232Bef0gjG76Yco?=
 =?us-ascii?Q?ocJHtW+NzyWDbdjEf4C+CX0o8HGcWft0ULnjN72lrc3QArEeF2saMGGjxfK5?=
 =?us-ascii?Q?0bO0rzkSXMyoSHoSIn4eEW+3fA2wtLtGk3yQHs8M5DL27rEdBbo9fIuqmVeG?=
 =?us-ascii?Q?zJlT5yi3i8K3e1HElw5OJ8gxwQp5q+P3ockHR7O1KJEVYmAE88qst5CFzood?=
 =?us-ascii?Q?cL4GaraJRC7x0ssCjSuc9hxTX504Xup+nOAywwSUC/vMPL7qT4aQWWqSkTrq?=
 =?us-ascii?Q?xxYkO0CfE2QVhsx0v4zG7P+ip0/QbwkvA9BO6AsI6lPT9jePwQ64uwm3SJ6L?=
 =?us-ascii?Q?q7kYjmmk+J6oe9CQ7iGj+0Tzu6MuetUBVQEZso4zBkVWq6GO7ZrKk/h5rsVG?=
 =?us-ascii?Q?wsJS6H1lzMxxbeL1VyZgQUux?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bd2f64-b219-4afe-5254-08d9522ab871
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:28.9201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDDadHgydpi3D/gvClDRCmDl4MX2g3i2a8ZPzMKF8iQz+opEiGtiyXX2BpPiPXe/
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
index 725cd2fe675190..5174974e5fb5f9 100644
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

