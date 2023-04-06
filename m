Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BD16DA5C4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 00:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5924C10ED51;
	Thu,  6 Apr 2023 22:26:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A8810ED3B;
 Thu,  6 Apr 2023 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680820003; x=1712356003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oytFl2BC/bYe4AcGop2+JnvLzussV1UXUGkp4aG0sHw=;
 b=FSGIJEcMWubLsePhEnqgozACtl2A2IvODzGMQR0JKD+djLcni6X1QFMN
 isEVBHzXesyvmdMmr1tOKw1W3Qirv+trfuh4UW3UvBFCuRAlDJ/N16oHl
 fti/vfp6IuXsYh47f2kcgbicEfQ2LuNToRH18y8GV0xAP3ETXZENf0WRU
 XE/yyqUTi3Nutnace4QHzgOF/YjEDXo4XH+8EFPeACMT5KQf4Sx0y03Zh
 k49IECpTlDO6DuTDLH7TcpwOnu0OILy0NveZmu04TN/BGyIJAmELbGUoX
 q+zp5dBOAT0cFSdyQjsJv8d9fSkYrgiSM5ZPl2IpAGD4cDGHuMQK2kpk6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341604982"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="341604982"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 15:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776635899"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776635899"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 15:26:42 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/5] drm/i915/guc: Capture list clean up - 2
Date: Thu,  6 Apr 2023 15:26:15 -0700
Message-Id: <20230406222617.790484-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230406222617.790484-1-John.C.Harrison@Intel.com>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Don't use 'xe_lp*' prefixes for register lists that are common with
Gen8.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 9184d2595e4ce..7968a495fcfa8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -111,12 +111,12 @@ static const struct __guc_mmio_reg_descr xe_lpd_rc_class_regs[] = {
 };
 
 /* GEN9/XE_LPD - Render / Compute Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_rc_inst_regs[] = {
+static const struct __guc_mmio_reg_descr gen8_rc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
 /* GEN9/XE_LPD - Media Decode/Encode Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_vd_inst_regs[] = {
+static const struct __guc_mmio_reg_descr gen8_vd_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
@@ -126,12 +126,12 @@ static const struct __guc_mmio_reg_descr xe_lpd_vec_class_regs[] = {
 };
 
 /* GEN9/XE_LPD - Video Enhancement Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_vec_inst_regs[] = {
+static const struct __guc_mmio_reg_descr gen8_vec_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
 /* GEN9/XE_LPD - Blitter Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_blt_inst_regs[] = {
+static const struct __guc_mmio_reg_descr gen8_blt_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
@@ -177,32 +177,32 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 static const struct __guc_mmio_reg_descr_group default_lists[] = {
 	MAKE_REGLIST(default_global_regs, PF, GLOBAL, 0),
 	MAKE_REGLIST(default_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
 	MAKE_REGLIST(default_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(xe_lpd_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
+	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
-	MAKE_REGLIST(xe_lpd_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
+	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
-	MAKE_REGLIST(xe_lpd_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
+	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_GSC_OTHER_CLASS),
-	MAKE_REGLIST(xe_lpd_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
 	{}
 };
 
 static const struct __guc_mmio_reg_descr_group xe_lpd_lists[] = {
 	MAKE_REGLIST(xe_lpd_global_regs, PF, GLOBAL, 0),
 	MAKE_REGLIST(xe_lpd_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
 	MAKE_REGLIST(xe_lpd_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(xe_lpd_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
+	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
 	MAKE_REGLIST(xe_lpd_vec_class_regs, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
-	MAKE_REGLIST(xe_lpd_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
+	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
-	MAKE_REGLIST(xe_lpd_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
+	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_GSC_OTHER_CLASS),
 	MAKE_REGLIST(xe_lpd_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
 	{}
-- 
2.39.1

