Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98DA802423
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 14:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0321610E2DC;
	Sun,  3 Dec 2023 13:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2970410E2C7;
 Sun,  3 Dec 2023 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701609501; x=1733145501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B+nJe1q6TxRa2V23foliRrj6Cka4wr6NofSF5rxQ4eQ=;
 b=FFz0Ikiy+KFB23gCmF0/Mzt5MHfYyqst7tqnChQk74r4UsEbxFMiIjo0
 3d50oHbWxS9bLbl09vxd9U4pMLtMggU7W0ce4/JmUlkEy0pQ0ziAGRwIt
 mBmxCOaxF9giA6cupaaYpjbH2E60fl+PjZBfc/mW8hUbmhKx3m5GAxwt0
 lT3ZBuwR5/EUbYb+cO2lgqHC4uKAycL7U3sFJZx8bSh5q+VjZdtoMMZXd
 79zH9AxNIRVNft6jRwwRVag8L3OT7qHErfcNhylfnbj8SI9pO234vKSLb
 +xPhvTMPkYYlewsQoc44zlz0fxQBEkZ/QBreh6nKHzcLzCU+B2/jIW149 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="498266"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="498266"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 05:18:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770262492"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="770262492"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga002.jf.intel.com with ESMTP; 03 Dec 2023 05:18:16 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ira Weiny <ira.weiny@intel.com>,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Date: Sun,  3 Dec 2023 21:29:47 +0800
Message-Id: <20231203132947.2328805-10-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203132947.2328805-1-zhao1.liu@linux.intel.com>
References: <20231203132947.2328805-1-zhao1.liu@linux.intel.com>
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
Cc: Dave Hansen <dave.hansen@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
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

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
Suggested by credits:
  Ira: Referred to his task document, review comments.
  Fabio: Referred to his boiler plate commit message and his description
         about why kmap_local_page() should be preferred.
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 683fd8d3151c..18b0f3117074 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1156,7 +1156,7 @@ static void reloc_cache_unmap(struct reloc_cache *cache)
 
 	vaddr = unmask_page(cache->vaddr);
 	if (cache->vaddr & KMAP)
-		kunmap_atomic(vaddr);
+		kunmap_local(vaddr);
 	else
 		io_mapping_unmap_atomic((void __iomem *)vaddr);
 }
@@ -1172,7 +1172,7 @@ static void reloc_cache_remap(struct reloc_cache *cache,
 	if (cache->vaddr & KMAP) {
 		struct page *page = i915_gem_object_get_page(obj, cache->page);
 
-		vaddr = kmap_atomic(page);
+		vaddr = kmap_local_page(page);
 		cache->vaddr = unmask_flags(cache->vaddr) |
 			(unsigned long)vaddr;
 	} else {
@@ -1202,7 +1202,7 @@ static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer
 		if (cache->vaddr & CLFLUSH_AFTER)
 			mb();
 
-		kunmap_atomic(vaddr);
+		kunmap_local(vaddr);
 		i915_gem_object_finish_access(obj);
 	} else {
 		struct i915_ggtt *ggtt = cache_to_ggtt(cache);
@@ -1234,7 +1234,7 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
 	struct page *page;
 
 	if (cache->vaddr) {
-		kunmap_atomic(unmask_page(cache->vaddr));
+		kunmap_local(unmask_page(cache->vaddr));
 	} else {
 		unsigned int flushes;
 		int err;
@@ -1256,7 +1256,7 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
 	if (!obj->mm.dirty)
 		set_page_dirty(page);
 
-	vaddr = kmap_atomic(page);
+	vaddr = kmap_local_page(page);
 	cache->vaddr = unmask_flags(cache->vaddr) | (unsigned long)vaddr;
 	cache->page = pageno;
 
-- 
2.34.1

