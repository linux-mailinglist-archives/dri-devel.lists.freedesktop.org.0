Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874DE57EB5F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAC292ECC;
	Sat, 23 Jul 2022 02:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2075.outbound.protection.outlook.com [40.107.96.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288B392EC7;
 Sat, 23 Jul 2022 02:04:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1qzvJGnGM/kDwO3/E0GhseQsyjEbUiTVNKfgjUV48frxwR44Ds8COT4n9Rm6sktHk8tDhm4c1CpFPcQyFVKpuE0O4Az+nzk+YGswKWA00f5bvSuCV5hXWvJdFOZzD9V2lSIZQL8H3FLu5C6ra0aZntHBzi+Wgq67qyvmpYxrTmiPjWyN0Dpwtc+OauAFbGQHiENP7bLcZ3sri+H0qPv+HCDmVDY+z1Sc1l6XcWPILZcK9CCuXcwZ+8aUaJ4pMF4ou4aQPjpvJh1wCJ3cM2Ai1T7EA702gzDS3lgJHVOQ+czHPEYrCrSFCeBZJ87v88Ug5Uhd8GAUKDGGyQ7gWrbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxC0mDq13W+BnjqQ7KFHTfHIlM4tk7VY/COCaDQQKUg=;
 b=Ibl4NZMwNbpIN4z47b+RyhndhUvF0UEyrgq67eIETn01ug1HOSOC0h/J2o4R81UM6UOIf/G2Q/JAlNztD6uPPL3zPanIV1pU8aX2OmdxVMUwcTtcvYuWZ3NQ6PgKA0FCxLg/9tS16G5LF8QlO4NVbEWmp3f0F43rZ0jwqURdX7yECgeinjlZfQr0jXg5CiI1VT+xj02Sn2KsrC6zYW9y5VB3N5oMPzGM+RADWdCdOg7Xyv0udOatNC6HReeLskzjB4fuGSNfugtwDfVG0ofdOD6Ush5pV9VIRyeyTY8r+SOJ5tV6SJ3hXXcK3J8qeovbdCphlrbZCVpbnRBkKa+2pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxC0mDq13W+BnjqQ7KFHTfHIlM4tk7VY/COCaDQQKUg=;
 b=AofF4oaXSDO/LZDrU2ZZq1IkrLSUrZgLcta3chGijpSs2jBmy2uqfk9uRJ5++0z1reC2HCiqVZiD5y4Sjsv7IPMVSqk5JFN+D5FIKEC7ngTZFgJ6Zbcf3w1O8ZLEZ9HqjqGOyMrEjr3HZNKMlreYsEI2bFpCesR6w4IrK8NLsVx94CWy3skThx48sg3wN+I9zDHjsTa67Izb0H87OR/gok9wUyWKcdOuCF/TbEoZjtBZD0muVEPMUDQkK6Ov50Ia3AcmNbVL4AtCao9nEb5U8MTYJoA8s7EV6sdP4aWxYgfpoYvs7jq2s4J4ndgKC7FYxlQdBVfPSYyS6VVyeECUMw==
Received: from BN9PR03CA0294.namprd03.prod.outlook.com (2603:10b6:408:f5::29)
 by BY5PR12MB3857.namprd12.prod.outlook.com (2603:10b6:a03:196::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Sat, 23 Jul
 2022 02:04:28 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::57) by BN9PR03CA0294.outlook.office365.com
 (2603:10b6:408:f5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Sat, 23 Jul 2022 02:04:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:04:27 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:04:27 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:04:26 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:04:25 -0700
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
Subject: [PATCH v4 10/10] vfio: Replace phys_pfn with pages for
 vfio_pin_pages()
Date: Fri, 22 Jul 2022 19:02:56 -0700
Message-ID: <20220723020256.30081-11-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e587d79-c7d4-4a67-16bd-08da6c4fac9e
X-MS-TrafficTypeDiagnostic: BY5PR12MB3857:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BV4kXMvlWw6Cf8CaIE7KMSBEgZpwJsjD2O5Q4ZkXBZclmj47gF6GAmdMY0Pg/GE2YXG7j+J/qMwwGjVv3mukqQj7U7iRqU8PkEPuuN1FiElmoThIQ3Ietxc4ugoNCs3W5yY2v4NXpXX4aqoXSr5/GKlQYPC1iPyWWK6tb6gs4DLQx1hQh/OByxz0+b5UEoDYN8bmA4owJ3lduMYa0hjrGtiLNArWYGTbFVIzW4VmNCq0J/POuXCFgTWVy2r5YC/CjkIwrDvtWGiNaXVoImFJUbxUHrUWSDE7qDixEHufrhtDbIGIHYBV20n5W60AbJOR9MzCHzfacC+s3WSRDrAo4Os0Bxo5idjyzSzSxgRGJo+Kl4GSrY7u9I5VfEfaQUdx/QtPJkbnetMrJ5R1gBlH9WrHT0QJgxhftmcjFybrR1qYJvIu/8dzNU0NLOa/Sc1Rpld7ysDkrhNtOUEBFsk7YoAtfV4T53ijZWsaAxfdfyGhxn8+rXo6Q2UHoC6Xa/jxJclQ5tP3lgcRFI9DNpbF/Aq46pbPN5OuKytldRa0vbK4ohkuWGsxoVQXgoeGtjYJKrCsg4xO4RxyLq+f2vZ3Ks58G9ngPXop4AVREPg5sfgLMX3oRxO+vsmx/GqChmzywyGhbKxbhTvoXu8pUhxNw9tRXMBlREsrxtDtC2vyKOdJTjGIIYJfCSBHk6vnBzlgSs6fkEI+PPgJlfzZv5R4rJR0m7m/f/iVRR0a3CH4L5C2KGp+5A/3ZIHouIHUG2sKltXrAzAiKa6ZzVSwWe+tQz7qwmXP0dhBCUgOLzcgKxlKkd2MW2YRW4YRgRULHTW5MMsnXY9Z2I4LCZRQwk+BUzGxaFE9Xa9J930OCdULxzDw9LmRIj9p7sAnp6gEEjeOCEmJZpJNabFq3f2hQvzaQw==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966006)(40470700004)(36840700001)(110136005)(356005)(7406005)(478600001)(81166007)(54906003)(26005)(336012)(36860700001)(82740400003)(6666004)(86362001)(47076005)(41300700001)(36756003)(7696005)(2616005)(316002)(7416002)(40480700001)(82310400005)(70586007)(921005)(30864003)(2906002)(4326008)(8676002)(186003)(70206006)(5660300002)(8936002)(83380400001)(40460700003)(1076003)(426003)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:04:27.8260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e587d79-c7d4-4a67-16bd-08da6c4fac9e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3857
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

Replace the output parameter "phys_pfn" list with a "pages" list, to
simplify callers. This also allows us to replace the vfio_iommu_type1
implementation with a more efficient one.

And drop the pfn_valid check in the gvt code, as there is no need to
do such a check at a page-backed struct page pointer.

For now, also update vfio_iommu_type1 to fit this new parameter too.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Eric Farman <farman@linux.ibm.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 19 ++++++-------------
 drivers/s390/cio/vfio_ccw_cp.c                | 19 +++++++++----------
 drivers/s390/crypto/vfio_ap_ops.c             |  6 +++---
 drivers/vfio/vfio.c                           |  8 ++++----
 drivers/vfio/vfio.h                           |  2 +-
 drivers/vfio/vfio_iommu_type1.c               | 19 +++++++++++--------
 include/linux/vfio.h                          |  2 +-
 8 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index ea32a0f13ddb..ba5fefcdae1a 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -263,7 +263,7 @@ The following APIs are provided for translating user pfn to host pfn in a VFIO
 driver::
 
 	int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
-				  int npage, int prot, unsigned long *phys_pfn);
+				  int npage, int prot, struct page **pages);
 
 	void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
 				    int npage);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 8be75c282611..e3cd58946477 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -240,7 +240,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, struct page **page)
 {
 	int total_pages = DIV_ROUND_UP(size, PAGE_SIZE);
-	unsigned long base_pfn = 0;
+	struct page *base_page = NULL;
 	int npage;
 	int ret;
 
@@ -250,26 +250,19 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	 */
 	for (npage = 0; npage < total_pages; npage++) {
 		dma_addr_t cur_iova = (gfn + npage) << PAGE_SHIFT;
-		unsigned long pfn;
+		struct page *cur_page;
 
 		ret = vfio_pin_pages(&vgpu->vfio_device, cur_iova, 1,
-				     IOMMU_READ | IOMMU_WRITE, &pfn);
+				     IOMMU_READ | IOMMU_WRITE, &cur_page);
 		if (ret != 1) {
 			gvt_vgpu_err("vfio_pin_pages failed for iova %pad, ret %d\n",
 				     &cur_iova, ret);
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
@@ -277,7 +270,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		}
 	}
 
-	*page = pfn_to_page(base_pfn);
+	*page = base_page;
 	return 0;
 err:
 	gvt_unpin_guest_page(vgpu, gfn, npage * PAGE_SIZE);
diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index cd4ec4f6d6ff..8963f452f963 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -22,8 +22,8 @@
 struct page_array {
 	/* Array that stores pages need to pin. */
 	dma_addr_t		*pa_iova;
-	/* Array that receives PFNs of the pages pinned. */
-	unsigned long		*pa_pfn;
+	/* Array that receives the pinned pages. */
+	struct page		**pa_page;
 	/* Number of pages pinned from @pa_iova. */
 	int			pa_nr;
 };
@@ -68,19 +68,19 @@ static int page_array_alloc(struct page_array *pa, u64 iova, unsigned int len)
 		return -EINVAL;
 
 	pa->pa_iova = kcalloc(pa->pa_nr,
-			      sizeof(*pa->pa_iova) + sizeof(*pa->pa_pfn),
+			      sizeof(*pa->pa_iova) + sizeof(*pa->pa_page),
 			      GFP_KERNEL);
 	if (unlikely(!pa->pa_iova)) {
 		pa->pa_nr = 0;
 		return -ENOMEM;
 	}
-	pa->pa_pfn = (unsigned long *)&pa->pa_iova[pa->pa_nr];
+	pa->pa_page = (struct page **)&pa->pa_iova[pa->pa_nr];
 
 	pa->pa_iova[0] = iova;
-	pa->pa_pfn[0] = -1ULL;
+	pa->pa_page[0] = NULL;
 	for (i = 1; i < pa->pa_nr; i++) {
 		pa->pa_iova[i] = pa->pa_iova[i - 1] + PAGE_SIZE;
-		pa->pa_pfn[i] = -1ULL;
+		pa->pa_page[i] = NULL;
 	}
 
 	return 0;
@@ -144,7 +144,7 @@ static int page_array_pin(struct page_array *pa, struct vfio_device *vdev)
 
 		ret = vfio_pin_pages(vdev, *first, npage,
 				     IOMMU_READ | IOMMU_WRITE,
-				     &pa->pa_pfn[pinned]);
+				     &pa->pa_page[pinned]);
 		if (ret < 0) {
 			goto err_out;
 		} else if (ret > 0 && ret != npage) {
@@ -195,7 +195,7 @@ static inline void page_array_idal_create_words(struct page_array *pa,
 	 */
 
 	for (i = 0; i < pa->pa_nr; i++)
-		idaws[i] = pa->pa_pfn[i] << PAGE_SHIFT;
+		idaws[i] = page_to_phys(pa->pa_page[i]);
 
 	/* Adjust the first IDAW, since it may not start on a page boundary */
 	idaws[0] += pa->pa_iova[0] & (PAGE_SIZE - 1);
@@ -246,8 +246,7 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 
 	l = n;
 	for (i = 0; i < pa.pa_nr; i++) {
-		struct page *page = pfn_to_page(pa.pa_pfn[i]);
-		void *from = kmap_local_page(page);
+		void *from = kmap_local_page(pa.pa_page[i]);
 
 		m = PAGE_SIZE;
 		if (i == 0) {
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index d7c38c82f694..75cd92c291e3 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -234,9 +234,9 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 	struct ap_qirq_ctrl aqic_gisa = {};
 	struct ap_queue_status status = {};
 	struct kvm_s390_gisa *gisa;
+	struct page *h_page;
 	int nisc;
 	struct kvm *kvm;
-	unsigned long h_pfn;
 	phys_addr_t h_nib;
 	dma_addr_t nib;
 	int ret;
@@ -251,7 +251,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 	}
 
 	ret = vfio_pin_pages(&q->matrix_mdev->vdev, nib, 1,
-			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
+			     IOMMU_READ | IOMMU_WRITE, &h_page);
 	switch (ret) {
 	case 1:
 		break;
@@ -267,7 +267,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 	kvm = q->matrix_mdev->kvm;
 	gisa = kvm->arch.gisa_int.origin;
 
-	h_nib = (h_pfn << PAGE_SHIFT) | (nib & ~PAGE_MASK);
+	h_nib = page_to_phys(h_page) | (nib & ~PAGE_MASK);
 	aqic_gisa.gisc = isc;
 
 	nisc = kvm_s390_gisc_register(kvm, isc);
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 606a20b605ba..8e23ca59ceed 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1941,18 +1941,18 @@ EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
  * @npage [in]   : count of pages to be pinned.  This count should not
  *		   be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
  * @prot [in]    : protection flags
- * @phys_pfn[out]: array of host PFNs
+ * @pages[out]   : array of host pages
  * Return error or number of pages pinned.
  */
 int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
-		   int npage, int prot, unsigned long *phys_pfn)
+		   int npage, int prot, struct page **pages)
 {
 	struct vfio_container *container;
 	struct vfio_group *group = device->group;
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
+	if (!pages || !npage || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -1967,7 +1967,7 @@ int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
 	if (likely(driver && driver->ops->pin_pages))
 		ret = driver->ops->pin_pages(container->iommu_data,
 					     group->iommu_group, iova,
-					     npage, prot, phys_pfn);
+					     npage, prot, pages);
 	else
 		ret = -ENOTTY;
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index e9767e13f00f..503bea6c843d 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -52,7 +52,7 @@ struct vfio_iommu_driver_ops {
 				     struct iommu_group *group,
 				     dma_addr_t user_iova,
 				     int npage, int prot,
-				     unsigned long *phys_pfn);
+				     struct page **pages);
 	void		(*unpin_pages)(void *iommu_data,
 				       dma_addr_t user_iova, int npage);
 	void		(*register_device)(void *iommu_data,
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index e629e059118c..db516c90a977 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -831,7 +831,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 				      struct iommu_group *iommu_group,
 				      dma_addr_t user_iova,
 				      int npage, int prot,
-				      unsigned long *phys_pfn)
+				      struct page **pages)
 {
 	struct vfio_iommu *iommu = iommu_data;
 	struct vfio_iommu_group *group;
@@ -841,7 +841,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	bool do_accounting;
 	dma_addr_t iova;
 
-	if (!iommu || !phys_pfn)
+	if (!iommu || !pages)
 		return -EINVAL;
 
 	/* Supported for v2 version only */
@@ -880,6 +880,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	do_accounting = list_empty(&iommu->domain_list);
 
 	for (i = 0; i < npage; i++) {
+		unsigned long phys_pfn;
 		struct vfio_pfn *vpfn;
 
 		iova = user_iova + PAGE_SIZE * i;
@@ -896,23 +897,25 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 
 		vpfn = vfio_iova_get_vfio_pfn(dma, iova);
 		if (vpfn) {
-			phys_pfn[i] = vpfn->pfn;
+			pages[i] = pfn_to_page(vpfn->pfn);
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
 
+		pages[i] = pfn_to_page(phys_pfn);
+
 		if (iommu->dirty_page_tracking) {
 			unsigned long pgshift = __ffs(iommu->pgsize_bitmap);
 
@@ -935,14 +938,14 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	goto pin_done;
 
 pin_unwind:
-	phys_pfn[i] = 0;
+	pages[i] = NULL;
 	for (j = 0; j < i; j++) {
 		dma_addr_t iova;
 
 		iova = user_iova + PAGE_SIZE * j;
 		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
 		vfio_unpin_page_external(dma, iova, do_accounting);
-		phys_pfn[j] = 0;
+		pages[j] = NULL;
 	}
 pin_done:
 	mutex_unlock(&iommu->lock);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index acefd663e63b..e05ddc6fe6a5 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -162,7 +162,7 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
 int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
-		   int npage, int prot, unsigned long *phys_pfn);
+		   int npage, int prot, struct page **pages);
 void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage);
 int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova,
 		void *data, size_t len, bool write);
-- 
2.17.1

