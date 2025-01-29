Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA09A224C0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6960B10E8AF;
	Wed, 29 Jan 2025 19:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdoXKJ1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4F910E89E;
 Wed, 29 Jan 2025 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180286; x=1769716286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tcZI7Ff2F5Bp/SE4lPBhih9hPU4iQYl5RYPKO7ClWb4=;
 b=hdoXKJ1AShbe9Sx92j0aCFf1Njiyvli4XKeR8XAQpKEQWcmpUW75cd3s
 pkgIg/73wwXeKlGmbxjzUFKnJ4e+ah6OuOUeI+lN10iW26W701lsaCptA
 AQ8Wt7isfm6B0bkuV074umFEWHasmWZIRsqf+OfPPDP7vorN/SCAQmYoE
 gmn0k+NvtRtAMYePrrF0jpAjOuKSogUwWoxTqCXHAqDylZUOHiNulwx9W
 nzLABfwbpHbXAGKj0UZq9C4nlJUNBFMFOoE5f3/T95O+32GpYCZv40nqe
 b6uJcYdt8Pmz9NEorDjasMneeohoVu9L5B1LZtH1Tro5UgiciKY18eohX Q==;
X-CSE-ConnectionGUID: dJSt0yVLRjSUSuq8MdZLBg==
X-CSE-MsgGUID: +P6VAXb2S/iyyVaEtDKdqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132871"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132871"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:26 -0800
X-CSE-ConnectionGUID: OY+L9FRaR46es/DMX2DkPA==
X-CSE-MsgGUID: SZ5bVou/Rsu65YqcO0N/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392191"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 27/33] drm/xe: Add BO flags required for SVM
Date: Wed, 29 Jan 2025 11:52:06 -0800
Message-Id: <20250129195212.745731-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

Add XE_BO_FLAG_CPU_ADDR_MIRROR to indicate BO is tied to SVM range.
While these BO's are kernel allocations, we need a VM reference in this
case which this flag indicates. In addition, we do not support CCS on
these BO's either. The later can be revisited later.

v2:
 - Take VM ref for system allocator BOs
v3:
 - s/XE_BO_FLAG_SYSTEM_ALLOC/XE_BO_FLAG_CPU_ADDR_MIRROR (Thomas)
 - Better commit message (Thomas)
 - Drop XE_BO_FLAG_SKIP_CLEAR for now
 - Add comment about possibly supporting CCS (Thomas)
v4:
 - Fix alignment issue (Checkpatch)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++----
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e914a60b8afc..20c96709e267 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1239,7 +1239,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 		xe_drm_client_remove_bo(bo);
 #endif
 
-	if (bo->vm && xe_bo_is_user(bo))
+	if (bo->vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR))
 		xe_vm_put(bo->vm);
 
 	mutex_lock(&xe->mem_access.vram_userfault.lock);
@@ -1435,7 +1435,8 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	int err;
 
 	/* Only kernel objects should set GT */
-	xe_assert(xe, !tile || type == ttm_bo_type_kernel);
+	xe_assert(xe, !tile || type == ttm_bo_type_kernel ||
+		  flags & XE_BO_FLAG_CPU_ADDR_MIRROR);
 
 	if (XE_WARN_ON(!size)) {
 		xe_bo_free(bo);
@@ -1631,7 +1632,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 	 * by having all the vm's bo refereferences released at vm close
 	 * time.
 	 */
-	if (vm && xe_bo_is_user(bo))
+	if (vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR))
 		xe_vm_get(vm);
 	bo->vm = vm;
 
@@ -2503,8 +2504,11 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 	 * system memory (i.e., it allows XE_PL_TT placement), FlatCCS
 	 * can't be used since there's no CCS storage associated with
 	 * non-VRAM addresses.
+	 *
+	 * XXX: Can we support CCS with CPU address mirroring?
 	 */
-	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
+	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
+			    (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR)))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index ce55a2bb13f6..c01ed535a8c3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -47,6 +47,7 @@
 					 XE_BO_FLAG_GGTT1 | \
 					 XE_BO_FLAG_GGTT2 | \
 					 XE_BO_FLAG_GGTT3)
+#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(22)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1

