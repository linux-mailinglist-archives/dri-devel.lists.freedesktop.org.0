Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA655FF58
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6C6112E49;
	Wed, 29 Jun 2022 12:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C659F112E49;
 Wed, 29 Jun 2022 12:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656504891; x=1688040891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MU+48X7ZIk7q15qR/O+embKczC/vR65G9dcYO4D7Acw=;
 b=EmTd7WEgf7Q0W4zlzOJOlm4JE/3rv++iBOIWVGnBaTSk1cQzt9udlqFp
 o8kvGEu2FuKsUUz16ahSvDUuizQUGxH8iM5yRLTdsUVkQUfZEXDuMwNkl
 lFQd17YHwNv9cXNiwo8XfgvdyWvCjeoYSfHWHZ2RQ1qvLsNN0PdMiW0AV
 KpgtbABFs0HsGMnWbXNnBi6KLRdUzkkRP0uTzQyLwbg4AlZK3P47/2HEM
 YvIr4lUvEPXY/Bv1C9RBsDtp/mliSm2xfeOP+6Bq6G5vp1njqCnCSyyhK
 wOEDhPFXuGl2lJ1ryTgshYJFZo6mzjy2x6RAH7RS7G6TmGE8juvs3Yq/Z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="262421361"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="262421361"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:14:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="595215009"
Received: from nwalsh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.202.136])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:14:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 02/13] drm/i915/uapi: add probed_cpu_visible_size
Date: Wed, 29 Jun 2022 13:14:16 +0100
Message-Id: <20220629121427.353800-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629121427.353800-1-matthew.auld@intel.com>
References: <20220629121427.353800-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace wants to know the size of CPU visible portion of device
local-memory, and on small BAR devices the probed_size is no longer
enough. In Vulkan, for example, it would like to know the size in bytes
for CPU visible VkMemoryHeap. We already track the io_size for each
region, so plumb that through to the region query.

v2: Drop the ( -1 = unknown ) stuff, which is confusing since nothing
can currently ever return such a value.

Testcase: igt@i915_query@query-regions-sanity-check
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_query.c |  6 +++
 include/uapi/drm/i915_drm.h       | 76 +++++++++++++++++--------------
 2 files changed, 48 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 0094f67c63f2..9894add651dd 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -498,6 +498,12 @@ static int query_memregion_info(struct drm_i915_private *i915,
 		info.region.memory_class = mr->type;
 		info.region.memory_instance = mr->instance;
 		info.probed_size = mr->total;
+
+		if (mr->type == INTEL_MEMORY_LOCAL)
+			info.probed_cpu_visible_size = mr->io_size;
+		else
+			info.probed_cpu_visible_size = mr->total;
+
 		info.unallocated_size = mr->avail;
 
 		if (__copy_to_user(info_ptr, &info, sizeof(info)))
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index de49b68b4fc8..7eacacb00373 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3207,36 +3207,6 @@ struct drm_i915_gem_memory_class_instance {
  * struct drm_i915_memory_region_info - Describes one region as known to the
  * driver.
  *
- * Note that we reserve some stuff here for potential future work. As an example
- * we might want expose the capabilities for a given region, which could include
- * things like if the region is CPU mappable/accessible, what are the supported
- * mapping types etc.
- *
- * Note that to extend struct drm_i915_memory_region_info and struct
- * drm_i915_query_memory_regions in the future the plan is to do the following:
- *
- * .. code-block:: C
- *
- *	struct drm_i915_memory_region_info {
- *		struct drm_i915_gem_memory_class_instance region;
- *		union {
- *			__u32 rsvd0;
- *			__u32 new_thing1;
- *		};
- *		...
- *		union {
- *			__u64 rsvd1[8];
- *			struct {
- *				__u64 new_thing2;
- *				__u64 new_thing3;
- *				...
- *			};
- *		};
- *	};
- *
- * With this things should remain source compatible between versions for
- * userspace, even as we add new fields.
- *
  * Note this is using both struct drm_i915_query_item and struct drm_i915_query.
  * For this new query we are adding the new query id DRM_I915_QUERY_MEMORY_REGIONS
  * at &drm_i915_query_item.query_id.
@@ -3248,14 +3218,52 @@ struct drm_i915_memory_region_info {
 	/** @rsvd0: MBZ */
 	__u32 rsvd0;
 
-	/** @probed_size: Memory probed by the driver (-1 = unknown) */
+	/**
+	 * @probed_size: Memory probed by the driver
+	 *
+	 * Note that it should not be possible to ever encounter a zero value
+	 * here, also note that no current region type will ever return -1 here.
+	 * Although for future region types, this might be a possibility. The
+	 * same applies to the other size fields.
+	 */
 	__u64 probed_size;
 
-	/** @unallocated_size: Estimate of memory remaining (-1 = unknown) */
+	/** @unallocated_size: Estimate of memory remaining */
 	__u64 unallocated_size;
 
-	/** @rsvd1: MBZ */
-	__u64 rsvd1[8];
+	union {
+		/** @rsvd1: MBZ */
+		__u64 rsvd1[8];
+		struct {
+			/**
+			 * @probed_cpu_visible_size: Memory probed by the driver
+			 * that is CPU accessible.
+			 *
+			 * This will be always be <= @probed_size, and the
+			 * remainder (if there is any) will not be CPU
+			 * accessible.
+			 *
+			 * On systems without small BAR, the @probed_size will
+			 * always equal the @probed_cpu_visible_size, since all
+			 * of it will be CPU accessible.
+			 *
+			 * Note this is only tracked for
+			 * I915_MEMORY_CLASS_DEVICE regions (for other types the
+			 * value here will always equal the @probed_size).
+			 *
+			 * Note that if the value returned here is zero, then
+			 * this must be an old kernel which lacks the relevant
+			 * small-bar uAPI support (including
+			 * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS), but on
+			 * such systems we should never actually end up with a
+			 * small BAR configuration, assuming we are able to load
+			 * the kernel module. Hence it should be safe to treat
+			 * this the same as when @probed_cpu_visible_size ==
+			 * @probed_size.
+			 */
+			__u64 probed_cpu_visible_size;
+		};
+	};
 };
 
 /**
-- 
2.36.1

