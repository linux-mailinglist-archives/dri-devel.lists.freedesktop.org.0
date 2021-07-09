Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E07C3C26BC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 17:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE416EA3E;
	Fri,  9 Jul 2021 15:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9AF6EA3D;
 Fri,  9 Jul 2021 15:19:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="209678663"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="209678663"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 08:19:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="458301375"
Received: from cchauvet-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.4.18])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 08:19:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/ehl: unconditionally flush the pages on acquire
Date: Fri,  9 Jul 2021 16:19:33 +0100
Message-Id: <20210709151933.1994078-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Francisco Jerez <francisco.jerez.plata@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
possible for userspace to bypass the GTT caching bits set by the kernel,
as per the given object cache_level. This is troublesome since the heavy
flush we apply when first acquiring the pages is skipped if the kernel
thinks the object is coherent with the GPU. As a result it might be
possible to bypass the cache and read the contents of the page directly,
which could be stale data. If it's just a case of userspace shooting
themselves in the foot then so be it, but since i915 takes the stance of
always zeroing memory before handing it to userspace, we need to prevent
this.

BSpec: 34007
References: 046091758b50 ("Revert "drm/i915/ehl: Update MOCS table for EHL"")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: Francisco Jerez <francisco.jerez.plata@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 29 +++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 6a04cce188fc..7e9ec68cce9e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -298,11 +298,12 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 
 void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_table *pages)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct sgt_iter sgt_iter;
 	struct pagevec pvec;
 	struct page *page;
 
-	GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
+	GEM_WARN_ON(IS_DGFX(i915));
 	__i915_gem_object_release_shmem(obj, pages, true);
 
 	i915_gem_gtt_finish_pages(obj, pages);
@@ -325,7 +326,12 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
 	}
 	if (pagevec_count(&pvec))
 		check_release_pagevec(&pvec);
-	obj->mm.dirty = false;
+
+	/* See the comment in shmem_object_init() for why we need this */
+	if (IS_JSL_EHL(i915) && obj->flags & I915_BO_ALLOC_USER)
+		obj->mm.dirty = true;
+	else
+		obj->mm.dirty = false;
 
 	sg_free_table(pages);
 	kfree(pages);
@@ -539,6 +545,25 @@ static int shmem_object_init(struct intel_memory_region *mem,
 
 	i915_gem_object_set_cache_coherency(obj, cache_level);
 
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
+	 *
+	 * By setting cache_dirty here we make the clflush when first acquiring
+	 * the pages unconditional on such platforms. We also set this again in
+	 * put_pages().
+	 */
+	if (IS_JSL_EHL(i915) && flags & I915_BO_ALLOC_USER)
+		obj->cache_dirty = true;
+
 	i915_gem_object_init_memory_region(obj, mem);
 
 	return 0;
-- 
2.26.3

