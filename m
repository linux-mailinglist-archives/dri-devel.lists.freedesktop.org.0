Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10B73463EB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDB76E916;
	Tue, 23 Mar 2021 15:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDBC6EBFB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:43 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 69/70] drm/i915: Pass ww ctx to i915_gem_object_pin_pages
Date: Tue, 23 Mar 2021 16:50:58 +0100
Message-Id: <20210323155059.628690-70-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the final part of passing ww ctx to the get_pages() callbacks.
Now we no longer have to implicitly get ww ctx by using get_ww_ctx.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 35 +++++++++++++------
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 19 ++++++----
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 11 +++---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 14 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  4 +--
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  4 +--
 drivers/gpu/drm/i915/i915_gem.c               |  6 ++--
 drivers/gpu/drm/i915/i915_vma.c               |  7 ++--
 13 files changed, 70 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 56b63731af60..31f9685557f7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1155,7 +1155,7 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 	if (!ret && phys_cursor)
 		ret = i915_gem_object_attach_phys(obj, alignment);
 	if (!ret)
-		ret = i915_gem_object_pin_pages(obj);
+		ret = i915_gem_object_pin_pages(obj, &ww);
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index e4c24558eaa8..109f5c8b802a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -55,7 +55,7 @@ static struct clflush *clflush_work_create(struct drm_i915_gem_object *obj)
 	if (!clflush)
 		return NULL;
 
-	if (__i915_gem_object_get_pages(obj) < 0) {
+	if (__i915_gem_object_get_pages(obj, NULL) < 0) {
 		kfree(clflush);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 1b3998c066a7..35ac62d4dea2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -130,7 +130,7 @@ static int i915_gem_begin_cpu_access(struct dma_buf *dma_buf, enum dma_data_dire
 retry:
 	err = i915_gem_object_lock(obj, &ww);
 	if (!err)
-		err = i915_gem_object_pin_pages(obj);
+		err = i915_gem_object_pin_pages(obj, &ww);
 	if (!err) {
 		i915_gem_object_set_to_cpu_domain(obj, write);
 		i915_gem_object_unpin_pages(obj);
@@ -154,7 +154,7 @@ static int i915_gem_end_cpu_access(struct dma_buf *dma_buf, enum dma_data_direct
 retry:
 	err = i915_gem_object_lock(obj, &ww);
 	if (!err)
-		err = i915_gem_object_pin_pages(obj);
+		err = i915_gem_object_pin_pages(obj, &ww);
 	if (!err) {
 		i915_gem_object_set_to_gtt_domain(obj, false);
 		i915_gem_object_unpin_pages(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index a5b3a21faf9c..27dde2b9597e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -430,6 +430,7 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_gem_object *obj;
 	u32 read_domains = args->read_domains;
 	u32 write_domain = args->write_domain;
+	struct i915_gem_ww_ctx ww;
 	int err;
 
 	/* Only handle setting domains to types used by the CPU. */
@@ -456,7 +457,15 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 		 * userptr validity
 		 */
 		err = i915_gem_object_userptr_validate(obj);
-		goto out_wait;
+		if (err)
+			goto out;
+
+		err = i915_gem_object_wait(obj,
+					  I915_WAIT_INTERRUPTIBLE |
+					  I915_WAIT_PRIORITY |
+					  (write_domain ? I915_WAIT_ALL : 0),
+					  MAX_SCHEDULE_TIMEOUT);
+		goto out;
 	}
 
 	/*
@@ -470,9 +479,11 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 		goto out;
 	}
 
-	err = i915_gem_object_lock_interruptible(obj, NULL);
+	i915_gem_ww_ctx_init(&ww, true);
+retry:
+	err = i915_gem_object_lock_interruptible(obj, &ww);
 	if (err)
-		goto out;
+		goto out_ww;
 
 	/*
 	 * Flush and acquire obj->pages so that we are coherent through
@@ -483,9 +494,9 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 	 * continue to assume that the obj remained out of the CPU cached
 	 * domain.
 	 */
-	err = i915_gem_object_pin_pages(obj);
+	err = i915_gem_object_pin_pages(obj, &ww);
 	if (err)
-		goto out_unlock;
+		goto out_ww;
 
 	/*
 	 * Already in the desired write domain? Nothing for us to do!
@@ -510,9 +521,6 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 out_unpin:
 	i915_gem_object_unpin_pages(obj);
 
-out_unlock:
-	i915_gem_object_unlock(obj);
-out_wait:
 	if (!err) {
 		err = i915_gem_object_wait(obj,
 					  I915_WAIT_INTERRUPTIBLE |
@@ -523,6 +531,13 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 			i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
 	}
 
+out_ww:
+	if (err == -EDEADLK) {
+		err = i915_gem_ww_ctx_backoff(&ww);
+		if (!err)
+			goto retry;
+	}
+	i915_gem_ww_ctx_fini(&ww);
 out:
 	i915_gem_object_put(obj);
 	return err;
@@ -545,7 +560,7 @@ int i915_gem_object_prepare_read(struct drm_i915_gem_object *obj,
 
 	assert_object_held(obj);
 
-	ret = i915_gem_object_pin_pages(obj);
+	ret = i915_gem_object_pin_pages(obj, ww);
 	if (ret)
 		return ret;
 
@@ -590,7 +605,7 @@ int i915_gem_object_prepare_write(struct drm_i915_gem_object *obj,
 
 	assert_object_held(obj);
 
-	ret = i915_gem_object_pin_pages(obj);
+	ret = i915_gem_object_pin_pages(obj, ww);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 73dd2a7673f5..b3678c0f218b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2504,7 +2504,7 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
 		pw->batch_map = i915_gem_object_pin_map(batch, &eb->ww, I915_MAP_WC);
 
 	if (IS_ERR(pw->batch_map)) {
-		err = i915_gem_object_pin_pages(batch);
+		err = i915_gem_object_pin_pages(batch, &eb->ww);
 		if (err)
 			goto err_unmap_shadow;
 		pw->batch_map = NULL;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index edac8ee3be9a..8690bf434407 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -239,6 +239,7 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
 	struct i915_mmap_offset *mmo = area->vm_private_data;
 	struct drm_i915_gem_object *obj = mmo->obj;
 	resource_size_t iomap;
+	struct i915_gem_ww_ctx ww;
 	int err;
 
 	/* Sanity check that we allow writing into this object */
@@ -246,10 +247,11 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
 		     area->vm_flags & VM_WRITE))
 		return VM_FAULT_SIGBUS;
 
-	if (i915_gem_object_lock_interruptible(obj, NULL))
-		return VM_FAULT_NOPAGE;
-
-	err = i915_gem_object_pin_pages(obj);
+	i915_gem_ww_ctx_init(&ww, true);
+retry:
+	err = i915_gem_object_lock(obj, &ww);
+	if (!err)
+		err = i915_gem_object_pin_pages(obj, &ww);
 	if (err)
 		goto out;
 
@@ -272,7 +274,12 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
 	i915_gem_object_unpin_pages(obj);
 
 out:
-	i915_gem_object_unlock(obj);
+	if (err == -EDEADLK) {
+		err = i915_gem_ww_ctx_backoff(&ww);
+		if (!err)
+			goto retry;
+	}
+	i915_gem_ww_ctx_fini(&ww);
 	return i915_error_to_vmf_fault(err);
 }
 
@@ -313,7 +320,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 		goto err_rpm;
 	}
 
-	ret = i915_gem_object_pin_pages(obj);
+	ret = i915_gem_object_pin_pages(obj, &ww);
 	if (ret)
 		goto err_rpm;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 9bd9b47dcc8d..64819b4e592a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -378,18 +378,21 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 				 struct sg_table *pages,
 				 unsigned int sg_page_sizes);
 
-int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj);
-int __i915_gem_object_get_pages(struct drm_i915_gem_object *obj);
+int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj,
+				  struct i915_gem_ww_ctx *ww);
+int __i915_gem_object_get_pages(struct drm_i915_gem_object *obj,
+				struct i915_gem_ww_ctx *ww);
 
 static inline int __must_check
-i915_gem_object_pin_pages(struct drm_i915_gem_object *obj)
+i915_gem_object_pin_pages(struct drm_i915_gem_object *obj,
+			  struct i915_gem_ww_ctx *ww)
 {
 	assert_object_held(obj);
 
 	if (atomic_inc_not_zero(&obj->mm.pages_pin_count))
 		return 0;
 
-	return __i915_gem_object_get_pages(obj);
+	return __i915_gem_object_get_pages(obj, ww);
 }
 
 int i915_gem_object_pin_pages_unlocked(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 232832398457..94cc33ea483d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -87,7 +87,8 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 	}
 }
 
-int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
+int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj,
+				  struct i915_gem_ww_ctx *ww)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	int err;
@@ -100,7 +101,7 @@ int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
 		return -EFAULT;
 	}
 
-	err = obj->ops->get_pages(obj, NULL);
+	err = obj->ops->get_pages(obj, ww);
 	GEM_BUG_ON(!err && !i915_gem_object_has_pages(obj));
 
 	return err;
@@ -113,7 +114,8 @@ int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
  * either as a result of memory pressure (reaping pages under the shrinker)
  * or as the object is itself released.
  */
-int __i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
+int __i915_gem_object_get_pages(struct drm_i915_gem_object *obj,
+				struct i915_gem_ww_ctx *ww)
 {
 	int err;
 
@@ -124,7 +126,7 @@ int __i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
 	if (unlikely(!i915_gem_object_has_pages(obj))) {
 		GEM_BUG_ON(i915_gem_object_has_pinned_pages(obj));
 
-		err = ____i915_gem_object_get_pages(obj);
+		err = ____i915_gem_object_get_pages(obj, ww);
 		if (err)
 			return err;
 
@@ -144,7 +146,7 @@ int i915_gem_object_pin_pages_unlocked(struct drm_i915_gem_object *obj)
 retry:
 	err = i915_gem_object_lock(obj, &ww);
 	if (!err)
-		err = i915_gem_object_pin_pages(obj);
+		err = i915_gem_object_pin_pages(obj, &ww);
 
 	if (err == -EDEADLK) {
 		err = i915_gem_ww_ctx_backoff(&ww);
@@ -362,7 +364,7 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 		if (unlikely(!i915_gem_object_has_pages(obj))) {
 			GEM_BUG_ON(i915_gem_object_has_pinned_pages(obj));
 
-			err = ____i915_gem_object_get_pages(obj);
+			err = ____i915_gem_object_get_pages(obj, ww);
 			if (err)
 				return ERR_PTR(err);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 5b732b0fe5ce..48b2258091c3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -641,7 +641,7 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 	if (WARN_ON(!i915_gem_object_trylock(obj)))
 		return -EBUSY;
 
-	err = i915_gem_object_pin_pages(obj);
+	err = i915_gem_object_pin_pages(obj, NULL);
 	if (!err)
 		i915_gem_object_init_memory_region(obj, mem);
 	i915_gem_object_unlock(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 693d0dbe9ed2..71c928c789b3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -261,7 +261,7 @@ static int i915_gem_object_userptr_unbind(struct drm_i915_gem_object *obj, bool
 		i915_gem_userptr_put_pages(obj, pages);
 
 	if (get_pages)
-		err = ____i915_gem_object_get_pages(obj);
+		err = ____i915_gem_object_get_pages(obj, NULL);
 
 	return err;
 }
@@ -390,7 +390,7 @@ int i915_gem_object_userptr_validate(struct drm_i915_gem_object *obj)
 		 * it doesn't matter if we collide with the mmu notifier,
 		 * and -EAGAIN handling is not required.
 		 */
-		err = i915_gem_object_pin_pages(obj);
+		err = i915_gem_object_pin_pages(obj, NULL);
 		if (!err)
 			i915_gem_object_unpin_pages(obj);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 994e4ea28903..38c1ba203071 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -30,7 +30,7 @@ int pin_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
 	int err;
 
 	i915_gem_object_lock(obj, NULL);
-	err = i915_gem_object_pin_pages(obj);
+	err = i915_gem_object_pin_pages(obj, NULL);
 	i915_gem_object_unlock(obj);
 	if (err)
 		return err;
@@ -43,7 +43,7 @@ int pin_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object
 {
 	int err;
 
-	err = i915_gem_object_pin_pages(obj);
+	err = i915_gem_object_pin_pages(obj, NULL);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 960e94997c9b..d23a417295f8 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -212,7 +212,7 @@ i915_gem_shmem_pread(struct drm_i915_gem_object *obj,
 	if (ret)
 		return ret;
 
-	ret = i915_gem_object_pin_pages(obj);
+	ret = i915_gem_object_pin_pages(obj, NULL);
 	if (ret)
 		goto err_unlock;
 
@@ -311,7 +311,7 @@ static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object *obj,
 		vma = NULL;
 	}
 
-	ret = i915_gem_object_pin_pages(obj);
+	ret = i915_gem_object_pin_pages(obj, &ww);
 	if (ret) {
 		if (drm_mm_node_allocated(node)) {
 			ggtt->vm.clear_range(&ggtt->vm, node->start, node->size);
@@ -640,7 +640,7 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
 	if (ret)
 		return ret;
 
-	ret = i915_gem_object_pin_pages(obj);
+	ret = i915_gem_object_pin_pages(obj, NULL);
 	if (ret)
 		goto err_unlock;
 
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index c5b9f30ac0a3..03291c032814 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -785,7 +785,8 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
 	return pinned;
 }
 
-static int vma_get_pages(struct i915_vma *vma)
+static int vma_get_pages(struct i915_vma *vma,
+			 struct i915_gem_ww_ctx *ww)
 {
 	int err = 0;
 
@@ -798,7 +799,7 @@ static int vma_get_pages(struct i915_vma *vma)
 
 	if (!atomic_read(&vma->pages_count)) {
 		if (vma->obj) {
-			err = i915_gem_object_pin_pages(vma->obj);
+			err = i915_gem_object_pin_pages(vma->obj, ww);
 			if (err)
 				goto unlock;
 		}
@@ -876,7 +877,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (try_qad_pin(vma, flags & I915_VMA_BIND_MASK))
 		return 0;
 
-	err = vma_get_pages(vma);
+	err = vma_get_pages(vma, ww);
 	if (err)
 		return err;
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
