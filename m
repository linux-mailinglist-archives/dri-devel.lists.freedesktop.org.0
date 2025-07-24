Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BA2B10CCA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C213C10E971;
	Thu, 24 Jul 2025 14:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbxE2Kjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837DE10E972;
 Thu, 24 Jul 2025 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753366233; x=1784902233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IiejBFIwJCy1TqHmi6Tu1LUJ5k26EqZHSm6Ek/hPfWM=;
 b=KbxE2KjsGhvVI/kksntwWDrJoyy42qP4hvdfE3j5vNHkPaf6AgS+5s6s
 vzQwCIxX2i/oZlYWz719K9OZFwAUA7zGJDtkMzdAoB7pGkvDGGrcHMp+J
 nMo9aL+qno5rftqguA7ls0owogmKW4SpZxD4AXVpMtqQQ+0CmZRZ3QG7v
 i04Bnc3NysLnj2GnidULlR1Yuzdn6zyMyjWirs+nYVM7RSRlwBaE4WDgM
 2sKtYPpVi5Bamke6JLJz9z0rwasRh0D1aoYxnEw5Bp9F/vfzfQnjTGhml
 5Pftm/tpFi2PSDkYQCC6cr2+6EFGxjJU52zqDd8D8wBQHfzChYSENmjmy A==;
X-CSE-ConnectionGUID: dyrqmBS1SHasaOAsAHav9w==
X-CSE-MsgGUID: rC+gydrHSlyIhvv9DaiQKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73146028"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="73146028"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:10:33 -0700
X-CSE-ConnectionGUID: xm4QhkaDTcOOc6xFdMtrDQ==
X-CSE-MsgGUID: iDyt6eI/TGWk5Ni+IEAPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160010969"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:10:30 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: [PATCH v6 9/9] drm/xe/xe_hw_error: Add fault injection to trigger csc
 error handler
Date: Thu, 24 Jul 2025 20:04:38 +0530
Message-ID: <20250724143440.232862-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250724143440.232862-1-riana.tauro@intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
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

Add a debugfs fault handler to trigger csc error handler that
wedges the device and enables runtime survivability mode

v2: add debugfs only for bmg (Umesh)
v3: do not use csc_fault attribute if debugfs is not enabled

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c  |  3 +++
 drivers/gpu/drm/xe/xe_hw_error.c | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0b4a532f7c45..ac5b9e5889c5 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -34,6 +34,7 @@
 #endif
 
 DECLARE_FAULT_ATTR(gt_reset_failure);
+DECLARE_FAULT_ATTR(inject_csc_hw_error);
 
 static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				   u32 offset, char *name, struct drm_printer *p)
@@ -401,6 +402,8 @@ void xe_debugfs_register(struct xe_device *xe)
 	xe_pxp_debugfs_register(xe->pxp);
 
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
+	if (xe->info.platform == XE_BATTLEMAGE)
+		fault_create_debugfs_attr("inject_csc_hw_error", root, &inject_csc_hw_error);
 
 	if (IS_SRIOV_PF(xe))
 		xe_sriov_pf_debugfs_register(xe, root);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 4099ed1262e1..8c65291f36fc 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/fault-inject.h>
+
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
@@ -13,6 +15,7 @@
 #include "xe_survivability_mode.h"
 
 #define  HEC_UNCORR_FW_ERR_BITS 4
+extern struct fault_attr inject_csc_hw_error;
 
 /* Error categories reported by hardware */
 enum hardware_error {
@@ -43,6 +46,11 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
 	}
 }
 
+static bool fault_inject_csc_hw_error(void)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
+}
+
 static void csc_hw_error_work(struct work_struct *work)
 {
 	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
@@ -130,6 +138,9 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 {
 	enum hardware_error hw_err;
 
+	if (fault_inject_csc_hw_error())
+		schedule_work(&tile->csc_hw_error_work);
+
 	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
 		if (master_ctl & ERROR_IRQ(hw_err))
 			hw_error_source_handler(tile, hw_err);
-- 
2.47.1

