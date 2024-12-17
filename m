Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C1B9F5A77
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D4610E351;
	Tue, 17 Dec 2024 23:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMeZn6ps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B797610EA9A;
 Tue, 17 Dec 2024 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478394; x=1766014394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zGNhsmgibSU4fRYGEmcAGQqVhhVFxJzhkqSBkCgrwGo=;
 b=PMeZn6psD+/6A0kwbS2UWKfiNX5959f+9DmoFV9rmJmSacBRwndV4xMD
 aSiGNwjED17AoQIDxVuRLa2R1eX7sySrmb4jdIG9fQGHlh00Bcc/9lHv/
 u+dw4J5Q+2/NjmsE2zWymrfjRWbsAF914XyOmsEzEJzmwPaWZJlfy12un
 jkhKlPWoe71B32jZiwyPlgbJosntDZTWJuCCzHSQ1Mz7LO6f3N03LAnIf
 f4Ys7vm/tiFhZTZrTCEhE0J+Lhlv3+KWyFA03IeCJtvgyHdsSlZvzPFVh
 hSmw1/1Hog9V520SFcbL2YMpx/fVzCeHqlBg5MariOo6MccXmPhr4KoTy w==;
X-CSE-ConnectionGUID: IsFNsRyyRzOmhImbSLuSvA==
X-CSE-MsgGUID: CzTBgxlVRSed2ffP7+6kUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517506"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:14 -0800
X-CSE-ConnectionGUID: Akk+1UxiR4aNQkqyJHGlIQ==
X-CSE-MsgGUID: swRC5jSsTJOWfOpbkFJsMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273468"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 30/30] drm/xe: Add always_migrate_to_vram modparam
Date: Tue, 17 Dec 2024 15:33:48 -0800
Message-Id: <20241217233348.3519726-31-matthew.brost@intel.com>
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

Used to show we can bounce memory multiple times which will happen once
a real migration policy is implemented. Can be removed once migration
policy is implemented.

v3:
 - Pull some changes into the previous patch (Thomas)
 - Spell out power of 2 (Thomas)
 - Better commit message (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 5 ++++-
 drivers/gpu/drm/xe/xe_module.h | 1 +
 drivers/gpu/drm/xe/xe_svm.c    | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 2126e99ede01..192047b3419b 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -30,7 +30,10 @@ struct xe_modparam xe_modparam = {
 };
 
 module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
-MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be pow2");
+MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
+
+module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
+MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
 
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
index 9586c711386f..cc5998903469 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -823,6 +823,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
+	if (xe_modparam.always_migrate_to_vram)
+		range->migrated = false;
+
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
 
-- 
2.34.1

