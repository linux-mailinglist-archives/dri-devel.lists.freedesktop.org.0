Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FAE477481
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F3E10FD18;
	Thu, 16 Dec 2021 14:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E368110FD1C;
 Thu, 16 Dec 2021 14:28:05 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 02/17] drm/i915: Change shrink ordering to use locking
 around unbinding.
Date: Thu, 16 Dec 2021 15:27:34 +0100
Message-Id: <20211216142749.1966107-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
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

Call drop_pages with the gem object lock held, instead of the other
way around. This will allow us to drop the vma bindings with the
gem object lock held.

We plan to require the object lock for unpinning in the future,
and this is an easy target.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 38 ++++++++++----------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 157a9765f483..eebff4735781 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -36,8 +36,8 @@ static bool can_release_pages(struct drm_i915_gem_object *obj)
 	return swap_available() || obj->mm.madv == I915_MADV_DONTNEED;
 }
 
-static bool unsafe_drop_pages(struct drm_i915_gem_object *obj,
-			      unsigned long shrink, bool trylock_vm)
+static int drop_pages(struct drm_i915_gem_object *obj,
+		       unsigned long shrink, bool trylock_vm)
 {
 	unsigned long flags;
 
@@ -214,26 +214,24 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 
 			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 
-			err = 0;
-			if (unsafe_drop_pages(obj, shrink, trylock_vm)) {
-				/* May arrive from get_pages on another bo */
-				if (!ww) {
-					if (!i915_gem_object_trylock(obj))
-						goto skip;
-				} else {
-					err = i915_gem_object_lock(obj, ww);
-					if (err)
-						goto skip;
-				}
-
-				if (!__i915_gem_object_put_pages(obj)) {
-					if (!try_to_writeback(obj, shrink))
-						count += obj->base.size >> PAGE_SHIFT;
-				}
-				if (!ww)
-					i915_gem_object_unlock(obj);
+			/* May arrive from get_pages on another bo */
+			if (!ww) {
+				if (!i915_gem_object_trylock(obj))
+					goto skip;
+			} else {
+				err = i915_gem_object_lock(obj, ww);
+				if (err)
+					goto skip;
 			}
 
+			if (drop_pages(obj, shrink, trylock_vm) &&
+			    !__i915_gem_object_put_pages(obj) &&
+			    !try_to_writeback(obj, shrink))
+				count += obj->base.size >> PAGE_SHIFT;
+
+			if (!ww)
+				i915_gem_object_unlock(obj);
+
 			scanned += obj->base.size >> PAGE_SHIFT;
 skip:
 			i915_gem_object_put(obj);
-- 
2.34.1

