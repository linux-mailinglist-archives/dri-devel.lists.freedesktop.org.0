Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4A41F3E5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F06B6EE9B;
	Fri,  1 Oct 2021 17:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596C16EE8E;
 Fri,  1 Oct 2021 17:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LX+HuVp/Qd/ivPr4rSYU/SjZS8gVMcpcrlU9fTy2iOYnpfsYH3mqyWn2UpgZEZNh20ZeNksBwvOof3MOrkJBCZSnTWO+BEjKvc+05L60T18twzm9tiX+FsAA/5Ur3nDtqm7JC/8ZXFna7QG7/owrRdV/C9fi3XcjKJpwjRfyrNFmzuM8+KMGFH+kq1bNgP3iRh/fKx2PKtvnA8bIuooM6DJlJ8F5jtWGkVR74giTUUaA7kvIB5HabyfP05L1Dh61Jd97oPPFgXJHJJ+GTWYzd4x0DFmeY9A+yPYsvkW85cttD9KffO/XHug34h8Qyy71sdHd1sGzqal3PEg/UPIm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYcXEm6RVhMLVup7gQaCrlAlylWOGFSxlS3RrQwdBjY=;
 b=aLbX0zpvz5hfD/dKZHPUb/H3SX/QVl9JvaLoEPUI4CmDhQeeH6VrIxdWfVbITmkW6LUfe8qf9fefH3l66QYKphwbFN3mhbDBHnzuOG689YkSNHxpYEqMy2a5DuMNu08RHRKpy2u1KtHl5ln0XtU7KZ5Fs7BLhCXJ/HFHIWNSTCIRQl56gA+pGGiPHOeJRpCGeTNtPIR92Eoz89tL/+uqF+GrpBLT+w0Q/nAN6j7TJ/1NC4OvlfhsYCnh2+Po3VNymZZJyvZbnL9Ilo9J7U7mnkGvxCXD3ofLV7CTZvXLEi0mAk25tCEAyApPc2/1BtGbHvMiSsHXYUcYrUzsDFWJYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYcXEm6RVhMLVup7gQaCrlAlylWOGFSxlS3RrQwdBjY=;
 b=MCUAtE5zNZxAQDZ7JrWOfRRoiE8FFpbpgcGHoVDlYZNyl6NYnW6dmNjTdeRxDjIcKYvXidGT9uZQQU80asrEqE8J/n4Re2Tk0pdtL+7NpQAMOUlGxCPTb/WWaL3on/HuVG7XxbQC+oQSTZbhhukcTtERZJLSe1EQyYvIC1raGLpUfN4iE712oP6/JQkgcGuShgISyaDAjEaMesf+85WOjmB6tmBziDmuUobrRhMUgr37gh8GhWMGtutYCL1NruTBzSdqMqpvJAp2nx8IfYWzVPR82rzybI79+Ofpl8ttozg9qOp6TYXT7RBOB/BOHnZDrhOBuNTvNNOxsL8mvO3UDg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 17:52:54 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 17:52:54 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
Cc: Christoph Hellwig <hch@infradead.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 03/10] vfio/ccw: Pass vfio_ccw_private not mdev_device to
 various functions
Date: Fri,  1 Oct 2021 14:52:44 -0300
Message-Id: <3-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0399.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::14) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0399.namprd13.prod.outlook.com (2603:10b6:208:2c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.9 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-009898-2K; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5710eaea-f8de-4be8-e471-08d985044aa5
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB520769A41C8B6B823D45C228C2AB9@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7RFr9a7tSDQJu8zOr8nV8T+21vzPeiC84X/O187j3A8CWBMoV9V8i8Y4ZRhkkyKBVRpPyyFwXFYoDbaCeM7dkG11jS+oDBPEcrqLvzC/bk0i051hyuOSvgp+nHd9LgvqZZswtqoX34xikAIYHGOBrPk42s/mOL2XERsgCOqUg9FzXLpSNBzlygCtwHr65uzisI9+sZuS9XihllLb7u1fY86KlG5lC3Zy6H+lpxDyD6+4DcMaj4f3AlfU3VTGgUErywJAXi0U5cFzNVtGDMsOFJVKrcSuUV58v4bQp1FOEXRu0Xj7F8DrS3VrIsRn4YTFoiZcJPTgeDE8c3lc+QZVw5ltDNhoVpYrTgK6xz1GBujIV5kxFac+5MRAMtP4t2K6N61f0y+MRhTPeiKDa//pp8Tt2ui+JQol/Iwg33s3DUzlqbY3GHK/5yw7V/rZZNyWpLBjzqUCtH+RkzRuZQKJnm376NoV/8K7jGWb2UeNrn+x1SSjdilDN9/kUkARFxSi7XnhFmmx5v9Apb+Dw7qSoBl40Z9GrlBaDhCuXN6JU4Feo5tJf+HL4qJFDTfkbNfq2aGbEqI+I8bGjWM576T7i/aPHPOzz8L9ahpFoUcepBZc/Z9LzngTGeXNTnaqqOtJfNc0la26ZEd6AD/6QhMDMZ69PN/TYq8cFCB4nakPYcpaV2taTQKIwSMUwaVCwi8fER820ZLE4HutmZq/sT6VqHs5wmrO45M8GlA+K02X2GU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(83380400001)(66556008)(8676002)(38100700002)(66476007)(5660300002)(2616005)(508600001)(426003)(9786002)(26005)(186003)(6666004)(9746002)(54906003)(36756003)(7416002)(4326008)(110136005)(86362001)(8936002)(921005)(316002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D1NUdkulg324xn3cS+L8y+ldfLvOwHTasKc7pBW8ki0d9BEIyNJcGj7xCCXh?=
 =?us-ascii?Q?7VR7XNE1kJW4Q2pscYVQeIg4NTXscBuR4m0SIuIGhrH4oRUfU5GJG4Oq5R5e?=
 =?us-ascii?Q?k8Kn8ic/XH1MRg19CoduoPMvPD0YGWa1BpmcU+bsP2iB4ySRpcbhOT8LLQ9E?=
 =?us-ascii?Q?H1DPTawKY0p0Gn82XHIzzL0BFckYH9q7qZVBvlpAJ/wbjoSjdCMWnE6Z0uHm?=
 =?us-ascii?Q?k9ZcZZCJ86plt3x50vIsHnt1OtooZkU3vSfXHpKXkHjI5EG+9biETemGvpWO?=
 =?us-ascii?Q?1TXS7Ujd0mjlRhtFiOIX2ZEG87wAm3NcXkvaIWjUSB9CqtJiPbygkKRxX7wj?=
 =?us-ascii?Q?qBBNrlRjLpPCbCPfosLTrw5QKbBwykZ2zMqQmzDfCix+lezVkyVLuqL8ULpQ?=
 =?us-ascii?Q?Omd7iBSF8cNmPEs0PsyO6N9FWUTi/OGHosLnjCSGXr863tEe7yDGdDNBpFJt?=
 =?us-ascii?Q?NjA7RFQXrD0899tJbNsR2gH1yLY/Ypbd0p5N/pVqZIX4V0XOUgR0sttHPF6W?=
 =?us-ascii?Q?0RJAuQqcNHcTHgVK/QthY8OoFXsqOlt/Vj0wooIkbD9PcT0210h5yku2gQol?=
 =?us-ascii?Q?Xlp8v0dfRHlEZgBn2Il4JlctDTz+A+Mbhx+KMgl/XPiD6DKTRG0YNJchovLu?=
 =?us-ascii?Q?yi62ItsvSQHWS3eGYOjKyccK2UOHTHb+7yKmvJqjp31lsUPoGwerl3CSd0RU?=
 =?us-ascii?Q?P8UcQZzQhkUil4IW/z5lM286YexWzLOzIoir+pPTHnSjIKeCA12oQD+OPaz6?=
 =?us-ascii?Q?Y4nA/pyi5R2U5jrbBCV74UE2i83LVgRdY8dKsqo39ICAgJCJluszxZC4fi+Y?=
 =?us-ascii?Q?JDGKPpM74jfnx9fklaE9njgMugXFMLUyo1ntxY8Glq9p+imyb2K/nLpluKAr?=
 =?us-ascii?Q?8wJ7297UAkrAwGIx+wQvCItk1xwE9neD1cUd5f3r3GMoLJTu2UbIOIevGEFZ?=
 =?us-ascii?Q?BJl01X0CLmjh0rcEN+6hSyiNAxtd3DzpMxQp872YGmaXbUElYOHcbCRF+Xq0?=
 =?us-ascii?Q?whRcb+e2NsTN/E6A5K7pAu9bXZbdrLMzkEqiUwwW206WQyGohsODEhK7BeWv?=
 =?us-ascii?Q?96Bis4YVvqGp7gfd3PllVYA/A0eNnINGHkz5JBe8oRuO1+5c5aLjfEMl5Az5?=
 =?us-ascii?Q?vlcJYD6RjswXDbKqfbelcHsze3vp68RhIp3ayVwSI7t90U28HFFtt010+/Px?=
 =?us-ascii?Q?BW04HoPStq27K2EG/U5YyzERsTu7V9Hv7xaxRILgHbaE6xyCwVTzJo1eF7q2?=
 =?us-ascii?Q?WtBhfAUP1H6nzPVKlAJwULPEnQIzvliV5tlzlHZlNbr3XrB2dGi2JjhqUayV?=
 =?us-ascii?Q?vswJBhphGpUWWnsd/tySmaip/9nLtU1+53l0pGzOMPB6dQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5710eaea-f8de-4be8-e471-08d985044aa5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:53.0466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UT2S9d3MkdhJkBZm3BDCPtqHH5MjGgVNyo8dhgbYGR/Y++P0z6NyQEpCBjJzCVId
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
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

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
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

