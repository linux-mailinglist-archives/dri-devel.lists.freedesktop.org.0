Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ACB3C26EC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 17:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5066EA48;
	Fri,  9 Jul 2021 15:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C6F6EA3F;
 Fri,  9 Jul 2021 15:34:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="295358909"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="295358909"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 08:34:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="566025819"
Received: from cchauvet-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.4.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 08:34:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/ehl: unconditionally flush the pages on acquire
Date: Fri,  9 Jul 2021 16:34:24 +0100
Message-Id: <20210709153424.1999623-1-matthew.auld@intel.com>
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

v2: this time actually set cache_dirty in put_pages()

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
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 6a04cce188fc..d5a487d4c5a6 100644
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
@@ -327,6 +328,10 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
 		check_release_pagevec(&pvec);
 	obj->mm.dirty = false;
 
+	/* See the comment in shmem_object_init() for why we need this */
+	if (IS_JSL_EHL(i915) && obj->flags & I915_BO_ALLOC_USER)
+		obj->cache_dirty = true;
+
 	sg_free_table(pages);
 	kfree(pages);
 }
@@ -539,6 +544,25 @@ static int shmem_object_init(struct intel_memory_region *mem,
 
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

