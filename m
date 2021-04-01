Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3AA350DBA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E556EC40;
	Thu,  1 Apr 2021 04:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106896EC3F;
 Thu,  1 Apr 2021 04:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1A6LtYAlfkyZRcBkOyDyFQHEkdp8tvcmB05fmNHxjch1CS+HO/Fn8EeYaSwzA0qgW5im+ihFFPMXwZL5z9z4VsRsR8GO1wpv61OXt5ukY0n2XwQZ6iReZ/+5273ZZmP8ocWX49h0Ghq1+T3bCVXj/7ytat0O7HjQJl2zKgJH5qb4GWLK7lc+cthomADiK2uPNMHIkBVB7GdkXQHYHbaYZ6B6zCiOOf7okmxa6ApA4MzRbfaJb/E0Pk5UTKArJ5YsVebP2dBGcJE3YT9CXcgMd1x+x1dPLKQjobISJFG09xqe5sjt3XRDsASpplgZJLzD2mdnMzYyKqYbNWPal5ucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imzuJ/Qk5rSx/Y1Q902NyG61iDDKU2wXEq3JAhJPoW0=;
 b=WRDfxffBiNfyzNCKPkLNKgwKz6IE0RLvsSYBbgfcP/eSOxcqYzDTeiwGrN3XI4EYfglL1syDFbekvmT6bxLWDrpl8hWcZWMa1C0MXr7LlnH/X1io+prbQmATKGoH6H3gm15/V/I1KkXuF6Oq9BylmpCdoQJUKG69rRT7qAm55XQlREEwLUnwYGryF7ZcEEWHu8tr+zlgdTV/+W1DYdcXrXAdWi9P86x7uwzvz+xF7qm2bELtmrouWd5pGBWBMJGPbZk1je0Fmv3JeYo6ZE32mlFtTZAGduaVU3ag5f+bIygphBCqc6Tc7oXIDhS34tmvg9DA7W1cUAFnNsWPqbl98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imzuJ/Qk5rSx/Y1Q902NyG61iDDKU2wXEq3JAhJPoW0=;
 b=2H79nkeG1yiENZWGb28g2ohXnYmzZpV6qU9hHagHhTylGhUBe13x6x17asvDZmEC4jxIpudg1SsQPNEdEgnNiW8F1kngWSCvtF1dcwAwQVAvUv/ocb3NodKYAJYQJvd4PiB0phyUowJ58s1UiPv8x8cwKOkXnbyrA9mr+FzUudQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:22:58 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:58 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/34] drm/amdkfd: copy memory through gart table
Date: Thu,  1 Apr 2021 00:22:11 -0400
Message-Id: <20210401042228.1423-18-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aed9e17d-5801-4813-8525-08d8f4c5d41e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB422247E5FDBAA72ABE31DBF9927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAM+fHnE2kQgg7ttxpf+67F4yFR3z/yUgZ+jX4cB+zXbV1xWAlmgjJmJU6TaosOH6YEjYNjbB7kYGDJXPX6y+pCNwmI/dtc+hZvku7t2syR1tV+FrFuIVKK6zB5Td5XwVIqkK9OrYrbyTv0690MuTQKwCrRBAdczofG+x6g5Tna4UhdeFRd7RmSOsSy71RbGO1A9rH981enFpyjKc3/MY3v2SDo+3Oc0uCmMqxIzTGr6LvDBzHoy6OJiVNbgW4hz3wr7rFTn5aqqOkFck+P+Gny0h4Zi2VY1W1C8rRgQUQVC6K+u2UP+Tk4gTuUfozNfRaPLSl0XXkZ2SMugTJi+03FfG/EqU6MPvOVABGT3uaEIatut4Db01LjTaplK6CxKtqeVpZATD3PR5taYKBeAot16Ngwdll2Xk3R+5lpfTfl5NnGIvnG+2gptivf6nIhzIg1yMGEV9NKaMHPeQoMY6GBnwug//NIEVpIgrCyBW2G9dYQe98l4R+JFvHSP65AbJkekKA3SZCIjSU524rdVWcNGQ81D2ZXrzkRAwIRrDmuX1KiFctIRuvkKY5o+X4gEdzcaG/GKwJ/mD9iN1+Bi5kQjrtGcJFs6km0KDVgeGHC1KcAP4pAbELCObgMrB1stJjBOrTx4HGJDSiuYPxR5fYuS38TXfGZZRXkA0098BIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2Ee5JxGMhZmpN+PdRfsK0q76CHKok1nBfagcc2Qk9euX9+VBlxpEzhV5cKHV?=
 =?us-ascii?Q?JM70KwXAw7KHQ5EsTSzIqXeNc1PRZhQzex9EMEnhLxNeXfxN+hdgYWHFt9CN?=
 =?us-ascii?Q?ApC2fiYlmIxAyPi+GoZnERA2lr1xwWhIsyg302kabfeKaoGMejWRY6xqvuJC?=
 =?us-ascii?Q?m/NkublheF+B+ncorEqxL5N4W1XQSZXSHbAreWmze2g0Nk23pNxNCqiDRvnX?=
 =?us-ascii?Q?MUcSB0DwPwWuPp46Y+ZJq+f+wlHdmuFvKBnnzo1U2KQinj8B7ecgWe4582jv?=
 =?us-ascii?Q?OFABHPRSAsKGuMckWZox65Ty3dlHRnYAXKvpNrpCU/Q4Sk+nLNjso+OflBkq?=
 =?us-ascii?Q?TGMVtgc5yxDVO/UM/CCWB+g4gdnUXPSKedFfuC2T3OkA4lMiUmyoL+vONP+w?=
 =?us-ascii?Q?A/ypwhWiTSJ781sVz3HPdU7HYjoL6EBpjIzjXpItEw68OexVwvO9fNmykHUJ?=
 =?us-ascii?Q?Eoc0xhamHTV9sOEN+CH261/w43z5bQgTLFayaYHHUCaNp9bdlRhM3VhMvXh1?=
 =?us-ascii?Q?Y6Q7TBrxNLUljU0evqM4b0DEEX5G7W1SSD82vHeruOt2xQO6a68Qo5e14c0s?=
 =?us-ascii?Q?uG7HvLqgYaDTtdGK07KHVwxq04hZsWylgIa5jLOPYmVH0eDlekbNF5S5qUTR?=
 =?us-ascii?Q?ttX+g473EDZFlZNpnz9vVxlDbXYMNqN20QvCmufhaO2BvaDgEQiPcfqmGZz6?=
 =?us-ascii?Q?ihbZ+1YKGPZYLbUlUDUeDFzopvFi4lmNLLY52C7OuyWQ2pgtucUyume5hmFB?=
 =?us-ascii?Q?nS9IAZ0ooZ3mc0TEgH8rtlErqluHHLI7FyB35LHJSciqUmOZ7ZKWb70VA+Sj?=
 =?us-ascii?Q?DMAaCEnSDcbspp7ARIh+N+upqRc0vksPAqhZW3buKgUJceYgCCMg7xSt2KLZ?=
 =?us-ascii?Q?fUyze8TA4+1fwQ9ju10SZRHZksckPSd4jg7+Q89vJnR9UP62tf0+vEpUHzXs?=
 =?us-ascii?Q?BrksiKEel5sJZsLUWeg2g+qVn/oVhBFlzxQvlPSnTuVwASvIayT1o5B/G7ws?=
 =?us-ascii?Q?IWA1uMdg/D1TG/8g6S/B3F2wKqFJWBkTHdYRI1ku+Vtq2h610Ra7l4ZVuaK/?=
 =?us-ascii?Q?mIsgDPQEOU6xNX+AjHDEPOE8w/pbc9rJsY14F90hdyZcnyEt5A+hdDK0wihP?=
 =?us-ascii?Q?M2lob/MgZ/wHDK5/LxeDXxZzUW5SzVnM6X5/pxy4zYGWalPHa/kXTDSY4sDL?=
 =?us-ascii?Q?sqKMPRcfb0XJBCpWs9jkpwRa3PDO1yDnquEApXlUFazqiWVchA5zFzpC64Hf?=
 =?us-ascii?Q?RBS3C8ixO97Q6+kHtNLhMQJZXOooO05o6CZv9M8+HqfzhrysHoxgxPRXZX9L?=
 =?us-ascii?Q?XpZTVRk7AlrbzUJ5IxXFbDzv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed9e17d-5801-4813-8525-08d8f4c5d41e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:58.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuXh9pFC+yvL51nfaeiMj7L6R2LHZ9O+ik0eifyuMk/fffjSQkNpMDBrbN7R08YR4gavhi2Rzx2QDdff/GZ0xQ==
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
