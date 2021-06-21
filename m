Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171C23AE3D7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A3989D56;
	Mon, 21 Jun 2021 07:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at gabe;
 Mon, 21 Jun 2021 01:10:36 UTC
Received: from yyz.mikelr.com (yyz.mikelr.com [170.75.163.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A17A89D84;
 Mon, 21 Jun 2021 01:10:36 +0000 (UTC)
Received: from glidewell.ykf.mikelr.com (198-84-194-208.cpe.teksavvy.com
 [198.84.194.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by yyz.mikelr.com (Postfix) with ESMTPSA id D6AD84F834;
 Sun, 20 Jun 2021 21:00:38 -0400 (EDT)
From: Mikel Rychliski <mikel@mikelr.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: Fix NULL dereference when updating memory stats
Date: Sun, 20 Jun 2021 20:59:50 -0400
Message-Id: <20210621005950.24734-1-mikel@mikelr.com>
X-Mailer: git-send-email 2.13.7
X-Mailman-Approved-At: Mon, 21 Jun 2021 07:07:50 +0000
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
Cc: Mikel Rychliski <mikel@mikelr.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

radeon_ttm_bo_destroy() is attempting to access the resource object to
update memory counters. However, the resource object is already freed when
ttm calls this function via the destroy callback. This causes an oops when
a bo is freed:

	BUG: kernel NULL pointer dereference, address: 0000000000000010
	RIP: 0010:radeon_ttm_bo_destroy+0x2c/0x100 [radeon]
	Call Trace:
	 radeon_bo_unref+0x1a/0x30 [radeon]
	 radeon_gem_object_free+0x33/0x50 [radeon]
	 drm_gem_object_release_handle+0x69/0x70 [drm]
	 drm_gem_handle_delete+0x62/0xa0 [drm]
	 ? drm_mode_destroy_dumb+0x40/0x40 [drm]
	 drm_ioctl_kernel+0xb2/0xf0 [drm]
	 drm_ioctl+0x30a/0x3c0 [drm]
	 ? drm_mode_destroy_dumb+0x40/0x40 [drm]
	 radeon_drm_ioctl+0x49/0x80 [radeon]
	 __x64_sys_ioctl+0x8e/0xd0

Avoid the issue by updating the counters in the delete_mem_notify callback
instead. Also, fix memory statistic updating in radeon_bo_move() to
identify the source type correctly. The source type needs to be saved
before the move, because the moved from object may be altered by the move.

Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")
Signed-off-by: Mikel Rychliski <mikel@mikelr.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 23 +++--------------------
 drivers/gpu/drm/radeon/radeon_object.h |  7 ++++---
 drivers/gpu/drm/radeon/radeon_ttm.c    | 20 +++++++++++++++++---
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index bfaaa3c969a3..ea34c0661710 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -49,8 +49,8 @@ static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
  * function are calling it.
  */
 
-static void radeon_update_memory_usage(struct radeon_bo *bo,
-				       unsigned mem_type, int sign)
+void radeon_update_memory_usage(struct radeon_bo *bo,
+				unsigned int mem_type, int sign)
 {
 	struct radeon_device *rdev = bo->rdev;
 
@@ -76,8 +76,6 @@ static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 
 	bo = container_of(tbo, struct radeon_bo, tbo);
 
-	radeon_update_memory_usage(bo, bo->tbo.resource->mem_type, -1);
-
 	mutex_lock(&bo->rdev->gem.mutex);
 	list_del_init(&bo->list);
 	mutex_unlock(&bo->rdev->gem.mutex);
@@ -726,25 +724,10 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 	return radeon_bo_get_surface_reg(bo);
 }
 
-void radeon_bo_move_notify(struct ttm_buffer_object *bo,
-			   bool evict,
-			   struct ttm_resource *new_mem)
+void radeon_bo_move_notify(struct radeon_bo *rbo)
 {
-	struct radeon_bo *rbo;
-
-	if (!radeon_ttm_bo_is_radeon_bo(bo))
-		return;
-
-	rbo = container_of(bo, struct radeon_bo, tbo);
 	radeon_bo_check_tiling(rbo, 0, 1);
 	radeon_vm_bo_invalidate(rbo->rdev, rbo);
-
-	/* update statistics */
-	if (!new_mem)
-		return;
-
-	radeon_update_memory_usage(rbo, bo->resource->mem_type, -1);
-	radeon_update_memory_usage(rbo, new_mem->mem_type, 1);
 }
 
 vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 1739c6a142cd..f97a17cce28b 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -133,6 +133,9 @@ static inline u64 radeon_bo_mmap_offset(struct radeon_bo *bo)
 	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
 }
 
+extern void radeon_update_memory_usage(struct radeon_bo *bo,
+				       unsigned int mem_type, int sign);
+
 extern int radeon_bo_create(struct radeon_device *rdev,
 			    unsigned long size, int byte_align,
 			    bool kernel, u32 domain, u32 flags,
@@ -160,9 +163,7 @@ extern void radeon_bo_get_tiling_flags(struct radeon_bo *bo,
 				u32 *tiling_flags, u32 *pitch);
 extern int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 				bool force_drop);
-extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
-				  bool evict,
-				  struct ttm_resource *new_mem);
+extern void radeon_bo_move_notify(struct radeon_bo *rbo);
 extern vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 extern int radeon_bo_get_surface_reg(struct radeon_bo *bo);
 extern void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index ad2a5a791bba..c318a80853e5 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -199,7 +199,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = bo->resource;
 	struct radeon_device *rdev;
 	struct radeon_bo *rbo;
-	int r;
+	int r, old_type;
 
 	if (new_mem->mem_type == TTM_PL_TT) {
 		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
@@ -216,6 +216,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
 		return -EINVAL;
 
+	/* Save old type for statistics update */
+	old_type = old_mem->mem_type;
+
 	rdev = radeon_get_rdev(bo->bdev);
 	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
 		ttm_bo_move_null(bo, new_mem);
@@ -261,7 +264,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 out:
 	/* update statistics */
 	atomic64_add(bo->base.size, &rdev->num_bytes_moved);
-	radeon_bo_move_notify(bo, evict, new_mem);
+	radeon_update_memory_usage(rbo, old_type, -1);
+	radeon_update_memory_usage(rbo, new_mem->mem_type, 1);
+	radeon_bo_move_notify(rbo);
 	return 0;
 }
 
@@ -682,7 +687,16 @@ bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev,
 static void
 radeon_bo_delete_mem_notify(struct ttm_buffer_object *bo)
 {
-	radeon_bo_move_notify(bo, false, NULL);
+	struct radeon_bo *rbo;
+
+	if (!radeon_ttm_bo_is_radeon_bo(bo))
+		return;
+
+	rbo = container_of(bo, struct radeon_bo, tbo);
+
+	if (bo->resource)
+		radeon_update_memory_usage(rbo, bo->resource->mem_type, -1);
+	radeon_bo_move_notify(rbo);
 }
 
 static struct ttm_device_funcs radeon_bo_driver = {
-- 
2.13.7

