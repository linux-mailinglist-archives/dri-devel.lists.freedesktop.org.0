Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60604959C2A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFD610E8EE;
	Wed, 21 Aug 2024 12:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuFzLY4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6130310E8EC;
 Wed, 21 Aug 2024 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244273; x=1755780273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YrKtZxB3WtJA+8EOP8lPzPl2frauHQX7GdEMywmof5g=;
 b=LuFzLY4VHGxz7Vw/l2mtQZIewqJuFsxH8XIIY2mMNjEsgVGbzHv75CEF
 pFGFih1ImcHOJAzH6xgJdmuZAfqB8xC/0tdi/mTQ52DfyGv7VWNJw6tX4
 UGVtU/8IOzeCvV4QdgDiuYngMpkxoH3rHPiAvkBoESX9CJtEsNQwErFU/
 ThouU4yKK42qKGmu58gkeAEqOe9aY4wcnuQ2FquyEkZI7aR4u1fCLnn7T
 FJy9NlCTFagqg9hD+BPJFnCpUlcIu13Ym1ezp74XjLfeRdBj9f0WAV5Pi
 W9nHxrQuZfLPaTfaBz6oKjgLEnifpM//eu+pHLBmmeNzeeVcHkYiA97B7 w==;
X-CSE-ConnectionGUID: kiR17oMTT8yYTvYY9OAS9A==
X-CSE-MsgGUID: Uurrise6TDeWpxWSstLaSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33754110"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33754110"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:44:33 -0700
X-CSE-ConnectionGUID: ZECz76lkRHe24fz4TwBaow==
X-CSE-MsgGUID: A0tX2KSCSWKkpchCBg36oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="98554672"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:44:30 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 03/14] drm/i915/gt: Allow the creation of multi-mode CCS
 masks
Date: Wed, 21 Aug 2024 14:43:38 +0200
Message-ID: <20240821124349.295259-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821124349.295259-1-andi.shyti@linux.intel.com>
References: <20240821124349.295259-1-andi.shyti@linux.intel.com>
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

Until now, we have only set CCS mode balancing to 1, which means
that only one compute engine is exposed to the user. The stream
of compute commands submitted to that engine is then shared among
all the dedicated execution units.

This is done by calling the 'intel_gt_apply_ccs_mode(); function.

With this change, the aforementioned function takes an additional
parameter called 'mode' that specifies the desired mode to be set
for the CCS engines balancing. The mode parameter can have the
following values:

 - mode = 0: CCS load balancing mode 1 (1 CCS engine exposed)
 - mode = 1: CCS load balancing mode 2 (2 CCS engines exposed)
 - mode = 3: CCS load balancing mode 4 (4 CCS engines exposed)

This allows us to generate the appropriate register value to be
written to CCS_MODE, configuring how the exposed engine streams
will be submitted to the execution units.

No functional changes are intended yet, as no mode higher than
'0' is currently being set.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 80 +++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h |  2 +-
 2 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index fcd07eb4728b..5ca36985bdd7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -4,35 +4,87 @@
  */
 
 #include "i915_drv.h"
-#include "intel_gt.h"
 #include "intel_gt_ccs_mode.h"
 #include "intel_gt_regs.h"
 
 static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
+	unsigned long cslices_mask = gt->ccs.cslices;
+	u32 mode_val = 0;
+	/* CCS mode, i.e. number of CCS engines to be enabled */
+	u32 width = 1;
+	/* CCS engine id, i.e. the engines position in the engine's bitmask */
+	int engine;
 	int cslice;
-	u32 mode = 0;
-	int first_ccs = __ffs(CCS_MASK(gt));
 
-	/* Build the value for the fixed CCS load balancing */
+	/*
+	 * The mode has two bit dedicated for each engine
+	 * that will be used for the CCS balancing algorithm:
+	 *
+	 *    BIT | CCS slice
+	 *   ------------------
+	 *     0  | CCS slice
+	 *     1  |     0
+	 *   ------------------
+	 *     2  | CCS slice
+	 *     3  |     1
+	 *   ------------------
+	 *     4  | CCS slice
+	 *     5  |     2
+	 *   ------------------
+	 *     6  | CCS slice
+	 *     7  |     3
+	 *   ------------------
+	 *
+	 * When a CCS slice is not available, then we will write 0x7,
+	 * oterwise we will write the user engine id which load will
+	 * be forwarded to that slice.
+	 *
+	 * The possible configurations are:
+	 *
+	 * 1 engine (ccs0):
+	 *   slice 0, 1, 2, 3: ccs0
+	 *
+	 * 2 engines (ccs0, ccs1):
+	 *   slice 0, 2: ccs0
+	 *   slice 1, 3: ccs1
+	 *
+	 * 4 engines (ccs0, ccs1, ccs2, ccs3):
+	 *   slice 0: ccs0
+	 *   slice 1: ccs1
+	 *   slice 2: ccs2
+	 *   slice 3: ccs3
+	 */
+	engine = __ffs(cslices_mask);
+
 	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
-		if (gt->ccs.cslices & BIT(cslice))
+		if (!(cslices_mask & BIT(cslice))) {
 			/*
-			 * If available, assign the cslice
-			 * to the first available engine...
+			 * If not available, mark the slice as unavailable
+			 * and no task will be dispatched here.
 			 */
-			mode |= XEHP_CCS_MODE_CSLICE(cslice, first_ccs);
+			mode_val |= XEHP_CCS_MODE_CSLICE(cslice,
+						     XEHP_CCS_MODE_CSLICE_MASK);
+			continue;
+		}
+
+		mode_val |= XEHP_CCS_MODE_CSLICE(cslice, engine);
 
-		else
+		if (!width) {
 			/*
-			 * ... otherwise, mark the cslice as
-			 * unavailable if no CCS dispatches here
+			 * CCS mode, will be used later to
+			 * reset to a flexible value
 			 */
-			mode |= XEHP_CCS_MODE_CSLICE(cslice,
-						     XEHP_CCS_MODE_CSLICE_MASK);
+			width = 1;
+			engine = __ffs(cslices_mask);
+			continue;
+		}
+
+		width--;
+		engine = find_next_bit(&cslices_mask, I915_MAX_CCS, engine + 1);
 	}
 
-	gt->ccs.mode_reg_val = mode;
+	gt->ccs.mode_reg_val = mode_val;
 }
 
 void intel_gt_ccs_mode_init(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
index 0f2506586a41..4a6763b95a78 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -6,7 +6,7 @@
 #ifndef __INTEL_GT_CCS_MODE_H__
 #define __INTEL_GT_CCS_MODE_H__
 
-struct intel_gt;
+#include "intel_gt.h"
 
 void intel_gt_ccs_mode_init(struct intel_gt *gt);
 
-- 
2.45.2

