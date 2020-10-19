Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3AA293131
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 00:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71026EB54;
	Mon, 19 Oct 2020 22:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2106EB4E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 22:23:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-lsiO6hTvNhmb8bZJ5TGqUQ-1; Mon, 19 Oct 2020 18:23:07 -0400
X-MC-Unique: lsiO6hTvNhmb8bZJ5TGqUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C2BF8030B3;
 Mon, 19 Oct 2020 22:23:06 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 530F81002391;
 Mon, 19 Oct 2020 22:23:05 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/ttm: add bo size in bytes wrapper.
Date: Tue, 20 Oct 2020 08:22:56 +1000
Message-Id: <20201019222257.1684769-5-airlied@gmail.com>
In-Reply-To: <20201019222257.1684769-1-airlied@gmail.com>
References: <20201019222257.1684769-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

We store size and num pages, wrap size so it can be removed.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c           | 2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c             | 8 ++++----
 drivers/gpu/drm/nouveau/nouveau_display.c        | 6 +++---
 drivers/gpu/drm/ttm/ttm_bo.c                     | 4 ++--
 include/drm/ttm/ttm_bo_api.h                     | 5 +++++
 6 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 64d4b5ff95d6..60e8fdbcfd89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -454,7 +454,7 @@ static int add_bo_to_vm(struct amdgpu_device *adev, struct kgd_mem *mem,
 	struct amdgpu_bo *bo = mem->bo;
 	uint64_t va = mem->va;
 	struct list_head *list_bo_va = &mem->bo_va_list;
-	unsigned long bo_size = bo->tbo.mem.size;
+	unsigned long bo_size = ttm_bo_size_bytes(&bo->tbo);
 
 	if (!va) {
 		pr_err("Invalid VA when adding BO to VM\n");
@@ -1282,7 +1282,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct kgd_dev *kgd, struct kgd_mem *mem, uint64_t *size)
 {
 	struct amdkfd_process_info *process_info = mem->process_info;
-	unsigned long bo_size = mem->bo->tbo.mem.size;
+	unsigned long bo_size = ttm_bo_size_bytes(&mem->bo->tbo);
 	struct kfd_bo_va_list *entry, *tmp;
 	struct bo_vm_reservation_context ctx;
 	struct ttm_validate_buffer *bo_list_entry;
@@ -1403,7 +1403,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	mutex_lock(&mem->lock);
 
 	domain = mem->domain;
-	bo_size = bo->tbo.mem.size;
+	bo_size = ttm_bo_size_bytes(&bo->tbo);
 
 	pr_debug("Map VA 0x%llx - 0x%llx to vm %p domain %s\n",
 			mem->va,
@@ -1507,7 +1507,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	struct amdkfd_process_info *process_info =
 		((struct amdgpu_vm *)vm)->process_info;
-	unsigned long bo_size = mem->bo->tbo.mem.size;
+	unsigned long bo_size = ttm_bo_size_bytes(&mem->bo->tbo);
 	struct kfd_bo_va_list *entry;
 	struct bo_vm_reservation_context ctx;
 	int ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 4b746584a797..f3b3276a27e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -554,7 +554,7 @@ static int mes_v10_1_allocate_eop_buf(struct amdgpu_device *adev)
 		return r;
 	}
 
-	memset(eop, 0, adev->mes.eop_gpu_obj->tbo.mem.size);
+	memset(eop, 0, ttm_bo_size_bytes(&adev->mes.eop_gpu_obj->tbo));
 
 	amdgpu_bo_kunmap(adev->mes.eop_gpu_obj);
 	amdgpu_bo_unreserve(adev->mes.eop_gpu_obj);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index ec79c3b251e8..3c24873ae8e9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -473,10 +473,10 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
 
 	switch (bo->mem.mem_type) {
 	case TTM_PL_VRAM:
-		drm->gem.vram_available -= bo->mem.size;
+		drm->gem.vram_available -= ttm_bo_size_bytes(bo);
 		break;
 	case TTM_PL_TT:
-		drm->gem.gart_available -= bo->mem.size;
+		drm->gem.gart_available -= ttm_bo_size_bytes(bo);
 		break;
 	default:
 		break;
@@ -504,10 +504,10 @@ nouveau_bo_unpin(struct nouveau_bo *nvbo)
 	if (!nvbo->bo.pin_count) {
 		switch (bo->mem.mem_type) {
 		case TTM_PL_VRAM:
-			drm->gem.vram_available += bo->mem.size;
+			drm->gem.vram_available += ttm_bo_size_bytes(bo);
 			break;
 		case TTM_PL_TT:
-			drm->gem.gart_available += bo->mem.size;
+			drm->gem.gart_available += ttm_bo_size_bytes(bo);
 			break;
 		default:
 			break;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index bceb48a2dfca..af28e3d16abd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -288,9 +288,9 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
 
 	DRM_DEBUG_KMS("offset=%u stride=%u h=%u tile_mode=0x%02x bw=%u bh=%u gob_size=%u bl_size=%llu size=%lu\n",
 		      offset, stride, h, tile_mode, bw, bh, gob_size, bl_size,
-		      nvbo->bo.mem.size);
+		      ttm_bo_size_bytes(&nvbo->bo));
 
-	if (bl_size + offset > nvbo->bo.mem.size)
+	if (bl_size + offset > ttm_bo_size_bytes(&nvbo->bo))
 		return -ERANGE;
 
 	return 0;
@@ -363,7 +363,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 		} else {
 			uint32_t size = mode_cmd->pitches[i] * height;
 
-			if (size + mode_cmd->offsets[i] > nvbo->bo.mem.size)
+			if (size + mode_cmd->offsets[i] > ttm_bo_size_bytes(&nvbo->bo))
 				return -ERANGE;
 		}
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 82000675413f..a9f184cdbe24 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -72,8 +72,8 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 	int i, mem_type;
 
 	drm_printf(&p, "No space for %p (%lu pages, %luK, %luM)\n",
-		   bo, bo->mem.num_pages, bo->mem.size >> 10,
-		   bo->mem.size >> 20);
+		   bo, bo->mem.num_pages, ttm_bo_size_bytes(bo) >> 10,
+		   ttm_bo_size_bytes(bo) >> 20);
 	for (i = 0; i < placement->num_placement; i++) {
 		mem_type = placement->placement[i].mem_type;
 		drm_printf(&p, "  placement[%d]=0x%08X (%d)\n",
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 12d98c80b334..f201ec42b90b 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -612,4 +612,9 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
 
+static inline unsigned long ttm_bo_size_bytes(struct ttm_buffer_object *bo)
+{
+	return bo->mem.size;
+}
+
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
