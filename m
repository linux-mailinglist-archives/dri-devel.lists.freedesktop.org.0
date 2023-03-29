Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB29F6CD2E6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED81D10E4E6;
	Wed, 29 Mar 2023 07:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6D210E4E6;
 Wed, 29 Mar 2023 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680074665; x=1711610665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B9E1ILllxkVCqOIIL0NVEqX87fQCrIe+LT/GYjLQv6c=;
 b=IPGrewcs7t+1gJaCxxOmOAXIwBwe3Lftr+sTZUC9jjydLOky2hYLj9Tj
 q8qmDCFtqMtQ4qA5Bwh/erUuPNfrtOR0tSOutstkukzP8N726bNjVVmTM
 jTZ76J2kujy9/sWp49JChKoRKg/imsYjtnUT25skJoncj84JZ+u9Ppn5q
 yB7ZXVdqrdYsY7j3NNyuqdt9+bA8b+MVxGMRX5F1LocBgVM54da9DnCc9
 xcz0ZkRrFscRg8KM2jm+0Sc7EfG5QtS+7o3k7x/DhhopgCY6mHd68gNho
 AtTDrHgPq1g3xyttioTLAM7K24b43Ma3f6VHrx6jX1q9LXVN9xWVNOshP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405745883"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="405745883"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="684160553"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="684160553"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2023 00:24:19 -0700
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
Subject: [PATCH v2 2/9] drm/i915: Use memcpy_[from/to]_page() in
 gem/i915_gem_pyhs.c
Date: Wed, 29 Mar 2023 15:32:13 +0800
Message-Id: <20230329073220.3982460-3-zhao1.liu@linux.intel.com>
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
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dave Hansen <dave.hansen@intel.com>
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

v2:
* Used memcpy_from_page() and memcpy_to_page() to replace
  kmap_local_page() + memcpy().
* Dropped hot plug related description since it has nothing to do with
  kmap_local_page().
* Added description of the motivation of using kmap_local_page().

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credits:
  Dave: Referred to his explanation about cache flush.
  Ira: Referred to his task document, review comments and explanation
       about cache flush.
  Fabio: Referred to his boiler plate commit message and his description
         about why kmap_local_page() should be preferred. Also based on
         his suggestion to use memcpy_[from/to]_page() directly.
---
 drivers/gpu/drm/i915/gem/i915_gem_phys.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 76efe98eaa14..4c6d3f07260a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -64,16 +64,13 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
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
@@ -112,16 +109,13 @@ i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 
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

