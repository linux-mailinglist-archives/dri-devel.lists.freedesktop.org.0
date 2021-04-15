Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2239535FF63
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06846E998;
	Thu, 15 Apr 2021 01:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1E16E99F;
 Thu, 15 Apr 2021 01:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik9NO3GJQXtJH6JtaZ+MeSPIZpQjPv++C5kzVW0N4tCaBbnOuMzB4PdHvtQikDi7juL1alOWr4edLvz39xT2+r6Pj+vubAyZajqebFRR0QZq9wFIgPrh0d06biN0TGpa5NXjdJMO482mCuu+LpdvDsnwx0V9o1LkonNDpwXXkLbgVNGUQnOQfPjX3kGWgbFRdeek2vUDhRrLDy75jnEL9+vVD8guK0Xt7uTOEfI+wqtAoySsHtV4+4Msk4PSKvdWmlyZZPw3Q/u9SXBf+OmtAaBlpTH4m+pDPrgem/WEL5Km+5Z9ghz7N8HnB/ia+FrvUGfUXyzWPk4n7mxV7tmn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaMb69XNV84xTHS8rui8J2lZBFZRtRundmlMWvOMrKI=;
 b=daij2FhT4sberL7E/RHOuuIm/nLHt7W9pSNPMnXYPC2VE1UoT6Kt5uhtmCstwJgTr3UnorguUa7nhfA2o50FutfXTzV5e1vJ/dFl/BUFErnY4zrBSR+vYOoTWym1lgyXjuFctw/0/Co+mB6z0c7Zj/G9mV/tdp7q0mFidCcGL71RjOfvb+wtbONdyiWVWGsmAX09ST3IszAffjJERQ0U85Zxr5n0IeZvbGgic5Tp/NoypKUeYyIZaysmKkbpZPa/zhTipNKUMSEq35tPO1eATVw2caKQA295dMnV4NwDyDzBzU1A58hdBrGaNqeVo3iXOVmA71lohJxGtJEP8gMz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaMb69XNV84xTHS8rui8J2lZBFZRtRundmlMWvOMrKI=;
 b=m5D6qgs2S8T+oQ+6bR/rqRXn/bldgHOsYlas3IwQZiP7LezWS+u4OcdpxTWr2NS+pBQhWIcZBfdu8fbboCRTh6L8OvNSmtSt/jttouAL1lZbKk5y5EVxizdyWTxNJeo41ps8FcI+/OErdz80PtJz5Z1BtmeB7CXj8BVLmiFyIZs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:05 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:05 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 20/34] drm/amdkfd: HMM migrate vram to ram
Date: Wed, 14 Apr 2021 21:23:23 -0400
Message-Id: <20210415012337.1755-21-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10bc0399-3b3c-4f6b-1c30-08d8ffad280f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4208CAD366195BAB5DB05A8D924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cxpCaQE2ambtGjTfgCrKhcGZk484xR1+1dkkEVuDOWQcyeTEAdFxwsR5OJ5u0sx4je57G4YZ4OSah7Oqbd06QpA4ZKK2ap3bkfxs9GkfTvDuhthSZPlgX+7IIRJvpy2h1mK3s6fTg9ZiipQtytfOKQNrToc+e7ldxW2N7GdeyZGK+i7rhI4N6Lof9REAwTupySqc0J6HbSh+nE5K1vdLCkC1XdmZIdkZ8drethZqmLYwDG/XYrF/6wvYgSpGEBQzNpAJjh8sRJoWmVomnboInzXL5B6lrLzWnhrGNXeA0XQe0NQ3rGBxI29/SkNFiNLWxwM45n2kz9ZK45E4Xm2fAAkYpKnQXfFGmU+AYANEu/b+738XHOxO0RjIKGsXx785V5Z94EHoYo3b8imBJcWkM+sfMeQpevNO8E+bR4RCw4J5HNwTVcR5sBuzVJRbE7W37nC6bMg3XynUB9q3hM1s73XMzPq0s7tfwq1cViwulicoyYmDqzinSQSEqXgXLtWXb/Bi5hr2nueTeG4GbO1e+JwJloyIgcioeDSLxIAWcuayXl65aFAk20MOSmsJoABkR+BTwEh20XNqQDyxkaBkX/xdDDWwv5dpZlsHtzsnsAT8s0dbYwU/gBCzC7Z6dupvjUAWk3h9oyuDUzErrO11Pz3wWGnv/3nlEPRgdPdx6wU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(30864003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4cp6ry69HIpRM2o85zaUn+GeYghlArJdFrX4vj12C5YvXYaZKOTVPXHH10cC?=
 =?us-ascii?Q?QMzgChK0Wsjl7+Dj0fMooXzABV2rQ8cZhzOiQms8FovAdFoB2LtwvGEyY0C/?=
 =?us-ascii?Q?o5iCmHN8PmFoJ+kGHHBaGvdCw1bYntHg8Q8b+1Meu1a9CLFnfi4nBS5ldVQJ?=
 =?us-ascii?Q?2BlSlwPyZBZiNlNnTrBux/vR3OShL0lGQ5dVH8cbiAEkU1mD43SqWYpPPnL1?=
 =?us-ascii?Q?1lRTjPDqRCS87gMhPbBeHMGmehTgVYhybzAd092eTKagcp990esl21gBicrJ?=
 =?us-ascii?Q?G6IG27+ml2WUrRxeHV5OPK6XdpDCETpiG/bEchNJPltzVrD28YUmnIWF7btN?=
 =?us-ascii?Q?nzp+NQA/uRlxB3GuZg7li6A89ajEVketFcHC7qY/NUYx9ihXDTGWzXj2eL+v?=
 =?us-ascii?Q?5hJGqhOBOxaLhLPUSlT43zCrwrOFQ5FBoZ+srWZ56l6zxFa8WBVXMyCscBXe?=
 =?us-ascii?Q?fHR+OeQ2UqAmpgQ4gZn6thSYd9Ty4Xp2JF9BGhyBsnVjIBfbuFJBhiYc3REl?=
 =?us-ascii?Q?Pc+LjenK77Z0CZg3bG+QfKMqIITnva6t2tU+L/9mw7gGsJEDlCkBAhg5wY+N?=
 =?us-ascii?Q?r9wc6k8lORhgUmGMwTb2w1RXB+n7KHf/VXo2Hmbb4Ve/w6OcM2fXunIweQ6T?=
 =?us-ascii?Q?vHwBFM7L4pvWQ0OF0B5LsmmUuVgz5In/XyaiTqk3NcUi1qgga5okkc1l9gtz?=
 =?us-ascii?Q?eLiZYhzKCHmX8MGTMtaQbigtKuxeBodmnrO0VYEWBzPaBIMHJKfaZ2q0fkGc?=
 =?us-ascii?Q?Deup2rK+L/+GeLUNIIKHxzNVy0EKNxMpx1ibFpvLnt2aDVZ5JXVhCUmhmxjP?=
 =?us-ascii?Q?CtUYMiK12ZWFBXVdvTgnYiEyQ9cT9V+a9Fe8XksVsLGgiqZLLS6IV7wF54Z6?=
 =?us-ascii?Q?6DqBSTCCy1HPljXFnHM11SgjyJYLR4YhXM/XR3efPE4vIgZDth/zSni/zfmm?=
 =?us-ascii?Q?bxOB7fCy9JC+TMbtltob7j4+bgU4AzNCqL9MMiSLyDE7qe8Nndh3d7E2gSCo?=
 =?us-ascii?Q?Y73lVLeN26WgpShDnsOPsDAq0jlmQp3yqzb8miofKupVCBdTLtakIir55LjC?=
 =?us-ascii?Q?0p3dHMeXcSX60GOhnEmtv1cQJiI6D5KsnQYaiQQv8jdUEwTvONlKV9T2IYMn?=
 =?us-ascii?Q?OMv89ov+dJavcJKlTS6ONdbadjwNEtdJ5n0MDBMed249yKNUAgWdHl0U8TBg?=
 =?us-ascii?Q?Raldx+YlWc/j5eFJQaGg7MDO4pVznrdH8HUnpZkRIOCYvmahVxQ1Yf9N0kyz?=
 =?us-ascii?Q?KaxWoa1sKs7yyq+X/hInszL77SHbncUZ/DQ6nnHh+QN/3WlfZz/Q92mmdxdS?=
 =?us-ascii?Q?CLAdCtNCxFERBdnT3JiaYq44?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bc0399-3b3c-4f6b-1c30-08d8ffad280f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:04.1370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/+oyf4Ob39qWiQnsGGC+/RUXvO9Sa7R00meJoBQEdS02dd1zPQDoYkN+Tje2jGzqLXNh2iuVAVdhFqmVQ9VNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If CPU page fault happens, HMM pgmap_ops callback migrate_to_ram start
migrate memory from vram to ram in steps:

1. migrate_vma_pages get vram pages, and notify HMM to invalidate the
pages, HMM interval notifier callback evict process queues
2. Allocate system memory pages
3. Use svm copy memory to migrate data from vram to ram
4. migrate_vma_pages copy pages structure from vram pages to ram pages
5. Return VM_FAULT_SIGBUS if migration failed, to notify application
6. migrate_vma_finalize put vram pages, page_free callback free vram
pages and vram nodes
7. Restore work wait for migration is finished, then update GPU page
table mapping to system memory, and resume process queues

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 302 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 127 +++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  10 +
 4 files changed, 429 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 745f69fca7ef..c47a673ef24e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -191,7 +191,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
  * 0		- success
  * otherwise	- error code from dma fence signal
  */
-int
+static int
 svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 {
 	int r = 0;
@@ -260,6 +260,35 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
 	put_page(page);
 }
 
+static unsigned long
+svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
+{
+	unsigned long addr;
+
+	addr = page_to_pfn(page) << PAGE_SHIFT;
+	return (addr - adev->kfd.dev->pgmap.range.start);
+}
+
+static struct page *
+svm_migrate_get_sys_page(struct vm_area_struct *vma, unsigned long addr)
+{
+	struct page *page;
+
+	page = alloc_page_vma(GFP_HIGHUSER, vma, addr);
+	if (page)
+		lock_page(page);
+
+	return page;
+}
+
+void svm_migrate_put_sys_page(unsigned long addr)
+{
+	struct page *page;
+
+	page = pfn_to_page(addr >> PAGE_SHIFT);
+	unlock_page(page);
+	put_page(page);
+}
 
 static int
 svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
@@ -512,13 +541,213 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
 
 static void svm_migrate_page_free(struct page *page)
 {
+	/* Keep this function to avoid warning */
+}
+
+static int
+svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
+			struct migrate_vma *migrate, struct dma_fence **mfence,
+			dma_addr_t *scratch)
+{
+	uint64_t npages = migrate->cpages;
+	struct device *dev = adev->dev;
+	uint64_t *src;
+	dma_addr_t *dst;
+	struct page *dpage;
+	uint64_t i = 0, j;
+	uint64_t addr;
+	int r = 0;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
+		 prange->last);
+
+	addr = prange->start << PAGE_SHIFT;
+
+	src = (uint64_t *)(scratch + npages);
+	dst = scratch;
+
+	for (i = 0, j = 0; i < npages; i++, j++, addr += PAGE_SIZE) {
+		struct page *spage;
+
+		spage = migrate_pfn_to_page(migrate->src[i]);
+		if (!spage) {
+			pr_debug("failed get spage svms 0x%p [0x%lx 0x%lx]\n",
+				 prange->svms, prange->start, prange->last);
+			r = -ENOMEM;
+			goto out_oom;
+		}
+		src[i] = svm_migrate_addr(adev, spage);
+		if (i > 0 && src[i] != src[i - 1] + PAGE_SIZE) {
+			r = svm_migrate_copy_memory_gart(adev, dst + i - j,
+							 src + i - j, j,
+							 FROM_VRAM_TO_RAM,
+							 mfence);
+			if (r)
+				goto out_oom;
+			j = 0;
+		}
+
+		dpage = svm_migrate_get_sys_page(migrate->vma, addr);
+		if (!dpage) {
+			pr_debug("failed get page svms 0x%p [0x%lx 0x%lx]\n",
+				 prange->svms, prange->start, prange->last);
+			r = -ENOMEM;
+			goto out_oom;
+		}
+
+		dst[i] = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_FROM_DEVICE);
+		r = dma_mapping_error(dev, dst[i]);
+		if (r) {
+			pr_debug("failed %d dma_map_page\n", r);
+			goto out_oom;
+		}
+
+		pr_debug("dma mapping dst to 0x%llx, page_to_pfn 0x%lx\n",
+			      dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
+
+		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
+		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
+	}
+
+	r = svm_migrate_copy_memory_gart(adev, dst + i - j, src + i - j, j,
+					 FROM_VRAM_TO_RAM, mfence);
+
+out_oom:
+	if (r) {
+		pr_debug("failed %d copy to ram\n", r);
+		while (i--) {
+			svm_migrate_put_sys_page(dst[i]);
+			migrate->dst[i] = 0;
+		}
+	}
+
+	return r;
+}
+
+static int
+svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
+		       struct vm_area_struct *vma, uint64_t start, uint64_t end)
+{
+	uint64_t npages = (end - start) >> PAGE_SHIFT;
+	struct dma_fence *mfence = NULL;
+	struct migrate_vma migrate;
+	dma_addr_t *scratch;
+	size_t size;
+	void *buf;
+	int r = -ENOMEM;
+
+	memset(&migrate, 0, sizeof(migrate));
+	migrate.vma = vma;
+	migrate.start = start;
+	migrate.end = end;
+	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	migrate.pgmap_owner = adev;
+
+	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
+	size *= npages;
+	buf = kvmalloc(size, GFP_KERNEL | __GFP_ZERO);
+	if (!buf)
+		goto out;
+
+	migrate.src = buf;
+	migrate.dst = migrate.src + npages;
+	scratch = (dma_addr_t *)(migrate.dst + npages);
+
+	r = migrate_vma_setup(&migrate);
+	if (r) {
+		pr_debug("failed %d prepare migrate svms 0x%p [0x%lx 0x%lx]\n",
+			 r, prange->svms, prange->start, prange->last);
+		goto out_free;
+	}
+
+	pr_debug("cpages %ld\n", migrate.cpages);
+
+	if (migrate.cpages) {
+		svm_migrate_copy_to_ram(adev, prange, &migrate, &mfence,
+					scratch);
+		migrate_vma_pages(&migrate);
+		svm_migrate_copy_done(adev, mfence);
+		migrate_vma_finalize(&migrate);
+	} else {
+		pr_debug("failed collect migrate device pages [0x%lx 0x%lx]\n",
+			 prange->start, prange->last);
+	}
+
+	svm_range_dma_unmap(adev->dev, scratch, 0, npages);
+
+out_free:
+	kvfree(buf);
+out:
+	return r;
+}
+
+/**
+ * svm_migrate_vram_to_ram - migrate svm range from device to system
+ * @prange: range structure
+ * @mm: process mm, use current->mm if NULL
+ *
+ * Context: Process context, caller hold mmap read lock, svms lock, prange lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm)
+{
+	struct amdgpu_device *adev;
+	struct vm_area_struct *vma;
+	unsigned long addr;
+	unsigned long start;
+	unsigned long end;
+	int r = 0;
+
+	if (!prange->actual_loc) {
+		pr_debug("[0x%lx 0x%lx] already migrated to ram\n",
+			 prange->start, prange->last);
+		return 0;
+	}
+
+	adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
+	if (!adev) {
+		pr_debug("failed to get device by id 0x%x\n",
+			 prange->actual_loc);
+		return -ENODEV;
+	}
+
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] from gpu 0x%x to ram\n",
+		 prange->svms, prange, prange->start, prange->last,
+		 prange->actual_loc);
+
+	start = prange->start << PAGE_SHIFT;
+	end = (prange->last + 1) << PAGE_SHIFT;
+
+	for (addr = start; addr < end;) {
+		unsigned long next;
+
+		vma = find_vma(mm, addr);
+		if (!vma || addr < vma->vm_start)
+			break;
+
+		next = min(vma->vm_end, end);
+		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next);
+		if (r) {
+			pr_debug("failed %d to migrate\n", r);
+			break;
+		}
+		addr = next;
+	}
+
+	if (!r) {
+		svm_range_vram_node_free(prange);
+		prange->actual_loc = 0;
+	}
+	return r;
 }
 
 /**
  * svm_migrate_to_ram - CPU page fault handler
  * @vmf: CPU vm fault vma, address
  *
- * Context: vm fault handler, mm->mmap_sem is taken
+ * Context: vm fault handler, caller holds the mmap read lock
  *
  * Return:
  * 0 - OK
@@ -526,7 +755,74 @@ static void svm_migrate_page_free(struct page *page)
  */
 static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 {
-	return VM_FAULT_SIGBUS;
+	unsigned long addr = vmf->address;
+	struct vm_area_struct *vma;
+	enum svm_work_list_ops op;
+	struct svm_range *parent;
+	struct svm_range *prange;
+	struct kfd_process *p;
+	struct mm_struct *mm;
+	int r = 0;
+
+	vma = vmf->vma;
+	mm = vma->vm_mm;
+
+	p = kfd_lookup_process_by_mm(vma->vm_mm);
+	if (!p) {
+		pr_debug("failed find process at fault address 0x%lx\n", addr);
+		return VM_FAULT_SIGBUS;
+	}
+	addr >>= PAGE_SHIFT;
+	pr_debug("CPU page fault svms 0x%p address 0x%lx\n", &p->svms, addr);
+
+	mutex_lock(&p->svms.lock);
+
+	prange = svm_range_from_addr(&p->svms, addr, &parent);
+	if (!prange) {
+		pr_debug("cannot find svm range at 0x%lx\n", addr);
+		r = -EFAULT;
+		goto out;
+	}
+
+	mutex_lock(&parent->migrate_mutex);
+	if (prange != parent)
+		mutex_lock_nested(&prange->migrate_mutex, 1);
+
+	if (!prange->actual_loc)
+		goto out_unlock_prange;
+
+	svm_range_lock(parent);
+	if (prange != parent)
+		mutex_lock_nested(&prange->lock, 1);
+	r = svm_range_split_by_granularity(p, mm, addr, parent, prange);
+	if (prange != parent)
+		mutex_unlock(&prange->lock);
+	svm_range_unlock(parent);
+	if (r) {
+		pr_debug("failed %d to split range by granularity\n", r);
+		goto out_unlock_prange;
+	}
+
+	r = svm_migrate_vram_to_ram(prange, mm);
+	if (r)
+		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
+			 prange, prange->start, prange->last);
+
+	op = SVM_OP_UPDATE_RANGE_NOTIFIER;
+	svm_range_add_list_work(&p->svms, parent, mm, op);
+	schedule_deferred_list_work(&p->svms);
+
+out_unlock_prange:
+	if (prange != parent)
+		mutex_unlock(&prange->migrate_mutex);
+	mutex_unlock(&parent->migrate_mutex);
+out:
+	mutex_unlock(&p->svms.lock);
+	kfd_unref_process(p);
+
+	pr_debug("CPU fault svms 0x%p address 0x%lx done\n", &p->svms, addr);
+
+	return r ? VM_FAULT_SIGBUS : 0;
 }
 
 static const struct dev_pagemap_ops svm_migrate_pgmap_ops = {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index d9cee0f6285a..082b9bb22270 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -39,6 +39,9 @@ enum MIGRATION_COPY_DIR {
 };
 
 int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc);
+int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
+unsigned long
+svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
 
 #if defined(CONFIG_DEVICE_PRIVATE)
 int svm_migrate_init(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index cfcfef0ff109..5211e7dcf0f8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -861,6 +861,60 @@ svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
 	list_add_tail(&pchild->child_list, &prange->child_list);
 }
 
+/**
+ * svm_range_split_by_granularity - collect ranges within granularity boundary
+ *
+ * @p: the process with svms list
+ * @mm: mm structure
+ * @addr: the vm fault address in pages, to split the prange
+ * @parent: parent range if prange is from child list
+ * @prange: prange to split
+ *
+ * Trims @prange to be a single aligned block of prange->granularity if
+ * possible. The head and tail are added to the child_list in @parent.
+ *
+ * Context: caller must hold mmap_read_lock and prange->lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+int
+svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
+			       unsigned long addr, struct svm_range *parent,
+			       struct svm_range *prange)
+{
+	struct svm_range *head, *tail;
+	unsigned long start, last, size;
+	int r;
+
+	/* Align splited range start and size to granularity size, then a single
+	 * PTE will be used for whole range, this reduces the number of PTE
+	 * updated and the L1 TLB space used for translation.
+	 */
+	size = 1UL << prange->granularity;
+	start = ALIGN_DOWN(addr, size);
+	last = ALIGN(addr + 1, size) - 1;
+
+	pr_debug("svms 0x%p split [0x%lx 0x%lx] to [0x%lx 0x%lx] size 0x%lx\n",
+		 prange->svms, prange->start, prange->last, start, last, size);
+
+	if (start > prange->start) {
+		r = svm_range_split(prange, start, prange->last, &head);
+		if (r)
+			return r;
+		svm_range_add_child(parent, mm, head, SVM_OP_ADD_RANGE);
+	}
+
+	if (last < prange->last) {
+		r = svm_range_split(prange, prange->start, last, &tail);
+		if (r)
+			return r;
+		svm_range_add_child(parent, mm, tail, SVM_OP_ADD_RANGE);
+	}
+
+	return 0;
+}
+
 static uint64_t
 svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 {
@@ -1685,7 +1739,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 	pr_debug("exit svms 0x%p\n", svms);
 }
 
-static void
+void
 svm_range_add_list_work(struct svm_range_list *svms, struct svm_range *prange,
 			struct mm_struct *mm, enum svm_work_list_ops op)
 {
@@ -1708,7 +1762,7 @@ svm_range_add_list_work(struct svm_range_list *svms, struct svm_range *prange,
 	spin_unlock(&svms->deferred_list_lock);
 }
 
-static void schedule_deferred_list_work(struct svm_range_list *svms)
+void schedule_deferred_list_work(struct svm_range_list *svms)
 {
 	spin_lock(&svms->deferred_list_lock);
 	if (!list_empty(&svms->deferred_range_list))
@@ -1798,12 +1852,19 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 /**
  * svm_range_cpu_invalidate_pagetables - interval notifier callback
  *
- * MMU range unmap notifier to remove svm ranges
+ * If event is MMU_NOTIFY_UNMAP, this is from CPU unmap range, otherwise, it
+ * is from migration, or CPU page invalidation callback.
+ *
+ * For unmap event, unmap range from GPUs, remove prange from svms in a delayed
+ * work thread, and split prange if only part of prange is unmapped.
+ *
+ * For invalidation event, if GPU retry fault is not enabled, evict the queues,
+ * then schedule svm_range_restore_work to update GPU mapping and resume queues.
+ * If GPU retry fault is enabled, unmap the svm range from GPU, retry fault will
+ * update GPU mapping to recover.
  *
- * If GPU vm fault retry is not enabled, evict the svm range, then restore
- * work will update GPU mapping.
- * If GPU vm fault retry is enabled, unmap the svm range from GPU, vm fault
- * will update GPU mapping.
+ * Context: mmap lock, notifier_invalidate_start lock are held
+ *          for invalidate event, prange lock is held if this is from migration
  */
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
@@ -1846,6 +1907,49 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 	return true;
 }
 
+/**
+ * svm_range_from_addr - find svm range from fault address
+ * @svms: svm range list header
+ * @addr: address to search range interval tree, in pages
+ * @parent: parent range if range is on child list
+ *
+ * Context: The caller must hold svms->lock
+ *
+ * Return: the svm_range found or NULL
+ */
+struct svm_range *
+svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
+		    struct svm_range **parent)
+{
+	struct interval_tree_node *node;
+	struct svm_range *prange;
+	struct svm_range *pchild;
+
+	node = interval_tree_iter_first(&svms->objects, addr, addr);
+	if (!node)
+		return NULL;
+
+	prange = container_of(node, struct svm_range, it_node);
+	pr_debug("address 0x%lx prange [0x%lx 0x%lx] node [0x%lx 0x%lx]\n",
+		 addr, prange->start, prange->last, node->start, node->last);
+
+	if (addr >= prange->start && addr <= prange->last) {
+		if (parent)
+			*parent = prange;
+		return prange;
+	}
+	list_for_each_entry(pchild, &prange->child_list, child_list)
+		if (addr >= pchild->start && addr <= pchild->last) {
+			pr_debug("found address 0x%lx pchild [0x%lx 0x%lx]\n",
+				 addr, pchild->start, pchild->last);
+			if (parent)
+				*parent = prange;
+			return pchild;
+		}
+
+	return NULL;
+}
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	struct svm_range *prange;
@@ -2108,11 +2212,14 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	if (best_loc) {
 		pr_debug("migrate from ram to vram\n");
 		r = svm_migrate_ram_to_vram(prange, best_loc);
-
-		if (!r)
-			*migrated = true;
+	} else {
+		pr_debug("migrate from vram to ram\n");
+		r = svm_migrate_vram_to_ram(prange, current->mm);
 	}
 
+	if (!r)
+		*migrated = true;
+
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 34214a44b099..37cfa1689c4f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -142,11 +142,21 @@ void svm_range_list_fini(struct kfd_process *p);
 int svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	      uint64_t size, uint32_t nattrs,
 	      struct kfd_ioctl_svm_attribute *attrs);
+struct svm_range *svm_range_from_addr(struct svm_range_list *svms,
+				      unsigned long addr,
+				      struct svm_range **parent);
 struct amdgpu_device *svm_range_get_adev_by_id(struct svm_range *prange,
 					       uint32_t id);
 int svm_range_vram_node_new(struct amdgpu_device *adev,
 			    struct svm_range *prange, bool clear);
 void svm_range_vram_node_free(struct svm_range *prange);
+int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
+			       unsigned long addr, struct svm_range *parent,
+			       struct svm_range *prange);
+void svm_range_add_list_work(struct svm_range_list *svms,
+			     struct svm_range *prange, struct mm_struct *mm,
+			     enum svm_work_list_ops op);
+void schedule_deferred_list_work(struct svm_range_list *svms);
 void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 			 unsigned long offset, unsigned long npages);
 void svm_range_free_dma_mappings(struct svm_range *prange);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
