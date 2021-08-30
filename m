Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558E3FBD12
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 21:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADEB89D30;
	Mon, 30 Aug 2021 19:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7488889C80;
 Mon, 30 Aug 2021 19:38:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="198577491"
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; d="scan'208";a="198577491"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 12:38:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; d="scan'208";a="540706036"
Received: from unerlige-ril-10.jf.intel.com ([10.165.21.208])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 12:38:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, jason@jlekstrand.net
Subject: [PATCH 6/8] drm/i915/perf: Whitelist OA report trigger registers
Date: Mon, 30 Aug 2021 12:38:49 -0700
Message-Id: <20210830193851.15607-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830193851.15607-1-umesh.nerlige.ramappa@intel.com>
References: <20210830193851.15607-1-umesh.nerlige.ramappa@intel.com>
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

OA reports can be triggered into the OA buffer by writing into the
OAREPORTTRIG registers. Whitelist the registers to allow non-privileged
user to trigger reports.

Whitelist registers only if perf_stream_paranoid is set to 0. In
i915_perf_open_ioctl, this setting is checked and the whitelist is
enabled accordingly. On closing the perf fd, the whitelist is removed.

This ensures that the access to the whitelist is gated by
perf_stream_paranoid.

v2:
- Move related change to this patch (Lionel)
- Bump up perf revision (Lionel)

v3: Pardon whitelisted registers for selftest (Umesh)
v4: Document supported gens for the feature (Lionel)
v5: Whitelist registers only if perf_stream_paranoid is set to 0 (Jon)
v6: Move oa whitelist array to i915_perf (Chris)
v7: Fix OA writing beyond the wal->list memory (CI)
v8: Protect write to engine whitelist registers

v9: (Umesh)
- Use uncore->lock to protect write to forcepriv regs
- In case wal->count falls to zero on _wa_remove, make sure you still
  clear the registers. Remove wal->count check when applying whitelist.

v10: (Umesh)
- Split patches modifying intel_workarounds
- On some platforms there are no whitelisted regs. intel_engine_resume
  applies whitelist on these platforms too and the wal->count gates such
  platforms. Bring back the wal->count check.
- intel_engine_allow/deny_user_register_access modifies the engine
  whitelist and the wal->count. Use uncore->lock to serialize it with
  intel_engine_apply_whitelist.
- Grow the wal->list when adding whitelist registers after driver load.

v11:
- Fix memory leak in _wa_list_grow (Chris)
- Serialize kfree with engine resume using uncore->lock (Umesh)
- Grow the list only if wal->count is not aligned (Umesh)

Signed-off-by: Piotr Maciejewski <piotr.maciejewski@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/gpu/drm/i915/i915_perf.c       | 79 +++++++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_perf_types.h |  8 +++
 drivers/gpu/drm/i915/i915_reg.h        | 12 ++--
 3 files changed, 92 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 3ded6e7d8526..30f5025b2ff6 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1364,12 +1364,56 @@ free_noa_wait(struct i915_perf_stream *stream)
 	i915_vma_unpin_and_release(&stream->noa_wait, 0);
 }
 
+static const i915_reg_t gen9_oa_wl_regs[] = {
+	{ __OAREPORTTRIG2 | RING_FORCE_TO_NONPRIV_ACCESS_RW },
+	{ __OAREPORTTRIG6 | RING_FORCE_TO_NONPRIV_ACCESS_RW },
+};
+
+static const i915_reg_t gen12_oa_wl_regs[] = {
+	{ __GEN12_OAG_OAREPORTTRIG2 | RING_FORCE_TO_NONPRIV_ACCESS_RW },
+	{ __GEN12_OAG_OAREPORTTRIG6 | RING_FORCE_TO_NONPRIV_ACCESS_RW },
+};
+
+static int intel_engine_apply_oa_whitelist(struct i915_perf_stream *stream)
+{
+	struct intel_engine_cs *engine = stream->engine;
+	int ret;
+
+	if (i915_perf_stream_paranoid ||
+	    !(stream->sample_flags & SAMPLE_OA_REPORT) ||
+	    !stream->perf->oa_wl)
+		return 0;
+
+	ret = intel_engine_allow_user_register_access(engine,
+						      stream->perf->oa_wl,
+						      stream->perf->num_oa_wl);
+	if (ret < 0)
+		return ret;
+
+	stream->oa_whitelisted = true;
+	return 0;
+}
+
+static void intel_engine_remove_oa_whitelist(struct i915_perf_stream *stream)
+{
+	struct intel_engine_cs *engine = stream->engine;
+
+	if (!stream->oa_whitelisted)
+		return;
+
+	intel_engine_deny_user_register_access(engine,
+					       stream->perf->oa_wl,
+					       stream->perf->num_oa_wl);
+}
+
 static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
 {
 	struct i915_perf *perf = stream->perf;
 
 	BUG_ON(stream != perf->exclusive_stream);
 
+	intel_engine_remove_oa_whitelist(stream);
+
 	/*
 	 * Unset exclusive_stream first, it will be checked while disabling
 	 * the metric set on gen8+.
@@ -1465,7 +1509,8 @@ static void gen8_init_oa_buffer(struct i915_perf_stream *stream)
 	 *  bit."
 	 */
 	intel_uncore_write(uncore, GEN8_OABUFFER, gtt_offset |
-		   OABUFFER_SIZE_16M | GEN8_OABUFFER_MEM_SELECT_GGTT);
+			   OABUFFER_SIZE_16M | GEN8_OABUFFER_MEM_SELECT_GGTT |
+			   GEN7_OABUFFER_EDGE_TRIGGER);
 	intel_uncore_write(uncore, GEN8_OATAILPTR, gtt_offset & GEN8_OATAILPTR_MASK);
 
 	/* Mark that we need updated tail pointers to read from... */
@@ -1518,7 +1563,8 @@ static void gen12_init_oa_buffer(struct i915_perf_stream *stream)
 	 *  bit."
 	 */
 	intel_uncore_write(uncore, GEN12_OAG_OABUFFER, gtt_offset |
-			   OABUFFER_SIZE_16M | GEN8_OABUFFER_MEM_SELECT_GGTT);
+			   OABUFFER_SIZE_16M | GEN8_OABUFFER_MEM_SELECT_GGTT |
+			   GEN7_OABUFFER_EDGE_TRIGGER);
 	intel_uncore_write(uncore, GEN12_OAG_OATAILPTR,
 			   gtt_offset & GEN12_OAG_OATAILPTR_MASK);
 
@@ -3530,6 +3576,20 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
 	if (!(param->flags & I915_PERF_FLAG_DISABLED))
 		i915_perf_enable_locked(stream);
 
+	/*
+	 * OA whitelist allows non-privileged access to some OA counters for
+	 * triggering reports into the OA buffer. This is only allowed if
+	 * perf_stream_paranoid is set to 0 by the sysadmin.
+	 *
+	 * We want to make sure this is almost the last thing we do before
+	 * returning the stream fd. If we do end up checking for errors in code
+	 * that follows this, we MUST call intel_engine_remove_oa_whitelist in
+	 * the error handling path to remove the whitelisted registers.
+	 */
+	ret = intel_engine_apply_oa_whitelist(stream);
+	if (ret < 0)
+		goto err_flags;
+
 	/* Take a reference on the driver that will be kept with stream_fd
 	 * until its release.
 	 */
@@ -4410,6 +4470,8 @@ void i915_perf_init(struct drm_i915_private *i915)
 				perf->ctx_flexeu0_offset = 0x3de;
 
 				perf->gen8_valid_ctx_bit = BIT(16);
+				perf->oa_wl = gen9_oa_wl_regs;
+				perf->num_oa_wl = ARRAY_SIZE(gen9_oa_wl_regs);
 			}
 		} else if (GRAPHICS_VER(i915) == 11) {
 			perf->ops.is_valid_b_counter_reg =
@@ -4428,6 +4490,9 @@ void i915_perf_init(struct drm_i915_private *i915)
 			perf->ctx_oactxctrl_offset = 0x124;
 			perf->ctx_flexeu0_offset = 0x78e;
 
+			perf->oa_wl = gen9_oa_wl_regs;
+			perf->num_oa_wl = ARRAY_SIZE(gen9_oa_wl_regs);
+
 			perf->gen8_valid_ctx_bit = BIT(16);
 		} else if (GRAPHICS_VER(i915) == 12) {
 			perf->ops.is_valid_b_counter_reg =
@@ -4445,6 +4510,9 @@ void i915_perf_init(struct drm_i915_private *i915)
 
 			perf->ctx_flexeu0_offset = 0;
 			perf->ctx_oactxctrl_offset = 0x144;
+
+			perf->oa_wl = gen12_oa_wl_regs;
+			perf->num_oa_wl = ARRAY_SIZE(gen12_oa_wl_regs);
 		}
 	}
 
@@ -4550,8 +4618,13 @@ int i915_perf_ioctl_version(void)
 	 *
 	 * 5: Add DRM_I915_PERF_PROP_POLL_OA_PERIOD parameter that controls the
 	 *    interval for the hrtimer used to check for OA data.
+	 *
+	 * 6: Whitelist OATRIGGER registers to allow user to trigger reports
+	 *    into the OA buffer. This applies only to gen8+. The feature can
+	 *    only be accessed if perf_stream_paranoid is set to 0 by privileged
+	 *    user.
 	 */
-	return 5;
+	return 6;
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
diff --git a/drivers/gpu/drm/i915/i915_perf_types.h b/drivers/gpu/drm/i915/i915_perf_types.h
index aa14354a5120..f5d3eece70d8 100644
--- a/drivers/gpu/drm/i915/i915_perf_types.h
+++ b/drivers/gpu/drm/i915/i915_perf_types.h
@@ -312,6 +312,11 @@ struct i915_perf_stream {
 	 * buffer should be checked for available data.
 	 */
 	u64 poll_oa_period;
+
+	/**
+	 * @oa_whitelisted: Indicates that the oa registers are whitelisted.
+	 */
+	bool oa_whitelisted;
 };
 
 /**
@@ -432,6 +437,9 @@ struct i915_perf {
 	u32 ctx_oactxctrl_offset;
 	u32 ctx_flexeu0_offset;
 
+	const i915_reg_t *oa_wl;
+	unsigned int num_oa_wl;
+
 	/**
 	 * The RPT_ID/reason field for Gen8+ includes a bit
 	 * to determine if the CTX ID in the report is valid
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 77ece19bda7e..c5c6adbe5b6f 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -894,7 +894,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define OAREPORTTRIG1_THRESHOLD_MASK 0xffff
 #define OAREPORTTRIG1_EDGE_LEVEL_TRIGGER_SELECT_MASK 0xffff0000 /* 0=level */
 
-#define OAREPORTTRIG2 _MMIO(0x2744)
+#define __OAREPORTTRIG2 0x2744
+#define OAREPORTTRIG2 _MMIO(__OAREPORTTRIG2)
 #define OAREPORTTRIG2_INVERT_A_0  (1 << 0)
 #define OAREPORTTRIG2_INVERT_A_1  (1 << 1)
 #define OAREPORTTRIG2_INVERT_A_2  (1 << 2)
@@ -947,7 +948,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define OAREPORTTRIG5_THRESHOLD_MASK 0xffff
 #define OAREPORTTRIG5_EDGE_LEVEL_TRIGGER_SELECT_MASK 0xffff0000 /* 0=level */
 
-#define OAREPORTTRIG6 _MMIO(0x2754)
+#define __OAREPORTTRIG6 0x2754
+#define OAREPORTTRIG6 _MMIO(__OAREPORTTRIG6)
 #define OAREPORTTRIG6_INVERT_A_0  (1 << 0)
 #define OAREPORTTRIG6_INVERT_A_1  (1 << 1)
 #define OAREPORTTRIG6_INVERT_A_2  (1 << 2)
@@ -1008,11 +1010,13 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 
 /* Same layout as OAREPORTTRIGX */
 #define GEN12_OAG_OAREPORTTRIG1 _MMIO(0xd920)
-#define GEN12_OAG_OAREPORTTRIG2 _MMIO(0xd924)
+#define __GEN12_OAG_OAREPORTTRIG2 0xd924
+#define GEN12_OAG_OAREPORTTRIG2 _MMIO(__GEN12_OAG_OAREPORTTRIG2)
 #define GEN12_OAG_OAREPORTTRIG3 _MMIO(0xd928)
 #define GEN12_OAG_OAREPORTTRIG4 _MMIO(0xd92c)
 #define GEN12_OAG_OAREPORTTRIG5 _MMIO(0xd930)
-#define GEN12_OAG_OAREPORTTRIG6 _MMIO(0xd934)
+#define __GEN12_OAG_OAREPORTTRIG6 0xd934
+#define GEN12_OAG_OAREPORTTRIG6 _MMIO(__GEN12_OAG_OAREPORTTRIG6)
 #define GEN12_OAG_OAREPORTTRIG7 _MMIO(0xd938)
 #define GEN12_OAG_OAREPORTTRIG8 _MMIO(0xd93c)
 
-- 
2.20.1

