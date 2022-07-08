Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D09A56C1A3
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15C710EEDC;
	Fri,  8 Jul 2022 22:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFAE10EED3;
 Fri,  8 Jul 2022 22:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DByXJ63Vs29UDj8k5SOfFA6Fi0uGziolEX8N0FVgwFMprB5m4/uZKj5fhNXgiOjcjxzPDA3l9J/Sod5zhqAG9j5FF9pC/92FBaeHX0Od685yB/rTZlRkWoB0afciaEpPWFOeo32mgxuZekCQ2kGrWgCQxfF9cxSCCNWLRkI8/5mK1xznMf9tl5rxVeIWrqhuabiy30igng9T0lLaA9xlrnlj3BNwJzYzklII/Dg55Q/sXKt6C4zeFdCrVtPGoWX6yrriJDNBR9Zi7k5nALC8sutKAXtH0qnz27uHztkL/J0euetbwsgS8G+cPO7pSsArDJ9ZflY3GesYq8q8guIF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSbr0ptHu8jicIoCQSf/c9ikdG/DcMNO02c6EI8L3Yw=;
 b=YATxoN0sSxOGt06y/8Ko2OAMlAcyL1EXpEvWJDMf9nlcrheajekpXbFqJ+dRAqJ/JZW8yxJrxgJg9euWG9g7UjYffDqDkgxmrZU9t1PbcMsh2OreGox7GFGAskKZq3zypUfXn3cc4ofVwMdFN4utzsMvF8crC56eS1AygOhazITlxriMs77tD6bwOPAzgWPgYnWdfcL7+P2MZ13McK4dC3MZ0vxez5ImRLKZS1Z9A3HVW9Wr2r4ZEEbqkeASt0RA6+tL++y/mzWcRBBl7dmVHtohz6+Knx6ZZrIxyxlYrYz7YWa0ui+X4eGiuvgyXysg3nRg0v1qfFwyng0k5xeRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSbr0ptHu8jicIoCQSf/c9ikdG/DcMNO02c6EI8L3Yw=;
 b=oWjSk8RoLaFFEsIc1ncocopmAOi4QaY38NPSEBNlSIMB2xkuEvG/4M6SB9gZJszSe/zAYByWkPfWv7nyFmuqKjBbw7AJts7rNN+UWilz/Vmp3a5/z4a79b9O8tzYy8Zr0RLhZl4gmSd/ZlTn+JIaC+jTVQ5U1Xckd6lel9CQa/Rj/X4DuPQCuYOMzUHt3eG+fDSEo5RFJTfimm95YgqNSmgBiKS8vMmwJvYOQtbJN65E46rLvFB+QSPTxi3Dp1+n+dwOzKfYk2KrAlQcoz3Z/88j2LhDYanYaXTq+59nrsOKIc1kHgkxhYsdkcL173axv/lTf4o+nn5oeT+9dnJu9w==
Received: from BN9PR03CA0480.namprd03.prod.outlook.com (2603:10b6:408:139::35)
 by DM5PR12MB2344.namprd12.prod.outlook.com (2603:10b6:4:b2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Fri, 8 Jul
 2022 22:44:40 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::23) by BN9PR03CA0480.outlook.office365.com
 (2603:10b6:408:139::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:39 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:39 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:38 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:36 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <kwankhede@nvidia.com>, <corbet@lwn.net>, <hca@linux.ibm.com>,
 <gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
 <svens@linux.ibm.com>, <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <farman@linux.ibm.com>,
 <mjrosato@linux.ibm.com>, <pasic@linux.ibm.com>, <vneethv@linux.ibm.com>,
 <oberpar@linux.ibm.com>, <freude@linux.ibm.com>, <akrowiak@linux.ibm.com>,
 <jjherne@linux.ibm.com>, <alex.williamson@redhat.com>, <cohuck@redhat.com>,
 <jgg@nvidia.com>, <kevin.tian@intel.com>, <hch@infradead.org>
Subject: [PATCH v3 04/10] vfio/ccw: Only pass in contiguous pages
Date: Fri, 8 Jul 2022 15:44:22 -0700
Message-ID: <20220708224427.1245-5-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708224427.1245-1-nicolinc@nvidia.com>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd695485-6033-4f1a-f1e2-08da61337150
X-MS-TrafficTypeDiagnostic: DM5PR12MB2344:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +SQCu/g/Yl9rnvC2korrZK5K1I7oQVt9yra3jhystxxQZ2JdCKjq24b+XI+wxYn3lcFLbHl5bfUmwBTbuKFghSdLGoZom5T3S2ELvOn8azGmDVsq1KQjV5FgZeIoKDGR34jZzFpMt6MhTtEMtOVLK6yT8yoQTP7TowbVO93o272asPQ6cosZe/K3OCGLEbULl5Y4gpua525PXVSRZ8fsQ6uLn2HZDOolOXXBa3gFnR+BfoMttwgEqcg32Am7X0gyAivKq8xLSDFnF4evx8E+XZPcLeIbR+uMHB1B5gUjmkfU1mFCxqP7o3TovTVE+t66OkQyljVdGdxeu5fTpWevqWI3OZlNyPr35cBINX1OYB0g6a6lpMyugu1ODgAMXh0oP5xwe3XXNNan42i5nd0Lq0izYCRnQ2H8sh1OkQCUQpROKRpfFQRoNev40AD1uYVy6PWlGzT7E/C/USs3MJ5V7C5Hx6V3RaeAyQ/SdQm1URJw2XqCqKD7uJF8Hg0+Pjv1+a8+etRT+qa7Adudt0T5wAr8GIS1/KpqdPAkBXWorkjjZl19iz6xxt7FBPMQ+G2FxclVUWYUDdLXFM9+gFqbWfB7Jn6sSzj1CLcAhvzHIGJzdyyGnYkL4DPJl1Y8my3cMoRFcNyPhiR0lV9I3nQer9UUF6NvqwCQXkh/1Upn/8qg9pSG+rQmQbJFggAsoy0okHo4k/2KWlbuTrpvwMbf/L4SQDRhnCFHYIEqm9VeAQ+CUsvgcde+mj9WKvqooNMweEQPu8wY279wEvDV5sAYVRRmeMjEO5smqnGSTb1rwoMIAwFhgfU+6jckUETq6dx1dxek/fMqMgK4slzL/p0KTyPcRGc0hNoZ8IjcB5n8sCYJXRrr3GEI4Ak+iPOnSgOc4OrZvlsXfQHruRf971xTXwFO61f4M16gHBGUgrf8f10=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(40470700004)(36840700001)(47076005)(70586007)(70206006)(8676002)(82310400005)(2906002)(110136005)(36756003)(426003)(7406005)(82740400003)(83380400001)(356005)(26005)(4326008)(81166007)(8936002)(921005)(41300700001)(86362001)(5660300002)(7416002)(40480700001)(336012)(2616005)(6666004)(1076003)(40460700003)(54906003)(186003)(316002)(7696005)(478600001)(36860700001)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:39.6984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd695485-6033-4f1a-f1e2-08da61337150
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2344
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver is the only caller of vfio_pin/unpin_pages that might pass
in a non-contiguous PFN list, but in many cases it has a contiguous PFN
list to process. So letting VFIO API handle a non-contiguous PFN list
is actually counterproductive.

Add a pair of simple loops to pass in contiguous PFNs only, to have an
efficient implementation in VFIO.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_cp.c | 70 +++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 14 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 0c2be9421ab7..3b94863ad24e 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -90,6 +90,38 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
 	return 0;
 }
 
+/*
+ * pfn_array_unpin() - Unpin user pages in memory
+ * @pa: pfn_array on which to perform the operation
+ * @vdev: the vfio device to perform the operation
+ * @pa_nr: number of user pages to unpin
+ *
+ * Only unpin if any pages were pinned to begin with, i.e. pa_nr > 0,
+ * otherwise only clear pa->pa_nr
+ */
+static void pfn_array_unpin(struct pfn_array *pa,
+			    struct vfio_device *vdev, int pa_nr)
+{
+	int unpinned = 0, npage = 1;
+
+	while (unpinned < pa_nr) {
+		unsigned long *first = &pa->pa_iova_pfn[unpinned];
+		unsigned long *last = &first[npage];
+
+		if (unpinned + npage < pa_nr &&
+		    *first + npage == *last) {
+			npage++;
+			continue;
+		}
+
+		vfio_unpin_pages(vdev, first, npage);
+		unpinned += npage;
+		npage = 1;
+	}
+
+	pa->pa_nr = 0;
+}
+
 /*
  * pfn_array_pin() - Pin user pages in memory
  * @pa: pfn_array on which to perform the operation
@@ -101,34 +133,44 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
  */
 static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
 {
+	int pinned = 0, npage = 1;
 	int ret = 0;
 
-	ret = vfio_pin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr,
-			     IOMMU_READ | IOMMU_WRITE, pa->pa_pfn);
+	while (pinned < pa->pa_nr) {
+		unsigned long *first = &pa->pa_iova_pfn[pinned];
+		unsigned long *last = &first[npage];
 
-	if (ret < 0) {
-		goto err_out;
-	} else if (ret > 0 && ret != pa->pa_nr) {
-		vfio_unpin_pages(vdev, pa->pa_iova_pfn, ret);
-		ret = -EINVAL;
-		goto err_out;
+		if (pinned + npage < pa->pa_nr &&
+		    *first + npage == *last) {
+			npage++;
+			continue;
+		}
+
+		ret = vfio_pin_pages(vdev, first, npage,
+				     IOMMU_READ | IOMMU_WRITE,
+				     &pa->pa_pfn[pinned]);
+		if (ret < 0) {
+			goto err_out;
+		} else if (ret > 0 && ret != npage) {
+			pinned += ret;
+			ret = -EINVAL;
+			goto err_out;
+		}
+		pinned += npage;
+		npage = 1;
 	}
 
 	return ret;
 
 err_out:
-	pa->pa_nr = 0;
-
+	pfn_array_unpin(pa, vdev, pinned);
 	return ret;
 }
 
 /* Unpin the pages before releasing the memory. */
 static void pfn_array_unpin_free(struct pfn_array *pa, struct vfio_device *vdev)
 {
-	/* Only unpin if any pages were pinned to begin with */
-	if (pa->pa_nr)
-		vfio_unpin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr);
-	pa->pa_nr = 0;
+	pfn_array_unpin(pa, vdev, pa->pa_nr);
 	kfree(pa->pa_iova_pfn);
 }
 
-- 
2.17.1

