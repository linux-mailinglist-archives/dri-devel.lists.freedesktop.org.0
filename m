Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1554A413
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 04:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3E810FF9E;
	Tue, 14 Jun 2022 02:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B3210FF9E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 02:06:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD797B8168A;
 Tue, 14 Jun 2022 02:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A48FC341C4;
 Tue, 14 Jun 2022 02:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172383;
 bh=q2J83CbzGStsLYiuVZ5PRD403IkLh1WMVtqYr6V+AUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q885gXXE4h+SMnSsvGw1R3JsLEVW0uBa0p22hWSYTJzop5JoJLq54OYFePgYsdhsK
 VAjRh5b64MRjNtvJ598GqNRtkwIkJxLpvdQid6BTDIU7wJZR/lpSpsuPpaC7vKml2m
 /a4q9KKdtDbBeS40wsMVnL7z/FVpvj6XimD44Gc+AkV5UdGjKh6uCcv7NvXc7iE+Tq
 jM46+dTLVBifX9JtnKJqT5xui1Gpg0hT4gySZ12Fm0KZ+rlyBFeB/ewOCo7utgQgSL
 xGkcsFGRqLZCMBiatMFWyNqfFWX/KyGbSZUQ4m9mpIIhQi47uMQlMQlw4uMfxLMnJj
 O4LAhS8EF760A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 13/43] drm/amdkfd: add pinned BOs to kfd_bo_list
Date: Mon, 13 Jun 2022 22:05:32 -0400
Message-Id: <20220614020602.1098943-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020602.1098943-1-sashal@kernel.org>
References: <20220614020602.1098943-1-sashal@kernel.org>
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
index 5df387c4d7fb..e6b88642d6c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1912,9 +1912,6 @@ int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct amdgpu_device *adev,
 		return -EINVAL;
 	}
 
-	/* delete kgd_mem from kfd_bo_list to avoid re-validating
-	 * this BO in BO's restoring after eviction.
-	 */
 	mutex_lock(&mem->process_info->lock);
 
 	ret = amdgpu_bo_reserve(bo, true);
@@ -1937,7 +1934,6 @@ int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct amdgpu_device *adev,
 
 	amdgpu_amdkfd_remove_eviction_fence(
 		bo, mem->process_info->eviction_fence);
-	list_del_init(&mem->validate_list.head);
 
 	if (size)
 		*size = amdgpu_bo_size(bo);
@@ -2497,12 +2493,15 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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

