Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584257BB012
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 03:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748B610E1DD;
	Fri,  6 Oct 2023 01:36:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A877E10E085;
 Fri,  6 Oct 2023 01:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696556180; x=1728092180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+ZViYKmZe7ReuITau9q/rPgU92hNNM1KSvS4l6bgTow=;
 b=JQrdLU9kMDS0soOTGeN14zRPFTuWaE9usy58KVPHMJJOBWouTfssE+//
 IPfG+ZUr0HRcz4oRzo2VfnFhTeR4Lzzzn0bR3WBIzlbNdEscsyFPqRbtS
 GLiraEShM3J9YNjq7NFr0YfVHBaxMkrlD57nZxt6dnwPX38tR8ZJQqvEl
 RVMuE1BIrl4lRKpm4HIf16Mn0999EZ5xlg1i7CbJK/rh4agucXjVHb0dT
 O1hYG/aCtH5yySbTEI+3t1EmzehTKNVYQRc1UrUMNNwIHCqovzsYaRsuU
 9nDa/B6TnxEpL0o/7QY4LrtBieoKOJUX/6CLlhIdiHxcQg+qRmHFrcist Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386488674"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="386488674"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 18:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868153123"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="868153123"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga002.fm.intel.com with ESMTP; 05 Oct 2023 18:36:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Enable WA 14018913170
Date: Thu,  5 Oct 2023 18:35:53 -0700
Message-ID: <20231006013553.1339418-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

The GuC handles the WA, the KMD just needs to set the flag to enable
it on the appropriate platforms.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 6 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h      | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 27df41c53b890..3f3df1166b860 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -319,6 +319,12 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 	if (!RCS_MASK(gt))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
+	/* Wa_14018913170 */
+	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 7, 0)) {
+		if (IS_DG2(gt->i915) || IS_METEORLAKE(gt->i915) || IS_PONTEVECCHIO(gt->i915))
+			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
+	}
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 6c392bad29c19..818c8c146fd47 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -295,6 +295,7 @@ struct intel_guc {
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
 #define GUC_SUBMIT_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->submission_version)
+#define GUC_FIRMWARE_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->fw.file_selected.ver)
 
 static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index b4d56eccfb1f0..123ad75d2eb28 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -100,6 +100,7 @@
 #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
 #define   GUC_WA_POLLCS			BIT(18)
 #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
+#define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
-- 
2.41.0

