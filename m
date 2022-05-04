Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2586F51B3B5
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 01:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4427310ECE5;
	Wed,  4 May 2022 23:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A7810EC1E;
 Wed,  4 May 2022 23:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651708042; x=1683244042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wojfAmuD1A3qA6jHhgXsKCgv4ZU5C8ljff0QCRtdtmU=;
 b=MBKA9JUP8ttE0kVyQf5SFUZAAaaMTDeas0VVnXdu1+E+pGG5fi0tjDEw
 4wPaLMCpV37rxr9vUSYETCWEoTz9wA+xq64nywJ0Qar1V83eontkMnwaj
 PeBUOSp4vuM3O50iLOufced2zXM0RUi2bcnxYsuRWqAked2RK2D1lAkqA
 A5C62t4Gdh9AmwIHzOsmdvM9EeX1trbHJsj6J8S8BeRW9GTYHPXVLbjl1
 7/gVyAY3fCFXle9zRRCmWzKDk802VopcDDrWoeB0jODWLrSPiVquxOEk+
 l5Te4OB2Yk81aB8anHWc3gFe30ga931cGVKkQ91HrRdwf6Vs8WepFy04M A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="255404620"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="255404620"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 16:47:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="694400456"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 16:47:21 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/guc: Support programming the EU priority in the
 GuC descriptor
Date: Wed,  4 May 2022 16:46:36 -0700
Message-Id: <20220504234636.2119794-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

In GuC submission mode the EU priority must be updated by the GuC rather
than the driver as the GuC owns the programming of the context descriptor.

Given that the GuC code uses the GuC priorities, we can't use a generic
function using i915 priorities for both execlists and GuC submission.
The existing function has therefore been pushed to the execlists
back-end while a new one has been added for GuC.

v2: correctly use the GuC prio.

Cc: John Harrison <john.c.harrison@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 12 +++++++++-
 drivers/gpu/drm/i915/gt/intel_lrc.h           | 10 ---------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 +++++++++++++++++++
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 86f7a9ac1c394..2b0266cab66b9 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -661,6 +661,16 @@ static inline void execlists_schedule_out(struct i915_request *rq)
 	i915_request_put(rq);
 }
 
+static u32 map_i915_prio_to_lrc_desc_prio(int prio)
+{
+	if (prio > I915_PRIORITY_NORMAL)
+		return GEN12_CTX_PRIORITY_HIGH;
+	else if (prio < I915_PRIORITY_NORMAL)
+		return GEN12_CTX_PRIORITY_LOW;
+	else
+		return GEN12_CTX_PRIORITY_NORMAL;
+}
+
 static u64 execlists_update_context(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
@@ -669,7 +679,7 @@ static u64 execlists_update_context(struct i915_request *rq)
 
 	desc = ce->lrc.desc;
 	if (rq->engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
-		desc |= lrc_desc_priority(rq_prio(rq));
+		desc |= map_i915_prio_to_lrc_desc_prio(rq_prio(rq));
 
 	/*
 	 * WaIdleLiteRestore:bdw,skl
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
index 31be734010db3..a390f0813c8b6 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.h
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
@@ -111,16 +111,6 @@ enum {
 #define XEHP_SW_COUNTER_SHIFT			58
 #define XEHP_SW_COUNTER_WIDTH			6
 
-static inline u32 lrc_desc_priority(int prio)
-{
-	if (prio > I915_PRIORITY_NORMAL)
-		return GEN12_CTX_PRIORITY_HIGH;
-	else if (prio < I915_PRIORITY_NORMAL)
-		return GEN12_CTX_PRIORITY_LOW;
-	else
-		return GEN12_CTX_PRIORITY_NORMAL;
-}
-
 static inline void lrc_runtime_start(struct intel_context *ce)
 {
 	struct intel_context_stats *stats = &ce->stats;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 75291e9846c50..8bf8b6d588d43 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2394,6 +2394,26 @@ static int guc_context_policy_init(struct intel_context *ce, bool loop)
 	return ret;
 }
 
+static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
+{
+	/*
+	 * this matches the mapping we do in map_i915_prio_to_guc_prio()
+	 * (e.g. prio < I915_PRIORITY_NORMAL maps to GUC_CLIENT_PRIORITY_NORMAL)
+	 */
+	switch (prio) {
+	default:
+		MISSING_CASE(prio);
+		fallthrough;
+	case GUC_CLIENT_PRIORITY_KMD_NORMAL:
+		return GEN12_CTX_PRIORITY_NORMAL;
+	case GUC_CLIENT_PRIORITY_NORMAL:
+		return GEN12_CTX_PRIORITY_LOW;
+	case GUC_CLIENT_PRIORITY_HIGH:
+	case GUC_CLIENT_PRIORITY_KMD_HIGH:
+		return GEN12_CTX_PRIORITY_HIGH;
+	}
+}
+
 static void prepare_context_registration_info(struct intel_context *ce,
 					      struct guc_ctxt_registration_info *info)
 {
@@ -2420,6 +2440,8 @@ static void prepare_context_registration_info(struct intel_context *ce,
 	 */
 	info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
 	info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
+	if (engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
+		info->hwlrca_lo |= map_guc_prio_to_lrc_desc_prio(ce->guc_state.prio);
 	info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
 
 	/*
-- 
2.25.1

