Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABE7A224C2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91E910E8BB;
	Wed, 29 Jan 2025 19:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O061Mv7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA4210E8A8;
 Wed, 29 Jan 2025 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180287; x=1769716287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W9PLoBT0YxScDm6X5KUynTGoHYU9/aG9T9g+dpJqn28=;
 b=O061Mv7vPFp2zfGtbim+B+M5uzml91jgg/9vO0DQJ7vFJ9qyEfzSbELE
 IR6TaObv9ur96icE1LkYuDzA5ftg277ZUrSavBZaOdX8gAzg4SDe1nZzb
 MnMU3WvRRo3d/Yoq8UgLxOs1vzYzdQUYcV+ufg+IdX5YpQvkOneZ3bJN8
 tLH2bpDlHjojkK2NuSLJ21kCGbRRocVNc1uXhP7hI9/6aLcpYzWv57kKC
 lXpw0xczwF6T7c+RM2s8Dv/G4Aysjkm3S/DO09Fl1s9MBvZdkvszdHDVg
 9BU6MHZwj8FpKNv6C1ew8pvfzWMjwYNLxrBCXH/1agwSeU1LxYx4fbFTo A==;
X-CSE-ConnectionGUID: kYkWUxyQRuSn18QQ9hVyHQ==
X-CSE-MsgGUID: Sxia1F1LQ+ivEbiu2MD5qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132903"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:27 -0800
X-CSE-ConnectionGUID: ah7Y+gG4SrWOquGEC1oW2g==
X-CSE-MsgGUID: Ub1KVwl3RF2Cd1PgzL61og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392208"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 32/33] drm/xe: Add always_migrate_to_vram modparam
Date: Wed, 29 Jan 2025 11:52:11 -0800
Message-Id: <20250129195212.745731-33-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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
index f291b2eb2073..a96b0afc0e31 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -821,6 +821,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
+	if (xe_modparam.always_migrate_to_vram)
+		range->migrated = false;
+
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
 
-- 
2.34.1

