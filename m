Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F332E354A76
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363956E511;
	Tue,  6 Apr 2021 01:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491926E250;
 Tue,  6 Apr 2021 01:47:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc1+8JPd59SNxwQxRq2Ih0fr+B+FTAA4Ob2jgcIi2kHb/JQhEVYoTOBx7UnClxf4RIQhiWeEzHC4ltmS5yisMniHN8TaPcxl/pJr8lQquOsLaQ9of5WgCx7lKB52UbWwFIUJmdXS0mU/a7elsxKRGrSheqcb7Di9TuqNOYd31WreT1tuQGiGUI+Yw1sk4zaijgfm21W8r7snkS2NCZj2fpU8moN6kc3USTXzyy6aX8zWh9VAAO36HfuqD6PGQIZv/3iGPwrZbVxUfoS3g3/zFuRnh/nH2CGwlhr1bW0rnTPpqjgoHTYLeZenDhlBeL1ffxIJ2eWEfofQDnO751H7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdksxvjWwRuQP6qsLcX4Xe5dzbuMiFL89ZluOojqtuw=;
 b=oT0U5glgSQma6qWxMqEgDopDXbPMu+7xFhssxXIhKKJ4ioqJkmcoIClmDgbwDWVBHlqPS6Sb249AJZo2f39+Q/1MunuYud4EU2JRpa4sASga/hRKwAhpeyFTBTXLqr2/6wVM55WKY/Vqg8l58m6Aidy4thntw09ERucA0K7QH0oyIQPOlZAU6IaZR+44qCczl5hHtgEesl/Jn2Y3cFnhuz/06j91QW4stHIusxXAEewhM75D4lZ3h+S6r8AGEIjgKo9vzPFcb4zlL8csh4JF+FVtOC7+Bx0z8JHhqS3q6hoh5XRpu0uPhcP/FyurYaekCEv2piq7rpu+ybTzv6H62w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdksxvjWwRuQP6qsLcX4Xe5dzbuMiFL89ZluOojqtuw=;
 b=BiVE1ihO4SKbH53h7Mxb7SLnQaXIOZ97EDkDrZMXOXZ/j+q20FctfLLMxLRK1YVSEXu1U8icsIuX8qR3ubw+0v4rDALulpyYdIzeeIRklbRMPDGt/MCF1Ffo/WpDIjyz18a5PCWxQeDIuVvEZ3kpxg6q0wa81RmRrIpQaYjZzvk=
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
Subject: [PATCH 18/34] drm/amdkfd: copy memory through gart table
Date: Mon,  5 Apr 2021 21:46:13 -0400
Message-Id: <20210406014629.25141-19-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea675ebb-4cbd-4125-3452-08d8f89de0c1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3792DCFAA2C2883D7E42732492769@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9E1bvBFGC+QypYE9C5RmHNpQGoX5LQYBe7se32ik6P1f8R0g+hCklrPzh57zY7XQ4BtzdbPQwj8lafJoiDzH6hTNZeDI9DlVwr1ousH22ezMHXEfuLrR9dPJmXmJYRnMB4tBschymO7t8NBRc6NXaeRuGQwyPMNe2t23FdfEYzqnrMZ1drRLDxRie5EirD4ZH3dp98F3XoPkrswJ9tarEOa0VmTuajjzjU/pdeh/vPDO6rIzqy08Cs/5Jdv+jjNOSM1+6c3IoBwxs/gEg7o3T8SRqM6sBCfbtTAC7APbakhFtrPJKmFlxT9VcegN9UfhQR03aAZffHUkzzxaQ+t3Nj9dU4NDE3uC28T5TrEXabOWfd/zY6F6lF/oTCVI4kghAWfRWIJJIfHz7y3kNBzaivJze89CRBon/92x/rFfFvjHVt0owSHR9UxEdMUiCPYXuaVlYTQxXsNiPI3qVcc6gG5jl6CloVR4vkEGeoK+VPnphvTZLZF7M3cg0tzwpfW6Zqsq7xU8RsMrAhHqJLb6/c1PSreJ/q1Ezp1gFv1oDSUwllTyzao3XB9T386jGxIHLfGN5ohEL4mxuF/VoRSGKFYQE0WxWcIEKyg4fJeqy6X5yP9chNISBK0rllCZKHwCFXLkfoaONNC0AqFch2uJo5+mbofI58tsZTOUS8da+ayFJ5noCzNR3jfjIWcd+P1d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(316002)(66476007)(26005)(8676002)(16526019)(83380400001)(186003)(1076003)(4326008)(8936002)(38100700001)(2906002)(450100002)(956004)(2616005)(36756003)(6666004)(478600001)(7696005)(52116002)(66946007)(86362001)(66556008)(38350700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?w5sy3HKn5o+j7CdQbp4kDIXEzUXDPaB/jL59byOMyoicqQVvnI9UD3TCpq68?=
 =?us-ascii?Q?aA3y6SzZe2Exqu+n/5pA6N8c5Uj+j7+eUcnG0/xDbiQVZTxWKp307YoHZvBB?=
 =?us-ascii?Q?+QWOQFbP+jTpnJq4/Qx4mM7peyJECB9FraSBTRaVKZCEmEoK2pCtO6CzxwCu?=
 =?us-ascii?Q?EvtFFpU7MEZPxgHXfUGLefklUT8sPLn6CAmmTCFpNy7S6LinHCjqkoKC5GAj?=
 =?us-ascii?Q?nBJ7KmYmocZxPyMW7QbsXhAtNriEyVS7X+9UZtrEYxJ14xgoA0DEvasZE2Qa?=
 =?us-ascii?Q?96Y4vGjyjaj4M2UnjaNuURY24UMPRU6l8FicNhTy5gTzRX8AXssgUq5CLsUH?=
 =?us-ascii?Q?8BKQQdm3fn793eZZz6IA4sAQGfDdA5T/bmbqwU1yyR5BCtXKAEWXpId6b3nw?=
 =?us-ascii?Q?WocChCxMRXwP+UjYJr8UzLjkq+QFMKjW2+PL3pKVe4M9NBum6uf3mantDQiz?=
 =?us-ascii?Q?h+WtFV8+QTkVYekRN7dQQ5qGZ6vyWfTzb03bRRkZFUSPugR4lNLinIjghXvq?=
 =?us-ascii?Q?fiVsWJAxSiJBcsrsXf98pnPfxcSqBHm2IEi+37yYH3xzYWqFwZBi9AQuO33y?=
 =?us-ascii?Q?Vl5aXse51jjkdAqZOkLPBb9E+aYOpUr8JTmpt+vbx4VkxdXHGk3sQkyV6J5e?=
 =?us-ascii?Q?Bb2pzVX0eNjhBtR5pREAeRR0V6NQAeWPuFuKDzhtFHeJieRhRegB9TsHN7rV?=
 =?us-ascii?Q?Un6QLThemTflSeOkA8SjsmCH166f1vsXBHZjG+Q1WIphzBQDn+LEC+Igetr3?=
 =?us-ascii?Q?ZcJ0Er9st39ZsaK/N+PdILNGQ7wEfWZKdL/MYWtDzllFo8bnlmOi/N2+mnJV?=
 =?us-ascii?Q?gwTfKvLGBzqwtgvSR07TXOdsJDxtTx5xzg5zlcS8y/IrhemrcVkypiz0fwQP?=
 =?us-ascii?Q?BvB7lVtMfxCbxt0++KPD9uUApxM/jcW8ZPUvuFhF40BGPMM1A9YlpvSvQbNC?=
 =?us-ascii?Q?fQT4UGTTCGDLs9kjONSZYoZbd09W95HwHersEgRuMFAkFFWFSzBKSv/gk7CY?=
 =?us-ascii?Q?E3EwMuA89LwWMg4b7mAmYP9BKhuMsDBzMCR9B1DnMt14mG7nV/diMxnwPoeq?=
 =?us-ascii?Q?tpA4D6nKlYNtNFJdsZYP/HX0yVZA7qCw4MrMynfe2sdOAKubFAU+1+iKuKuT?=
 =?us-ascii?Q?10A8gVj8HgsC37btAoObcYOS+hRk2Nat3oHJVS4/14imTaYXns8KHf/sTbT8?=
 =?us-ascii?Q?IJ9EbbpX4YZyjLDr7Gvr5YgJu1AvDs6xfLx9hFwVT5YhMv9VmLWe0BJwsfLx?=
 =?us-ascii?Q?QvuPRR+91T1bcq+LDzu4Qa0Unccuszghc6rQUqWIB2U6NYEZxZgXK4w/IQ2c?=
 =?us-ascii?Q?gcpVX6DEHQ/CfNGXkFz32Qm2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea675ebb-4cbd-4125-3452-08d8f89de0c1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:03.8840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDuq/SVS/ltgcnfMoEtcuZTkKCh82vkbd77qO5DvFtiBZx6zjr7kRVGFbWkXDzkT9vFGVNmvepIPDebiloFdsQ==
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

From: Philip Yang <Philip.Yang@amd.com>

Use sdma linear copy to migrate data between ram and vram. The sdma
linear copy command uses kernel buffer function queue to access system
memory through gart table.

Use reserved gart table window 0 to map system page address, and vram
page address is direct mapping. Use the same kernel buffer function to
fill in gart table mapping, so this is serialized with memory copy by
sdma job submit. We only need wait for the last memory copy sdma fence
for larger buffer migration.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 172 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   5 +
 2 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 4bb39c562665..2a6824ddae88 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -32,6 +32,178 @@
 #include "kfd_svm.h"
 #include "kfd_migrate.h"
 
+static uint64_t
+svm_migrate_direct_mapping_addr(struct amdgpu_device *adev, uint64_t addr)
+{
+	return addr + amdgpu_ttm_domain_start(adev, TTM_PL_VRAM);
+}
+
+static int
+svm_migrate_gart_map(struct amdgpu_ring *ring, uint64_t npages,
+		     dma_addr_t *addr, uint64_t *gart_addr, uint64_t flags)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct amdgpu_job *job;
+	unsigned int num_dw, num_bytes;
+	struct dma_fence *fence;
+	uint64_t src_addr, dst_addr;
+	uint64_t pte_flags;
+	void *cpu_addr;
+	int r;
+
+	/* use gart window 0 */
+	*gart_addr = adev->gmc.gart_start;
+
+	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
+	num_bytes = npages * 8;
+
+	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4 + num_bytes,
+				     AMDGPU_IB_POOL_DELAYED, &job);
+	if (r)
+		return r;
+
+	src_addr = num_dw * 4;
+	src_addr += job->ibs[0].gpu_addr;
+
+	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
+	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
+				dst_addr, num_bytes, false);
+
+	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
+	WARN_ON(job->ibs[0].length_dw > num_dw);
+
+	pte_flags = AMDGPU_PTE_VALID | AMDGPU_PTE_READABLE;
+	pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
+	if (!(flags & KFD_IOCTL_SVM_FLAG_GPU_RO))
+		pte_flags |= AMDGPU_PTE_WRITEABLE;
+	pte_flags |= adev->gart.gart_pte_flags;
+
+	cpu_addr = &job->ibs[0].ptr[num_dw];
+
+	r = amdgpu_gart_map(adev, 0, npages, addr, pte_flags, cpu_addr);
+	if (r)
+		goto error_free;
+
+	r = amdgpu_job_submit(job, &adev->mman.entity,
+			      AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
+	if (r)
+		goto error_free;
+
+	dma_fence_put(fence);
+
+	return r;
+
+error_free:
+	amdgpu_job_free(job);
+	return r;
+}
+
+/**
+ * svm_migrate_copy_memory_gart - sdma copy data between ram and vram
+ *
+ * @adev: amdgpu device the sdma ring running
+ * @src: source page address array
+ * @dst: destination page address array
+ * @npages: number of pages to copy
+ * @direction: enum MIGRATION_COPY_DIR
+ * @mfence: output, sdma fence to signal after sdma is done
+ *
+ * ram address uses GART table continuous entries mapping to ram pages,
+ * vram address uses direct mapping of vram pages, which must have npages
+ * number of continuous pages.
+ * GART update and sdma uses same buf copy function ring, sdma is splited to
+ * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
+ * the last sdma finish fence which is returned to check copy memory is done.
+ *
+ * Context: Process context, takes and releases gtt_window_lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+
+static int
+svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
+			     uint64_t *vram, uint64_t npages,
+			     enum MIGRATION_COPY_DIR direction,
+			     struct dma_fence **mfence)
+{
+	const uint64_t GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	uint64_t gart_s, gart_d;
+	struct dma_fence *next;
+	uint64_t size;
+	int r;
+
+	mutex_lock(&adev->mman.gtt_window_lock);
+
+	while (npages) {
+		size = min(GTT_MAX_PAGES, npages);
+
+		if (direction == FROM_VRAM_TO_RAM) {
+			gart_s = svm_migrate_direct_mapping_addr(adev, *vram);
+			r = svm_migrate_gart_map(ring, size, sys, &gart_d, 0);
+
+		} else if (direction == FROM_RAM_TO_VRAM) {
+			r = svm_migrate_gart_map(ring, size, sys, &gart_s,
+						 KFD_IOCTL_SVM_FLAG_GPU_RO);
+			gart_d = svm_migrate_direct_mapping_addr(adev, *vram);
+		}
+		if (r) {
+			pr_debug("failed %d to create gart mapping\n", r);
+			goto out_unlock;
+		}
+
+		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
+				       NULL, &next, false, true, false);
+		if (r) {
+			pr_debug("failed %d to copy memory\n", r);
+			goto out_unlock;
+		}
+
+		dma_fence_put(*mfence);
+		*mfence = next;
+		npages -= size;
+		if (npages) {
+			sys += size;
+			vram += size;
+		}
+	}
+
+out_unlock:
+	mutex_unlock(&adev->mman.gtt_window_lock);
+
+	return r;
+}
+
+/**
+ * svm_migrate_copy_done - wait for memory copy sdma is done
+ *
+ * @adev: amdgpu device the sdma memory copy is executing on
+ * @mfence: migrate fence
+ *
+ * Wait for dma fence is signaled, if the copy ssplit into multiple sdma
+ * operations, this is the last sdma operation fence.
+ *
+ * Context: called after svm_migrate_copy_memory
+ *
+ * Return:
+ * 0		- success
+ * otherwise	- error code from dma fence signal
+ */
+int
+svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
+{
+	int r = 0;
+
+	if (mfence) {
+		r = dma_fence_wait(mfence, false);
+		dma_fence_put(mfence);
+		pr_debug("sdma copy memory fence done\n");
+	}
+
+	return r;
+}
+
 static void svm_migrate_page_free(struct page *page)
 {
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 98ab685d3e17..5db5686fa46a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -32,6 +32,11 @@
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 
+enum MIGRATION_COPY_DIR {
+	FROM_RAM_TO_VRAM = 0,
+	FROM_VRAM_TO_RAM
+};
+
 #if defined(CONFIG_DEVICE_PRIVATE)
 int svm_migrate_init(struct amdgpu_device *adev);
 void svm_migrate_fini(struct amdgpu_device *adev);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
