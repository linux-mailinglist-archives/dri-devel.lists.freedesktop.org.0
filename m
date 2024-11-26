Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B789D9CCE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07B410E981;
	Tue, 26 Nov 2024 17:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xj1BmNaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2267899A3;
 Tue, 26 Nov 2024 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732643140; x=1764179140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MLZXPNlETtOT0+E6cZotW1alWljnuknRj9JpQmozITw=;
 b=Xj1BmNaV3bTegUr3tWZJ+1UCbetZtKHgfM7UhtVGawVwn49FX3+jpsqP
 fTO9CprCFYdKVe4HDmZC14nem/nH1hcAvcXKlqVACABiPBD6ypSF2LNm0
 JpO67Ti7NXwP5SfqzhrDPAgVo1CBvI6y7kurErT314AbDQB45dqzU/V6/
 YkxABcUdTc/q+XjiGLgXZCNlosRZfWbFSxf83JSuaL+AiFue7LFndswap
 eEe+WD3wtstEVcWVOh0ypwkk3rHSGmWZO43Q7Cv7bFGlbkNe4A9reMKGX
 R+uDD7C8lQzsQiqK8DVbdAz+GUcRlRYMvPD8EpHuyxwKvpQ2xES+F905e Q==;
X-CSE-ConnectionGUID: skPjp/nZQwmOLsyotpq66A==
X-CSE-MsgGUID: TY/4JE9NT5mdZ8wGp4aV+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32676911"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32676911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:40 -0800
X-CSE-ConnectionGUID: JVKPGL2+QUGOV9gtdcwB0w==
X-CSE-MsgGUID: 8D2OE8BOTVW2mJZdjgJqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92152576"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 2/8] drm/ttm: Add ttm_bo_access
Date: Tue, 26 Nov 2024 09:46:09 -0800
Message-Id: <20241126174615.2665852-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126174615.2665852-1-matthew.brost@intel.com>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
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
v5:
 - Fix checkpatch warnings (CI)
v6:
 - Fix kernel doc (Auld)
v7:
 - Move ttm_bo_access to ttm_bo_vm.c (Christian)

Cc: Christian König <christian.koenig@amd.com>
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 40 ++++++++++++++++++++++++++-------
 include/drm/ttm/ttm_bo.h        |  2 ++
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 2c699ed1963a..f02d3966cc84 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -405,13 +405,25 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
 	return len;
 }
 
-int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
-		     void *buf, int len, int write)
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
+ * be easily mapped (non-contiguous, non-visible, etc...). Should not directly
+ * be exported to user space via a peak / poke interface.
+ *
+ * Returns:
+ * @len if successful, negative error code on failure.
+ */
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write)
 {
-	struct ttm_buffer_object *bo = vma->vm_private_data;
-	unsigned long offset = (addr) - vma->vm_start +
-		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
-		 << PAGE_SHIFT);
 	int ret;
 
 	if (len < 1 || (offset + len) > bo->base.size)
@@ -429,8 +441,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		break;
 	default:
 		if (bo->bdev->funcs->access_memory)
-			ret = bo->bdev->funcs->access_memory(
-				bo, offset, buf, len, write);
+			ret = bo->bdev->funcs->access_memory
+				(bo, offset, buf, len, write);
 		else
 			ret = -EIO;
 	}
@@ -439,6 +451,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 
 	return ret;
 }
+EXPORT_SYMBOL(ttm_bo_access);
+
+int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
+		     void *buf, int len, int write)
+{
+	struct ttm_buffer_object *bo = vma->vm_private_data;
+	unsigned long offset = (addr) - vma->vm_start +
+		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
+		 << PAGE_SHIFT);
+
+	return ttm_bo_access(bo, offset, buf, len, write);
+}
 EXPORT_SYMBOL(ttm_bo_vm_access);
 
 static const struct vm_operations_struct ttm_bo_vm_ops = {
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

