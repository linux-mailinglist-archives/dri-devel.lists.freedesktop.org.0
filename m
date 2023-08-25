Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE63B7887AF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A317210E677;
	Fri, 25 Aug 2023 12:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE43410E677
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692967324; x=1724503324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iEF0vNMqNL/cTq/RPMvFNskszgPZA3eNeHxRTw+6vg4=;
 b=Iw22XTnmJHtHLGOW+6IUH4IfA00s21y6skN7up524FlxrHs3I3lCGz+S
 6vU9qyC9kGWNXxbonYNpvNBKb49VgubWoaB64zN8ZbSfPpNmoYayaSCid
 jfEaoFsNdBBXG5yzxYhZSWTQGFbKZHj5SiIU5WU8DFZvmDz1fiVu7NkeN
 5YETad2PiiTy6sDpIL0ZChmrp6JrdBob+eNnWl3Oxw+RuBwhYV/wJb6lX
 3VeLGwofDXUFkD7glBuoB937U6CqWGQinSPFmv7AAwCstPKFAS5kJJLIC
 XMpMz59vTH94OVAJfjEjHg/nbY6k5d0mUVbTc7rDpEdPMeww/h7kEjkMK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373573919"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="373573919"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911272303"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="911272303"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:42:01 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] accel/ivpu: Add ivpu_bo_vaddr() and ivpu_bo_size()
Date: Fri, 25 Aug 2023 14:41:32 +0200
Message-Id: <20230825124135.4086628-7-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
References: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Use:
  - ivpu_bo_vaddr(bo) instead of bo->kvaddr
  - ivpu_bo_size(bo) instead of bo->base.size

This is a preparation for switch to a drm_gem_shmem_object as a base for
ivpu_bo, where:
  - bo->kvaddr becomes bo->base.vaddr
  - bo->base.size becomes bo->base.base.size

Using ivpu_bo_vaddr() and ivpu_bo_size() increases the readability of
the code.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c     | 18 +++++++++---------
 drivers/accel/ivpu/ivpu_fw_log.c |  6 +++---
 drivers/accel/ivpu/ivpu_gem.c    | 30 +++++++++++++++---------------
 drivers/accel/ivpu/ivpu_gem.h    | 22 ++++++++++++++++------
 drivers/accel/ivpu/ivpu_ipc.c    |  6 +++---
 drivers/accel/ivpu/ivpu_job.c    |  8 ++++----
 drivers/accel/ivpu/ivpu_pm.c     |  2 +-
 7 files changed, 51 insertions(+), 41 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 32a1ea322ca2..2fef9fe154aa 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -321,13 +321,13 @@ void ivpu_fw_load(struct ivpu_device *vdev)
 	struct ivpu_fw_info *fw = vdev->fw;
 	u64 image_end_offset = fw->image_load_offset + fw->image_size;
 
-	memset(fw->mem->kvaddr, 0, fw->image_load_offset);
-	memcpy(fw->mem->kvaddr + fw->image_load_offset,
+	memset(ivpu_bo_vaddr(fw->mem), 0, fw->image_load_offset);
+	memcpy(ivpu_bo_vaddr(fw->mem) + fw->image_load_offset,
 	       fw->file->data + FW_FILE_IMAGE_OFFSET, fw->image_size);
 
 	if (IVPU_WA(clear_runtime_mem)) {
-		u8 *start = fw->mem->kvaddr + image_end_offset;
-		u64 size = fw->mem->base.size - image_end_offset;
+		u8 *start = ivpu_bo_vaddr(fw->mem) + image_end_offset;
+		u64 size = ivpu_bo_size(fw->mem) - image_end_offset;
 
 		memset(start, 0, size);
 	}
@@ -450,10 +450,10 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 					  vdev->hw->ranges.global.start;
 
 	boot_params->ipc_header_area_start = ipc_mem_rx->vpu_addr;
-	boot_params->ipc_header_area_size = ipc_mem_rx->base.size / 2;
+	boot_params->ipc_header_area_size = ivpu_bo_size(ipc_mem_rx) / 2;
 
-	boot_params->ipc_payload_area_start = ipc_mem_rx->vpu_addr + ipc_mem_rx->base.size / 2;
-	boot_params->ipc_payload_area_size = ipc_mem_rx->base.size / 2;
+	boot_params->ipc_payload_area_start = ipc_mem_rx->vpu_addr + ivpu_bo_size(ipc_mem_rx) / 2;
+	boot_params->ipc_payload_area_size = ivpu_bo_size(ipc_mem_rx) / 2;
 
 	boot_params->global_aliased_pio_base = vdev->hw->ranges.user.start;
 	boot_params->global_aliased_pio_size = ivpu_hw_range_size(&vdev->hw->ranges.user);
@@ -485,9 +485,9 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->trace_destination_mask = vdev->fw->trace_destination_mask;
 	boot_params->trace_hw_component_mask = vdev->fw->trace_hw_component_mask;
 	boot_params->crit_tracing_buff_addr = vdev->fw->mem_log_crit->vpu_addr;
-	boot_params->crit_tracing_buff_size = vdev->fw->mem_log_crit->base.size;
+	boot_params->crit_tracing_buff_size = ivpu_bo_size(vdev->fw->mem_log_crit);
 	boot_params->verbose_tracing_buff_addr = vdev->fw->mem_log_verb->vpu_addr;
-	boot_params->verbose_tracing_buff_size = vdev->fw->mem_log_verb->base.size;
+	boot_params->verbose_tracing_buff_size = ivpu_bo_size(vdev->fw->mem_log_verb);
 
 	boot_params->punit_telemetry_sram_base = ivpu_hw_reg_telemetry_offset_get(vdev);
 	boot_params->punit_telemetry_sram_size = ivpu_hw_reg_telemetry_size_get(vdev);
diff --git a/drivers/accel/ivpu/ivpu_fw_log.c b/drivers/accel/ivpu/ivpu_fw_log.c
index 95065cac9fbd..f6770f5e82a2 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.c
+++ b/drivers/accel/ivpu/ivpu_fw_log.c
@@ -31,10 +31,10 @@ static int fw_log_ptr(struct ivpu_device *vdev, struct ivpu_bo *bo, u32 *offset,
 {
 	struct vpu_tracing_buffer_header *log;
 
-	if ((*offset + sizeof(*log)) > bo->base.size)
+	if ((*offset + sizeof(*log)) > ivpu_bo_size(bo))
 		return -EINVAL;
 
-	log = bo->kvaddr + *offset;
+	log = ivpu_bo_vaddr(bo) + *offset;
 
 	if (log->vpu_canary_start != VPU_TRACING_BUFFER_CANARY)
 		return -EINVAL;
@@ -43,7 +43,7 @@ static int fw_log_ptr(struct ivpu_device *vdev, struct ivpu_bo *bo, u32 *offset,
 		ivpu_dbg(vdev, FW_BOOT, "Invalid header size 0x%x\n", log->header_size);
 		return -EINVAL;
 	}
-	if ((char *)log + log->size > (char *)bo->kvaddr + bo->base.size) {
+	if ((char *)log + log->size > (char *)ivpu_bo_vaddr(bo) + ivpu_bo_size(bo)) {
 		ivpu_dbg(vdev, FW_BOOT, "Invalid log size 0x%x\n", log->size);
 		return -EINVAL;
 	}
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index d09f13b35902..c91852f2edc8 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -69,7 +69,7 @@ static const struct ivpu_bo_ops prime_ops = {
 
 static int __must_check shmem_alloc_pages_locked(struct ivpu_bo *bo)
 {
-	int npages = bo->base.size >> PAGE_SHIFT;
+	int npages = ivpu_bo_size(bo) >> PAGE_SHIFT;
 	struct page **pages;
 
 	pages = drm_gem_get_pages(&bo->base);
@@ -88,7 +88,7 @@ static int __must_check shmem_alloc_pages_locked(struct ivpu_bo *bo)
 static void shmem_free_pages_locked(struct ivpu_bo *bo)
 {
 	if (ivpu_bo_cache_mode(bo) != DRM_IVPU_BO_CACHED)
-		set_pages_array_wb(bo->pages, bo->base.size >> PAGE_SHIFT);
+		set_pages_array_wb(bo->pages, ivpu_bo_size(bo) >> PAGE_SHIFT);
 
 	drm_gem_put_pages(&bo->base, bo->pages, true, false);
 	bo->pages = NULL;
@@ -96,7 +96,7 @@ static void shmem_free_pages_locked(struct ivpu_bo *bo)
 
 static int ivpu_bo_map_pages_locked(struct ivpu_bo *bo)
 {
-	int npages = bo->base.size >> PAGE_SHIFT;
+	int npages = ivpu_bo_size(bo) >> PAGE_SHIFT;
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
 	struct sg_table *sgt;
 	int ret;
@@ -142,7 +142,7 @@ static const struct ivpu_bo_ops shmem_ops = {
 
 static int __must_check internal_alloc_pages_locked(struct ivpu_bo *bo)
 {
-	unsigned int i, npages = bo->base.size >> PAGE_SHIFT;
+	unsigned int i, npages = ivpu_bo_size(bo) >> PAGE_SHIFT;
 	struct page **pages;
 	int ret;
 
@@ -171,10 +171,10 @@ static int __must_check internal_alloc_pages_locked(struct ivpu_bo *bo)
 
 static void internal_free_pages_locked(struct ivpu_bo *bo)
 {
-	unsigned int i, npages = bo->base.size >> PAGE_SHIFT;
+	unsigned int i, npages = ivpu_bo_size(bo) >> PAGE_SHIFT;
 
 	if (ivpu_bo_cache_mode(bo) != DRM_IVPU_BO_CACHED)
-		set_pages_array_wb(bo->pages, bo->base.size >> PAGE_SHIFT);
+		set_pages_array_wb(bo->pages, ivpu_bo_size(bo) >> PAGE_SHIFT);
 
 	for (i = 0; i < npages; i++)
 		put_page(bo->pages[i]);
@@ -291,7 +291,7 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
 	}
 
 	mutex_lock(&ctx->lock);
-	ret = ivpu_mmu_context_insert_node_locked(ctx, range, bo->base.size, &bo->mm_node);
+	ret = ivpu_mmu_context_insert_node_locked(ctx, range, ivpu_bo_size(bo), &bo->mm_node);
 	if (!ret) {
 		bo->ctx = ctx;
 		bo->vpu_addr = bo->mm_node.start;
@@ -438,7 +438,7 @@ static int ivpu_bo_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
 
 	ivpu_dbg(vdev, BO, "mmap: ctx %u handle %u vpu_addr 0x%llx size %zu type %s",
-		 bo->ctx->id, bo->handle, bo->vpu_addr, bo->base.size, bo->ops->name);
+		 bo->ctx->id, bo->handle, bo->vpu_addr, ivpu_bo_size(bo), bo->ops->name);
 
 	if (obj->import_attach) {
 		/* Drop the reference drm_gem_mmap_obj() acquired.*/
@@ -553,7 +553,7 @@ ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	drm_gem_object_put(&bo->base);
 
 	ivpu_dbg(vdev, BO, "alloc shmem: ctx %u vpu_addr 0x%llx size %zu flags 0x%x\n",
-		 file_priv->ctx.id, bo->vpu_addr, bo->base.size, bo->flags);
+		 file_priv->ctx.id, bo->vpu_addr, ivpu_bo_size(bo), bo->flags);
 
 	return ret;
 }
@@ -590,22 +590,22 @@ ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 fla
 		goto err_put;
 
 	if (ivpu_bo_cache_mode(bo) != DRM_IVPU_BO_CACHED)
-		drm_clflush_pages(bo->pages, bo->base.size >> PAGE_SHIFT);
+		drm_clflush_pages(bo->pages, ivpu_bo_size(bo) >> PAGE_SHIFT);
 
 	if (bo->flags & DRM_IVPU_BO_WC)
-		set_pages_array_wc(bo->pages, bo->base.size >> PAGE_SHIFT);
+		set_pages_array_wc(bo->pages, ivpu_bo_size(bo) >> PAGE_SHIFT);
 	else if (bo->flags & DRM_IVPU_BO_UNCACHED)
-		set_pages_array_uc(bo->pages, bo->base.size >> PAGE_SHIFT);
+		set_pages_array_uc(bo->pages, ivpu_bo_size(bo) >> PAGE_SHIFT);
 
 	prot = ivpu_bo_pgprot(bo, PAGE_KERNEL);
-	bo->kvaddr = vmap(bo->pages, bo->base.size >> PAGE_SHIFT, VM_MAP, prot);
+	bo->kvaddr = vmap(bo->pages, ivpu_bo_size(bo) >> PAGE_SHIFT, VM_MAP, prot);
 	if (!bo->kvaddr) {
 		ivpu_err(vdev, "Failed to map BO into kernel virtual memory\n");
 		goto err_put;
 	}
 
 	ivpu_dbg(vdev, BO, "alloc internal: ctx 0 vpu_addr 0x%llx size %zu flags 0x%x\n",
-		 bo->vpu_addr, bo->base.size, flags);
+		 bo->vpu_addr, ivpu_bo_size(bo), flags);
 
 	return bo;
 
@@ -718,7 +718,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
 		dma_refcount = atomic_long_read(&bo->base.dma_buf->file->f_count);
 
 	drm_printf(p, "%5u %6d %16llx %10lu %10u %12lu %14s\n",
-		   bo->ctx->id, bo->handle, bo->vpu_addr, bo->base.size,
+		   bo->ctx->id, bo->handle, bo->vpu_addr, ivpu_bo_size(bo),
 		   kref_read(&bo->base.refcount), dma_refcount, bo->ops->name);
 }
 
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 6b0ceda5f253..a0b4d4a32b3b 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -68,9 +68,19 @@ static inline struct ivpu_bo *to_ivpu_bo(struct drm_gem_object *obj)
 	return container_of(obj, struct ivpu_bo, base);
 }
 
+static inline void *ivpu_bo_vaddr(struct ivpu_bo *bo)
+{
+	return bo->kvaddr;
+}
+
+static inline size_t ivpu_bo_size(struct ivpu_bo *bo)
+{
+	return bo->base.size;
+}
+
 static inline struct page *ivpu_bo_get_page(struct ivpu_bo *bo, u64 offset)
 {
-	if (offset > bo->base.size || !bo->pages)
+	if (offset > ivpu_bo_size(bo) || !bo->pages)
 		return NULL;
 
 	return bo->pages[offset / PAGE_SIZE];
@@ -107,21 +117,21 @@ static inline void *ivpu_to_cpu_addr(struct ivpu_bo *bo, u32 vpu_addr)
 	if (vpu_addr < bo->vpu_addr)
 		return NULL;
 
-	if (vpu_addr >= (bo->vpu_addr + bo->base.size))
+	if (vpu_addr >= (bo->vpu_addr + ivpu_bo_size(bo)))
 		return NULL;
 
-	return bo->kvaddr + (vpu_addr - bo->vpu_addr);
+	return ivpu_bo_vaddr(bo) + (vpu_addr - bo->vpu_addr);
 }
 
 static inline u32 cpu_to_vpu_addr(struct ivpu_bo *bo, void *cpu_addr)
 {
-	if (cpu_addr < bo->kvaddr)
+	if (cpu_addr < ivpu_bo_vaddr(bo))
 		return 0;
 
-	if (cpu_addr >= (bo->kvaddr + bo->base.size))
+	if (cpu_addr >= (ivpu_bo_vaddr(bo) + ivpu_bo_size(bo)))
 		return 0;
 
-	return bo->vpu_addr + (cpu_addr - bo->kvaddr);
+	return bo->vpu_addr + (cpu_addr - ivpu_bo_vaddr(bo));
 }
 
 #endif /* __IVPU_GEM_H__ */
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 6b2e9dbb284a..c2541035a30f 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -449,7 +449,7 @@ int ivpu_ipc_init(struct ivpu_device *vdev)
 		goto err_free_rx;
 	}
 
-	ret = gen_pool_add(ipc->mm_tx, ipc->mem_tx->vpu_addr, ipc->mem_tx->base.size, -1);
+	ret = gen_pool_add(ipc->mm_tx, ipc->mem_tx->vpu_addr, ivpu_bo_size(ipc->mem_tx), -1);
 	if (ret) {
 		ivpu_err(vdev, "gen_pool_add failed, ret %d\n", ret);
 		goto err_free_rx;
@@ -505,8 +505,8 @@ void ivpu_ipc_reset(struct ivpu_device *vdev)
 
 	mutex_lock(&ipc->lock);
 
-	memset(ipc->mem_tx->kvaddr, 0, ipc->mem_tx->base.size);
-	memset(ipc->mem_rx->kvaddr, 0, ipc->mem_rx->base.size);
+	memset(ivpu_bo_vaddr(ipc->mem_tx), 0, ivpu_bo_size(ipc->mem_tx));
+	memset(ivpu_bo_vaddr(ipc->mem_rx), 0, ivpu_bo_size(ipc->mem_rx));
 	wmb(); /* Flush WC buffers for TX and RX rings */
 
 	mutex_unlock(&ipc->lock);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index de9e69f70af7..689dc0d13b8f 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -48,10 +48,10 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv, u16 e
 		goto cmdq_free;
 
 	cmdq->db_id = file_priv->ctx.id + engine * ivpu_get_context_count(vdev);
-	cmdq->entry_count = (u32)((cmdq->mem->base.size - sizeof(struct vpu_job_queue_header)) /
+	cmdq->entry_count = (u32)((ivpu_bo_size(cmdq->mem) - sizeof(struct vpu_job_queue_header)) /
 				  sizeof(struct vpu_job_queue_entry));
 
-	cmdq->jobq = (struct vpu_job_queue *)cmdq->mem->kvaddr;
+	cmdq->jobq = (struct vpu_job_queue *)ivpu_bo_vaddr(cmdq->mem);
 	jobq_header = &cmdq->jobq->header;
 	jobq_header->engine_idx = engine;
 	jobq_header->head = 0;
@@ -93,7 +93,7 @@ static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16
 		return cmdq;
 
 	ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, cmdq->db_id,
-				   cmdq->mem->vpu_addr, cmdq->mem->base.size);
+				   cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
 	if (ret)
 		return NULL;
 
@@ -453,7 +453,7 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 		return -EBUSY;
 	}
 
-	if (commands_offset >= bo->base.size) {
+	if (commands_offset >= ivpu_bo_size(bo)) {
 		ivpu_warn(vdev, "Invalid command buffer offset %u\n", commands_offset);
 		return -EINVAL;
 	}
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 54c59f9cbae7..4d359b3d4d3a 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -37,7 +37,7 @@ static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
 static void ivpu_pm_prepare_warm_boot(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
-	struct vpu_boot_params *bp = fw->mem->kvaddr;
+	struct vpu_boot_params *bp = ivpu_bo_vaddr(fw->mem);
 
 	if (!bp->save_restore_ret_address) {
 		ivpu_pm_prepare_cold_boot(vdev);
-- 
2.25.1

