Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAEACB2C8B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9848110E70A;
	Wed, 10 Dec 2025 11:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceDLIbi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C81110E707;
 Wed, 10 Dec 2025 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765364964; x=1796900964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tMSiVXFTLf6cq+vJXPeJr2t1/rvagbjlNpH3U/OGcRc=;
 b=ceDLIbi+vzqHurJM1H1xZpcMq0bO1TD2NbwgoQ7fpygCOb97YG32/n23
 uyKbLq6ppjO6Y3Ifr1TsFebOd2h0TYGYp+0qh0WBrEZ20dAu7px2oQ+xG
 oyDWiVtyzvMXVWNZDzCA/YJxBrvuAd1FnVKn84cGdhM4QGgiZ8qJh1AZF
 XD2EOpDw5T2X9KDtM99lTimYFKwAossEsvHTLHvCONPK+/MovDOYZweCN
 dbsDVJOt6w3u91Efs5r8nOtgH2PQtAyaPDgNwBqDDVOUsgxY9E9XesEb/
 YHTNsj3NAv1X8OyVxSgaBJ56Q7y+0MkFfcH6JO2WRHMG87YL9W6MnWEii w==;
X-CSE-ConnectionGUID: 3+28NzSUT2CXxmo351YBhA==
X-CSE-MsgGUID: s/+cuWDWRn6Vo7BQNQaFXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67221903"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67221903"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:09:24 -0800
X-CSE-ConnectionGUID: 3ehhx5y7StmZYu1ASLhl+Q==
X-CSE-MsgGUID: DZPkZ42MRzy75dYkGIwSOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196487248"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:09:21 -0800
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
Subject: [PATCH v3 20/22] drm/xe: Use drm_gpusvm_scan_mm()
Date: Wed, 10 Dec 2025 12:07:40 +0100
Message-ID: <20251210110742.107575-21-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
References: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
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
index efc4e53e8636..58107ba56534 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1623,11 +1623,23 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
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

