Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD2A91229
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 06:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DAD10EA1D;
	Thu, 17 Apr 2025 04:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvaCU59D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9964810E01F;
 Thu, 17 Apr 2025 04:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744863144; x=1776399144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RJsDGlpmrXBSxe22L0WyZFHgHPgzjwrwM6w2tBAVVNk=;
 b=FvaCU59DglSgGLlbzBS3OWxjppckt9VMScge1W1EFP1M5zXJFnrXBWkT
 9XXiMp+jsAkjWO0aBgaZYiZFHhFqJ+Y3c6fcixebgWOcljzeipg/hsYQy
 YdtWrlX8vHG+USIk5zoI1uAivqom0KKp4DHPFXB8oiH+z7CGmg4oBkayS
 hSDXXiM2FZGwR4j0Z/caM/UYmn8M58Z5P+dlrH79/o/t2cNzYukl3bcmx
 tWCb1/tmIaikrbka35+Cbqju1bGpArm2ZrlmSVf/6AbsxqRCOA0e6hAg0
 q6LJtqRpQghApPaQdpfNFowvPZFPqq66FrAMtE+EtN/PWLbyfJ+MJ3i1r Q==;
X-CSE-ConnectionGUID: KrIZMGZ4SMCe85xbf1Ugeg==
X-CSE-MsgGUID: S8kywrbTQMuQDqXyiu9zXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="34050108"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="34050108"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:12:23 -0700
X-CSE-ConnectionGUID: D04qolB8RE+5AKO67lN33g==
X-CSE-MsgGUID: Z9s/cMmfRAaatqI6encxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131216567"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:12:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 4/5] drm/xe: Timeslice GPU on atomic SVM fault
Date: Wed, 16 Apr 2025 21:13:39 -0700
Message-Id: <20250417041340.479973-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417041340.479973-1-matthew.brost@intel.com>
References: <20250417041340.479973-1-matthew.brost@intel.com>
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

Ensure GPU can make forward progress on an atomic SVM GPU fault by
giving the GPU a timeslice of 5ms

v2:
 - Reduce timeslice to 5ms
 - Double timeslice on retry
 - Split out GPU SVM changes into independent patch

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 1cc41ce7b684..4b0e0820153a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -780,6 +780,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
 		.vram_only = atomic,
+		.timeslice_ms = atomic ? 5 : 0,
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
@@ -816,6 +817,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
 			if (migrate_try_count || !ctx.vram_only) {
 				drm_dbg(&vm->xe->drm,
-- 
2.34.1

