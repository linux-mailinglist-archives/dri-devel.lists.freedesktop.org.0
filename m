Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B1854F19C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F2B11A92C;
	Fri, 17 Jun 2022 07:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3514893CB;
 Thu, 16 Jun 2022 23:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f63Hc8jfWwy8sHpiYALaMYbPc9McSlVDRL9tOueDHLE79CXkLu/h+OIbX/99lAjLVwPlP4SL4lbOz+4KafGxF4IZQt9MOTJ3v0Jt5ZRiofBURQTjb4XBy6mtcAB2i9ECAvMatlZ0mfbFDvE0/c8DnsSsH9bPHrQvLLTF4glaQsBPBUQuNfo2zsw0H6bmv0vdFo26PQdSEw+AfZB2Y+wjN/WvKCx6L9HWkAX2ThZRs8lqr+ou64pC7fwt/AyLqizuEuH4jUHIH+J/iAvZo9n93GSlO0eTdVI9eWse35/YjDyQYQbrRHrplpOnSvTU1oImuoj6CV8WJSKU6O4jRliEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNlV434ffnm9p6HOycKD2zrW5XaWt8DVttM8mV+9+e0=;
 b=IFfDR5JoqSNWmSD2LehCW5z/i51lbDSUdIQRwXkqGn7wJYK3UNeEMALXdwEeqJ53G47qoFqYVdmzKorelKsF2+w6O3bYXdXiB7kaNgYYAlioVc9+/T7+7LWhZSKBXXudFVYYuWxGmrcC/5sdc413XWS+Z2GQDgRY9axmmvW1qu//EKPQAQQVoJbFx9sL+aV4YFC+tb6zoL0CseVyRRcBLnSZOLgfypWHT1axvHbLaXolhwJVzMRz2zZswK+yPUtR9sJGyP2xBhEeFKblmOE5pz+VNqp59esyUGcJ/xD+56GMbztCe47+RimEsRgcSihtO5yPtvTrIXSxEzlyJenuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNlV434ffnm9p6HOycKD2zrW5XaWt8DVttM8mV+9+e0=;
 b=qUIcMAWGsqJG5nnjVorKUbCm3LKd0sKHz5tQ3UA886Su/GIZlOZFj1CsXXjxZy/ZWY/0liNbw0MzGwRlswroV2Y3YAQkKEtwzcu/tDzNwSaClv4JmF/rBK3jnamlriBLNfa8s9Q1nxlBz1UG2ENk1R6K3IUNAIhnOJaxVc1DXh9xfJakYgu3svvFO+L2XQxIUv6frPjD6yNy9kZfmnDZsHNI76a3+x+sycmlUwif7T0YaULmn26MD4S5GuFcTCJnTbglGOaWjUw98dgfhCvO/UOCuekQIio3UhD4dLcRIU07GDGGd7ut6pxF30ktCTvURJUfrCeTC7fPSNmA7ZWcTw==
Received: from BN9PR03CA0108.namprd03.prod.outlook.com (2603:10b6:408:fd::23)
 by MN2PR12MB3037.namprd12.prod.outlook.com (2603:10b6:208:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Thu, 16 Jun
 2022 23:53:31 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::48) by BN9PR03CA0108.outlook.office365.com
 (2603:10b6:408:fd::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Thu, 16 Jun 2022 23:53:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 16 Jun 2022 23:53:31 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 16 Jun 2022 23:53:30 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 16:53:29 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 16 Jun 2022 16:53:27 -0700
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
Subject: [RFT][PATCH v1 6/6] vfio: Replace phys_pfn with phys_page for
 vfio_pin_pages()
Date: Thu, 16 Jun 2022 16:52:12 -0700
Message-ID: <20220616235212.15185-7-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616235212.15185-1-nicolinc@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40cfe9b5-8c6e-41fd-f994-08da4ff36abb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3037:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB303726A93DF599C6213236D6ABAC9@MN2PR12MB3037.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e1PM9/XpuQz0VT9Zz8LtzMMr5inCFsipRkFkM0hQeAzqOVsvq6jYTandZ8Wbm8CSlMHJN+BtdVSkgxjGyLoJrtizA5TDLvHi/L4VC/m+GcuMqvmBjIhLyPOY+KHki8H+aOrF+mGD/9SU3ijwB0Bs1u5c4vBTS0epIx+5hxI9H8mLIW7Nemnk+e1xx7chexjuxt3LbxV5rupqHghvX7alc0UAPj23MseEBiYekpttBXP8EMzF6zAfeCIfXaiRB/LQI+WZr3L6eOBFYAB/bgcG2+afk0rKLESYrTSuJsfGjNfm3adRGTbQCxzImCrK4VUh/g+YKmILli16ru6C/uRiiIlfvBcoTBWipayUFAhaxnN9xt22Unt+9yToLxfZMcq/oWdYCkLhlLMAXABz7BNt1km5sQGM+Jdz1ynivHAWwf6EvwUng3Zf7CDI0tdUepptph9ZfLfIRzs/uXt6epyrnSDCzHuU5idmanNJRovJkOA0i5Otl9704TWMz7ev3U0J7Fhb9LzgS440BXzt2lDo3CZeAeXNuiYugv/gkLTPf2JBL92fEZZBiv7Std1r0XDmCkF3th4syfnyobdXSEyDfERQHwa0aw8cGxgI01YNI5qdZws4yZwPVtPqJqM9RiM+GH52gpBPUvXMzs6A1wP5TP6ZTEzVV0lkVLfweCBzIhoWk8atB1Ev+N3NQH1sn1aK/0DSKV1sE4fpRBSWrnlQB8qS4yvn6BHxOtHsHgS9kXXqr9IzroZljrRh1wek+Pu/rgKBjmEHwAg7shiEwlkF2Q==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(40470700004)(46966006)(36840700001)(7696005)(2616005)(40460700003)(26005)(2906002)(82310400005)(30864003)(8936002)(7416002)(7406005)(36756003)(110136005)(5660300002)(508600001)(4326008)(8676002)(81166007)(356005)(921005)(86362001)(186003)(36860700001)(1076003)(83380400001)(316002)(54906003)(70586007)(70206006)(47076005)(426003)(336012)(6666004)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 23:53:31.0197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cfe9b5-8c6e-41fd-f994-08da4ff36abb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3037
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

Most of the callers of vfio_pin_pages() want "struct page *" and the
low-level mm code to pin pages returns a list of "struct page *" too.
So there's no gain in converting "struct page *" to PFN in between.

Replace the output parameter phys_pfn list with a phys_page list, to
simplify callers. This also allows us to replace the vfio_iommu_type1
implementation with a more efficient one.

For now, also update vfio_iommu_type1 to fit this new parameter too.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 19 ++++++-------------
 drivers/s390/cio/vfio_ccw_cp.c                | 19 +++++++++----------
 drivers/s390/crypto/vfio_ap_ops.c             |  7 ++++---
 drivers/vfio/vfio.c                           |  8 ++++----
 drivers/vfio/vfio.h                           |  2 +-
 drivers/vfio/vfio_iommu_type1.c               | 19 +++++++++++--------
 include/linux/vfio.h                          |  2 +-
 8 files changed, 37 insertions(+), 41 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index d28f8bcbfbc6..070e51bb0bb6 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -263,7 +263,7 @@ The following APIs are provided for translating user pfn to host pfn in a VFIO
 driver::
 
 	int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
-				  int npage, int prot, unsigned long *phys_pfn);
+				  int npage, int prot, struct page **phys_page);
 
 	int vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
 				    int npage);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index c9bdc3901f1e..669432999676 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -243,7 +243,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, struct page **page)
 {
-	unsigned long base_pfn = 0;
+	struct page *base_page = NULL;
 	int total_pages;
 	int npage;
 	int ret;
@@ -255,26 +255,19 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	 */
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_iova = (gfn + npage) << PAGE_SHIFT;
-		unsigned long pfn;
+		struct page *cur_page;
 
 		ret = vfio_pin_pages(&vgpu->vfio_device, cur_iova, 1,
-				     IOMMU_READ | IOMMU_WRITE, &pfn);
+				     IOMMU_READ | IOMMU_WRITE, &cur_page);
 		if (ret != 1) {
 			gvt_vgpu_err("vfio_pin_pages failed for iova 0x%lx, ret %d\n",
 				     cur_iova, ret);
 			goto err;
 		}
 
-		if (!pfn_valid(pfn)) {
-			gvt_vgpu_err("pfn 0x%lx is not mem backed\n", pfn);
-			npage++;
-			ret = -EFAULT;
-			goto err;
-		}
-
 		if (npage == 0)
-			base_pfn = pfn;
-		else if (base_pfn + npage != pfn) {
+			base_page = cur_page;
+		else if (base_page + npage != cur_page) {
 			gvt_vgpu_err("The pages are not continuous\n");
 			ret = -EINVAL;
 			npage++;
@@ -282,7 +275,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		}
 	}
 
-	*page = pfn_to_page(base_pfn);
+	*page = base_page;
 	return 0;
 err:
 	gvt_unpin_guest_page(vgpu, gfn, npage * PAGE_SIZE);
diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 12cbe66721af..92be288dff74 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -24,8 +24,8 @@ struct pfn_array {
 	unsigned long		pa_iova;
 	/* Array that stores PFNs of the pages need to pin. */
 	unsigned long		*pa_iova_pfn;
-	/* Array that receives PFNs of the pages pinned. */
-	unsigned long		*pa_pfn;
+	/* Array that receives the pinned pages. */
+	struct page		**pa_page;
 	/* Number of pages pinned from @pa_iova. */
 	int			pa_nr;
 };
@@ -73,19 +73,19 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
 
 	pa->pa_iova_pfn = kcalloc(pa->pa_nr,
 				  sizeof(*pa->pa_iova_pfn) +
-				  sizeof(*pa->pa_pfn),
+				  sizeof(*pa->pa_page),
 				  GFP_KERNEL);
 	if (unlikely(!pa->pa_iova_pfn)) {
 		pa->pa_nr = 0;
 		return -ENOMEM;
 	}
-	pa->pa_pfn = pa->pa_iova_pfn + pa->pa_nr;
+	pa->pa_page = (struct page **)pa->pa_iova_pfn + pa->pa_nr;
 
 	pa->pa_iova_pfn[0] = pa->pa_iova >> PAGE_SHIFT;
-	pa->pa_pfn[0] = -1ULL;
+	pa->pa_page[0] = NULL;
 	for (i = 1; i < pa->pa_nr; i++) {
 		pa->pa_iova_pfn[i] = pa->pa_iova_pfn[i - 1] + 1;
-		pa->pa_pfn[i] = -1ULL;
+		pa->pa_page[i] = NULL;
 	}
 
 	return 0;
@@ -147,7 +147,7 @@ static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
 
 		ret = vfio_pin_pages(vdev, *first << PAGE_SHIFT, npage,
 				     IOMMU_READ | IOMMU_WRITE,
-				     &pa->pa_pfn[pinned]);
+				     &pa->pa_page[pinned]);
 		if (ret < 0) {
 			goto err_out;
 		} else if (ret > 0 && ret != npage) {
@@ -200,7 +200,7 @@ static inline void pfn_array_idal_create_words(
 	 */
 
 	for (i = 0; i < pa->pa_nr; i++)
-		idaws[i] = pa->pa_pfn[i] << PAGE_SHIFT;
+		idaws[i] = page_to_phys(pa->pa_page[i]);
 
 	/* Adjust the first IDAW, since it may not start on a page boundary */
 	idaws[0] += pa->pa_iova & (PAGE_SIZE - 1);
@@ -251,8 +251,7 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 
 	l = n;
 	for (i = 0; i < pa.pa_nr; i++) {
-		struct page *page = pfn_to_page(pa.pa_pfn[i]);
-		void *from = kmap_local_page(page);
+		void *from = kmap_local_page(pa.pa_page[i]);
 
 		m = PAGE_SIZE;
 		if (i == 0) {
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 8a2018ab3cf0..e73bdb57bc90 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -243,9 +243,10 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 	struct ap_qirq_ctrl aqic_gisa = {};
 	struct ap_queue_status status = {};
 	struct kvm_s390_gisa *gisa;
+	struct page *h_page;
 	int nisc;
 	struct kvm *kvm;
-	unsigned long g_pfn, h_pfn;
+	unsigned long g_pfn;
 	phys_addr_t h_nib;
 	int ret;
 
@@ -259,7 +260,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 	}
 
 	ret = vfio_pin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1,
-			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
+			     IOMMU_READ | IOMMU_WRITE, &h_page);
 	switch (ret) {
 	case 1:
 		break;
@@ -275,7 +276,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 	kvm = q->matrix_mdev->kvm;
 	gisa = kvm->arch.gisa_int.origin;
 
-	h_nib = (h_pfn << PAGE_SHIFT) | (nib & ~PAGE_MASK);
+	h_nib = page_to_phys(h_page) | (nib & ~PAGE_MASK);
 	aqic_gisa.gisc = isc;
 
 	nisc = kvm_s390_gisc_register(kvm, isc);
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index e8dbb0122e20..7eee8048e231 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1917,18 +1917,18 @@ EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
  * @npage [in]   : count of pages to be pinned.  This count should not
  *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
  * @prot [in]    : protection flags
- * @phys_pfn[out]: array of host PFNs
+ * @phys_page[out]: array of host pages
  * Return error or number of pages pinned.
  */
 int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
-		   int npage, int prot, unsigned long *phys_pfn)
+		   int npage, int prot, struct page **phys_page)
 {
 	struct vfio_container *container;
 	struct vfio_group *group = device->group;
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
+	if (!phys_page || !npage || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -1943,7 +1943,7 @@ int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 	if (likely(driver && driver->ops->pin_pages))
 		ret = driver->ops->pin_pages(container->iommu_data,
 					     group->iommu_group, iova,
-					     npage, prot, phys_pfn);
+					     npage, prot, phys_page);
 	else
 		ret = -ENOTTY;
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 6bd5304ee0b7..758a0a91a066 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -52,7 +52,7 @@ struct vfio_iommu_driver_ops {
 				     struct iommu_group *group,
 				     dma_addr_t user_iova,
 				     int npage, int prot,
-				     unsigned long *phys_pfn);
+				     struct page **phys_page);
 	int		(*unpin_pages)(void *iommu_data,
 				       dma_addr_t user_iova, int npage);
 	int		(*register_notifier)(void *iommu_data,
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index d027ed8441a9..841b1803e313 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -830,7 +830,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 				      struct iommu_group *iommu_group,
 				      dma_addr_t user_iova,
 				      int npage, int prot,
-				      unsigned long *phys_pfn)
+				      struct page **phys_page)
 {
 	struct vfio_iommu *iommu = iommu_data;
 	struct vfio_iommu_group *group;
@@ -840,7 +840,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	bool do_accounting;
 	dma_addr_t iova;
 
-	if (!iommu || !phys_pfn)
+	if (!iommu || !phys_page)
 		return -EINVAL;
 
 	/* Supported for v2 version only */
@@ -879,6 +879,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	do_accounting = list_empty(&iommu->domain_list);
 
 	for (i = 0; i < npage; i++) {
+		unsigned long phys_pfn;
 		struct vfio_pfn *vpfn;
 
 		iova = user_iova + PAGE_SIZE * i;
@@ -895,23 +896,25 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 
 		vpfn = vfio_iova_get_vfio_pfn(dma, iova);
 		if (vpfn) {
-			phys_pfn[i] = vpfn->pfn;
+			phys_page[i] = pfn_to_page(vpfn->pfn);
 			continue;
 		}
 
 		remote_vaddr = dma->vaddr + (iova - dma->iova);
-		ret = vfio_pin_page_external(dma, remote_vaddr, &phys_pfn[i],
+		ret = vfio_pin_page_external(dma, remote_vaddr, &phys_pfn,
 					     do_accounting);
 		if (ret)
 			goto pin_unwind;
 
-		ret = vfio_add_to_pfn_list(dma, iova, phys_pfn[i]);
+		ret = vfio_add_to_pfn_list(dma, iova, phys_pfn);
 		if (ret) {
-			if (put_pfn(phys_pfn[i], dma->prot) && do_accounting)
+			if (put_pfn(phys_pfn, dma->prot) && do_accounting)
 				vfio_lock_acct(dma, -1, true);
 			goto pin_unwind;
 		}
 
+		phys_page[i] = pfn_to_page(phys_pfn);
+
 		if (iommu->dirty_page_tracking) {
 			unsigned long pgshift = __ffs(iommu->pgsize_bitmap);
 
@@ -934,14 +937,14 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	goto pin_done;
 
 pin_unwind:
-	phys_pfn[i] = 0;
+	phys_page[i] = NULL;
 	for (j = 0; j < i; j++) {
 		dma_addr_t iova;
 
 		iova = user_iova + PAGE_SIZE * j;
 		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
 		vfio_unpin_page_external(dma, iova, do_accounting);
-		phys_pfn[j] = 0;
+		phys_page[j] = NULL;
 	}
 pin_done:
 	mutex_unlock(&iommu->lock);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 99c3bf52c4da..7bc18802bf39 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -148,7 +148,7 @@ extern bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
 extern int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
-			  int npage, int prot, unsigned long *phys_pfn);
+			  int npage, int prot, struct page **phys_page);
 extern int vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
 			    int npage);
 extern int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova,
-- 
2.17.1

