Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B03D9A81
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98BA6EC28;
	Thu, 29 Jul 2021 00:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3C56EADE;
 Thu, 29 Jul 2021 00:49:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY/asJAmR6pnTSVl5pKcH9WFKzi+QkR/QMurOQrM53d1fLNA64647tcVRRkCzz4FuSpbibPZLxru7ii1vLPPvMw+VTXpifsOk0QLx4EC1YTgw/1FU+JXjNKj5FCxs1kihwrVnGxX8K7g4NWMkRl2nwtp7IAmIVIOLtJ18xyUJNqJAKjqbMwf1cxHChco8gsaT2OYFpblDe0cKclLPVwB8Wj+kU0UkZB/WfLx3UxAovidcEkBlImLlhw3gkR39ris67XdD3PVfJPDVRKYuokuDw6oLd4jx7+LFJYab1X/XMyRSFVlrvwO/3Wi3q1cQFLVkxAGn6OEirNVxTR01x4JWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hof/NsuNeyebx2fUUhqtI9xMZq/oRkFXXmKUGTupaXQ=;
 b=nM1hiXX/JYunVAOvUdqucS5Sul7rAh033Dw0L9RsfOAbxvVEsnCnoNFMNVcrvgP2k8+x98a5IYjz3cm01iNd4I9dyGJUzXsZiKpFW6rcUhHRPUqXOnPYs/gKwcgu2PJa/yeVpzGyEiHMySp7sU77woFm49In5/9hPDxDl8psHrCyoWbWJHalzjFgeOxWK9i3Ffdjn9BaVpl0U2q3ogtbYVYkiDso9nWgxlbWo1ugpHRMD2o6ZOsx1+G/5vuZRuEiMWc2nrOpGmBpw//+3+v8eIXqR/i565kfwZkC8Ev+KYzQJRgRFBAf9kphVCTqsiopS9X/bxm45Nm16s1kCFXlhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hof/NsuNeyebx2fUUhqtI9xMZq/oRkFXXmKUGTupaXQ=;
 b=Ad9b8xCV4Cr6+qOmthE+u8hGbtUuJZVBUROkdXtX7vq+2od+l0PiiKru2wktwBzS7t+xmoBntsNU2b7rYZ9gkQr5XZr6o29muZbV2D3bC8Zq66gCNue7xYkspIVmcuk9yYdtXTy4bWDC/T6AT56bWH49qqCFnCd+zyDwUwqCINjPPhn3RuRJU382uwnOEPQ2vVwxbMgOKQuQigrHd1Y1xgoDsde0LGtJVxqMCnnewXzS7tgLde1QkWNjt/8iG9ClzC9XWDquFr4adWtc67CdnLM/a9GrG7OFwV6nAgxSfYdjhOg3O8Gozc7MpO2OASUsazeNeMqm0p9mva0mKnm2cg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:30 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:30 +0000
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
Subject: [PATCH v3 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to use the
 dev_set
Date: Wed, 28 Jul 2021 21:49:18 -0300
Message-Id: <9-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 00:49:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEm-009pnC-4l; Wed, 28 Jul 2021 21:49:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1667eef3-ef20-4efe-3eea-08d9522ab772
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5160C6ABBC44C8EDFDBCB604C2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZpuJTjegfs5IX8bUih07NUIzRYsXz+C+OQTovO8ar5gz03y69MNNEqII5QWkSnLmw6ppcUP9FiIOqB/tF8hjC3z5iCT85gKvreYmzVQnGoIRYxJyspOx2Zq2Qrin0PwIR4qlHoMaQK+6bnkny3+cGwOWwZd1L6TY7mbBlxxjdZXDPdXuiv8G8G32kQKoWvnjDtGWAs9qEJGTU0lf8heHCORqgPEXGIYEnmNRJtVVRYND1lVxBILQ4MgSmpj0AELUdmi90ZYeIaJ5IXUTGBqr6uvXUnNPq7dMc+74CbYS/rWvksbOHVMowrzQm4P0xpsghj8eqB3DVaGpwZc/0toihBrhul1VQxcnCFokWz2od8Zsw2irQMKXeXuxL1fM3LdH6e+Y+sQW9PfAtWPc+jenmD0AEpb2gtmO3GOF7KOOorRzfj1MchLocA4aobMm1+T019ndjpdl0VQuKtK+27vnQQc/pcPHK+r8f/NkeVy5qK7wx5Ux84JVs/vW8RLGu762PP+wfIiuKywL9HcBYpCJvnFRpuzMxYapEvY09TT091FVVEn6gnjibGRGeX2zvpuy8LyBNtZA6358amkj0Zfnp9186G3/cLGwt0Pg9dQS/NNQEvB/5NezNJQX6c+rCAisn0oT7CUoDuKQk/VEVhQr4WZwZNzIzDyOVCl1ACR1+9bwZ7srjBt/lhwtqjW969rypvt8Kxhxhe556LFiLmAQCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rYJlyRsIMrrCsfv5TOJVcC9RtH2j1Sgf5v2LsKkLn7mFZAyWuvt+ly/PpyJU?=
 =?us-ascii?Q?LU8mGAT+BiI1RqEW00uF5vTa+kG8MSVPXROkm/rIvG2/FMBidDQsNsCoiuEq?=
 =?us-ascii?Q?fwcdUYF0U/MvnAPDd8I4eLnzqCozONW3i5LVCQr2VsheK6djGn0xYZTyUBvL?=
 =?us-ascii?Q?G8usU0VZylhURf3du1iLIabAmg2SAiX9Q9f2yin5dUQhDZKKTv+0HkzVB4qA?=
 =?us-ascii?Q?NY4pHkaJoJtBxbrbq0/udXOHkXtSFHWL+cmRcJTZmCzmybG7h0tk4CRp5faY?=
 =?us-ascii?Q?G9+dFPisdjWbCXJUcIWP4I8VUw/1n4hqySI4WcvcnTgKn2pmNq3+McmgesrG?=
 =?us-ascii?Q?ZpuHUsO0qSIV1y9ILexKKd//108XFYic9/4Mh9XEeIloK+LcAuq11PtWkwLO?=
 =?us-ascii?Q?vU3PHlODXFwGbT368sbYzi5OBiNbkR4BDOKwOGjTp4nac+Ah8SVakUWYQsi7?=
 =?us-ascii?Q?RKR57p0iSCYJnnQ9DRrNQ7IBGzAAukHAMQXTat+9/diopyRHGFLxNp7q2ebW?=
 =?us-ascii?Q?T2FB39jcf7VIunsmnNOLAMm6hbaD0To2iAAlKnERBPUJbwUqexFZr0YyTEgr?=
 =?us-ascii?Q?B84TmB3YiVkt/WrMSC8DHcKbosK5tvUlmu76T6Lj2V2+pM7e12NCh0oKJzQZ?=
 =?us-ascii?Q?Y2zC9dlLe05sSvA/BygUm2evWxGg0Sw0bhrDjNWX3Zz/raNFTMSBEVWsFquc?=
 =?us-ascii?Q?jX0v4XrNXfdmWm6fj4tbNgGJlFKt8YRhqMfdLhVk8w2c65mdzLR7l5LHGZtc?=
 =?us-ascii?Q?P4dmet+1S1/QqEHWOxWkkLtOfOju0/h3HfMhbFYGarMsJfie3I3QwN57cieP?=
 =?us-ascii?Q?r9NLx7ocGuLXhtrRqoG0rgm4ZecLZm6vrJrgxs4UgS5WxCZMYZYk+8NBF3qf?=
 =?us-ascii?Q?He8HdZl1S6Co6g2fA/EXs0bcr9aNo+Qex5x4/Ss7lGuxaOFuujL6QM/sL27R?=
 =?us-ascii?Q?QVBR19j+rc6v9WHKnsGE6HleNwnuf2rPMLX3MACXaqHoay7Tbxeq7H4KM2yb?=
 =?us-ascii?Q?0wf82CYqCCmYgHCWZRHwHHgkoGDhezk07P/64JBsIpQGzsKUgLteBRTvyDPr?=
 =?us-ascii?Q?9cY1s/UaIqPJP8IFdU7DujLpJw7y79pneoes4odMXJCH2M+sWXkggkMv9tCE?=
 =?us-ascii?Q?c2E+ikYxnb4K1OthsFrYqR39cVTuw5k7/CwP4k2w2RY2N3eOnhOy2ZisNTQd?=
 =?us-ascii?Q?6MgWnubgUcIoSkqikE1LjshG8rjRNOcOTsadBqAyf3Z9HqNVpDjmmkhMXJ+N?=
 =?us-ascii?Q?Xer74YveqGJsqditz7oJQeUlroLJJbxggkHfamB3TmSliY35f+0jHf/sglOf?=
 =?us-ascii?Q?Zqk4Zotoccv2BOGDgX1RC7IT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1667eef3-ef20-4efe-3eea-08d9522ab772
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:27.7362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhO98UsIWrlRKuHGLLt/Cj3A9FSaKeeiFR/fOZA5rXIHXMgwPrpwTMVs01cWCPGk
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

Keep track of all the vfio_devices that have been added to the device set
and use this list in vfio_pci_try_bus_reset() instead of trying to work
backwards from the pci_device.

The dev_set->lock directly prevents devices from joining/leaving the set,
which further implies the pci_device cannot change drivers or that the
vfio_device be freed, eliminating the need for get/put's.

Completeness of the device set can be directly measured by checking if
every PCI device in the reset group is also in the device set - which
proves that VFIO drivers are attached to everything.

This restructuring corrects a call to pci_dev_driver() without holding the
device_lock() and removes a hard wiring to &vfio_pci_driver.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci.c | 148 +++++++++++++++---------------------
 1 file changed, 62 insertions(+), 86 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 5d6db93d6c680f..a1ae9a83a38621 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -404,6 +404,9 @@ static void vfio_pci_disable(struct vfio_pci_device *vdev)
 	struct vfio_pci_ioeventfd *ioeventfd, *ioeventfd_tmp;
 	int i, bar;
 
+	/* For needs_reset */
+	lockdep_assert_held(&vdev->vdev.dev_set->lock);
+
 	/* Stop the device from further DMA */
 	pci_clear_master(pdev);
 
@@ -2145,7 +2148,7 @@ static struct pci_driver vfio_pci_driver = {
 	.err_handler		= &vfio_err_handlers,
 };
 
-static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
+static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
 {
 	struct vfio_devices *devs = data;
 	struct vfio_device *device;
@@ -2165,8 +2168,11 @@ static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
 
 	vdev = container_of(device, struct vfio_pci_device, vdev);
 
-	/* Fault if the device is not unused */
-	if (device->open_count) {
+	/*
+	 * Locking multiple devices is prone to deadlock, runaway and
+	 * unwind if we hit contention.
+	 */
+	if (!vfio_pci_zap_and_vma_lock(vdev, true)) {
 		vfio_device_put(device);
 		return -EBUSY;
 	}
@@ -2175,112 +2181,82 @@ static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
 	return 0;
 }
 
-static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
+static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
 {
-	struct vfio_devices *devs = data;
-	struct vfio_device *device;
-	struct vfio_pci_device *vdev;
+	struct vfio_device_set *dev_set = data;
+	struct vfio_device *cur;
 
-	if (devs->cur_index == devs->max_index)
-		return -ENOSPC;
+	lockdep_assert_held(&dev_set->lock);
 
-	device = vfio_device_get_from_dev(&pdev->dev);
-	if (!device)
-		return -EINVAL;
-
-	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
-		vfio_device_put(device);
-		return -EBUSY;
-	}
-
-	vdev = container_of(device, struct vfio_pci_device, vdev);
+	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
+		if (cur->dev == &pdev->dev)
+			return 0;
+	return -EBUSY;
+}
 
-	/*
-	 * Locking multiple devices is prone to deadlock, runaway and
-	 * unwind if we hit contention.
-	 */
-	if (!vfio_pci_zap_and_vma_lock(vdev, true)) {
-		vfio_device_put(device);
-		return -EBUSY;
+/*
+ * vfio-core considers a group to be viable and will create a vfio_device even
+ * if some devices are bound to drivers like pci-stub or pcieport.  Here we
+ * require all PCI devices to be inside our dev_set since that ensures they stay
+ * put and that every driver controlling the device can co-ordinate with the
+ * device reset.
+ */
+static struct pci_dev *vfio_pci_find_reset_target(struct vfio_pci_device *vdev)
+{
+	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
+	struct vfio_pci_device *cur;
+	bool needs_reset = false;
+
+	/* No VFIO device has an open device FD */
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
+		if (cur->vdev.open_count)
+			return NULL;
+		needs_reset |= cur->needs_reset;
 	}
+	if (!needs_reset)
+		return NULL;
 
-	devs->devices[devs->cur_index++] = vdev;
-	return 0;
+	/* All PCI devices in the group to be reset need to be in our dev_set */
+	if (vfio_pci_for_each_slot_or_bus(
+		    vdev->pdev, vfio_pci_is_device_in_set, dev_set,
+		    !pci_probe_reset_slot(vdev->pdev->slot)))
+		return NULL;
+	return cur->pdev;
 }
 
 /*
  * If a bus or slot reset is available for the provided device and:
  *  - All of the devices affected by that bus or slot reset are unused
- *    (!refcnt)
  *  - At least one of the affected devices is marked dirty via
  *    needs_reset (such as by lack of FLR support)
- * Then attempt to perform that bus or slot reset.  Callers are required
- * to hold vdev->dev_set->lock, protecting the bus/slot reset group from
- * concurrent opens.  A vfio_device reference is acquired for each device
- * to prevent unbinds during the reset operation.
- *
- * NB: vfio-core considers a group to be viable even if some devices are
- * bound to drivers like pci-stub or pcieport.  Here we require all devices
- * to be bound to vfio_pci since that's the only way we can be sure they
- * stay put.
+ * Then attempt to perform that bus or slot reset.
  */
 static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev)
 {
-	struct vfio_devices devs = { .cur_index = 0 };
-	int i = 0, ret = -EINVAL;
-	bool slot = false;
-	struct vfio_pci_device *tmp;
-
-	if (!pci_probe_reset_slot(vdev->pdev->slot))
-		slot = true;
-	else if (pci_probe_reset_bus(vdev->pdev->bus))
-		return;
+	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
+	struct pci_dev *to_reset;
+	struct vfio_pci_device *cur;
+	int ret;
 
-	if (vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
-					  &i, slot) || !i)
-		return;
+	lockdep_assert_held(&vdev->vdev.dev_set->lock);
 
-	devs.max_index = i;
-	devs.devices = kcalloc(i, sizeof(struct vfio_device *), GFP_KERNEL);
-	if (!devs.devices)
+	if (pci_probe_reset_slot(vdev->pdev->slot) &&
+	    pci_probe_reset_bus(vdev->pdev->bus))
 		return;
 
-	if (vfio_pci_for_each_slot_or_bus(vdev->pdev,
-					  vfio_pci_get_unused_devs,
-					  &devs, slot))
-		goto put_devs;
-
-	/* Does at least one need a reset? */
-	for (i = 0; i < devs.cur_index; i++) {
-		tmp = devs.devices[i];
-		if (tmp->needs_reset) {
-			ret = pci_reset_bus(vdev->pdev);
-			break;
-		}
-	}
-
-put_devs:
-	for (i = 0; i < devs.cur_index; i++) {
-		tmp = devs.devices[i];
-
-		/*
-		 * If reset was successful, affected devices no longer need
-		 * a reset and we should return all the collateral devices
-		 * to low power.  If not successful, we either didn't reset
-		 * the bus or timed out waiting for it, so let's not touch
-		 * the power state.
-		 */
-		if (!ret) {
-			tmp->needs_reset = false;
+	to_reset = vfio_pci_find_reset_target(vdev);
+	if (!to_reset)
+		return;
 
-			if (tmp != vdev && !disable_idle_d3)
-				vfio_pci_set_power_state(tmp, PCI_D3hot);
-		}
+	ret = pci_reset_bus(to_reset);
+	if (ret)
+		return;
 
-		vfio_device_put(&tmp->vdev);
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
+		cur->needs_reset = false;
+		if (cur->pdev != to_reset && !disable_idle_d3)
+			vfio_pci_set_power_state(cur, PCI_D3hot);
 	}
-
-	kfree(devs.devices);
 }
 
 static void __exit vfio_pci_cleanup(void)
-- 
2.32.0

