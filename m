Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B32EC8AE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9D96E437;
	Thu,  7 Jan 2021 03:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4996E438;
 Thu,  7 Jan 2021 03:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WESKKnzcEivjM5rpvpBQ4g2VWymtsSpppKDI8ZIbhWLohwAsZoSw1DTXQt6dERbIZn6RTBhS4/J01FHh9rh6qlHk3pPdUszhBLQYlZbf3NgNCso3VJDlXF5YtuklS//aKZjmqV0eFQr+/5KeB/RLVpJXqxXp/5mz2W2Tsgfuaou6ESabIZW0GpZh1fVCQhKXo65ZNmMi/fp5apHgWa4zlgnZND/lg/w0EQdUTmXoOgHz5GyYoyRwpHcVBWeucFpHXqrBJNDN2HNF76LtURj8sgh3oS9cGsi86pf2LIL5ggVzHiCQhkaGMcIXiKEixUnZIYJYDMRz6xZ4wl5lYczUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk3y6inJTIoxhnmvDy2F1i9n3aTVM6QkLiEH4EEBDqQ=;
 b=oD+1cK6Lzj4TQQleDq7ZIjVezgJL95P3yssiK1mN4t6RulZnJz4/k6XagwrGkqvV+tEEJ/Rg5pRt3PIt/SfxQPwnvGa1NKQ836vdrvMP+4uHLZyTyivqXzGO8z0sObbaQaVhzFRapr0ruKtkrXEtHEjqt5yanFGfz8k2qiOtoXbw2ji1EzhKP3ZH7RTE9b/OphQU7H+yoikRYydHeg58U0errvYMFg1GZBOSclENY5sCF5RU2gkH5RasZmqbaqgdXwVfCNYsqCrycNotaY/2JSEbjq2HM4jq2jBHX+Pr/81SJwmNBjdjj3nabwtHWZCgeohs4Vxf/28k7mkC0lOtXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk3y6inJTIoxhnmvDy2F1i9n3aTVM6QkLiEH4EEBDqQ=;
 b=v3PrrE0WNv1WOFoHaTJ+3GO3HqhjbUutNyV6iG5T+kvB8nHrFjl4/6XjefN7ic5R3R+5fFsrLPN6xNEyRNc/fQB275IyRsC9rIiDLSVry4OOVYBWW/SxnwhLpMPJew9/W+pZALqpfY8BQe6yTHNTxlDswSkY2NqGmVigenIRLaA=
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
Subject: [PATCH 21/35] drm/amdkfd: HMM migrate ram to vram
Date: Wed,  6 Jan 2021 22:01:13 -0500
Message-Id: <20210107030127.20393-22-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb70e9d4-c7dd-4cc3-f332-08d8b2b8bddd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44089D9112F1A7116EDA91B092AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PgKCwpHu+9FTLQ1JoTXo5AzBSN0NT8Rb+uxgKfEllZ7ZZy4rwrxewggr9TJa0oFENce3tqBbJdgCUQqpn8UXk1KEH7Oqk37IPtlL0Tx/4ZkavoAgEIHSGD3pqKxBjYMqYce1/hmfbncHja4UreOHuMkTUijZ25k628Xez5CDxOuLlOafF71dzAuDgQY9/epFdC6Jdmp68YVZ6jZwaxfBx+Q36LOyb24MB+U3Q69CVg0borh5q2NNqbSlEzaFBpRogj9W63lcPrseA0sG1tbmkki2F6uCyW3ejkxWocWyi5OmxVkUgkhYLaTquYMOvhOXnozfqUHOP3DDfgtqzKlVJlFFwVNedqlUU3rhoX7RATFJp0T9go6dIFEIorYv5EpktnapLrNYCh9VOy/UJHQqQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(30864003)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H9GfRSQZGafAMOA/J1rqGEZi9GRtFgk4W9Zw5lHpju/4OnV1Ugl989ioZv70?=
 =?us-ascii?Q?iphQc+5BSAzOULZSpTg8zw0bK3BEoo2TzMGZzojL1C4QLBV5zTsIN/0i5EN0?=
 =?us-ascii?Q?Gn7kAGAoN1BmQbpxRIn2xH810RidPfobcrfFswKX85ItNiA0dseLC+Q5Y3bs?=
 =?us-ascii?Q?yc7uvOFM2qaZMFZr6hqVMu0sG3LzYJ/RK8QaI70Mkj90VmHMUP3gn6XEJTd/?=
 =?us-ascii?Q?K3V+7ruW+2OXRHzM4ND/05E9SdpImi2XAQJf+GYOW6K3MunSVJVXcGNweHDZ?=
 =?us-ascii?Q?d2dYpGcAbUGzoByatHc1i05ftOAgFVcUv9YMwT3UpALmIKXoCm2ELPN/B0tN?=
 =?us-ascii?Q?ZE39gRuPuZPTv8eH3aBu2Ne8fdjSmOCM/zozh0tp80e0oz2hL2VQMM/7E8Dr?=
 =?us-ascii?Q?mfNrcer4aEHjEQdHPUpGkwCkpsnzd7pyQTzu79UsAfc+BNmT6Zl6EXREyZmO?=
 =?us-ascii?Q?eT6IeL7xfyNDXRHBBdvcO1szTR+Vmtib8G8oeFI2xu7sS8oLNqnBEEPuhaJX?=
 =?us-ascii?Q?cyXqu/5gW831NBHmi5ENAbPUniAssTAWM5v0/NBlVFa+cm7xldsIfCmLYcmx?=
 =?us-ascii?Q?aTRdf89UuOfnCH9KXT3Yt4TN+Z2g9DPeKB3G+gvG2012v357iPECpiNQwjjT?=
 =?us-ascii?Q?UISe7iV4h0X+m5gzoqW1CwBXzo1uwi5V4QhCp7UiEMSxF+tJAof7uII8O+yl?=
 =?us-ascii?Q?UPyKI6JwwALPQ9n7AEreCesnIgPcVIkSlv5Y4UIdXDx9qbKMLmpYmXbnf5Kt?=
 =?us-ascii?Q?EvDuztGuephi+gkZ29A6i2xFTS87ITpKeZH2JnaqKK9BtEtkg++FgtvzyWZI?=
 =?us-ascii?Q?Ioyb+rZvFOWohpK0C3MJSCB3po055OgXHQPUoIFsxDMatIs+hS8ZLwf7Ux+i?=
 =?us-ascii?Q?RkdEarkqy6ExFJ1t/r+Vuy9+fE+bWr+6E0ZrS3p7gM4Gcny91G1KuqNmE2bX?=
 =?us-ascii?Q?jGEa0shdv3NtCg56YSyHyXf+VTIVho99vA2jijpqUjyd4mrSl5qhPnzTsk3n?=
 =?us-ascii?Q?NjNU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:00.1245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: bb70e9d4-c7dd-4cc3-f332-08d8b2b8bddd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjImvEuNHBEkIQhfAqIC2OJtNdtC3k8rn/GVoPGzNhAkTwzzoa8rGKOpgUtVpnbrPk24cMNkcsn2GUaFoaJHBA==
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
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 265 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 175 ++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   2 +
 4 files changed, 436 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index f2019c8f0b80..af23f0be7eaf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -204,6 +204,271 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
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
+	return (addr + adev->kfd.dev->pgmap.res.start) >> PAGE_SHIFT;
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
+			 struct migrate_vma *migrate,
+			 struct dma_fence **mfence)
+{
+	uint64_t npages = migrate->cpages;
+	struct drm_mm_node *node;
+	uint64_t *src, *dst;
+	uint64_t vram_addr;
+	uint64_t offset;
+	uint64_t i, j;
+	int r = -ENOMEM;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last);
+
+	src = kvmalloc_array(npages << 1, sizeof(*src), GFP_KERNEL);
+	if (!src)
+		goto out;
+	dst = src + npages;
+
+	r = svm_range_vram_node_new(adev, prange, false);
+	if (r) {
+		pr_debug("failed %d get 0x%llx pages from vram\n", r, npages);
+		goto out_free;
+	}
+
+	node = prange->mm_nodes;
+	offset = prange->offset;
+	vram_addr = svm_migrate_node_physical_addr(adev, &node, &offset);
+	if (!vram_addr) {
+		WARN_ONCE(1, "vram node address is 0\n");
+		r = -ENOMEM;
+		goto out_free;
+	}
+
+	for (i = j = 0; i < npages; i++) {
+		struct page *spage;
+
+		spage = migrate_pfn_to_page(migrate->src[i]);
+		src[i] = page_to_pfn(spage) << PAGE_SHIFT;
+
+		dst[i] = vram_addr + (j << PAGE_SHIFT);
+		migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+		svm_migrate_get_vram_page(prange, migrate->dst[i]);
+
+		migrate->dst[i] = migrate_pfn(migrate->dst[i]);
+		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
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
+	if (!r)
+		goto out_free;
+
+out_free_vram_pages:
+	pr_debug("failed %d to copy memory to vram\n", r);
+	while (i--) {
+		svm_migrate_put_vram_page(adev, dst[i]);
+		migrate->dst[i] = 0;
+	}
+
+out_free:
+	kvfree(src);
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
+	migrate.src = kvmalloc_array(npages << 1, sizeof(*migrate.src),
+				     GFP_KERNEL | __GFP_ZERO);
+	if (!migrate.src)
+		goto out;
+	migrate.dst = migrate.src + npages;
+
+retry:
+	r = migrate_vma_setup(&migrate);
+	if (r) {
+		pr_debug("failed %d prepare migrate svms 0x%p [0x%lx 0x%lx]\n",
+			 r, prange->svms, prange->it_node.start,
+			 prange->it_node.last);
+		goto out_free;
+	}
+	if (migrate.cpages != npages) {
+		pr_debug("collect 0x%lx/0x%llx pages, retry\n", migrate.cpages,
+			 npages);
+		migrate_vma_finalize(&migrate);
+		if (retry++ >= 3) {
+			r = -ENOMEM;
+			pr_debug("failed %d migrate svms 0x%p [0x%lx 0x%lx]\n",
+				 r, prange->svms, prange->it_node.start,
+				 prange->it_node.last);
+			goto out_free;
+		}
+
+		goto retry;
+	}
+
+	if (migrate.cpages) {
+		svm_migrate_copy_to_vram(adev, prange, &migrate, &mfence);
+		migrate_vma_pages(&migrate);
+		svm_migrate_copy_done(adev, mfence);
+		migrate_vma_finalize(&migrate);
+	}
+
+	kvfree(prange->pages_addr);
+	prange->pages_addr = NULL;
+
+out_free:
+	kvfree(migrate.src);
+out:
+	return r;
+}
+
+/**
+ * svm_migrate_ram_to_vram - migrate svm range from system to device
+ * @prange: range structure
+ * @best_loc: the device to migrate to
+ *
+ * Context: Process context, caller hold mm->mmap_sem and prange->lock and take
+ *          svms srcu read lock.
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
+			 prange->svms, prange->it_node.start,
+			 prange->it_node.last, best_loc);
+		return 0;
+	}
+
+	adev = svm_range_get_adev_by_id(prange, best_loc);
+	if (!adev) {
+		pr_debug("failed to get device by id 0x%x\n", best_loc);
+		return -ENODEV;
+	}
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last);
+
+	start = prange->it_node.start << PAGE_SHIFT;
+	end = (prange->it_node.last + 1) << PAGE_SHIFT;
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
+	prange->actual_loc = best_loc;
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
index 8a4d0a3935b6..0dbc403413a1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -30,6 +30,7 @@
 #include "amdgpu_xgmi.h"
 #include "kfd_priv.h"
 #include "kfd_svm.h"
+#include "kfd_migrate.h"
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
@@ -120,6 +121,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->svm_bo_list);
 	atomic_set(&prange->invalid, 0);
+	mutex_init(&prange->mutex);
 	spin_lock_init(&prange->svm_bo_lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
@@ -409,6 +411,11 @@ static int svm_range_validate_vram(struct svm_range *prange)
 		 prange->it_node.start, prange->it_node.last,
 		 prange->actual_loc);
 
+	if (prange->mm_nodes) {
+		pr_debug("validation skipped after migration\n");
+		return 0;
+	}
+
 	adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
 	if (!adev) {
 		pr_debug("failed to get device by id 0x%x\n",
@@ -428,7 +435,9 @@ svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
 {
 	int r;
 
-	pr_debug("actual loc 0x%x\n", prange->actual_loc);
+	pr_debug("svms 0x%p [0x%lx 0x%lx] actual loc 0x%x\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last,
+		 prange->actual_loc);
 
 	if (!prange->actual_loc)
 		r = svm_range_validate_ram(mm, prange);
@@ -1109,28 +1118,36 @@ static void svm_range_restore_work(struct work_struct *work)
 			 prange->svms, prange->it_node.start,
 			 prange->it_node.last, invalid);
 
+		/*
+		 * If range is migrating, wait for migration is done.
+		 */
+		mutex_lock(&prange->mutex);
+
 		r = svm_range_validate(mm, prange);
 		if (r) {
 			pr_debug("failed %d to validate [0x%lx 0x%lx]\n", r,
 				 prange->it_node.start, prange->it_node.last);
 
-			goto unlock_out;
+			goto out_unlock;
 		}
 
 		r = svm_range_map_to_gpus(prange, true);
-		if (r) {
+		if (r)
 			pr_debug("failed %d to map 0x%lx to gpu\n", r,
 				 prange->it_node.start);
-			goto unlock_out;
-		}
+
+out_unlock:
+		mutex_unlock(&prange->mutex);
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
 
@@ -1144,7 +1161,7 @@ static void svm_range_restore_work(struct work_struct *work)
 
 	pr_debug("restore svm ranges successfully\n");
 
-unlock_out:
+out_reschedule:
 	srcu_read_unlock(&svms->srcu, srcu_idx);
 	mmap_read_unlock(mm);
 	mutex_unlock(&process_info->lock);
@@ -1617,6 +1634,134 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
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
+	struct amdgpu_device *bo_adev;
+	struct amdgpu_device *adev;
+	struct kfd_dev *kfd_dev;
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
+		kfd_process_device_from_gpuidx(p, gpuidx, &kfd_dev);
+		adev = (struct amdgpu_device *)kfd_dev->kgd;
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
+		 p->xnack_enabled, &p->svms, prange->it_node.start,
+		 prange->it_node.last, best_loc);
+	return best_loc;
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
+ *    a. svm_range_validate_vram takes prange->mutex
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
+		if (!prange->actual_loc && !prange->pages_addr) {
+			pr_debug("host access and prefetch to gpu\n");
+			r = svm_range_validate_ram(mm, prange);
+			if (r) {
+				pr_debug("failed %d to validate on ram\n", r);
+				return r;
+			}
+		}
+
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
@@ -1675,6 +1820,9 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	}
 
 	list_for_each_entry(prange, &update_list, update_list) {
+		bool migrated;
+
+		mutex_lock(&prange->mutex);
 
 		r = svm_range_apply_attrs(p, prange, nattr, attrs);
 		if (r) {
@@ -1682,6 +1830,16 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 			goto out_unlock;
 		}
 
+		r = svm_range_trigger_migration(mm, prange, &migrated);
+		if (r)
+			goto out_unlock;
+
+		if (migrated) {
+			pr_debug("restore_work will update mappings of GPUs\n");
+			mutex_unlock(&prange->mutex);
+			continue;
+		}
+
 		r = svm_range_validate(mm, prange);
 		if (r) {
 			pr_debug("failed %d to validate svm range\n", r);
@@ -1693,6 +1851,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 			pr_debug("failed %d to map svm range\n", r);
 
 out_unlock:
+		mutex_unlock(&prange->mutex);
 		if (r) {
 			mmap_read_unlock(mm);
 			srcu_read_unlock(&prange->svms->srcu, srcu_idx);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index b1d2db02043b..b81dfb32135b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -42,6 +42,7 @@ struct svm_range_bo {
  * struct svm_range - shared virtual memory range
  *
  * @svms:       list of svm ranges, structure defined in kfd_process
+ * @mutex:      to serialize range migration, validation and mapping update
  * @it_node:    node [start, last] stored in interval tree, start, last are page
  *              aligned, page size is (last - start + 1)
  * @list:       link list node, used to scan all ranges of svms
@@ -70,6 +71,7 @@ struct svm_range_bo {
  */
 struct svm_range {
 	struct svm_range_list		*svms;
+	struct mutex			mutex;
 	struct interval_tree_node	it_node;
 	struct list_head		list;
 	struct list_head		update_list;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
