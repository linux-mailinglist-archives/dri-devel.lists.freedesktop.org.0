Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F001A6DB94
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615BD10E40D;
	Mon, 24 Mar 2025 13:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtpKV+pq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560F810E40D;
 Mon, 24 Mar 2025 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823094; x=1774359094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LSvA/nYeQYQDFfLKkSLmeL1x6jSmZ45+uQHxVbxVrZg=;
 b=WtpKV+pqB7yRXoFrDHPn5OOxLZVtNZLmNnTmFMu5jX//u19S6zKoU2su
 BSnP+w+jx4hAjNPakK5lVzXzllWoxBe+I0dnBEjCP2ECdpG/XnRNCkofc
 28uLGwsRgWxu4z+0g9b9k+Rg/Ng6dKzxBcHOaDpYPAyKKfmFVtlSGWMQ2
 TK8aiW8n65xuY+ZNerkYzuqgjLp5zpZTSevroB6STiTrX8AUh1+UA/WSv
 VzChDt+OkScU8/FuAFr6gkTPpZxAsDwhRGzgG99wzS8/eh6UTD9EAX9p/
 zHRguH4EXjfADaux3FSvtdD1/gcv3wL83EHjmC3tIe8+zmkm9fdexHBOk w==;
X-CSE-ConnectionGUID: GFZD3scKT9Sj9Bb2v5viJQ==
X-CSE-MsgGUID: S6BJP5SCSMyJn7dPoDQIWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55024726"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55024726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:34 -0700
X-CSE-ConnectionGUID: 9AWnqDW/Rd2a76ZaRwjOUQ==
X-CSE-MsgGUID: rY0IKRb5T9eYBcxhteUS6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="155060126"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:30 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 11/15] drm/i915/gt: Store active CCS mask
Date: Mon, 24 Mar 2025 14:29:47 +0100
Message-ID: <20250324132952.1075209-12-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 41 +++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  7 ++++
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index edb6a4b63826..5eead7b18f57 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -12,6 +12,7 @@
 static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
 	unsigned long cslices_mask = CCS_MASK(gt);
+	unsigned long ccs_mask = gt->ccs.id_mask;
 	u32 mode_val = 0;
 	/* CCS engine id, i.e. the engines position in the engine's bitmask */
 	int engine;
@@ -55,7 +56,7 @@ static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 	 *   slice 2: ccs2
 	 *   slice 3: ccs3
 	 */
-	engine = __ffs(cslices_mask);
+	engine = __ffs(ccs_mask);
 
 	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
 		if (!(cslices_mask & BIT(cslice))) {
@@ -86,7 +87,7 @@ static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 			 * CCS mode, will be used later to
 			 * reset to a flexible value
 			 */
-			engine = __ffs(cslices_mask);
+			engine = __ffs(ccs_mask);
 			continue;
 		}
 	}
@@ -94,13 +95,45 @@ static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
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
2.47.2

