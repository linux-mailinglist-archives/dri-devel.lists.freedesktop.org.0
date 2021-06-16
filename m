Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5E3A9F02
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 17:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BCD6E5D4;
	Wed, 16 Jun 2021 15:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E92A6E1BB;
 Wed, 16 Jun 2021 15:25:36 +0000 (UTC)
IronPort-SDR: NEyJ8pSn3OuNZZx4egWL1KnWaZAO8qDGAT7Uo2WK19n+B1SR+jqqaqV2VlhKeE3mReLN4EzeVq
 mP1UcgjvBXFw==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="206234421"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="206234421"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 08:25:32 -0700
IronPort-SDR: VABPwFX3GNBnf7upmdlu1FvPTL4FB+/W6eza8s6obVi3MpRVct0oSc2Cma6PVIDP6KqzGiMxse
 lH50UjaKnjug==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="479129904"
Received: from mrapopor-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.236.122])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 08:25:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 4/7] drm/i915/ttm: pass along the I915_BO_ALLOC_CONTIGUOUS
Date: Wed, 16 Jun 2021 16:24:58 +0100
Message-Id: <20210616152501.394518-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210616152501.394518-1-matthew.auld@intel.com>
References: <20210616152501.394518-1-matthew.auld@intel.com>
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
index d7595688e182..90d342e3df24 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -79,10 +79,14 @@ i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
 
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
@@ -92,16 +96,17 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 			    struct ttm_placement *placement)
 {
 	unsigned int num_allowed = obj->mm.n_placements;
+	unsigned int flags = obj->flags;
 	unsigned int i;
 
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

