Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB0739E695
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 20:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB4E6E9B9;
	Mon,  7 Jun 2021 18:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125236E9BA;
 Mon,  7 Jun 2021 18:24:07 +0000 (UTC)
IronPort-SDR: +MlhNWzIcapWKya2sQelK7twgDKwsV4vtNdiOUg+9OEONrQXlN9QWXuLYxGKN1nXt1Zza0ZAW9
 VfkH6Q6vLYcg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185051960"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="185051960"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 11:24:06 -0700
IronPort-SDR: ZSmdPkteSJUr8Hpz/PJ7KlmsHoBJNBe8GRN2jHQPwnqlRj04KWYiP59pj3dHXm5oBH3Zbu232J
 zJ9jiIhs1W/Q==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="476295055"
Received: from iwilsonx-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 11:24:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915/ttm: pass along the I915_BO_ALLOC_CONTIGUOUS
Date: Mon,  7 Jun 2021 19:22:08 +0100
Message-Id: <20210607182210.99036-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210607182210.99036-1-matthew.auld@intel.com>
References: <20210607182210.99036-1-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 73d52df8f2be..0b0fce445e9b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -86,10 +86,18 @@ i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
 
 static void
 i915_ttm_place_from_region(const struct intel_memory_region *mr,
-			   struct ttm_place *place)
+			   struct ttm_place *place,
+			   unsigned int flags)
 {
 	memset(place, 0, sizeof(*place));
 	place->mem_type = intel_region_to_ttm_type(mr);
+
+	switch(mr->type) {
+	case INTEL_MEMORY_LOCAL:
+		if (flags & I915_BO_ALLOC_CONTIGUOUS)
+			place->flags = TTM_PL_FLAG_CONTIGUOUS;
+		break;
+	}
 }
 
 static void
@@ -100,15 +108,16 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
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

