Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762298247EE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 19:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A0210E4F9;
	Thu,  4 Jan 2024 18:03:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D2F10E4C6;
 Thu,  4 Jan 2024 18:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704391431; x=1735927431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6wvKEc/axy0jN26hrGljWmYX27vGiI60bbJsKZRdkI=;
 b=ah4F81RNWkIzRbzFr4dhCTqrL69T+C0a8T5Cz3l/0sBlVQloJgnm+/6d
 quQECl1f1hD9YDIhRw5SWIHxLFRJUwsPBF5GXO7YV7AyUYvZl17OmDpiX
 Vsyjf9U/uGd3kdShRns9DoRNofxQv6q72dQv3OjReIl4ScIMzNgG7W8Ij
 CFfUXqGo6k1rkrVYnHKKUyUwa4z+UrGmmmYrifNxIN8ORrADXWckTnyrQ
 dujIFOl85mOHzfK1Ri3L/ZBt8Sg1k7XccSRMDM67lwIx9cwaYvlSF+SGw
 JAlCBmCO88vZGQrgfOggIZ9LpHepamzm+MSEVmtzUVaJkRn8QnuZnlm0B Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4430223"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4430223"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 10:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="850894359"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="850894359"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2024 10:03:49 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 3/3] drm/i915/guc: Enable Wa_14019159160
Date: Thu,  4 Jan 2024 10:05:41 -0800
Message-ID: <20240104180541.2966374-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240104180541.2966374-1-John.C.Harrison@Intel.com>
References: <20240104180541.2966374-1-John.C.Harrison@Intel.com>
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
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Use the new w/a KLV support to enable a MTL w/a. Note, this w/a is a
super-set of Wa_16019325821, so requires turning that one as well as
setting the new flag for Wa_14019159160 itself.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  3 ++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  7 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 34 ++++++++++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  1 +
 6 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 9cccd60a5c41d..359b21fb02ab2 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -744,6 +744,7 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
 
 /* Wa_14014475959:dg2 */
 /* Wa_16019325821 */
+/* Wa_14019159160 */
 #define HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET	0x540
 static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
 {
@@ -753,6 +754,7 @@ static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
 
 /* Wa_14014475959:dg2 */
 /* Wa_16019325821 */
+/* Wa_14019159160 */
 static u32 *hold_switchout_emit_wa_busywait(struct i915_request *rq, u32 *cs)
 {
 	int i;
@@ -793,6 +795,7 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
 
 	/* Wa_14014475959:dg2 */
 	/* Wa_16019325821 */
+	/* Wa_14019159160 */
 	if (intel_engine_uses_wa_hold_switchout(rq->engine))
 		cs = hold_switchout_emit_wa_busywait(rq, cs);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index b519812ba120d..ba55c059063db 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -697,6 +697,7 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
 
 /* Wa_14014475959:dg2 */
 /* Wa_16019325821 */
+/* Wa_14019159160 */
 static inline bool
 intel_engine_uses_wa_hold_switchout(struct intel_engine_cs *engine)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
index 58012edd4eb0e..bebf28e3c4794 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
@@ -101,4 +101,11 @@ enum {
 	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
 };
 
+/*
+ * Workaround keys:
+ */
+enum {
+	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
+};
+
 #endif /* _ABI_GUC_KLVS_ABI_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index d5c856be31491..db3cb628f40dc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -295,6 +295,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
 	/* Wa_16019325821 */
+	/* Wa_14019159160 */
 	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
 		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 6af3fa8b92e34..68d9e277eca8b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -815,6 +815,25 @@ guc_capture_prep_lists(struct intel_guc *guc)
 	return PAGE_ALIGN(total_size);
 }
 
+/* Wa_14019159160 */
+static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
+{
+	u32 size;
+	u32 klv_entry[] = {
+		/* 16:16 key/length */
+		FIELD_PREP(GUC_KLV_0_KEY, GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
+		FIELD_PREP(GUC_KLV_0_LEN, 0),
+		/* 0 dwords data */
+	};
+
+	size = sizeof(klv_entry);
+	GEM_BUG_ON(remain < size);
+
+	iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
+
+	return size;
+}
+
 static void guc_waklv_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -830,15 +849,12 @@ static void guc_waklv_init(struct intel_guc *guc)
 	offset = guc_ads_waklv_offset(guc);
 	remain = guc_ads_waklv_size(guc);
 
-	/*
-	 * Add workarounds here:
-	 *
-	 * if (want_wa_<name>) {
-	 *	size = guc_waklv_<name>(guc, offset, remain);
-	 *	offset += size;
-	 *	remain -= size;
-	 * }
-	 */
+	/* Wa_14019159160 */
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
+		size = guc_waklv_ra_mode(guc, offset, remain);
+		offset += size;
+		remain -= size;
+	}
 
 	size = guc_ads_waklv_size(guc) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b09b97c9cd120..80da3573706fa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4385,6 +4385,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 			engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
 
 	/* Wa_16019325821 */
+	/* Wa_14019159160 */
 	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
 	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
 		engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
-- 
2.41.0

