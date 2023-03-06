Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAD16ACF85
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 21:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB65610E241;
	Mon,  6 Mar 2023 20:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B8510E233;
 Mon,  6 Mar 2023 20:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678135820; x=1709671820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ooHw4yZNO6MOLf7e1yiQ8wJN+YuLMBg0dV2Qp6y9lSU=;
 b=USQr7hDfoRGTRbA/bL1zyqIATh19UV7O+5JhmB7Pel/7/tv2xa8i7ZNy
 fssfHIYZV//MWDUIZ8Cfec+3Mo6+1HBdSoO70xPp+RqZzxNtm9zwhPINs
 4UR35tP/RXKY/2cmhdqL22lGsHtwqTk+blYl1X3/0uZ6/hmvGZqw2bzJA
 yMCtZWgV2s40oc3J3HZEVFsdEaDLvoJELWUDIjXU+Hx2Df/zmiOPxjzi2
 vAe84ZejyZDpgO1WQOAjzWgEX0Bt4OnBYHZpux9F6KKqT4HqxhHLbtdnm
 4jxdG+jdHj3PyM6jLMFQ+TNtuGHs2onEndC5eBiLhl2bC3Gh5Hdyqecq9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319499960"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="319499960"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669615311"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="669615311"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:50:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Move DG2 tuning to the right function
Date: Mon,  6 Mar 2023 12:49:53 -0800
Message-Id: <20230306204954.753739-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230306204954.753739-1-lucas.demarchi@intel.com>
References: <20230306204954.753739-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use gt_tuning_settings() for the recommended tunings rather than the one
for workarounds.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index eb6cc4867d67..389bfcd299af 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1653,13 +1653,6 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	/* Wa_14014830051:dg2 */
 	wa_mcr_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
 
-	/*
-	 * The following are not actually "workarounds" but rather
-	 * recommended tuning settings documented in the bspec's
-	 * performance guide section.
-	 */
-	wa_mcr_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
-
 	/* Wa_14015795083 */
 	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
 
@@ -1752,8 +1745,10 @@ static void gt_tuning_settings(struct intel_gt *gt, struct i915_wa_list *wal)
 		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
 	}
 
-	if (IS_DG2(gt->i915))
+	if (IS_DG2(gt->i915)) {
 		wa_mcr_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
+		wa_mcr_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
+	}
 }
 
 static void
-- 
2.39.0

