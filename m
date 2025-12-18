Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB33CCCBB9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747BE10EA51;
	Thu, 18 Dec 2025 16:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoFpJb89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB0A10EA56;
 Thu, 18 Dec 2025 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766074958; x=1797610958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nv7fF8vEqZYu1+XgwUxZpwgS1q8R7ctOIuotFqchpRE=;
 b=JoFpJb89BZu1eZu3zhhfEDhcyOPRCLv4x1RDwNXsCEeaYDCkdSiBYquW
 gS0Hj6BZgWmKspVsJd3kFZoQJ0x6rf8zE7Xn32jbcDBT7+HBUKMAIKE5E
 z2Yin028Dgce1I+N7qpBiUUh5PSEh25gtXIqMXmvqq7bktz7ebjtPUDaT
 Tmwy1PmXUlVc5X072p5B45XwH4MlrT/aWkGbFbd5mIISAEPBpt0ZJa3jj
 buNWgdlByAjT8KTTwa1PjZc9lYPl65bTWDuWqTr4wTps1EmGw34gjEYKb
 bT2UvDoxtifSSPsTbhrsfAQZ8vzNX1xzBDlu/TsXCl67moOm6AU83Bun5 A==;
X-CSE-ConnectionGUID: wMnlDIKMQ36QgIQDluFskA==
X-CSE-MsgGUID: qK11HyCmTVuWQsw5DXs0Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70607695"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="70607695"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:22:37 -0800
X-CSE-ConnectionGUID: BOmFtrGXS5+1c33Gq+7y9A==
X-CSE-MsgGUID: NuvAR78nShi9t4jdZNLYaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203705768"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.93])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:22:34 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v5 17/24] drm/xe/vm: Add a couple of VM debug printouts
Date: Thu, 18 Dec 2025 17:20:54 +0100
Message-ID: <20251218162101.605379-18-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
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

Add debug printouts that are valueable for pagemap prefetch,
migration and page collection.

v2:
- Add additional debug prinouts around migration and page collection.
- Require CONFIG_DRM_XE_DEBUG_VM.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
---
 drivers/gpu/drm/xe/xe_svm.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_vm.c  |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c46ced7a9d64..654c72e7e61c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1293,6 +1293,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err) {
 		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
 		goto out;
+	} else if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
+		drm_dbg(&vm->xe->drm, "After page collect data location is %sin \"%s\".\n",
+			xe_svm_range_has_pagemap(range, dpagemap) ? "" : "NOT ",
+			dpagemap ? dpagemap->drm->unique : "System.");
 	}
 
 	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
@@ -1588,9 +1592,15 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
 		      struct drm_pagemap *dpagemap)
 {
+	struct xe_device *xe = range_to_vm(&range->base)->xe;
+
 	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
+		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
+			dpagemap->drm->unique);
+
 	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 				       xe_svm_range_end(range),
 				       range->base.gpusvm->mm,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 808b44fb0569..a07d8b53de66 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2931,6 +2931,13 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 		if (!dpagemap)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
+		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
+			drm_dbg(&vm->xe->drm,
+				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
+				dpagemap ? dpagemap->drm->unique : "system",
+				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
+		}
+
 		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
 			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
 			if (err) {
-- 
2.51.1

