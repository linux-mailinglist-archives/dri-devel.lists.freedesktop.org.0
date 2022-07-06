Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 882FB567E66
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 08:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1A510F97B;
	Wed,  6 Jul 2022 06:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4664310F96D;
 Wed,  6 Jul 2022 06:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bY2ed4m+DQ1pRWoQoPqFwt4hb2qUakNUpXmLyq8y0WtfOQeNV6zM8ofXCNUD2+cBoNQAzoTaMTfP4ZzfYR0j5VZViK8sfXiUzjWj4/rLW65EAsFfoDzeW6Xiwfz7MMt6kE0D8gv2lGrsfo3OIcO9+OAg713t2FR7LR2wWad1JTmu9IcxPdZP7oQKSpd8D9Re+wWQUh+YxZPPSpLJa50VexYnuC4cbuU1cnRAAZyxT1saKHXYAKBQZChM3eJ9vd8STvITeWeV9bpIpPGRJ6KuHcYZoD8nNL/7+03ybt6WZ23Rpaikz4/KMfBSz6tTkL9WAS7yhD8/DBesNe0dMNIs+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BiQJoL7ymSObpOcgIWquvLZbvG51JCYu4HMpuegqrA=;
 b=BRn+4oz4J1UZZgENKwA7UwQQcg98fBA3FwqraMVF0829d6Lfvaip8U6+Lx5v1PE0RzmREEzhd/6RDRqKepqVk28feLuYT3AS1kAzgH3hfZlWX8zqIx63v0VfWduIAHosNhTVKKBx9a3EWwiHG6ttuPiOxyM/uexbI8Su685wjzSIjHFGWFoHr9oTSM5S9IOv56fpSdsfhPOJtO5nEq7EDpPAY8av8hOmHySMjeOoxJNQwy4j32+aOu744ebk/2eSodzcsH0QPl6gFcSCvTXp0PjRkcIvurh++cBEeNWAEKUfjOzOLAdZ+ufUQX5HWklSXYwit8u3evFk0eGuNrrWWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BiQJoL7ymSObpOcgIWquvLZbvG51JCYu4HMpuegqrA=;
 b=J9RDywYkUsE3t3pYP9DMxWKDAsFjJfKcDzGg+lyGtpB29LzbsaJZJDmSeke2zH8nb9rsoBpioqCXDkghnK03vw+lN8Ede6XHOjKyURu3eZKe7ZCoH8A8/LWdxxDL4l1Kv/pGvcs0xlTX1EVrRq1/Q6TywpvkcO01ISuXA81OGWj6ffsvxjnu0L8yNzP3AHiKHT4mH6mCC1RJ4YOrhASB9/kQJXP30eHbG8DSNsy+5LlhUS2RAASNP/g/FnA6vg1+85ESdgUi6h/2rCrtT0Xr7Wd3LSc/N0eUUQtvoF7y1T+JT6cLWEo6xwvrY0soPlTzGr3w/o/QmIzIWWh7Omt6xA==
Received: from DM6PR02CA0077.namprd02.prod.outlook.com (2603:10b6:5:1f4::18)
 by BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 06:28:21 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::e5) by DM6PR02CA0077.outlook.office365.com
 (2603:10b6:5:1f4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Wed, 6 Jul 2022 06:28:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 06:28:20 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 6 Jul 2022 06:28:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 5 Jul 2022
 23:28:19 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 5 Jul 2022 23:28:17 -0700
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
Subject: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Date: Tue, 5 Jul 2022 23:27:54 -0700
Message-ID: <20220706062759.24946-5-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220706062759.24946-1-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd0c9b9e-c326-49d6-0003-08da5f18b8c9
X-MS-TrafficTypeDiagnostic: BYAPR12MB3592:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/b9PyQJ/kLaKoBVlQN8UV8i88J6fPPASKUQYVB376ejoFrOHidvhNnZ5si8qG8R01L9cCj8bp8mYByikC/Uapc+BHNdEocIpsLx2rwa2WEhjIA+WoHT4l9+xx1StVG/ZfhxBt+wt2BASRitTcVaJ3bDcysN6AUGpMXfivQEy9UZJGEvxZvH133ly4bMGt4dYxCF50Ph91x/Tg3jzqbvKq/tpb8ZsXgI6otHH4iObwEkdgF5Znz2GLCQmJBsAI/dnAuyGqbvYJ1FsBmZw3isk7Wq5IsIMrYefBdLpIzbFs+kRjDRvpGTwbz2gWptkyjyRV/d4LrXkH9yFvFZhJSAyvTr20qKjYbNZW+vk/fShNRAZjiPPysu221DNsg9AbAUCU1WSjzvoPP+04JRuK/nUfkQTKuwhf/1xgnICsygWVxZ33SSNbWWJ2DRj8oaYGt3ZwqAtlULGLn5gHM4NldeRIo5AjNFRsXT/DA1961+FdcoNoQwqdqy5YHo5lKV9HO6egX/LllxH35F/7w/Ovp5grpt9+CnkFLo3Qqo+uOyPJTz3swFmE95S1HSyfMtEDZdhgOJ7ljS81G/PHeJHD7gBEHF17okUKEb44xUip6zWmRqobwiUfM5lNwU/qcoDZQPQiZNFybRGY3q9Vlou2Q5pKKebKdNPEx2VtnIfYagOXnc9gYnzYoFRHFf7FSU0gIBtIAF9+bPOBXNSjqYRIvHMEblI3nrqHU7c/TbmFiKi0I/eWXe29mAly7iD8ft7ddP8MmLg402Ddx4q3a3k2M8Wuf5F2X1zTogaFOTvfk7H6YUPo0ySR13xA4CnOH2pL4hXJvQZ1kyElyd9VTfWBHTdFFhsjrsFCIu6TSBhvleOtOOGkwTnGGLcnK/JDkF1N2fyLF4m1d3o+5VmjOTdDUD100DDTbUq/3xxK5yprl2KLo=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(46966006)(40470700004)(82310400005)(2906002)(83380400001)(70206006)(47076005)(36756003)(70586007)(54906003)(426003)(336012)(8676002)(81166007)(1076003)(2616005)(4326008)(186003)(7696005)(356005)(921005)(82740400003)(6666004)(40480700001)(316002)(40460700003)(30864003)(26005)(110136005)(7406005)(7416002)(478600001)(41300700001)(36860700001)(8936002)(86362001)(5660300002)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:28:20.8662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0c9b9e-c326-49d6-0003-08da5f18b8c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3592
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

The vfio_pin/unpin_pages() so far accepted arrays of PFNs of user IOVA.
Among all three callers, there was only one caller possibly passing in
a non-contiguous PFN list, which is now ensured to have contiguous PFN
inputs too.

Pass in the starting address with "iova" alone to simplify things, so
callers no longer need to maintain a PFN list or to pin/unpin one page
at a time. This also allows VFIO to use more efficient implementations
of pin/unpin_pages.

For now, also update vfio_iommu_type1 to fit this new parameter too,
while keeping its input intact (being user_iova) since we don't want
to spend too much effort swapping its parameters and local variables
at that level.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  4 +--
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 24 ++++++-----------
 drivers/s390/cio/vfio_ccw_cp.c                |  4 +--
 drivers/s390/crypto/vfio_ap_ops.c             |  9 +++----
 drivers/vfio/vfio.c                           | 27 +++++++++----------
 drivers/vfio/vfio.h                           |  4 +--
 drivers/vfio/vfio_iommu_type1.c               | 17 ++++++------
 include/linux/vfio.h                          |  5 ++--
 8 files changed, 40 insertions(+), 54 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index b0fdf76b339a..ea32a0f13ddb 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -262,10 +262,10 @@ Translation APIs for Mediated Devices
 The following APIs are provided for translating user pfn to host pfn in a VFIO
 driver::
 
-	int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
+	int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 				  int npage, int prot, unsigned long *phys_pfn);
 
-	void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
+	void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
 				    int npage);
 
 These functions call back into the back-end IOMMU module by using the pin_pages
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 8c67c9aba82d..ea6041fa48ac 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -231,16 +231,8 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
 {
-	int total_pages;
-	int npage;
-
-	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
-
-	for (npage = 0; npage < total_pages; npage++) {
-		unsigned long cur_gfn = gfn + npage;
-
-		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
-	}
+	vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT,
+			 roundup(size, PAGE_SIZE) / PAGE_SIZE);
 }
 
 /* Pin a normal or compound guest page for dma. */
@@ -258,14 +250,14 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	 * on stack to hold pfns.
 	 */
 	for (npage = 0; npage < total_pages; npage++) {
-		unsigned long cur_gfn = gfn + npage;
+		dma_addr_t cur_iova = (gfn + npage) << PAGE_SHIFT;
 		unsigned long pfn;
 
-		ret = vfio_pin_pages(&vgpu->vfio_device, &cur_gfn, 1,
+		ret = vfio_pin_pages(&vgpu->vfio_device, cur_iova, 1,
 				     IOMMU_READ | IOMMU_WRITE, &pfn);
 		if (ret != 1) {
-			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
-				     cur_gfn, ret);
+			gvt_vgpu_err("vfio_pin_pages failed for iova %pad, ret %d\n",
+				     &cur_iova, ret);
 			goto err;
 		}
 
@@ -309,7 +301,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	if (dma_mapping_error(dev, *dma_addr)) {
 		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
 			     page_to_pfn(page), ret);
-		gvt_unpin_guest_page(vgpu, gfn, size);
+		gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
 		return -ENOMEM;
 	}
 
@@ -322,7 +314,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 
 	dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
-	gvt_unpin_guest_page(vgpu, gfn, size);
+	gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
 }
 
 static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 3b94863ad24e..a739262f988d 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -114,7 +114,7 @@ static void pfn_array_unpin(struct pfn_array *pa,
 			continue;
 		}
 
-		vfio_unpin_pages(vdev, first, npage);
+		vfio_unpin_pages(vdev, *first << PAGE_SHIFT, npage);
 		unpinned += npage;
 		npage = 1;
 	}
@@ -146,7 +146,7 @@ static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
 			continue;
 		}
 
-		ret = vfio_pin_pages(vdev, first, npage,
+		ret = vfio_pin_pages(vdev, *first << PAGE_SHIFT, npage,
 				     IOMMU_READ | IOMMU_WRITE,
 				     &pa->pa_pfn[pinned]);
 		if (ret < 0) {
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index bb869b28cebd..8a2018ab3cf0 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -124,7 +124,7 @@ static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
 		q->saved_isc = VFIO_AP_ISC_INVALID;
 	}
 	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
-		vfio_unpin_pages(&q->matrix_mdev->vdev, &q->saved_pfn, 1);
+		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_pfn << PAGE_SHIFT, 1);
 		q->saved_pfn = 0;
 	}
 }
@@ -258,7 +258,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 		return status;
 	}
 
-	ret = vfio_pin_pages(&q->matrix_mdev->vdev, &g_pfn, 1,
+	ret = vfio_pin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1,
 			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
 	switch (ret) {
 	case 1:
@@ -301,7 +301,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 		break;
 	case AP_RESPONSE_OTHERWISE_CHANGED:
 		/* We could not modify IRQ setings: clear new configuration */
-		vfio_unpin_pages(&q->matrix_mdev->vdev, &g_pfn, 1);
+		vfio_unpin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1);
 		kvm_s390_gisc_unregister(kvm, isc);
 		break;
 	default:
@@ -1248,9 +1248,8 @@ static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
 
 	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
 		struct vfio_iommu_type1_dma_unmap *unmap = data;
-		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
 
-		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
+		vfio_unpin_pages(&matrix_mdev->vdev, unmap->iova, 1);
 		return NOTIFY_OK;
 	}
 
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 01f45ec70a3d..813b517c973e 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1910,17 +1910,17 @@ int vfio_set_irqs_validate_and_prepare(struct vfio_irq_set *hdr, int num_irqs,
 EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
 
 /*
- * Pin a set of guest PFNs and return their associated host PFNs for local
+ * Pin contiguous guest pages and return their associated host pages for local
  * domain only.
  * @device [in]  : device
- * @user_pfn [in]: array of user/guest PFNs to be pinned.
- * @npage [in]   : count of elements in user_pfn array.  This count should not
+ * @iova [in]    : starting IOVA of user/guest pages to be pinned.
+ * @npage [in]   : count of pages to be pinned.  This count should not
  *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
  * @prot [in]    : protection flags
  * @phys_pfn[out]: array of host PFNs
  * Return error or number of pages pinned.
  */
-int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
+int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 		   int npage, int prot, unsigned long *phys_pfn)
 {
 	struct vfio_container *container;
@@ -1928,8 +1928,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !phys_pfn || !npage ||
-	    !vfio_assert_device_open(device))
+	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -1943,7 +1942,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->pin_pages))
 		ret = driver->ops->pin_pages(container->iommu_data,
-					     group->iommu_group, user_pfn,
+					     group->iommu_group, iova,
 					     npage, prot, phys_pfn);
 	else
 		ret = -ENOTTY;
@@ -1953,20 +1952,18 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 EXPORT_SYMBOL(vfio_pin_pages);
 
 /*
- * Unpin set of host PFNs for local domain only.
+ * Unpin contiguous host pages for local domain only.
  * @device [in]  : device
- * @user_pfn [in]: array of user/guest PFNs to be unpinned. Number of user/guest
- *		   PFNs should not be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
- * @npage [in]   : count of elements in user_pfn array.  This count should not
+ * @iova [in]    : starting address of user/guest pages to be unpinned.
+ * @npage [in]   : count of pages to be unpinned.  This count should not
  *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
  */
-void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
-		      int npage)
+void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage)
 {
 	struct vfio_container *container;
 	struct vfio_iommu_driver *driver;
 
-	if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))
+	if (WARN_ON_ONCE(!npage || !vfio_assert_device_open(device)))
 		return;
 
 	if (WARN_ON_ONCE(npage > VFIO_PIN_PAGES_MAX_ENTRIES))
@@ -1979,7 +1976,7 @@ void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	if (WARN_ON_ONCE(unlikely(!driver || !driver->ops->unpin_pages)))
 		return;
 
-	driver->ops->unpin_pages(container->iommu_data, user_pfn, npage);
+	driver->ops->unpin_pages(container->iommu_data, iova, npage);
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index bef4edf58138..dbcd0e8c031b 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -50,11 +50,11 @@ struct vfio_iommu_driver_ops {
 					struct iommu_group *group);
 	int		(*pin_pages)(void *iommu_data,
 				     struct iommu_group *group,
-				     unsigned long *user_pfn,
+				     dma_addr_t user_iova,
 				     int npage, int prot,
 				     unsigned long *phys_pfn);
 	void		(*unpin_pages)(void *iommu_data,
-				       unsigned long *user_pfn, int npage);
+				       dma_addr_t user_iova, int npage);
 	int		(*register_notifier)(void *iommu_data,
 					     unsigned long *events,
 					     struct notifier_block *nb);
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 08613edaf722..f10d0c4b1f26 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -828,7 +828,7 @@ static int vfio_unpin_page_external(struct vfio_dma *dma, dma_addr_t iova,
 
 static int vfio_iommu_type1_pin_pages(void *iommu_data,
 				      struct iommu_group *iommu_group,
-				      unsigned long *user_pfn,
+				      dma_addr_t user_iova,
 				      int npage, int prot,
 				      unsigned long *phys_pfn)
 {
@@ -840,7 +840,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	bool do_accounting;
 	dma_addr_t iova;
 
-	if (!iommu || !user_pfn || !phys_pfn)
+	if (!iommu || !phys_pfn)
 		return -EINVAL;
 
 	/* Supported for v2 version only */
@@ -856,7 +856,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 again:
 	if (iommu->vaddr_invalid_count) {
 		for (i = 0; i < npage; i++) {
-			iova = user_pfn[i] << PAGE_SHIFT;
+			iova = user_iova + PAGE_SIZE * i;
 			ret = vfio_find_dma_valid(iommu, iova, PAGE_SIZE, &dma);
 			if (ret < 0)
 				goto pin_done;
@@ -881,7 +881,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	for (i = 0; i < npage; i++) {
 		struct vfio_pfn *vpfn;
 
-		iova = user_pfn[i] << PAGE_SHIFT;
+		iova = user_iova + PAGE_SIZE * i;
 		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
 		if (!dma) {
 			ret = -EINVAL;
@@ -938,7 +938,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	for (j = 0; j < i; j++) {
 		dma_addr_t iova;
 
-		iova = user_pfn[j] << PAGE_SHIFT;
+		iova = user_iova + PAGE_SIZE * j;
 		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
 		vfio_unpin_page_external(dma, iova, do_accounting);
 		phys_pfn[j] = 0;
@@ -949,13 +949,13 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 }
 
 static void vfio_iommu_type1_unpin_pages(void *iommu_data,
-					 unsigned long *user_pfn, int npage)
+					dma_addr_t user_iova, int npage)
 {
 	struct vfio_iommu *iommu = iommu_data;
 	bool do_accounting;
 	int i;
 
-	if (WARN_ON_ONCE(!iommu || !user_pfn || npage <= 0))
+	if (WARN_ON_ONCE(!iommu || npage <= 0))
 		return;
 
 	/* Supported for v2 version only */
@@ -966,10 +966,9 @@ static void vfio_iommu_type1_unpin_pages(void *iommu_data,
 
 	do_accounting = list_empty(&iommu->domain_list);
 	for (i = 0; i < npage; i++) {
+		dma_addr_t iova = user_iova + PAGE_SIZE * i;
 		struct vfio_dma *dma;
-		dma_addr_t iova;
 
-		iova = user_pfn[i] << PAGE_SHIFT;
 		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
 		if (!dma)
 			break;
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index d0844ecdc961..c3e441c0bf4b 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -147,10 +147,9 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
+int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 		   int npage, int prot, unsigned long *phys_pfn);
-void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
-		      int npage);
+void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage);
 int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
 		void *data, size_t len, bool write);
 
-- 
2.17.1

