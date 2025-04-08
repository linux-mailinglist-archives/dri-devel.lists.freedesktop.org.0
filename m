Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB9A81870
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 00:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A5510E2F4;
	Tue,  8 Apr 2025 22:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YovV7t5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (unknown [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D570510E2F4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 22:25:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744151091; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k4cSiDSEEdEg/b+tek0yipQWgLfdkiIXPJCBTBmCAe2R3XePXG7/BGoh4G7ypwy0rTiuZ3HHWtyMnB+Kj2GQU1Eow1IDlzoI+lxEg8ZbjkruY3t3mqXPej6+havAQElQZzP/MO4IISEdHgSuXQ1u1Awpc9I06rx0gIubsmg+L1g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744151091;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZpMc6L1z6n4rJKNDcJ4CojYrBbZbnvM3GJpwcaAounk=; 
 b=g0P1ccb2r8D4fc08Ouw9+TOU+hssDhojcilpgWr1eSLJOz9S9zTdS7dwse2EWwZQrDBv7WBEmJSjGbblPiFtvZp95sq1oeIEYYKnX/eAAJM93y9y1k2Wlyfjjdpwl+sM4TLUfYLHEr6CsQQ6dJuf63E8XEHJovmGZXH3qUyaBQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744151091; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZpMc6L1z6n4rJKNDcJ4CojYrBbZbnvM3GJpwcaAounk=;
 b=YovV7t5nhvJ82dL1so7biJnmk4HnrJ56GmNRJejpbMDdL/rZa8Vh2WHxMA31i3Vn
 /Or0gn7jVRNAwo4nNKLCx3Qu5S8dpDG0AY+ftQjEFMzKPJJrWRQN5J+/LoBzAu5Kx+f
 6hFV5wCFHMKoN0TVtGeN9CtCz37G0KNv3WaDbB14=
Received: by mx.zohomail.com with SMTPS id 174415108977195.94203470063167;
 Tue, 8 Apr 2025 15:24:49 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 3/4] drm/panthor: Label all kernel BO's
Date: Tue,  8 Apr 2025 23:24:23 +0100
Message-ID: <20250408222427.1214330-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
References: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
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

Expand panthor_kernel_bo_create() interface to take a NULL-terminated
string. No bounds checking is done because all label strings are given
as statically-allocated literals, but if a more complex kernel BO naming
scheme with explicit memory allocation and formatting was desired in the
future, this would have to change.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 8 +++++---
 drivers/gpu/drm/panthor/panthor_gem.c   | 4 +++-
 drivers/gpu/drm/panthor/panthor_gem.h   | 2 +-
 drivers/gpu/drm/panthor/panthor_heap.c  | 6 ++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 9 ++++++---
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 4a9c4afa9ad7..07daa7785f87 100644
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
index 7d017f9d1d52..742192c42f58 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -81,7 +81,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va)
+			 u64 gpu_va, const char *name)
 {
 	struct drm_gem_shmem_object *obj;
 	struct panthor_kernel_bo *kbo;
@@ -105,6 +105,8 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
 
+	panthor_gem_kernel_bo_set_label(kbo, name);
+
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
 	 * since our PAGE_SIZE alignment might cover a VA range that's
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index e18fbc093abd..49daa5088a0d 100644
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
index db0285ce5812..ad122bd37ac2 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -147,7 +147,8 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	chunk->bo = panthor_kernel_bo_create(ptdev, vm, heap->chunk_size,
 					     DRM_PANTHOR_BO_NO_MMAP,
 					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
-					     PANTHOR_VM_KERNEL_AUTO_VA);
+					     PANTHOR_VM_KERNEL_AUTO_VA,
+					     "Tiler heap chunk");
 	if (IS_ERR(chunk->bo)) {
 		ret = PTR_ERR(chunk->bo);
 		goto err_free_chunk;
@@ -550,7 +551,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
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
index 1a276db095ff..432a8993a0cb 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3334,7 +3334,8 @@ group_create_queue(struct panthor_group *group,
 						  DRM_PANTHOR_BO_NO_MMAP,
 						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-						  PANTHOR_VM_KERNEL_AUTO_VA);
+						  PANTHOR_VM_KERNEL_AUTO_VA,
+						  "Ring buffer");
 	if (IS_ERR(queue->ringbuf)) {
 		ret = PTR_ERR(queue->ringbuf);
 		goto err_free_queue;
@@ -3364,7 +3365,8 @@ group_create_queue(struct panthor_group *group,
 					 DRM_PANTHOR_BO_NO_MMAP,
 					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-					 PANTHOR_VM_KERNEL_AUTO_VA);
+					 PANTHOR_VM_KERNEL_AUTO_VA,
+					 "Group job stats");
 
 	if (IS_ERR(queue->profiling.slots)) {
 		ret = PTR_ERR(queue->profiling.slots);
@@ -3495,7 +3497,8 @@ int panthor_group_create(struct panthor_file *pfile,
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

