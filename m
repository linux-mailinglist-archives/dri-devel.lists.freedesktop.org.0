Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FDB87407D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556C71134A4;
	Wed,  6 Mar 2024 19:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfbaZ5kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7542A1134A4;
 Wed,  6 Mar 2024 19:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709753782; x=1741289782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A3MTxbK4Y0EgrJ1gDlz2/i5mZqjkkt6ZsFYG535ABlA=;
 b=GfbaZ5kk47es8XbuxS1tBZ+BR68S/5QSa3BxuNLo9lwDu7Zkjdv6regr
 xEG7uJ4tzPlK4DBAN7nkcFbZuF6SZYcVsYMeFQuLxC4gPFfOmY8QqRWJz
 LfNhUKFUt6ggHnB5sK6k1dq7g3pxxNWdzora47T6OpeJhXtwPPaEgMWzJ
 FQi8EbzTYiGvioWUkv3nHjEiE7fRw88R/6gqpE4kfNhL2CZYw49+8/w/k
 a59Zc4ADcAeRIhb2mvRvKVIhcUv3aKbvABg8JZOWWmAb7iyGcAw9i70QH
 9Oj0DyVMpeors9xwxSt7tTAe1Ydh+l8KCv8BvDnCIB8MdfR6M5TwB89Xc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4246871"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4246871"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:36:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9841801"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:36:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/5] drm/i915: Drop WA 16015675438
Date: Wed,  6 Mar 2024 11:36:39 -0800
Message-ID: <20240306193643.1897026-2-lucas.demarchi@intel.com>
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

With dynamic load-balancing disabled on the compute side, there's no
reason left to enable WA 16015675438. Drop it from both PVC and DG2.
Note that this can be done because now the driver always set a fixed
partition of EUs during initialization via the ccs_mode configuration.

The flag to GuC is still needed because of 18020744125, so update
the comment accordingly.

Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 +-----
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index d67d44611c28..7f812409c30a 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2928,14 +2928,10 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
 	}
 
-	if (IS_PONTEVECCHIO(i915) || IS_DG2(i915)) {
+	if (IS_PONTEVECCHIO(i915) || IS_DG2(i915))
 		/* Wa_14015227452:dg2,pvc */
 		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE);
 
-		/* Wa_16015675438:dg2,pvc */
-		wa_masked_en(wal, FF_SLICE_CS_CHICKEN2, GEN12_PERF_FIX_BALANCING_CFE_DISABLE);
-	}
-
 	if (IS_DG2(i915)) {
 		/*
 		 * Wa_16011620976:dg2_g11
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index d2b7425bbdcc..c6603793af89 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -315,7 +315,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 	if (IS_DG2_G11(gt->i915))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
-	/* Wa_16015675438 */
+	/* Wa_18020744125 */
 	if (!RCS_MASK(gt))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
-- 
2.43.0

