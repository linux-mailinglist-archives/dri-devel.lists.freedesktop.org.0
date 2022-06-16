Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3260E54F198
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B27A11A913;
	Fri, 17 Jun 2022 07:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3047310EE4E;
 Thu, 16 Jun 2022 23:53:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goKGeXh+k00v7xiGvsLu7NPLq3DQOA5u3cXiHgU09zeKMLdjBY8lXbsSkMwgjG/D/fe/wL3602w2AnqJVNwszZRzpkotauO2ceer7jwcDRWiNhzpsL26eknCN2G2ziGkIDu/YFRW649fbanXqxhvfuEvLbA8E7RYlNkctzGi9BRnvaDAJVGgTQn3s9Imsv4oOJGbe5dDyzX5UbDWVy6GmWbo4GxlCxxcxD9OA51JkiZwVmgAiX3tprjWyLKATA5XEtzGAaSk3MBf5viX0wH39vugcjbCIb4F1PxkJGIit3xaEDq907A11dJlbiiHBinyA625WDyqwb1D6wfallQ1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TOoEzHA/+AHx2A6yF3y60coa3apSjtcOgAKnAnJR7A=;
 b=lHa10CFWK72ao0qjY+hiCoCHJbNDygcAr+fTKZFFyEPTAIhq0mm71HUARI5ynL6DuvScccjSjyGSeNsAEKQ9XDejYDBGBa5Lw7Ojkm/BEMqCZkKZ5hK372O5hG5R4OEiUIi92sMLYUpLrxyhttgmFhrVQkPEWrPSW2Z2tbRmxFxqgNi6pMdyYuSCTEAP/PmznEbHRYFPG+MCh+pu12blRTcTc23x2tTm1oSYG7evGO5ddxC1A/OWnZMg40HsxfYmounUhntTU8jc1jDkyfXy7zgbe/BSc6hj6qDGmqlzGTwIbt5T2KLY91g/C/nNHzMFiKpWIoKiB5K666m2aSZGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TOoEzHA/+AHx2A6yF3y60coa3apSjtcOgAKnAnJR7A=;
 b=QF/kVGhEF7NXgCXU5QVByHXhm0UUc5Q2s2sFJRHR+oZWOD9EwDIAWQPIwHHB+AUhn1NhVRNtwFYauVR/uF8qmMmIvEuYfNEZIxt+tdVkig/8UzoHcvx1UmKztbkByy6DwbhA4Nw/K05eKkh/5yM8HweQ8W67zHGb7kucF5BvU0b21BqU15FKmJT5WCx7le/cPF7FY+86XteoklXetTOBg5aui4Wep8/E2JpgxcX+2yqsuD0dLym0wLBjOmehnNMDVprmnCNT9L5FisZ/tyof8d6kVMYFYXObPlgeHP8I3VG4B0RHrTHbkiSRXWZsKJ/+yuXNfng6GPiI0poU1kbv8Q==
Received: from DM6PR07CA0040.namprd07.prod.outlook.com (2603:10b6:5:74::17) by
 CH0PR12MB5235.namprd12.prod.outlook.com (2603:10b6:610:d2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14; Thu, 16 Jun 2022 23:53:22 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::b7) by DM6PR07CA0040.outlook.office365.com
 (2603:10b6:5:74::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17 via Frontend
 Transport; Thu, 16 Jun 2022 23:53:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 23:53:22 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 16 Jun 2022 23:53:22 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 16:53:21 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 16 Jun 2022 16:53:19 -0700
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
 <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [RFT][PATCH v1 3/6] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Date: Thu, 16 Jun 2022 16:52:09 -0700
Message-ID: <20220616235212.15185-4-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616235212.15185-1-nicolinc@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d433d016-a761-457c-7635-08da4ff365b7
X-MS-TrafficTypeDiagnostic: CH0PR12MB5235:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB523596D3A7C4167371D17FB9ABAC9@CH0PR12MB5235.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9nH9vDJIT3wVodd/TwTdDLaCR1VYaWXZ6iQXBTrtpAmMTEBkzRlVw6HroLzr3oLeBINwf55sIiLLITvKd7thPTNd2r8xV5yn28zsfdQUiiQDj6aV4m4jMwucfcDCfTfNpalzDrvB0n+KhtB9DpRyavCjVcgG4cwjZj3JdXgdrh9nd4A116hHaytM2za9A0lXj6m6Sw7FnAf+u+mOUhGG2GI2jfNpG8MQfSkyXr83AoDkGRpFYRyiWZ0+XcpyFNPJ1WB3IgYHvrzRtn5+h6Rz0SybahjTr/r67x605MN4M9ljMbLBiABIDhTMC7KkwP0opjRUp7dI3Sx9rjnJsa8w5ZSpcAgjlBd60ycvJL6dxlGyRYo0/k4wQ+l2gjysPl391npTvHIMwvJK3+dQeVqHqJz1PyWcsjgDEVVEY9+fHlpb4Exc+8sltzGXsmdCP+AqzDeNVVMWpUKqqoalp9Ly4jroXzZbhfa8s822n5draCheCjNBVrkp0SPxg1UczIuSatRgxl6lPmC9Efn6gnMlMXoJtsgD8i3KQayZsRwIt12PAOJr5PPKwCaeS/J+CUpDqM+D0I09uIlfMUV3zyi17y70ig1UxOHQ0Ilrt3RzgokTpVI6HpCWKjJy70dKw8bteMbgzIld4EE/+MOss4tY7qdSw58tuyCIAXXJzqVe5+V62NslSxHAJP21kwjxJiVh1Eohm2HHVPfGPbJ8Vj2IzsViNgAERYX9bngVCWs1zr7HpmW2zfW1gW9N4XWZ3XJf2vVUUpBNFQuNUtrLDMiaxw==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(110136005)(86362001)(81166007)(54906003)(82310400005)(186003)(7416002)(36860700001)(40460700003)(83380400001)(508600001)(7696005)(30864003)(26005)(2906002)(5660300002)(1076003)(7406005)(8936002)(356005)(316002)(921005)(70586007)(4326008)(6666004)(2616005)(47076005)(426003)(336012)(70206006)(8676002)(36756003)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 23:53:22.6953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d433d016-a761-457c-7635-08da4ff365b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5235
X-Mailman-Approved-At: Fri, 17 Jun 2022 07:12:24 +0000
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
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 25 +++++++-----------
 drivers/s390/cio/vfio_ccw_cp.c                |  4 +--
 drivers/s390/crypto/vfio_ap_ops.c             |  9 +++----
 drivers/vfio/vfio.c                           | 26 +++++++++----------
 drivers/vfio/vfio.h                           |  4 +--
 drivers/vfio/vfio_iommu_type1.c               | 17 ++++++------
 include/linux/vfio.h                          |  4 +--
 8 files changed, 41 insertions(+), 52 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index eded8719180f..d28f8bcbfbc6 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -262,10 +262,10 @@ Translation APIs for Mediated Devices
 The following APIs are provided for translating user pfn to host pfn in a VFIO
 driver::
 
-	int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
+	int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 				  int npage, int prot, unsigned long *phys_pfn);
 
-	int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
+	int vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
 				    int npage);
 
 These functions call back into the back-end IOMMU module by using the pin_pages
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index e2f6c56ab342..c9bdc3901f1e 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -231,19 +231,12 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
 {
+	unsigned long npage = roundup(size, PAGE_SIZE) / PAGE_SIZE;
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
-	int total_pages;
-	int npage;
 	int ret;
 
-	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
-
-	for (npage = 0; npage < total_pages; npage++) {
-		unsigned long cur_gfn = gfn + npage;
-
-		ret = vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
-		drm_WARN_ON(&i915->drm, ret != 1);
-	}
+	ret = vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT, npage);
+	drm_WARN_ON(&i915->drm, ret != npage);
 }
 
 /* Pin a normal or compound guest page for dma. */
@@ -261,14 +254,14 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	 * on stack to hold pfns.
 	 */
 	for (npage = 0; npage < total_pages; npage++) {
-		unsigned long cur_gfn = gfn + npage;
+		unsigned long cur_iova = (gfn + npage) << PAGE_SHIFT;
 		unsigned long pfn;
 
-		ret = vfio_pin_pages(&vgpu->vfio_device, &cur_gfn, 1,
+		ret = vfio_pin_pages(&vgpu->vfio_device, cur_iova, 1,
 				     IOMMU_READ | IOMMU_WRITE, &pfn);
 		if (ret != 1) {
-			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
-				     cur_gfn, ret);
+			gvt_vgpu_err("vfio_pin_pages failed for iova 0x%lx, ret %d\n",
+				     cur_iova, ret);
 			goto err;
 		}
 
@@ -312,7 +305,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	if (dma_mapping_error(dev, *dma_addr)) {
 		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
 			     page_to_pfn(page), ret);
-		gvt_unpin_guest_page(vgpu, gfn, size);
+		gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
 		return -ENOMEM;
 	}
 
@@ -325,7 +318,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 
 	dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
-	gvt_unpin_guest_page(vgpu, gfn, size);
+	gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
 }
 
 static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 4659c2e35877..e2b01115b3ec 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -113,7 +113,7 @@ static void pfn_array_unpin(struct pfn_array *pa,
 			continue;
 		}
 
-		vfio_unpin_pages(vdev, first, npage);
+		vfio_unpin_pages(vdev, *first << PAGE_SHIFT, npage);
 		unpinned += npage;
 		npage = 1;
 	}
@@ -144,7 +144,7 @@ static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
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
index 61e71c1154be..861594dd461a 100644
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
@@ -1953,22 +1952,21 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
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
  * Return error or number of pages unpinned.
  */
-int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
+int vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
 		     int npage)
 {
 	struct vfio_container *container;
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !npage || !vfio_assert_device_open(device))
+	if (!npage || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -1978,7 +1976,7 @@ int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	container = device->group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unpin_pages))
-		ret = driver->ops->unpin_pages(container->iommu_data, user_pfn,
+		ret = driver->ops->unpin_pages(container->iommu_data, iova,
 					       npage);
 	else
 		ret = -ENOTTY;
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index a67130221151..6bd5304ee0b7 100644
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
 	int		(*unpin_pages)(void *iommu_data,
-				       unsigned long *user_pfn, int npage);
+				       dma_addr_t user_iova, int npage);
 	int		(*register_notifier)(void *iommu_data,
 					     unsigned long *events,
 					     struct notifier_block *nb);
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index c13b9290e357..d027ed8441a9 100644
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
@@ -949,14 +949,14 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 }
 
 static int vfio_iommu_type1_unpin_pages(void *iommu_data,
-					unsigned long *user_pfn,
+					dma_addr_t user_iova,
 					int npage)
 {
 	struct vfio_iommu *iommu = iommu_data;
 	bool do_accounting;
 	int i;
 
-	if (!iommu || !user_pfn || npage <= 0)
+	if (!iommu || npage <= 0)
 		return -EINVAL;
 
 	/* Supported for v2 version only */
@@ -967,10 +967,9 @@ static int vfio_iommu_type1_unpin_pages(void *iommu_data,
 
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
index aa888cc51757..edbad5d3d50a 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -147,9 +147,9 @@ extern bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-extern int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
+extern int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 			  int npage, int prot, unsigned long *phys_pfn);
-extern int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
+extern int vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
 			    int npage);
 extern int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
 		       void *data, size_t len, bool write);
-- 
2.17.1

