Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D05EC849
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 17:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE9310E977;
	Tue, 27 Sep 2022 15:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2823210E96E;
 Tue, 27 Sep 2022 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664293199; x=1695829199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xgYMDheejIP4Z0EncNtdgLmZME3+lCB10meCcCJvIig=;
 b=Kjc5h7wQRiEmceb9/szJyv4Zd1S4RT9Ka9yAJg1IYVdHqEyNfp0aIKm7
 ZuZxa28HNmOMALUAlu0JWGScNybK09TCkg5I1mrzo3McnUjfqdpA/0CCO
 0N1aAKOAHeMuVsLMstRNJwkuRqOW5t0qXTvLRcMKp0hEAwTLt1ULe/DbR
 NWl40A98bUz+XAZf0n3dngbuNhjeGjP/3gULp4VLG8vi/etEfzT508bWK
 iSbUVHHev7Y/UAxpDZwKhGjhD3fpQsY1f9Uv9mCOKecwT278FasofmZXA
 y4C97LD2NpykXgmsJK6mRY0NoXfiLU9dCSOEmKuxIuWCiUROmQZ16JHDK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="301326932"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="301326932"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 08:39:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623794886"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="623794886"
Received: from kpaszkix-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.186])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 08:39:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/uapi: expose GTT alignment
Date: Tue, 27 Sep 2022 16:39:23 +0100
Message-Id: <20220927153923.97649-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927153923.97649-1-matthew.auld@intel.com>
References: <20220927153923.97649-1-matthew.auld@intel.com>
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
 Yang A Shi <yang.a.shi@intel.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some platforms we potentially have different alignment restrictions
depending on the memory type. We also now have different alignment
restrictions for the same region across different kernel versions.
Extend the region query to return the minimum required GTT alignment.

Testcase: igt@i915_query@query-regions-sanity-check
Suggested-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Yang A Shi <yang.a.shi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c |  1 +
 include/uapi/drm/i915_drm.h       | 29 +++++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 6ec9c9fb7b0d..111377f210ed 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -498,6 +498,7 @@ static int query_memregion_info(struct drm_i915_private *i915,
 		info.region.memory_class = mr->type;
 		info.region.memory_instance = mr->instance;
 		info.probed_size = mr->total;
+		info.gtt_alignment = mr->min_page_size;
 
 		if (mr->type == INTEL_MEMORY_LOCAL)
 			info.probed_cpu_visible_size = mr->io_size;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 791b4a8b6f97..c2fdde022337 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3330,8 +3330,33 @@ struct drm_i915_memory_region_info {
 	/** @region: The class:instance pair encoding */
 	struct drm_i915_gem_memory_class_instance region;
 
-	/** @rsvd0: MBZ */
-	__u32 rsvd0;
+	union {
+		/** @rsvd0: MBZ */
+		__u32 rsvd0;
+		/**
+		 * @gtt_alignment:
+		 *
+		 * The minimum required GTT alignment for this type of memory.
+		 * When allocating a GTT address it must be aligned to this
+		 * value or larger. On some platforms the kernel might opt to
+		 * using 64K pages for I915_MEMORY_CLASS_DEVICE, where 64K GTT
+		 * pages can then be used if we also use 64K GTT alignment.
+		 *
+		 * NOTE: If this is zero then this must be an older
+		 * kernel which lacks support for this field.
+		 *
+		 * Side note: For larger objects (especially for
+		 * I915_MEMORY_CLASS_DEVICE), like 2M+ in size, userspace should
+		 * consider potentially bumping the GTT alignment to say 2M,
+		 * which could potentially increase the likelihood of the kernel
+		 * being able to utilise 2M GTT pages underneath, if the layout
+		 * of the physical pages allows it.  On some configurations we
+		 * can then also use a more efficient page-table layout, if we
+		 * can't use the more desirable 2M GTT page, so long as we know
+		 * that the entire page-table will be used by this object.
+		 */
+		__u32 gtt_alignment;
+	};
 
 	/**
 	 * @probed_size: Memory probed by the driver
-- 
2.37.3

