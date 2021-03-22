Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6502C343F09
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3958689F35;
	Mon, 22 Mar 2021 11:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA0F89F31;
 Mon, 22 Mar 2021 11:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijXY6qbaeGqKF/aqaz6GbAEHK8JtnVL1wqGKNqa/ULLt7VJ33ZNrGD0lE7J9vjzX6Aw3Nw10UwRehK3lX6BSnVyBhcMGEx8oF0P71MLVP8dEAcCiXdRkeO8SqsZW8DNkPKYxdbsSsmcZVvyS996Uamqh+PQawVaApaHZLuX4k72Vzb/FrPJDGvAe04pCr2pbUNAH6c6GoTcU6IhX//YwWywuYa5tIkVT7fRQwfc6uEVZ3MHW3uuu/Sz1VXCC8l/l41tdejbFJWh1qBlPtfIZPuaXhj+sEogNAJQbUPShHg90upyiNFx0kA3HTSoUl/Srs1L8HoX9WlimhEdoVcLL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=372XeK1TNBR/VkRyM3gexURtcbsx3/Q3DFuH+oe1zVI=;
 b=V1isjyFzxftQXdCpYvDXGWu04cWfQ21VYcs6YRJhqe6Bq37x5VNFbydRHVROK/sDHT/RZpQUl9/dFbRhSvzI/LHLnwiq+ruVzXq9pQfFw+ga27e/BRjveIE0iTyjqxLHZ6cm/xSaWdOZW0dSurSUjrFtJc3e/Fbthlp205th5JecOKdrpSNU6x08QOspIiZxRmNtOT8yzndrWgIfFj6qYipnSmi0Ec5r7j0cIl7ly8LloWp+yyTbC+ytD5U9y1Rs6p3EUYQ5SJ/8seLnXB5kIxjHpsNunKyVrtD7YlMg6FLzbxuCUrs46Cp5JEIkslK71PdC7ufagi6Ia4d/D/7pLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=372XeK1TNBR/VkRyM3gexURtcbsx3/Q3DFuH+oe1zVI=;
 b=vCbpBsggO5VBwRYnYHky5tKgYpzEGyv2F3FxtangnGx4WtLmYSMqks7kSeiW0ajEQXEF5TS2cLfp7KGktFj0Xmd+qhH/UyQOm0CiYL4NZjoPxgLLLKcQYqTNPfcWzv4RXq4TDun3EmfQPAJhVTUMWNmsyAVEd5PeeMnJmlJ2hh0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:39 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:39 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/44] drm/amdkfd: HMM migrate ram to vram
Date: Mon, 22 Mar 2021 06:58:34 -0400
Message-Id: <20210322105900.14068-19-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3fb0281b-4fff-4e2b-b41b-08d8ed22b4df
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB367891486088B2F0A9FB167D92659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OiXwQmAe6u/ajBYSIHa56uFgCRJTvi7vCUXeBklqYRj20xMm8iVhw77acY5XJlzJgeW/Bb0RROUb8EVY+IkhWvpH20PO7VRgmBZzB9CFKT8hHN+aIHllL1fCxkSwjvh3yrvzC4Ogbaf1hCf9WYPEX6Xj6nJZNcI9wFO4/8T6rKT1Jt1bJ/MD4tWxp8nfURroSm9HHYEeErS1Xlw6f8KK9aAQLoIz0iUjFZ5eL/7sZip6djQK3yFiaM4EqvCxYvOMdBk9zbNojxrZcapLNFjfZe0WQSFdCHDVtqHh8w3L1xYklCiKOnMKMuqqDs0k8smoWGL/OrCzhTqy2g1A4USibeeTJExuqUdIbdCfg1GhTdp0L3s1tZ5WdCj+QHRey2eQiCYzR3r5drf7P/7tLdchFHvgghenBVXSCsKx3dLAYQ6FM3Js9uqqvkJeWHV7TK4VQgRl6GILbv52Vc5eJzC7V8IHAgLV3PRGHkjU8pyFsVzLNk8uHxGhncfinyyQXHf+SIarhXK9oGYOT5Su80baP78nwXgL8/dxQa7zIEIe9tfT73YqGx12nOLdPbJ+BZDZSxv2t0Ze+rGPb1zzzrHvz1wDofGgeR928H3IMZ738BIzgoRaDUf0MrH3j5mTRp4l4TCB7XMocjAZ7JlcC77G/LbnuKrpUxRErssz61QhM+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(6486002)(1076003)(36756003)(30864003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?P2tZwFm5uRv9PjKSoNxICMLn29CAXTqbOlBz4JiN3q8edRYcfJb6rZZdIfyV?=
 =?us-ascii?Q?FlRCtSIa7ZQ3cfL/Jnvmb+2AjQgQvvWpCbSqgXys/W/Fz0weUPwgb6vtnyvk?=
 =?us-ascii?Q?LP9lBvZpgiD9WM/skC+Mlv7eKlI2reVazWiCcH4ocuubtIOlwrFwQhNylRZB?=
 =?us-ascii?Q?Z2VuwNb4cn1NXCKF2ZMsNLPTiiG4YaU4QQKsMBjxlCzkUJZzGuvwCwh5Y8Oq?=
 =?us-ascii?Q?ZSneyiwS5AkCAROJuBpqjrFhSdi8O5i4ivHGh2/Q3R5DsXv9cWx7SOiKhvv8?=
 =?us-ascii?Q?gk68331fwVIYJgwBbs0oVPL65TXWJBma9eBjupTFyDSrpIts9oRv28Uqgudm?=
 =?us-ascii?Q?0RGOYxyuswSAVILX2NVDTyXn0cbYRpT/iwL2O/ZJiFhF3DLXxh1oRtppaKkH?=
 =?us-ascii?Q?Gd8WuOrYVyeCEc/QROJ5X6vIr4XV2OofZJhpp8N0FaKKhhBUHZAuepfZRNOV?=
 =?us-ascii?Q?T//bOxHNv4WpRZMzBKyqpSrrtqiTsBE9Ycc15snDTZLp8iTE+Vlxri6XytaP?=
 =?us-ascii?Q?bxn0OGMDv25drG6+w6L/ZJhRfVbYQ4qSm0rRu0qMIt7V4hAlecvJjKGK0ZQk?=
 =?us-ascii?Q?clSxH87LVv3lwzZLgtzedEW2PvmSdG4z4dZql7I6+Tqm3//NpTDGQNPp3G00?=
 =?us-ascii?Q?+o7g1PA0I6IMDEZOUboCVPreOrWhzI6e5CBAQJqwWYTp+fmxJITDJRm5VzsQ?=
 =?us-ascii?Q?Xx4ZHmqKNR1TtmgU+As73e0Fl/4ZVUaHvoF4UuQIKkT9YvSQ4SL/AFrlBCYe?=
 =?us-ascii?Q?ImckoBj06anqqE5QJXT8Zf9DIAkFi3/I1FOfUfTXfuiaBEaoxiABNnF4s7si?=
 =?us-ascii?Q?IbJFlmRm0jk5M/UZ9qpGYgLPKU1JyOcbqPHzElTpYp1g5IDU8/J8piMgCsvh?=
 =?us-ascii?Q?MxEV9TMwlVT+tGKODRhna4JLHmcb+fYGNHGG2E2Nhjb9Txmszx+8lbiLZnEp?=
 =?us-ascii?Q?z9S4lYv9efsLQvscGJ7LTRwPDOOnj3t31qWyLP1Co9Qp2MaXMx/Spshgdt83?=
 =?us-ascii?Q?kUw5KCtD1gFcxTPjJA/C3Rl4Y4zPCRiYW1rCPPOd9hUCl6dlPh1Rs8QPuMk1?=
 =?us-ascii?Q?7iHc9mkviR6gEr+V3w79LhTzmJaBsWm+Bu+xMQvvR8K+6FcNKiIbqOejhBpR?=
 =?us-ascii?Q?ZOMYIGksacfiylCz4TPe13O1WLEMth7gYDBld0xQLbW8Njn/sllp7oO7I30w?=
 =?us-ascii?Q?nxztlA3YBaCSxGaklga78wXpQkQZwgWRMY2M1yXVv6z4w7a7EnWRc6b2SxYl?=
 =?us-ascii?Q?+/LMzfca4DA/GDSt+MT4euAXOgI4fPsT+lYBbYwo7xIvfJtuD1FmXwjlq02l?=
 =?us-ascii?Q?8Y0pbMzmOq2L7vqCxYZbddty?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb0281b-4fff-4e2b-b41b-08d8ed22b4df
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:39.4236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6fuQDBjBC0nOEPC0s1WfPxrnEHO2X4FQedUrsxADfCDFBvohBn7GMXDU7l8Z0XlcyXlUManRS7yrNYI0i2HKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 278 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 187 ++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   4 +
 4 files changed, 460 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 2a6824ddae88..668c360be0bb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -204,6 +204,284 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
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
+	r = svm_range_vram_node_new(adev, prange, false);
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
+		spage = migrate_pfn_to_page(migrate->src[i]);
+		src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE, DMA_TO_DEVICE);
+		r = dma_mapping_error(dev, src[i]);
+		if (r) {
+			pr_debug("failed %d dma_map_page\n", r);
+			goto out_free_vram_pages;
+		}
+
+		pr_debug("dma mapping src to 0x%llx, page_to_pfn 0x%lx\n",
+			 src[i] >> PAGE_SHIFT, page_to_pfn(spage));
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
+	kvfree(prange->pages_addr);
+	prange->pages_addr = NULL;
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
index de5777330d23..cf3d2c203007 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -30,6 +30,7 @@
 #include "amdgpu_xgmi.h"
 #include "kfd_priv.h"
 #include "kfd_svm.h"
+#include "kfd_migrate.h"
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
@@ -241,6 +242,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
+	mutex_init(&prange->migrate_mutex);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
@@ -502,6 +504,11 @@ static int svm_range_validate_vram(struct svm_range *prange)
 	pr_debug("svms 0x%p [0x%lx 0x%lx] actual_loc 0x%x\n", prange->svms,
 		 prange->start, prange->last, prange->actual_loc);
 
+	if (prange->ttm_res) {
+		pr_debug("validation skipped after migration\n");
+		return 0;
+	}
+
 	adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
 	if (!adev) {
 		pr_debug("failed to get device by id 0x%x\n",
@@ -521,7 +528,9 @@ svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
 {
 	int r;
 
-	pr_debug("actual loc 0x%x\n", prange->actual_loc);
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] actual loc 0x%x\n",
+		 prange->svms, prange, prange->start, prange->last,
+		 prange->actual_loc);
 
 	if (!prange->actual_loc)
 		r = svm_range_validate_ram(mm, prange);
@@ -1237,28 +1246,36 @@ static void svm_range_restore_work(struct work_struct *work)
 			 prange->svms, prange, prange->start, prange->last,
 			 invalid);
 
+		/*
+		 * If range is migrating, wait for migration is done.
+		 */
+		mutex_lock(&prange->migrate_mutex);
+
 		r = svm_range_validate(mm, prange);
 		if (r) {
 			pr_debug("failed %d to validate [0x%lx 0x%lx]\n", r,
 				 prange->start, prange->last);
 
-			goto unlock_out;
+			goto out_unlock;
 		}
 
 		r = svm_range_map_to_gpus(prange, true);
-		if (r) {
+		if (r)
 			pr_debug("failed %d to map 0x%lx to gpu\n", r,
 				 prange->start);
-			goto unlock_out;
-		}
+
+out_unlock:
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
 
@@ -1272,7 +1289,7 @@ static void svm_range_restore_work(struct work_struct *work)
 
 	pr_debug("restore svm ranges successfully\n");
 
-unlock_out:
+out_reschedule:
 	mutex_unlock(&svms->lock);
 	mmap_write_unlock(mm);
 	mutex_unlock(&process_info->lock);
@@ -1575,6 +1592,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 		list_del_init(&prange->deferred_list);
 		spin_unlock(&svms->deferred_list_lock);
 
+		mutex_lock(&prange->migrate_mutex);
 		while (!list_empty(&prange->child_list)) {
 			struct svm_range *pchild;
 
@@ -1585,6 +1603,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 			list_del_init(&pchild->child_list);
 			svm_range_handle_list_op(svms, pchild);
 		}
+		mutex_unlock(&prange->migrate_mutex);
 
 		svm_range_handle_list_op(svms, prange);
 		mutex_unlock(&svms->lock);
@@ -1867,6 +1886,135 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
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
+		 p->xnack_enabled, &p->svms, prange->start, prange->last,
+		 best_loc);
+
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
@@ -1937,17 +2085,34 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
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
 		r = svm_range_validate(mm, prange);
 		if (r) {
 			pr_debug("failed %d to validate svm range\n", r);
-			break;
+			goto out_unlock_range;
 		}
 
 		r = svm_range_map_to_gpus(prange, true);
-		if (r) {
+		if (r)
 			pr_debug("failed %d to map svm range\n", r);
+
+out_unlock_range:
+		mutex_unlock(&prange->migrate_mutex);
+		if (r)
 			break;
-		}
 	}
 
 	svm_range_debug_dump(svms);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 8e2b63a134f1..aa6edc3efcb8 100644
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
@@ -93,6 +94,7 @@ struct svm_work_list_item {
  */
 struct svm_range {
 	struct svm_range_list		*svms;
+	struct mutex			migrate_mutex;
 	unsigned long			start;
 	unsigned long			last;
 	struct interval_tree_node	it_node;
@@ -147,5 +149,7 @@ struct amdgpu_device *svm_range_get_adev_by_id(struct svm_range *prange,
 int svm_range_vram_node_new(struct amdgpu_device *adev,
 			    struct svm_range *prange, bool clear);
 void svm_range_vram_node_free(struct svm_range *prange);
+void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
+			 unsigned long offset, unsigned long npages);
 
 #endif /* KFD_SVM_H_ */
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
