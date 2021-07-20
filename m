Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC03D0081
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30B56E4C5;
	Tue, 20 Jul 2021 17:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC21A6E4AD;
 Tue, 20 Jul 2021 17:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqzL8x0UO/SmddpwBNvlFZB4dClbcImqAXHh86Y6ntJWNQtJJQIpPbQtHwshkSpshA/q20Ada1JbqeZWuXo2tIYPic8loP8MKWrXwwlfjX/RIxkg/U83H2W3mLENe24ncz/vagn9LzSQ+nkCp9+AYbIdgecTN6LSO0Ve22raE4rAv31EJHFkEi6jhdcJaGfJlHgtPcwFOjO82V1Bky2kP/qF27t0GtIiaWkEKVpi+HFHe99zyAorEXbx3Oa4Knlz4InHa2dgnKS8J5M8H9eDJYi6U4glRX4Cy1HSG/gMWTzSkf7x4EEiCD7/FuPR+JyeWjZELsyCuQZVvzYcZxtNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJA9j/OugUqagLXMaaKxFUld5m4KW50elCDaxK70ehs=;
 b=gyeaCnvKpz12QdrWcOHY48aYnM/ure9+Q8SLRMXMV/bzj2TMWEKCqDmLVd4qlBYMlCLvMCPgjyFAmBYZ7+leLQ+XM39wv+8qer/PWEFhDNQpPAI5sk28XLnZNBUBF0f++RXdeSCW9xMu6omVgW3VFamBw2LbSV+j+MGjfe6tWTvfUBx7Y9bsJOJe/+KKo1dmCvA79FA185Fk4S8kYSbENrQLZ4m+c9HALzgKaBXOGYDBt5UVFmKf9eXPzubFYRwqeFfuM3z+LVxY/mdPmHUTajZKccDEDwhC+zNenVzRs1xRKegghuSwj2ogJdmRdf5iSbrYUXomaworRtbiAea0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJA9j/OugUqagLXMaaKxFUld5m4KW50elCDaxK70ehs=;
 b=AnwDS1ACvRDErN+oW/PzVI5Ef/ibK22ooahQ6bKXnBg3lrO6qpLtEykKXGzIL1FnzxOyXRUQ7NwX8ZyI4mIXZyZHksIK7IkNigC20bLri/K+Tqi4adcKmT+QBTb+DTta/GsB/E+lGdiG0AK6ta04uPAs4c1TVWeo6VsknFCBssa9VE0PClWDo8VdTn8njpD5BXaG9tn64ezY5z+9zZ+Ncgf4EEUbRNouupf88CMe/9hf3cWBYXlUfkocu4dOWMtEfn+e5pJGzEuZAewuzm79e5Qw+luv985LumogbjuQ8fCV8yvhAK8yCWpLYjD+RDPU/DhYkMvORjGLLGqh1vgspQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:04 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:04 +0000
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
Subject: [PATCH v2 14/14] vfio: Remove struct vfio_device_ops open/release
Date: Tue, 20 Jul 2021 14:43:00 -0300
Message-Id: <14-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:91::30) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR05CA0020.namprd05.prod.outlook.com (2603:10b6:208:91::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.13 via Frontend Transport; Tue, 20 Jul 2021 17:43:02 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051FP-TU; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4842e168-0cc4-4db2-8f73-08d94ba5d2cc
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52885B84B9D0048E81AD32F5C2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pEtrm5ZlK/1uDeaYOjQYJN022DCvi1VSlKCYKAYHPQaHXJIkrKyY0X/ffFHb6N7ohyKMprydIfwGdONBDytKrmEZ+ySRHWL0Y2i7d7xV4nHfeYVcQO10F+uGCP9Rp3GIQ0+vvlBg0eT5UKHGd9j43/WYzKm2aQk/+PbKkEkrHINlI6ineU/L3Llxwc8BC+vhrfeoxZvLLQU+jNH45b0nt+4VDe/A7+G5KVsuiY93JnXhhcHSB+HOpuLUEzyzq1sjt7iQ8/am8efRdP9MUeGkykr/BrDoeFzaJWWpg0+fcThi0yKVLipkRby5H5nnLDkyaur43ucl1v7mbT3pu7idxg2Ey8YO5iA38eOvXAim52tEcmVY47pq/UgjCQDZOex5yXOEf+OBhy9LU4gEal2qOTNbLDMUK/NeLg01GgoKKiCE7AAdiYMWXvgcTkSRMOr2kT5/olfWPbi83E03edPp3ajF2m0lgnEqQr281KxyfQRDAHqFfXaAKG0wMutNG3vF7u5sEB7+FgBmKr3VCrknBOJ7kPcF5oH0nWzG94Jckl0LAsncb0UplONuGkQ7GWhyQB6Pe7GQoTqn/rsLgXhTHr0PdFIPuAcQsJDUMEvEZyrQWebFLhGSIFL3Vgkd8xyDBAfKWx+8OPYW7/b7vInEQQ3V17Rd6QyiCM+mv8mF06JBcMKmUDJNrfMEVWBNCUhe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SPWhJwl+SG9TIhUuO3Y7abLy+0BRFwCudQ7LUOZbARpIdu+9UyM7VjzMA9hb?=
 =?us-ascii?Q?GJqHEUBbWs4iUeTf1HxW+/e2gsjWcl77v/v6QxMX49PdVNW7UA2vlHhjTJnV?=
 =?us-ascii?Q?/aoLhNYqsnEW3Lw+wSdFQsKUIq1eh5bIMrfdfEL4QS7EMqoU/s/zrMkvdBYv?=
 =?us-ascii?Q?64xkYMHcnfK3sQKh9Z2qgGLnZtWTai5giA1GKewosYYM6vJNgsgfnazc2fCk?=
 =?us-ascii?Q?6zmyYmTOCmdkPR8eN+sRUgv+pVRa8rPH54AmFnqD3YFAKoRI1eZqTMBo8Lq+?=
 =?us-ascii?Q?5Lqu3qnrpyDTTe9jiQgMSAWbogFB46qeu8F7H6vDEnkLnluYFJKuq5CpyC22?=
 =?us-ascii?Q?dGnH2lFgr0Z8L+v5soFJClGQddf3a7FxvutyjA1nwuZ8lF4W90qYtrhkR6l0?=
 =?us-ascii?Q?6Mg1Z5c2p9vvGWR7htHrsqt7mwULGhRldvG71Jr1nvisLtKESXXddyjZU5+i?=
 =?us-ascii?Q?IqS90JCLJr+WEAx5h0bd5dOwug1jnduDSFYF9HERKxwwimhIAdqBeR9VoF/y?=
 =?us-ascii?Q?ILWmvhuN4BHGhkmX+HZaT0XId07P3bBLoLtpVjDkbz5GcK/o7ahJ4SDs68jw?=
 =?us-ascii?Q?7nHsxhAW/q6ZMtrrlvVSSekQoN3vAxEma4tUNtfEgvJM5zvO1YmIhKj27iQ3?=
 =?us-ascii?Q?DkxYwDO1KVh3PrzrQCW3/D3LsQIgvmjakV7HPR32jzxlBkMKmvMg3DOCJVoX?=
 =?us-ascii?Q?Pod2CFB33qspb0I+ppEOs8LuhUSrOgP8XX7M+r5vNbt2hpCsaHytS1JZ6MIy?=
 =?us-ascii?Q?QGIg3Q5CIiRpkPHJnSk5z6LbkpYvL6qS82IVXfKMG/WDOEl+f6Sl/PAxXlKg?=
 =?us-ascii?Q?qJAx5xTQgJyCm91HuHicTYoWGVJAGtOUAvbAAYt0PYVz8t85l4K7cDJUtpRL?=
 =?us-ascii?Q?Bn9QOtM1qJVYitagWVRFWoli9mayeAlQQDy7Jxmk09RrDfk9VUKtKUQd13ZN?=
 =?us-ascii?Q?fxFdzzbZurmZ48aB+uEg7UHB42rAFvMPMFI4bfbCONGcIHWMFaRX56hy6Fe5?=
 =?us-ascii?Q?2oAeFNoX/XaR7EJakkXUGQuG0xGbyvVB5sjW7veNIEymGTsrmoHQnxOIEcZ/?=
 =?us-ascii?Q?BC6fOBBE0oD7kLFklbe2OQazwohHrIXwOXHx1348FEpcKByi058YFHSoRLSy?=
 =?us-ascii?Q?ktqsSmO/NEObsfYmtb+OF3N/J6GuJ3/M2+csPYx6lobN14ErcEXLBnF1Nrh4?=
 =?us-ascii?Q?rhWLtG/FHl6bgLY/Yc1MSuwmRFklkNUP2UOTMcrgr408nOZCuEVkXNUAFgWY?=
 =?us-ascii?Q?NGOuWl74WYzMkzcTb2RXm5DACIZ75SWYPZtSrnM/0qkn7n2rKcqQkUoWkUVH?=
 =?us-ascii?Q?ZzKMTHU33ul9AR6rZ4ZglFYT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4842e168-0cc4-4db2-8f73-08d94ba5d2cc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:03.0254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22pEo8/Y/WIs9Ap1P9GySkOW4gPGsyy4RblxVqQhDbHoA1WYnWj04Y/KOEeTw3lp
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
index 7e352d68b1b01d..bf06ab2d536997 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1477,19 +1477,13 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
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
@@ -1516,9 +1510,6 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 
 err_fd:
 	put_unused_fd(fdno);
-err_release:
-	if (device->ops->release)
-		device->ops->release(device);
 err_close_device:
 	mutex_lock(&device->dev_set->lock);
 	if (device->open_count == 1 && device->ops->close_device)
@@ -1666,9 +1657,6 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
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

