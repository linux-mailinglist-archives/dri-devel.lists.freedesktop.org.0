Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D84A4344C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D4B10E573;
	Tue, 25 Feb 2025 04:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJQsu2sH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D4010E55A;
 Tue, 25 Feb 2025 04:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458536; x=1771994536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d3znmFGwAyFXNJrJ6wGh9SQtGQe5CBCBa8vC8F+N4Wg=;
 b=PJQsu2sHUOsRtpljcD1xuTQm2+rd5KYAq6c0ZHws/KCdGMOqIYrCBh2Z
 5M3nIF9vqnn11qalilA82YybWQCDOhSNgVvRSImMjgsMLMjVmdtFeDCIs
 ZSbh7f4k3JxRAQKNe/XgqSC/9wLtjMIrBOi3uoFqA0vElvDNRwWgBXmOM
 vLsiqnnKC/FiF1v7GjrsahAA6kNj8XFJyi6TnJKW2Y4x9u87v10SekghZ
 FCv53mvnGZZMKNLMldKxeop2hdECPdGZiVpJSw3PkQsOnXpzLbkZ4Wf2D
 /7TMjRL/4KHJx751JpzLh3kwe35vYgXREELP7t0vSaTGgGNofD8x0v+iM Q==;
X-CSE-ConnectionGUID: Y4jnOFKWTMu8pShPFRIlsw==
X-CSE-MsgGUID: B1YztsMvQ8O/dsCYg7HKdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885084"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885084"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:16 -0800
X-CSE-ConnectionGUID: RBNX5vxyRJ2Hb1fgXriGpg==
X-CSE-MsgGUID: kuuYKEAWT52QIVcT5mIxXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290335"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 30/32] drm/xe: Add modparam for SVM notifier size
Date: Mon, 24 Feb 2025 20:43:09 -0800
Message-Id: <20250225044311.3178695-31-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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

Useful to experiment with notifier size and how it affects performance.

v3:
 - Pull missing changes including in following patch (Thomas)
v5:
 - Spell out power of 2 (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 4 ++++
 drivers/gpu/drm/xe/xe_module.h | 1 +
 drivers/gpu/drm/xe/xe_svm.c    | 4 +++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 26ec9aa02648..4fe6a33da7e3 100644
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
+MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
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
index 546336a0ab2a..dec0539753bd 100644
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
@@ -607,7 +608,8 @@ int xe_svm_init(struct xe_vm *vm)
 
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

