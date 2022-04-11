Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFF4FC7CA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB2E10E400;
	Mon, 11 Apr 2022 22:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4736F10E379;
 Mon, 11 Apr 2022 22:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649717005; x=1681253005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dcSY5IP003nbOlqOZlQNe6xKjLghyjwIfUU7O6kgB8M=;
 b=Iakzm4u0aPgRkkw0KI9vOTMIp2F1VKYLPZVExlynaEwrQzDiaArJ87wn
 Ml0FeS13OVVr9c0G8GD6ocfJPyz5op4pyyL6ONFJ2dedOMO8RtTweijyk
 0LCMWnM198quLHnib1a8s8Ue21SLZxsciEPIV6RX2swwrCxtYxXv8pZSh
 9GMovnwX60K86gJ4nUyP2fM8/ShfdIPX/DNGfbRj/H8NINOqdUHk15g/H
 IynE1lJdSWcoY6sv5CLtCTqKGbxhd2OCtQ0WEtH4gDHW81Taa/76BkWVq
 ep0PgfoSI8NBAB6ZWQqv6zah4GHAUgNksRhh+VkGyvuVBZbzlP1QCW7pz g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="249513170"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="249513170"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:43:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="551432086"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:43:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/doc: Convert drm_i915_query_topology_info
 comment to kerneldoc
Date: Mon, 11 Apr 2022 15:43:16 -0700
Message-Id: <20220411224319.467166-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220411224319.467166-1-matthew.d.roper@intel.com>
References: <20220411224319.467166-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This structure has a great comment describing the fields, but it's not
currently in kerneldoc form and does not show up in the generated
documentation.  Let's fix that and also clarify the description of what
"subslice" refers to on gen12 platforms and beyond and that "slice" is
no longer meaningful on Xe_HP and beyond.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/uapi/drm/i915_drm.h | 110 +++++++++++++++++++++++++-----------
 1 file changed, 78 insertions(+), 32 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 9ab021c4d632..73e1c6180ddb 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2775,66 +2775,112 @@ struct drm_i915_query {
 	__u64 items_ptr;
 };
 
-/*
- * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO :
- *
- * data: contains the 3 pieces of information :
- *
- * - the slice mask with one bit per slice telling whether a slice is
- *   available. The availability of slice X can be queried with the following
- *   formula :
- *
- *           (data[X / 8] >> (X % 8)) & 1
- *
- * - the subslice mask for each slice with one bit per subslice telling
- *   whether a subslice is available. Gen12 has dual-subslices, which are
- *   similar to two gen11 subslices. For gen12, this array represents dual-
- *   subslices. The availability of subslice Y in slice X can be queried
- *   with the following formula :
- *
- *           (data[subslice_offset +
- *                 X * subslice_stride +
- *                 Y / 8] >> (Y % 8)) & 1
- *
- * - the EU mask for each subslice in each slice with one bit per EU telling
- *   whether an EU is available. The availability of EU Z in subslice Y in
- *   slice X can be queried with the following formula :
+/**
+ * struct drm_i915_query_topology_info
  *
- *           (data[eu_offset +
- *                 (X * max_subslices + Y) * eu_stride +
- *                 Z / 8] >> (Z % 8)) & 1
+ * Describes slice/subslice/EU information queried by
+ * %DRM_I915_QUERY_TOPOLOGY_INFO
  */
 struct drm_i915_query_topology_info {
-	/*
+	/**
+	 * @flags:
+	 *
 	 * Unused for now. Must be cleared to zero.
 	 */
 	__u16 flags;
 
+	/**
+	 * @max_slices:
+	 *
+	 * The number of bits used to express the slice mask.
+	 */
 	__u16 max_slices;
+
+	/**
+	 * @max_subslices:
+	 *
+	 * The number of bits used to express the subslice mask.
+	 */
 	__u16 max_subslices;
+
+	/**
+	 * @max_eus_per_subslice:
+	 *
+	 * The number of bits in the EU mask that correspond to a single
+	 * subslice's EUs.
+	 */
 	__u16 max_eus_per_subslice;
 
-	/*
+	/**
+	 * @subslice_offset:
+	 *
 	 * Offset in data[] at which the subslice masks are stored.
 	 */
 	__u16 subslice_offset;
 
-	/*
+	/**
+	 * @subslice_stride:
+	 *
 	 * Stride at which each of the subslice masks for each slice are
 	 * stored.
 	 */
 	__u16 subslice_stride;
 
-	/*
+	/**
+	 * @eu_offset:
+	 *
 	 * Offset in data[] at which the EU masks are stored.
 	 */
 	__u16 eu_offset;
 
-	/*
+	/**
+	 * @eu_stride:
+	 *
 	 * Stride at which each of the EU masks for each subslice are stored.
 	 */
 	__u16 eu_stride;
 
+	/**
+	 * @data:
+	 *
+	 * Contains 3 pieces of information :
+	 *
+	 * - The slice mask with one bit per slice telling whether a slice is
+	 *   available. The availability of slice X can be queried with the
+	 *   following formula :
+	 *
+	 *   .. code:: c
+	 *
+	 *      (data[X / 8] >> (X % 8)) & 1
+	 *
+	 *   Starting with Xe_HP platforms, Intel hardware no longer has
+	 *   traditional slices so i915 will always report a single slice
+	 *   (hardcoded slicemask = 0x1) which contains all of the platform's
+	 *   subslices.  I.e., the mask here does not reflect any of the newer
+	 *   hardware concepts such as "gslices" or "cslices" since userspace
+	 *   is capable of inferring those from the subslice mask.
+	 *
+	 * - The subslice mask for each slice with one bit per subslice telling
+	 *   whether a subslice is available.  Starting with Gen12 we use the
+	 *   term "subslice" to refer to what the hardware documentation
+	 *   describes as a "dual-subslices."  The availability of subslice Y
+	 *   in slice X can be queried with the following formula :
+	 *
+	 *   .. code:: c
+	 *
+	 *      (data[subslice_offset + X * subslice_stride + Y / 8] >> (Y % 8)) & 1
+	 *
+	 * - The EU mask for each subslice in each slice, with one bit per EU
+	 *   telling whether an EU is available. The availability of EU Z in
+	 *   subslice Y in slice X can be queried with the following formula :
+	 *
+	 *   .. code:: c
+	 *
+	 *      (data[eu_offset +
+	 *            (X * max_subslices + Y) * eu_stride +
+	 *            Z / 8
+	 *       ] >> (Z % 8)) & 1
+	 */
 	__u8 data[];
 };
 
-- 
2.34.1

