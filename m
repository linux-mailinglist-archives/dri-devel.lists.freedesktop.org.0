Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7ECCCBDA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE4E10EA68;
	Thu, 18 Dec 2025 16:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHyNF/RJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5017710EA60;
 Thu, 18 Dec 2025 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766074984; x=1797610984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kuHqJThr+TSk49GCheNT6RQqiUrQRfk5hJ3Uo0k1R34=;
 b=iHyNF/RJmZeNfXOkH25R0SPDamoaeO/5npJMevzJw+N1Mb+c8S5yLTpP
 eKJ0FkWfJ6R1yIYqBe/euIC9tnyOtT4oZHEg+NgPGTGBxz3S8TwWIUkKI
 khOc0Hd39GqPBBocyaM1yqQMBGNKjRqF3D7iDrvyjV43AIGJoYgQZz1tR
 gLRsWQvBGJJ+RENse5YLd3L/iyJ+MQovRFVbqBdoItIbw8Gnde9+f3WWM
 E8ga2XHWNcgwuW13bTm0hVqcugHNYGw50DL/jGA4nuibSuUvjmaFpC5/O
 Sc4Wi8XZbxr1aL2ezsSOQIh4nS2mBJXMEVfdZbSTCVzXb/ee/AN7I4o4T Q==;
X-CSE-ConnectionGUID: NdfzO0ojRoWVqCWR1KHRow==
X-CSE-MsgGUID: w+XjZZ1bQ9iCLydskU2ffg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70607769"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="70607769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:23:03 -0800
X-CSE-ConnectionGUID: Eq175l3DTRa169ljSTaoQA==
X-CSE-MsgGUID: 5xnDXFM1TV6BaznpETND0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203705891"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.93])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:23:00 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v5 24/24] drm/xe/svm: Serialize migration to device if racing
Date: Thu, 18 Dec 2025 17:21:01 +0100
Message-ID: <20251218162101.605379-25-thomas.hellstrom@linux.intel.com>
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

Introduce an rw-semaphore to serialize migration to device if
it's likely that migration races with another device migration
of the same CPU address space range.
This is a temporary fix to attempt to mitigate a livelock that
might happen if many devices try to migrate a range at the same
time, and it affects only devices using the xe driver.
A longer term fix is probably improvements in the core mm
migration layer.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7be4d129247d..dce7879b3133 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1616,10 +1616,12 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
 		      struct drm_pagemap *dpagemap)
 {
+	static DECLARE_RWSEM(driver_migrate_lock);
 	struct xe_vm *vm = range_to_vm(&range->base);
 	enum drm_gpusvm_scan_result migration_state;
 	struct xe_device *xe = vm->xe;
 	int err, retries = 1;
+	bool write_locked = false;
 
 	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
@@ -1638,16 +1640,32 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
 			dpagemap->drm->unique);
 
+	err = down_read_interruptible(&driver_migrate_lock);
+	if (err)
+		return err;
 	do {
 		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 					      xe_svm_range_end(range),
 					      range->base.gpusvm->mm,
 					      ctx->timeslice_ms);
 
-		if (err == -EBUSY && retries)
-			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
+		if (err == -EBUSY && retries) {
+			if (!write_locked) {
+				int lock_err;
 
+				up_read(&driver_migrate_lock);
+				lock_err = down_write_killable(&driver_migrate_lock);
+				if (lock_err)
+					return lock_err;
+				write_locked = true;
+			}
+			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
+		}
 	} while (err == -EBUSY && retries--);
+	if (write_locked)
+		up_write(&driver_migrate_lock);
+	else
+		up_read(&driver_migrate_lock);
 
 	return err;
 }
-- 
2.51.1

