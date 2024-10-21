Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9349A90C0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 22:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BE710E595;
	Mon, 21 Oct 2024 20:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjH94JHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6684810E037;
 Mon, 21 Oct 2024 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729541684; x=1761077684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a5HCOwVKHgAmUvo9H7JPdG4YV6V4zmZgKNtprKhXjJ4=;
 b=WjH94JHRdTXKwLYxPS1IP0K56YFCZ/xC+bKwN/xjvV8Z/LG0ODg6oiyA
 kDGhgWUCcxBuAYjpjNfD+FafAZDIWVzWYPoHqK+M6nxDARbs4bMYORWP4
 mkndnweMSxV/llxtKWb7rhEYphi1ZBfLipG1TQrLfBQFtgNRrILP0QlkM
 9gQkp2DYqJ9XOxbFWmIkDcqDsLB4wFHj4rZL1sq7QyjPhVbeVYJjlTFfd
 +bzMCnTaJye8uAvUTCfbdkibuhmxzoJ2Jl6XpyzSlsmrx6jw5oPg2pvSi
 ++2yp37PDiBJQ//trHHpD/H388bmXYHQ0h1bYKbu/tVsmU1O69bujuxzH g==;
X-CSE-ConnectionGUID: cfmXxZoCSsKBdiwvkEj+JQ==
X-CSE-MsgGUID: FXz1sWWnRsCXUZTbvK4FFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40167480"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40167480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:14:44 -0700
X-CSE-ConnectionGUID: ZVFlUh43S0u2Bt51fBhPlg==
X-CSE-MsgGUID: wrUV9By7QiO+TMI/esfCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="110472044"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:14:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v4 3/9] drm/xe: Add xe_ttm_access_memory
Date: Mon, 21 Oct 2024 13:15:03 -0700
Message-Id: <20241021201509.1668074-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021201509.1668074-1-matthew.brost@intel.com>
References: <20241021201509.1668074-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
VRAM easily be accessed. Add xe_ttm_access_memory which hooks into
ttm_bo_access to access such memory.

v4:
 - Assert memory access rather than taking RPM ref (Thomas / Auld)
 - Fix warning on xe_res_cursor.h for non-zero offset (Mika)

Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 59 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0261a8b29351..04bc042f3bc7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -442,6 +442,14 @@ static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 	kfree(tt);
 }
 
+static bool xe_ttm_resource_visible(struct ttm_resource *mem)
+{
+	struct xe_ttm_vram_mgr_resource *vres =
+		to_xe_ttm_vram_mgr_resource(mem);
+
+	return vres->used_visible_size == mem->size;
+}
+
 static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 				 struct ttm_resource *mem)
 {
@@ -453,11 +461,9 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
-		struct xe_ttm_vram_mgr_resource *vres =
-			to_xe_ttm_vram_mgr_resource(mem);
 		struct xe_mem_region *vram = res_to_mem_region(mem);
 
-		if (vres->used_visible_size < mem->size)
+		if (!xe_ttm_resource_visible(mem))
 			return -EINVAL;
 
 		mem->bus.offset = mem->start << PAGE_SHIFT;
@@ -1111,6 +1117,52 @@ static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
+static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
+				unsigned long offset, void *buf, int len,
+				int write)
+{
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct iosys_map vmap;
+	struct xe_res_cursor cursor;
+	struct xe_mem_region *vram;
+	int bytes_left = len;
+
+	xe_bo_assert_held(bo);
+	xe_device_assert_mem_access(xe);
+
+	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
+		return -EIO;
+
+	/* FIXME: Use GPU for non-visible VRAM */
+	if (!xe_ttm_resource_visible(ttm_bo->resource))
+		return -EIO;
+
+	vram = res_to_mem_region(ttm_bo->resource);
+	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
+		     bo->size - (offset & PAGE_MASK), &cursor);
+
+	do {
+		unsigned long page_offset = (offset & ~PAGE_MASK);
+		int byte_count = min((int)(PAGE_SIZE - page_offset), bytes_left);
+
+		iosys_map_set_vaddr_iomem(&vmap, (u8 __iomem *)vram->mapping +
+					  cursor.start);
+		if (write)
+			xe_map_memcpy_to(xe, &vmap, page_offset, buf, byte_count);
+		else
+			xe_map_memcpy_from(xe, buf, &vmap, page_offset, byte_count);
+
+		offset += byte_count;
+		buf += byte_count;
+		bytes_left -= byte_count;
+		if (bytes_left)
+			xe_res_next(&cursor, PAGE_SIZE);
+	} while (bytes_left);
+
+	return len;
+}
+
 const struct ttm_device_funcs xe_ttm_funcs = {
 	.ttm_tt_create = xe_ttm_tt_create,
 	.ttm_tt_populate = xe_ttm_tt_populate,
@@ -1120,6 +1172,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.move = xe_bo_move,
 	.io_mem_reserve = xe_ttm_io_mem_reserve,
 	.io_mem_pfn = xe_ttm_io_mem_pfn,
+	.access_memory = xe_ttm_access_memory,
 	.release_notify = xe_ttm_bo_release_notify,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
-- 
2.34.1

