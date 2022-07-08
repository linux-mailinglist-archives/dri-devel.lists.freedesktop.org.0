Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3756C1A5
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A187F10EED6;
	Fri,  8 Jul 2022 22:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E51F10EEE5;
 Fri,  8 Jul 2022 22:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZJOBCjuAioIyl8kEXcFO7hg4F24kg+C8IW48Cq9W98MkVVfoBR/W0uga9526JrHtA620VROrhlnMsm5qxxMSJ8FN8ikV7w+8KJ9UUeod4YxRR1c2XqeFQon9Gpxau6v9u9WEKtLfpjMGTSd0jMj0gEBAHfIja+K5xuU6x7rDbpon3TXnZZ6+h5noG4mik6H2qowdMFWTmIrU32cWnhIUvp5wda4ktwDKpYtzah76Ixfq9DEpgnTMpbQs9E96Gko8FDzKMOqHRqJ5i/729X7jGm6CAZuypVfZA853b+G0Lc2ym6ZBEWRS1u10R8hCFYu5/YAY0JBLaswW7sqqO8LRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uilZIFnkhD2ZVdfgbOGesKshY5WRz6g3XkKMyw2pUF8=;
 b=NIrvvuJ9a/2UhsPBOxeNDUFezQ+UyrMGhW7aXMZ595A3kHfaZ2yLUfZR6FTqyxGHMI6m+QgaN2aJ4wQrso38WTe4W7s/jg5ir1LIV7zchPGlniC1VzTf9q38BNKeNNu+K8V53XjXI8W/4CNK3KZgO8Tjha75BipMPe8eMsciyv1kvYyFnNSe+sqOQQ2xw8XHvBLuU+9npyMIGh03Q12fi+3R39jdDS4eGjKU94yWIt8oVuonIwfSiZHKDjtGvQ5hvH3ELcYqVCLQZAksfSQ8WAc96E+5otodekmo3j4ZCgISREd5sf6rYEhFl6ntfgCQTCngp47EHzSVLEB0FpEYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uilZIFnkhD2ZVdfgbOGesKshY5WRz6g3XkKMyw2pUF8=;
 b=WmDIME0tvpPP0g8AGYzYKAKi4sjf0ngIHSvVsQhasWcsUka/Gcpmj/mCY+lvNpRw22LBU2CzwgRpU4MNdXKhAeF+xFnGUD2PG1dZPnVDyR3jqQy3JtY3o314Vd3G0ZEiEOizhiot1c8mkSZeFY0uy88UBhWxB4IgQ45E07y5tHGj/+E7qL12ga3UPYKlLlquNCWE7JwVHMu+13WZ6kVyDAWRsEDqm1ZfkOor9ajy6zu52CLJnVu8u3CC2rtBb7DauMG+Y7zk14codSgYBseSX5hHbmJoINmq3HVViPkAxbA2k/v21XJbA/Va7SnPJHb80CgXtGwYKRKRyiJEokA+pQ==
Received: from MWHPR1401CA0003.namprd14.prod.outlook.com
 (2603:10b6:301:4b::13) by CY5PR12MB6298.namprd12.prod.outlook.com
 (2603:10b6:930:21::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 22:44:42 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::e3) by MWHPR1401CA0003.outlook.office365.com
 (2603:10b6:301:4b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:42 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:41 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:41 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:38 -0700
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
Subject: [PATCH v3 05/10] vfio: Pass in starting IOVA to vfio_pin/unpin_pages
 API
Date: Fri, 8 Jul 2022 15:44:23 -0700
Message-ID: <20220708224427.1245-6-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708224427.1245-1-nicolinc@nvidia.com>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91076483-39b6-4ed2-5353-08da613372c9
X-MS-TrafficTypeDiagnostic: CY5PR12MB6298:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xYpOD70RfsonmgApjQldsd3WG3ThI3a9XRitY0m/hXpD0hhuOALjFvCNndNwlPOZK6RutU3d/yPoTN5F3t5CkN7SvVHWL40exwYAIJE2/LixPFiOk6ZmAF+tU2cE0G19jC4Yyq57Eo9h6lbMdvFFD88q+vCMSy8U+fmyDKNRqAPTLPJjPL4XCwHCCUywWYaRqYrHQ+kQpPqWIeqS3CtocBkd0ANf65eF3vZUmQUmzbk1h1tGry6CY8BKtDH1XYBof72zge9bt2Kksfh4w5R0MIMGaKAtsccvvGKkdihMmh98uMSDky3uiZ+cUd/pJEdjkiKSd605muAWdf4+Ojih3anyQpJ7hMQhRyJMSTb/eR1YPh/v47XG1i8rEd14/SqjqAXp5SSco5V5UImuwUyvcwVBQ2TS2E/vaKxxbuHO2o1FEQ7G1FhYPzBf5ZVT9jETGjE+oEqGBm4TZ+FEXEzRiK3PAM1L4DJSPI1y3KTgobTdmbWqhvpJSdNqF9WOdsfrp9UlFQaR871jKDwX9UHqE3cy7HIKQcNTWyFWzZ7xNVxrzqFS/Zd56AAW2bbtsFDJictDKaPvkbvNGMkN/gOtgFuzGCqLINmtWgWSKAotdnT3/Qtb6gOvsaFi/xmYQTP5Hf0PmQK/6pESJZnrD110kyQKLbqiiOBeiASMGXybUcFA4FBusvUbKJ+KNnk/hqcnCLwlMbV0PgdmW4r0o6endji5QO+fdUNGVYRPzdRMKgNLDqrTeur7GMOMDBZzQADAZncTbNMP3LIeA4/Y6VcmFsCBTwRR88plK77w/DVUzQsfLiTa8WMQSeM35ogg3hDjXKxzIprnPTlu4wr4YdfMi3o7NqGFbmLt5erAaGaeRVJ8SoSHzPf6/PLTm4NmGfydnH6CZ2Pkx9yHfqcWORiiVtbej01kqKj++2TmFzJxs1U=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(40470700004)(36840700001)(426003)(336012)(2616005)(47076005)(26005)(83380400001)(7406005)(82310400005)(30864003)(186003)(8936002)(2906002)(1076003)(7416002)(6666004)(41300700001)(36756003)(5660300002)(7696005)(478600001)(40460700003)(81166007)(82740400003)(356005)(86362001)(921005)(316002)(110136005)(54906003)(4326008)(40480700001)(70206006)(8676002)(36860700001)(70586007)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:42.1807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91076483-39b6-4ed2-5353-08da613372c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298
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
Acked-by: Eric Farman <farman@linux.ibm.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  4 +--
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 22 ++++++---------
 drivers/s390/cio/vfio_ccw_cp.c                |  4 +--
 drivers/s390/crypto/vfio_ap_ops.c             |  9 +++----
 drivers/vfio/vfio.c                           | 27 +++++++++----------
 drivers/vfio/vfio.h                           |  4 +--
 drivers/vfio/vfio_iommu_type1.c               | 15 +++++------
 include/linux/vfio.h                          |  5 ++--
 8 files changed, 39 insertions(+), 51 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 4307421dcaa0..af31eaf836e8 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -260,10 +260,10 @@ Translation APIs for Mediated Devices
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
index 7ce7b09aa5b2..d3ac8383d759 100644
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
 
@@ -306,7 +300,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	if (dma_mapping_error(dev, *dma_addr)) {
 		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
 			     page_to_pfn(page), ret);
-		gvt_unpin_guest_page(vgpu, gfn, size);
+		gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
 		return -ENOMEM;
 	}
 
@@ -319,7 +313,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
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
index ad90adbfddc8..ee4d45c2f210 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1915,17 +1915,17 @@ int vfio_set_irqs_validate_and_prepare(struct vfio_irq_set *hdr, int num_irqs,
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
@@ -1933,8 +1933,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !phys_pfn || !npage ||
-	    !vfio_assert_device_open(device))
+	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -1948,7 +1947,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->pin_pages))
 		ret = driver->ops->pin_pages(container->iommu_data,
-					     group->iommu_group, user_pfn,
+					     group->iommu_group, iova,
 					     npage, prot, phys_pfn);
 	else
 		ret = -ENOTTY;
@@ -1958,15 +1957,13 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
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
@@ -1981,7 +1978,7 @@ void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	container = device->group->container;
 	driver = container->iommu_driver;
 
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
index cfeea4efd625..c5ff9970edc4 100644
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
@@ -949,7 +949,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 }
 
 static void vfio_iommu_type1_unpin_pages(void *iommu_data,
-					 unsigned long *user_pfn, int npage)
+					 dma_addr_t user_iova, int npage)
 {
 	struct vfio_iommu *iommu = iommu_data;
 	bool do_accounting;
@@ -963,10 +963,9 @@ static void vfio_iommu_type1_unpin_pages(void *iommu_data,
 
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
index 5348ef353029..2cefb63751f9 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -157,10 +157,9 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 
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

