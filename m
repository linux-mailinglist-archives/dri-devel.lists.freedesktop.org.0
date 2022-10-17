Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E954C60247A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0676710EE86;
	Tue, 18 Oct 2022 06:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F9D10ED0F;
 Mon, 17 Oct 2022 09:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665999147; x=1697535147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tiW6Fpm0hVgB6aQj9aJLze7KS0YilKpmQTotRlfBNY0=;
 b=byAIm+CZyqpTzAvFjOrdoEfFq1gPFEXGD2l04JB16wzJKzd0NHZoP/GN
 JiUy9STG+cSEMWAIJa1qAluPP11aa6hqBQTno6G2aAehNqhctoEVWV19u
 qj1o3pfk55vYhaVKVaC3pAgCkvuYbXHGIKfcbozNTASnLYv/YH8TGvEhD
 k0bIGc7W/69qubuimCi8e8Xbv4zRAPUUJz0U2tPUXhLXi5XMEm23gfj5+
 8DJCziH9HnNuMAeNGdQ9FhA40uGmMuEK/uyBuBMVAjBW9yo5wq8uw+xaJ
 lJviY/ZAJB8m8PKkT5Uro5P8aytCrtwG9ybytQdwMrvzSwWuvEaawTTUh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="286142597"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="286142597"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="717431213"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="717431213"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.132])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2022 02:32:23 -0700
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
Subject: [PATCH 1/9] drm/i915: Use kmap_local_page() in gem/i915_gem_object.c
Date: Mon, 17 Oct 2022 17:37:17 +0800
Message-Id: <20221017093726.2070674-2-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Oct 2022 06:35:11 +0000
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
kmap_local_page()[1].

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption.

There're 2 reasons why i915_gem_object_read_from_page_kmap() doesn't
need to disable pagefaults and preemption for mapping:

1. The flush operation is safe for CPU hotplug when preemption is not
disabled. In drm/i915/gem/i915_gem_object.c, the function
i915_gem_object_read_from_page_kmap() calls drm_clflush_virt_range() to
use CLFLUSHOPT or WBINVD to flush. Since CLFLUSHOPT is global on x86
and WBINVD is called on each cpu in drm_clflush_virt_range(), the flush
operation is global and any issue with cpu's being added or removed
can be handled safely.

2. Any context switch caused by preemption or sleep (pagefault may
cause sleep) doesn't affect the validity of local mapping.

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
---
Suggested by credits:
  Dave: Referred to his explanation about cache flush.
  Ira: Referred to his task document, review comments and explanation about
       cache flush.
  Fabio: Referred to his boiler plate commit message.
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 369006c5317f..a0072abed75e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -413,17 +413,15 @@ void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
 static void
 i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
 {
-	void *src_map;
 	void *src_ptr;
 
-	src_map = kmap_atomic(i915_gem_object_get_page(obj, offset >> PAGE_SHIFT));
-
-	src_ptr = src_map + offset_in_page(offset);
+	src_ptr = kmap_local_page(i915_gem_object_get_page(obj, offset >> PAGE_SHIFT))
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

