Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923DCB353DE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E767110E5B9;
	Tue, 26 Aug 2025 06:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UT048rhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590DB10E5B9;
 Tue, 26 Aug 2025 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756188590; x=1787724590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+YeeIr9x6oq8Nx6FoGKa0ZZBOnejcnKxKhNXHwzG7RE=;
 b=UT048rhbdwQmueYWrSLYmK7B3gHZMvaGEXW1ZEntW+estAJ+KGFyxkJh
 eEwdRUcJeTju2ThY2Asy/zshz0ypjC88chVurEb/180uu1tTaxtk06C5Z
 tajKJhtMCh8azRYrXpzjlK8QkAH+aIbakYPcgbztn5vecU9fQ0WbDPMeE
 FCmVKcHa/xOcdssgx78BEJAl1CnjmhC2TK1bH0+kxm4pwxdu4+fqLrgbH
 AMXWJteD7/fYhRtmtUSuZ+seQTkVymnDmWGLHRHrWnWSlINDc/F4QvP+6
 vKxkmF7q0fcgWLDk4pb52p/MFsj8WpLS2DGkUWFWDpyCKvJUjxQ/9qUAH Q==;
X-CSE-ConnectionGUID: 4RMSeLDMT6SaJsQXW6HvbQ==
X-CSE-MsgGUID: qpSy4sOXTfWxyh4dQ0pv4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58272076"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58272076"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:50 -0700
X-CSE-ConnectionGUID: HYWqOoWtRLy+GGBJ+VyXGw==
X-CSE-MsgGUID: XX2KeJh1Q0OfnoByU4m2UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174756892"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:45 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH v9 10/10] drm/xe/xe_hw_error: Add fault injection to trigger
 csc error handler
Date: Tue, 26 Aug 2025 12:04:17 +0530
Message-ID: <20250826063419.3022216-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250826063419.3022216-1-riana.tauro@intel.com>
References: <20250826063419.3022216-1-riana.tauro@intel.com>
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
wedges the device and enables runtime survivability mode.

v2: add debugfs only for bmg (Umesh)
v3: do not use csc_fault attribute if debugfs is not enabled
v4: rebase

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c  |  6 +++++-
 drivers/gpu/drm/xe/xe_hw_error.c | 11 +++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index bc717519502d..8d6df6bd885e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -35,6 +35,7 @@
 #endif
 
 DECLARE_FAULT_ATTR(gt_reset_failure);
+DECLARE_FAULT_ATTR(inject_csc_hw_error);
 
 static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				   u32 offset, char *name, struct drm_printer *p)
@@ -361,10 +362,13 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-	if (xe->info.platform == XE_BATTLEMAGE)
+	if (xe->info.platform == XE_BATTLEMAGE) {
 		drm_debugfs_create_files(debugfs_residencies,
 					 ARRAY_SIZE(debugfs_residencies),
 					 root, minor);
+		fault_create_debugfs_attr("inject_csc_hw_error", root,
+					  &inject_csc_hw_error);
+	}
 
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
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

