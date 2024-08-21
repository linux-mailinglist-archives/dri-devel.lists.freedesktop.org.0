Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0451D959C3B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AA810E8FE;
	Wed, 21 Aug 2024 12:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EooVOQZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183D310E8FD;
 Wed, 21 Aug 2024 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244322; x=1755780322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2usmeWbKV9aExLWLCxw0zFs13mUPJc13Zpybup+IUs=;
 b=EooVOQZwtuDY9ZxwRrrDBcBfnmG/gowkakwUH0DdEfRap3llM5lC/47h
 ww+LIvrCOXrG/dHa4QuD1dfvbKbOZB2U7sysxNm/p7lELTWEUtMpfAGpL
 wDTFZxnkla5JyGMzCerOs2pKRmLPBlG7imxc5YsvOqNVGycjKQTzO2fnS
 tcWEEyYonduJw14wh+25U5bTtwqHrXWhGs8VhxpJwz8aataShs6rCMvWH
 Ss1j4XmWHswBrv+CBh27kGMT2a5KsWr1AskH3QVxpQZSV+sXPMo7pnss0
 yMpuwMETIRhH9iC0tyfMP90YTic8NkANJzjIRW7rxly5DB2DuXyvuMCMG g==;
X-CSE-ConnectionGUID: apcP1y9zSyiHBXAEkzxYhA==
X-CSE-MsgGUID: RzXb5EqSTJCNfSZ+nd64oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40059740"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="40059740"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:21 -0700
X-CSE-ConnectionGUID: oViT/0jUSDaHc6CLeCCe5A==
X-CSE-MsgGUID: vcUo7FBkQsK8FQhtdg4Cyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61052260"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:20 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 11/14] drm/i915/gt: Store active CCS mask
Date: Wed, 21 Aug 2024 14:43:46 +0200
Message-ID: <20240821124349.295259-12-andi.shyti@linux.intel.com>
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

To support upcoming patches, we need to store the current mask
for active CCS engines.

Active engines refer to those exposed to userspace via the UABI
engine list.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 54 ++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  7 +++
 2 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index ed3ad881a89d..45e9280f9bac 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -12,9 +12,10 @@
 static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
 	unsigned long cslices_mask = CCS_MASK(gt);
-	u32 mode_val = 0;
+	unsigned long ccs_mask = gt->ccs.id_mask;
 	/* CCS mode, i.e. number of CCS engines to be enabled */
-	u32 width = 1;
+	u32 width = hweight32(ccs_mask);
+	u32 mode_val = 0;
 	/* CCS engine id, i.e. the engines position in the engine's bitmask */
 	int engine;
 	int cslice;
@@ -57,7 +58,7 @@ static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 	 *   slice 2: ccs2
 	 *   slice 3: ccs3
 	 */
-	engine = __ffs(cslices_mask);
+	engine = __ffs(ccs_mask);
 
 	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
 		if (!(cslices_mask & BIT(cslice))) {
@@ -73,29 +74,58 @@ static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 		mode_val |= XEHP_CCS_MODE_CSLICE(cslice, engine);
 
 		if (!width) {
-			/*
-			 * CCS mode, will be used later to
-			 * reset to a flexible value
-			 */
-			width = 1;
-			engine = __ffs(cslices_mask);
+			/* CCS mode, reset to the initial mode */
+			width = hweight32(ccs_mask);
+			engine = __ffs(ccs_mask);
 			continue;
 		}
 
 		width--;
-		engine = find_next_bit(&cslices_mask, I915_MAX_CCS, engine + 1);
+		engine = find_next_bit(&ccs_mask, I915_MAX_CCS, engine + 1);
 	}
 
 	gt->ccs.mode_reg_val = mode_val;
 }
 
+static void __update_ccs_mask(struct intel_gt *gt, u32 ccs_mode)
+{
+	unsigned long cslices_mask = CCS_MASK(gt);
+	int i;
+
+	/* Mask off all the CCS engines */
+	gt->ccs.id_mask = 0;
+
+	for_each_set_bit(i, &cslices_mask, I915_MAX_CCS) {
+		gt->ccs.id_mask |= BIT(i);
+
+		ccs_mode--;
+		if (!ccs_mode)
+			break;
+	}
+
+	/*
+	 * It's impossible for 'ccs_mode' to be zero at this point.
+	 * This scenario would only occur if the 'ccs_mode' provided by
+	 * the caller exceeded the total number of CCS engines, a condition
+	 * we check before calling the 'update_ccs_mask()' function.
+	 */
+	GEM_BUG_ON(ccs_mode);
+
+	/* Initialize the CCS mode setting */
+	intel_gt_apply_ccs_mode(gt);
+}
+
 void intel_gt_ccs_mode_init(struct intel_gt *gt)
 {
 	if (!IS_DG2(gt->i915))
 		return;
 
-	/* Initialize the CCS mode setting */
-	intel_gt_apply_ccs_mode(gt);
+	/*
+	 * Set CCS balance mode 1 in the ccs_mask.
+	 *
+	 * During init the workaround are not set up yet.
+	 */
+	__update_ccs_mask(gt, 1);
 }
 
 static ssize_t num_cslices_show(struct device *dev,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 71e43071da0b..641be69016e1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -219,6 +219,13 @@ struct intel_gt {
 	 */
 	struct {
 		u32 mode_reg_val;
+
+		/*
+		 * CCS id_mask is the command streamer instance
+		 * exposed to the user. While the CCS_MASK(gt)
+		 * is the available unfused compute slices.
+		 */
+		intel_engine_mask_t id_mask;
 	} ccs;
 
 	/*
-- 
2.45.2

