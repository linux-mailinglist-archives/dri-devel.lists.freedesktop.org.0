Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AB899FD00
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 02:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72E810E635;
	Wed, 16 Oct 2024 00:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCCMpqYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A49310E00F;
 Wed, 16 Oct 2024 00:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729037822; x=1760573822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8aoPLgiYOqe/8/eEaszdggE5cvTQvCHR8hzaE195mlE=;
 b=OCCMpqYMRpeZjpMve5Z8oSwsq9vPc4OXo9QNB5yTI97G1xMPjBqwJsNw
 7GpZ7foLBBiXJkTeZpsV6PWBLhZ7pHxDFc1ENnhPLkZ/waNoT1vP0zDR6
 AK8lLuYCAnSy8uOD9hhPf5MeiYVgvsNVMzwkxsDE31U/V0vl60Dv9/HLj
 IswfCuOd8MQ1zE7u0wZCVVai2MuyzvlVFI8A7cboWhiULcw3SDJFnFE6t
 bsqGc+XC1QMKRpfD8XbySczqFYrZgg50zkdzG+4PalklibBgpPSlISd1M
 6eONdwwTE12LsmS+CdipQw03axECxjctP/6cESQuECbF7Fu5CrJK9polY A==;
X-CSE-ConnectionGUID: 5TGnWLz3QEKJ0ayaHQIl3g==
X-CSE-MsgGUID: rsUdmsSCQsG/viEaUOt76g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45941003"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="45941003"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 17:17:01 -0700
X-CSE-ConnectionGUID: mxYkziOdQ42tLW9/l1wtjg==
X-CSE-MsgGUID: fhVsNEpUSDO8pYiCas0B0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="101371133"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa002.fm.intel.com with ESMTP; 15 Oct 2024 17:17:00 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v5 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Date: Tue, 15 Oct 2024 17:16:58 -0700
Message-Id: <20241016001658.2671225-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add missing tag for "Wa_14019159160 - Case 2" (for existing
PXP code that ensures run alone mode bit is set to allow
PxP-decryption.

 v5: - remove the max IP_VER check since new platforms that
       i915 supports needs this fix and tag the caller too
       (John Harrison).
 v4: - Include IP_VER 12.71. (Matt Roper)
 v3: - Check targeted platforms using IP_VAL. (John Harrison)
 v2: - Fix WA id number (John Harrison).
     - Improve comments and code to be specific
       for the targeted platforms (John Harrison)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7bd5d2c29056..51847a846002 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -820,8 +820,10 @@ static bool ctx_needs_runalone(const struct intel_context *ce)
 	bool ctx_is_protected = false;
 
 	/*
-	 * On MTL and newer platforms, protected contexts require setting
-	 * the LRC run-alone bit or else the encryption will not happen.
+	 * Wa_14019159160 - Case 2.
+	 * On some platforms, protected contexts require setting
+	 * the LRC run-alone bit or else the encryption/decryption will not happen.
+	 * NOTE: Case 2 only applies to PXP use-case of said workaround.
 	 */
 	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
 	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
@@ -850,6 +852,7 @@ static void init_common_regs(u32 * const regs,
 	if (GRAPHICS_VER(engine->i915) < 11)
 		ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT |
 					   CTX_CTRL_RS_CTX_ENABLE);
+	/* Wa_14019159160 - Case 2.*/
 	if (ctx_needs_runalone(ce))
 		ctl |= _MASKED_BIT_ENABLE(GEN12_CTX_CTRL_RUNALONE_MODE);
 	regs[CTX_CONTEXT_CONTROL] = ctl;

base-commit: 01c7b2c084e5c84313f382734c10945b9aa49823
-- 
2.34.1

