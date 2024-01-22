Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0777A836741
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E8B10F39A;
	Mon, 22 Jan 2024 15:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF76510F384;
 Mon, 22 Jan 2024 15:12:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DD8B0CE2B15;
 Mon, 22 Jan 2024 15:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE7AC433C7;
 Mon, 22 Jan 2024 15:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936301;
 bh=K52h5TwE0bsIWGp3/sknhaN0bqzlEaz0kC2Y+TotkRo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gkmvyHtwn3X495Ox2fspuVAxipf4ZkJ4poP2W6+dDd+XjPr+wLJ1uKPOCNa3swYIn
 Xq6lxAB58iy3Qsalkb49LfLn2rZzFvRN33ayZY8gp79w6B/tcf+66bS7RNQt1Z85g1
 p64PPwQ+3sX+Ob4YAJ39uhqSQipig1EXRU28swl3FfuCoiKz0rg7r3GY69rXB1eb1u
 eCYxRyC026CCBmKO5lkNf+5wGFv6h+ka0fbKVa0/PU8z3mkQDnIfotdJiYhDEfnb7v
 q5uwrUyLYLFedZq80RfoxzXgqYkKWEweyU5yvjFMzAL1bh8k050Kj2LXcmAHqzLIPg
 5EfMNx9eRNcxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 38/53] drm/amdgpu: fix ftrace event amdgpu_bo_move
 always move on same heap
Date: Mon, 22 Jan 2024 10:08:39 -0500
Message-ID: <20240122150949.994249-38-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150949.994249-1-sashal@kernel.org>
References: <20240122150949.994249-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.74
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
Cc: Hongkun.Zhang@amd.com, "Wang, Beyond" <Wang.Beyond@amd.com>,
	Wang@freedesktop.org, mukul.joshi@amd.com, lijo.lazar@amd.com,
	dri-devel@lists.freedesktop.org, Jun.Ma2@amd.com, airlied@gmail.com,
	Sasha Levin <sashal@kernel.org>, guchun.chen@amd.com,
	amd-gfx@lists.freedesktop.org, matthew.auld@intel.com,
	pierre-eric.pelloux-prayer@amd.com, Philip.Yang@amd.com,
	srinivasan.shanmugam@amd.com, Arunpravin.PaneerSelvam@amd.com,
	marek.olsak@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
	rajneesh.bhardwaj@amd.com, daniel@ffwll.ch,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wang, Beyond" <Wang.Beyond@amd.com>

[ Upstream commit 94aeb4117343d072e3a35b9595bcbfc0058ee724 ]

Issue: during evict or validate happened on amdgpu_bo, the 'from' and
'to' is always same in ftrace event of amdgpu_bo_move

where calling the 'trace_amdgpu_bo_move', the comment says move_notify
is called before move happens, but actually it is called after move
happens, here the new_mem is same as bo->resource

Fix: move trace_amdgpu_bo_move from move_notify to amdgpu_bo_move

Signed-off-by: Wang, Beyond <Wang.Beyond@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 +------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  5 +++--
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 0ee7c935fba1..cde2fd2f7117 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1222,19 +1222,15 @@ int amdgpu_bo_get_metadata(struct amdgpu_bo *bo, void *buffer,
  * amdgpu_bo_move_notify - notification about a memory move
  * @bo: pointer to a buffer object
  * @evict: if this move is evicting the buffer from the graphics address space
- * @new_mem: new information of the bufer object
  *
  * Marks the corresponding &amdgpu_bo buffer object as invalid, also performs
  * bookkeeping.
  * TTM driver callback which is called when ttm moves a buffer.
  */
-void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
-			   bool evict,
-			   struct ttm_resource *new_mem)
+void amdgpu_bo_move_notify(struct ttm_buffer_object *bo, bool evict)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct amdgpu_bo *abo;
-	struct ttm_resource *old_mem = bo->resource;
 
 	if (!amdgpu_bo_is_amdgpu_bo(bo))
 		return;
@@ -1251,13 +1247,6 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 	/* remember the eviction */
 	if (evict)
 		atomic64_inc(&adev->num_evictions);
-
-	/* update statistics */
-	if (!new_mem)
-		return;
-
-	/* move_notify is called before move happens */
-	trace_amdgpu_bo_move(abo, new_mem->mem_type, old_mem->mem_type);
 }
 
 void amdgpu_bo_get_memory(struct amdgpu_bo *bo, uint64_t *vram_mem,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 6dcd7bab42fb..2ada421e79e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -312,9 +312,7 @@ int amdgpu_bo_set_metadata (struct amdgpu_bo *bo, void *metadata,
 int amdgpu_bo_get_metadata(struct amdgpu_bo *bo, void *buffer,
 			   size_t buffer_size, uint32_t *metadata_size,
 			   uint64_t *flags);
-void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
-			   bool evict,
-			   struct ttm_resource *new_mem);
+void amdgpu_bo_move_notify(struct ttm_buffer_object *bo, bool evict);
 void amdgpu_bo_release_notify(struct ttm_buffer_object *bo);
 vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 10469f20a10c..158b791883f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -555,10 +555,11 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 			return r;
 	}
 
+	trace_amdgpu_bo_move(abo, new_mem->mem_type, old_mem->mem_type);
 out:
 	/* update statistics */
 	atomic64_add(bo->base.size, &adev->num_bytes_moved);
-	amdgpu_bo_move_notify(bo, evict, new_mem);
+	amdgpu_bo_move_notify(bo, evict);
 	return 0;
 }
 
@@ -1503,7 +1504,7 @@ static int amdgpu_ttm_access_memory(struct ttm_buffer_object *bo,
 static void
 amdgpu_bo_delete_mem_notify(struct ttm_buffer_object *bo)
 {
-	amdgpu_bo_move_notify(bo, false, NULL);
+	amdgpu_bo_move_notify(bo, false);
 }
 
 static struct ttm_device_funcs amdgpu_bo_driver = {
-- 
2.43.0

