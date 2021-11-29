Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA47F461744
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 14:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6CE6EDAD;
	Mon, 29 Nov 2021 13:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07AF6EDA2;
 Mon, 29 Nov 2021 13:57:18 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 15/16] drm/i915: Remove support for unlocked i915_vma unbind
Date: Mon, 29 Nov 2021 14:47:34 +0100
Message-Id: <20211129134735.628712-16-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
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
 drivers/gpu/drm/i915/i915_vma.c | 40 +++++----------------------------
 1 file changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 100739b3e084..3236cf1c1400 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -776,7 +776,6 @@ i915_vma_detach(struct i915_vma *vma)
 static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
 {
 	unsigned int bound;
-	bool pinned = true;
 
 	bound = atomic_read(&vma->flags);
 	do {
@@ -786,34 +785,10 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
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
@@ -1194,13 +1169,7 @@ __i915_vma_get_pages(struct i915_vma *vma)
 			vma->ggtt_view.type, ret);
 	}
 
-	pages = xchg(&vma->pages, pages);
-
-	/* did we race against a put_pages? */
-	if (pages && pages != vma->obj->mm.pages) {
-		sg_free_table(vma->pages);
-		kfree(vma->pages);
-	}
+	vma->pages = pages;
 
 	return ret;
 }
@@ -1234,13 +1203,14 @@ I915_SELFTEST_EXPORT int i915_vma_get_pages(struct i915_vma *vma)
 static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
 {
 	/* We allocate under vma_get_pages, so beware the shrinker */
-	struct sg_table *pages = READ_ONCE(vma->pages);
+	struct sg_table *pages = vma->pages;
 
 	GEM_BUG_ON(atomic_read(&vma->pages_count) < count);
 
 	if (atomic_sub_return(count, &vma->pages_count) == 0) {
-		if (pages == cmpxchg(&vma->pages, pages, NULL) &&
-		    pages != vma->obj->mm.pages) {
+		vma->pages = NULL;
+
+		if (pages != vma->obj->mm.pages) {
 			sg_free_table(pages);
 			kfree(pages);
 		}
-- 
2.34.0

