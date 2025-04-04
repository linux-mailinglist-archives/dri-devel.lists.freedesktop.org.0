Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5AA7B9E2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB77810EBBB;
	Fri,  4 Apr 2025 09:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="alvdkG5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E13910EB9D;
 Fri,  4 Apr 2025 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743758799;
 bh=hxJBTuzS+24gjqw89YtmPgSL6j1sBZAB5yNOiBdglJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=alvdkG5/rmYnDSojZDcnMv1yAxHNhDL80q+zI6IO2cyfpaRswRTZB1v6YW5MWRMwz
 +5MkPrEj2B6sTpsexK7ZJhuJ1reAKKURO+vEAUGUUjgqwxFdMLasCPh9kAin1vSIsF
 D3L+p496v6mYeweUsa67VPE2G+Ankc9b0GeDmvOr8s0RLrR5ynvb5VVncp1YsdTyua
 Ogze3JxvILZ4oTnPzVjWpOJRw1Yen7zi0OeFjfBsu3N1Ea8rDYoR6ZnM8xAJhK8LbZ
 9NzjOPNIS0JoCSABDud7MIrGJw/jtKK/i2T/ISGFLacft3nzhJ8lS10msGeULbGjta
 TnXvZoYQe6Pgw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EB94017E105F;
 Fri,  4 Apr 2025 11:26:38 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 5/8] drm/panthor: Allow kernel BOs to pass
 DRM_PANTHOR_BO_ALLOC_ON_FAULT
Date: Fri,  4 Apr 2025 11:26:31 +0200
Message-ID: <20250404092634.2968115-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404092634.2968115-1-boris.brezillon@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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

This will be used by the heap logic to allow for real non-blocking
allocations when growing the heap.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 6 +++---
 drivers/gpu/drm/panthor/panthor_gem.c   | 7 ++++++-
 drivers/gpu/drm/panthor/panthor_gem.h   | 4 ++--
 drivers/gpu/drm/panthor/panthor_sched.c | 6 +++---
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 446bb377b953..cb6b72a513b1 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -446,7 +446,7 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 	int ret;
 
 	mem = panthor_kernel_bo_create(ptdev, ptdev->fw->vm, SZ_8K,
-				       DRM_PANTHOR_BO_NO_MMAP,
+				       DRM_PANTHOR_BO_NO_MMAP, 0,
 				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
 				       PANTHOR_VM_KERNEL_AUTO_VA);
@@ -479,7 +479,7 @@ struct panthor_kernel_bo *
 panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
 {
 	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
-					DRM_PANTHOR_BO_NO_MMAP,
+					DRM_PANTHOR_BO_NO_MMAP, 0,
 					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 					PANTHOR_VM_KERNEL_AUTO_VA);
 }
@@ -600,7 +600,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 
 		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
 							section_size,
-							DRM_PANTHOR_BO_NO_MMAP,
+							DRM_PANTHOR_BO_NO_MMAP, 0,
 							vm_map_flags, va);
 		if (IS_ERR(section->mem))
 			return PTR_ERR(section->mem);
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 52b8d5468d53..809d3ca48ba1 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -75,7 +75,8 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
  */
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
-			 size_t size, u32 bo_flags, u32 vm_map_flags,
+			 size_t size, u32 bo_flags,
+			 u32 alloc_on_fault_granularity, u32 vm_map_flags,
 			 u64 gpu_va)
 {
 	struct drm_gem_shmem_object *obj;
@@ -100,6 +101,10 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
 
+	if (bo_flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT)
+		drm_gem_shmem_sparse_init(&bo->base, &bo->sparse,
+					  alloc_on_fault_granularity);
+
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
 	 * since our PAGE_SIZE alignment might cover a VA range that's
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 53a85a463c1e..8ae0b19b4d90 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -139,8 +139,8 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
 
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
-			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va);
+			 size_t size, u32 bo_flags, u32 alloc_on_fault_granularity,
+			 u32 vm_map_flags, u64 gpu_va);
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 446ec780eb4a..fe86886442bf 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3329,7 +3329,7 @@ group_create_queue(struct panthor_group *group,
 
 	queue->ringbuf = panthor_kernel_bo_create(group->ptdev, group->vm,
 						  args->ringbuf_size,
-						  DRM_PANTHOR_BO_NO_MMAP,
+						  DRM_PANTHOR_BO_NO_MMAP, 0,
 						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
 						  PANTHOR_VM_KERNEL_AUTO_VA);
@@ -3359,7 +3359,7 @@ group_create_queue(struct panthor_group *group,
 		panthor_kernel_bo_create(group->ptdev, group->vm,
 					 queue->profiling.slot_count *
 					 sizeof(struct panthor_job_profiling_data),
-					 DRM_PANTHOR_BO_NO_MMAP,
+					 DRM_PANTHOR_BO_NO_MMAP, 0,
 					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
 					 PANTHOR_VM_KERNEL_AUTO_VA);
@@ -3490,7 +3490,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
 						   group_args->queues.count *
 						   sizeof(struct panthor_syncobj_64b),
-						   DRM_PANTHOR_BO_NO_MMAP,
+						   DRM_PANTHOR_BO_NO_MMAP, 0,
 						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
 						   PANTHOR_VM_KERNEL_AUTO_VA);
-- 
2.49.0

