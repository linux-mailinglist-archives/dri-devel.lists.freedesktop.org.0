Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C832B9A91F0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F9B10E5B2;
	Mon, 21 Oct 2024 21:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgAhkswS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3B410E191;
 Mon, 21 Oct 2024 21:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729545493; x=1761081493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eSG5vY32/ZdefK/ah9eMHe8q26+p/YDG8IpBok17Zzc=;
 b=GgAhkswSRA2tKUMVHR2yC+HkBSUvQQflKenli6RDdX70XnxbXV2eFSKi
 cAyEd28qpC7OgY1Do0jVQTBziZQ1lRmWvAU2aHVTYRZigF9xG+X8LjEOE
 Iwv9lo2aCTW8pZ1R8dLiKgsSMfI6JyYydP0xYS+FEJMq54Ww1qlQ4GoUE
 fedSuR+anqmznmjlbQCy7lJjHRwX5mZR3tx2IawlAQ7zTZrMLurRSFHxj
 ObfBvGTajEXNRyGMF5yCHMjTNkbltNCY9Bogo5lgJ1ahxpRKIK1h/CHH/
 ybqbIvyKD/FUAB/J0Lf/w5zhZsXEopHVOm/a47Ym/TN40FmvqrvAKi1U2 Q==;
X-CSE-ConnectionGUID: /qsRLJUvQ9mNeUp1GYMWaQ==
X-CSE-MsgGUID: o9Vt3JgCSGq70L1YGAf4sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29257689"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="29257689"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:18:11 -0700
X-CSE-ConnectionGUID: 38RZgWlmTK+MGInACneSqQ==
X-CSE-MsgGUID: 6rX2DUHbQb2/cO9/tmEUgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="80469606"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:18:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 9/9] drm/xe: Only allow contiguous BOs to use xe_bo_vmap
Date: Mon, 21 Oct 2024 14:18:35 -0700
Message-Id: <20241021211835.1675640-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021211835.1675640-1-matthew.brost@intel.com>
References: <20241021211835.1675640-1-matthew.brost@intel.com>
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e1f54aad5bc..59766369a15b 100644
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
@@ -2033,13 +2036,15 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 
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

