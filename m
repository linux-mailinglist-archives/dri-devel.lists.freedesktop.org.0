Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4268AD2E3E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4F710E478;
	Tue, 10 Jun 2025 07:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1FF10E474;
 Tue, 10 Jun 2025 07:02:57 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/5] drm/xe: Convert xe_fb_pin to use a callback for
 insertion into GGTT
Date: Tue, 10 Jun 2025 09:02:38 +0200
Message-ID: <20250610070241.875636-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250610070241.875636-1-dev@lankhorst.se>
References: <20250610070241.875636-1-dev@lankhorst.se>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

The rotation details belong in xe_fb_pin.c, while the operations involving
GGTT belong to xe_ggtt.c. As directly locking xe_ggtt etc results in
exposing all of xe_ggtt details anyway, create a special function that
allocates a ggtt_node, and allow display to populate it using a callback
as a compromise.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 111 ++++++++++++-------------
 drivers/gpu/drm/xe/xe_ggtt.c           |  92 ++++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt.h           |   9 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h     |   8 +-
 4 files changed, 132 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 6b362695d6b61..99f2863daebb5 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -167,12 +167,13 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 }
 
 static void
-write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo_ofs,
+write_ggtt_rotated(struct xe_ggtt *ggtt, u32 *ggtt_ofs,
+		   u64 pte_flags,
+		   xe_ggtt_set_pte_fn write_pte,
+		   struct xe_bo *bo, u32 bo_ofs,
 		   u32 width, u32 height, u32 src_stride, u32 dst_stride)
 {
-	struct xe_device *xe = xe_bo_device(bo);
 	u32 column, row;
-	u64 pte = ggtt->pt_ops->pte_encode_flags(bo, xe->pat.idx[XE_CACHE_NONE]);
 
 	for (column = 0; column < width; column++) {
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
@@ -180,7 +181,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 		for (row = 0; row < height; row++) {
 			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, *ggtt_ofs, pte | addr);
+			write_pte(ggtt, *ggtt_ofs, pte_flags | addr);
 			*ggtt_ofs += XE_PAGE_SIZE;
 			src_idx -= src_stride;
 		}
@@ -190,6 +191,28 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 	}
 }
 
+struct fb_rotate_args {
+	const struct i915_gtt_view *view;
+	struct xe_bo *bo;
+};
+
+static void write_ggtt_rotated_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+				    u64 pte_flags, xe_ggtt_set_pte_fn write_pte, void *data)
+{
+	struct fb_rotate_args *args = data;
+	struct xe_bo *bo = args->bo;
+	const struct intel_rotation_info *rot_info = &args->view->rotated;
+	u32 ggtt_ofs = node->base.start;
+
+	for (u32 i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
+		write_ggtt_rotated(ggtt, &ggtt_ofs, pte_flags, write_pte,
+				   bo, rot_info->plane[i].offset,
+				   rot_info->plane[i].width,
+				   rot_info->plane[i].height,
+				   rot_info->plane[i].src_stride,
+				   rot_info->plane[i].dst_stride);
+}
+
 static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 				const struct i915_gtt_view *view,
 				struct i915_vma *vma,
@@ -200,70 +223,40 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_ggtt *ggtt = tile0->mem.ggtt;
+	u64 pte, size;
 	u32 align;
-	int ret;
-
-	/* TODO: Consider sharing framebuffer mapping?
-	 * embed i915_vma inside intel_framebuffer
-	 */
-	xe_pm_runtime_get_noresume(xe);
-	ret = mutex_lock_interruptible(&ggtt->lock);
-	if (ret)
-		goto out;
+	int ret = 0;
 
 	align = XE_PAGE_SIZE;
-	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
-		align = max_t(u32, align, SZ_64K);
+	if (xe_bo_is_vram(bo) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+		align = max(align, SZ_64K);
 
+	/* Fast case, preallocated GGTT view? */
 	if (bo->ggtt_node[tile0->id] && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node[tile0->id];
-	} else if (view->type == I915_GTT_VIEW_NORMAL) {
-		vma->node = xe_ggtt_node_init(ggtt);
-		if (IS_ERR(vma->node)) {
-			ret = PTR_ERR(vma->node);
-			goto out_unlock;
-		}
-
-		ret = xe_ggtt_node_insert_locked(vma->node, bo->size, align, 0);
-		if (ret) {
-			xe_ggtt_node_fini(vma->node);
-			goto out_unlock;
-		}
-
-		xe_ggtt_map_bo(ggtt, vma->node, bo, xe->pat.idx[XE_CACHE_NONE]);
-	} else {
-		u32 i, ggtt_ofs;
-		const struct intel_rotation_info *rot_info = &view->rotated;
-
-		/* display seems to use tiles instead of bytes here, so convert it back.. */
-		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
-
-		vma->node = xe_ggtt_node_init(ggtt);
-		if (IS_ERR(vma->node)) {
-			ret = PTR_ERR(vma->node);
-			goto out_unlock;
-		}
-
-		ret = xe_ggtt_node_insert_locked(vma->node, size, align, 0);
-		if (ret) {
-			xe_ggtt_node_fini(vma->node);
-			goto out_unlock;
-		}
+		return 0;
+	}
 
-		ggtt_ofs = vma->node->base.start;
+	/* TODO: Consider sharing framebuffer mapping?
+	 * embed i915_vma inside intel_framebuffer
+	 */
+	xe_pm_runtime_get_noresume(xe);
 
-		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
-			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
-					   rot_info->plane[i].offset,
-					   rot_info->plane[i].width,
-					   rot_info->plane[i].height,
-					   rot_info->plane[i].src_stride,
-					   rot_info->plane[i].dst_stride);
-	}
+	if (view->type == I915_GTT_VIEW_NORMAL)
+		size = bo->size;
+	else
+		/* display uses tiles instead of bytes here, so convert it back.. */
+		size = intel_rotation_info_size(&view->rotated) * XE_PAGE_SIZE;
+
+	pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
+	vma->node = xe_ggtt_node_insert_transform(ggtt, bo, pte,
+						  ALIGN(size, align), align,
+						  view->type == I915_GTT_VIEW_NORMAL ?
+						  NULL : write_ggtt_rotated_node,
+						  &(struct fb_rotate_args){view, bo});
+	if (IS_ERR(vma->node))
+		ret = PTR_ERR(vma->node);
 
-out_unlock:
-	mutex_unlock(&ggtt->lock);
-out:
 	xe_pm_runtime_put(xe);
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 4c58626f002f9..c9ee2a4ff8ab9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -479,19 +479,7 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
 	mutex_unlock(&ggtt->lock);
 }
 
-/**
- * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
- * @node: the &xe_ggtt_node to be inserted
- * @size: size of the node
- * @align: alignment constrain of the node
- * @mm_flags: flags to control the node behavior
- *
- * It cannot be called without first having called xe_ggtt_init() once.
- * To be used in cases where ggtt->lock is already taken.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)
 {
 	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
@@ -528,9 +516,13 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
  * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
  *
  * This function will allocate the struct %xe_ggtt_node and return its pointer.
- * This struct will then be freed after the node removal upon xe_ggtt_node_remove().
- * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
- * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
+ * This struct will then be freed after the node removal upon
+ * xe_ggtt_node_remove().
+ *
+ * Having %xe_ggtt_node struct allocated doesn't mean that the node is already
+ * allocated in GGTT. Only xe_ggtt_node_insert() or allocation through
+ * xe_ggtt_node_insert_transform() will ensure the node is inserted or reserved
+ * in GGTT.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  **/
@@ -579,13 +571,12 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
  * @ggtt: the &xe_ggtt where node will be mapped
  * @node: the &xe_ggtt_node where this BO is mapped
  * @bo: the &xe_bo to be mapped
- * @pat_index: Which pat_index to use.
+ * @pte: The pte flags to append.
  */
-void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-		    struct xe_bo *bo, u16 pat_index)
+static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			   struct xe_bo *bo, u64 pte)
 {
-
-	u64 start, pte, end;
+	u64 start, end;
 	struct xe_res_cursor cur;
 
 	if (XE_WARN_ON(!node))
@@ -594,7 +585,6 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	start = node->base.start;
 	end = start + bo->size;
 
-	pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
 	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
 		xe_assert(xe_bo_device(bo), bo->ttm.ttm);
 
@@ -624,12 +614,65 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
+	u64 pte;
 
 	mutex_lock(&ggtt->lock);
-	xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pat_index);
+	pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
+	xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pte);
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_node_insert_transform - Insert a newly allocated &xe_ggtt_node into the GGTT
+ * @ggtt: the &xe_ggtt where the node will inserted/reserved.
+ * @bo: The bo to be transformed
+ * @pte_flags: The extra GGTT flags to add to mapping.
+ * @size: size of the node
+ * @align: required alignment for node
+ * @transform: transformation function that will populate the GGTT node, or NULL for linear mapping.
+ * @arg: Extra argument to pass to the transformation function.
+ *
+ * This function allows inserting a GGTT node with a custom transformation function.
+ * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ *
+ * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
+ */
+struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
+						   struct xe_bo *bo, u64 pte_flags,
+						   u64 size, u32 align,
+						   xe_ggtt_transform_cb transform, void *arg)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return ERR_CAST(node);
+
+	if (mutex_lock_interruptible(&ggtt->lock) < 0) {
+		ret = -ERESTARTSYS;
+		goto err;
+	}
+
+	ret = xe_ggtt_node_insert_locked(node, size, align, 0);
+	if (ret)
+		goto err_unlock;
+
+	if (transform)
+		transform(ggtt, node, pte_flags, ggtt->pt_ops->ggtt_set_pte, arg);
+	else
+		xe_ggtt_map_bo(ggtt, node, bo, pte_flags);
+
+	mutex_unlock(&ggtt->lock);
+	return node;
+
+err_unlock:
+	mutex_unlock(&ggtt->lock);
+err:
+	xe_ggtt_node_fini(node);
+	return ERR_PTR(ret);
+}
+
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
@@ -668,8 +711,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	} else {
 		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 		u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
+		u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
 
-		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pat_index);
+		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
 	}
 	mutex_unlock(&ggtt->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c00d6c8f687ac..e25b40845456d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -21,12 +21,13 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
-int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
-			       u32 size, u32 align, u32 mm_flags);
+struct xe_ggtt_node *
+xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
+			      struct xe_bo *bo, u64 pte,
+			      u64 size, u32 align,
+			      xe_ggtt_transform_cb transform, void *arg);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
-void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-		    struct xe_bo *bo, u16 pat_index);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index a27919302d6b2..f4aa5671cb3e3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -71,6 +71,11 @@ struct xe_ggtt_node {
 	bool invalidate_on_remove;
 };
 
+typedef void (*xe_ggtt_set_pte_fn)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,
+				     struct xe_ggtt_node *node,
+				     u64 pte_flags,
+				     xe_ggtt_set_pte_fn set_pte, void *arg);
 /**
  * struct xe_ggtt_pt_ops - GGTT Page table operations
  * Which can vary from platform to platform.
@@ -78,8 +83,9 @@ struct xe_ggtt_node {
 struct xe_ggtt_pt_ops {
 	/** @pte_encode_flags: Encode PTE flags for a given BO */
 	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
+
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
-	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+	xe_ggtt_set_pte_fn ggtt_set_pte;
 };
 
 #endif
-- 
2.45.2

