Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A914FE561
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DE810E6B0;
	Tue, 12 Apr 2022 15:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05A710E629;
 Tue, 12 Apr 2022 15:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R14vHWLBd/ZVMlIZwv5GbPRCGwq95frVyo/GdYMD8XMI405X9LoLzRRwY7uxyIJaNYeWhlU+IRWwiCNNk8XNB3mXpIYoE3srM92K/4twPgFs0Ce1satvkfR/d3p8m0CO6lPoJ1z39J8U+9ulPU7i8gQ3RrpIC0RrlwwsavKNf4Om0NtZotWO6dwg7tIrE2iO7Z0qhIde0gnK6buh4+qGTYOGSGxlgH3S6lUWj+Q4V43suQJ5N7zKbfWx5HP+fsOAzgIgPOdPr3Sj5p0WvMe30RXbkaeR76eVJrSjHpWjdfiOf+yFg2tjG13CxsVKI9tvUJezaQ3yod9zQTd+69YcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjvmS5gymLmSXA2dZfrbGEmaqLx3V3n3q8Gv1W9bqcY=;
 b=IGIQAnB8GWENSJsW8TE1Q353BINlnspQLAGj4vEIMklAMX7b8ZWuUS+2zMJdKuap+wV+Q1a6Fye2W8SQZa1xyRo1o0ONZZs2HFavStKjK/pgvpZW7brLkqfnD5dXBDW3l+/eOS5aK0NQX90x9XSyUxYeH9o2oNV+tsju4UX4byPMxsRPZCQpRtDbOf6To3wI23hn63J7QiuzgWDH67vuarM7+zyj+hS0CCc3WH6UrZxMzaZnCvQVJN2dSoq4yBhL7ZA+fB42uW+Ri4k2MyEXHoHS6mcR0jhJ7L0OrhF+jBV231aGcST4dARlRK8kaDqzfz+SCbWPpb+3VMH2wX+uCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjvmS5gymLmSXA2dZfrbGEmaqLx3V3n3q8Gv1W9bqcY=;
 b=g/APUWSUQO/yDiSrUJ9IbDGP29Eg0Qh6H2SYC0I4HDBa+qeeDieR8qgx20/Oy3NLkEkNHJ38UgP1tfUhfPXv2aOxCt0jxR6Glb5kePki0kUkn3tNyc799rKFT7ea2AAWrKqlHX6TGz2l3jexCMifjodzqGPA9TR+P32p+7Sjicjw4+SROPBb1TKwPCoBM75nVwx7oKUD3Qsbmxlg5wBgPtztBhBjpyefGkYuYWBb58dhraX5bAm0nXBArfBHiKJM29xxmJjUWIFyME5lluBBNaaJ7pFFtUFkWuZ/FmU6s6eD9pjDLOu7JzsuFFsqq3yotBMFD0JFRzTk/j1okqORxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:53:41 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 15:53:41 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 2/9] vfio/ccw: Remove mdev from struct channel_program
Date: Tue, 12 Apr 2022 12:53:29 -0300
Message-Id: <2-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::27) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f14f956-4892-4c36-7a55-08da1c9c9c65
X-MS-TrafficTypeDiagnostic: DM6PR12MB4172:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB41728BE9C4779D380481B9F5C2ED9@DM6PR12MB4172.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mIcE9180Eh16V3McjHdsq6PZvQg8kHiFhtRxJy1xZWpO3hHOp6lLLb1IuqvX+jLU8oEEmFhs4w8wGjIxhLzdqhWPRZQHXwr0+odpzqB2ETLXkEIYZvcMql3yrrhiXBn58xXLU+dmD6jqD5QFjI7geh3ALsfcgXm0bwDvA/pnRRxkBkL5kalKTSL65tXgBt7fO02dgbb6bIcfRvYXfLEZAoJGiyYNYtexFVTtGrZ71/wdKZSNEa+ZC2gSKo5qgR5Jo8peUbrJynoKe/WN825nvR3hRNYWWfbQKDaIKOXShR9u0p3sPCE5wU1Dz+fuw4Aj8UaUKwRtUqmBD6y8r34VvV1YrUuU/o3uuWGb6+WClhinq1XNpqGaPEewAGiWYUPWiwxB7dxpRrBJjmNyKFrJ+T3gSxy3IeL7TvV0kgYM5j9zAlv4WMOqcQN1LQVUTOEZ1hQB0TRbmhAOkeiPSHcQUX6di3prgbBEYhzwWQDcW1DI3B1pIwa5FaAIXVZIXB5/fRNXxl13LPfHLBuO9woLD4Fhh3gDGdV2zy7uR2Kmg32jXq2BaHm7I2HV6EbQI1MI7wYbtnFT0xx8dOPWCzKZ74OCoHBSJR2bkwPOfr4drX3iHtHTIH6cagSpKLxn49tuo8i/K6gGR5B5ecAmUe/dRdKRl2LzGNwOHtSYkwIXZkTUDLacFqY49c5i+AMwMTWXxqcpPt/qwqlJJEAhkjJeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6506007)(6666004)(66946007)(66476007)(4326008)(66556008)(26005)(186003)(36756003)(83380400001)(8676002)(316002)(54906003)(86362001)(8936002)(6512007)(2616005)(921005)(110136005)(7416002)(5660300002)(38100700002)(2906002)(7406005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vhbt2dwhWyvYf8vt3DgLdO+rPrfBeqkAyD5agtKunajk66dLu84nOui6hHeC?=
 =?us-ascii?Q?tWImUJd/nd5hH/B+AxOQ1JnJPlwFmwg17LQdXTb9fZMHOoqmfAj03S2rbLtU?=
 =?us-ascii?Q?Y9a4kD4Z/K9cMbeE+t1IunPnwLj8som48caskW2YnOicVovjk+InG6/hSQ9i?=
 =?us-ascii?Q?+owFcd4SQamMVVyEzgWpklw2TJcYksjqAcAzjjWUWxxZEchsunaHGuxuOc44?=
 =?us-ascii?Q?O6O35LbiToiEgUJFyJrEC3Blj6kzz5ovQ6lL0dz4MXuBShuY0H1uBgjDpQBd?=
 =?us-ascii?Q?9Yx4QvWZgswZwyLi5ShswaoZ4CUbtpMGY5wKpJEZ0WdteCky8LLtS9vlGzUx?=
 =?us-ascii?Q?08qkj3iX5GtvEoL4ZRHsYjvIroMn//uqsEv9LSwHujPwNbftaycSsid7Bbyb?=
 =?us-ascii?Q?nSLp6y3qRHT6IHxqlOd7hzAzztTEtuEMaqUYpv+WmgxFTABuHY/HylUN04f5?=
 =?us-ascii?Q?LxFlkuflA4Ccl6oXkWDVTCDsB1EDyxP5teuGai2DnInVjDPMuWHvjnYUGn+4?=
 =?us-ascii?Q?32F61An9QWiBWRs4f0MKcei1neJvUjWzq/E8Pft/hs3VyJcR48C54HJ9fIWd?=
 =?us-ascii?Q?PQQiZ0SMA9YJr4D/XuHXJqdk0LVFPBubL39Q9cOVyoA2fchi6JWsrn8P/C23?=
 =?us-ascii?Q?dn4JotMHd7qiZRZJWk47DfGeftYqRMnwuHSQU8iyrAwiOoBqCDDe0zAxeIhp?=
 =?us-ascii?Q?fECZmCHPiP0+zr0mH7w1I4l4kjw9CC/l46R0RCwLAIyP+iK0lqF+HYMN0vbJ?=
 =?us-ascii?Q?fkmxBVvdDIID/J/DBvckXK71S6Rhn8E0lYgR1PrF2nlsIFifXyXQcyqtoyXD?=
 =?us-ascii?Q?UN6dzjIMDLzIWkdmYTq/WqYFD8pliqn2yh1EIXW2hVR2fPNJMMLUnw2eh1Q4?=
 =?us-ascii?Q?k0OCbeBa57gqpi1IOfmQhalqgSABaASCZvurCp4Li2qZEe7a7DeHMP88m/j8?=
 =?us-ascii?Q?GE0oDKf59K4umpBLG3Mt1ZB6/TTEDTDuhUqgUA7Zix2EqBdFKrrA6oy7SAvN?=
 =?us-ascii?Q?wnpr2TwfVwQkxVf1XGHOVl/1SkjboKyy83m1kXNOLs29aZHz9zeON5I1waMW?=
 =?us-ascii?Q?qMi+OqSBHlKH2HC449a/sVvedz8IApo3+CeK/St8l/cwkwbF15R5xqh9Lccz?=
 =?us-ascii?Q?FdR1OBFtvji7nyLcNOHkjwAQHdpg4cFScSv1zf2qSPvhcXzOO5apH3/nZY+J?=
 =?us-ascii?Q?xia7bk/885tRh9etqEHHlV67yn9riZNlfTZH/+BfD9YdXLl4zo8HunkT8hup?=
 =?us-ascii?Q?744NsdVmMk3DSwFYjUDLwdPFJWvHqjpfnomdwxG3/wfKfex1v0Ee+kDRhd3A?=
 =?us-ascii?Q?JkexGiFg/8+v/e54QRvFQs1/ZXIPi/KUan96vNT+Q7eXbRzZiFxndtzNlfPV?=
 =?us-ascii?Q?PAg8izcQQwaO/XDUR68dfYcquWJkW/2xS/P44zo2y4ZYjouMaw5CwV+5Pe8J?=
 =?us-ascii?Q?qYtb8L+3nh6WEnXhPyd8ntg/CyRdzW8PNrNDuzToPzlcibHodEZGXwVVdlxy?=
 =?us-ascii?Q?y9PdTrxUKQSFusq0E6ko7j7kmhnVU3lbRSWvnDB3Bg7LD3Eb9Q6TP7oC+HO9?=
 =?us-ascii?Q?mPL9EeSHbHJ/RKa5NOr7Lbo0zCgk+kaj3XDoslWDMwszEPZaFtQ+XM3Bh+e1?=
 =?us-ascii?Q?1mQ1/W5Itr31/G3SSzuTGuaJfpghPBt1MQAdGAInNa0GEtmtE771IqIZ9nd6?=
 =?us-ascii?Q?ni0ilK3skQVdnDgIv3fBsMam58t6z1nnuBp9qiXGIZyuRBHmbakmWd6Kvhac?=
 =?us-ascii?Q?yYJCSJOXww=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f14f956-4892-4c36-7a55-08da1c9c9c65
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:39.1968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1i9XCzSTgYUQfil+KYp1+uouW2hXyWMFmg3ssDbyrx7SrCbdfZOBCUwCiSoR2HRy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The next patch wants the vfio_device instead. There is no reason to store
a pointer here since we can container_of back to the vfio_device.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_cp.c  | 44 +++++++++++++++++++--------------
 drivers/s390/cio/vfio_ccw_cp.h  |  4 +--
 drivers/s390/cio/vfio_ccw_fsm.c |  3 +--
 3 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 8d1b2771c1aa02..af5048a1ba8894 100644
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
@@ -190,7 +191,7 @@ static void convert_ccw0_to_ccw1(struct ccw1 *source, unsigned long len)
  * Within the domain (@mdev), copy @n bytes from a guest physical
  * address (@iova) to a host physical address (@to).
  */
-static long copy_from_iova(struct device *mdev,
+static long copy_from_iova(struct vfio_device *vdev,
 			   void *to, u64 iova,
 			   unsigned long n)
 {
@@ -203,9 +204,9 @@ static long copy_from_iova(struct device *mdev,
 	if (ret < 0)
 		return ret;
 
-	ret = pfn_array_pin(&pa, mdev);
+	ret = pfn_array_pin(&pa, vdev);
 	if (ret < 0) {
-		pfn_array_unpin_free(&pa, mdev);
+		pfn_array_unpin_free(&pa, vdev);
 		return ret;
 	}
 
@@ -226,7 +227,7 @@ static long copy_from_iova(struct device *mdev,
 			break;
 	}
 
-	pfn_array_unpin_free(&pa, mdev);
+	pfn_array_unpin_free(&pa, vdev);
 
 	return l;
 }
@@ -423,11 +424,13 @@ static int ccwchain_loop_tic(struct ccwchain *chain,
 
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
@@ -508,6 +511,8 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 				 int idx,
 				 struct channel_program *cp)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	struct ccw1 *ccw;
 	struct pfn_array *pa;
 	u64 iova;
@@ -526,7 +531,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	if (ccw_is_idal(ccw)) {
 		/* Read first IDAW to see if it's 4K-aligned or not. */
 		/* All subsequent IDAws will be 4K-aligned. */
-		ret = copy_from_iova(cp->mdev, &iova, ccw->cda, sizeof(iova));
+		ret = copy_from_iova(vdev, &iova, ccw->cda, sizeof(iova));
 		if (ret)
 			return ret;
 	} else {
@@ -555,7 +560,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 
 	if (ccw_is_idal(ccw)) {
 		/* Copy guest IDAL into host IDAL */
-		ret = copy_from_iova(cp->mdev, idaws, ccw->cda, idal_len);
+		ret = copy_from_iova(vdev, idaws, ccw->cda, idal_len);
 		if (ret)
 			goto out_unpin;
 
@@ -574,7 +579,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	}
 
 	if (ccw_does_data_transfer(ccw)) {
-		ret = pfn_array_pin(pa, cp->mdev);
+		ret = pfn_array_pin(pa, vdev);
 		if (ret < 0)
 			goto out_unpin;
 	} else {
@@ -590,7 +595,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	return 0;
 
 out_unpin:
-	pfn_array_unpin_free(pa, cp->mdev);
+	pfn_array_unpin_free(pa, vdev);
 out_free_idaws:
 	kfree(idaws);
 out_init:
@@ -632,8 +637,10 @@ static int ccwchain_fetch_one(struct ccwchain *chain,
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
@@ -650,11 +657,10 @@ int cp_init(struct channel_program *cp, struct device *mdev, union orb *orb)
 	 * the problem if something does break.
 	 */
 	if (!orb->cmd.pfch && __ratelimit(&ratelimit_state))
-		dev_warn(mdev, "Prefetching channel program even though prefetch not specified in ORB");
+		dev_warn(vdev->dev, "Prefetching channel program even though prefetch not specified in ORB");
 
 	INIT_LIST_HEAD(&cp->ccwchain_list);
 	memcpy(&cp->orb, orb, sizeof(*orb));
-	cp->mdev = mdev;
 
 	/* Build a ccwchain for the first CCW segment */
 	ret = ccwchain_handle_ccw(orb->cmd.cpa, cp);
@@ -682,6 +688,8 @@ int cp_init(struct channel_program *cp, struct device *mdev, union orb *orb)
  */
 void cp_free(struct channel_program *cp)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	struct ccwchain *chain, *temp;
 	int i;
 
@@ -691,7 +699,7 @@ void cp_free(struct channel_program *cp)
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
2.35.1

