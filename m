Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658A9D9CD5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6AD10E98F;
	Tue, 26 Nov 2024 17:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRj1B7vX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6ACA899A3;
 Tue, 26 Nov 2024 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732643141; x=1764179141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yWZ4eY4cHV2CVXZ7QbbDMBRNh/nOHnstfHdOzOpxfzw=;
 b=lRj1B7vX73PKglSgr44woTqJ63Or+86oC3Q6/EGJXrj0gAZoQ4IivRcK
 PMoThUF93ZSOnKrTIMXu0VuDnfZ1+F4EuRFDoHqMa7SsYFOP36PiyoUgB
 BFWHO4zAujNeGQCFx9AT9qqbkfIEJwhGjYu6xzUUy+4nahIIXEfYKNdHs
 UV503pfoUg1IAV+NDf1simsmCPIcc2QsbuGdo5Rvl0mOAjm50Cd30qf4R
 RCsnVdQOd2fTyUv6xoYWOXsp4292rXm8pCIVJNTY9Sf1UFuLkvUvLdNzQ
 WzEKZ51Oo4nm42NzvWHuuKsDEOeIlDM8Cwtl8hSfp2r23TVFA2Clbnhl/ A==;
X-CSE-ConnectionGUID: jjuFs+iQTPirSKXiAapfWA==
X-CSE-MsgGUID: ayi3YX7jQ+2qu3ixTB9vgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32676923"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32676923"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:41 -0800
X-CSE-ConnectionGUID: QRGvKLD1R/KzZLABy+6ChA==
X-CSE-MsgGUID: Gqa6rdqPTCK8mD4ekfvXhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92152589"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 8/8] drm/xe: Only allow contiguous BOs to use xe_bo_vmap
Date: Tue, 26 Nov 2024 09:46:15 -0800
Message-Id: <20241126174615.2665852-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126174615.2665852-1-matthew.brost@intel.com>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
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
index 9de28798ad1c..f51d86511cb9 100644
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
@@ -2051,13 +2054,15 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 
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

