Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F64A43452
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FEF10E57B;
	Tue, 25 Feb 2025 04:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zs++85O7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E98E10E54B;
 Tue, 25 Feb 2025 04:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458536; x=1771994536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=atcotgQNGJRqAjsJLC1wdj5xA+OewlhQmhkIkPYCvnI=;
 b=Zs++85O7IAbhmN+Yj/SUW3ZXAy5qxmznwlO3l6M8/F4ChXuenxtHWHVm
 fnUy9i391IpC0X9gzeKVn5fJxCrZBKV9zP2a8pW8ULKd9yFCUlJwfeG3p
 MVD3w0j3qOhN9YtyCpqrBB/WWJfG7IwOuWfE+ddSSJfuH5PLOIbnDgbA6
 WQBr7SryYhZGk74QGeq3TrOUHiWXNz721YLOs1gZmQar9m7peKhWyfnrd
 qvr/mHSGCkklfDX91GzGC8Skg1/ZLO+jdh9TRhgMQlyfT4DXYpJ4hDpTY
 9ocPZVLv1MKgCHU7PM/tbDMqErsYPcT6yOVFPAv1He/25ZYLxoRx0JnS0 g==;
X-CSE-ConnectionGUID: T/iTu3ccTlKOZgh5BYEUlQ==
X-CSE-MsgGUID: iES6kE/EQGKAwNBBu1nvtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885091"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885091"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:16 -0800
X-CSE-ConnectionGUID: IvRkyZ6hQJu6j4JSGatIzA==
X-CSE-MsgGUID: hrabFuTVRIaoV+7ZSXQ9fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290338"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 31/32] drm/xe: Add always_migrate_to_vram modparam
Date: Mon, 24 Feb 2025 20:43:10 -0800
Message-Id: <20250225044311.3178695-32-matthew.brost@intel.com>
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
index dec0539753bd..ce1d5f6f5dc3 100644
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

