Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E30CCF9BF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E49110EF48;
	Fri, 19 Dec 2025 11:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0HZMi9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BAC10EF46;
 Fri, 19 Dec 2025 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144132; x=1797680132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2nTX01ZD8kY3gDtjpMbYldNFEm+McfWa0UuGEKAuQpY=;
 b=X0HZMi9S5+aA7zccxEO0osvvfs571n7ZUJSTkClvoLnza+GUqbnf6auj
 i1+tnOjg11f0KUqAVghziS6MxV0gptBZV31nW5LaaedsmW3QTv4XY+tIS
 XvRu+QWftNER0/963zaWVisVwYY/wLYSycD63CZQz80i08Oa/LlEt/wCs
 f2NTc7WyXJsX8hzY0+gApzE3pX5fo35/IaxZbQEM4YPX8Fx7ZbYdR2vtS
 KN96Z+pt1qI49AW9uT2ILLE6tB6kUzA6vUbczwR1Doq47SkAIVO4HBfB4
 WJFDwaClYU5HDy5dMO53KAsxAx/XWTcwAiNkr4nw2KXSan/0qakZ3iBhd A==;
X-CSE-ConnectionGUID: UbR3qUZdTk62mXIMZ4aZEQ==
X-CSE-MsgGUID: A5fMAuB9T/GLtcZEDUm4Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224642"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:31 -0800
X-CSE-ConnectionGUID: gEPhFWjSRSG9paNoBC3BmA==
X-CSE-MsgGUID: T63kN+tIRXONsjZGcCpw+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005858"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:28 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 24/24] drm/xe/svm: Serialize migration to device if racing
Date: Fri, 19 Dec 2025 12:33:20 +0100
Message-ID: <20251219113320.183860-25-thomas.hellstrom@linux.intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 84ff99aa3e49..fa2ee2c08f31 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1593,10 +1593,12 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
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
@@ -1615,16 +1617,32 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
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

