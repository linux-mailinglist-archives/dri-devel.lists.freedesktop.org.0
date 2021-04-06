Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC4354A70
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59D66E525;
	Tue,  6 Apr 2021 01:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602906E245;
 Tue,  6 Apr 2021 01:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAOsSUN028kd0fqUOiv3fIQsRde2P78kBheh/8TKFdS4zQwRZIB5jKIRh+yyUD5F8nkDg1zhFvIVtXHEHoywRDomvVOUU75LwW+zDjaoTXNxQS9UMIh1BU3pV2sy6I9NhA9sXHuDHebwhYDJMc/WEGoOC43jawNeGu07MQPA3DRy/7cDA8LWM3M0Z0XJwjuAAxm2IU9IoALlBKmDBEKdecu0N5yleH0gyUr8PElYi0b7mvy3wSn3HHBgtaHsjwzajddUPRCKcO7KEutTlsdTYRPN90RWEAdU5vvb2RFHOAhyEhxuFLzDOtsYF+eomvmeQTkdGFqMLA4Fe7GUjM6W0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epnr2o3ckkyAyTof82XNz9mzk0sfIo+15QNyMhLH534=;
 b=ah9Puk65KkiPolo9e+q1/qQl+iLwGF4o0tNm8DW/foRuabGDOf3I3hOmVJbrZ7wM8ZjR5MtRp9o2Zfb+UIY46BOdG3YMfytTTC6z0GQqp/D95YLjQkgaVF8IwVswPo3E+f8ex/sZDUym0vnHNgSCsOPwz9xuwxnj7AzpPA9eWeuVM2GgSQUhlqH9PBuIGXNYnkUDNH+cEAjBzj3o1rQnFPrn/x8AmHkSGQJUTvug8iGZHvG3MTSyLpAPxjZslPnG+iOwmL4ZG/1fUPlnX8KI9f+ZpnTAU29ddr9KSNivaWkLhixssBBkNVbvYP03WgzrT2G1NPewEvb5Rec88Dla1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epnr2o3ckkyAyTof82XNz9mzk0sfIo+15QNyMhLH534=;
 b=ocoWDXQw42SWi0xhnQuLgFIOaxtboxhNh5omeQpxCrt6pkwTwE6babtWGD5jTR9mg8+vah6DXyGwtLAK28uWASTer16/7IXe3ipSWrSxHBSnGWvkx3Ox8NFdkVKEt7V+7UpIsDCADk5NtZLyOzwMXhbwL9PFx4mgbOrr5WahMaQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:47:04 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:04 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/34] drm/amdkfd: HMM migrate ram to vram
Date: Mon,  5 Apr 2021 21:46:14 -0400
Message-Id: <20210406014629.25141-20-Felix.Kuehling@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c1658af9-e6f2-4d4d-d96a-08d8f89de113
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB379286AE065F438F48C542F392769@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A2I12k8YYwTqQRUNtCsVkfr9XgAf9EFeKOg4atmyFf0Um1Tq7GWzqdeqGHqj7JRjVlk9P2XtDc4MZ7Wg1xs+7guJM0ZyxVlTR0W/QK2ei/+o7VJt2bboBPt28+cu1VGhY1nRrwpjY+GHT4iZ40+sT2nuOakjjvnjnUPOIVhm/n2k/3i1ufW773dIflgS1hymhfbacOMb+Y4yCcemxai/E5Ld5gUR3rxGkXkzOoriW8XJgFuuPGn76YD0hxl3DIlQO9OK2KhJgSSuKWZ47KDKZynV1j4Qfy2D+zLlyDqi4Kr10eFEPR2759dmazjbFLTHvK22yGkWk7MhmTOC4m78A/Lfs62RCb71kGmB12/DzYdi+jCFsYzaoqgCcmTnb/bnnTE4JhK4/X8n1sFJcxrMx5HfmVHyBGGRL+zxE8rFV7oUo/WYYP8iWJU42NIQLhQgsULbgt5LxEgiwvyyZd430D4nOsnzMF5EAbZcjM0RW3CiyCoDgD1Q/Z+HkUwOsvHZREX++0JdHqz5zoCZgAEP3+WJcoCVsNLvrGGLZhyEVWpMQ1sbgIxl2ZMVWU54+4ci3eajeP7bPQfj1AuKYJtoMS7kGruKC6CqK0kVxYs76QLd51++4SLH+16ZA8205S+iN/HKGlkwvftHQ4auIuStNaFXs7CNDqCpfB76xc7tVkw1yqkHp1aX8ArWVbD5XPBl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(316002)(66476007)(26005)(8676002)(16526019)(83380400001)(186003)(1076003)(30864003)(4326008)(8936002)(38100700001)(2906002)(450100002)(956004)(2616005)(36756003)(6666004)(478600001)(7696005)(52116002)(66946007)(86362001)(66556008)(38350700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mE3RuvIGxVcD0xN5Tu4Qtd/muGAYaOHsaYlXvcn11+XohsUBw3ZyH0Ck5fH0?=
 =?us-ascii?Q?3eR1oYrynNq4+I4gjk2wOesJg35IOSJhwO9xfnGAbHDoHTUHKy1p4+J/qPXu?=
 =?us-ascii?Q?eaUfn+KHRUeN4yu09fwszZoVB2ipuLZJVWNb4fhu0IAaGnH4wuHSWkZ2c0Uk?=
 =?us-ascii?Q?+XtDKW8qnZyJIbk9QF/5+E1ZfN+ZLVhwXjSc5EVpdkiyF0VqqryF95JXqFwO?=
 =?us-ascii?Q?brdYUmXmst8gaSuFrGvbHlHEIgEcKAAgkvjedLxOHn0IOyg65VkdmbKqfIVR?=
 =?us-ascii?Q?zDH8Gl2YgenAXMsnMhRkySTiLUhqbvbmBdZSWhcARGSUqZ4fE03MxsyahP6z?=
 =?us-ascii?Q?qJDa8C5ZcOytH7FLTWmnVsc51EwFPAXAOx4Pf5Z5aH0Fa15y4SrxQ/irRVqH?=
 =?us-ascii?Q?flzvzazwMPiIfPE7FurnJLaz28KHyRKolQpk6Zz+qqhKdI3C2bwEN204opKX?=
 =?us-ascii?Q?mRT9LoEMdXVZvJapfp7+ED2pg2aTYheAFne6DIOxqtyzV82UQEhThdiiN2eo?=
 =?us-ascii?Q?BJKH3X+4LjB8gQUlb5OOdTcgoNuBmMv+tCG75llCmhEzEQbXRZuKdSjJ5LVO?=
 =?us-ascii?Q?5DllDyogB7Etq8IfRXPffJis59vcmves19LikvSxj12/IGTWD9bd5ISlvgps?=
 =?us-ascii?Q?7rrNoa/KvThEAG61i+yoNPqKdvMcKQUJ+I7SXwSliHmlnwTGuVAlO9TQ4h6W?=
 =?us-ascii?Q?ISPfaMQQKh6cJqb6bJwPuXoHH7Y8EwYV3iGlH8htJiHn/49IWFC3fZuDoo8U?=
 =?us-ascii?Q?j13wb11/5+oaSAQEkYrwmhb9+zrXVtKmBPPRT0apMUVNvc7i3WgI/RJGo/KD?=
 =?us-ascii?Q?5IyVDA1WOmbBuUsgX6GIySn81agJSPjNJvy06H+ens83sZMgcG+uoueQHje+?=
 =?us-ascii?Q?QoxpoikawEoFDsOzaxziveCdkAQ9jobBqCvaDYndEmmAqDKsW2l3aqQjjuI2?=
 =?us-ascii?Q?dJ08d0kVY51PK3kbjacbgOC2Y3ZIdGY5/7HO4+j1yL/rwgA1NTkbxa+VVcG3?=
 =?us-ascii?Q?Y0ZmwOM/uk2aVFvsaydz1XMaC5TCGF6YMBj8Nkpt02cwVZ74cteaSaBCuYL0?=
 =?us-ascii?Q?Ni1yobFhKqdLkwy1ogODXaEi9kk6aqbNXstVNzubNQkubUO560cQkyV8fY43?=
 =?us-ascii?Q?55chqMuwdfMKzNKwZTDYJXqXzeemgpuz+18oZKxO1qoVQWlPTMP/Ite2QySt?=
 =?us-ascii?Q?QXANIPnUOHJh4IOu+gUrYcAG6+PhDB+uZDp92Xy6t/3Dg4cOqG9bnWkzvzQB?=
 =?us-ascii?Q?8W/sYM41lwrrNC1vgf7g7UQcidm1Xrrhtzw5bFfeoZTsL/3L+eOQ4tTs5rg7?=
 =?us-ascii?Q?2gNtL1Jvk2q7CqVJEajSsR1V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1658af9-e6f2-4d4d-d96a-08d8f89de113
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:04.4784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwrDTeeF71ZBaB+3BCgAU1inqyzaEoyxQoU8hMrESD0cIcdscCq2fa1hakk1QUd287Z9ZEtZKvRHug2WvLbAvg==
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 305 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 201 ++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   7 +
 4 files changed, 502 insertions(+), 13 deletions(-)

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
index d903e003ac9f..bc3d761ba421 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -30,6 +30,7 @@
 #include "amdgpu_xgmi.h"
 #include "kfd_priv.h"
 #include "kfd_svm.h"
+#include "kfd_migrate.h"
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
@@ -176,8 +177,8 @@ svm_range_dma_map(struct svm_range *prange, unsigned long *bitmap,
 	return r;
 }
 
-static void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
-				unsigned long offset, unsigned long npages)
+void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
+			 unsigned long offset, unsigned long npages)
 {
 	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
 	int i;
@@ -194,7 +195,7 @@ static void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
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
@@ -1242,6 +1245,8 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 			pr_debug("failed %d to dma map range\n", r);
 			goto unreserve_out;
 		}
+
+		prange->validated_once = true;
 	}
 
 	svm_range_lock(prange);
@@ -1333,21 +1338,28 @@ static void svm_range_restore_work(struct work_struct *work)
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
 
@@ -1361,7 +1373,7 @@ static void svm_range_restore_work(struct work_struct *work)
 
 	pr_debug("restore svm ranges successfully\n");
 
-unlock_out:
+out_reschedule:
 	mutex_unlock(&svms->lock);
 	mmap_write_unlock(mm);
 	mutex_unlock(&process_info->lock);
@@ -1653,6 +1665,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 		list_del_init(&prange->deferred_list);
 		spin_unlock(&svms->deferred_list_lock);
 
+		mutex_lock(&prange->migrate_mutex);
 		while (!list_empty(&prange->child_list)) {
 			struct svm_range *pchild;
 
@@ -1663,6 +1676,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 			list_del_init(&pchild->child_list);
 			svm_range_handle_list_op(svms, pchild);
 		}
+		mutex_unlock(&prange->migrate_mutex);
 
 		svm_range_handle_list_op(svms, prange);
 		mutex_unlock(&svms->lock);
@@ -1961,6 +1975,151 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
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
@@ -2031,13 +2190,29 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
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
