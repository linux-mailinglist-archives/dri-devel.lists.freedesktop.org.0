Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F301861D9F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 21:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D8D10EACA;
	Fri, 23 Feb 2024 20:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SttAeFjv";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E843F10EACA;
 Fri, 23 Feb 2024 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708720255; x=1740256255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=szZycaVJIU8w/Cp5brPZOyXHNxXhb+Zbgub+8Z471zA=;
 b=SttAeFjvc+MCAGjBenFUgKkDoGbYUPxM371E+NHOgW/IGCh25rITul9r
 IwRKJXPTe+/Vd0AiuhGvdhoqC/WA7iOS1uOcZxLlkJA64z/tnqoD1B9sp
 ES/odHaFw7/6UNfAleqMzfYYC2ESJoYIfE0RVCeU2vqeAz24FivAFYma9
 qP0PVEgqlraoajI9z/GNaSOyhf7yNpFksioJxv2YNn70j7VwS3pmEUfSC
 LA32cawcODKbIRj1ZtQmr5aypdj3TB6i9F78tr+FQUjttUTbXWhQcr4nz
 ZiusYoCRqyl4GFuaCRp5E22D3GeTfKsJcs0/6h7wYIN3Pa10KhLFaRDcH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2943677"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2943677"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 12:30:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="10789274"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 23 Feb 2024 12:30:54 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/i915/guc: Simplify/extend platform check for
 Wa_14018913170
Date: Fri, 23 Feb 2024 12:28:45 -0800
Message-ID: <20240223202846.1532176-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The above w/a is required for every platform that the i915 driver
supports. It is fixed on the latest platforms but they are only
supported by Xe instead of i915. So just remove the platform check
completely and keep the code simple.

v2: Add extra comment (review feedback from Rodrigo).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2b450c43bbd7f..d2b7425bbdcc2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -319,10 +319,12 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 	if (!RCS_MASK(gt))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
-	/* Wa_14018913170 */
+	/*
+	 * Wa_14018913170: Applicable to all platforms supported by i915 so
+	 * don't bother testing for all X/Y/Z platforms explicitly.
+	 */
 	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 7, 0)) {
-		if (IS_DG2(gt->i915) || IS_METEORLAKE(gt->i915) || IS_PONTEVECCHIO(gt->i915))
-			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
+		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 	}
 
 	return flags;
-- 
2.43.0

