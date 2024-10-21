Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFE29A90C8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 22:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C0A10E5A0;
	Mon, 21 Oct 2024 20:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXb6zt4u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84EC10E58F;
 Mon, 21 Oct 2024 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729541685; x=1761077685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eSG5vY32/ZdefK/ah9eMHe8q26+p/YDG8IpBok17Zzc=;
 b=FXb6zt4umQrg3yY1KnzVDf0MWCRc/KfmUNESIJWBu+PjAtwYFpKI7eHz
 xyRtSNL6oZ+2VYP8wZOdQQmenXkGofP9jxPR0gWZfgsGM5kpvhWEf3BTv
 ON7Z3NQaw7uyPogN5NxxB2t4Li3M7NIDZ7k8+IeJQtFyM/9xBH/cHn5Xq
 8cQgJYQk+deplL3ptQgXuZHX+3aW08b4VWX7ZYLSCKTAT1rp+tJaraU0T
 Btcl5XxegSF+d9lb7HUd2RjtlO8nmqzZLE7b9TNoPkKTU8nAifXnnNhku
 JooykaGS7fBqpFUoBIaiLpAfGmW3moPO6Fv6aN6f8WSMU6kmk7K3r4aOu A==;
X-CSE-ConnectionGUID: YQTzoKbYTjKjWeM5n/D9Jw==
X-CSE-MsgGUID: RXGTKtZjSxW6Cq3LJQ1BLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40167486"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40167486"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:14:44 -0700
X-CSE-ConnectionGUID: QiGYrWmdQFevIOqUbcOoOA==
X-CSE-MsgGUID: zFact2ktQl2VA8pj/Zu5oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="110472062"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:14:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v4 9/9] drm/xe: Only allow contiguous BOs to use xe_bo_vmap
Date: Mon, 21 Oct 2024 13:15:09 -0700
Message-Id: <20241021201509.1668074-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021201509.1668074-1-matthew.brost@intel.com>
References: <20241021201509.1668074-1-matthew.brost@intel.com>
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

