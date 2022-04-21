Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354AC50A56D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EF410E41F;
	Thu, 21 Apr 2022 16:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CAE10E0FB;
 Thu, 21 Apr 2022 16:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFu5XPaSuO2dioXGwH6EUzDMXI0S+jQeGqMzTwa+BHhiIgwEg3Ftom/kE+Sj1/Q83BM3PB3UlOy0qC7PiOCGenaGj9d3rJ6gFljWVaTnbtB+ZF678HOHnWT8qvljnEGow7n4i8tCTMPxbct1kL64rX/MkIuqlLX/o8sCrK1+rRkHITwLtjQd2Lu02cVXgIlSqh0/PA1hUJkIPKf1mvRDCfOrQI7pgNPuiZPouAE33m8myBZcaw9d0vuUnILIW+4eRFW3/R9p9Z00h3oNmf9FETyi2LSZrSoU39xxxy1BHKmlthedEvS2K5JLrKK9hRuXLt/gzZkBCHtblePIcBreLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LrDPKMVIsusxztPgCpb23x63uX0ihT59Q0QLuOEqwE=;
 b=CRmQXtlVWQsKY8VSLISXxH+LmxePQOgxmqybxV/zX/GuFBLamkODHRoEHwJa6J5aJGOHzA93rsKYkJ0Ol9b0oFxUodJJFjD37TFHOSIrQSeCKSnsb8dOT9nxXOlj1Slczd3juHMLDZCj+saCQARM5pxST/Wu3TBzJ7o4TOz/2wf5U7LtZlB1DmsC7KwVLTVP0ejLORWTKy33b7KK7INVE1vCC7QY+bAE4TfkFdtoTFbbCtDxzGX+wAyJcgFv1bvtrFurj/TgQy89eNgvgfA/vTkphkxj1Ulf4PAX6Tp4V3d6mkb35yLB5pLQGQFaRdhYX+rgUUyezEnE19V2KhaS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LrDPKMVIsusxztPgCpb23x63uX0ihT59Q0QLuOEqwE=;
 b=SVeXg9BRqfqiIc870ETHaCwaUStCK+3r6X0+SBVldvyHr8PduUnc9ScIpXCx40Ku1KYvs9Rwx/KLSxRcpvNVjAtKd1L8vAy76o2lNHXFTO6/nmTnWbe/mg1BLsu7DctDTa5g8nBo56xYkLXHe3SyWiSCsv2eePE84qX9bJNhRfTtvKcAmouDNciakr1eKCVcEQzB7dv04CZCxuoGDz/3xjVKwLKOiO7GvXjXrG6MMdIxZaMQDwGwg9WOpK0G5Vx2mUuFDFP0VQKcaIF/DP6REPxrRcWSEkpUpoccrFr04x8HcEAx9tjG3Z+Pq3Q2Rc+DaAW0WNbuuu6k1hU7kLhLIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB2907.namprd12.prod.outlook.com (2603:10b6:5:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 16:28:40 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:28:40 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 2/7] vfio/ccw: Remove mdev from struct channel_program
Date: Thu, 21 Apr 2022 13:28:33 -0300
Message-Id: <2-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0109.namprd02.prod.outlook.com
 (2603:10b6:208:35::14) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71fbf2ec-e029-42f0-a30f-08da23b3fdd1
X-MS-TrafficTypeDiagnostic: DM6PR12MB2907:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB290772D3658688482532D328C2F49@DM6PR12MB2907.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VxjCwUHxr4/hqbHKuWkTRgK432A2FBbAyesSQbltVs+gINvK9e0KfAYK5xGfQrtkssOwRdLVXjV7p9HOjsZ79dRqnTR7+fRPYTrlXW4m1T1sSLvs/NYyd4OmUSh9USysYIXxiBNhJ2EEIa3/lsHAgKeA3p8/0XqjF2zKo43TV6HdEmZINi4pcysx/B8RDYOy1IzAYI2fxXkSpJ2OXuJ9XxDLlapfEbwFeyYkX1Vu7/RNu3IcBrdOA4krCCRUvbhFC6jd4NIv9IyfU6yMRMP5VmIAvb7q7Mn5hoZaF9WOGq9hWaRM7if4rI/UHWFNOCQKa/OzCJlBBsVir65l1ylGUWpJjRVyLlUesMVDbB4hU3Jv+YJ6DP+8Zf6PU5sVAk49Ip/JVuLdG6zNpWqJONaQeKaErDz2DIWNDElsDmWzhkgENNVlWCN5hIcm2Ne6K07hDfllBHNxGBBhTrw1O8q3RFp0zagFSvW9kaHvxK2OHbLm35z7/xh4yUr86i38qIKt2IkrWDOGfrNk2PdaFPlPY/EVkXU6sgs45aK1kuy19OFxkYC9yyDrrQUcg1bKWfMbmWnn4eSQt7WauTFzrQ/5TzEZxJJoMqNP585YDQA6wG3DQY42d56x1/xaDuuts1aeH45faP+WK2L1whVpR0zka6o+kqI0MZQsR9pOkutCE9D626KOZlo49LFkwPwMLZN/C8OcrIbfqhIICcw3AzhjRmDG4RhqtCe35hg+jlp4nnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(316002)(5660300002)(38100700002)(6512007)(54906003)(36756003)(66946007)(86362001)(186003)(921005)(110136005)(508600001)(8936002)(6666004)(2616005)(83380400001)(8676002)(7416002)(7406005)(66556008)(4326008)(26005)(2906002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VGOoNLawG1fyHstd7Tyy898ca64YUYyrvnTKt5Nyi9GYU/Mi46XwSA4k3jWP?=
 =?us-ascii?Q?Y6zEB8mpi3gRtSzpk+lJBxiD9z/vypImafsCi+KL2///BOdg5CsEWa37yWiX?=
 =?us-ascii?Q?GiPoAuHkaLLzvcn1U477qrtQSmnBN3/KPdogwhfgcy3/6xZMolhjOOzz1k+s?=
 =?us-ascii?Q?DiDdSDDaob/R0nSNSdPouXHMFWQO2tuXRc8ppQ3MuX0LQ7hACXAeJQg1+b72?=
 =?us-ascii?Q?8EawgTXvN8h9bEMuUUnZq1kd7qN1z69ewKqJAV13Pw7nG4sNeHeSgxyFuBqw?=
 =?us-ascii?Q?Y5rqlEqeXPk+7Ai0pmAbb89sv/U88VWPfPNHczD81ZisAerGgS35JHkql9Ud?=
 =?us-ascii?Q?n+clKECCeHY9qc0kLWrnSrPJZZgKOyuSbzEN87Ay1WNRq1+hpjAjE+ECkKbs?=
 =?us-ascii?Q?l4sOuKVcPvnYc/1iPYbeHOj17FSq2q9mzolfPLqTnypZGtn2P4rBSQJMrz6V?=
 =?us-ascii?Q?1V0q5GPykvXfEqWAOloT29KLFwat6B6qxLbAqejv/nA2gBh+ytzbnntFdxIA?=
 =?us-ascii?Q?4HURJ7TdNXCOwJ4TflJvdAkqDWso5ol74itQuE+rDx7vC7ODL1goZ+pp98m9?=
 =?us-ascii?Q?Lx1w71RUz51LiY9xHTLIa9NTRU3Knz/hhnXvvwjTRl2QSboSsyfIAqPaRYGE?=
 =?us-ascii?Q?5CRptEZl8HFwvmcK3taXSZM+ttQuCM9L4ongJtWCOvNg+UYeQWxTgviu7ph3?=
 =?us-ascii?Q?UWOSTkDIPX4jqY7JNK4wFQhpixs63wURT+0NFkNdue6FmTZlyS8oANv4NPYS?=
 =?us-ascii?Q?a8lNHq+2Tof+fvK8/hnsSmO+jb0DhqjVmyBc2sN/CoItA+t9+c8jITxloCXM?=
 =?us-ascii?Q?IqFphU6WP2ENR/DP+lfBfRcWVHSiuvHw+SqIwmDdkRGKm2V0wEvy9Fkkfk9F?=
 =?us-ascii?Q?fCO5qZ4pGH9e37ySh0mmkdAovKT4HXFKMQLVBAIg+cZ6bN7N4mPi07Ra2ttX?=
 =?us-ascii?Q?/QwzLi6exeMpNsFfg2bpTsty5kVhHwyV4Z3LFJmzwX6FB7mYKn8FehaJXVom?=
 =?us-ascii?Q?mtPCxgNnOy8SOS5V5jzVF/7D0EVijArtFijoY7jQG+joWXzVetr3dBFpYlug?=
 =?us-ascii?Q?zdi8ZkuD7smuEqIxcLlkweRsyaalMz39SU2xp1prqEdOi30QL2mjwECcgSUt?=
 =?us-ascii?Q?vSwBnbgSgAKItAy7tEfz1FV7hTy2HGRCIdPTCOql0BiY7nWYLVXyKHNl4WCm?=
 =?us-ascii?Q?CcVaEfz24Imel3L5deMJiQXNO2hsMYDZvaUx/ocmvwBMXp7QjyKkJkaGqTcM?=
 =?us-ascii?Q?Nzdq3hkcA22n9eYI+MlNi8iPzkxOzSvsJofxWDS1zqmq7pM5o4lvdVLxEo+i?=
 =?us-ascii?Q?Bb+noFw/228swYAwlW4P1HFqwtPsn/neZlL4mSPW7lmTSIyiRPXIG803U8Ko?=
 =?us-ascii?Q?xmyGSxCf6aNMmc5KL21f2r2u3e+MKpXI9ZGZsmmNcdXyBU8hCTX3pnu87OPv?=
 =?us-ascii?Q?5tGVTnnl/vZbZy9YWh+nastM2OW9FBSofUMCD76D3x6NJB82iD/icMzk4whN?=
 =?us-ascii?Q?85LAvEJKAc8IBXLocjJTEdSGqxxD8kFZ0YtqE0pjEiJAWpK4zPpLaGxP/FdF?=
 =?us-ascii?Q?Y0AmAU0XiZ8B3+E8H3Ox2XjITUTB2b5kyCqNP6/9LZL0DfiKKsqSaLojIvk/?=
 =?us-ascii?Q?AL+zsO44DFdGlE0O+ArhUg8w/mMfpnOmWzQBPCCNdt2GdppTWm3rlkb7fdQX?=
 =?us-ascii?Q?CmLb3ZNIx8XnAKlT9sNviHQO5aGbxsAANb//uNdnDjx/GDxRsD5sN1YsZ/bt?=
 =?us-ascii?Q?TBYFk3gdQg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fbf2ec-e029-42f0-a30f-08da23b3fdd1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:28:39.3194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wzBt2QNFLA052+znkHk3r8tBefWw1AjbgldOv2ovNqihg8rOciEn6L2E8VYL8dC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2907
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The next patch wants the vfio_device instead. There is no reason to store
a pointer here since we can container_of back to the vfio_device.

Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_cp.c  | 47 ++++++++++++++++++++-------------
 drivers/s390/cio/vfio_ccw_cp.h  |  4 +--
 drivers/s390/cio/vfio_ccw_fsm.c |  3 +--
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 8d1b2771c1aa02..7a1cf3091cd647 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -16,6 +16,7 @@
 #include <asm/idals.h>
 
 #include "vfio_ccw_cp.h"
+#include "vfio_ccw_private.h"
 
 struct pfn_array {
 	/* Starting guest physical I/O address. */
@@ -98,17 +99,17 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
  * If the pin request partially succeeds, or fails completely,
  * all pages are left unpinned and a negative error value is returned.
  */
-static int pfn_array_pin(struct pfn_array *pa, struct device *mdev)
+static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
 {
 	int ret = 0;
 
-	ret = vfio_pin_pages(mdev, pa->pa_iova_pfn, pa->pa_nr,
+	ret = vfio_pin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr,
 			     IOMMU_READ | IOMMU_WRITE, pa->pa_pfn);
 
 	if (ret < 0) {
 		goto err_out;
 	} else if (ret > 0 && ret != pa->pa_nr) {
-		vfio_unpin_pages(mdev, pa->pa_iova_pfn, ret);
+		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, ret);
 		ret = -EINVAL;
 		goto err_out;
 	}
@@ -122,11 +123,11 @@ static int pfn_array_pin(struct pfn_array *pa, struct device *mdev)
 }
 
 /* Unpin the pages before releasing the memory. */
-static void pfn_array_unpin_free(struct pfn_array *pa, struct device *mdev)
+static void pfn_array_unpin_free(struct pfn_array *pa, struct vfio_device *vdev)
 {
 	/* Only unpin if any pages were pinned to begin with */
 	if (pa->pa_nr)
-		vfio_unpin_pages(mdev, pa->pa_iova_pfn, pa->pa_nr);
+		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr);
 	pa->pa_nr = 0;
 	kfree(pa->pa_iova_pfn);
 }
@@ -190,8 +191,7 @@ static void convert_ccw0_to_ccw1(struct ccw1 *source, unsigned long len)
  * Within the domain (@mdev), copy @n bytes from a guest physical
  * address (@iova) to a host physical address (@to).
  */
-static long copy_from_iova(struct device *mdev,
-			   void *to, u64 iova,
+static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 			   unsigned long n)
 {
 	struct pfn_array pa = {0};
@@ -203,9 +203,9 @@ static long copy_from_iova(struct device *mdev,
 	if (ret < 0)
 		return ret;
 
-	ret = pfn_array_pin(&pa, mdev);
+	ret = pfn_array_pin(&pa, vdev);
 	if (ret < 0) {
-		pfn_array_unpin_free(&pa, mdev);
+		pfn_array_unpin_free(&pa, vdev);
 		return ret;
 	}
 
@@ -226,7 +226,7 @@ static long copy_from_iova(struct device *mdev,
 			break;
 	}
 
-	pfn_array_unpin_free(&pa, mdev);
+	pfn_array_unpin_free(&pa, vdev);
 
 	return l;
 }
@@ -423,11 +423,13 @@ static int ccwchain_loop_tic(struct ccwchain *chain,
 
 static int ccwchain_handle_ccw(u32 cda, struct channel_program *cp)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	struct ccwchain *chain;
 	int len, ret;
 
 	/* Copy 2K (the most we support today) of possible CCWs */
-	len = copy_from_iova(cp->mdev, cp->guest_cp, cda,
+	len = copy_from_iova(vdev, cp->guest_cp, cda,
 			     CCWCHAIN_LEN_MAX * sizeof(struct ccw1));
 	if (len)
 		return len;
@@ -508,6 +510,8 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 				 int idx,
 				 struct channel_program *cp)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	struct ccw1 *ccw;
 	struct pfn_array *pa;
 	u64 iova;
@@ -526,7 +530,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	if (ccw_is_idal(ccw)) {
 		/* Read first IDAW to see if it's 4K-aligned or not. */
 		/* All subsequent IDAws will be 4K-aligned. */
-		ret = copy_from_iova(cp->mdev, &iova, ccw->cda, sizeof(iova));
+		ret = copy_from_iova(vdev, &iova, ccw->cda, sizeof(iova));
 		if (ret)
 			return ret;
 	} else {
@@ -555,7 +559,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 
 	if (ccw_is_idal(ccw)) {
 		/* Copy guest IDAL into host IDAL */
-		ret = copy_from_iova(cp->mdev, idaws, ccw->cda, idal_len);
+		ret = copy_from_iova(vdev, idaws, ccw->cda, idal_len);
 		if (ret)
 			goto out_unpin;
 
@@ -574,7 +578,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	}
 
 	if (ccw_does_data_transfer(ccw)) {
-		ret = pfn_array_pin(pa, cp->mdev);
+		ret = pfn_array_pin(pa, vdev);
 		if (ret < 0)
 			goto out_unpin;
 	} else {
@@ -590,7 +594,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	return 0;
 
 out_unpin:
-	pfn_array_unpin_free(pa, cp->mdev);
+	pfn_array_unpin_free(pa, vdev);
 out_free_idaws:
 	kfree(idaws);
 out_init:
@@ -632,8 +636,10 @@ static int ccwchain_fetch_one(struct ccwchain *chain,
  * Returns:
  *   %0 on success and a negative error value on failure.
  */
-int cp_init(struct channel_program *cp, struct device *mdev, union orb *orb)
+int cp_init(struct channel_program *cp, union orb *orb)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	/* custom ratelimit used to avoid flood during guest IPL */
 	static DEFINE_RATELIMIT_STATE(ratelimit_state, 5 * HZ, 1);
 	int ret;
@@ -650,11 +656,12 @@ int cp_init(struct channel_program *cp, struct device *mdev, union orb *orb)
 	 * the problem if something does break.
 	 */
 	if (!orb->cmd.pfch && __ratelimit(&ratelimit_state))
-		dev_warn(mdev, "Prefetching channel program even though prefetch not specified in ORB");
+		dev_warn(
+			vdev->dev,
+			"Prefetching channel program even though prefetch not specified in ORB");
 
 	INIT_LIST_HEAD(&cp->ccwchain_list);
 	memcpy(&cp->orb, orb, sizeof(*orb));
-	cp->mdev = mdev;
 
 	/* Build a ccwchain for the first CCW segment */
 	ret = ccwchain_handle_ccw(orb->cmd.cpa, cp);
@@ -682,6 +689,8 @@ int cp_init(struct channel_program *cp, struct device *mdev, union orb *orb)
  */
 void cp_free(struct channel_program *cp)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	struct ccwchain *chain, *temp;
 	int i;
 
@@ -691,7 +700,7 @@ void cp_free(struct channel_program *cp)
 	cp->initialized = false;
 	list_for_each_entry_safe(chain, temp, &cp->ccwchain_list, next) {
 		for (i = 0; i < chain->ch_len; i++) {
-			pfn_array_unpin_free(chain->ch_pa + i, cp->mdev);
+			pfn_array_unpin_free(chain->ch_pa + i, vdev);
 			ccwchain_cda_free(chain, i);
 		}
 		ccwchain_free(chain);
diff --git a/drivers/s390/cio/vfio_ccw_cp.h b/drivers/s390/cio/vfio_ccw_cp.h
index ba31240ce96594..e4c436199b4cda 100644
--- a/drivers/s390/cio/vfio_ccw_cp.h
+++ b/drivers/s390/cio/vfio_ccw_cp.h
@@ -37,13 +37,11 @@
 struct channel_program {
 	struct list_head ccwchain_list;
 	union orb orb;
-	struct device *mdev;
 	bool initialized;
 	struct ccw1 *guest_cp;
 };
 
-extern int cp_init(struct channel_program *cp, struct device *mdev,
-		   union orb *orb);
+extern int cp_init(struct channel_program *cp, union orb *orb);
 extern void cp_free(struct channel_program *cp);
 extern int cp_prefetch(struct channel_program *cp);
 extern union orb *cp_get_orb(struct channel_program *cp, u32 intparm, u8 lpm);
diff --git a/drivers/s390/cio/vfio_ccw_fsm.c b/drivers/s390/cio/vfio_ccw_fsm.c
index e435a9cd92dacf..8483a266051c21 100644
--- a/drivers/s390/cio/vfio_ccw_fsm.c
+++ b/drivers/s390/cio/vfio_ccw_fsm.c
@@ -262,8 +262,7 @@ static void fsm_io_request(struct vfio_ccw_private *private,
 			errstr = "transport mode";
 			goto err_out;
 		}
-		io_region->ret_code = cp_init(&private->cp, mdev_dev(mdev),
-					      orb);
+		io_region->ret_code = cp_init(&private->cp, orb);
 		if (io_region->ret_code) {
 			VFIO_CCW_MSG_EVENT(2,
 					   "%pUl (%x.%x.%04x): cp_init=%d\n",
-- 
2.36.0

