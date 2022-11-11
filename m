Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EED7624EC3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 01:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08B610E164;
	Fri, 11 Nov 2022 00:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AAA10E156;
 Fri, 11 Nov 2022 00:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668125725; x=1699661725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=33r/WY0y+U7sWq71rFlMteX8P1KHugWPV/hFjpRRNdU=;
 b=RuKO2Um6/wHyxi8v5672nh0Sod4/AoOgmv8o/tpOuQ7QIMlabT7q8hDH
 acjHolLXT3gt22GTPhANTQxA9NmxDdsFlowDBa3c7JMHjiKnOrwyMiIpD
 UWHWrqSd2PDoNOjmSISGNHWkOu4sDN1RzeYJjOIQGo41PXHRY1THi9TEW
 63+gBj6vUcu8WDZM+jzuQp4Mx2Pl8jmvG3Utu0rWvDtWJVQRsBAw0Ceof
 ke26JwbOxuWQbQB/5tc1QOtI8zgwRTe4sdewugZmoeam8EZV/FBwe4o9W
 3cGMHFrAHrT1VxkQmsABzx/uW0m+04XT90AKiwUIXwPIKH7lNcEcBDlH5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="373605643"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="373605643"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 16:15:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="882569321"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="882569321"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 16:15:24 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: add the GSC CS to the GuC capture list
Date: Thu, 10 Nov 2022 16:18:32 -0800
Message-Id: <20221111001832.4144910-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the GSC engine we only want to capture the instance regs.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 4e6dca707d94..1d49a7ec0bd8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -132,6 +132,11 @@ static const struct __guc_mmio_reg_descr xe_lpd_blt_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
+/* XE_LPD - GSC Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe_lpd_gsc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
 /* GEN9 - Global */
 static const struct __guc_mmio_reg_descr default_global_regs[] = {
 	COMMON_BASE_GLOBAL,
@@ -177,6 +182,8 @@ static struct __guc_mmio_reg_descr_group default_lists[] = {
 	MAKE_REGLIST(xe_lpd_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
 	MAKE_REGLIST(xe_lpd_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_GSC_OTHER_CLASS),
+	MAKE_REGLIST(xe_lpd_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
 	{}
 };
 
@@ -192,6 +199,8 @@ static const struct __guc_mmio_reg_descr_group xe_lpd_lists[] = {
 	MAKE_REGLIST(xe_lpd_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
 	MAKE_REGLIST(xe_lpd_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_GSC_OTHER_CLASS),
+	MAKE_REGLIST(xe_lpd_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
 	{}
 };
 
@@ -454,6 +463,8 @@ __stringify_engclass(u32 class)
 		return "Blitter";
 	case GUC_COMPUTE_CLASS:
 		return "Compute";
+	case GUC_GSC_OTHER_CLASS:
+		return "GSC-Other";
 	default:
 		break;
 	}
-- 
2.37.3

