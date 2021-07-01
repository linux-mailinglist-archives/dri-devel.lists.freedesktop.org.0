Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9EB3B979E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4526EC64;
	Thu,  1 Jul 2021 20:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A5A6EC22;
 Thu,  1 Jul 2021 20:25:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436158"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436158"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564440"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/53] drm/i915/xehp: Handle new device context ID format
Date: Thu,  1 Jul 2021 13:23:46 -0700
Message-Id: <20210701202427.1547543-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 "Robert M . Fosha" <robert.m.fosha@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

Xe_HP changes the format of the context ID from past platforms.

Cc: Robert M. Fosha <robert.m.fosha@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 74 ++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  8 ++
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |  2 +
 drivers/gpu/drm/i915/i915_perf.c              | 29 +++++---
 drivers/gpu/drm/i915/i915_reg.h               |  5 ++
 5 files changed, 97 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 15ba0d83151a..3a9d99a69ed4 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -153,6 +153,12 @@
 #define GEN12_CSB_CTX_VALID(csb_dw) \
 	(FIELD_GET(GEN12_CSB_SW_CTX_ID_MASK, csb_dw) != GEN12_IDLE_CTX_ID)
 
+#define XEHP_CTX_STATUS_SWITCHED_TO_NEW_QUEUE	BIT(1) /* upper csb dword */
+#define XEHP_CSB_SW_CTX_ID_MASK			GENMASK(31, 10)
+#define XEHP_IDLE_CTX_ID			0xFFFF
+#define XEHP_CSB_CTX_VALID(csb_dw) \
+	(FIELD_GET(XEHP_CSB_SW_CTX_ID_MASK, csb_dw) != XEHP_IDLE_CTX_ID)
+
 /* Typical size of the average request (2 pipecontrols and a MI_BB) */
 #define EXECLISTS_REQUEST_SIZE 64 /* bytes */
 
@@ -490,6 +496,16 @@ __execlists_schedule_in(struct i915_request *rq)
 		/* Use a fixed tag for OA and friends */
 		GEM_BUG_ON(ce->tag <= BITS_PER_LONG);
 		ce->lrc.ccid = ce->tag;
+	} else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50)) {
+		/* We don't need a strict matching tag, just different values */
+		unsigned int tag = ffs(READ_ONCE(engine->context_tag));
+
+		GEM_BUG_ON(tag == 0 || tag >= BITS_PER_LONG);
+		clear_bit(tag - 1, &engine->context_tag);
+		ce->lrc.ccid = tag << (XEHP_SW_CTX_ID_SHIFT - 32);
+
+		BUILD_BUG_ON(BITS_PER_LONG > GEN12_MAX_CONTEXT_HW_ID);
+
 	} else {
 		/* We don't need a strict matching tag, just different values */
 		unsigned int tag = __ffs(engine->context_tag);
@@ -600,8 +616,14 @@ static void __execlists_schedule_out(struct i915_request * const rq,
 		intel_engine_add_retire(engine, ce->timeline);
 
 	ccid = ce->lrc.ccid;
-	ccid >>= GEN11_SW_CTX_ID_SHIFT - 32;
-	ccid &= GEN12_MAX_CONTEXT_HW_ID;
+	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50)) {
+		ccid >>= XEHP_SW_CTX_ID_SHIFT - 32;
+		ccid &= XEHP_MAX_CONTEXT_HW_ID;
+	} else {
+		ccid >>= GEN11_SW_CTX_ID_SHIFT - 32;
+		ccid &= GEN12_MAX_CONTEXT_HW_ID;
+	}
+
 	if (ccid < BITS_PER_LONG) {
 		GEM_BUG_ON(ccid == 0);
 		GEM_BUG_ON(test_bit(ccid - 1, &engine->context_tag));
@@ -1660,13 +1682,24 @@ static void invalidate_csb_entries(const u64 *first, const u64 *last)
  *     bits 44-46: reserved
  *     bits 47-57: sw context id of the lrc the GT switched away from
  *     bits 58-63: sw counter of the lrc the GT switched away from
+ *
+ * Xe_HP csb shuffles things around compared to TGL:
+ *
+ *     bits 0-3:   context switch detail (same possible values as TGL)
+ *     bits 4-9:   engine instance
+ *     bits 10-25: sw context id of the lrc the GT switched to
+ *     bits 26-31: sw counter of the lrc the GT switched to
+ *     bit  32:    semaphore wait mode (poll or signal), Only valid when
+ *                 switch detail is set to "wait on semaphore"
+ *     bit  33:    switched to new queue
+ *     bits 34-41: wait detail (for switch detail 1 to 4)
+ *     bits 42-57: sw context id of the lrc the GT switched away from
+ *     bits 58-63: sw counter of the lrc the GT switched away from
  */
-static bool gen12_csb_parse(const u64 csb)
+static inline bool
+__gen12_csb_parse(bool ctx_to_valid, bool ctx_away_valid, bool new_queue,
+		  u8 switch_detail)
 {
-	bool ctx_away_valid = GEN12_CSB_CTX_VALID(upper_32_bits(csb));
-	bool new_queue =
-		lower_32_bits(csb) & GEN12_CTX_STATUS_SWITCHED_TO_NEW_QUEUE;
-
 	/*
 	 * The context switch detail is not guaranteed to be 5 when a preemption
 	 * occurs, so we can't just check for that. The check below works for
@@ -1675,7 +1708,7 @@ static bool gen12_csb_parse(const u64 csb)
 	 * would require some extra handling, but we don't support that.
 	 */
 	if (!ctx_away_valid || new_queue) {
-		GEM_BUG_ON(!GEN12_CSB_CTX_VALID(lower_32_bits(csb)));
+		GEM_BUG_ON(!ctx_to_valid);
 		return true;
 	}
 
@@ -1684,10 +1717,26 @@ static bool gen12_csb_parse(const u64 csb)
 	 * context switch on an unsuccessful wait instruction since we always
 	 * use polling mode.
 	 */
-	GEM_BUG_ON(GEN12_CTX_SWITCH_DETAIL(upper_32_bits(csb)));
+	GEM_BUG_ON(switch_detail);
 	return false;
 }
 
+static bool xehp_csb_parse(const u64 csb)
+{
+	return __gen12_csb_parse(XEHP_CSB_CTX_VALID(lower_32_bits(csb)), /* cxt to */
+				 XEHP_CSB_CTX_VALID(upper_32_bits(csb)), /* cxt away */
+				 upper_32_bits(csb) & XEHP_CTX_STATUS_SWITCHED_TO_NEW_QUEUE,
+				 GEN12_CTX_SWITCH_DETAIL(lower_32_bits(csb)));
+}
+
+static bool gen12_csb_parse(const u64 csb)
+{
+	return __gen12_csb_parse(GEN12_CSB_CTX_VALID(lower_32_bits(csb)), /* cxt to */
+				 GEN12_CSB_CTX_VALID(upper_32_bits(csb)), /* cxt away */
+				 lower_32_bits(csb) & GEN12_CTX_STATUS_SWITCHED_TO_NEW_QUEUE,
+				 GEN12_CTX_SWITCH_DETAIL(upper_32_bits(csb)));
+}
+
 static bool gen8_csb_parse(const u64 csb)
 {
 	return csb & (GEN8_CTX_STATUS_IDLE_ACTIVE | GEN8_CTX_STATUS_PREEMPTED);
@@ -1852,7 +1901,9 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 		ENGINE_TRACE(engine, "csb[%d]: status=0x%08x:0x%08x\n",
 			     head, upper_32_bits(csb), lower_32_bits(csb));
 
-		if (GRAPHICS_VER(engine->i915) >= 12)
+		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
+			promote = xehp_csb_parse(csb);
+		else if (GRAPHICS_VER(engine->i915) >= 12)
 			promote = gen12_csb_parse(csb);
 		else
 			promote = gen8_csb_parse(csb);
@@ -3339,7 +3390,8 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 		execlists->csb_size = GEN11_CSB_ENTRIES;
 
 	engine->context_tag = GENMASK(BITS_PER_LONG - 2, 0);
-	if (GRAPHICS_VER(engine->i915) >= 11) {
+	if (GRAPHICS_VER(engine->i915) >= 11 &&
+	    GRAPHICS_VER_FULL(engine->i915) < IP_VER(12, 50)) {
 		execlists->ccid |= engine->instance << (GEN11_ENGINE_INSTANCE_SHIFT - 32);
 		execlists->ccid |= engine->class << (GEN11_ENGINE_CLASS_SHIFT - 32);
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index a27bac0a4bfb..e1c80e2c06d8 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1101,6 +1101,14 @@ setup_indirect_ctx_bb(const struct intel_context *ce,
  *      bits 55-60:    SW counter
  *      bits 61-63:    engine class
  *
+ * On Xe_HP, the upper dword of the descriptor has a new format:
+ *
+ *      bits 32-37:    virtual function number
+ *      bit 38:        mbz, reserved for use by hardware
+ *      bits 39-54:    SW context ID
+ *      bits 55-57:    reserved
+ *      bits 58-63:    SW counter
+ *
  * engine info, SW context ID and SW counter need to form a unique number
  * (Context ID) per lrc.
  */
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc_reg.h b/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
index 41e5350a7a05..9548f4ade068 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
+++ b/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
@@ -91,5 +91,7 @@
 #define GEN11_MAX_CONTEXT_HW_ID	(1 << 11) /* exclusive */
 /* in Gen12 ID 0x7FF is reserved to indicate idle */
 #define GEN12_MAX_CONTEXT_HW_ID	(GEN11_MAX_CONTEXT_HW_ID - 1)
+/* in Xe_HP ID 0xFFFF is reserved to indicate "invalid context" */
+#define XEHP_MAX_CONTEXT_HW_ID	0xFFFF
 
 #endif /* _INTEL_LRC_REG_H_ */
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 9f94914958c3..1f8bf00526a1 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1284,17 +1284,26 @@ static int oa_get_render_ctx_id(struct i915_perf_stream *stream)
 		break;
 
 	case 11:
-	case 12: {
-		stream->specific_ctx_id_mask =
-			((1U << GEN11_SW_CTX_ID_WIDTH) - 1) << (GEN11_SW_CTX_ID_SHIFT - 32);
-		/*
-		 * Pick an unused context id
-		 * 0 - BITS_PER_LONG are used by other contexts
-		 * GEN12_MAX_CONTEXT_HW_ID (0x7ff) is used by idle context
-		 */
-		stream->specific_ctx_id = (GEN12_MAX_CONTEXT_HW_ID - 1) << (GEN11_SW_CTX_ID_SHIFT - 32);
+	case 12:
+		if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 50)) {
+			stream->specific_ctx_id_mask =
+				((1U << XEHP_SW_CTX_ID_WIDTH) - 1) <<
+				(XEHP_SW_CTX_ID_SHIFT - 32);
+			stream->specific_ctx_id =
+				(XEHP_MAX_CONTEXT_HW_ID - 1) <<
+				(XEHP_SW_CTX_ID_SHIFT - 32);
+		} else {
+			stream->specific_ctx_id_mask =
+				((1U << GEN11_SW_CTX_ID_WIDTH) - 1) << (GEN11_SW_CTX_ID_SHIFT - 32);
+			/*
+			 * Pick an unused context id
+			 * 0 - BITS_PER_LONG are used by other contexts
+			 * GEN12_MAX_CONTEXT_HW_ID (0x7ff) is used by idle context
+			 */
+			stream->specific_ctx_id =
+				(GEN12_MAX_CONTEXT_HW_ID - 1) << (GEN11_SW_CTX_ID_SHIFT - 32);
+		}
 		break;
-	}
 
 	default:
 		MISSING_CASE(GRAPHICS_VER(ce->engine->i915));
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index dbc233442dd0..c361a8f30531 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4172,6 +4172,11 @@ enum {
 #define GEN11_ENGINE_INSTANCE_SHIFT 48
 #define GEN11_ENGINE_INSTANCE_WIDTH 6
 
+#define XEHP_SW_CTX_ID_SHIFT 39
+#define XEHP_SW_CTX_ID_WIDTH 16
+#define XEHP_SW_COUNTER_SHIFT 58
+#define XEHP_SW_COUNTER_WIDTH 6
+
 #define CHV_CLK_CTL1			_MMIO(0x101100)
 #define VLV_CLK_CTL2			_MMIO(0x101104)
 #define   CLK_CTL2_CZCOUNT_30NS_SHIFT	28
-- 
2.25.4

