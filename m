Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE03C6EDC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 12:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4F66E06E;
	Tue, 13 Jul 2021 10:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4194489D00;
 Tue, 13 Jul 2021 10:47:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197325330"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="197325330"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="503054396"
Received: from ewaterla-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/ehl: unconditionally flush the pages on acquire
Date: Tue, 13 Jul 2021 11:45:54 +0100
Message-Id: <20210713104554.2381406-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210713104554.2381406-1-matthew.auld@intel.com>
References: <20210713104554.2381406-1-matthew.auld@intel.com>
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
v3: move to get_pages() which looks simpler

BSpec: 34007
References: 046091758b50 ("Revert "drm/i915/ehl: Update MOCS table for EHL"")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: Francisco Jerez <francisco.jerez.plata@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h   |  6 ++++++
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c      | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index da2194290436..7089d1b222c5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -522,6 +522,12 @@ struct drm_i915_gem_object {
 	 * I915_BO_CACHE_COHERENT_FOR_WRITE, i.e that the GPU will be coherent
 	 * for both reads and writes though the CPU cache. So pretty much this
 	 * should only be needed for I915_CACHE_NONE objects.
+	 *
+	 * Update: Some bonkers hardware decided to add the 'Bypass LLC' MOCS
+	 * entry, which defeats our @cache_coherent tracking, since userspace
+	 * can freely bypass the CPU cache when touching the pages with the GPU,
+	 * where the kernel is completely unaware. On such platform we need
+	 * apply the sledgehammer-on-acquire regardless of the @cache_coherent.
 	 */
 	unsigned int cache_dirty:1;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 6a04cce188fc..11f072193f3b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -182,6 +182,24 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	if (i915_gem_object_needs_bit17_swizzle(obj))
 		i915_gem_object_do_bit_17_swizzle(obj, st);
 
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
+	 * By setting cache_dirty here we make the clflush in set_pages
+	 * unconditional on such platforms.
+	 */
+	if (IS_JSL_EHL(i915) && obj->flags & I915_BO_ALLOC_USER)
+		obj->cache_dirty = true;
+
 	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
 
 	return 0;
-- 
2.26.3

