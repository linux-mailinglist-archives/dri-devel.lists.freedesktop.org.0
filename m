Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65B7DF48D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D964F10E0E7;
	Thu,  2 Nov 2023 14:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B062B10E0C5;
 Thu,  2 Nov 2023 14:05:22 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6bd20c30831so234589b3a.1; 
 Thu, 02 Nov 2023 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698933921; x=1699538721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrlZ/FucKuPd7Q344+8/mwyU6HQbYaPTPD4mA4C7cGQ=;
 b=lTmoiZeRExKC0o6QGprx4d9tebg58yTA4d6pNzi9Y2ycwwmNNXpmc/QBpE7+Leuuwp
 xeV+kezQLqU+kCbGgdwZSEadNUyss9NUlBa6lYilGVFu54nztjOR80Tv2bARO5suy2GI
 azahYSmEvLFFx8FsJhA1U5x9NSin/mpAcfuOq0HvPrfK1FW+a88c6rLvVH+aP9bXpLXW
 7/ysOc1tPZdQC3vLIRZq8P5i5c/A5u6LV07gzmOLSwumSTW+yeCUPVo4SYKMDvnF5btV
 XeskT3ejFTkNCd7yUgrDJqouhxm6UWlf4d1Hud0SKVeoGfwS+oX3PKH5DdFX6Ig+3yr6
 EC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698933921; x=1699538721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrlZ/FucKuPd7Q344+8/mwyU6HQbYaPTPD4mA4C7cGQ=;
 b=TYhu8Xg+0ifXf+QgpbYHlNj8pebMrAerkW+w2NN01W2bjIpWGQwobxmfpxVczQ0LDd
 zA7S2u1JxWad0CUKjPg6xbr/jtu7mtrIqiYtQ34rqlCDxrDpOd5euE3VN5ERt8/Bwc4Q
 wdizcGob3KFGvIWcJlvd9euapRDs0gLo9WF2ijiRBX/eNNdWHjC+CHucFcqPZZW4Vlya
 m9gddkxENtxAkP4PxvpHulYFa3Y60NUzPWa0eoxew9WdW5KCdR86J6Z30Pj82kdz6Qvh
 RzgCo+5lTSZ61YrdbOX0GqQ/nNk45a7AvHLAxeLcVdkktxil+QqoB1d26MMqpgwp/euH
 X6kg==
X-Gm-Message-State: AOJu0YzOHp5+gj0dqftQ1kenahTmI4jLp1sc27KutMjIDSpyI6Y9zhdz
 gUJpBjoEOUa1u1eETDInRv3PGr8bLJ+WJi2v
X-Google-Smtp-Source: AGHT+IGJXKuQufxA8J+rDOHE49eLbn5Wf1v8E5Nh1nzacljxaVBhTJxAWRygLbTaOCmTwpDTFHMIjA==
X-Received: by 2002:a17:90b:3781:b0:27d:15e3:3aa9 with SMTP id
 mz1-20020a17090b378100b0027d15e33aa9mr17921203pjb.3.1698933920988; 
 Thu, 02 Nov 2023 07:05:20 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 nt9-20020a17090b248900b0027df6ff00eesm2522494pjb.19.2023.11.02.07.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 07:05:20 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/amdgpu: Add flag to disable implicit sync for GEM
 operations.
Date: Thu,  2 Nov 2023 23:04:35 +0900
Message-ID: <20231102140436.180989-3-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102140436.180989-1-ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231102140436.180989-1-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In Vulkan, it is the application's responsibility to perform adequate
synchronization before a sparse unmap, replace or BO destroy operation.
Until now, the kernel applied the same rule as implicitly-synchronized
APIs like OpenGL, which with per-VM BOs made page table updates stall the
queue completely. The newly added AMDGPU_VM_EXPLICIT_SYNC flag allows
drivers to opt-out of this behavior, while still ensuring adequate implicit
sync happens for kernel-initiated updates (e.g. BO moves).

We record whether to use implicit sync or not for each freed mapping. To
avoid increasing the mapping struct's size, this is union-ized with the
interval tree field which is unused after the unmap.

The reason this is done with a GEM ioctl flag, instead of being a VM /
context global setting, is that the current libdrm implementation shares
the DRM handle even between different kind of drivers (radeonsi vs radv).

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 14 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 47 +++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 23 +++++----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 +++----
 include/uapi/drm/amdgpu_drm.h                 |  2 +
 9 files changed, 71 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 7d6daf8d2bfa..10e129bff977 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1196,7 +1196,7 @@ static void unmap_bo_from_gpuvm(struct kgd_mem *mem,
 	struct amdgpu_device *adev = entry->adev;
 	struct amdgpu_vm *vm = bo_va->base.vm;
 
-	amdgpu_vm_bo_unmap(adev, bo_va, entry->va);
+	amdgpu_vm_bo_unmap(adev, bo_va, entry->va, true);
 
 	amdgpu_vm_clear_freed(adev, vm, &bo_va->last_pt_update);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index 720011019741..612279e65bff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -122,7 +122,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		}
 	}
 
-	r = amdgpu_vm_bo_unmap(adev, bo_va, csa_addr);
+	r = amdgpu_vm_bo_unmap(adev, bo_va, csa_addr, true);
 	if (r) {
 		DRM_ERROR("failed to do bo_unmap on static CSA, err=%d\n", r);
 		goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a1b15d0d6c48..cca68b89754e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -667,9 +667,9 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	const uint32_t valid_flags = AMDGPU_VM_DELAY_UPDATE |
 		AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE |
 		AMDGPU_VM_PAGE_EXECUTABLE | AMDGPU_VM_MTYPE_MASK |
-		AMDGPU_VM_PAGE_NOALLOC;
+		AMDGPU_VM_PAGE_NOALLOC | AMDGPU_VM_EXPLICIT_SYNC;
 	const uint32_t prt_flags = AMDGPU_VM_DELAY_UPDATE |
-		AMDGPU_VM_PAGE_PRT;
+		AMDGPU_VM_PAGE_PRT | AMDGPU_VM_EXPLICIT_SYNC;
 
 	struct drm_amdgpu_gem_va *args = data;
 	struct drm_gem_object *gobj;
@@ -680,6 +680,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	struct drm_exec exec;
 	uint64_t va_flags;
 	uint64_t vm_size;
+	bool sync_unmap;
 	int r = 0;
 
 	if (args->va_address < AMDGPU_VA_RESERVED_SIZE) {
@@ -715,6 +716,8 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
+	sync_unmap = !(args->flags & AMDGPU_VM_EXPLICIT_SYNC);
+
 	switch (args->operation) {
 	case AMDGPU_VA_OP_MAP:
 	case AMDGPU_VA_OP_UNMAP:
@@ -774,19 +777,20 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 				     va_flags);
 		break;
 	case AMDGPU_VA_OP_UNMAP:
-		r = amdgpu_vm_bo_unmap(adev, bo_va, args->va_address);
+		r = amdgpu_vm_bo_unmap(adev, bo_va, args->va_address,
+				       sync_unmap);
 		break;
 
 	case AMDGPU_VA_OP_CLEAR:
 		r = amdgpu_vm_bo_clear_mappings(adev, &fpriv->vm,
 						args->va_address,
-						args->map_size);
+						args->map_size, sync_unmap);
 		break;
 	case AMDGPU_VA_OP_REPLACE:
 		va_flags = amdgpu_gem_va_map_flags(adev, args->flags);
 		r = amdgpu_vm_bo_replace_map(adev, bo_va, args->va_address,
 					     args->offset_in_bo, args->map_size,
-					     va_flags);
+					     va_flags, sync_unmap);
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index f3ee83cdf97e..28be03f1bbcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -67,7 +67,12 @@ struct amdgpu_bo_va_mapping {
 	struct rb_node			rb;
 	uint64_t			start;
 	uint64_t			last;
-	uint64_t			__subtree_last;
+	union {
+		/* BOs in interval tree only */
+		uint64_t		__subtree_last;
+		/* Freed BOs only */
+		bool			sync_unmap;
+	};
 	uint64_t			offset;
 	uint64_t			flags;
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 2fd1bfb35916..e71443c8c59b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -276,6 +276,7 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
 			     __field(long, last)
 			     __field(u64, offset)
 			     __field(u64, flags)
+			     __field(bool, sync_unmap)
 			     ),
 
 	    TP_fast_assign(
@@ -284,10 +285,11 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
 			   __entry->last = mapping->last;
 			   __entry->offset = mapping->offset;
 			   __entry->flags = mapping->flags;
+			   __entry->sync_unmap = mapping->sync_unmap;
 			   ),
-	    TP_printk("bo=%p, start=%lx, last=%lx, offset=%010llx, flags=%llx",
+	    TP_printk("bo=%p, start=%lx, last=%lx, offset=%010llx, flags=%llx, sync_unmap=%d",
 		      __entry->bo, __entry->start, __entry->last,
-		      __entry->offset, __entry->flags)
+		      __entry->offset, __entry->flags, __entry->sync_unmap)
 );
 
 DECLARE_EVENT_CLASS(amdgpu_vm_mapping,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 7b9762f1cddd..a74472e16952 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -844,6 +844,7 @@ static void amdgpu_vm_tlb_seq_cb(struct dma_fence *fence,
  * @immediate: immediate submission in a page fault
  * @unlocked: unlocked invalidation during MM callback
  * @flush_tlb: trigger tlb invalidation after update completed
+ * @sync_unmap: wait for BO users before unmapping
  * @resv: fences we need to sync to
  * @start: start of mapped range
  * @last: last mapped entry
@@ -861,8 +862,9 @@ static void amdgpu_vm_tlb_seq_cb(struct dma_fence *fence,
  */
 int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			   bool immediate, bool unlocked, bool flush_tlb,
-			   struct dma_resv *resv, uint64_t start, uint64_t last,
-			   uint64_t flags, uint64_t offset, uint64_t vram_base,
+			   bool sync_unmap, struct dma_resv *resv,
+			   uint64_t start, uint64_t last, uint64_t flags,
+			   uint64_t offset, uint64_t vram_base,
 			   struct ttm_resource *res, dma_addr_t *pages_addr,
 			   struct dma_fence **fence)
 {
@@ -902,7 +904,7 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	/* Implicitly sync to command submissions in the same VM before
 	 * unmapping. Sync to moving fences before mapping.
 	 */
-	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))
+	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)) && sync_unmap)
 		sync_mode = AMDGPU_SYNC_EQ_OWNER;
 	else
 		sync_mode = AMDGPU_SYNC_EXPLICIT;
@@ -1145,10 +1147,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 		trace_amdgpu_vm_bo_update(mapping);
 
 		r = amdgpu_vm_update_range(adev, vm, false, false, flush_tlb,
-					   resv, mapping->start, mapping->last,
-					   update_flags, mapping->offset,
-					   vram_base, mem, pages_addr,
-					   last_update);
+					   true, resv, mapping->start,
+					   mapping->last, update_flags,
+					   mapping->offset, vram_base, mem,
+					   pages_addr, last_update);
 		if (r)
 			return r;
 	}
@@ -1340,7 +1342,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 		    mapping->start < AMDGPU_GMC_HOLE_START)
 			init_pte_value = AMDGPU_PTE_DEFAULT_ATC;
 
-		r = amdgpu_vm_update_range(adev, vm, false, false, true, resv,
+		r = amdgpu_vm_update_range(adev, vm, false, false, true,
+					   mapping->sync_unmap, resv,
 					   mapping->start, mapping->last,
 					   init_pte_value, 0, 0, NULL, NULL,
 					   &f);
@@ -1572,6 +1575,7 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
  * @offset: requested offset in the BO
  * @size: BO size in bytes
  * @flags: attributes of pages (read/write/valid/etc.)
+ * @sync_unmap: wait for BO users before replacing existing mapping
  *
  * Add a mapping of the BO at the specefied addr into the VM. Replace existing
  * mappings as we do so.
@@ -1582,9 +1586,9 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
  * Object has to be reserved and unreserved outside!
  */
 int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
-			     struct amdgpu_bo_va *bo_va,
-			     uint64_t saddr, uint64_t offset,
-			     uint64_t size, uint64_t flags)
+			     struct amdgpu_bo_va *bo_va, uint64_t saddr,
+			     uint64_t offset, uint64_t size, uint64_t flags,
+			     bool sync_unmap)
 {
 	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_bo *bo = bo_va->base.bo;
@@ -1608,7 +1612,7 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
 	if (!mapping)
 		return -ENOMEM;
 
-	r = amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, size);
+	r = amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, size, sync_unmap);
 	if (r) {
 		kfree(mapping);
 		return r;
@@ -1633,6 +1637,7 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
  * @adev: amdgpu_device pointer
  * @bo_va: bo_va to remove the address from
  * @saddr: where to the BO is mapped
+ * @sync_unmap: wait for BO users before unmapping
  *
  * Remove a mapping of the BO at the specefied addr from the VM.
  *
@@ -1641,9 +1646,8 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
  *
  * Object has to be reserved and unreserved outside!
  */
-int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
-		       struct amdgpu_bo_va *bo_va,
-		       uint64_t saddr)
+int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
+		       uint64_t saddr, bool sync_unmap)
 {
 	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_vm *vm = bo_va->base.vm;
@@ -1671,6 +1675,7 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
 	list_del(&mapping->list);
 	amdgpu_vm_it_remove(mapping, &vm->va);
 	mapping->bo_va = NULL;
+	mapping->sync_unmap = sync_unmap;
 	trace_amdgpu_vm_bo_unmap(bo_va, mapping);
 
 	if (valid)
@@ -1689,6 +1694,7 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
  * @vm: VM structure to use
  * @saddr: start of the range
  * @size: size of the range
+ * @sync_unmap: wait for BO users before unmapping
  *
  * Remove all mappings in a range, split them as appropriate.
  *
@@ -1696,8 +1702,8 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
  * 0 for success, error for failure.
  */
 int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
-				struct amdgpu_vm *vm,
-				uint64_t saddr, uint64_t size)
+				struct amdgpu_vm *vm, uint64_t saddr,
+				uint64_t size, bool sync_unmap)
 {
 	struct amdgpu_bo_va_mapping *before, *after, *tmp, *next;
 	LIST_HEAD(removed);
@@ -1761,6 +1767,7 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
 		    tmp->last = eaddr;
 
 		tmp->bo_va = NULL;
+		tmp->sync_unmap = sync_unmap;
 		list_add(&tmp->list, &vm->freed);
 		trace_amdgpu_vm_bo_unmap(NULL, tmp);
 	}
@@ -1889,6 +1896,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
 		list_del(&mapping->list);
 		amdgpu_vm_it_remove(mapping, &vm->va);
 		mapping->bo_va = NULL;
+		mapping->sync_unmap = true;
 		trace_amdgpu_vm_bo_unmap(bo_va, mapping);
 		list_add(&mapping->list, &vm->freed);
 	}
@@ -2617,8 +2625,9 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 		goto error_unlock;
 	}
 
-	r = amdgpu_vm_update_range(adev, vm, true, false, false, NULL, addr,
-				   addr, flags, value, 0, NULL, NULL, NULL);
+	r = amdgpu_vm_update_range(adev, vm, true, false, false, true, NULL,
+				   addr, addr, flags, value, 0, NULL, NULL,
+				   NULL);
 	if (r)
 		goto error_unlock;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 204ab13184ed..73b7b49fdb2e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -423,12 +423,12 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
 int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			   bool immediate, bool unlocked, bool flush_tlb,
-			   struct dma_resv *resv, uint64_t start, uint64_t last,
-			   uint64_t flags, uint64_t offset, uint64_t vram_base,
+			   bool sync_unmap, struct dma_resv *resv,
+			   uint64_t start, uint64_t last, uint64_t flags,
+			   uint64_t offset, uint64_t vram_base,
 			   struct ttm_resource *res, dma_addr_t *pages_addr,
 			   struct dma_fence **fence);
-int amdgpu_vm_bo_update(struct amdgpu_device *adev,
-			struct amdgpu_bo_va *bo_va,
+int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 			bool clear);
 bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
 void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
@@ -444,15 +444,14 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
 		     uint64_t addr, uint64_t offset,
 		     uint64_t size, uint64_t flags);
 int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
-			     struct amdgpu_bo_va *bo_va,
-			     uint64_t addr, uint64_t offset,
-			     uint64_t size, uint64_t flags);
-int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
-		       struct amdgpu_bo_va *bo_va,
-		       uint64_t addr);
+			     struct amdgpu_bo_va *bo_va, uint64_t addr,
+			     uint64_t offset, uint64_t size, uint64_t flags,
+			     bool sync_unmap);
+int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
+		       uint64_t addr, bool sync_unmap);
 int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
-				struct amdgpu_vm *vm,
-				uint64_t saddr, uint64_t size);
+				struct amdgpu_vm *vm, uint64_t saddr,
+				uint64_t size, bool sync_unmap);
 struct amdgpu_bo_va_mapping *amdgpu_vm_bo_lookup_mapping(struct amdgpu_vm *vm,
 							 uint64_t addr);
 void amdgpu_vm_bo_trace_cs(struct amdgpu_vm *vm, struct ww_acquire_ctx *ticket);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index bb16b795d1bc..6eb4a0a4bc84 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1291,9 +1291,9 @@ svm_range_unmap_from_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
 	pr_debug("[0x%llx 0x%llx]\n", start, last);
 
-	return amdgpu_vm_update_range(adev, vm, false, true, true, NULL, start,
-				      last, init_pte_value, 0, 0, NULL, NULL,
-				      fence);
+	return amdgpu_vm_update_range(adev, vm, false, true, true, true, NULL,
+				      start, last, init_pte_value, 0, 0, NULL,
+				      NULL, fence);
 }
 
 static int
@@ -1398,12 +1398,12 @@ svm_range_map_to_gpu(struct kfd_process_device *pdd, struct svm_range *prange,
 		 * different memory partition based on fpfn/lpfn, we should use
 		 * same vm_manager.vram_base_offset regardless memory partition.
 		 */
-		r = amdgpu_vm_update_range(adev, vm, false, false, flush_tlb, NULL,
-					   last_start, prange->start + i,
-					   pte_flags,
-					   (last_start - prange->start) << PAGE_SHIFT,
-					   bo_adev ? bo_adev->vm_manager.vram_base_offset : 0,
-					   NULL, dma_addr, &vm->last_update);
+		r = amdgpu_vm_update_range(
+			adev, vm, false, false, flush_tlb, true, NULL,
+			last_start, prange->start + i, pte_flags,
+			(last_start - prange->start) << PAGE_SHIFT,
+			bo_adev ? bo_adev->vm_manager.vram_base_offset : 0,
+			NULL, dma_addr, &vm->last_update);
 
 		for (j = last_start - prange->start; j <= i; j++)
 			dma_addr[j] |= last_domain;
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index f477eda6a2b8..3cdcc299956e 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -556,6 +556,8 @@ struct drm_amdgpu_gem_op {
 #define AMDGPU_VM_MTYPE_RW		(5 << 5)
 /* don't allocate MALL */
 #define AMDGPU_VM_PAGE_NOALLOC		(1 << 9)
+/* don't sync on unmap */
+#define AMDGPU_VM_EXPLICIT_SYNC		(1 << 10)
 
 struct drm_amdgpu_gem_va {
 	/** GEM object handle */
-- 
2.42.0

