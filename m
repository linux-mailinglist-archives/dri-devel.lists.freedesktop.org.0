Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC899FF78
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4E810E682;
	Wed, 16 Oct 2024 03:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAqdA/NE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1C110E65D;
 Wed, 16 Oct 2024 03:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049101; x=1760585101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u6vEgt1Lzw6hPaEIgyC4sQg//YxIyTtnDPXL4/+kjYM=;
 b=TAqdA/NE/iGeG9sK6GHR8Hk3Kk8Y2uEtIOsPYKjUBEPOz1ZuTV545uFx
 FjLaXy5Iv7Dl0tWvldvp4jMtyVzLblI4e7ZF4zFrPvDP7h3pYBAyGhwDI
 2s4FEIaX8ll3de4KTCVHVEZKU79Y2xeKc2ODH+li71BJvICfACSuZv/zL
 XYzCxN9z6/0Qs8tJuyNSz2TWL4+nWLtsn9EyNv89DdJ7B1lsUysiRI+JU
 u+cWnwgMfX0XCEGpd3+Vz1/rox3YTwv80TjXHb1Hfo40I+5XEi1Ppnryh
 AX7KXIyyxTg6xEdpy4a9/PovMkhWAH2YpfCy3Ba3TrvY+YEReK4zPMa4k w==;
X-CSE-ConnectionGUID: vdDRmHmYRI2/ywAURNKLUg==
X-CSE-MsgGUID: c/wtxJFERKe2PwYh8kod8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056490"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: ev6+xEmKQ1qVBrWXJkhJsw==
X-CSE-MsgGUID: M1mSpvRJRKO11vnZRV0ahg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930280"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 28/29] drm/xe: Add always_migrate_to_vram modparam
Date: Tue, 15 Oct 2024 20:25:17 -0700
Message-Id: <20241016032518.539495-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

Used to show we can bounce memory multiple times.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 7 +++++++
 drivers/gpu/drm/xe/xe_module.h | 1 +
 drivers/gpu/drm/xe/xe_svm.c    | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 77ce9f9ca7a5..088f6caea307 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -25,9 +25,16 @@ struct xe_modparam xe_modparam = {
 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
 #endif
 	.wedged_mode = 1,
+	.svm_notifier_size = 512,
 	/* the rest are 0 by default */
 };
 
+module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
+MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be pow2");
+
+module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
+MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
+
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 5a3bfea8b7b4..84339e509c80 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
+	bool always_migrate_to_vram;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 16e34aaead79..bb386f56a189 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -767,6 +767,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
+	if (xe_modparam.always_migrate_to_vram)
+		range->migrated = false;
+
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
 
-- 
2.34.1

