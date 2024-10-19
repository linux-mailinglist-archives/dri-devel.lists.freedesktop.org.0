Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5F9A5077
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 21:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97EB10E3B8;
	Sat, 19 Oct 2024 19:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rk4fmGm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF7310E3AD;
 Sat, 19 Oct 2024 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729365605; x=1760901605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A+Hjs8IdGMGIVSvHMXH+Km4QNx9MIv6KAIxXzDhxuKI=;
 b=Rk4fmGm6AcC8JlZqJaGq1AU2PRudmWyUWxqLbHd3rj35HAIYDtJTP9c7
 Ln81Oq8uNZpndABLydu/dCCcJUkmp/EPv+VvbIZEKfEpD3p6iCgZsY1gi
 OA5lfQUqkKP2he8vlwza1/YAoyj2FJt3zI/Vo0+c7AMhYnT3QLb76lPCG
 5qJ6b8rvfzIch1rqIozmnaDCptx6O9XK1XLISyKcLUq0B2gUFUIPvbUv0
 tvbWlqqb0+bYSiYr7lelIvUg+JKsuc8LYDpQzjfm/TFud5gzZss49hgvT
 C9RyXEM1r+/cYgzNKNbE/i2ezhNqA7e8Oj17PN33K2KDRn4xa779UUJhn g==;
X-CSE-ConnectionGUID: BRYJ6YIvTRmiOlmj9cIEjQ==
X-CSE-MsgGUID: o7T4Yu/DQVaJLZ/AVSWu7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28978585"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="28978585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:05 -0700
X-CSE-ConnectionGUID: 5TV14+4nTOGyaXsN+efGwA==
X-CSE-MsgGUID: zCVCXmAtSUGzF8SoDFzQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="84212399"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 2/6] drm/xe: Add xe_ttm_access_memory
Date: Sat, 19 Oct 2024 12:20:26 -0700
Message-Id: <20241019192030.1505020-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241019192030.1505020-1-matthew.brost@intel.com>
References: <20241019192030.1505020-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_bo.c | 62 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..99557af16120 100644
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
@@ -1111,6 +1117,55 @@ static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
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
+	if (!xe_pm_runtime_get_if_in_use(xe))
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
+	xe_pm_runtime_put(xe);
+
+	return len;
+}
+
 const struct ttm_device_funcs xe_ttm_funcs = {
 	.ttm_tt_create = xe_ttm_tt_create,
 	.ttm_tt_populate = xe_ttm_tt_populate,
@@ -1120,6 +1175,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.move = xe_bo_move,
 	.io_mem_reserve = xe_ttm_io_mem_reserve,
 	.io_mem_pfn = xe_ttm_io_mem_pfn,
+	.access_memory = xe_ttm_access_memory,
 	.release_notify = xe_ttm_bo_release_notify,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
-- 
2.34.1

