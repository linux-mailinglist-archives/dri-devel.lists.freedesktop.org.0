Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E13B2B374
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F3E10E4F5;
	Mon, 18 Aug 2025 21:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgpjKJBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9927210E4EF;
 Mon, 18 Aug 2025 21:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552682; x=1787088682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UtdCJ77c1Rr5btG6PCMzfVJO9UODCSj9AKPo1r8KLS8=;
 b=RgpjKJBckkAlHiiNACmpEoNDiqAd7p7Si0i71kC5scRpPtcEtykjfbAK
 oIbZNUj4MY2x+mn2y9O7n0ogOuq/V+WyFrjhq9V1TndsHBgAocV0uVzLt
 Vmoq5emTgSGN6RkHj8qJWYrrSWh6vMZbXXRe2tIsHumdirRb2hbQZrdO5
 XQFXX8lS3B3tgd/6LSZS3FFbxGy+8xGP+4QF4JMw+zIHIe1JgjzMlNxbb
 HJzhqIetaftrbt75vcH5UDZVv1gM3/FmLVMHo3TffVClJa5pzLDYxliBr
 QYfeh4dI6L6+WVG0EI9/yPqSXhvoIKmaQG5MGoRr9WvsV/RZ5rpp5lAs7 w==;
X-CSE-ConnectionGUID: xgATmKxqSQydcvLUNjcsSA==
X-CSE-MsgGUID: AP+TpKNsR1S/BrzDEzghUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815273"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815273"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:31:19 -0700
X-CSE-ConnectionGUID: lAx6cXvYS6mrejfjQeFdJQ==
X-CSE-MsgGUID: 8anHPGetR2qsvmR+s8TdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186361"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:31:17 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 21/24] drm/xe/vm: Add helper to check for default VMA
 memory attributes
Date: Tue, 19 Aug 2025 03:27:50 +0530
Message-Id: <20250818215753.2762426-22-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
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

Introduce a new helper function `xe_vma_has_default_mem_attrs()` to
determine whether a VMA's memory attributes are set to their default
values. This includes checks for atomic access, PAT index, and preferred
location.

Also, add a new field `default_pat_index` to `struct xe_vma_mem_attr`
to track the initial PAT index set during the first bind. This helps
distinguish between default and user-modified pat index, such as those
changed via madvise.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  6 ++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index aebd02964c1c..123b88d85c13 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2636,6 +2636,29 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
+/**
+ * xe_vma_has_default_mem_attrs - Check if a VMA has default memory attributes
+ * @vma: Pointer to the xe_vma structure to check
+ *
+ * This function determines whether the given VMA (Virtual Memory Area)
+ * has its memory attributes set to their default values. Specifically,
+ * it checks the following conditions:
+ *
+ * - `atomic_access` is `DRM_XE_VMA_ATOMIC_UNDEFINED`
+ * - `pat_index` is equal to `default_pat_index`
+ * - `preferred_loc.devmem_fd` is `DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE`
+ * - `preferred_loc.migration_policy` is `DRM_XE_MIGRATE_ALL_PAGES`
+ *
+ * Return: true if all attributes are at their default values, false otherwise.
+ */
+bool xe_vma_has_default_mem_attrs(struct xe_vma *vma)
+{
+	return (vma->attr.atomic_access == DRM_XE_ATOMIC_UNDEFINED &&
+		vma->attr.pat_index ==  vma->attr.default_pat_index &&
+		vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE &&
+		vma->attr.preferred_loc.migration_policy == DRM_XE_MIGRATE_ALL_PAGES);
+}
+
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				   struct xe_vma_ops *vops)
 {
@@ -2668,6 +2691,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
 				},
 				.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+				.default_pat_index = op->map.pat_index,
 				.pat_index = op->map.pat_index,
 			};
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index fe8648222ab7..83a61fcef3b4 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -66,6 +66,8 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
 struct xe_vma *
 xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
 
+bool xe_vma_has_default_mem_attrs(struct xe_vma *vma);
+
 /**
  * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
  * @vm: The vm
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 35b6344158f5..b5108d010786 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -103,8 +103,14 @@ struct xe_vma_mem_attr {
 	 */
 	u32 atomic_access;
 
+	/**
+	 * @default_pat_index: The pat index for VMA set during first bind by user.
+	 */
+	u16 default_pat_index;
+
 	/**
 	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
+	 * same as default_pat_index unless overwritten by madvise.
 	 */
 	u16 pat_index;
 };
-- 
2.34.1

