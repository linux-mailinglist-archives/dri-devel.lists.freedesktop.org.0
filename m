Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A848356C1A8
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E7710EEE7;
	Fri,  8 Jul 2022 22:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9DF10EEEE;
 Fri,  8 Jul 2022 22:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRMpFOzDGcfgZKtdvy8S5kRZntgVCHfqJ7K3JdJTLNl5ebnkiWlMEOstxResOwYryRZ59l6AfP6WtaPdlM8Jng7pLPk5pRs36hz2+mxbusS942tXKIVK7hV1m6qCoznMQPOGRyq1DR9ZliYl9OICTt0qd9PI4f3YCE8GKV/wRhO51loPkZOoew3JwnzoCal3rJTjlciWpYBwfboCmi3b0NBq7Ow/mAReZPiEmKUXrV3bb6F0fNSUBhwh82yJwxNUUQNYwGwEwRDSxBRmprhyc7czDfeDGPM4tc1H46rfDLbAKphKymxua8DUEQf8qNUFW2zRLzc2KNICxKuIXqermg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNhJaDERNaeZNaiarqKaIGTiwrrjSzADzEYwD4oQDmg=;
 b=EXUQJ5Zr+ClL90vmoFR+LuuDf+U+Lpf1lTvKKzteAoJyGXmG7aStQjXEl+TnwUW58HI3GON3EHeD3vew7tAaT1l63989mugzG5mU7CVX10NpB5lv7lwERd2tJ+nGZlAyR3itxtbC0dkUcPLnO/Msr04wIRIlGPAaJerXXx/DJEXB4VK5mxTikxdP8VZ1mn93UYzB5h9TL372fUWk6K+OZDipGl/V81k5dt5G1tHnjZhVo0t9MPrvPn4Vk84zlFaERcUhtaSYdmxubQhfK5XiO2PXl8ZyeznXmnsq2+Dv+aDuC869yYStdqNLth4/wtSVlqMQjPeR0GkwQrCXASw79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNhJaDERNaeZNaiarqKaIGTiwrrjSzADzEYwD4oQDmg=;
 b=tpZkv8zMAmR0QEZAr3ePuRkWaaKFU/+ti3NM3KO21MCMRancQaWSwktRouxfaI9Fwbh7mDTtb7ND3uMQNs5ZiBwn69QTfL9OkQaBDiGjMf2NGSA3eqvW9gwoI7GzGed8SY7yr+k+TmRzU1h9CFO7xRhK7O5oakYy2k9PI3kfKV5WeCq1uUaGTTF1pBBceBZHjzPUfAEBf9yCnOB3UZR0dgwPGYUodrL1gHbDJdMxLcsaEGcOfEiVnaIBWDqINidotnDrnSlB+ittHIx2WCrYFtQe53AHtuRjBJ/+iFK2p6oF/Mmhw2HqVNT//aGdKBlDZwQy4b/kkMYlxceMon8CFQ==
Received: from MWHPR11CA0020.namprd11.prod.outlook.com (2603:10b6:301:1::30)
 by MN2PR12MB4013.namprd12.prod.outlook.com (2603:10b6:208:163::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 22:44:46 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::a9) by MWHPR11CA0020.outlook.office365.com
 (2603:10b6:301:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:45 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:45 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:44 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:43 -0700
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
Subject: [PATCH v3 07/10] vfio/ccw: Change pa_pfn list to pa_iova list
Date: Fri, 8 Jul 2022 15:44:25 -0700
Message-ID: <20220708224427.1245-8-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708224427.1245-1-nicolinc@nvidia.com>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b97cf96-0b24-49fe-88b1-08da61337500
X-MS-TrafficTypeDiagnostic: MN2PR12MB4013:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDZjxRffAg4GQvXqlE7hPugkF9bjl38lyLCMwkMYrKYMnDui7F4242lb7Rv9rr+nBQ5k+11YuRPosQ+v2layCJUnaRIuqSp88DtzgHS59t7+02x28r9dsSMUJnDKfMG7yOeoXDssPChlyzRs987u6FNPVxDuK1zkcjE8vtsIlguh3NpZuUsuhOO1PsKIBtMT4Eljq8CxzbEJLArtQsb686bzv3xk0iHBQLj8LhU9fPFlGhJTH8cp8YcUFnPCrE8Jkd95OuDOcmM79wnEVjVE2iv1JgpGIRGq9YjxwAN1LIBay4CRCtLnoEKoBiDJj9sJfaLLaf9ev9eRn+JQRj4DzaM+Z8o2Yovbhax5wdr7pBexAsTp7IFvTraPh/ZCaIulpeI96gjNXQmGCNcfyoewbMvOYDD212tm9gPKjwJHwRLFeg7457irM1tMQZL7SKi9Y5ZhdLK4AbMcKcDFyUP1BsGHofMQz2gekzc9Sp2GXNCDmZPDsW4p0wN9GsgSys0m+O4Msu0dWbBSUVqxSShnlx3tHKP5ikuvNxaA8Iij2BIJpuUlvAKLnnrzJxyh5Xkcy5kH4/Dc+4zDsDzP+bsKPtDp7+xHVpHnxMFlCTm/uR4DBVlrQXMWbB6dQgd8qjMlUaY74To7V9LP6mkXPyMQkf8+s4MlDbwuYQVnRrUtyqhfFRptRfpjEG46XlxWOFaPwxFKGPuhd1hv5+nzZcBq5EYZxYnRmCDhzFj3TGj9F96gSApgY5pYP6/GU1Ord/QZspFH7ozKL7nsOSt9iR78Fko6rJnT8xKyYkeF9a/eCXFSj8USnvjsxR0gsMvXc8sj7rbouMaMc29T3rasJLaM5OJqm07S4Pjg3uKq3Dpi/HTNzWwJg88krWAJXQ9O/NMYks24nilmKBrHw+6gGzh4Cn9sHiwbWrr2reQ41+txbb4=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(70586007)(82740400003)(2616005)(47076005)(81166007)(26005)(8676002)(336012)(70206006)(186003)(1076003)(7406005)(426003)(40480700001)(36860700001)(82310400005)(4326008)(110136005)(36756003)(921005)(356005)(83380400001)(6666004)(478600001)(7696005)(40460700003)(41300700001)(7416002)(5660300002)(316002)(86362001)(54906003)(2906002)(8936002)(30864003)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:45.9135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b97cf96-0b24-49fe-88b1-08da61337500
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4013
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

The vfio_ccw_cp code maintains both iova and its PFN list because the
vfio_pin/unpin_pages API wanted pfn list. Since vfio_pin/unpin_pages()
now accept "iova", change to maintain only pa_iova list and rename all
"pfn_array" strings to "page_array", so as to simplify the code.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_cp.c | 135 ++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 71 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index a739262f988d..3854c3d573f5 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -18,11 +18,9 @@
 #include "vfio_ccw_cp.h"
 #include "vfio_ccw_private.h"
 
-struct pfn_array {
-	/* Starting guest physical I/O address. */
-	unsigned long		pa_iova;
-	/* Array that stores PFNs of the pages need to pin. */
-	unsigned long		*pa_iova_pfn;
+struct page_array {
+	/* Array that stores pages need to pin. */
+	dma_addr_t		*pa_iova;
 	/* Array that receives PFNs of the pages pinned. */
 	unsigned long		*pa_pfn;
 	/* Number of pages pinned from @pa_iova. */
@@ -37,53 +35,50 @@ struct ccwchain {
 	/* Count of the valid ccws in chain. */
 	int			ch_len;
 	/* Pinned PAGEs for the original data. */
-	struct pfn_array	*ch_pa;
+	struct page_array	*ch_pa;
 };
 
 /*
- * pfn_array_alloc() - alloc memory for PFNs
- * @pa: pfn_array on which to perform the operation
+ * page_array_alloc() - alloc memory for page array
+ * @pa: page_array on which to perform the operation
  * @iova: target guest physical address
  * @len: number of bytes that should be pinned from @iova
  *
- * Attempt to allocate memory for PFNs.
+ * Attempt to allocate memory for page array.
  *
- * Usage of pfn_array:
- * We expect (pa_nr == 0) and (pa_iova_pfn == NULL), any field in
+ * Usage of page_array:
+ * We expect (pa_nr == 0) and (pa_iova == NULL), any field in
  * this structure will be filled in by this function.
  *
  * Returns:
- *         0 if PFNs are allocated
- *   -EINVAL if pa->pa_nr is not initially zero, or pa->pa_iova_pfn is not NULL
+ *         0 if page array is allocated
+ *   -EINVAL if pa->pa_nr is not initially zero, or pa->pa_iova is not NULL
  *   -ENOMEM if alloc failed
  */
-static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
+static int page_array_alloc(struct page_array *pa, u64 iova, unsigned int len)
 {
 	int i;
 
-	if (pa->pa_nr || pa->pa_iova_pfn)
+	if (pa->pa_nr || pa->pa_iova)
 		return -EINVAL;
 
-	pa->pa_iova = iova;
-
 	pa->pa_nr = ((iova & ~PAGE_MASK) + len + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
 	if (!pa->pa_nr)
 		return -EINVAL;
 
-	pa->pa_iova_pfn = kcalloc(pa->pa_nr,
-				  sizeof(*pa->pa_iova_pfn) +
-				  sizeof(*pa->pa_pfn),
-				  GFP_KERNEL);
-	if (unlikely(!pa->pa_iova_pfn)) {
+	pa->pa_iova = kcalloc(pa->pa_nr,
+			      sizeof(*pa->pa_iova) + sizeof(*pa->pa_pfn),
+			      GFP_KERNEL);
+	if (unlikely(!pa->pa_iova)) {
 		pa->pa_nr = 0;
 		return -ENOMEM;
 	}
-	pa->pa_pfn = pa->pa_iova_pfn + pa->pa_nr;
+	pa->pa_pfn = (unsigned long *)&pa->pa_iova[pa->pa_nr];
 
-	pa->pa_iova_pfn[0] = pa->pa_iova >> PAGE_SHIFT;
+	pa->pa_iova[0] = iova;
 	pa->pa_pfn[0] = -1ULL;
 	for (i = 1; i < pa->pa_nr; i++) {
-		pa->pa_iova_pfn[i] = pa->pa_iova_pfn[i - 1] + 1;
+		pa->pa_iova[i] = pa->pa_iova[i - 1] + PAGE_SIZE;
 		pa->pa_pfn[i] = -1ULL;
 	}
 
@@ -91,30 +86,30 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
 }
 
 /*
- * pfn_array_unpin() - Unpin user pages in memory
- * @pa: pfn_array on which to perform the operation
+ * page_array_unpin() - Unpin user pages in memory
+ * @pa: page_array on which to perform the operation
  * @vdev: the vfio device to perform the operation
  * @pa_nr: number of user pages to unpin
  *
  * Only unpin if any pages were pinned to begin with, i.e. pa_nr > 0,
  * otherwise only clear pa->pa_nr
  */
-static void pfn_array_unpin(struct pfn_array *pa,
-			    struct vfio_device *vdev, int pa_nr)
+static void page_array_unpin(struct page_array *pa,
+			     struct vfio_device *vdev, int pa_nr)
 {
 	int unpinned = 0, npage = 1;
 
 	while (unpinned < pa_nr) {
-		unsigned long *first = &pa->pa_iova_pfn[unpinned];
-		unsigned long *last = &first[npage];
+		dma_addr_t *first = &pa->pa_iova[unpinned];
+		dma_addr_t *last = &first[npage];
 
 		if (unpinned + npage < pa_nr &&
-		    *first + npage == *last) {
+		    *first + npage * PAGE_SIZE == *last) {
 			npage++;
 			continue;
 		}
 
-		vfio_unpin_pages(vdev, *first << PAGE_SHIFT, npage);
+		vfio_unpin_pages(vdev, *first, npage);
 		unpinned += npage;
 		npage = 1;
 	}
@@ -123,30 +118,30 @@ static void pfn_array_unpin(struct pfn_array *pa,
 }
 
 /*
- * pfn_array_pin() - Pin user pages in memory
- * @pa: pfn_array on which to perform the operation
+ * page_array_pin() - Pin user pages in memory
+ * @pa: page_array on which to perform the operation
  * @mdev: the mediated device to perform pin operations
  *
  * Returns number of pages pinned upon success.
  * If the pin request partially succeeds, or fails completely,
  * all pages are left unpinned and a negative error value is returned.
  */
-static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
+static int page_array_pin(struct page_array *pa, struct vfio_device *vdev)
 {
 	int pinned = 0, npage = 1;
 	int ret = 0;
 
 	while (pinned < pa->pa_nr) {
-		unsigned long *first = &pa->pa_iova_pfn[pinned];
-		unsigned long *last = &first[npage];
+		dma_addr_t *first = &pa->pa_iova[pinned];
+		dma_addr_t *last = &first[npage];
 
 		if (pinned + npage < pa->pa_nr &&
-		    *first + npage == *last) {
+		    *first + npage * PAGE_SIZE == *last) {
 			npage++;
 			continue;
 		}
 
-		ret = vfio_pin_pages(vdev, *first << PAGE_SHIFT, npage,
+		ret = vfio_pin_pages(vdev, *first, npage,
 				     IOMMU_READ | IOMMU_WRITE,
 				     &pa->pa_pfn[pinned]);
 		if (ret < 0) {
@@ -163,32 +158,30 @@ static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
 	return ret;
 
 err_out:
-	pfn_array_unpin(pa, vdev, pinned);
+	page_array_unpin(pa, vdev, pinned);
 	return ret;
 }
 
 /* Unpin the pages before releasing the memory. */
-static void pfn_array_unpin_free(struct pfn_array *pa, struct vfio_device *vdev)
+static void page_array_unpin_free(struct page_array *pa, struct vfio_device *vdev)
 {
-	pfn_array_unpin(pa, vdev, pa->pa_nr);
-	kfree(pa->pa_iova_pfn);
+	page_array_unpin(pa, vdev, pa->pa_nr);
+	kfree(pa->pa_iova);
 }
 
-static bool pfn_array_iova_pinned(struct pfn_array *pa, unsigned long iova)
+static bool page_array_iova_pinned(struct page_array *pa, unsigned long iova)
 {
-	unsigned long iova_pfn = iova >> PAGE_SHIFT;
 	int i;
 
 	for (i = 0; i < pa->pa_nr; i++)
-		if (pa->pa_iova_pfn[i] == iova_pfn)
+		if (pa->pa_iova[i] == iova)
 			return true;
 
 	return false;
 }
-/* Create the list of IDAL words for a pfn_array. */
-static inline void pfn_array_idal_create_words(
-	struct pfn_array *pa,
-	unsigned long *idaws)
+/* Create the list of IDAL words for a page_array. */
+static inline void page_array_idal_create_words(struct page_array *pa,
+						unsigned long *idaws)
 {
 	int i;
 
@@ -204,7 +197,7 @@ static inline void pfn_array_idal_create_words(
 		idaws[i] = pa->pa_pfn[i] << PAGE_SHIFT;
 
 	/* Adjust the first IDAW, since it may not start on a page boundary */
-	idaws[0] += pa->pa_iova & (PAGE_SIZE - 1);
+	idaws[0] += pa->pa_iova[0] & (PAGE_SIZE - 1);
 }
 
 static void convert_ccw0_to_ccw1(struct ccw1 *source, unsigned long len)
@@ -236,18 +229,18 @@ static void convert_ccw0_to_ccw1(struct ccw1 *source, unsigned long len)
 static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 			   unsigned long n)
 {
-	struct pfn_array pa = {0};
+	struct page_array pa = {0};
 	u64 from;
 	int i, ret;
 	unsigned long l, m;
 
-	ret = pfn_array_alloc(&pa, iova, n);
+	ret = page_array_alloc(&pa, iova, n);
 	if (ret < 0)
 		return ret;
 
-	ret = pfn_array_pin(&pa, vdev);
+	ret = page_array_pin(&pa, vdev);
 	if (ret < 0) {
-		pfn_array_unpin_free(&pa, vdev);
+		page_array_unpin_free(&pa, vdev);
 		return ret;
 	}
 
@@ -268,7 +261,7 @@ static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 			break;
 	}
 
-	pfn_array_unpin_free(&pa, vdev);
+	page_array_unpin_free(&pa, vdev);
 
 	return l;
 }
@@ -371,7 +364,7 @@ static struct ccwchain *ccwchain_alloc(struct channel_program *cp, int len)
 	chain->ch_ccw = (struct ccw1 *)data;
 
 	data = (u8 *)(chain->ch_ccw) + sizeof(*chain->ch_ccw) * len;
-	chain->ch_pa = (struct pfn_array *)data;
+	chain->ch_pa = (struct page_array *)data;
 
 	chain->ch_len = len;
 
@@ -555,7 +548,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	struct vfio_device *vdev =
 		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	struct ccw1 *ccw;
-	struct pfn_array *pa;
+	struct page_array *pa;
 	u64 iova;
 	unsigned long *idaws;
 	int ret;
@@ -589,13 +582,13 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	}
 
 	/*
-	 * Allocate an array of pfn's for pages to pin/translate.
+	 * Allocate an array of pages to pin/translate.
 	 * The number of pages is actually the count of the idaws
 	 * required for the data transfer, since we only only support
 	 * 4K IDAWs today.
 	 */
 	pa = chain->ch_pa + idx;
-	ret = pfn_array_alloc(pa, iova, bytes);
+	ret = page_array_alloc(pa, iova, bytes);
 	if (ret < 0)
 		goto out_free_idaws;
 
@@ -606,21 +599,21 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 			goto out_unpin;
 
 		/*
-		 * Copy guest IDAWs into pfn_array, in case the memory they
+		 * Copy guest IDAWs into page_array, in case the memory they
 		 * occupy is not contiguous.
 		 */
 		for (i = 0; i < idaw_nr; i++)
-			pa->pa_iova_pfn[i] = idaws[i] >> PAGE_SHIFT;
+			pa->pa_iova[i] = idaws[i];
 	} else {
 		/*
-		 * No action is required here; the iova addresses in pfn_array
-		 * were initialized sequentially in pfn_array_alloc() beginning
+		 * No action is required here; the iova addresses in page_array
+		 * were initialized sequentially in page_array_alloc() beginning
 		 * with the contents of ccw->cda.
 		 */
 	}
 
 	if (ccw_does_data_transfer(ccw)) {
-		ret = pfn_array_pin(pa, vdev);
+		ret = page_array_pin(pa, vdev);
 		if (ret < 0)
 			goto out_unpin;
 	} else {
@@ -630,13 +623,13 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	ccw->cda = (__u32) virt_to_phys(idaws);
 	ccw->flags |= CCW_FLAG_IDA;
 
-	/* Populate the IDAL with pinned/translated addresses from pfn */
-	pfn_array_idal_create_words(pa, idaws);
+	/* Populate the IDAL with pinned/translated addresses from page */
+	page_array_idal_create_words(pa, idaws);
 
 	return 0;
 
 out_unpin:
-	pfn_array_unpin_free(pa, vdev);
+	page_array_unpin_free(pa, vdev);
 out_free_idaws:
 	kfree(idaws);
 out_init:
@@ -742,7 +735,7 @@ void cp_free(struct channel_program *cp)
 	cp->initialized = false;
 	list_for_each_entry_safe(chain, temp, &cp->ccwchain_list, next) {
 		for (i = 0; i < chain->ch_len; i++) {
-			pfn_array_unpin_free(chain->ch_pa + i, vdev);
+			page_array_unpin_free(chain->ch_pa + i, vdev);
 			ccwchain_cda_free(chain, i);
 		}
 		ccwchain_free(chain);
@@ -918,7 +911,7 @@ bool cp_iova_pinned(struct channel_program *cp, u64 iova)
 
 	list_for_each_entry(chain, &cp->ccwchain_list, next) {
 		for (i = 0; i < chain->ch_len; i++)
-			if (pfn_array_iova_pinned(chain->ch_pa + i, iova))
+			if (page_array_iova_pinned(chain->ch_pa + i, iova))
 				return true;
 	}
 
-- 
2.17.1

