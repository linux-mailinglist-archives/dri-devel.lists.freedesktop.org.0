Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E9C432578
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 19:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07D26EA42;
	Mon, 18 Oct 2021 17:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052C86E9FF;
 Mon, 18 Oct 2021 17:49:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="225784929"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="225784929"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="526358635"
Received: from cscleary-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.221])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:13 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/9] drm/i915: extract bypass-llc check into helper
Date: Mon, 18 Oct 2021 18:45:02 +0100
Message-Id: <20211018174508.2137279-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018174508.2137279-1-matthew.auld@intel.com>
References: <20211018174508.2137279-1-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like we will need this in some more places, so extract as a
helper.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 26 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 17 +-------------
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 76ce6a1500bc..1e426a42a36c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -128,6 +128,32 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE);
 }
 
+bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+
+	/*
+	 * This is purely from a security perspective, so we simply don't care
+	 * about non-userspace objects being able to bypass the LLC.
+	 */
+	if (!(obj->flags & I915_BO_ALLOC_USER))
+		return false;
+
+	/*
+	 * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
+	 * possible for userspace to bypass the GTT caching bits set by the
+	 * kernel, as per the given object cache_level. This is troublesome
+	 * since the heavy flush we apply when first gathering the pages is
+	 * skipped if the kernel thinks the object is coherent with the GPU. As
+	 * a result it might be possible to bypass the cache and read the
+	 * contents of the page directly, which could be stale data. If it's
+	 * just a case of userspace shooting themselves in the foot then so be
+	 * it, but since i915 takes the stance of always zeroing memory before
+	 * handing it to userspace, we need to prevent this.
+	 */
+	return IS_JSL_EHL(i915);
+}
+
 static void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(gem);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 9df3ee60604e..59201801cec5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -514,6 +514,7 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
 
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 					 unsigned int cache_level);
+bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
 void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
 void i915_gem_object_flush_if_display_locked(struct drm_i915_gem_object *obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 11f072193f3b..cf11aa7e08a0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -182,22 +182,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	if (i915_gem_object_needs_bit17_swizzle(obj))
 		i915_gem_object_do_bit_17_swizzle(obj, st);
 
-	/*
-	 * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
-	 * possible for userspace to bypass the GTT caching bits set by the
-	 * kernel, as per the given object cache_level. This is troublesome
-	 * since the heavy flush we apply when first gathering the pages is
-	 * skipped if the kernel thinks the object is coherent with the GPU. As
-	 * a result it might be possible to bypass the cache and read the
-	 * contents of the page directly, which could be stale data. If it's
-	 * just a case of userspace shooting themselves in the foot then so be
-	 * it, but since i915 takes the stance of always zeroing memory before
-	 * handing it to userspace, we need to prevent this.
-	 *
-	 * By setting cache_dirty here we make the clflush in set_pages
-	 * unconditional on such platforms.
-	 */
-	if (IS_JSL_EHL(i915) && obj->flags & I915_BO_ALLOC_USER)
+	if (i915_gem_object_can_bypass_llc(obj))
 		obj->cache_dirty = true;
 
 	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
-- 
2.26.3

