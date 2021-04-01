Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E5350DBC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C87188861;
	Thu,  1 Apr 2021 04:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611EE6EC34;
 Thu,  1 Apr 2021 04:23:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4Dj0pyghfifOyIJj1atURcQG4aI0qthLt8BUSpersfpY1ucVISNsm6hmD++C0cDxGvjhjG2UcItflN9Vy5+eEmQbKoddQ92VssLlpXkj9NBVO2u/qCknAr+srVzOKQvrsUYsJ1DiApNVQr2KRQe6EnHp/zDjmxdDWHxI0J4MrT3z/w3XjHmabOTIrCNohwLkWlaa2GNcKj5HbyNaNSOIXjxPZjpwfsJ7mRHX1bKkn3mmIyo+g9CK3XzNY/aT16kJSZz/vV1jb1nM7HSNl70scgweBgVLvogG7gGuPUH4a2M7dWM5iRRe/YTuIVZnEafn1UG23QrqEhPGyJjHfuufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OORLkAUyOs33Lozf9qpz5V7p3l6PHlgsByHQuw6Ap+M=;
 b=loBad9pvNhP012rBwa0GVbRZCRG7U2LY6MlGvFiFBuQI+IsZ5/Y97QDaw9zbvcLTbWCx2uTGY8pFvfwVl9YvpVxIzb6Q3blXLL4DyJJVZzb6/vUlHhy55oX30AozxS15R0BOixYF9f4/0Kmw1AdJ3Dc5mYYZGyJGkdLqtG+qAnd8WMhqGGNjjH8uNtvPy1vIqNyl/qAGpLAPoLYwa0iJTtHQdlILk1A6JuntnBubYHWSPIg0YezGGZvQd2mf5DTvI/Iqi9+oVmtsvJaRtifNaDqfn2sQ6Uca299QDAHgn9VgdWMibdWmXiSI7GkEf5C78m2x6MNA9uETzjSRlkvyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OORLkAUyOs33Lozf9qpz5V7p3l6PHlgsByHQuw6Ap+M=;
 b=hz05s5baBPHxbcjSkXjo4tOH2IWSFA7kQ+KcynW/QSqNtSesbHOJLrWsYgYwRqxvgEeoUAA2fndWM8wOabALFc0fqzPSj4r8ImMeDfJR1YhLmRGWbzvIb0iqWKK4pa4c1NaRAI8oUOXkj+mPmsdnDQLp0i6p2jKnx/fZI1BQKyw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:22:59 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:59 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 18/34] drm/amdkfd: HMM migrate ram to vram
Date: Thu,  1 Apr 2021 00:22:12 -0400
Message-Id: <20210401042228.1423-19-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 233bf6f5-ffe4-4a56-a6ed-08d8f4c5d4ee
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB422266E70332D285719A780F927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x35KgUU/1aBBLs5CGuGKs1OA6odafV7pyV/QZ6e2m63+NqzD6uJEtGK1eGrN/I2+hg/ncUL15u4YG1bt8pmASMDqX/Yn4gDW6wjzBjA3rqWaUcj9tLA7JBUM1SHVNawVmfSqXTzUy6W0zmuYbUe9ohd6cfaG7ty0Q/bOK9+b8RbBYLlSPPktaJmJSAJ4oGg0Ehgr+PQ3TQkPx9/ryrv9tO7t8VVBFpC/T1uj6XREwo4JLe+SRIwLQ2xPkUTlTCFyFZUyvDS8hVjtCBSbmVht2wY+UVXS4WHARenPH/wS3tUM1PeIk3SgDCThW96tG+VurUqhexsyWJahYMWfCvgcTOBvX6xh6ssTT8svoGBUEnUC+XwP3aHn6sKuadDPvKFiutLg+WK+IMgqnKC7HpAqtH36wgaaMMDPwYdVg4cb1+vmgtQWAprLd6rOfgmPM9orqxIutdc1T/3GLdSp3noc9vkgOwF2tC9y7SigotOeRqN2RJwmDWilN/1krxvOVTz14X2yavZBOtx6Xxhw7keRZnMx9kfVso+ZiPVlAo0vHvF6iom9TguaNo/jryEgvKyH68+CSxobjNm4S4M2W0DYoy+aSl2tzu14zRq9CEsiVu/rfimRF7Fbc+AK+Uk1f90IeVlwPdim3gnCZKsVVgEgEdBp9FHnufMNEb68+SswIYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(30864003)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qp27FIFKx0aMr0x/Ys07v3J+yT7JSWWRINNqHkfPe9PmUoXilP8HRG3L/6kH?=
 =?us-ascii?Q?Jz4j+rP0leR6EDlDwMoxsxs2g9KW5C9KqaIv0p8zIjIxaCfzHEh9DYg/9ESu?=
 =?us-ascii?Q?Ys/SJYkjts3hxo9CBY62z3+wE+/aCS9dMh0OjciEOu5dxz0E+CbkcZD6hkhp?=
 =?us-ascii?Q?OjshqxQLXGRj7DvDTWv0XJRbCjTdMzNQ5UfnCgD73LoTdOwcd1JqdJIdmySW?=
 =?us-ascii?Q?ckmHtOnzpQaKZSfLK6b0KGBtob/lP/0yIpcPXJmf1XWkpmdExHuf3TvMhgxS?=
 =?us-ascii?Q?03zsmzA+rRbS9khqYFzpE4t0lCIlModqwlF0OouNMLVu+QDMlD6Tw3vIi7OS?=
 =?us-ascii?Q?W/lI0HAEOnuROjH+L4FvFFqTNTgcQp4kV4eBujhtnI8WP0cgrHdwL3hwSmN/?=
 =?us-ascii?Q?xrBrF4E/NPx+WN3zAX/unepLN4DUiJjPX4pePIUM4r+gKBgb7zeA6BL2hfu2?=
 =?us-ascii?Q?gIVgnjLnIx71HujIddoQCGffyoTrLB4fxbQ20iqEAUzvZCyrASICfQFmFMzO?=
 =?us-ascii?Q?5OvNfrayJYBxgK876zWsgODFUB5Z+xeHXYPJ1W8ZhicAXZm2DlILvjvuz3aM?=
 =?us-ascii?Q?7Z8M9CzDL7VHBAorA5ekdE1TIuksd+3G1Iy46g22SJs0oCEs+Rs6D2XTWK0k?=
 =?us-ascii?Q?snH3Vky3QA7qMTa6zEDX8O5WJ4VAhfr+09jtd4DMP46QZQPBJtQJPaJjpS7N?=
 =?us-ascii?Q?Q9kA+Kygw/yFYGRklMzG7bbKcFpb+7i7PCDLGRUjxzeDZy2WIiD2l1EkVUXv?=
 =?us-ascii?Q?d8/dhXbaUFoW/39YQOxIQsVzqU066WPxIHi+1lYuUelevtV0HbDaKaVWOfXX?=
 =?us-ascii?Q?8XVkxvIcipMMNzkPGyyu/mViMiScNK21A+9e27EoxsnUU6GrYWbWSbZ81HsM?=
 =?us-ascii?Q?/uCwe3fxR8hCd4FovzNecQj2WaYSJiUQtA0GoSAsJPIKaji4iPIz6gGc7FCK?=
 =?us-ascii?Q?wZ5/Hg3zIf9SN1/ohyK3DkTYVfUFacs7BixiQQwfJMV9EYJgf9loxRQPMDeP?=
 =?us-ascii?Q?zhauy1ofO1kXXrnQnZNwuELXbRFl9EkRAV+cr/bsphFhd2q0YcWT8fUriKj1?=
 =?us-ascii?Q?+u+cWpdgt+3cttJ5pMjzvtETiH6v436BmrdCmGYCVFxvIBY65D6qD8PIsZ0L?=
 =?us-ascii?Q?vPwMl0boMG9tX6/5a1UD7cI0hn3Tt5uPAaRR5t7uPRnScXkJYfIhJfDu7eKO?=
 =?us-ascii?Q?v75+i1c95AKVMt3FNLjMFAFGgHwddFKg4miEiJKTjMaeYfPy2Di5CU3y7zgB?=
 =?us-ascii?Q?aGeUcFnS90e8E6nNPecdMofILMkrsWppLHxq9a83KfagJTg/UKi5EQXgWn3I?=
 =?us-ascii?Q?VQqLAL1wiIQ7E9s6uh66zI7Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233bf6f5-ffe4-4a56-a6ed-08d8f4c5d4ee
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:59.6585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VK+84CQZ3dDYz9eG+CYWVviWg0VGdftD0+Ao/Vhdq5/htmbraiH8zgv5jYp4vLSDZ0VBr11mqAtIqHRwNvj8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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

Register svm range with same address and size but perferred_location
is changed from CPU to GPU or from GPU to CPU, trigger migration the svm
range from ram to vram or from vram to ram.

If svm range prefetch location is GPU with flags
KFD_IOCTL_SVM_FLAG_HOST_ACCESS, validate the svm range on ram first,
then migrate it from ram to vram.

After migrating to vram is done, CPU access will have cpu page fault,
page fault handler migrate it back to ram and resume cpu access.

Migration steps:

1. migrate_vma_pages get svm range ram pages, notify the
interval is invalidated and unmap from CPU page table, HMM interval
notifier callback evict process queues
2. Allocate new pages in vram using TTM
3. Use svm copy memory to sdma copy data from ram to vram
4. migrate_vma_pages copy ram pages structure to vram pages structure
5. migrate_vma_finalize put ram pages to free ram pages and memory
6. Restore work wait for migration is finished, then update GPUs page
table mapping to new vram pages, resume process queues

If migrate_vma_setup failed to collect all ram pages of range, retry 3
times until success to start migration.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 305 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 197 ++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   7 +
 4 files changed, 500 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 2a6824ddae88..fcaf34096820 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -204,6 +204,311 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 	return r;
 }
 
+static uint64_t
+svm_migrate_node_physical_addr(struct amdgpu_device *adev,
+			       struct drm_mm_node **mm_node, uint64_t *offset)
+{
+	struct drm_mm_node *node = *mm_node;
+	uint64_t pos = *offset;
+
+	if (node->start == AMDGPU_BO_INVALID_OFFSET) {
+		pr_debug("drm node is not validated\n");
+		return 0;
+	}
+
+	pr_debug("vram node start 0x%llx npages 0x%llx\n", node->start,
+		 node->size);
+
+	if (pos >= node->size) {
+		do  {
+			pos -= node->size;
+			node++;
+		} while (pos >= node->size);
+
+		*mm_node = node;
+		*offset = pos;
+	}
+
+	return (node->start + pos) << PAGE_SHIFT;
+}
+
+unsigned long
+svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
+{
+	return (addr + adev->kfd.dev->pgmap.range.start) >> PAGE_SHIFT;
+}
+
+static void
+svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
+{
+	struct page *page;
+
+	page = pfn_to_page(pfn);
+	page->zone_device_data = prange;
+	get_page(page);
+	lock_page(page);
+}
+
+static void
+svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
+{
+	struct page *page;
+
+	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
+	unlock_page(page);
+	put_page(page);
+}
+
+
+static int
+svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
+			 struct migrate_vma *migrate, struct dma_fence **mfence,
+			 dma_addr_t *scratch)
+{
+	uint64_t npages = migrate->cpages;
+	struct device *dev = adev->dev;
+	struct drm_mm_node *node;
+	dma_addr_t *src;
+	uint64_t *dst;
+	uint64_t vram_addr;
+	uint64_t offset;
+	uint64_t i, j;
+	int r = -ENOMEM;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
+		 prange->last);
+
+	src = scratch;
+	dst = (uint64_t *)(scratch + npages);
+
+	r = svm_range_vram_node_new(adev, prange, true);
+	if (r) {
+		pr_debug("failed %d get 0x%llx pages from vram\n", r, npages);
+		goto out;
+	}
+
+	node = prange->ttm_res->mm_node;
+	offset = prange->offset;
+	vram_addr = svm_migrate_node_physical_addr(adev, &node, &offset);
+	if (!vram_addr) {
+		WARN_ONCE(1, "vram node address is 0\n");
+		r = -ENOMEM;
+		goto out;
+	}
+
+	for (i = j = 0; i < npages; i++) {
+		struct page *spage;
+
+		dst[i] = vram_addr + (j << PAGE_SHIFT);
+		migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+		svm_migrate_get_vram_page(prange, migrate->dst[i]);
+
+		migrate->dst[i] = migrate_pfn(migrate->dst[i]);
+		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
+
+		if (migrate->src[i] & MIGRATE_PFN_VALID) {
+			spage = migrate_pfn_to_page(migrate->src[i]);
+			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
+					      DMA_TO_DEVICE);
+			r = dma_mapping_error(dev, src[i]);
+			if (r) {
+				pr_debug("failed %d dma_map_page\n", r);
+				goto out_free_vram_pages;
+			}
+		} else {
+			if (j) {
+				r = svm_migrate_copy_memory_gart(
+						adev, src + i - j,
+						dst + i - j, j,
+						FROM_RAM_TO_VRAM,
+						mfence);
+				if (r)
+					goto out_free_vram_pages;
+				offset += j;
+				vram_addr = (node->start + offset) << PAGE_SHIFT;
+				j = 0;
+			} else {
+				offset++;
+				vram_addr += PAGE_SIZE;
+			}
+			if (offset >= node->size) {
+				node++;
+				pr_debug("next node size 0x%llx\n", node->size);
+				vram_addr = node->start << PAGE_SHIFT;
+				offset = 0;
+			}
+			continue;
+		}
+
+		pr_debug("dma mapping src to 0x%llx, page_to_pfn 0x%lx\n",
+			 src[i] >> PAGE_SHIFT, page_to_pfn(spage));
+
+		if (j + offset >= node->size - 1 && i < npages - 1) {
+			r = svm_migrate_copy_memory_gart(adev, src + i - j,
+							 dst + i - j, j + 1,
+							 FROM_RAM_TO_VRAM,
+							 mfence);
+			if (r)
+				goto out_free_vram_pages;
+
+			node++;
+			pr_debug("next node size 0x%llx\n", node->size);
+			vram_addr = node->start << PAGE_SHIFT;
+			offset = 0;
+			j = 0;
+		} else {
+			j++;
+		}
+	}
+
+	r = svm_migrate_copy_memory_gart(adev, src + i - j, dst + i - j, j,
+					 FROM_RAM_TO_VRAM, mfence);
+
+out_free_vram_pages:
+	if (r) {
+		pr_debug("failed %d to copy memory to vram\n", r);
+		while (i--) {
+			svm_migrate_put_vram_page(adev, dst[i]);
+			migrate->dst[i] = 0;
+		}
+	}
+
+out:
+	return r;
+}
+
+static int
+svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
+			struct vm_area_struct *vma, uint64_t start,
+			uint64_t end)
+{
+	uint64_t npages = (end - start) >> PAGE_SHIFT;
+	struct dma_fence *mfence = NULL;
+	struct migrate_vma migrate;
+	dma_addr_t *scratch;
+	size_t size;
+	void *buf;
+	int r = -ENOMEM;
+	int retry = 0;
+
+	memset(&migrate, 0, sizeof(migrate));
+	migrate.vma = vma;
+	migrate.start = start;
+	migrate.end = end;
+	migrate.flags = MIGRATE_VMA_SELECT_SYSTEM;
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
+retry:
+	r = migrate_vma_setup(&migrate);
+	if (r) {
+		pr_debug("failed %d prepare migrate svms 0x%p [0x%lx 0x%lx]\n",
+			 r, prange->svms, prange->start, prange->last);
+		goto out_free;
+	}
+	if (migrate.cpages != npages) {
+		pr_debug("collect 0x%lx/0x%llx pages, retry\n", migrate.cpages,
+			 npages);
+		migrate_vma_finalize(&migrate);
+		if (retry++ >= 3) {
+			r = -ENOMEM;
+			pr_debug("failed %d migrate svms 0x%p [0x%lx 0x%lx]\n",
+				 r, prange->svms, prange->start, prange->last);
+			goto out_free;
+		}
+
+		goto retry;
+	}
+
+	if (migrate.cpages) {
+		svm_migrate_copy_to_vram(adev, prange, &migrate, &mfence,
+					 scratch);
+		migrate_vma_pages(&migrate);
+		svm_migrate_copy_done(adev, mfence);
+		migrate_vma_finalize(&migrate);
+	}
+
+	svm_range_dma_unmap(adev->dev, scratch, 0, npages);
+	svm_range_free_dma_mappings(prange);
+
+out_free:
+	kvfree(buf);
+out:
+	return r;
+}
+
+/**
+ * svm_migrate_ram_to_vram - migrate svm range from system to device
+ * @prange: range structure
+ * @best_loc: the device to migrate to
+ *
+ * Context: Process context, caller hold mmap read lock, svms lock, prange lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
+{
+	unsigned long addr, start, end;
+	struct vm_area_struct *vma;
+	struct amdgpu_device *adev;
+	struct mm_struct *mm;
+	int r = 0;
+
+	if (prange->actual_loc == best_loc) {
+		pr_debug("svms 0x%p [0x%lx 0x%lx] already on best_loc 0x%x\n",
+			 prange->svms, prange->start, prange->last, best_loc);
+		return 0;
+	}
+
+	adev = svm_range_get_adev_by_id(prange, best_loc);
+	if (!adev) {
+		pr_debug("failed to get device by id 0x%x\n", best_loc);
+		return -ENODEV;
+	}
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx] to gpu 0x%x\n", prange->svms,
+		 prange->start, prange->last, best_loc);
+
+	/* FIXME: workaround for page locking bug with invalid pages */
+	svm_range_prefault(prange, mm);
+
+	start = prange->start << PAGE_SHIFT;
+	end = (prange->last + 1) << PAGE_SHIFT;
+
+	mm = current->mm;
+
+	for (addr = start; addr < end;) {
+		unsigned long next;
+
+		vma = find_vma(mm, addr);
+		if (!vma || addr < vma->vm_start)
+			break;
+
+		next = min(vma->vm_end, end);
+		r = svm_migrate_vma_to_vram(adev, prange, vma, addr, next);
+		if (r) {
+			pr_debug("failed to migrate\n");
+			break;
+		}
+		addr = next;
+	}
+
+	if (!r)
+		prange->actual_loc = best_loc;
+
+	return r;
+}
+
 static void svm_migrate_page_free(struct page *page)
 {
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 5db5686fa46a..ffae5f989909 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -37,6 +37,8 @@ enum MIGRATION_COPY_DIR {
 	FROM_VRAM_TO_RAM
 };
 
+int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc);
+
 #if defined(CONFIG_DEVICE_PRIVATE)
 int svm_migrate_init(struct amdgpu_device *adev);
 void svm_migrate_fini(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index f557f67b9d2d..769d9e3b856e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -30,6 +30,7 @@
 #include "amdgpu_xgmi.h"
 #include "kfd_priv.h"
 #include "kfd_svm.h"
+#include "kfd_migrate.h"
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
@@ -194,7 +195,7 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 	}
 }
 
-static void svm_range_free_dma_mappings(struct svm_range *prange)
+void svm_range_free_dma_mappings(struct svm_range *prange)
 {
 	struct kfd_process_device *pdd;
 	dma_addr_t *dma_addr;
@@ -229,6 +230,7 @@ static void svm_range_free(struct svm_range *prange)
 	svm_range_vram_node_free(prange);
 	svm_range_free_dma_mappings(prange);
 	mutex_destroy(&prange->lock);
+	mutex_destroy(&prange->migrate_mutex);
 	kfree(prange);
 }
 
@@ -265,6 +267,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
+	mutex_init(&prange->migrate_mutex);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
@@ -1204,6 +1207,8 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 			pr_debug("failed %d to dma map range\n", r);
 			goto unreserve_out;
 		}
+
+		prange->validated_once = true;
 	}
 
 	svm_range_lock(prange);
@@ -1295,21 +1300,28 @@ static void svm_range_restore_work(struct work_struct *work)
 			 prange->svms, prange, prange->start, prange->last,
 			 invalid);
 
+		/*
+		 * If range is migrating, wait for migration is done.
+		 */
+		mutex_lock(&prange->migrate_mutex);
+
 		r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE,
 					       false, true);
-		if (r) {
+		if (r)
 			pr_debug("failed %d to map 0x%lx to gpus\n", r,
 				 prange->start);
-			goto unlock_out;
-		}
+
+		mutex_unlock(&prange->migrate_mutex);
+		if (r)
+			goto out_reschedule;
 
 		if (atomic_cmpxchg(&prange->invalid, invalid, 0) != invalid)
-			goto unlock_out;
+			goto out_reschedule;
 	}
 
 	if (atomic_cmpxchg(&svms->evicted_ranges, evicted_ranges, 0) !=
 	    evicted_ranges)
-		goto unlock_out;
+		goto out_reschedule;
 
 	evicted_ranges = 0;
 
@@ -1323,7 +1335,7 @@ static void svm_range_restore_work(struct work_struct *work)
 
 	pr_debug("restore svm ranges successfully\n");
 
-unlock_out:
+out_reschedule:
 	mutex_unlock(&svms->lock);
 	mmap_write_unlock(mm);
 	mutex_unlock(&process_info->lock);
@@ -1615,6 +1627,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 		list_del_init(&prange->deferred_list);
 		spin_unlock(&svms->deferred_list_lock);
 
+		mutex_lock(&prange->migrate_mutex);
 		while (!list_empty(&prange->child_list)) {
 			struct svm_range *pchild;
 
@@ -1625,6 +1638,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 			list_del_init(&pchild->child_list);
 			svm_range_handle_list_op(svms, pchild);
 		}
+		mutex_unlock(&prange->migrate_mutex);
 
 		svm_range_handle_list_op(svms, prange);
 		mutex_unlock(&svms->lock);
@@ -1919,6 +1933,151 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 	return 0;
 }
 
+/* svm_range_best_location - decide the best actual location
+ * @prange: svm range structure
+ *
+ * For xnack off:
+ * If range map to single GPU, the best acutal location is prefetch loc, which
+ * can be CPU or GPU.
+ *
+ * If range map to multiple GPUs, only if mGPU connection on xgmi same hive,
+ * the best actual location could be prefetch_loc GPU. If mGPU connection on
+ * PCIe, the best actual location is always CPU, because GPU cannot access vram
+ * of other GPUs, assuming PCIe small bar (large bar support is not upstream).
+ *
+ * For xnack on:
+ * The best actual location is prefetch location. If mGPU connection on xgmi
+ * same hive, range map to multiple GPUs. Otherwise, the range only map to
+ * actual location GPU. Other GPU access vm fault will trigger migration.
+ *
+ * Context: Process context
+ *
+ * Return:
+ * 0 for CPU or GPU id
+ */
+static uint32_t svm_range_best_location(struct svm_range *prange)
+{
+	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
+	uint32_t best_loc = prange->prefetch_loc;
+	struct kfd_process_device *pdd;
+	struct amdgpu_device *bo_adev;
+	struct amdgpu_device *adev;
+	struct kfd_process *p;
+	uint32_t gpuidx;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	/* xnack on */
+	if (p->xnack_enabled)
+		goto out;
+
+	/* xnack off */
+	if (!best_loc || best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED)
+		goto out;
+
+	bo_adev = svm_range_get_adev_by_id(prange, best_loc);
+	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+		  MAX_GPU_INSTANCE);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to get device by idx 0x%x\n", gpuidx);
+			continue;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+
+		if (adev == bo_adev)
+			continue;
+
+		if (!amdgpu_xgmi_same_hive(adev, bo_adev)) {
+			best_loc = 0;
+			break;
+		}
+	}
+
+out:
+	pr_debug("xnack %d svms 0x%p [0x%lx 0x%lx] best loc 0x%x\n",
+		 p->xnack_enabled, &p->svms, prange->start, prange->last,
+		 best_loc);
+
+	return best_loc;
+}
+
+/* FIXME: This is a workaround for page locking bug when some pages are
+ * invalid during migration to VRAM
+ */
+void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm)
+{
+	struct hmm_range *hmm_range;
+	int r;
+
+	if (prange->validated_once)
+		return;
+
+	r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
+				       prange->start << PAGE_SHIFT,
+				       prange->npages, &hmm_range,
+				       false, true);
+	if (!r) {
+		amdgpu_hmm_range_get_pages_done(hmm_range);
+		prange->validated_once = true;
+	}
+}
+
+/* svm_range_trigger_migration - start page migration if prefetch loc changed
+ * @mm: current process mm_struct
+ * @prange: svm range structure
+ * @migrated: output, true if migration is triggered
+ *
+ * If range perfetch_loc is GPU, actual loc is cpu 0, then migrate the range
+ * from ram to vram.
+ * If range prefetch_loc is cpu 0, actual loc is GPU, then migrate the range
+ * from vram to ram.
+ *
+ * If GPU vm fault retry is not enabled, migration interact with MMU notifier
+ * and restore work:
+ * 1. migrate_vma_setup invalidate pages, MMU notifier callback svm_range_evict
+ *    stops all queues, schedule restore work
+ * 2. svm_range_restore_work wait for migration is done by
+ *    a. svm_range_validate_vram takes prange->migrate_mutex
+ *    b. svm_range_validate_ram HMM get pages wait for CPU fault handle returns
+ * 3. restore work update mappings of GPU, resume all queues.
+ *
+ * Context: Process context
+ *
+ * Return:
+ * 0 - OK, otherwise - error code of migration
+ */
+static int
+svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
+			    bool *migrated)
+{
+	uint32_t best_loc;
+	int r = 0;
+
+	*migrated = false;
+	best_loc = svm_range_best_location(prange);
+
+	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
+	    best_loc == prange->actual_loc)
+		return 0;
+
+	if (best_loc && !prange->actual_loc &&
+	    !(prange->flags & KFD_IOCTL_SVM_FLAG_HOST_ACCESS))
+		return 0;
+
+	if (best_loc) {
+		pr_debug("migrate from ram to vram\n");
+		r = svm_migrate_ram_to_vram(prange, best_loc);
+
+		if (!r)
+			*migrated = true;
+	}
+
+	return r;
+}
+
 static int
 svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 		   uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
@@ -1989,13 +2148,29 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	 * case because the rollback wouldn't be guaranteed to work either.
 	 */
 	list_for_each_entry(prange, &update_list, update_list) {
+		bool migrated;
+
+		mutex_lock(&prange->migrate_mutex);
+
+		r = svm_range_trigger_migration(mm, prange, &migrated);
+		if (r)
+			goto out_unlock_range;
+
+		if (migrated) {
+			pr_debug("restore_work will update mappings of GPUs\n");
+			mutex_unlock(&prange->migrate_mutex);
+			continue;
+		}
+
 		r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE,
 					       true, true);
-		if (r) {
-			pr_debug("failed %d to map 0x%lx to gpus\n", r,
-				 prange->start);
+		if (r)
+			pr_debug("failed %d to map svm range\n", r);
+
+out_unlock_range:
+		mutex_unlock(&prange->migrate_mutex);
+		if (r)
 			break;
-		}
 	}
 
 	svm_range_debug_dump(svms);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 15d35b63cee2..ad4ec8337762 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -55,6 +55,7 @@ struct svm_work_list_item {
  * struct svm_range - shared virtual memory range
  *
  * @svms:       list of svm ranges, structure defined in kfd_process
+ * @migrate_mutex: to serialize range migration, validation and mapping update
  * @start:      range start address in pages
  * @last:       range last address in pages
  * @it_node:    node [start, last] stored in interval tree, start, last are page
@@ -91,6 +92,7 @@ struct svm_work_list_item {
  */
 struct svm_range {
 	struct svm_range_list		*svms;
+	struct mutex			migrate_mutex;
 	unsigned long			start;
 	unsigned long			last;
 	struct interval_tree_node	it_node;
@@ -119,6 +121,7 @@ struct svm_range {
 	struct list_head		child_list;
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
+	bool				validated_once;
 };
 
 static inline void svm_range_lock(struct svm_range *prange)
@@ -143,5 +146,9 @@ struct amdgpu_device *svm_range_get_adev_by_id(struct svm_range *prange,
 int svm_range_vram_node_new(struct amdgpu_device *adev,
 			    struct svm_range *prange, bool clear);
 void svm_range_vram_node_free(struct svm_range *prange);
+void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
+			 unsigned long offset, unsigned long npages);
+void svm_range_free_dma_mappings(struct svm_range *prange);
+void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm);
 
 #endif /* KFD_SVM_H_ */
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
