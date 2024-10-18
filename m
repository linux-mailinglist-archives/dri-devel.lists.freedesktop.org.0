Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753419A48CD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE7B10E9A7;
	Fri, 18 Oct 2024 21:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCrdM+QP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F069310E240;
 Fri, 18 Oct 2024 21:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729286159; x=1760822159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CSdOD2U5eijtsUahA+Onxv41UTOlcf16XCKGkQeIqoY=;
 b=FCrdM+QPKKtEYqQZD97D1maEAVBhBYPhW6ocHCvANluIMWPvEpx/BcUx
 m7RA7ZYibFW2nslgtS3l4+AQNTn4Nazz1+mX1IUiQGVzrgo4hiGA33ELV
 U+e/gCQltOJs8ZWn185GlTHKiCkX8WT+BJ0erZdLV+fbaOSm6nvbCVnMi
 9WYly8FVtVHNJjIgwuhTFDw1wsjIoCtcN8hBtLAxKY0BmMekLWmsYKQ9e
 YJ4qUvKNkoMN+l2E0CRnWaIUQilfLWFHLuDfWK0vENCYTaxBl4bWLnefa
 RsYd7cK2OrqV1EfdrispR0l5A0BVLhuc0nqS0rZZS8jkvMpA0gk55mGaA g==;
X-CSE-ConnectionGUID: +zwMRkaRSFC3WUBACqkGvg==
X-CSE-MsgGUID: kSVDTqelQCSBXLIB7BOGHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46329578"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="46329578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:15:58 -0700
X-CSE-ConnectionGUID: P93YMoSVQQGXwektWN2gNw==
X-CSE-MsgGUID: QGolJHdaQRKnw89ZcipO3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="84040233"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:15:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v2 2/3] drm/xe: Add xe_ttm_access_memory
Date: Fri, 18 Oct 2024 14:16:22 -0700
Message-Id: <20241018211623.1367891-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018211623.1367891-1-matthew.brost@intel.com>
References: <20241018211623.1367891-1-matthew.brost@intel.com>
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

Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 57 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..9a5c1ed7ae97 100644
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
@@ -1111,6 +1117,50 @@ static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
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
+
+	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
+		return -EIO;
+
+	/* FIXME: Use GPU for non-visible VRAM */
+	if (!xe_ttm_resource_visible(ttm_bo->resource))
+		return -EIO;
+
+	vram = res_to_mem_region(ttm_bo->resource);
+	xe_res_first(ttm_bo->resource, offset & PAGE_MASK, bo->size, &cursor);
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
@@ -1120,6 +1170,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.move = xe_bo_move,
 	.io_mem_reserve = xe_ttm_io_mem_reserve,
 	.io_mem_pfn = xe_ttm_io_mem_pfn,
+	.access_memory = xe_ttm_access_memory,
 	.release_notify = xe_ttm_bo_release_notify,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
-- 
2.34.1

