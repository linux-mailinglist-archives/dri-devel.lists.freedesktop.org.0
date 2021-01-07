Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1D2EC8B8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF806E441;
	Thu,  7 Jan 2021 03:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018276E432;
 Thu,  7 Jan 2021 03:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEz1UQ4f2oarsZQX34hHL5fXFgZPckR+epiE6RUSm4MwlEZR0tUx76gWGV1lWGbRDTHCo5m2fySMM7btK0CA1LU16MbuG4YfEfLqLnPGzVuUY+maY1RX4PZ0WVkMSoPm9D7xjNtx9ZBG91FdqH++GTu7FgJ8fodLLGUHhwdffvJ/msMdEDeQyVBzhCu1nuyR1q7fyGcIHuWUGNgYgkI68xu2Kzu/cvdG3y4L5KOdLbCJ1aRP/83AWcoN4n8H5AsmoXrRbN0IOmhgI9QYejY4G7hz8V8QjGnrEcZuMsSbRAibW9SdovhDyatAordBGvR0xzqQhJIoPOQSse0p1/qRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7mlf28jG5L7pi4n0rTsyh1TY9yoOYWmwOERIm4HfzA=;
 b=HR/FQl6LxNrYuCUnyoJNoSXbbIMK6G/JiLcyt1ROtMpuSKPlY08hOOdOK6a6rEO79PfSc1U9K2GoegoMrqxbUmrew+uh9MZOqvDAPlgR5UJYRjRWVNmDAk+ohPOPJcamnJ39Tfe/o+rp8cCShXFqLoiAILg9kcyF6XRqowDYBE6Lbny/BaWu197XoynZRRtB1DZO+svd4PwmRN6hXG4Y0kE+6dKdzDbxGpn7eypNvk0Cd52q5IgpTnywjKA2WzWlIjMcEactxL9UZcVym7B0EmRV8RDukqrGqUcOJkj1JfkOv0NC8QWvFml7gSB/m7qakTTDwdW0mCPjp4vic6j2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7mlf28jG5L7pi4n0rTsyh1TY9yoOYWmwOERIm4HfzA=;
 b=DAjJ/s7RgIyE58Fa5sqS6PY3lFND7of429Pt+dOB3MnUenMfu1zfNH8c+39LjiG2ZIP8CBsbzg8819ibHpPF8tTq/PkiOcla1Wq7e47FN0Vc7K5usax17PIMtzNWlVHCLClDI0OM2cXUQgXBi07ilC0vo01YXz30M1QfK46EvB0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:00 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:00 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 22/35] drm/amdkfd: HMM migrate vram to ram
Date: Wed,  6 Jan 2021 22:01:14 -0500
Message-Id: <20210107030127.20393-23-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 542c6480-ea74-42a0-67f6-08d8b2b8be39
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408255910C664871B808B1292AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aHSn9ehmF4wh0DULT8zRlTIXrfJacIucLoQMSWy3nAYlubS8Nz6ih5398KwCC2svCMLsfId+goX0ze8bFQYSFquxNM+fwAvCzHwHdTe3L4r2aqvE69I19uEsXvbaeH1XpH9eRGusSMSqkBH6pihpSmK255869MB69vjYdPe/TjEdFJVRsT1pHkMONGJ3C8JdBuWvkb8XM9V75QbUJHOxNxBWmlBAjfe9NyuSfD9Rn06VUfynTYrG57plurOhSCPOizctA5mohk92LlKF6hC9wwGZAF1offmIeIvBSCRU3oTZAU3FZ32NWWJFVUydso4kthUBrq96lfP/mDySzFumoCPVIp4nj8FkWb5ipljG5CYoTT/ZjAtT3ir4rQq1R62m53GiBqrJTPphXfjGY+etog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(30864003)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rEKQgfD+zgjW8ZxwxfF65rYn0vLJGTLBglpGmPKRiCRmaz8F9FgKEAycp8xU?=
 =?us-ascii?Q?4ybTIn/EFMfxsAiz1D345D/UaCtUWCWHsG4rqAcLg0Tri1syx98AsHJRrU/G?=
 =?us-ascii?Q?6tzV5cIY3ZPzW4MWSv2/2py4us7lQqsA0GOMGzYGI8uzrPe9pPa4vUrAtvLU?=
 =?us-ascii?Q?bPPnBwuGwtif08hF8cx5l96zku9n02zsI0CBhTByB6Lf+AWx8jxD1tvplmz+?=
 =?us-ascii?Q?0eG5EbSGDUtRCz+WZ2lOIaa2/kt36ElEe93NWOMDW1T5SdgpQaxruydxXvwU?=
 =?us-ascii?Q?2qmOvWYKitwneqx2OS+y/icRTuo8r15EXMphz4vuvvTs4jUtqJQPKJRknTrH?=
 =?us-ascii?Q?sMzBwEMn4dbR3lkGzif5puLos+G+fhA0YUWDl/XnUxZZ2VZMqZyxHoJ1xYct?=
 =?us-ascii?Q?u4rOrzEqz2cKABSKHwpabPdnmTjtKKRkptzbm9LwETKw7nXZLSfiOXttbHst?=
 =?us-ascii?Q?3VaYQET+6uQL7A5LZ5NOOMibL1GcdUrkUEauaPs7d4xjGoHm5jYanVXkc05e?=
 =?us-ascii?Q?TR5CWPsdIkE5rYPcyzC/AkYO6kBjId8e9lzy+iliHvSHGzL9RrQ98f1SwLuU?=
 =?us-ascii?Q?ddDT4nMhNfdv6q4t6yalNPUlKwGN+t2iCNOTIcJ8N1NSsn0egMU2+JbtJqLC?=
 =?us-ascii?Q?26jl22S7tZzj6ZvANJe9QL7cL7VviE8JmOn0oaR+VVGcnoSly8c0iSpImGgr?=
 =?us-ascii?Q?1tTadB/EXCY2oUl5EXoi+ekZGYm2lNGmQsJgt42HRFA8po/kOwkcxPeTYz+x?=
 =?us-ascii?Q?1AoZKJoyBlk4Nx2xOHDyf0YjFI5IsWcDchb67n33zMnrHqFjmT/wcSym1gjo?=
 =?us-ascii?Q?wP3n8E//vapI68xTVWyvu7UfSHxkiSYCMZ8XovwN1VK6xM72Ah5i2AVJDKk5?=
 =?us-ascii?Q?yZxYpjW0+3+sWeykUFy9Hsyr6o2ARX0DZR1IUYDX6/4wGqBxdji+GiFecpfN?=
 =?us-ascii?Q?IuxB+p0A6te1RxeK8yoWbJ7LICAIDJCFHUI+YvykLvgjRsiVBJRCWW99skqa?=
 =?us-ascii?Q?MNyb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:00.7069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 542c6480-ea74-42a0-67f6-08d8b2b8be39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxOtLozWNBYHi3Mmg+qAvfh/uyFX9E6TP10wDyeSTbRMrgP6mfsTno9rstT8iCmoCBdGu2/bl0qbY83jMIHFwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

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
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 274 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 116 +++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   4 +
 4 files changed, 392 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index af23f0be7eaf..d33a4cc63495 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -259,6 +259,35 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
 	put_page(page);
 }
 
+static unsigned long
+svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
+{
+	unsigned long addr;
+
+	addr = page_to_pfn(page) << PAGE_SHIFT;
+	return (addr - adev->kfd.dev->pgmap.res.start);
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
@@ -471,13 +500,208 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
 
 static void svm_migrate_page_free(struct page *page)
 {
+	/* Keep this function to avoid warning */
+}
+
+static int
+svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
+			struct migrate_vma *migrate,
+			struct dma_fence **mfence)
+{
+	uint64_t npages = migrate->cpages;
+	uint64_t *src, *dst;
+	struct page *dpage;
+	uint64_t i = 0, j;
+	uint64_t addr;
+	int r = 0;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last);
+
+	addr = prange->it_node.start << PAGE_SHIFT;
+
+	src = kvmalloc_array(npages << 1, sizeof(*src), GFP_KERNEL);
+	if (!src)
+		return -ENOMEM;
+
+	dst = src + npages;
+
+	prange->pages_addr = kvmalloc_array(npages, sizeof(*prange->pages_addr),
+					    GFP_KERNEL | __GFP_ZERO);
+	if (!prange->pages_addr) {
+		r = -ENOMEM;
+		goto out_oom;
+	}
+
+	for (i = 0, j = 0; i < npages; i++, j++, addr += PAGE_SIZE) {
+		struct page *spage;
+
+		spage = migrate_pfn_to_page(migrate->src[i]);
+		if (!spage) {
+			pr_debug("failed get spage svms 0x%p [0x%lx 0x%lx]\n",
+				 prange->svms, prange->it_node.start,
+				 prange->it_node.last);
+			r = -ENOMEM;
+			goto out_oom;
+		}
+		src[i] = svm_migrate_addr(adev, spage);
+		if (i > 0 && src[i] != src[i - 1] + PAGE_SIZE) {
+			r = svm_migrate_copy_memory_gart(adev, src + i - j,
+							 dst + i - j, j,
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
+				 prange->svms, prange->it_node.start,
+				 prange->it_node.last);
+			r = -ENOMEM;
+			goto out_oom;
+		}
+
+		dst[i] = page_to_pfn(dpage) << PAGE_SHIFT;
+		*(prange->pages_addr + i) = dst[i];
+
+		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
+		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
+
+	}
+
+	r = svm_migrate_copy_memory_gart(adev, src + i - j, dst + i - j, j,
+					 FROM_VRAM_TO_RAM, mfence);
+
+out_oom:
+	kvfree(src);
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
+	int r = -ENOMEM;
+
+	memset(&migrate, 0, sizeof(migrate));
+	migrate.vma = vma;
+	migrate.start = start;
+	migrate.end = end;
+	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	migrate.pgmap_owner = adev;
+
+	migrate.src = kvmalloc_array(npages << 1, sizeof(*migrate.src),
+				     GFP_KERNEL | __GFP_ZERO);
+	if (!migrate.src)
+		goto out;
+	migrate.dst = migrate.src + npages;
+
+	r = migrate_vma_setup(&migrate);
+	if (r) {
+		pr_debug("failed %d prepare migrate svms 0x%p [0x%lx 0x%lx]\n",
+			 r, prange->svms, prange->it_node.start,
+			 prange->it_node.last);
+		goto out_free;
+	}
+
+	pr_debug("cpages %ld\n", migrate.cpages);
+
+	if (migrate.cpages) {
+		svm_migrate_copy_to_ram(adev, prange, &migrate, &mfence);
+		migrate_vma_pages(&migrate);
+		svm_migrate_copy_done(adev, mfence);
+		migrate_vma_finalize(&migrate);
+	} else {
+		pr_debug("failed collect migrate device pages [0x%lx 0x%lx]\n",
+			 prange->it_node.start, prange->it_node.last);
+	}
+
+out_free:
+	kvfree(migrate.src);
+out:
+	return r;
+}
+
+/**
+ * svm_migrate_vram_to_ram - migrate svm range from device to system
+ * @prange: range structure
+ * @mm: process mm, use current->mm if NULL
+ *
+ * Context: Process context, caller hold mm->mmap_sem and prange->lock and take
+ *          svms srcu read lock
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
+			 prange->it_node.start, prange->it_node.last);
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
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last);
+
+	start = prange->it_node.start << PAGE_SHIFT;
+	end = (prange->it_node.last + 1) << PAGE_SHIFT;
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
+	svm_range_vram_node_free(prange);
+	prange->actual_loc = 0;
+
+	return r;
 }
 
 /**
  * svm_migrate_to_ram - CPU page fault handler
  * @vmf: CPU vm fault vma, address
  *
- * Context: vm fault handler, mm->mmap_sem is taken
+ * Context: vm fault handler, caller holds the mmap lock
  *
  * Return:
  * 0 - OK
@@ -485,7 +709,53 @@ static void svm_migrate_page_free(struct page *page)
  */
 static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 {
-	return VM_FAULT_SIGBUS;
+	unsigned long addr = vmf->address;
+	struct vm_area_struct *vma;
+	struct svm_range *prange;
+	struct list_head list;
+	struct kfd_process *p;
+	int r = VM_FAULT_SIGBUS;
+	int srcu_idx;
+
+	vma = vmf->vma;
+
+	p = kfd_lookup_process_by_mm(vma->vm_mm);
+	if (!p) {
+		pr_debug("failed find process at fault address 0x%lx\n", addr);
+		return VM_FAULT_SIGBUS;
+	}
+
+	/* To prevent prange is removed */
+	srcu_idx = srcu_read_lock(&p->svms.srcu);
+
+	addr >>= PAGE_SHIFT;
+	pr_debug("CPU page fault svms 0x%p address 0x%lx\n", &p->svms, addr);
+
+	r = svm_range_split_by_granularity(p, addr, &list);
+	if (r) {
+		pr_debug("failed %d to split range by granularity\n", r);
+		goto out_srcu;
+	}
+
+	list_for_each_entry(prange, &list, update_list) {
+		mutex_lock(&prange->mutex);
+		r = svm_migrate_vram_to_ram(prange, vma->vm_mm);
+		mutex_unlock(&prange->mutex);
+		if (r) {
+			pr_debug("failed %d migrate [0x%lx 0x%lx] to ram\n", r,
+				 prange->it_node.start, prange->it_node.last);
+			goto out_srcu;
+		}
+	}
+
+out_srcu:
+	srcu_read_unlock(&p->svms.srcu, srcu_idx);
+	kfd_unref_process(p);
+
+	if (r)
+		return VM_FAULT_SIGBUS;
+
+	return 0;
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
index 0dbc403413a1..37f35f986930 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -819,6 +819,92 @@ svm_range_split_add_front(struct svm_range *prange, struct svm_range *new,
 	return 0;
 }
 
+/**
+ * svm_range_split_by_granularity - collect ranges within granularity boundary
+ *
+ * @p: the process with svms list
+ * @addr: the vm fault address in pages, to search ranges
+ * @list: output, the range list
+ *
+ * Collects small ranges that make up one migration granule and splits the first
+ * and the last range at the granularity boundary
+ *
+ * Context: hold and release svms lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+int svm_range_split_by_granularity(struct kfd_process *p, unsigned long addr,
+				   struct list_head *list)
+{
+	struct svm_range *prange;
+	struct svm_range *tail;
+	struct svm_range *new;
+	unsigned long start;
+	unsigned long last;
+	unsigned long size;
+	int r = 0;
+
+	svms_lock(&p->svms);
+
+	prange = svm_range_from_addr(&p->svms, addr);
+	if (!prange) {
+		pr_debug("cannot find svm range at 0x%lx\n", addr);
+		svms_unlock(&p->svms);
+		return -EFAULT;
+	}
+
+	/* Align splited range start and size to granularity size, then a single
+	 * PTE will be used for whole range, this reduces the number of PTE
+	 * updated and the L1 TLB space used for translation.
+	 */
+	size = 1ULL << prange->granularity;
+	start = ALIGN_DOWN(addr, size);
+	last = ALIGN(addr + 1, size) - 1;
+	INIT_LIST_HEAD(list);
+
+	pr_debug("svms 0x%p split [0x%lx 0x%lx] at 0x%lx granularity 0x%lx\n",
+		 prange->svms, start, last, addr, size);
+
+	if (start > prange->it_node.start) {
+		r = svm_range_split(prange, prange->it_node.start, start - 1,
+				    &new);
+		if (r)
+			goto out_unlock;
+
+		svm_range_add_to_svms(new);
+	} else {
+		new = prange;
+	}
+
+	while (size > new->npages) {
+		struct interval_tree_node *next;
+
+		list_add(&new->update_list, list);
+
+		next = interval_tree_iter_next(&new->it_node, start, last);
+		if (!next)
+			goto out_unlock;
+
+		size -= new->npages;
+		new = container_of(next, struct svm_range, it_node);
+	}
+
+	if (last < new->it_node.last) {
+		r = svm_range_split(new, new->it_node.start, last, &tail);
+		if (r)
+			goto out_unlock;
+		svm_range_add_to_svms(tail);
+	}
+
+	list_add(&new->update_list, list);
+
+out_unlock:
+	svms_unlock(&p->svms);
+
+	return r;
+}
+
 static uint64_t
 svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 {
@@ -1508,6 +1594,27 @@ static const struct mmu_interval_notifier_ops svm_range_mn_ops = {
 	.invalidate = svm_range_cpu_invalidate_pagetables,
 };
 
+/**
+ * svm_range_from_addr - find svm range from fault address
+ * @svms: svm range list header
+ * @addr: address to search range interval tree, in pages
+ *
+ * Context: The caller must hold svms_lock
+ *
+ * Return: the svm_range found or NULL
+ */
+struct svm_range *
+svm_range_from_addr(struct svm_range_list *svms, unsigned long addr)
+{
+	struct interval_tree_node *node;
+
+	node = interval_tree_iter_first(&svms->objects, addr, addr);
+	if (!node)
+		return NULL;
+
+	return container_of(node, struct svm_range, it_node);
+}
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
@@ -1754,11 +1861,14 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 
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
index b81dfb32135b..c67e96f764fe 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -112,10 +112,14 @@ void svm_range_list_fini(struct kfd_process *p);
 int svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	      uint64_t size, uint32_t nattrs,
 	      struct kfd_ioctl_svm_attribute *attrs);
+struct svm_range *svm_range_from_addr(struct svm_range_list *svms,
+				      unsigned long addr);
 struct amdgpu_device *svm_range_get_adev_by_id(struct svm_range *prange,
 					       uint32_t id);
 int svm_range_vram_node_new(struct amdgpu_device *adev,
 			    struct svm_range *prange, bool clear);
 void svm_range_vram_node_free(struct svm_range *prange);
+int svm_range_split_by_granularity(struct kfd_process *p, unsigned long addr,
+				   struct list_head *list);
 
 #endif /* KFD_SVM_H_ */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
