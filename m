Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A733F9A90BF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 22:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0139210E592;
	Mon, 21 Oct 2024 20:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7di5Wp8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FF810E58F;
 Mon, 21 Oct 2024 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729541684; x=1761077684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3AU1zRIG9DZRiU/Zn6ZOVBUtqJM6HJATPXMDbkynCIc=;
 b=B7di5Wp8v6gtJvp9oDUXCjCr7PWeAR3wIRWn3pXu29J0Oe3KP/iA0kzo
 6jwUTdISZnE0z0ufB1qkdRRpjaC6IsP2HIKBYifXIo40aL3VoFOPGEl7F
 2X2DsV2Y7Wu1JZhYhvS8LVNhYLQZHMMIaeGnH3yFJOvrCAWevMiOAcJYf
 j9kIi6jdEUJFpsqBkqbnEju5Zfq74kDIbzuTF4FPMYbpfJ3SEEvQQ3bpQ
 xZHzWuA1ODx+Powc2Ih8nifpR7aJ7hxGyGixHbi1fct4p6ZFJFHE6qgR3
 NY4vTuYemk2ntEg6zLsS52+PBw3w4SwAxCtS1jU7Qfhv7xfuakyFhC43e A==;
X-CSE-ConnectionGUID: TRzDIhxGSD6YvdUSUnUCVQ==
X-CSE-MsgGUID: UsBeXssDTwCSRiDdSvDbaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40167479"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40167479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:14:44 -0700
X-CSE-ConnectionGUID: aj6exD3cSuOtZdG1wU8GSA==
X-CSE-MsgGUID: DRbzlwBFQHa0+17d+NWU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="110472041"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:14:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v4 2/9] drm/ttm: Add ttm_bo_access
Date: Mon, 21 Oct 2024 13:15:02 -0700
Message-Id: <20241021201509.1668074-3-matthew.brost@intel.com>
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
VRAM easily be accessed. Add ttm_bo_access, which is similar to
ttm_bo_vm_access, to access such memory.

v4:
 - Fix checkpatch warnings (CI)

Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
 include/drm/ttm/ttm_bo.h          |  2 +
 3 files changed, 89 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d939925efa81..290bf1ee0202 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 	return progress;
 }
+
+static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
+			      unsigned long offset,
+			      void *buf, int len, int write)
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
+		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
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
+			ret = bo->bdev->funcs->access_memory (bo, offset, buf,
+							      len, write);
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

