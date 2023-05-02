Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647906F4DC3
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB6B10E177;
	Tue,  2 May 2023 23:40:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFCB10E127;
 Tue,  2 May 2023 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683070798; x=1714606798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pg9Lmo5mqLCogzcNdwUvyTUQeFEVqby+apkLh04aMdA=;
 b=fesSFEjb/Qp+r2vgP7pnkWrPTQujbufYTAlM+mUQkK4Wz2VLYTxCDTFT
 GhT4QPaKrHeiLOj9rGAoILfiUmgHX6TtmTznH/aTuUU5lFwjbF0+sZYwq
 x59zBCQUfDWUdte5SJL+rTYcHYS1r8W4T5muQy0kd3OeYGyIgrJxJy9AK
 ONqia2fwXMCaeQpvqdwS5ZQ5VCcyaXBM8UY1uXGeLJEPLefGe1sWVrduy
 LQvXeAk9Jin2bSP3xlpA8bk9isxI4N9ldhcVEVIRxoXhBxgOxp/XLWHOW
 VmvgqDKv2DbdeV3ZFu8Zl+e0VBolQyU/HxXhZQUexsW67xJ/H0TdCwFbC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350601515"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="350601515"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 16:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="673865826"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="673865826"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2023 16:39:57 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 6/6] drm/i915/uc: Make unexpected firmware versions an
 error in debug builds
Date: Tue,  2 May 2023 16:40:07 -0700
Message-Id: <20230502234007.1762014-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
References: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

If the DEBUG_GEM config option is set then escalate the 'unexpected
firmware version' message from a notice to an error. This will ensure
that the CI system treats such occurences as a failure and logs a bug
about it (or fails the pre-merge testing).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 34 ++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 010c049609102..41ebd0ee0bb5e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -17,6 +17,12 @@
 #include "i915_drv.h"
 #include "i915_reg.h"
 
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
+#define UNEXPECTED	gt_err
+#else
+#define UNEXPECTED	gt_notice
+#endif
+
 static inline struct intel_gt *
 ____uc_fw_to_gt(struct intel_uc_fw *uc_fw, enum intel_uc_fw_type type)
 {
@@ -833,10 +839,10 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (uc_fw->file_wanted.ver.major && uc_fw->file_selected.ver.major) {
 		/* Check the file's major version was as it claimed */
 		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
-			gt_notice(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
-				  intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-				  uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
-				  uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
+			UNEXPECTED(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
+				   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+				   uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
+				   uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
 			if (!intel_uc_fw_is_overridden(uc_fw)) {
 				err = -ENOEXEC;
 				goto fail;
@@ -854,16 +860,16 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		/* Preserve the version that was really wanted */
 		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
 
-		gt_notice(gt, "%s firmware %s (%d.%d.%d) is recommended, but only %s (%d.%d.%d) was found\n",
-			  intel_uc_fw_type_repr(uc_fw->type),
-			  uc_fw->file_wanted.path,
-			  uc_fw->file_wanted.ver.major,
-			  uc_fw->file_wanted.ver.minor,
-			  uc_fw->file_wanted.ver.patch,
-			  uc_fw->file_selected.path,
-			  uc_fw->file_selected.ver.major,
-			  uc_fw->file_selected.ver.minor,
-			  uc_fw->file_selected.ver.patch);
+		UNEXPECTED(gt, "%s firmware %s (%d.%d.%d) is recommended, but only %s (%d.%d.%d) was found\n",
+			   intel_uc_fw_type_repr(uc_fw->type),
+			   uc_fw->file_wanted.path,
+			   uc_fw->file_wanted.ver.major,
+			   uc_fw->file_wanted.ver.minor,
+			   uc_fw->file_wanted.ver.patch,
+			   uc_fw->file_selected.path,
+			   uc_fw->file_selected.ver.major,
+			   uc_fw->file_selected.ver.minor,
+			   uc_fw->file_selected.ver.patch);
 		gt_info(gt, "Consider updating your linux-firmware pkg or downloading from %s\n",
 			INTEL_UC_FIRMWARE_URL);
 	}
-- 
2.39.1

