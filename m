Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913879F5A7B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CA410EAA2;
	Tue, 17 Dec 2024 23:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdxLo6H6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3EA10EA86;
 Tue, 17 Dec 2024 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478394; x=1766014394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kSV8bzhaihnsw15fQkN5QPEWziwN95QLq2P6/wLAXFE=;
 b=UdxLo6H6VkR02t9MZHX9qfsQL9jkbrEcioHJ/lyzOJygrNuzB5eyo9je
 O57SU5B1gTl3GAWkmku3nW3NAqSgH0IvVzlUEV2u6HSBqJ7AxX/lha16p
 xdilt0kOi0EwiTnxru/q+ekW3aV/DTM1b7T9/krpRiOhMtlatdDF8CNcK
 s67YLjeKP/lH3jbJ41TD+mSlKPfZOzO/I2h6wCHDlllR1FfMMGHSmCPmb
 Oy6bxcPBZKX6hRE2s5TdNe1fF/PMe9Ttvs+BD5QXzju2lw95Ue07rLlzC
 0Yf9mnOpC80zp+sFgyiN4byLxUzS69mzqAXpO2pGMeE6ghWKAfoQ8mnEm g==;
X-CSE-ConnectionGUID: J+ag9qI0SEKWAFdKfCo3XQ==
X-CSE-MsgGUID: r04e7ALtRhuTdfcDpmQ2Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517500"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517500"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:14 -0800
X-CSE-ConnectionGUID: Yi/LXq3uR+uWg8CYAfyH6Q==
X-CSE-MsgGUID: F+apOJQaR/akVHl0fN0I8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273466"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 29/30] drm/xe: Add modparam for SVM notifier size
Date: Tue, 17 Dec 2024 15:33:47 -0800
Message-Id: <20241217233348.3519726-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Useful to experiment with notifier size and how it affects performance.

v3:
 - Pull missing changes including in following patch (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 4 ++++
 drivers/gpu/drm/xe/xe_module.h | 1 +
 drivers/gpu/drm/xe/xe_svm.c    | 4 +++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 0f2c20e9204a..2126e99ede01 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -25,9 +25,13 @@ struct xe_modparam xe_modparam = {
 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
 #endif
 	.wedged_mode = 1,
+	.svm_notifier_size = 512,
 	/* the rest are 0 by default */
 };
 
+module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
+MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be pow2");
+
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 161a5e6f717f..5a3bfea8b7b4 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -22,6 +22,7 @@ struct xe_modparam {
 	unsigned int max_vfs;
 #endif
 	int wedged_mode;
+	u32 svm_notifier_size;
 };
 
 extern struct xe_modparam xe_modparam;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 530ba34a86dc..9586c711386f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -6,6 +6,7 @@
 #include "xe_bo.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
+#include "xe_module.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_ttm_vram_mgr.h"
@@ -598,7 +599,8 @@ int xe_svm_init(struct xe_vm *vm)
 
 	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
 			      current->mm, xe_svm_devm_owner(vm->xe), 0,
-			      vm->size, SZ_512M, &gpusvm_ops, fault_chunk_sizes,
+			      vm->size, xe_modparam.svm_notifier_size * SZ_1M,
+			      &gpusvm_ops, fault_chunk_sizes,
 			      ARRAY_SIZE(fault_chunk_sizes));
 	if (err)
 		return err;
-- 
2.34.1

