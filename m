Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6FF9A5072
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 21:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC4710E3B0;
	Sat, 19 Oct 2024 19:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MI/DWn7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEEB10E3AA;
 Sat, 19 Oct 2024 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729365606; x=1760901606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LKihkz9CqYFI8n3HKEXZ5Df5dsNqpssKiNVE+2hzODI=;
 b=MI/DWn7yOmzrxD1g0OqM0g1ehPMnoXkpdsxWuIpcco+5/2fnLY+O+7Gr
 4P+FhnZtURoR9PkzoUp+rVgiU2+riE8zZrzrIfYywJqfSbBM9wXSXnhw5
 2jOjwr/cR1rzgDsFHyQvdUmGzLUd53bUXkQvRKWsMAmBGd2iiFEnArDxN
 bzV1mGxhABjr3KyUA6pcg9RyLfmEnNBVaNVZ4T8go5JdqA4UkFEs6nLtI
 JhgEbnzoEhrD2bP7kpw3w628mar8VgTDBKGy6h2dOa9c6Xg5BG9Uduu+2
 9VdDTyoh0RlXqknDqfaFYM1QuLIlaXo8I9Bhs/ZfPB86GOl9jL0iONJqJ g==;
X-CSE-ConnectionGUID: MJjq3yr3Rd+t7Rko1q0CuQ==
X-CSE-MsgGUID: WOPMhPvdQR+1qk4Ns+f65g==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28978589"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="28978589"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:05 -0700
X-CSE-ConnectionGUID: PKB6ffHaS/2dls73HvxlXA==
X-CSE-MsgGUID: BMxxILcZQWOm1yiUkpkiTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="84212411"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 6/6] drm/xe: Only allow contiguous BOs to use xe_bo_vmap
Date: Sat, 19 Oct 2024 12:20:30 -0700
Message-Id: <20241019192030.1505020-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241019192030.1505020-1-matthew.brost@intel.com>
References: <20241019192030.1505020-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

xe_bo_vmap only works on contiguous BOs, disallow xe_bo_vmap on BO
unless we are certain the BO is contiguous.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0a7b91df69c2..46c640f8db9e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -162,6 +162,15 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 	}
 }
 
+static bool force_contiguous(u32 bo_flags)
+{
+	/*
+	 * For eviction / restore on suspend / resume objects pinned in VRAM
+	 * must be contiguous, also only contiguous BOs support xe_bo_vmap.
+	 */
+	return bo_flags & (XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
+}
+
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
@@ -175,12 +184,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 	xe_assert(xe, vram && vram->usable_size);
 	io_size = vram->io_size;
 
-	/*
-	 * For eviction / restore on suspend / resume objects
-	 * pinned in VRAM must be contiguous
-	 */
-	if (bo_flags & (XE_BO_FLAG_PINNED |
-			XE_BO_FLAG_GGTT))
+	if (force_contiguous(bo_flags))
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 
 	if (io_size < vram->usable_size) {
@@ -212,8 +216,7 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 
 		bo->placements[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_STOLEN,
-			.flags = bo_flags & (XE_BO_FLAG_PINNED |
-					     XE_BO_FLAG_GGTT) ?
+			.flags = force_contiguous(bo_flags) ?
 				TTM_PL_FLAG_CONTIGUOUS : 0,
 		};
 		*c += 1;
@@ -2024,13 +2027,15 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 
 int xe_bo_vmap(struct xe_bo *bo)
 {
+	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	void *virtual;
 	bool is_iomem;
 	int ret;
 
 	xe_bo_assert_held(bo);
 
-	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
+	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS) ||
+			!force_contiguous(bo->flags)))
 		return -EINVAL;
 
 	if (!iosys_map_is_null(&bo->vmap))
-- 
2.34.1

