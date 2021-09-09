Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADED405D91
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96256E920;
	Thu,  9 Sep 2021 19:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8E46E904;
 Thu,  9 Sep 2021 19:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlUj6HWxRVhCTf/sfOTWjTrQiimpmtjs7sMoUaYt2IYsoh7aRYEgGtVfz2AZjIiC9TphKAOTpbAEdb65ea8mFE7FmLH6zgCmC58KNq0YoFDfkCKeHWDSyxQicp+NifUH0vRBBMIDyhPkneiDmT23bBRyMMu0erTRmGQT00Z0RZ8YJk+pPPpS7OF5itp+M6dgXgQ5Cdfxr8B9XPOHgvXpnEsbdLsS/6u1FCCermB6rSUEPUpOtKNNpOHnOfYm/BPYtJl8dUaV4HPhZId6VhJUw4prZHoajMKnmpkeTvLDI4cLTt1Ej+yfFrxLf8/UA/+S6JbB+v7MiEgTJb6XWMHl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PcKn49kuKzyqjQONMR21sMOn8A5Ij+fUrsNk+dyCDro=;
 b=IUYs7zAF+39GrZh5ZL8+f4qg2XbDDW4T+6G/25TikuuGcsfv63W3yFqFSjtMpLyAiyRDhXrrpEbB7oBOq0793/3ujhmWaboaM2Wvht7/K9JUqlCMfEjes6F+Zjo/mSMdyphb5AxuK5yzJWM/+8clKFaWspXWjTwlXhy2reH4mgbzhSNHHh6YtO/U5jMd8O+ryCsvb6B431Cp49/KQWZcD6K27lI6/ppkelqcc7nNjDhTP8P6YNVnn5e8Nwkh3Om5YXg3mSQiUD9SBh5Y8Is8U3hSu5btzyjHt6fnZ1bxgq4Qofh9pFcqXQjgmL+kAgBQKhO3KS3gWVg2F0s8vjCFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcKn49kuKzyqjQONMR21sMOn8A5Ij+fUrsNk+dyCDro=;
 b=TQ7aS/ulLqA6vYGwCFkQozo7uKpJKEDR00gIUILRFYD0BViU7E1MadWaVJw4sur1+vuZ57GiwWBVyCl5ftfTCo/XWL+67LZWpdeX2QYlu6xGOok998+GuENHjdOapVtgHpg2aXo1XKJhehTqsHk+VNdDMDAUxgWiPZEmmNlktXHDxHiUjnlfjMSDVGQruIeNJq/dgVbWhzNAg7Xu2xK6/yINF2mcsnVMOgs1u7at5PYwYbjfZpLaLg7j6jF9IFts3aMq4Uq5f5KSZW65DXLiZVNtDTEl6AisrUWVlkcOy3U3MOndsHfx25XNlb457c/ZXyv8jVPznYQ9rK6HkEcPYQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 19:38:52 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 19:38:52 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 2/9] vfio/ccw: Pass vfio_ccw_private not mdev_device to
 various functions
Date: Thu,  9 Sep 2021 16:38:42 -0300
Message-Id: <2-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0021.namprd18.prod.outlook.com
 (2603:10b6:208:23c::26) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR18CA0021.namprd18.prod.outlook.com (2603:10b6:208:23c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 19:38:51 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLEq-Fv; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6be3502a-9954-4402-b6a5-08d973c97389
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5554BF2F2724A4FA3DB9AACDC2D59@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qEdiFgo8Ek/4THUmz45dhziOFw8DYruptiFm3NykCOjxgWXFjTTwE/57hJMjDDiQ8aXLTfUpd5AGutqJ0FcpSNge9zXPt6CeLboC07WCXIR9ahzvntFfvYtuSoBOu1MkmXBKULy1NSmzQqtrSgZEJeHIuHGDt7dNfxOiAHGxnSRC446laX1nmay6tFNeJ49ofwwbgpKWa2X0zStbY9CryP9APUVpw1NhA+oR7o3VQVaC4/VDuM+T0DpN1PC/kQqkskZ7QidqwEja017FnBaXS29mBwn4/93DGBp+Mqv28rE9P/cF9KjNp4ghKeowaSAuxQg/yh4KR8kncwBXaftnndzctPmjcPnFt3nEHNAZk4wLiX9tQ8GfiTR2ADPGXO0KPlNfSPKDd3v7H5HOqhd8j7pVbJNewHaAeSJBLXzI7UaFJDlMykO8nX/iYnXembCny0WQ4CSADK5SzYjURqQLRH2xElMubZHK9ZKwDWyr5kLfe19VvH/2o804dgFtRvhPnVzACBmsuY3Hly/AR+YYtUjO9/xvzq403/DODiemzE1ckyPbR/ysg6TXa0M9N0GY+yZj+cA0jZ/NEqpZupRXwkpjrgpjpbdj4jFR8JHVNbiKWqHoGOWWVHjmQbJhWN2xVd7gzMIyIEkgSXo5QEEn3pjRWldsznp4dNRNBvfFwRNMN1boSzIKruRO41EuQdm+d3eycglIcKaRHiVh5xLXDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(26005)(4326008)(2616005)(66556008)(921005)(66476007)(426003)(66946007)(9746002)(9786002)(5660300002)(186003)(83380400001)(86362001)(508600001)(8936002)(6666004)(110136005)(38100700002)(36756003)(316002)(8676002)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: g4ZffeerMxbZy8w/Zg1j3kLMhH4CwfQgxYd516szNWVRqZh9qwhPAFoV+OkdR9XwYOsYo1ixwBMxfWY+D/Wp+6M2T0/bJb2e7yLo3742hPlMblp3IJBLTCNVfw0RY0hogTcBnOJx83bfmxIiYYhhnM8AEmgeiKm0wy8J+Q0IMfchgVW8Z4cfR6ZlXb9gaPVc3QLIXGkiosQzqnp+6+nU0rmWIxxwF8guAvsjXV1ArPKG48sGKKS3RVmIeRt4XL7Q3o1JHZYZlbnzoeSKK8USMnkx2c0BSg7+jWSFzaPRQDjuRsO/ukga+QwCL6Q0uogVTtEpNQkCjteQmFJVimq4LWgJFk3LalIDim7jM/48AA8MT5retEsw44qEh+YHx2XW1agcgEcPV5PIBxhpe+NC428IjbqeP2kCBxaB5CfNWp1Smm2mpj/HYfG8Qbpk2wTVK4phTQqfyoF8QEDyiZVpF8cU67+YTnz0P+pFvuRM/AQdLMD00mflH/8HIPeth3pKJmgHsilzO1aAP9WXJffYQ1hp/xVbQwcAjMB5DycORtPRvV/oqsNTpc6gR/NC2O9JADO8NyvImUhZzctGXdQkX1tQmoEmmczgl92EDC+wl9iVUrODD1XqdyV6NpxPNNtPnIcdZWMbufOkF2WepMZzkiYckEy/tvnDtWj2fzECxMAjfpRGAtTPOpc5d7qxm6JXqllM3VMyMsmmwJEGCDd7lFTH3TiPNdOHvjx/Pm0zWQfOzEsl6ZLKVCXPpV7HU43D
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be3502a-9954-4402-b6a5-08d973c97389
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:51.6359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8WnHvk53W37epO7m8DjNK7CWqdAdSSrUlh/ECxrsOFkpBRNLGR9ffSqx45z6ri4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5554
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

mdev_device should only be used in functions assigned to ops callbacks,
interior functions should use the struct vfio_ccw_private instead of
repeatedly trying to get it from the mdev.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_ops.c | 37 +++++++++++++--------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 7f540ad0b568bc..1edbea9de0ec42 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -17,13 +17,11 @@
 
 #include "vfio_ccw_private.h"
 
-static int vfio_ccw_mdev_reset(struct mdev_device *mdev)
+static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
 {
-	struct vfio_ccw_private *private;
 	struct subchannel *sch;
 	int ret;
 
-	private = dev_get_drvdata(mdev_parent_dev(mdev));
 	sch = private->sch;
 	/*
 	 * TODO:
@@ -61,7 +59,7 @@ static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
 		if (!cp_iova_pinned(&private->cp, unmap->iova))
 			return NOTIFY_OK;
 
-		if (vfio_ccw_mdev_reset(private->mdev))
+		if (vfio_ccw_mdev_reset(private))
 			return NOTIFY_BAD;
 
 		cp_free(&private->cp);
@@ -201,7 +199,7 @@ static void vfio_ccw_mdev_close_device(struct mdev_device *mdev)
 
 	if ((private->state != VFIO_CCW_STATE_NOT_OPER) &&
 	    (private->state != VFIO_CCW_STATE_STANDBY)) {
-		if (!vfio_ccw_mdev_reset(mdev))
+		if (!vfio_ccw_mdev_reset(private))
 			private->state = VFIO_CCW_STATE_STANDBY;
 		/* The state will be NOT_OPER on error. */
 	}
@@ -311,12 +309,9 @@ static ssize_t vfio_ccw_mdev_write(struct mdev_device *mdev,
 	return -EINVAL;
 }
 
-static int vfio_ccw_mdev_get_device_info(struct vfio_device_info *info,
-					 struct mdev_device *mdev)
+static int vfio_ccw_mdev_get_device_info(struct vfio_ccw_private *private,
+					 struct vfio_device_info *info)
 {
-	struct vfio_ccw_private *private;
-
-	private = dev_get_drvdata(mdev_parent_dev(mdev));
 	info->flags = VFIO_DEVICE_FLAGS_CCW | VFIO_DEVICE_FLAGS_RESET;
 	info->num_regions = VFIO_CCW_NUM_REGIONS + private->num_regions;
 	info->num_irqs = VFIO_CCW_NUM_IRQS;
@@ -324,14 +319,12 @@ static int vfio_ccw_mdev_get_device_info(struct vfio_device_info *info,
 	return 0;
 }
 
-static int vfio_ccw_mdev_get_region_info(struct vfio_region_info *info,
-					 struct mdev_device *mdev,
+static int vfio_ccw_mdev_get_region_info(struct vfio_ccw_private *private,
+					 struct vfio_region_info *info,
 					 unsigned long arg)
 {
-	struct vfio_ccw_private *private;
 	int i;
 
-	private = dev_get_drvdata(mdev_parent_dev(mdev));
 	switch (info->index) {
 	case VFIO_CCW_CONFIG_REGION_INDEX:
 		info->offset = 0;
@@ -406,19 +399,16 @@ static int vfio_ccw_mdev_get_irq_info(struct vfio_irq_info *info)
 	return 0;
 }
 
-static int vfio_ccw_mdev_set_irqs(struct mdev_device *mdev,
+static int vfio_ccw_mdev_set_irqs(struct vfio_ccw_private *private,
 				  uint32_t flags,
 				  uint32_t index,
 				  void __user *data)
 {
-	struct vfio_ccw_private *private;
 	struct eventfd_ctx **ctx;
 
 	if (!(flags & VFIO_IRQ_SET_ACTION_TRIGGER))
 		return -EINVAL;
 
-	private = dev_get_drvdata(mdev_parent_dev(mdev));
-
 	switch (index) {
 	case VFIO_CCW_IO_IRQ_INDEX:
 		ctx = &private->io_trigger;
@@ -524,6 +514,8 @@ static ssize_t vfio_ccw_mdev_ioctl(struct mdev_device *mdev,
 				   unsigned int cmd,
 				   unsigned long arg)
 {
+	struct vfio_ccw_private *private =
+		dev_get_drvdata(mdev_parent_dev(mdev));
 	int ret = 0;
 	unsigned long minsz;
 
@@ -540,7 +532,7 @@ static ssize_t vfio_ccw_mdev_ioctl(struct mdev_device *mdev,
 		if (info.argsz < minsz)
 			return -EINVAL;
 
-		ret = vfio_ccw_mdev_get_device_info(&info, mdev);
+		ret = vfio_ccw_mdev_get_device_info(private, &info);
 		if (ret)
 			return ret;
 
@@ -558,7 +550,7 @@ static ssize_t vfio_ccw_mdev_ioctl(struct mdev_device *mdev,
 		if (info.argsz < minsz)
 			return -EINVAL;
 
-		ret = vfio_ccw_mdev_get_region_info(&info, mdev, arg);
+		ret = vfio_ccw_mdev_get_region_info(private, &info, arg);
 		if (ret)
 			return ret;
 
@@ -603,10 +595,11 @@ static ssize_t vfio_ccw_mdev_ioctl(struct mdev_device *mdev,
 			return ret;
 
 		data = (void __user *)(arg + minsz);
-		return vfio_ccw_mdev_set_irqs(mdev, hdr.flags, hdr.index, data);
+		return vfio_ccw_mdev_set_irqs(private, hdr.flags, hdr.index,
+					      data);
 	}
 	case VFIO_DEVICE_RESET:
-		return vfio_ccw_mdev_reset(mdev);
+		return vfio_ccw_mdev_reset(private);
 	default:
 		return -ENOTTY;
 	}
-- 
2.33.0

