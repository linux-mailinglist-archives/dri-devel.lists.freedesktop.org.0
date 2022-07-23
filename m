Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3857EB62
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318DF92F05;
	Sat, 23 Jul 2022 02:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28EC92E43;
 Sat, 23 Jul 2022 02:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdAdPL4hi3jcHgTcYjA37kh8AbNrq8kZE0CopPb7AUiKcNDHecokqQTv7Y54o3uyCRz38IsKj7vBILvW0tcoN02cy6IwiPyDB8+AhI81Zq9mdfbaoDfCML9fnfntodspcmSkpSq9ZEd36vqg8O95uDbUgy5/dGdXORe0Ho8B+6BCKFUfUTlk9SYCqjd/BvNwBdAMRzpkgWmukwLLo/n3ub8cEv7b1ia+xsqUCDW9HeFPJRL/j1VLlCWUlxjRQTDviQcOgX0nVEIuZLWXLhRNhNt6Py1JftkF6XdebsROkR6JI2qVC6Y1QOxWJAMWjnELFC5vzxycV3MhCoRHO2tPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkZUlYCR++ge2kXJMMvJl0UA/sy1ms1bTpAalCz/4yE=;
 b=J88T2wS/u0gffc0SPRfr55HvWdMyjiN6i78u0MEceSS3atOHbbJf1hdzhMbxCEaa0r5Dnx9RfhSX+YnFCmNj72KNjJtG+k9cehoi8c6PvSDhx5OsIM4q3xgzcenRjiaeDfFOnyOcqJpK7wQe8D76MTis+VLUdyuUYAjxqW5etE8Kv5d3omj/JpeWYnnTIcZwMG8PIG0C7aBHfOxlMzLfiRx0jB1EM/eRSp7qBjKeZwrppONvsp/O7eD655NNUAW7WQ0qxlceGkGwXsg/Y7bhl9PHsCP+99zhuxlcaxDJjksfe1yt6mXhNZ7su0YnMakkH+eRHBVwFkMKZwtXbLXDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkZUlYCR++ge2kXJMMvJl0UA/sy1ms1bTpAalCz/4yE=;
 b=g06EbZAByiQMHNo2BPEq/+nvTl+fVXeUj7fYoEmLGsS9AEi6MZARUhZpZonUvdXTw6Qz3WA22hbtdGR4NKnJkfjQlwXQ+6Nc584TnGXoQk2gPIqP8Mqu+lc6Y+4ZNIr4KcOmZoutC3NhjluqImAP2Ebl7JhYCqheoXgRmFrZj6WDbWgnctsqciYKk/VmgEhrCYsyWRh5quJBfhxkNsr5I0JE0eOnFxijngpgEFMnCf47qVe4WmBi3rFDMQkvYrFVqkCWfFzVza8ZnzmYt3qcL96RbpWfvI2PBkLkp8orQVDGPRSq6ZAFNShh2ki0biokt13TdVlDgzPHSJPCWFNN5w==
Received: from BN0PR04CA0143.namprd04.prod.outlook.com (2603:10b6:408:ed::28)
 by DM5PR1201MB0009.namprd12.prod.outlook.com (2603:10b6:3:de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Sat, 23 Jul
 2022 02:04:19 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::90) by BN0PR04CA0143.outlook.office365.com
 (2603:10b6:408:ed::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20 via Frontend
 Transport; Sat, 23 Jul 2022 02:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT042.mail.protection.outlook.com (10.13.177.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:04:19 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:04:18 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:04:17 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:04:16 -0700
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
Subject: [PATCH v4 05/10] vfio: Pass in starting IOVA to vfio_pin/unpin_pages
 API
Date: Fri, 22 Jul 2022 19:02:51 -0700
Message-ID: <20220723020256.30081-6-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f07d4c0-039d-4c95-0be2-08da6c4fa766
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0009:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UV3kHfyDETbmbuybkLsksliQ0dsIYSFmNiy3tHW6pDT+SN1haoYES/kEyvLqzmN1bRmDmMp61e5Yts/R+Mzo4ihcDck2QI3cfTI2Wrom9dS/hoPJM0wYUtdyfZni3oTucUKuIFRAqmAF0l0XNVd5aSYe9ZuXsDWz6C6DFcvhjyGjHmH12Le6o9wxQ4qIwNk4pQ17JD0EcaqLwOCdp7+LSVQewhA0ciXNHeEXcPDx85KBBdUaYx74UUW8CHWhpqykIoxoOQhSdS8sYZ42MmEtgb2g7ReG+758msJMDLnIGYQvChG3yyCQCYSeArAwsZS7S9iaFmygNslFR1f73AMT1r+FWRZ6BTtrcW6bFZlFVAWreQ16Ls1gZpAq1hcIzONd1TJPzMur8dhMyDLazcyrmvhMezA2W7ew6LQ3pwE3xlwaf5uYA7wUoSJGHuhxTEA1dK8mxG8qhg20ptL6wnMdd0ntI1yhtXm8vJHglLD9gTonbw2/q6NDUXafcfVHldm2xRHTq8w6cyQagfw9pWdj2DTEyq54c6ZDLlGoRpGDRavo0q4icnrv5zf94uKmNl4rcnec/+IZkoegSgBMZOnKqi5ut8wdaV2jXIev59Rfw29E0Qe7rosOtWA4h4Y2vqCgiwTYFJ3PLOQUiGKzexWv6qEX3Nqr9hoWTE2tjdKnidrNaKAWAFFhfyff4d0zQevakkpwnOt664I5qRuf21Lzr09VxMzTjxvVG2bydGF/wGYb20ZWqHhdHfp0WGP3EXvbzVbnEMu+ra+xsIIUgUgv4QP9VQx149B460MPB8pLLt3tDVLL9tXuG5w5Rly+ugvIFisjn6iuUtUzActbNv9mjUbEdGPv1DJGHqhQq/K1DiYQtwP9LGT78s02h/AD9Tcfrgtbex0V+8dn9B/4DBZT6Q==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(40470700004)(36840700001)(6666004)(41300700001)(47076005)(336012)(1076003)(426003)(478600001)(40480700001)(82310400005)(83380400001)(2616005)(36860700001)(7696005)(36756003)(5660300002)(8936002)(110136005)(2906002)(26005)(30864003)(54906003)(316002)(186003)(356005)(81166007)(86362001)(70586007)(82740400003)(70206006)(40460700003)(921005)(7406005)(7416002)(4326008)(8676002)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:04:19.0701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f07d4c0-039d-4c95-0be2-08da6c4fa766
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0009
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

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Acked-by: Eric Farman <farman@linux.ibm.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  4 +--
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 18 +++++--------
 drivers/s390/cio/vfio_ccw_cp.c                |  4 +--
 drivers/s390/crypto/vfio_ap_ops.c             |  9 +++----
 drivers/vfio/vfio.c                           | 27 +++++++++----------
 drivers/vfio/vfio.h                           |  4 +--
 drivers/vfio/vfio_iommu_type1.c               | 15 +++++------
 include/linux/vfio.h                          |  5 ++--
 8 files changed, 37 insertions(+), 49 deletions(-)

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
index 2fee5695515a..8be75c282611 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -231,14 +231,8 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
 {
-	int total_pages = DIV_ROUND_UP(size, PAGE_SIZE);
-	int npage;
-
-	for (npage = 0; npage < total_pages; npage++) {
-		unsigned long cur_gfn = gfn + npage;
-
-		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
-	}
+	vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT,
+			 DIV_ROUND_UP(size, PAGE_SIZE));
 }
 
 /* Pin a normal or compound guest page for dma. */
@@ -255,14 +249,14 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
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
index 5781059d3ed2..70f484668ca0 100644
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
@@ -1232,9 +1232,8 @@ static void vfio_ap_mdev_dma_unmap(struct vfio_device *vdev, u64 iova,
 {
 	struct ap_matrix_mdev *matrix_mdev =
 		container_of(vdev, struct ap_matrix_mdev, vdev);
-	unsigned long g_pfn = iova >> PAGE_SHIFT;
 
-	vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
+	vfio_unpin_pages(&matrix_mdev->vdev, iova, 1);
 }
 
 /**
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 92b10aafae28..ffd1a492eea9 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1934,17 +1934,17 @@ int vfio_set_irqs_validate_and_prepare(struct vfio_irq_set *hdr, int num_irqs,
 EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
 
 /*
- * Pin a set of guest PFNs and return their associated host PFNs for local
+ * Pin contiguous user pages and return their associated host pages for local
  * domain only.
  * @device [in]  : device
- * @user_pfn [in]: array of user/guest PFNs to be pinned.
- * @npage [in]   : count of elements in user_pfn array.  This count should not
- *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
+ * @iova [in]    : starting IOVA of user pages to be pinned.
+ * @npage [in]   : count of pages to be pinned.  This count should not
+ *		   be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
  * @prot [in]    : protection flags
  * @phys_pfn[out]: array of host PFNs
  * Return error or number of pages pinned.
  */
-int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
+int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 		   int npage, int prot, unsigned long *phys_pfn)
 {
 	struct vfio_container *container;
@@ -1952,8 +1952,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !phys_pfn || !npage ||
-	    !vfio_assert_device_open(device))
+	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -1967,7 +1966,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->pin_pages))
 		ret = driver->ops->pin_pages(container->iommu_data,
-					     group->iommu_group, user_pfn,
+					     group->iommu_group, iova,
 					     npage, prot, phys_pfn);
 	else
 		ret = -ENOTTY;
@@ -1977,15 +1976,13 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 EXPORT_SYMBOL(vfio_pin_pages);
 
 /*
- * Unpin set of host PFNs for local domain only.
+ * Unpin contiguous host pages for local domain only.
  * @device [in]  : device
- * @user_pfn [in]: array of user/guest PFNs to be unpinned. Number of user/guest
- *		   PFNs should not be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
- * @npage [in]   : count of elements in user_pfn array.  This count should not
+ * @iova [in]    : starting address of user pages to be unpinned.
+ * @npage [in]   : count of pages to be unpinned.  This count should not
  *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
  */
-void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
-		      int npage)
+void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage)
 {
 	struct vfio_container *container;
 	struct vfio_iommu_driver *driver;
@@ -2000,7 +1997,7 @@ void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	container = device->group->container;
 	driver = container->iommu_driver;
 
-	driver->ops->unpin_pages(container->iommu_data, user_pfn, npage);
+	driver->ops->unpin_pages(container->iommu_data, iova, npage);
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 6a8424b407c7..e9767e13f00f 100644
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
 	void		(*register_device)(void *iommu_data,
 					   struct vfio_device *vdev);
 	void		(*unregister_device)(void *iommu_data,
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index e49fbe9968ef..e629e059118c 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -829,7 +829,7 @@ static int vfio_unpin_page_external(struct vfio_dma *dma, dma_addr_t iova,
 
 static int vfio_iommu_type1_pin_pages(void *iommu_data,
 				      struct iommu_group *iommu_group,
-				      unsigned long *user_pfn,
+				      dma_addr_t user_iova,
 				      int npage, int prot,
 				      unsigned long *phys_pfn)
 {
@@ -841,7 +841,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	bool do_accounting;
 	dma_addr_t iova;
 
-	if (!iommu || !user_pfn || !phys_pfn)
+	if (!iommu || !phys_pfn)
 		return -EINVAL;
 
 	/* Supported for v2 version only */
@@ -857,7 +857,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 again:
 	if (iommu->vaddr_invalid_count) {
 		for (i = 0; i < npage; i++) {
-			iova = user_pfn[i] << PAGE_SHIFT;
+			iova = user_iova + PAGE_SIZE * i;
 			ret = vfio_find_dma_valid(iommu, iova, PAGE_SIZE, &dma);
 			if (ret < 0)
 				goto pin_done;
@@ -882,7 +882,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	for (i = 0; i < npage; i++) {
 		struct vfio_pfn *vpfn;
 
-		iova = user_pfn[i] << PAGE_SHIFT;
+		iova = user_iova + PAGE_SIZE * i;
 		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
 		if (!dma) {
 			ret = -EINVAL;
@@ -939,7 +939,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	for (j = 0; j < i; j++) {
 		dma_addr_t iova;
 
-		iova = user_pfn[j] << PAGE_SHIFT;
+		iova = user_iova + PAGE_SIZE * j;
 		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
 		vfio_unpin_page_external(dma, iova, do_accounting);
 		phys_pfn[j] = 0;
@@ -950,7 +950,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 }
 
 static void vfio_iommu_type1_unpin_pages(void *iommu_data,
-					 unsigned long *user_pfn, int npage)
+					 dma_addr_t user_iova, int npage)
 {
 	struct vfio_iommu *iommu = iommu_data;
 	bool do_accounting;
@@ -964,10 +964,9 @@ static void vfio_iommu_type1_unpin_pages(void *iommu_data,
 
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
index 9f7d74c24925..9e3b6abcf890 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -161,10 +161,9 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 
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

