Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B889B802420
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 14:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DC010E2D8;
	Sun,  3 Dec 2023 13:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467A10E2AA;
 Sun,  3 Dec 2023 13:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701609476; x=1733145476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5tg3umOvWMLFINtDpx9XgsbQvVEtzPNqeysIbkIpyE8=;
 b=HdVuHcms+EcGrspfStOPCC0ksvCIivGabNST+mFLA+gqpyNkwvaG9LpT
 bYhn37fzG0YTxasc64TpG4Ie6RUWOu6yFnzaV4MuMcQfad58JOkmLuEC2
 RUa2dBidGVhtpY/9jYjQ2pkgRAdCm9T/SzJKxONkAM07n+GpunXEb3Q3p
 uWazYa1JqVJS/gxsN2QyLnTxfg5CWUqZbRLptkgM/geP69PvXxXvMZo7Y
 MWH9UlbpmG5hF60XN0SJKlzgCekKQZiv+2UGkIJqRBDuJRkpQGWISr39B
 DDwBMrPkTroY1OWT0D5cK7zpJ2r3tJYynBVz7KBLkLs1au3SoW4icmlTi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="498215"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="498215"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 05:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770262355"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="770262355"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga002.jf.intel.com with ESMTP; 03 Dec 2023 05:17:48 -0800
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
Subject: [PATCH v3 2/9] drm/i915: Use memcpy_[from/to]_page() in
 gem/i915_gem_pyhs.c
Date: Sun,  3 Dec 2023 21:29:40 +0800
Message-Id: <20231203132947.2328805-3-zhao1.liu@linux.intel.com>
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
kmap_local_page()[1],  and this patch converts the call from
kmap_atomic() + memcpy() to memcpy_[from/to]_page(), which use
kmap_local_page() to build local mapping and then do memcpy().

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption (the preemption is
disabled for !PREEMPT_RT case, otherwise it only disables migration).

With kmap_local_page(), we can avoid the often unwanted side effect of
unnecessary page faults and preemption disables.

In drm/i915/gem/i915_gem_phys.c, the functions
i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
don't need to disable pagefaults and preemption for mapping because of
2 reasons:

1. The flush operation is safe. In drm/i915/gem/i915_gem_object.c,
i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
calls drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush.
Since CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
drm_clflush_virt_range(), the flush operation is global.

2. Any context switch caused by preemption or page faults (page fault
may cause sleep) doesn't affect the validity of local mapping.

Therefore, i915_gem_object_get_pages_phys() and
i915_gem_object_put_pages_phys() are two functions where the uses of
local mappings in place of atomic mappings are correctly suited.

Convert the calls of kmap_atomic() / kunmap_atomic() + memcpy() to
memcpy_from_page() and memcpy_to_page().

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
Suggested by credits:
  Dave: Referred to his explanation about cache flush.
  Ira: Referred to his task document, review comments and explanation
       about cache flush.
  Fabio: Referred to his boiler plate commit message and his description
         about why kmap_local_page() should be preferred.
---
 drivers/gpu/drm/i915/gem/i915_gem_phys.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 5df128e2f4dc..ef85c6dc9fd5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -65,16 +65,13 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 	dst = vaddr;
 	for (i = 0; i < obj->base.size / PAGE_SIZE; i++) {
 		struct page *page;
-		void *src;
 
 		page = shmem_read_mapping_page(mapping, i);
 		if (IS_ERR(page))
 			goto err_st;
 
-		src = kmap_atomic(page);
-		memcpy(dst, src, PAGE_SIZE);
+		memcpy_from_page(dst, page, 0, PAGE_SIZE);
 		drm_clflush_virt_range(dst, PAGE_SIZE);
-		kunmap_atomic(src);
 
 		put_page(page);
 		dst += PAGE_SIZE;
@@ -113,16 +110,13 @@ i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 
 		for (i = 0; i < obj->base.size / PAGE_SIZE; i++) {
 			struct page *page;
-			char *dst;
 
 			page = shmem_read_mapping_page(mapping, i);
 			if (IS_ERR(page))
 				continue;
 
-			dst = kmap_atomic(page);
 			drm_clflush_virt_range(src, PAGE_SIZE);
-			memcpy(dst, src, PAGE_SIZE);
-			kunmap_atomic(dst);
+			memcpy_to_page(page, 0, src, PAGE_SIZE);
 
 			set_page_dirty(page);
 			if (obj->mm.madv == I915_MADV_WILLNEED)
-- 
2.34.1

