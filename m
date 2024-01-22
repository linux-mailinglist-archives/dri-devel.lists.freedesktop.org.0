Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBF836768
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D4A10F3D0;
	Mon, 22 Jan 2024 15:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0510F3CF;
 Mon, 22 Jan 2024 15:14:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DC255B80E98;
 Mon, 22 Jan 2024 15:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D7FC433F1;
 Mon, 22 Jan 2024 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936467;
 bh=od/93D7WrSq1zQRDKGWKdP9kgrvcXIRwEyUffPVVUpo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kEHX17yb6KG0WbOcwiO/sRVGAqtj9S/CyAQ4f4tz1FkxZ9eSc9+nyM0e7LAT7EhFV
 5A1xlGvqGnU6gRwipEA+Yd3+30MK8C4DyUDW5hRNh5UKfXUAaAQ8hS8Tu3theA8RBb
 ZJuBdEiE9Eze/cXF+wQPjjo/YLGT0ZsXgz7jMkWdfWRHNpaOqfwtZnZCikodPeBgbU
 LuuOkTMqVZVhsCyoFg8Z+2X03njeVnZMrMEa6v2qJqKrkpo4/z5wu8eYVVfizDUqap
 G6EkVdA5mfTwTc/Zy/DW9HhTY/lKrrZjhXD8zLvYVwkSAR5pRTcxpYMTWVpPqeaTqe
 Cuq1dyfgBj6Pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 26/35] drm/amdgpu: fix ftrace event
 amdgpu_bo_move always move on same heap
Date: Mon, 22 Jan 2024 10:12:23 -0500
Message-ID: <20240122151302.995456-26-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122151302.995456-1-sashal@kernel.org>
References: <20240122151302.995456-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.147
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
	Wang@freedesktop.org, pierre-eric.pelloux-prayer@amd.com,
	lijo.lazar@amd.com, dri-devel@lists.freedesktop.org, Jun.Ma2@amd.com,
	airlied@gmail.com, Sasha Levin <sashal@kernel.org>,
	guchun.chen@amd.com, amd-gfx@lists.freedesktop.org,
	matthew.auld@intel.com, Philip.Yang@amd.com,
	srinivasan.shanmugam@amd.com, Lyndon.Li@amd.com, marek.olsak@amd.com,
	Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
	rajneesh.bhardwaj@amd.com, mukul.joshi@amd.com, daniel@ffwll.ch,
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
index 8a0b652da4f4..5d95594a1753 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1236,19 +1236,15 @@ int amdgpu_bo_get_metadata(struct amdgpu_bo *bo, void *buffer,
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
@@ -1265,13 +1261,6 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
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
index dc5b889828d9..0969669f1d4e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -313,9 +313,7 @@ int amdgpu_bo_set_metadata (struct amdgpu_bo *bo, void *metadata,
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
index 51c76d6322c9..b06fb1fa411b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -554,10 +554,11 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
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
 
@@ -1480,7 +1481,7 @@ static int amdgpu_ttm_access_memory(struct ttm_buffer_object *bo,
 static void
 amdgpu_bo_delete_mem_notify(struct ttm_buffer_object *bo)
 {
-	amdgpu_bo_move_notify(bo, false, NULL);
+	amdgpu_bo_move_notify(bo, false);
 }
 
 static struct ttm_device_funcs amdgpu_bo_driver = {
-- 
2.43.0

