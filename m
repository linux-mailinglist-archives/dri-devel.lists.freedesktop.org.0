Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F8364005
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 12:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E586E247;
	Mon, 19 Apr 2021 10:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30C56E23B;
 Mon, 19 Apr 2021 10:59:01 +0000 (UTC)
IronPort-SDR: YKag3lZCzjljXTVkw4kAMnu+YjK5fWME6MVZ3gG9US8b21R4PXC4/1/Pf2Z6F9IkatcE8Eq02s
 YwZUw0tPJCSg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="259264078"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="259264078"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:59:01 -0700
IronPort-SDR: 6H6aTQ+pANLsMFULpNfntVlzILQTFV3d9UeP1Dqrt6Kb/pFv2LQZY+IoQ79N3kjA368BBB63e7
 lgIjKoRcNADA==
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="383700207"
Received: from vpjampan-mobl2.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.9.192])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:58:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/i915/uapi: convert i915_query and friend to kernel
 doc
Date: Mon, 19 Apr 2021 11:57:41 +0100
Message-Id: <20210419105741.27844-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419105741.27844-1-matthew.auld@intel.com>
References: <20210419105741.27844-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a note about the two-step process.

v2(Tvrtko):
  - Also document the other method of just passing in a buffer which is
    large enough, which avoids two ioctl calls. Can make sense for
    smaller query items.
v3: prefer kernel-doc references for structs and members

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 include/uapi/drm/i915_drm.h | 69 +++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index e2867d8cd5e3..6a34243a7646 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2218,53 +2218,94 @@ struct drm_i915_perf_oa_config {
 	__u64 flex_regs_ptr;
 };
 
+/**
+ * struct drm_i915_query_item - An individual query for the kernel to process.
+ *
+ * The behaviour is determined by the @query_id. Note that exactly what
+ * @data_ptr is also depends on the specific @query_id.
+ */
 struct drm_i915_query_item {
+	/** @query_id: The id for this query */
 	__u64 query_id;
 #define DRM_I915_QUERY_TOPOLOGY_INFO    1
 #define DRM_I915_QUERY_ENGINE_INFO	2
 #define DRM_I915_QUERY_PERF_CONFIG      3
 /* Must be kept compact -- no holes and well documented */
 
-	/*
+	/**
+	 * @length:
+	 *
 	 * When set to zero by userspace, this is filled with the size of the
-	 * data to be written at the data_ptr pointer. The kernel sets this
+	 * data to be written at the @data_ptr pointer. The kernel sets this
 	 * value to a negative value to signal an error on a particular query
 	 * item.
 	 */
 	__s32 length;
 
-	/*
+	/**
+	 * @flags:
+	 *
 	 * When query_id == DRM_I915_QUERY_TOPOLOGY_INFO, must be 0.
 	 *
 	 * When query_id == DRM_I915_QUERY_PERF_CONFIG, must be one of the
-	 * following :
-	 *         - DRM_I915_QUERY_PERF_CONFIG_LIST
-	 *         - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
-	 *         - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
+	 * following:
+	 *
+	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
+	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
+	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
 	 */
 	__u32 flags;
 #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
 #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID 2
 #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID   3
 
-	/*
-	 * Data will be written at the location pointed by data_ptr when the
-	 * value of length matches the length of the data to be written by the
+	/**
+	 * @data_ptr:
+	 *
+	 * Data will be written at the location pointed by @data_ptr when the
+	 * value of @length matches the length of the data to be written by the
 	 * kernel.
 	 */
 	__u64 data_ptr;
 };
 
+/**
+ * struct drm_i915_query - Supply an array of struct drm_i915_query_item for the
+ * kernel to fill out.
+ *
+ * Note that this is generally a two step process for each struct
+ * drm_i915_query_item in the array:
+ *
+ * 1. Call the DRM_IOCTL_I915_QUERY, giving it our array of struct
+ *    drm_i915_query_item, with &drm_i915_query_item.length set to zero. The
+ *    kernel will then fill in the size, in bytes, which tells userspace how
+ *    memory it needs to allocate for the blob(say for an array of properties).
+ *
+ * 2. Next we call DRM_IOCTL_I915_QUERY again, this time with the
+ *    &drm_i915_query_item.data_ptr equal to our newly allocated blob. Note that
+ *    the &drm_i915_query_item.length should still be the same as what the
+ *    kernel previously set. At this point the kernel can fill in the blob.
+ *
+ * Note that for some query items it can make sense for userspace to just pass
+ * in a buffer/blob equal to or larger than the required size. In this case only
+ * a single ioctl call is needed. For some smaller query items this can work
+ * quite well.
+ *
+ */
 struct drm_i915_query {
+	/** @num_items: The number of elements in the @items_ptr array */
 	__u32 num_items;
 
-	/*
-	 * Unused for now. Must be cleared to zero.
+	/**
+	 * @flags: Unused for now. Must be cleared to zero.
 	 */
 	__u32 flags;
 
-	/*
-	 * This points to an array of num_items drm_i915_query_item structures.
+	/**
+	 * @items_ptr:
+	 *
+	 * Pointer to an array of struct drm_i915_query_item. The number of
+	 * array elements is @num_items.
 	 */
 	__u64 items_ptr;
 };
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
