Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D2354A7A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD476E558;
	Tue,  6 Apr 2021 01:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D5C6E25A;
 Tue,  6 Apr 2021 01:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSWN86mOlIwUMVmF0up99XALChPFeffFqmdUaIIkv7HndYuuBZMIW2FANDHLkH2rgaNzs48SVG/GAoaFXOoYjPafl0JRGcz2PZAKNp6p3IyyORifJC8grSOWXpZ6mefpFCSWDxAK8b/suETQHwlmlkkcIilwTLukXxA5ltJk2EjbgnUP0aTKWJa0TO6pwlefO+rDijRzNNNtyOym1tdSxRVmSis5E0t4H8LXDv105ozsPscE8/th2ls2CLD4yO47BJyjV4M4YYOaBGqxOXiacFpkFa0v8E3EKT6gg687/6AhhcKJ+9eqV/QPu8kv1+bixeqBRUWOISkKwfst2G1nBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyEkCd8B6/ZDxfr4iatjUUxU8eV75nWGm78gtd+FAsE=;
 b=l4b2HnhPUlFsTBeMymY4QlzYKgijudEiUjyWf+oPEhOtP9o7v0I8e/XwCTa99eJYhNjLD1DkQvlU8nBHrQyA03otcbcl4b8AcLnatI+MkIvJ1b+BMOmLXqurozim08EK7jjMereTczCU4rZupqSzrjfvtRxDBVRZwYhaYTtP4SLOfVm48xwKf+Z72gX60ydoFyXMBNbzIP+Z1gT+u8YAgLd3qParOPUu3xCmi0Kk/PEyrfSuBggqY1d0q5nGeqgOEkKD+Ma30ypLpccIi18OuUN+hZlF1ugqDiRlyZTDaImo3A/H/Fndi+M9UZXc/DjfxsJV+0EstnywHm+c2RXMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyEkCd8B6/ZDxfr4iatjUUxU8eV75nWGm78gtd+FAsE=;
 b=Eew8UJ7kDKnxB+tTCj65qbH+ciHA9vohK0EnOMwql29qlyh8MIBFBKj6XVWN/g8o+WU4i5boSRdjE8zWunbr5FP7NFux9ubQn9H2VLsjR+Pl54bGZ1YhPiXEDIitc51wDJjmmPd4vhsJPD3r6EvTedkcABbJEqhd2kW07frKepo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:47:05 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:05 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 20/34] drm/amdkfd: HMM migrate vram to ram
Date: Mon,  5 Apr 2021 21:46:15 -0400
Message-Id: <20210406014629.25141-21-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea2ce3f6-e9a1-4f1a-5e06-08d8f89de164
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37928BE0439D1E019DD5D6DB92769@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QqT/Td0iS6SsgqEvx96197WaEoBKaLrDDTPpE1Syt6Be/bAtfoT0fb4jFO2dBfNQJWXnYim7vbd55Ot775RWj1W+8L0Egjh3uxM9QkZzMWPj8c0YcWYdTZhvLtTqElp/uQCzI95tzQ+PmFGiYjLBDFdnG9rXrFCrMVgtUxplgqGhNFGL0Wupx1p0Wv0uxIiyL+71mLQdl5lru35vdfANtb14vngObghN0WO66kF+5f1GNQ1+raYhE2/pAAzERcfg264fFC08dsTzk1LRHlNe2nSMQGst0RJQ2eg31axVfDEPv0sSK9u46y9cZTOcWQACsOPFMawozNSmBPwLU1Cb7/f6mxAizCoXpDZVZJk6BbaQ9qDUnLUNY/6lKzJq1bGEB4S++RTsSXhPY90WBsjBU/3k0XgGSuJsaqdrhQSFxvOqZIfpMuXnzGCeAld03RXfzTvDNrw/cATRCaws2u0UWKeP5plP6H0G9hv7r7ztE7Z6ak6xsODvEJE3kKLehKr4aK42pExUDZgvGhAPcrZUSajb/xOhPeupKuNoNvWzY1RR8eVf8Z4bpoYIOUeUDWaxhXVrfBp0FwBnJJtW3f3aF9pC03CIPVe90ATconI2aSg60Q+luC+K/0pouHcNb9HbHmpPyV1qC/eaJrm9r6igJ9Rdo5Wy58sTLYgCdGi899o+Thk5fh2ReHRUho3+i7kQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(316002)(66476007)(26005)(8676002)(16526019)(83380400001)(186003)(1076003)(30864003)(4326008)(8936002)(38100700001)(2906002)(450100002)(956004)(2616005)(36756003)(6666004)(478600001)(7696005)(52116002)(66946007)(86362001)(66556008)(38350700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Y2jtL1Z18oNPtv4st8F5StR8CxQcZW0+nIRXzaHD3vxDV3/z3n9UIF5jBYIX?=
 =?us-ascii?Q?LhN+5fJSFXEfRPqnsoUPgU25YfbBqblSo970VzXSxPbc3VqMVrNMo33EbBkR?=
 =?us-ascii?Q?SpYhxuHhG+M78jLKEdH5W5carG1M8P2ibGokXrD0CTaiaOvi0Y+LnjIofyh6?=
 =?us-ascii?Q?rfkvmIt86amQPNNZ66iz4/D/lytZaNGHzQkJ2HNvUFx0gfy+wtuThg7WKJv4?=
 =?us-ascii?Q?sVSdmOdf13YfVBZ5HVZ6ccANEMHXcDh+Gc+dKITobIniLIYi3zak/iXo4i/k?=
 =?us-ascii?Q?3m0/oQm7qwJc+eAWQnemJ/ByHkqIoUT9O/eDe4/cmvUqh3Z6hBXS+zoUo64y?=
 =?us-ascii?Q?hQzOEs4iYeVMKAK65DAf09/3ogqpT9oBzF5AGZyfP4xnpuecAllkeq0dpDle?=
 =?us-ascii?Q?8zgEVCBBsF3AcWXaG6zFQnIMhVsVRtnYYwqJ+4U2JFCnZmzr8VkoeHygwEoJ?=
 =?us-ascii?Q?EDyAxW0vZfgICMek6erTUfu8hPuljEb5TE92mbqvY9TvgMuda6vM01rdG9Ja?=
 =?us-ascii?Q?GtlJssjoz7Pqpo0v6Rsm861QyxA3AReR06cR6cVisxmGbrX6hBBbLCjQmKDH?=
 =?us-ascii?Q?KZHGEwWINydtsdqj7AmiKmkERibx9zuNdK+y48yMg6tKoNYTU3HYdTghFgZV?=
 =?us-ascii?Q?klsnXTgfKE1PQcPgeSYLbofSzuEPjpqYuh95Z4mdL3lM8MtvoS2o7PIKBvHd?=
 =?us-ascii?Q?Djo0XvxxJyUGhtG96/Qsl9V506Kro/Pk+xcQxl648wlZ6e9QvwoL3p7huBof?=
 =?us-ascii?Q?dHLpW0Wc+QLRGeBju6R1ZLHFvgE9TOUaxQRDZCTOklsefHIWsDIg7+yzdr5M?=
 =?us-ascii?Q?k1zkAph9McRqrvsc75dAVcTa73qDex3Be+mmJIgzEqA85h7o4Ywtqmff5nva?=
 =?us-ascii?Q?hOr5Ej2iBpTkMlOeH2yR9mhdjSXfvoekjR0jCKpfSIKBM/IU1jGkNXDvO3F+?=
 =?us-ascii?Q?3QZmcK/ERMoY4j1fFb1APu+AbMl1nOmwMnW6+JUnxLiuc4qJ0iyxJSXk3wMk?=
 =?us-ascii?Q?NiJYs6/37hSQqTvJ6Ua1p8pFT9TuiAL1oonO4WDMjQ3a2vN2lVUX2LOSiY9/?=
 =?us-ascii?Q?gdOh3rzAelCkDvPoyxuaz1mYInzg01xK6zoYgJTIFmAPDIG3uxNkVYjWAzL0?=
 =?us-ascii?Q?U4zSIDqHSyAQh95DLGSbdCPxhd5Q4/WtMoFOaNoGmXtfJ1MR0HbbC4lxNCV0?=
 =?us-ascii?Q?H0mBZ045I5MElyD0VfoFy/nbgZa7w7MTpBo3+C8/rB77UPTZJV0yGFNZVz4n?=
 =?us-ascii?Q?agwVDaEtw4fGCwqhCD7U8eXSmdo7x3M+4FzpSPxPjdzlODJCwp+PgYO4Ww2A?=
 =?us-ascii?Q?nEry50RjcA/mPXXo1oUVwQff?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2ce3f6-e9a1-4f1a-5e06-08d8f89de164
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:04.9174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrsX6sVqHgpds2q+Ip0ezg5DO1+Gj6bJxzoAY/lhFPR2d5nL9FGwPTA5lLAQ0JT6Y9KWVRCQVvpRxyEzPXNF5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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
index fcaf34096820..dbec22c37151 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -190,7 +190,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
  * 0		- success
  * otherwise	- error code from dma fence signal
  */
-int
+static int
 svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 {
 	int r = 0;
@@ -259,6 +259,35 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
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
@@ -511,13 +540,213 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
 
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
@@ -525,7 +754,74 @@ static void svm_migrate_page_free(struct page *page)
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
index ffae5f989909..95fd7b21791f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -38,6 +38,9 @@ enum MIGRATION_COPY_DIR {
 };
 
 int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc);
+int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
+unsigned long
+svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
 
 #if defined(CONFIG_DEVICE_PRIVATE)
 int svm_migrate_init(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index bc3d761ba421..3d497bdd9455 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -862,6 +862,60 @@ svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
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
@@ -1689,7 +1743,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 	pr_debug("exit svms 0x%p\n", svms);
 }
 
-static void
+void
 svm_range_add_list_work(struct svm_range_list *svms, struct svm_range *prange,
 			struct mm_struct *mm, enum svm_work_list_ops op)
 {
@@ -1712,7 +1766,7 @@ svm_range_add_list_work(struct svm_range_list *svms, struct svm_range *prange,
 	spin_unlock(&svms->deferred_list_lock);
 }
 
-static void schedule_deferred_list_work(struct svm_range_list *svms)
+void schedule_deferred_list_work(struct svm_range_list *svms)
 {
 	spin_lock(&svms->deferred_list_lock);
 	if (!list_empty(&svms->deferred_range_list))
@@ -1802,12 +1856,19 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
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
@@ -1850,6 +1911,49 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
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
@@ -2112,11 +2216,14 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
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
index ad4ec8337762..32c87957aa43 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -141,11 +141,21 @@ void svm_range_list_fini(struct kfd_process *p);
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
