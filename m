Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA16CD303
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3663110EA3A;
	Wed, 29 Mar 2023 07:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082E710EA2A;
 Wed, 29 Mar 2023 07:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680074711; x=1711610711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rjnVmGthyA2AoK36NNkda5pFc1ytlDwIEHuVtO8n3xE=;
 b=FLc6yL2n5lGbdZsXJB8Wcz7ATWiSd9wsBdKUBFpFZvL1jBr4/A4Rr1Yp
 FTqll7vWBRpy79G86zGyoIfqB4tlSCz5r+kYLjVs18beoyBowTW1rwpvQ
 EeQ8O0O4MyiysTmd/3iO0JYyEoU0Ani0V/Yd5IVXOHXw7j/iJupOKBf6b
 E3pEeK5pj+lU5RNZEvjIayoIH3FWD+HYYBeFdxOOh5xErf9lTvI5nvPNW
 Lg8riQ3GvDx2UDMcwU2//uGdYuyCCcNdbslP2/FQneAuWI3q3dSM27xlF
 cU1VUoRhXjaeJ8XEYlP54rGLrfSt2f9UJJFJvGUy/KNfvnx6XuF3VJoC9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405746238"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="405746238"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="684160663"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="684160663"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2023 00:24:55 -0700
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Date: Wed, 29 Mar 2023 15:32:20 +0800
Message-Id: <20230329073220.3982460-10-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhao Liu <zhao1.liu@intel.com>

The use of kmap_atomic() is being deprecated in favor of
kmap_local_page()[1], and this patch converts the calls from
kmap_atomic() to kmap_local_page().

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption (the preemption is
disabled for !PREEMPT_RT case, otherwise it only disables migration).

With kmap_local_page(), we can avoid the often unwanted side effect of
unnecessary page faults and preemption disables.

In i915_gem_execbuffer.c, eb->reloc_cache.vaddr is mapped by
kmap_atomic() in eb_relocate_entry(), and is unmapped by
kunmap_atomic() in reloc_cache_reset().

And this mapping/unmapping occurs in two places: one is in
eb_relocate_vma(), and another is in eb_relocate_vma_slow().

The function eb_relocate_vma() or eb_relocate_vma_slow() doesn't
need to disable pagefaults and preemption during the above mapping/
unmapping.

So it can simply use kmap_local_page() / kunmap_local() that can
instead do the mapping / unmapping regardless of the context.

Convert the calls of kmap_atomic() / kunmap_atomic() to
kmap_local_page() / kunmap_local().

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com

v2: No code change since v1. Added description of the motivation of
    using kmap_local_page() and "Suggested-by" tag of Fabio.

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credits:
  Ira: Referred to his task document, review comments.
  Fabio: Referred to his boiler plate commit message and his description
         about why kmap_local_page() should be preferred.
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 9dce2957b4e5..805565edd148 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1151,7 +1151,7 @@ static void reloc_cache_unmap(struct reloc_cache *cache)
 
 	vaddr = unmask_page(cache->vaddr);
 	if (cache->vaddr & KMAP)
-		kunmap_atomic(vaddr);
+		kunmap_local(vaddr);
 	else
 		io_mapping_unmap_atomic((void __iomem *)vaddr);
 }
@@ -1167,7 +1167,7 @@ static void reloc_cache_remap(struct reloc_cache *cache,
 	if (cache->vaddr & KMAP) {
 		struct page *page = i915_gem_object_get_page(obj, cache->page);
 
-		vaddr = kmap_atomic(page);
+		vaddr = kmap_local_page(page);
 		cache->vaddr = unmask_flags(cache->vaddr) |
 			(unsigned long)vaddr;
 	} else {
@@ -1197,7 +1197,7 @@ static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer
 		if (cache->vaddr & CLFLUSH_AFTER)
 			mb();
 
-		kunmap_atomic(vaddr);
+		kunmap_local(vaddr);
 		i915_gem_object_finish_access(obj);
 	} else {
 		struct i915_ggtt *ggtt = cache_to_ggtt(cache);
@@ -1229,7 +1229,7 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
 	struct page *page;
 
 	if (cache->vaddr) {
-		kunmap_atomic(unmask_page(cache->vaddr));
+		kunmap_local(unmask_page(cache->vaddr));
 	} else {
 		unsigned int flushes;
 		int err;
@@ -1251,7 +1251,7 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
 	if (!obj->mm.dirty)
 		set_page_dirty(page);
 
-	vaddr = kmap_atomic(page);
+	vaddr = kmap_local_page(page);
 	cache->vaddr = unmask_flags(cache->vaddr) | (unsigned long)vaddr;
 	cache->page = pageno;
 
-- 
2.34.1

