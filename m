Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DBD9A5076
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 21:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C37A10E3B4;
	Sat, 19 Oct 2024 19:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJIejuHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374A910E3AA;
 Sat, 19 Oct 2024 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729365605; x=1760901605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T+3+mUn65i0LFR+EqTxgGf6IBD8UueUBauc02U88mmo=;
 b=PJIejuHUL0kj3d2Qmmx0G7HXkXIAfUy6gJT6SKw0hje4fQ2xQmuLuKpe
 lKxf4i5nUxvZnoUB6VJ2pzHsbhiDpoapP5uvEBr9H91xpA3wkWNiaZ2pN
 ooraWdZC/NiPOFTP+4uj2g3GDjZWzNSaFkiWH/jVX36dbliJzI7oZt/Lf
 qbCLZbUZLv/GN5HA9gb3EzQEySISObKYGoENHx8jP1f/dEXZtWXPmHpqo
 XA/qAcCdYBrSEShXGoLLMBLEEJMpEYxXHnI/07jBmctZLrWR1SEPNIIwq
 qEvnXQJdeo/JdVG1i2iLrREkb2ClnX7fhWkZ5BOs4BBqpjg+TECezFpDP Q==;
X-CSE-ConnectionGUID: Y4nUAeCOTwmQpcDfxKBm2w==
X-CSE-MsgGUID: YLh5rc8YQ/2+9FtPsF9KMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28978584"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="28978584"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:05 -0700
X-CSE-ConnectionGUID: Uw9zXQwJRrCbITFLq/lkCg==
X-CSE-MsgGUID: XM5x6YgQQXGmvdzD5tPLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="84212396"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 1/6] drm/ttm: Add ttm_bo_access
Date: Sat, 19 Oct 2024 12:20:25 -0700
Message-Id: <20241019192030.1505020-2-matthew.brost@intel.com>
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
VRAM easily be accessed. Add ttm_bo_access, which is similar to
ttm_bo_vm_access, to access such memory.

Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
 include/drm/ttm/ttm_bo.h          |  2 +
 3 files changed, 89 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d939925efa81..084d2e9b9123 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 	return progress;
 }
+
+static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
+			      unsigned long offset,
+			      uint8_t *buf, int len, int write)
+{
+	unsigned long page = offset >> PAGE_SHIFT;
+	unsigned long bytes_left = len;
+	int ret;
+
+	/* Copy a page at a time, that way no extra virtual address
+	 * mapping is needed
+	 */
+	offset -= page << PAGE_SHIFT;
+	do {
+		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
+		struct ttm_bo_kmap_obj map;
+		void *ptr;
+		bool is_iomem;
+
+		ret = ttm_bo_kmap(bo, page, 1, &map);
+		if (ret)
+			return ret;
+
+		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
+		WARN_ON_ONCE(is_iomem);
+		if (write)
+			memcpy(ptr, buf, bytes);
+		else
+			memcpy(buf, ptr, bytes);
+		ttm_bo_kunmap(&map);
+
+		page++;
+		buf += bytes;
+		bytes_left -= bytes;
+		offset = 0;
+	} while (bytes_left);
+
+	return len;
+}
+
+/**
+ * ttm_bo_access - Helper to access a buffer object
+ *
+ * @bo: ttm buffer object
+ * @offset: access offset into buffer object
+ * @buf: pointer to caller memory to read into or write from
+ * @len: length of access
+ * @write: write access
+ *
+ * Utility function to access a buffer object. Useful when buffer object cannot
+ * be easily mapped (non-contiguous, non-visible, etc...).
+ *
+ * Returns:
+ * 0 if successful, negative error code on failure.
+ */
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write)
+{
+	int ret;
+
+	if (len < 1 || (offset + len) > bo->base.size)
+		return -EIO;
+
+	ret = ttm_bo_reserve(bo, true, false, NULL);
+	if (ret)
+		return ret;
+
+	switch (bo->resource->mem_type) {
+	case TTM_PL_SYSTEM:
+		fallthrough;
+	case TTM_PL_TT:
+		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
+		break;
+	default:
+		if (bo->bdev->funcs->access_memory)
+			ret = bo->bdev->funcs->access_memory(
+				bo, offset, buf, len, write);
+		else
+			ret = -EIO;
+	}
+
+	ttm_bo_unreserve(bo);
+
+	return ret;
+}
+EXPORT_SYMBOL(ttm_bo_access);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 2c699ed1963a..20b1e5f78684 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(ttm_bo_vm_close);
 
-static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
-				 unsigned long offset,
-				 uint8_t *buf, int len, int write)
-{
-	unsigned long page = offset >> PAGE_SHIFT;
-	unsigned long bytes_left = len;
-	int ret;
-
-	/* Copy a page at a time, that way no extra virtual address
-	 * mapping is needed
-	 */
-	offset -= page << PAGE_SHIFT;
-	do {
-		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
-		struct ttm_bo_kmap_obj map;
-		void *ptr;
-		bool is_iomem;
-
-		ret = ttm_bo_kmap(bo, page, 1, &map);
-		if (ret)
-			return ret;
-
-		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
-		WARN_ON_ONCE(is_iomem);
-		if (write)
-			memcpy(ptr, buf, bytes);
-		else
-			memcpy(buf, ptr, bytes);
-		ttm_bo_kunmap(&map);
-
-		page++;
-		buf += bytes;
-		bytes_left -= bytes;
-		offset = 0;
-	} while (bytes_left);
-
-	return len;
-}
-
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write)
 {
@@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	unsigned long offset = (addr) - vma->vm_start +
 		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
 		 << PAGE_SHIFT);
-	int ret;
-
-	if (len < 1 || (offset + len) > bo->base.size)
-		return -EIO;
 
-	ret = ttm_bo_reserve(bo, true, false, NULL);
-	if (ret)
-		return ret;
-
-	switch (bo->resource->mem_type) {
-	case TTM_PL_SYSTEM:
-		fallthrough;
-	case TTM_PL_TT:
-		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
-		break;
-	default:
-		if (bo->bdev->funcs->access_memory)
-			ret = bo->bdev->funcs->access_memory(
-				bo, offset, buf, len, write);
-		else
-			ret = -EIO;
-	}
-
-	ttm_bo_unreserve(bo);
-
-	return ret;
+	return ttm_bo_access(bo, offset, buf, len, write);
 }
 EXPORT_SYMBOL(ttm_bo_vm_access);
 
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 5804408815be..8ea11cd8df39 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
 int ttm_bo_evict_first(struct ttm_device *bdev,
 		       struct ttm_resource_manager *man,
 		       struct ttm_operation_ctx *ctx);
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write);
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			     struct vm_fault *vmf);
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
-- 
2.34.1

