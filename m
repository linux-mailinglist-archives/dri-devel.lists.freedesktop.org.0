Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE26C55BE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EEE10E9E1;
	Wed, 22 Mar 2023 20:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3427110E9D2;
 Wed, 22 Mar 2023 20:00:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3717622C6;
 Wed, 22 Mar 2023 20:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE2CC4339B;
 Wed, 22 Mar 2023 20:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515241;
 bh=DdZCJZugkSYbMO1idOyG2g7e45pM6mcohmV4VmEat0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hsv2nN90d0LvROM7ZCqv2iw3t6exE1aPYhmUOjzG4s8la5kqHYAqsmWng3SOmCeWR
 6Ydh/ytGlnQ7lKzpJh6G+TjIGrkZyg9s/CFVcKycAN1MSrMgraolMlPiW6UTJaFfO+
 7fQiKGzlDA0DCNE2yrf5/VIm8q7904T7L98myPEarjr3LBIe/eLZ/Ajy/SzRaF9WvL
 R7VybcoMaoy/tOb4MEHnGU+kaFQV2d9fkO0JgKZh4w4KjqGIC6YThNQCS5LAQb/iAK
 SkNCbAgN2X3RMkmVyHKX5aDysmsOlnmMD495tzpfHJPcKOXCUX1KLpzsU8AuBHUU0k
 2Fg7T89gUAXPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 16/34] drm/amdkfd: Fix BO offset for multi-VMA
 page migration
Date: Wed, 22 Mar 2023 15:59:08 -0400
Message-Id: <20230322195926.1996699-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Xiaogang Chen <Xiaogang.Chen@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaogang Chen <Xiaogang.Chen@amd.com>

[ Upstream commit b4ee9606378bb9520c94d8b96f0305c3696f5c29 ]

svm_migrate_ram_to_vram migrates a prange from sys ram to vram. The prange may
cross multiple vma. Need remember current dst vram offset in the TTM resource for
each migration.

v2: squash in warning fix (Alex)

Signed-off-by: Xiaogang Chen <Xiaogang.Chen@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 22b077ac9a196..fad500dd224d8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -295,7 +295,7 @@ static unsigned long svm_migrate_unsuccessful_pages(struct migrate_vma *migrate)
 static int
 svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 			 struct migrate_vma *migrate, struct dma_fence **mfence,
-			 dma_addr_t *scratch)
+			 dma_addr_t *scratch, uint64_t ttm_res_offset)
 {
 	uint64_t npages = migrate->npages;
 	struct device *dev = adev->dev;
@@ -305,8 +305,8 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	uint64_t i, j;
 	int r;
 
-	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
-		 prange->last);
+	pr_debug("svms 0x%p [0x%lx 0x%lx 0x%llx]\n", prange->svms, prange->start,
+		 prange->last, ttm_res_offset);
 
 	src = scratch;
 	dst = (uint64_t *)(scratch + npages);
@@ -317,7 +317,7 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 		goto out;
 	}
 
-	amdgpu_res_first(prange->ttm_res, prange->offset << PAGE_SHIFT,
+	amdgpu_res_first(prange->ttm_res, ttm_res_offset,
 			 npages << PAGE_SHIFT, &cursor);
 	for (i = j = 0; i < npages; i++) {
 		struct page *spage;
@@ -404,7 +404,7 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 static long
 svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 			struct vm_area_struct *vma, uint64_t start,
-			uint64_t end, uint32_t trigger)
+			uint64_t end, uint32_t trigger, uint64_t ttm_res_offset)
 {
 	struct kfd_process *p = container_of(prange->svms, struct kfd_process, svms);
 	uint64_t npages = (end - start) >> PAGE_SHIFT;
@@ -457,7 +457,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	else
 		pr_debug("0x%lx pages migrated\n", cpages);
 
-	r = svm_migrate_copy_to_vram(adev, prange, &migrate, &mfence, scratch);
+	r = svm_migrate_copy_to_vram(adev, prange, &migrate, &mfence, scratch, ttm_res_offset);
 	migrate_vma_pages(&migrate);
 
 	pr_debug("successful/cpages/npages 0x%lx/0x%lx/0x%lx\n",
@@ -505,6 +505,7 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	unsigned long addr, start, end;
 	struct vm_area_struct *vma;
 	struct amdgpu_device *adev;
+	uint64_t ttm_res_offset;
 	unsigned long cpages = 0;
 	long r = 0;
 
@@ -525,6 +526,7 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 
 	start = prange->start << PAGE_SHIFT;
 	end = (prange->last + 1) << PAGE_SHIFT;
+	ttm_res_offset = prange->offset << PAGE_SHIFT;
 
 	for (addr = start; addr < end;) {
 		unsigned long next;
@@ -534,13 +536,14 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 			break;
 
 		next = min(vma->vm_end, end);
-		r = svm_migrate_vma_to_vram(adev, prange, vma, addr, next, trigger);
+		r = svm_migrate_vma_to_vram(adev, prange, vma, addr, next, trigger, ttm_res_offset);
 		if (r < 0) {
 			pr_debug("failed %ld to migrate\n", r);
 			break;
 		} else {
 			cpages += r;
 		}
+		ttm_res_offset += next - addr;
 		addr = next;
 	}
 
-- 
2.39.2

