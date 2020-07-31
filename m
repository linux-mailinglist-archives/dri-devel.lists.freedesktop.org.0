Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C354233E03
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C26F6E9B6;
	Fri, 31 Jul 2020 04:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB976E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:42 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-D4lwhKukNiy2x27eft3eUQ-1; Fri, 31 Jul 2020 00:06:28 -0400
X-MC-Unique: D4lwhKukNiy2x27eft3eUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62F678015CE;
 Fri, 31 Jul 2020 04:06:27 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D946100238C;
 Fri, 31 Jul 2020 04:06:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 26/49] drm/ttm: add wrapper to get manager from bdev.
Date: Fri, 31 Jul 2020 14:04:57 +1000
Message-Id: <20200731040520.3701599-27-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This will allow different abstractions later.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      | 34 +++++++++++++++----------------
 drivers/gpu/drm/ttm/ttm_bo_util.c | 20 +++++++++---------
 drivers/gpu/drm/ttm/ttm_bo_vm.c   |  2 +-
 include/drm/ttm/ttm_bo_driver.h   |  6 ++++++
 4 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 07c653374f15..7c6389ea067f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -80,7 +80,7 @@ static inline int ttm_mem_type_from_place(const struct ttm_place *place,
 static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_printer *p,
 			       int mem_type)
 {
-	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem_type);
 
 	drm_printf(p, "    has_type: %d\n", man->has_type);
 	drm_printf(p, "    use_type: %d\n", man->use_type);
@@ -156,7 +156,7 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer_object *bo,
 	if (mem->placement & TTM_PL_FLAG_NO_EVICT)
 		return;
 
-	man = &bdev->man[mem->mem_type];
+	man = ttm_manager_type(bdev, mem->mem_type);
 	list_add_tail(&bo->lru, &man->lru[bo->priority]);
 
 	if (man->use_tt && bo->ttm &&
@@ -231,7 +231,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
 		dma_resv_assert_held(pos->first->base.resv);
 		dma_resv_assert_held(pos->last->base.resv);
 
-		man = &pos->first->bdev->man[TTM_PL_TT];
+		man = ttm_manager_type(pos->first->bdev, TTM_PL_TT);
 		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
 				    &pos->last->lru);
 	}
@@ -246,7 +246,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
 		dma_resv_assert_held(pos->first->base.resv);
 		dma_resv_assert_held(pos->last->base.resv);
 
-		man = &pos->first->bdev->man[TTM_PL_VRAM];
+		man = ttm_manager_type(pos->first->bdev, TTM_PL_VRAM);
 		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
 				    &pos->last->lru);
 	}
@@ -272,8 +272,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 				  struct ttm_operation_ctx *ctx)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *old_man = &bdev->man[bo->mem.mem_type];
-	struct ttm_mem_type_manager *new_man = &bdev->man[mem->mem_type];
+	struct ttm_mem_type_manager *old_man = ttm_manager_type(bdev, bo->mem.mem_type);
+	struct ttm_mem_type_manager *new_man = ttm_manager_type(bdev, mem->mem_type);
 	int ret;
 
 	ret = ttm_mem_io_lock(old_man, true);
@@ -338,7 +338,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	return 0;
 
 out_err:
-	new_man = &bdev->man[bo->mem.mem_type];
+	new_man = ttm_manager_type(bdev, bo->mem.mem_type);
 	if (!new_man->use_tt) {
 		ttm_tt_destroy(bo->ttm);
 		bo->ttm = NULL;
@@ -550,7 +550,7 @@ static void ttm_bo_release(struct kref *kref)
 	struct ttm_buffer_object *bo =
 	    container_of(kref, struct ttm_buffer_object, kref);
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = &bdev->man[bo->mem.mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, bo->mem.mem_type);
 	size_t acc_size = bo->acc_size;
 	int ret;
 
@@ -838,7 +838,7 @@ static int ttm_bo_mem_get(struct ttm_buffer_object *bo,
 			  const struct ttm_place *place,
 			  struct ttm_mem_reg *mem)
 {
-	struct ttm_mem_type_manager *man = &bo->bdev->man[mem->mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
 
 	mem->mm_node = NULL;
 	if (!man->func || !man->func->get_node)
@@ -849,7 +849,7 @@ static int ttm_bo_mem_get(struct ttm_buffer_object *bo,
 
 void ttm_bo_mem_put(struct ttm_buffer_object *bo, struct ttm_mem_reg *mem)
 {
-	struct ttm_mem_type_manager *man = &bo->bdev->man[mem->mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
 
 	if (!man->func || !man->func->put_node)
 		return;
@@ -906,7 +906,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 				  struct ttm_operation_ctx *ctx)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem->mem_type);
 	struct ww_acquire_ctx *ticket;
 	int ret;
 
@@ -996,7 +996,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 	if (ret)
 		return ret;
 
-	man = &bdev->man[mem_type];
+	man = ttm_manager_type(bdev, mem_type);
 	if (!man->has_type || !man->use_type)
 		return -EBUSY;
 
@@ -1059,7 +1059,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		if (unlikely(ret))
 			goto error;
 
-		man = &bdev->man[mem->mem_type];
+		man = ttm_manager_type(bdev, mem->mem_type);
 		ret = ttm_bo_add_move_fence(bo, man, mem, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
 			ttm_bo_mem_put(bo, mem);
@@ -1448,7 +1448,7 @@ EXPORT_SYMBOL(ttm_bo_force_list_clean);
 
 int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 {
-	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem_type);
 
 	if (mem_type == 0 || mem_type >= TTM_NUM_MEM_TYPES) {
 		pr_err("Illegal memory manager memory type %u\n", mem_type);
@@ -1551,7 +1551,7 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
 	unsigned i;
 	struct ttm_mem_type_manager *man;
 
-	man = &bdev->man[TTM_PL_SYSTEM];
+	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
 	ttm_bo_disable_mm(man);
 
 	mutex_lock(&ttm_global_mutex);
@@ -1578,7 +1578,7 @@ EXPORT_SYMBOL(ttm_bo_device_release);
 
 static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
 {
-	struct ttm_mem_type_manager *man = &bdev->man[TTM_PL_SYSTEM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
 
 	/*
 	 * Initialize the system memory buffer type.
@@ -1642,7 +1642,7 @@ void ttm_bo_unmap_virtual_locked(struct ttm_buffer_object *bo)
 void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = &bdev->man[bo->mem.mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, bo->mem.mem_type);
 
 	ttm_mem_io_lock(man, false);
 	ttm_bo_unmap_virtual_locked(bo);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1f502be0b646..879c8ded0cd8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -129,7 +129,7 @@ static int ttm_mem_io_evict(struct ttm_mem_type_manager *man)
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 		       struct ttm_mem_reg *mem)
 {
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem->mem_type);
 	int ret;
 
 	if (mem->bus.io_reserved_count++)
@@ -162,7 +162,7 @@ void ttm_mem_io_free(struct ttm_bo_device *bdev,
 
 int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo)
 {
-	struct ttm_mem_type_manager *man = &bo->bdev->man[bo->mem.mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
 	struct ttm_mem_reg *mem = &bo->mem;
 	int ret;
 
@@ -195,7 +195,7 @@ static int ttm_mem_reg_ioremap(struct ttm_bo_device *bdev,
 			       struct ttm_mem_reg *mem,
 			       void **virtual)
 {
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem->mem_type);
 	int ret;
 	void *addr;
 
@@ -232,7 +232,7 @@ static void ttm_mem_reg_iounmap(struct ttm_bo_device *bdev,
 {
 	struct ttm_mem_type_manager *man;
 
-	man = &bdev->man[mem->mem_type];
+	man = ttm_manager_type(bdev, mem->mem_type);
 
 	if (virtual && mem->bus.addr == NULL)
 		iounmap(virtual);
@@ -303,7 +303,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 		       struct ttm_mem_reg *new_mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = &bdev->man[new_mem->mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
 	struct ttm_tt *ttm = bo->ttm;
 	struct ttm_mem_reg *old_mem = &bo->mem;
 	struct ttm_mem_reg old_copy = *old_mem;
@@ -571,7 +571,7 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
 		struct ttm_bo_kmap_obj *map)
 {
 	struct ttm_mem_type_manager *man =
-		&bo->bdev->man[bo->mem.mem_type];
+		ttm_manager_type(bo->bdev, bo->mem.mem_type);
 	unsigned long offset, size;
 	int ret;
 
@@ -601,7 +601,7 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
 {
 	struct ttm_buffer_object *bo = map->bo;
 	struct ttm_mem_type_manager *man =
-		&bo->bdev->man[bo->mem.mem_type];
+		ttm_manager_type(bo->bdev, bo->mem.mem_type);
 
 	if (!map->virtual)
 		return;
@@ -634,7 +634,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			      struct ttm_mem_reg *new_mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = &bdev->man[new_mem->mem_type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
 	struct ttm_mem_reg *old_mem = &bo->mem;
 	int ret;
 	struct ttm_buffer_object *ghost_obj;
@@ -697,8 +697,8 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_mem_reg *old_mem = &bo->mem;
 
-	struct ttm_mem_type_manager *from = &bdev->man[old_mem->mem_type];
-	struct ttm_mem_type_manager *to = &bdev->man[new_mem->mem_type];
+	struct ttm_mem_type_manager *from = ttm_manager_type(bdev, old_mem->mem_type);
+	struct ttm_mem_type_manager *to = ttm_manager_type(bdev, new_mem->mem_type);
 
 	int ret;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 468a0eb9e632..5ae679184eb5 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -282,7 +282,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	vm_fault_t ret = VM_FAULT_NOPAGE;
 	unsigned long address = vmf->address;
 	struct ttm_mem_type_manager *man =
-		&bdev->man[bo->mem.mem_type];
+		ttm_manager_type(bdev, bo->mem.mem_type);
 
 	/*
 	 * Refuse to fault imported pages. This should be handled
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 9d066529ca61..ec25451b503f 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -444,6 +444,12 @@ struct ttm_bo_device {
 	bool no_retry;
 };
 
+static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm_bo_device *bdev,
+							    int mem_type)
+{
+	return &bdev->man[mem_type];
+}
+
 /**
  * struct ttm_lru_bulk_move_pos
  *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
