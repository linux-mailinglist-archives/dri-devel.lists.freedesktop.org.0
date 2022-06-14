Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7816354A400
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 04:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EC810FF65;
	Tue, 14 Jun 2022 02:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5E710FF65
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 02:05:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8BAD4B8169B;
 Tue, 14 Jun 2022 02:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C008C385A2;
 Tue, 14 Jun 2022 02:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172309;
 bh=jvY6zLIFYZFwPqwJyHm4FYdTHBXHgYFw9HzPnyPYv5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OUkp6L2r8oOyhPI7sfOi+3jOeWAInBxyni2x0/Ebwj1nNrKCYnvAEAYcYuVzCJNRl
 8elJjs9sKQxjD6OKW70GeEmA/Js9X1QyHqDMfUGOGvenkEVdU1Km909kVMvj6k492b
 3dsOWaHUgWUsWlr0NucT71olaWP4zClss4j4OGfYfXLf4AQm4ANYGqCRIryoOu4DGb
 mFAvJcdEA8X920iDqQnq3vOy9RGszianebgK7SsM4cke+CGxsCI6iKIZ5ZyIYN3rhV
 XXKEbsP39ERLgL454Xy+fTyUNenZ424zBVBamu4sfCR9UBlY1HbeJASOSaWxj3lqgs
 uDKHu3wT/kHXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 15/47] drm/amdkfd: add pinned BOs to kfd_bo_list
Date: Mon, 13 Jun 2022 22:04:08 -0400
Message-Id: <20220614020441.1098348-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020441.1098348-1-sashal@kernel.org>
References: <20220614020441.1098348-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lang Yu <Lang.Yu@amd.com>

[ Upstream commit 4fac4fcf4500bce515b0f32195e7bb86aa0246c6 ]

The kfd_bo_list is used to restore process BOs after
evictions. As page tables could be destroyed during
evictions, we should also update pinned BOs' page tables
during restoring to make sure they are valid.

So for pinned BOs,
1, Validate them and update their page tables.
2, Don't add eviction fence for them.

v2:
 - Don't handle pinned ones specially in BO validation.(Felix)

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index cd89d2e46852..f4509656ea8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1955,9 +1955,6 @@ int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct amdgpu_device *adev,
 		return -EINVAL;
 	}
 
-	/* delete kgd_mem from kfd_bo_list to avoid re-validating
-	 * this BO in BO's restoring after eviction.
-	 */
 	mutex_lock(&mem->process_info->lock);
 
 	ret = amdgpu_bo_reserve(bo, true);
@@ -1980,7 +1977,6 @@ int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct amdgpu_device *adev,
 
 	amdgpu_amdkfd_remove_eviction_fence(
 		bo, mem->process_info->eviction_fence);
-	list_del_init(&mem->validate_list.head);
 
 	if (size)
 		*size = amdgpu_bo_size(bo);
@@ -2544,12 +2540,15 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	process_info->eviction_fence = new_fence;
 	*ef = dma_fence_get(&new_fence->base);
 
-	/* Attach new eviction fence to all BOs */
+	/* Attach new eviction fence to all BOs except pinned ones */
 	list_for_each_entry(mem, &process_info->kfd_bo_list,
-		validate_list.head)
+		validate_list.head) {
+		if (mem->bo->tbo.pin_count)
+			continue;
+
 		amdgpu_bo_fence(mem->bo,
 			&process_info->eviction_fence->base, true);
-
+	}
 	/* Attach eviction fence to PD / PT BOs */
 	list_for_each_entry(peer_vm, &process_info->vm_list_head,
 			    vm_list_node) {
-- 
2.35.1

