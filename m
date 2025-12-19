Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6ACCCF9B3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8489610EF47;
	Fri, 19 Dec 2025 11:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hig1i1w+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EA710EF35;
 Fri, 19 Dec 2025 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144120; x=1797680120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BrX8gJpzEirXvnNpYBwfHzo04L4RMTFSsRI/4Z2fCCE=;
 b=Hig1i1w+wDZsxXSCiVk/iwvHrZUl54EpZkbpgjzHLlLPicJZTIVoFxtY
 Tx115MrB52+DXNZ6h6U/ATsQGfJB42qDKvFrVwto1VZlhI5YQ0z1Jy2VM
 /23/XsrCcRA3pDddSRf+aQoQZ2fpC9e0CAzxbzpcPVrx8dWWpNC/I1j9N
 EGDO49Tcye9j8PjOrQRCcUlQxGaEvqDxNphc6UxrwZa1ynwnGJs3jJ0XL
 bqn5u2/GCyLkZnZgW52/4c1vOmWFAxLtEDCMF2maINOQUErw4Y1tw5y+m
 wT5gI3+FM+QavQmHxHtto77+LYWQO7hM31FveevLNATQtZx0Z1KobOJQb g==;
X-CSE-ConnectionGUID: 9YK3HmUERamFVetbWuoZ9A==
X-CSE-MsgGUID: Ek4rcgzFQx69GVNYt0+VCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224619"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224619"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:20 -0800
X-CSE-ConnectionGUID: zCT7rFYPSLayzQ2ZRC7HTg==
X-CSE-MsgGUID: onFhz1IfTECI/vshUkVwLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005821"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:17 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 21/24] drm/xe: Use drm_gpusvm_scan_mm()
Date: Fri, 19 Dec 2025 12:33:17 +0100
Message-ID: <20251219113320.183860-22-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
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

Use drm_gpusvm_scan_mm() to avoid unnecessarily calling into
drm_pagemap_populate_mm();

v3:
- New patch.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 3ec32f9805e3..ed4afb386ba2 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1590,11 +1590,23 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
 		      struct drm_pagemap *dpagemap)
 {
-	struct xe_device *xe = range_to_vm(&range->base)->xe;
+	struct xe_vm *vm = range_to_vm(&range->base);
+	enum drm_gpusvm_scan_result migration_state;
+	struct xe_device *xe = vm->xe;
 
 	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
+	migration_state = drm_gpusvm_scan_mm(&range->base,
+					     xe_svm_private_page_owner(vm, false),
+					     dpagemap->pagemap);
+
+	if (migration_state == DRM_GPUSVM_SCAN_EQUAL) {
+		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
+			drm_dbg(dpagemap->drm, "Already migrated!\n");
+		return 0;
+	}
+
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
 		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
 			dpagemap->drm->unique);
-- 
2.51.1

