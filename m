Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F543A2E59
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 16:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601F96ED12;
	Thu, 10 Jun 2021 14:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867446E364;
 Thu, 10 Jun 2021 14:35:43 +0000 (UTC)
IronPort-SDR: ov0nJnEhtZ+cQLRYWB6LoaDwcUttjg86LRsU0LlEBr3oGNZRR0gGW0QalaCjg1IZYxfIKig6ND
 edQSfoOp1kVQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="184999308"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="184999308"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 07:35:43 -0700
IronPort-SDR: CHqgi5XDYw3iZGQGPXJ1xLJYdwSjQmCvGeuStgzCavXMCzkf5e0XAiSW+sjfDEpXpXQnzHAphK
 R7MCcHtIj7GA==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="553084806"
Received: from smirnov2-mobl.ccr.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.160])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 07:35:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Simplify userptr locking
Date: Thu, 10 Jun 2021 16:35:25 +0200
Message-Id: <20210610143525.624677-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an rwlock instead of spinlock for the global notifier lock
to reduce risk of contention in execbuf.

Protect object state with the object lock whenever possible rather
than with the global notifier lock

Don't take an explicit page_ref in userptr_submit_init() but rather
call get_pages() after obtaining the page list so that
get_pages() holds the page_ref. This means we don't need to call
userptr_submit_fini(), which is needed to avoid awkward locking
in our upcoming VM_BIND code.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 21 +++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 -
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   | 72 ++++++-------------
 drivers/gpu/drm/i915/i915_drv.h               |  2 +-
 4 files changed, 31 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index a8abc9af5ff4..201fed19d120 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -994,7 +994,7 @@ eb_get_vma(const struct i915_execbuffer *eb, unsigned long handle)
 	}
 }
 
-static void eb_release_vmas(struct i915_execbuffer *eb, bool final, bool release_userptr)
+static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
 {
 	const unsigned int count = eb->buffer_count;
 	unsigned int i;
@@ -1008,11 +1008,6 @@ static void eb_release_vmas(struct i915_execbuffer *eb, bool final, bool release
 
 		eb_unreserve_vma(ev);
 
-		if (release_userptr && ev->flags & __EXEC_OBJECT_USERPTR_INIT) {
-			ev->flags &= ~__EXEC_OBJECT_USERPTR_INIT;
-			i915_gem_object_userptr_submit_fini(vma->obj);
-		}
-
 		if (final)
 			i915_vma_put(vma);
 	}
@@ -1990,7 +1985,7 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
 	}
 
 	/* We may process another execbuffer during the unlock... */
-	eb_release_vmas(eb, false, true);
+	eb_release_vmas(eb, false);
 	i915_gem_ww_ctx_fini(&eb->ww);
 
 	if (rq) {
@@ -2094,7 +2089,7 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
 
 err:
 	if (err == -EDEADLK) {
-		eb_release_vmas(eb, false, false);
+		eb_release_vmas(eb, false);
 		err = i915_gem_ww_ctx_backoff(&eb->ww);
 		if (!err)
 			goto repeat_validate;
@@ -2191,7 +2186,7 @@ static int eb_relocate_parse(struct i915_execbuffer *eb)
 
 err:
 	if (err == -EDEADLK) {
-		eb_release_vmas(eb, false, false);
+		eb_release_vmas(eb, false);
 		err = i915_gem_ww_ctx_backoff(&eb->ww);
 		if (!err)
 			goto retry;
@@ -2268,7 +2263,7 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 
 #ifdef CONFIG_MMU_NOTIFIER
 	if (!err && (eb->args->flags & __EXEC_USERPTR_USED)) {
-		spin_lock(&eb->i915->mm.notifier_lock);
+		read_lock(&eb->i915->mm.notifier_lock);
 
 		/*
 		 * count is always at least 1, otherwise __EXEC_USERPTR_USED
@@ -2286,7 +2281,7 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 				break;
 		}
 
-		spin_unlock(&eb->i915->mm.notifier_lock);
+		read_unlock(&eb->i915->mm.notifier_lock);
 	}
 #endif
 
@@ -3435,7 +3430,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 
 	err = eb_lookup_vmas(&eb);
 	if (err) {
-		eb_release_vmas(&eb, true, true);
+		eb_release_vmas(&eb, true);
 		goto err_engine;
 	}
 
@@ -3528,7 +3523,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	i915_request_put(eb.request);
 
 err_vma:
-	eb_release_vmas(&eb, true, true);
+	eb_release_vmas(&eb, true);
 	if (eb.trampoline)
 		i915_vma_unpin(eb.trampoline);
 	WARN_ON(err == -EDEADLK);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 7c0eb425cb3b..ec4433d507dc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -596,14 +596,12 @@ i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
 
 int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj);
 int i915_gem_object_userptr_submit_done(struct drm_i915_gem_object *obj);
-void i915_gem_object_userptr_submit_fini(struct drm_i915_gem_object *obj);
 int i915_gem_object_userptr_validate(struct drm_i915_gem_object *obj);
 #else
 static inline bool i915_gem_object_is_userptr(struct drm_i915_gem_object *obj) { return false; }
 
 static inline int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj) { GEM_BUG_ON(1); return -ENODEV; }
 static inline int i915_gem_object_userptr_submit_done(struct drm_i915_gem_object *obj) { GEM_BUG_ON(1); return -ENODEV; }
-static inline void i915_gem_object_userptr_submit_fini(struct drm_i915_gem_object *obj) { GEM_BUG_ON(1); }
 static inline int i915_gem_object_userptr_validate(struct drm_i915_gem_object *obj) { GEM_BUG_ON(1); return -ENODEV; }
 
 #endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 7487bab11f0b..4b0acc7eaa27 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -67,11 +67,11 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
 	if (!mmu_notifier_range_blockable(range))
 		return false;
 
-	spin_lock(&i915->mm.notifier_lock);
+	write_lock(&i915->mm.notifier_lock);
 
 	mmu_interval_set_seq(mni, cur_seq);
 
-	spin_unlock(&i915->mm.notifier_lock);
+	write_unlock(&i915->mm.notifier_lock);
 
 	/*
 	 * We don't wait when the process is exiting. This is valid
@@ -107,16 +107,15 @@ i915_gem_userptr_init__mmu_notifier(struct drm_i915_gem_object *obj)
 
 static void i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct page **pvec = NULL;
 
-	spin_lock(&i915->mm.notifier_lock);
+	assert_object_held_shared(obj);
+
 	if (!--obj->userptr.page_ref) {
 		pvec = obj->userptr.pvec;
 		obj->userptr.pvec = NULL;
 	}
 	GEM_BUG_ON(obj->userptr.page_ref < 0);
-	spin_unlock(&i915->mm.notifier_lock);
 
 	if (pvec) {
 		const unsigned long num_pages = obj->base.size >> PAGE_SHIFT;
@@ -128,7 +127,6 @@ static void i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object *obj)
 
 static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	const unsigned long num_pages = obj->base.size >> PAGE_SHIFT;
 	unsigned int max_segment = i915_sg_segment_size();
 	struct sg_table *st;
@@ -141,16 +139,13 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 	if (!st)
 		return -ENOMEM;
 
-	spin_lock(&i915->mm.notifier_lock);
-	if (GEM_WARN_ON(!obj->userptr.page_ref)) {
-		spin_unlock(&i915->mm.notifier_lock);
-		ret = -EFAULT;
+	if (!obj->userptr.page_ref) {
+		ret = -EAGAIN;
 		goto err_free;
 	}
 
 	obj->userptr.page_ref++;
 	pvec = obj->userptr.pvec;
-	spin_unlock(&i915->mm.notifier_lock);
 
 alloc_table:
 	sg = __sg_alloc_table_from_pages(st, pvec, num_pages, 0,
@@ -241,7 +236,7 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_object *obj,
 	i915_gem_object_userptr_drop_ref(obj);
 }
 
-static int i915_gem_object_userptr_unbind(struct drm_i915_gem_object *obj, bool get_pages)
+static int i915_gem_object_userptr_unbind(struct drm_i915_gem_object *obj)
 {
 	struct sg_table *pages;
 	int err;
@@ -259,15 +254,11 @@ static int i915_gem_object_userptr_unbind(struct drm_i915_gem_object *obj, bool
 	if (!IS_ERR_OR_NULL(pages))
 		i915_gem_userptr_put_pages(obj, pages);
 
-	if (get_pages)
-		err = ____i915_gem_object_get_pages(obj);
-
 	return err;
 }
 
 int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	const unsigned long num_pages = obj->base.size >> PAGE_SHIFT;
 	struct page **pvec;
 	unsigned int gup_flags = 0;
@@ -277,39 +268,22 @@ int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
 	if (obj->userptr.notifier.mm != current->mm)
 		return -EFAULT;
 
+	notifier_seq = mmu_interval_read_begin(&obj->userptr.notifier);
+
 	ret = i915_gem_object_lock_interruptible(obj, NULL);
 	if (ret)
 		return ret;
 
-	/* optimistically try to preserve current pages while unlocked */
-	if (i915_gem_object_has_pages(obj) &&
-	    !mmu_interval_check_retry(&obj->userptr.notifier,
-				      obj->userptr.notifier_seq)) {
-		spin_lock(&i915->mm.notifier_lock);
-		if (obj->userptr.pvec &&
-		    !mmu_interval_read_retry(&obj->userptr.notifier,
-					     obj->userptr.notifier_seq)) {
-			obj->userptr.page_ref++;
-
-			/* We can keep using the current binding, this is the fastpath */
-			ret = 1;
-		}
-		spin_unlock(&i915->mm.notifier_lock);
+	if (notifier_seq == obj->userptr.notifier_seq && obj->userptr.pvec) {
+		i915_gem_object_unlock(obj);
+		return 0;
 	}
 
-	if (!ret) {
-		/* Make sure userptr is unbound for next attempt, so we don't use stale pages. */
-		ret = i915_gem_object_userptr_unbind(obj, false);
-	}
+	ret = i915_gem_object_userptr_unbind(obj);
 	i915_gem_object_unlock(obj);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
-	if (ret > 0)
-		return 0;
-
-	notifier_seq = mmu_interval_read_begin(&obj->userptr.notifier);
-
 	pvec = kvmalloc_array(num_pages, sizeof(struct page *), GFP_KERNEL);
 	if (!pvec)
 		return -ENOMEM;
@@ -329,7 +303,9 @@ int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
 	}
 	ret = 0;
 
-	spin_lock(&i915->mm.notifier_lock);
+	ret = i915_gem_object_lock_interruptible(obj, NULL);
+	if (ret)
+		goto out;
 
 	if (mmu_interval_read_retry(&obj->userptr.notifier,
 		!obj->userptr.page_ref ? notifier_seq :
@@ -341,12 +317,14 @@ int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
 	if (!obj->userptr.page_ref++) {
 		obj->userptr.pvec = pvec;
 		obj->userptr.notifier_seq = notifier_seq;
-
 		pvec = NULL;
+		ret = ____i915_gem_object_get_pages(obj);
 	}
 
+	obj->userptr.page_ref--;
+
 out_unlock:
-	spin_unlock(&i915->mm.notifier_lock);
+	i915_gem_object_unlock(obj);
 
 out:
 	if (pvec) {
@@ -369,11 +347,6 @@ int i915_gem_object_userptr_submit_done(struct drm_i915_gem_object *obj)
 	return 0;
 }
 
-void i915_gem_object_userptr_submit_fini(struct drm_i915_gem_object *obj)
-{
-	i915_gem_object_userptr_drop_ref(obj);
-}
-
 int i915_gem_object_userptr_validate(struct drm_i915_gem_object *obj)
 {
 	int err;
@@ -396,7 +369,6 @@ int i915_gem_object_userptr_validate(struct drm_i915_gem_object *obj)
 		i915_gem_object_unlock(obj);
 	}
 
-	i915_gem_object_userptr_submit_fini(obj);
 	return err;
 }
 
@@ -572,7 +544,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
 int i915_gem_init_userptr(struct drm_i915_private *dev_priv)
 {
 #ifdef CONFIG_MMU_NOTIFIER
-	spin_lock_init(&dev_priv->mm.notifier_lock);
+	rwlock_init(&dev_priv->mm.notifier_lock);
 #endif
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 38ff2fb89744..01e11fe38642 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -552,7 +552,7 @@ struct i915_gem_mm {
 	 * notifier_lock for mmu notifiers, memory may not be allocated
 	 * while holding this lock.
 	 */
-	spinlock_t notifier_lock;
+	rwlock_t notifier_lock;
 #endif
 
 	/* shrinker accounting, also useful for userland debugging */
-- 
2.31.1

