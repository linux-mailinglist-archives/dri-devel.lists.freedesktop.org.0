Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD76CB2C76
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371F810E702;
	Wed, 10 Dec 2025 11:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwaJR2nz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28FD10E701;
 Wed, 10 Dec 2025 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765364950; x=1796900950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x+wLa0D3znYwt5+a7dAsrV0VxgLALQaHBZYATTO3Y0Y=;
 b=fwaJR2nzn2PqrzTWajJ8MRxox0mYbH2Fd5aw5Uvy/XSBh5rVLGmhDn2L
 VGuMK5S3K46fSmj2hxkfbKjH7pFS9DJBB5r1xeML37ViFvmRXIIx7/avw
 RU9Gr/BB4iyICrz/qB238UzOFiN91nkY4nKuwbMyxrLzhaK5zS1DLojnf
 4hOzzr1jZ8CgU27se3tmKd9Z22AROyipgO6Yxg/X9XKkjKI1W9QCGWYYk
 7Vhx2ynJiNwJ7FZj/219Sn8Q9RjFUNxI0Lm8KSF/Y5yfIa3QxzDTIZcHh
 jX1yDfGuXqQ0G1zhNjM0rm/wMerk2y7k908pA4pej0fNsBmrs+aevYfC/ Q==;
X-CSE-ConnectionGUID: NYleenlqQlKLtrdlvn5yjg==
X-CSE-MsgGUID: v+/VCC4FRZWTcjWKsmDysQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67221859"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67221859"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:09:10 -0800
X-CSE-ConnectionGUID: L1roMBIZSeGG1wF7NifiDQ==
X-CSE-MsgGUID: OdajU5xYRfyU6eMgDVAsng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196487200"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:09:08 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v3 16/22] drm/xe/vm: Add a couple of VM debug printouts
Date: Wed, 10 Dec 2025 12:07:36 +0100
Message-ID: <20251210110742.107575-17-thomas.hellstrom@linux.intel.com>
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
index 1a80d036de29..9eb288b8b57b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1304,6 +1304,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err) {
 		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
 		goto out;
+	} else if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
+		drm_dbg(&vm->xe->drm, "After page collect data location is %sin \"%s\".\n",
+			xe_svm_range_has_pagemap(range, dpagemap) ? "" : "NOT ",
+			dpagemap ? dpagemap->drm->unique : "System.");
 	}
 
 	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
@@ -1599,9 +1603,15 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
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
index ae2c1d500d54..cccd3e6510f5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2928,6 +2928,13 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
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

