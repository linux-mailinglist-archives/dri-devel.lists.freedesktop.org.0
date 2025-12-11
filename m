Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5FCB69AE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C6910E89A;
	Thu, 11 Dec 2025 17:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwGEHZHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A26010E890;
 Thu, 11 Dec 2025 17:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765472450; x=1797008450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZLHkSf8pZUY1W/z1QuY6EQAkbgWR58WwjGN1oHAYR6c=;
 b=TwGEHZHZmbpUZDIf0TNp1bDUR3ANIWxXbGcfMHJ83ZvjWYhnaEL8Z+ra
 cv5uKxdwhZd4D2kODh1pACb6IOkyp3aVE4dqXqjMhhNSlfMtFMU+E8uZd
 AvQZgWDkU/2pK0O+eKYm5d4PKLn4V/a4ocgG7vfeZdf7Jnq6+pG41+38Q
 8SfRD67DXsH8RkPoUnUCdDl0xcjbqpwYqygX9dXwlLn+ohJBBuOzawfxN
 UAHbcLPXM8ALMfswnV7T3gJ0Tdm7zVl3l4+6Q5sRORNrbmg2yvBd/Hmov
 ngR3uttuNBQ+pequUvyZm5LjDtQ6hAfsV3fep4wgeNnNrDrdhWAqJgyw8 w==;
X-CSE-ConnectionGUID: 0r5px+WbRaeWbFd2z4ld5A==
X-CSE-MsgGUID: O92Tqaj3SmmbnCkMHLBvEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71083425"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71083425"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:50 -0800
X-CSE-ConnectionGUID: P/4U/zMGSQS84/OMk5Wiqg==
X-CSE-MsgGUID: 0U0oN+7kSrOLKLwbJhJyOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196849823"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:47 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v4 20/22] drm/xe: Use drm_gpusvm_scan_mm()
Date: Thu, 11 Dec 2025 17:59:07 +0100
Message-ID: <20251211165909.219710-21-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
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
---
 drivers/gpu/drm/xe/xe_svm.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 2fa73143fcd5..22281d69e26a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1625,11 +1625,23 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
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

