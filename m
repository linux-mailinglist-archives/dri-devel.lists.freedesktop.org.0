Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5CA343EFD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CE66E05A;
	Mon, 22 Mar 2021 11:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DD189EFF;
 Mon, 22 Mar 2021 11:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNvhusVowRr+su2hZE77C4Aja/FwESrej4QcqgorN0X/UVUiVMMoEOMVC/rBgSu6mtYK7rS9n9MvYIilCMs2eyIExHonUcy9K+igcmnORtybTILQ9lA9MA+Tad+0EKBMd076YhwGUDRA0T8U7OD4RsUC5XnXMjkYdPCH+4LoMr1ri6JBZk8UsH7CdCDY3M1Iw9EXe6MQLyaMNJU2WpBk9FCID3zswZnAzZy920ti4keO+Xqjgezeu1t5o8iGCqakYp4ODjJRi21JPVWp3Da8PwVuNAbU7RMwPmm7Y8/sW25ZMCgapVKxZxzl9F7nWL6+bS6s01p2vbkbxNZ3saM3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY1dd63Dk6XEAKgs57nBVUzScP7S1cUMNZ4xslA5jXw=;
 b=Wur+ts0SxBT58h3/NJ1tcFWxc++VKXB5/xdW8111tTL5M30ub3qvCoYZ6Qv2taNZq4TFcMDxNoZIbAOgxuh+mZ5QOXBRyyfkuypPjf5ptNf54QIN8Qg3oaO25X8jCAWJ0Tdmn4iSls6kt3Ws69nhc9GoM/Ddp2V6JeewvDzq51TgmVvx7iHxiUs7CosaNfC0BqFYrIMB/guqjHIG8Mod+pS/sdooUhX6R2Yqqmw1f0fX9DGXQo+4xZNyF2GUO8TTW31cty2O9Wd9I0uOufcEzpB0raL1mKtnzEmvKmfSFv/lUzN/3JGgNDft+B4m+M3WCma5VfeHovPoV0Z24vkJUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY1dd63Dk6XEAKgs57nBVUzScP7S1cUMNZ4xslA5jXw=;
 b=ZUnJnqWGzBR4f4fNOC+SEFTO43JIIClO8esXcrQyzAZhtiJk+h7kCD5YwhmKK7Gj+COORDw/CeXBW2R8xhyNV2XGhhuWCsiihgcZO0btC61LJM1sTTuEKTUm28BGp9eyMvlo2ikNd+OTlYLi/YRb8APfebkMZzlRDt7quXc8fTY=
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
Subject: [PATCH 17/44] drm/amdkfd: copy memory through gart table
Date: Mon, 22 Mar 2021 06:58:33 -0400
Message-Id: <20210322105900.14068-18-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b1d97d0a-d944-4182-7304-08d8ed22b480
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3678BC3D4D377B2D6A2BF95092659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MCZT6DQrPmXMjhvzefK14lM+KiEahywc+DzmsFbccIvZL2tXmm2Z9cvc5LWJflcOVco5tN9YXGUsr7So1Hbk0oVPl9HOQQupVQrBnsmgs1oaemCqX6IpVlxg4eMUtnWctJ6MX/2Q7RGe+g+wuO5r5y2m2lzNg71UhmnyVFYcm7THhWiACPFeMLtohdaMTfW+2gUCtAJWSHgkCkYsTGDgyHXDrveYNXzEVZL4zwlSeq2ljb6KGU+psqSkHGJ82G85lPzUwKKGXApELubkdyLU2ZToTQZN0GsWEPXxfgoloo8N4RgyJRvx4REKp+y+rOtaV/zVAF7yLfXSkr2shZyp+YeE5z/aounLXZXqdjQn+swFuxM9c+9Ovgkmgx1WEHhHgBYAa0kdTyqP7nuJPP93Duet5Pt5tlZKLqpglVouZOl+HZRUs5+G27zx9ySuBAHBWngkih8AmpQwSuooVj/2VZ8NkeZGKDJ1w3c0aDR1w1KtD13+EHj1QV8O962tWIZbtB5LWASWyPXWN7PjtZgXfyx/J5Rgsso1OMVMUh4hff1K8WPcQ3n9OP0pKoG4QQjcn/UnQCsda9Q5zyJ56VHn9erbhOz4arzPLsrhaOBV1G1B9kGvAUVDpiBSmszPOi1fsL4ghDj1g+a3480tl7Kdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Fo77Wdl1aoWNk42ZPcyFKlQkoZMVvy1FK1cUJXdAVLv9jKasiIne+QVapgCz?=
 =?us-ascii?Q?VVzTJLL763r0NlQhrYA/2MK6uRut08YW/SKYiL9qON4NBGzpmHwaycn94C75?=
 =?us-ascii?Q?SNffbbrDXg05xlrZn4bS4h3d1Y6HhDVBUUuHeOhoGhprKHogWNrMO3tV4aQ0?=
 =?us-ascii?Q?neBpUhrT1qMnUrppVQe5jabC9jLKHLG7OvTCv/B9IYdpNo+9KrqPE4EMPnp6?=
 =?us-ascii?Q?cZe1L9zG6VZkorBk+xm3jJP/NBkS/xkjsiNBxqrtgEgzYb24Awamd+oJerzy?=
 =?us-ascii?Q?4O1WA+6jOEy7ewxEWJ/h8a1KfMh9MTXX2YV+Ytt4PuR37NkzC2BJZqBIxayb?=
 =?us-ascii?Q?1EoPKDC6fHio7/y8i8g4DqkNpk42FzeknJ2pB+eStc/U6HWtJAK5yCcKQ5Eh?=
 =?us-ascii?Q?AwbdilH/MleeLII9mAG1HhkM78YvShALup/LrLazoOhUXqD5Vg0adG05t3kv?=
 =?us-ascii?Q?immcTdPLDb/a8zeZqsY346yw+iaYFLdWYHBm9VKkp4nrt5VxigG9T+2U/4TB?=
 =?us-ascii?Q?SABDsluW3wFGNS/B9r+bKSKITdoNM5Cb1Q1BDn3yx9QySNJGVEZr39LL+3iv?=
 =?us-ascii?Q?fi1ZfCdsgP8+i+ZAMgJMARO7e4KTL4+mglUHLaAvxczX73sPuY5Hmmq+FhJp?=
 =?us-ascii?Q?XkQUS+OwXAygxVURJjbcsMZxNWK3ribersnfr5cWFPwB/0Lo/1XOQUX7esQE?=
 =?us-ascii?Q?K4ggABzq55zOYqiaJ4+BUvIVPG8cnMqALmP2c2sbgKuuYuckdzFivoyZadb6?=
 =?us-ascii?Q?pCT60tarUgxpDfH5xbNRlWcXx5ySCagxUxvZ6BsgTj0QNjiEWF7pR1UlPjkY?=
 =?us-ascii?Q?i3XN6GSc3P8c8zZT/jjX0aIFZpqgCbU6pq/pOHwdJM6BaNnmybX9j5rl2qha?=
 =?us-ascii?Q?c0lNmJVoVaw3uLyu9yxu2nH73/yZgt1+W0PQMwGgSlOpyv2PJ4FuU20YZA9S?=
 =?us-ascii?Q?zxGIGRk0pGeRuRxGkr6/ztPQTDSnYQiZF9sN5tcf5svHMMzyp/583ho65xgR?=
 =?us-ascii?Q?xM9XZxas5Z818siPk6Tewy9aTPT2AFGSjqegVy2G1osTFAx4BniN4d/oNzTX?=
 =?us-ascii?Q?TvsUTJTgJo38z1E/yz5JyPgSxEgdhrBnfZCdd1DtOyVybowZapVSDcUSSoQD?=
 =?us-ascii?Q?Zw2lm3GlrVOzwq2tSokk0700n8HLxzepfgPmGwzbgwFsK3tmlA/Dx8/Y/paJ?=
 =?us-ascii?Q?dBU7qZxKG6YoEsdmuUWoMCzfiH7zgQ05enS3l3nS5DI8nhacRLGQxluTJymR?=
 =?us-ascii?Q?p0VPBq/0q2+qLBYIEhAUV+asS1n3/fyRqcJLvireQXIKzrbY+juB5YaPmPoQ?=
 =?us-ascii?Q?sirL99ADykYTPnBcBDfDAaRF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d97d0a-d944-4182-7304-08d8ed22b480
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:38.8501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSmjfeLcllP8/v01iGFG92F4/loLgtCHKFkhnh5Tvm4azhjSOOwcuN0tPYnrV/B3n5I2d0sr/KX2MMpE+nFjTQ==
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
