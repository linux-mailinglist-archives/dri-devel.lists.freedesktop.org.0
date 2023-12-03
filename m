Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7A80240C
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 14:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C674B10E2AB;
	Sun,  3 Dec 2023 13:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBBE10E29E;
 Sun,  3 Dec 2023 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701609469; x=1733145469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RGMem3p2DJYsfNDR22BCHsoG0wKxhOHO8cUgjkpX0Tg=;
 b=h8u8zRKRGYeNE01Bp2yNO7wAD3ZuK3RNINwjE4Nr+tSbUwI0h5EkMEVq
 oykpi82UeZpHHKlPielrekhrN4WbPJjnWl1QM//SdnD+DjBgSWeCw0z5s
 bLaCOlTQRIGvg8qMf4JeInA8ajvz7WvwN6tKAG1oJWEiueiiRR51fMXIW
 VcgBIK6r++jkek3ouzTwgND6Y+vgYhWu+aJ99GtI7Tfasq6tOwTK8RnTv
 utn+2FpVA8ltRyJXDt0uIrwRkDG3l7dvpMD3LI0jnOsPQE0Y3IDgKAxba
 y/n6mBjztFJFWZGZLnZruZKjsN9QRpkqXKjhGvR0rXFHQJQSNEMqfk8G4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="498210"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="498210"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 05:17:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770262333"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="770262333"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga002.jf.intel.com with ESMTP; 03 Dec 2023 05:17:44 -0800
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
Subject: [PATCH v3 1/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_object.c
Date: Sun,  3 Dec 2023 21:29:39 +0800
Message-Id: <20231203132947.2328805-2-zhao1.liu@linux.intel.com>
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
kmap_local_page()[1], and this patch converts the call from
kmap_atomic() to kmap_local_page().

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption (the preemption is
disabled for !PREEMPT_RT case, otherwise it only disables migration).

With kmap_local_page(), we can avoid the often unwanted side effect of
unnecessary page faults and preemption disables.

There're 2 reasons why i915_gem_object_read_from_page_kmap() doesn't
need to disable pagefaults and preemption for mapping:

1. The flush operation is safe. In drm/i915/gem/i915_gem_object.c,
i915_gem_object_read_from_page_kmap() calls drm_clflush_virt_range() to
use CLFLUSHOPT or WBINVD to flush. Since CLFLUSHOPT is global on x86
and WBINVD is called on each cpu in drm_clflush_virt_range(), the flush
operation is global.

2. Any context switch caused by preemption or page faults (page fault
may cause sleep) doesn't affect the validity of local mapping.

Therefore, i915_gem_object_read_from_page_kmap() is a function where
the use of kmap_local_page() in place of kmap_atomic() is correctly
suited.

Convert the calls of kmap_atomic() / kunmap_atomic() to
kmap_local_page() / kunmap_local().

And remove the redundant variable that stores the address of the mapped
page since kunmap_local() can accept any pointer within the page.

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
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index c26d87555825..a2a7e5005415 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -493,17 +493,15 @@ static void
 i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
 {
 	pgoff_t idx = offset >> PAGE_SHIFT;
-	void *src_map;
 	void *src_ptr;
 
-	src_map = kmap_atomic(i915_gem_object_get_page(obj, idx));
-
-	src_ptr = src_map + offset_in_page(offset);
+	src_ptr = kmap_local_page(i915_gem_object_get_page(obj, idx))
+	          + offset_in_page(offset);
 	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
 		drm_clflush_virt_range(src_ptr, size);
 	memcpy(dst, src_ptr, size);
 
-	kunmap_atomic(src_map);
+	kunmap_local(src_ptr);
 }
 
 static void
-- 
2.34.1

