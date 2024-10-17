Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0948F9A3173
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 01:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7F610E22C;
	Thu, 17 Oct 2024 23:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxtsEyTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AFE10E22C;
 Thu, 17 Oct 2024 23:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729208358; x=1760744358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nI1xJstVn6mHGJrtFBHLu+45QwEe6SFxryKzeFGXD/Y=;
 b=NxtsEyTULRRfgap9GfCNC91g64a6vZ2WA7XpmRJjGKUxpeYEItUm16wA
 oscJtg9FVnzISX+rj4+2h1Pr5tqTjfOUmE9jw/1SodOm1FypNUyy9h2Eg
 PZVA4PgzesuLtwDT1bpYij1nka2mtKgMq9DLrDRdlawddXuXLn7K8UxZ2
 WzzKe49oPvglAspfWp2bem/Wdo9J3UVlVecuNx4NHvGVxAjqUx9BpXE36
 7brI56IdT5vwcidEvcnCd4Najq3Tuv6sWhTzPQHOfj7T+Le13L3sbv7ql
 1Bjx4qY8sl6Uu/ZgY+q6Q1VnB+OWScfzjrtrZZ0xdz6qoZSrhrl1dCJEy A==;
X-CSE-ConnectionGUID: FYhGtaAPRlWagM5RVPbHbQ==
X-CSE-MsgGUID: OW7dLXrtR8WkxcgnkAzjDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32518609"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="32518609"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 16:39:17 -0700
X-CSE-ConnectionGUID: v55J5uXHRIGuAczFFfWXwA==
X-CSE-MsgGUID: H0YpauztRNGPzk+kfhc8Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="83778407"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 16:39:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 1/1] drm/ttm, drm/xe: Add ttm_bo_access
Date: Thu, 17 Oct 2024 16:39:40 -0700
Message-Id: <20241017233941.1047522-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017233941.1047522-1-matthew.brost@intel.com>
References: <20241017233941.1047522-1-matthew.brost@intel.com>
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

Non-contiguous VRAM cannot be mapped in Xe nor can non-visible VRAM
easily be accessed. Add ttm_bo_access, which is similar to
ttm_bo_vm_access, to access such memory.

Visible VRAM access is only supported at the momement but a follow up
can add GPU access to non-visible VRAM.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 20 +++++++++-----
 drivers/gpu/drm/xe/xe_bo.c      | 48 +++++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo.h        |  2 ++
 3 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 2c699ed1963a..b53cc064da44 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -405,13 +405,9 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
 	return len;
 }
 
-int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
-		     void *buf, int len, int write)
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write)
 {
-	struct ttm_buffer_object *bo = vma->vm_private_data;
-	unsigned long offset = (addr) - vma->vm_start +
-		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
-		 << PAGE_SHIFT);
 	int ret;
 
 	if (len < 1 || (offset + len) > bo->base.size)
@@ -439,6 +435,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 
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
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..267f3b03a6d0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1111,6 +1111,53 @@ static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
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
+	void __iomem *virtual;
+	int bytes_left = len;
+
+	xe_bo_assert_held(bo);
+
+	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
+		return -EIO;
+
+	/* FIXME: Use GPU for non-visible VRAM */
+	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
+		return -EINVAL;
+
+	vram = res_to_mem_region(ttm_bo->resource);
+	xe_res_first(ttm_bo->resource, offset & ~PAGE_MASK, 0, &cursor);
+
+	do {
+		int wcount = PAGE_SIZE - (offset & PAGE_MASK) > bytes_left ?
+			bytes_left : PAGE_SIZE - (offset & PAGE_MASK);
+
+		virtual = (u8 __force *)vram->mapping + cursor.start;
+
+		iosys_map_set_vaddr_iomem(&vmap, (void __iomem *)virtual);
+		if (write)
+			xe_map_memcpy_to(xe, &vmap, offset & PAGE_MASK, buf,
+					 wcount);
+		else
+			xe_map_memcpy_from(xe, buf, &vmap, offset & PAGE_MASK,
+					   wcount);
+
+		offset += wcount;
+		buf += wcount;
+		bytes_left -= wcount;
+		xe_res_next(&cursor, PAGE_SIZE);
+	} while (bytes_left);
+
+	return len;
+}
+
 const struct ttm_device_funcs xe_ttm_funcs = {
 	.ttm_tt_create = xe_ttm_tt_create,
 	.ttm_tt_populate = xe_ttm_tt_populate,
@@ -1120,6 +1167,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.move = xe_bo_move,
 	.io_mem_reserve = xe_ttm_io_mem_reserve,
 	.io_mem_pfn = xe_ttm_io_mem_pfn,
+	.access_memory = xe_ttm_access_memory,
 	.release_notify = xe_ttm_bo_release_notify,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
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

