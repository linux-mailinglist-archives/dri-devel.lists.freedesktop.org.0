Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04646A8A79F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 21:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7DC10E367;
	Tue, 15 Apr 2025 19:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="iq+hhkkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D92A10E157
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 19:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744744559; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aSvpD0V7hxn+0YlvUBUnVR/NxOuQ5rrluTrkDCJInX0vXBCDEeGns3wwVlMosor4zcUTvjY53/bsYmXso0B2XXDxVuXXyMrdJmMj40v6Ik3lknNh5UBh87OMT5SFTVd7/PsEXqaYyYcoH5H+Bpu36faWS8NBXa7vwBBetFgBQWg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744744559;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BjaP8Gr+V3ALxkdWT3SHnou74Iwn8+CxkpNClDD9e24=; 
 b=YF7zj9tzGkeIS9DQG6kN8JvjzNFhSmxEE/EYkuIxc/TgbrUJpuHkzGVTIq3v4DtmMU873ZbhRVX9X94VaBLCeJElXs/o/mma6I7wpKAZCKNZzKHiZ8RkW+dkHenZMhxWAnlq31sJSN4BZp/nihXkSRenRVlXDR12tIuZiynZcsA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744744559; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=BjaP8Gr+V3ALxkdWT3SHnou74Iwn8+CxkpNClDD9e24=;
 b=iq+hhkkAgm9ocoZyzCrL39md1w2Nm80HUbcJ7ItPFBDBZ8ctakT5ioa1Tagalq1u
 bGT+hctRSKTilNZm34ueDvS1LFf5NaZjR2kNqy7T6GuyuvQwE2tujoX/hcZ/3HeQYBh
 Q2qnZbbGljFnMY5y7Ygs6eq9ZMum/kS0nb5LPcL4=
Received: by mx.zohomail.com with SMTPS id 1744744558418698.5665642543486;
 Tue, 15 Apr 2025 12:15:58 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/4] drm/panthor: Label all kernel BO's
Date: Tue, 15 Apr 2025 20:15:32 +0100
Message-ID: <20250415191539.55258-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415191539.55258-1-adrian.larumbe@collabora.com>
References: <20250415191539.55258-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel BO's aren't exposed to UM, so labelling them is the responsibility
of the driver itself. This kind of tagging will prove useful in further
commits when want to expose these objects through DebugFS.

Expand panthor_kernel_bo_create() interface to take a NUL-terminated
string. No bounds checking is done because all label strings are given
as statically-allocated literals, but if a more complex kernel BO naming
scheme with explicit memory allocation and formatting was desired in the
future, this would have to change.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 8 +++++---
 drivers/gpu/drm/panthor/panthor_gem.c   | 5 ++++-
 drivers/gpu/drm/panthor/panthor_gem.h   | 2 +-
 drivers/gpu/drm/panthor/panthor_heap.c  | 6 ++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 9 ++++++---
 5 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0f52766a3120..a7fdc4d8020d 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -449,7 +449,8 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 				       DRM_PANTHOR_BO_NO_MMAP,
 				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-				       PANTHOR_VM_KERNEL_AUTO_VA);
+				       PANTHOR_VM_KERNEL_AUTO_VA,
+				       "Queue FW interface");
 	if (IS_ERR(mem))
 		return mem;
 
@@ -481,7 +482,8 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
 	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
 					DRM_PANTHOR_BO_NO_MMAP,
 					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
-					PANTHOR_VM_KERNEL_AUTO_VA);
+					PANTHOR_VM_KERNEL_AUTO_VA,
+					"FW suspend buffer");
 }
 
 static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
@@ -601,7 +603,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
 							section_size,
 							DRM_PANTHOR_BO_NO_MMAP,
-							vm_map_flags, va);
+							vm_map_flags, va, "FW section");
 		if (IS_ERR(section->mem))
 			return PTR_ERR(section->mem);
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8dd7fa63f1ff..3f4ab5a2f2ae 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -76,13 +76,14 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
  * @gpu_va: GPU address assigned when mapping to the VM.
  * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
  * automatically allocated.
+ * @name: Descriptive label of the BO's contents
  *
  * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
  */
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va)
+			 u64 gpu_va, const char *name)
 {
 	struct drm_gem_shmem_object *obj;
 	struct panthor_kernel_bo *kbo;
@@ -106,6 +107,8 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
 
+	panthor_gem_kernel_bo_set_label(kbo, name);
+
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
 	 * since our PAGE_SIZE alignment might cover a VA range that's
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 983cc8ca264e..3c09af568e47 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -153,7 +153,7 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va);
+			 u64 gpu_va, const char *name);
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 3bdf61c14264..d236e9ceade4 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -151,7 +151,8 @@ static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
 	chunk->bo = panthor_kernel_bo_create(pool->ptdev, pool->vm, heap->chunk_size,
 					     DRM_PANTHOR_BO_NO_MMAP,
 					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
-					     PANTHOR_VM_KERNEL_AUTO_VA);
+					     PANTHOR_VM_KERNEL_AUTO_VA,
+					     "Tiler heap chunk");
 	if (IS_ERR(chunk->bo)) {
 		ret = PTR_ERR(chunk->bo);
 		goto err_free_chunk;
@@ -555,7 +556,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
 	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
 						      DRM_PANTHOR_BO_NO_MMAP,
 						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
-						      PANTHOR_VM_KERNEL_AUTO_VA);
+						      PANTHOR_VM_KERNEL_AUTO_VA,
+						      "Heap pool");
 	if (IS_ERR(pool->gpu_contexts)) {
 		ret = PTR_ERR(pool->gpu_contexts);
 		goto err_destroy_pool;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 446ec780eb4a..43ee57728de5 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3332,7 +3332,8 @@ group_create_queue(struct panthor_group *group,
 						  DRM_PANTHOR_BO_NO_MMAP,
 						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-						  PANTHOR_VM_KERNEL_AUTO_VA);
+						  PANTHOR_VM_KERNEL_AUTO_VA,
+						  "CS ring buffer");
 	if (IS_ERR(queue->ringbuf)) {
 		ret = PTR_ERR(queue->ringbuf);
 		goto err_free_queue;
@@ -3362,7 +3363,8 @@ group_create_queue(struct panthor_group *group,
 					 DRM_PANTHOR_BO_NO_MMAP,
 					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-					 PANTHOR_VM_KERNEL_AUTO_VA);
+					 PANTHOR_VM_KERNEL_AUTO_VA,
+					 "Group job stats");
 
 	if (IS_ERR(queue->profiling.slots)) {
 		ret = PTR_ERR(queue->profiling.slots);
@@ -3493,7 +3495,8 @@ int panthor_group_create(struct panthor_file *pfile,
 						   DRM_PANTHOR_BO_NO_MMAP,
 						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-						   PANTHOR_VM_KERNEL_AUTO_VA);
+						   PANTHOR_VM_KERNEL_AUTO_VA,
+						   "Group sync objects");
 	if (IS_ERR(group->syncobjs)) {
 		ret = PTR_ERR(group->syncobjs);
 		goto err_put_group;
-- 
2.48.1

