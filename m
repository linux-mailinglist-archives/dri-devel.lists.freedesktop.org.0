Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE8C48980F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 12:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEF414AC13;
	Mon, 10 Jan 2022 11:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F1214AB58;
 Mon, 10 Jan 2022 11:51:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 6/7] drm/i915: Remove support for unlocked i915_vma unbind
Date: Mon, 10 Jan 2022 12:51:32 +0100
Message-Id: <20220110115133.1500718-7-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220110115133.1500718-1-maarten.lankhorst@linux.intel.com>
References: <20220110115133.1500718-1-maarten.lankhorst@linux.intel.com>
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
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we require the object lock for all ops, some code handling
race conditions can be removed.

This is required to not take short-term pins inside execbuf.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 55 +++++----------------------------
 1 file changed, 8 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 11e10e0d628c..8859feb7d131 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -777,7 +777,6 @@ i915_vma_detach(struct i915_vma *vma)
 static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
 {
 	unsigned int bound;
-	bool pinned = true;
 
 	bound = atomic_read(&vma->flags);
 	do {
@@ -787,34 +786,10 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
 		if (unlikely(bound & (I915_VMA_OVERFLOW | I915_VMA_ERROR)))
 			return false;
 
-		if (!(bound & I915_VMA_PIN_MASK))
-			goto unpinned;
-
 		GEM_BUG_ON(((bound + 1) & I915_VMA_PIN_MASK) == 0);
 	} while (!atomic_try_cmpxchg(&vma->flags, &bound, bound + 1));
 
 	return true;
-
-unpinned:
-	/*
-	 * If pin_count==0, but we are bound, check under the lock to avoid
-	 * racing with a concurrent i915_vma_unbind().
-	 */
-	mutex_lock(&vma->vm->mutex);
-	do {
-		if (unlikely(bound & (I915_VMA_OVERFLOW | I915_VMA_ERROR))) {
-			pinned = false;
-			break;
-		}
-
-		if (unlikely(flags & ~bound)) {
-			pinned = false;
-			break;
-		}
-	} while (!atomic_try_cmpxchg(&vma->flags, &bound, bound + 1));
-	mutex_unlock(&vma->vm->mutex);
-
-	return pinned;
 }
 
 static struct scatterlist *
@@ -1153,7 +1128,6 @@ static int
 __i915_vma_get_pages(struct i915_vma *vma)
 {
 	struct sg_table *pages;
-	int ret;
 
 	/*
 	 * The vma->pages are only valid within the lifespan of the borrowed
@@ -1186,18 +1160,16 @@ __i915_vma_get_pages(struct i915_vma *vma)
 		break;
 	}
 
-	ret = 0;
 	if (IS_ERR(pages)) {
-		ret = PTR_ERR(pages);
-		pages = NULL;
 		drm_err(&vma->vm->i915->drm,
-			"Failed to get pages for VMA view type %u (%d)!\n",
-			vma->ggtt_view.type, ret);
+			"Failed to get pages for VMA view type %u (%ld)!\n",
+			vma->ggtt_view.type, PTR_ERR(pages));
+		return PTR_ERR(pages);
 	}
 
 	vma->pages = pages;
 
-	return ret;
+	return 0;
 }
 
 I915_SELFTEST_EXPORT int i915_vma_get_pages(struct i915_vma *vma)
@@ -1229,25 +1201,14 @@ I915_SELFTEST_EXPORT int i915_vma_get_pages(struct i915_vma *vma)
 static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
 {
 	/* We allocate under vma_get_pages, so beware the shrinker */
-	struct sg_table *pages = READ_ONCE(vma->pages);
-
 	GEM_BUG_ON(atomic_read(&vma->pages_count) < count);
 
 	if (atomic_sub_return(count, &vma->pages_count) == 0) {
-		/*
-		 * The atomic_sub_return is a read barrier for the READ_ONCE of
-		 * vma->pages above.
-		 *
-		 * READ_ONCE is safe because this is either called from the same
-		 * function (i915_vma_pin_ww), or guarded by vma->vm->mutex.
-		 *
-		 * TODO: We're leaving vma->pages dangling, until vma->obj->resv
-		 * lock is required.
-		 */
-		if (pages != vma->obj->mm.pages) {
-			sg_free_table(pages);
-			kfree(pages);
+		if (vma->pages != vma->obj->mm.pages) {
+			sg_free_table(vma->pages);
+			kfree(vma->pages);
 		}
+		vma->pages = NULL;
 
 		i915_gem_object_unpin_pages(vma->obj);
 	}
-- 
2.34.1

