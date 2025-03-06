Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC9A53FE5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C31810E889;
	Thu,  6 Mar 2025 01:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VamGWrcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9959010E89E;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zANVWHz2mN7CqmZofIEpLjA6QTLpEP/2REosNZWWALs=;
 b=VamGWrcImr/LPFsLWTL+RgNJqFhJG2NO0B+HGFyqarMZ+c7zoLjP9Ddz
 NHCcR+5mi0MGmHu7Xl9xuT7YgBEECGF14AyxwUfCr0Gci4hNwTVJwQMxy
 cPpMfXsZY66ayTn/FAig5GgfLquvVgdfxbtibkI4Nc7br4gvG1puvgd80
 fsNjpgZk9UirfR4C+lyKixoFYg14F91Hmtwlpcd/HZVmgwk1pBSIUfzB4
 ZLnUyWbirZqv+6jT4hV8OkRvH6I/OZ1N4JUz+EzVoyfBRLtT9mYlVo27r
 WhlO3BOL4NQWuZFNId68EDeL8NzZPDm4BxXntjFZMUsrQW8NjHW8qpfzM A==;
X-CSE-ConnectionGUID: 8eq4D7AHR/KWaNL+WsA8HQ==
X-CSE-MsgGUID: Sr4Kq13YTCSV3+fXraeuGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427446"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427446"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:55 -0800
X-CSE-ConnectionGUID: o98R/D7rSFu6dmuYjMm6Iw==
X-CSE-MsgGUID: bjVgYHtPSbCtOvtBGuGCtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063326"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 31/32] drm/xe: Add always_migrate_to_vram modparam
Date: Wed,  5 Mar 2025 17:26:56 -0800
Message-Id: <20250306012657.3505757-32-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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

Used to show we can bounce memory multiple times which will happen once
a real migration policy is implemented. Can be removed once migration
policy is implemented.

v3:
 - Pull some changes into the previous patch (Thomas)
 - Better commit message (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 3 +++
 drivers/gpu/drm/xe/xe_module.h | 1 +
 drivers/gpu/drm/xe/xe_svm.c    | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4fe6a33da7e3..475acdba2b55 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -32,6 +32,9 @@ struct xe_modparam xe_modparam = {
 module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
 
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
index d1c396119df2..e4e3ae576f56 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -822,6 +822,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
+	if (xe_modparam.always_migrate_to_vram)
+		range->skip_migrate = false;
+
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
 
-- 
2.34.1

