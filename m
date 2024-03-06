Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ABE87407F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA08C113363;
	Wed,  6 Mar 2024 19:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMz04QW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A031133ED;
 Wed,  6 Mar 2024 19:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709753783; x=1741289783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WdwuZoml0xWgll3zVqomgfmx1OHLjMc9G/0ycYBn5Zg=;
 b=XMz04QW4RBxJu0Ij5cPczKPIGLm1TGuijS/GLSPYtj2KV/lKamK1mETu
 Fkp+vYIGkwLADF8tHVEf4hqGm+PjqMBGhSzSkm6+TXAGrri4IwAMOJMjS
 GK1cv3kp3CZqSImO3HP8Ggl2vW8DGAgbM+JieKOhB9YQ/C2uCCMxv7P9b
 soDxzWh/7vlRPcUlUrSvxh9w8Nrs8woxxaxw1aBeK9d3d11VrRYQDuydK
 fxZEFTwo/Fr8ry8OZlkQoSzdHvqHB27/5CiGg9zmd/oMzhInIE41rWBVx
 jwFDxXlxbLzndwXFS6zSw85JAdfGwUbPGSn5aw2saFOw2xefiUKqsftzj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4246876"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4246876"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:36:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9841814"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:36:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/5] drm/i915: Remove special handling for !RCS_MASK()
Date: Wed,  6 Mar 2024 11:36:43 -0800
Message-ID: <20240306193643.1897026-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306193643.1897026-1-lucas.demarchi@intel.com>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
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

With both XEHPSDV and PVC removed (as platforms, most of their code
remain used by others), there's no need to handle !RCS_MASK() as
other platforms don't ever have fused-off render. Remove those code
paths and the special WA flag when initializing GuC.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 5 ++---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 4 ----
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 396f5fe993c3..476651bd0a21 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -497,9 +497,8 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	engine->logical_mask = BIT(logical_instance);
 	__sprint_engine_name(engine);
 
-	if ((engine->class == COMPUTE_CLASS && !RCS_MASK(engine->gt) &&
-	     __ffs(CCS_MASK(engine->gt)) == engine->instance) ||
-	     engine->class == RENDER_CLASS)
+	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
+	    __ffs(CCS_MASK(engine->gt) | RCS_MASK(engine->gt)) == engine->instance)
 		engine->flags |= I915_ENGINE_FIRST_RENDER_COMPUTE;
 
 	/* features common between engines sharing EUs */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index da6cc268e7b2..bcc7d5c74192 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -315,10 +315,6 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 	if (IS_DG2_G11(gt->i915))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
-	/* Wa_18020744125 */
-	if (!RCS_MASK(gt))
-		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
-
 	/*
 	 * Wa_14018913170: Applicable to all platforms supported by i915 so
 	 * don't bother testing for all X/Y/Z platforms explicitly.
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 8ae1846431da..0e4060adcf14 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -100,7 +100,6 @@
 #define   GUC_WA_PRE_PARSER		BIT(14)
 #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
 #define   GUC_WA_POLLCS			BIT(18)
-#define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
 #define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
 
 #define GUC_CTL_FEATURE			2
-- 
2.43.0

