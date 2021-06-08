Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CA839F48F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 13:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265D26E123;
	Tue,  8 Jun 2021 11:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FD06EBA5;
 Tue,  8 Jun 2021 11:03:44 +0000 (UTC)
IronPort-SDR: hVo8K9aj1ND/p5yUTrqgntlgoe0iXJc7dZOUwdSz78ZZtxlfm0G1uy8aPWvW3MaW8hbWjfpHkI
 8x02rba0cZ2A==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204787029"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="204787029"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:03:42 -0700
IronPort-SDR: skuNToVxCT4dtTHQdd9pNzXuptkPbOaiA4HX7jqAhpdIw8mcQ+OCH+qxrIEARCMC5G5clz+3hV
 q4ya60eYIq6Q==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="552237193"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.215.170.251])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:03:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/7] drm/i915/ttm: pass along the I915_BO_ALLOC_CONTIGUOUS
Date: Tue,  8 Jun 2021 12:02:51 +0100
Message-Id: <20210608110254.169357-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608110254.169357-1-matthew.auld@intel.com>
References: <20210608110254.169357-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we just ignore the I915_BO_ALLOC_CONTIGUOUS flag, which is
fine since everything is already contiguous with the ttm range manager.
However in the next patch we want to switch over to the ttm buddy
manager, where allocations are by default not contiguous.

v2(Thomas):
    - Forward ALLOC_CONTIG for all regions

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 73d52df8f2be..c612275c36c9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -86,10 +86,14 @@ i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
 
 static void
 i915_ttm_place_from_region(const struct intel_memory_region *mr,
-			   struct ttm_place *place)
+			   struct ttm_place *place,
+			   unsigned int flags)
 {
 	memset(place, 0, sizeof(*place));
 	place->mem_type = intel_region_to_ttm_type(mr);
+
+	if (flags & I915_BO_ALLOC_CONTIGUOUS)
+		place->flags = TTM_PL_FLAG_CONTIGUOUS;
 }
 
 static void
@@ -100,15 +104,16 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 {
 	unsigned int i;
 	unsigned int num_allowed = obj->mm.n_placements;
+	unsigned int flags = obj->flags;
 
 	placement->num_placement = 1;
 	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
-				   obj->mm.region, requested);
+				   obj->mm.region, requested, flags);
 
 	/* Cache this on object? */
 	placement->num_busy_placement = num_allowed;
 	for (i = 0; i < placement->num_busy_placement; ++i)
-		i915_ttm_place_from_region(obj->mm.placements[i], busy + i);
+		i915_ttm_place_from_region(obj->mm.placements[i], busy + i, flags);
 
 	if (num_allowed == 0) {
 		*busy = *requested;
-- 
2.26.3

