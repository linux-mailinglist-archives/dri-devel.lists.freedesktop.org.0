Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951433FBD0B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 21:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6018089CB5;
	Mon, 30 Aug 2021 19:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9913889C1A;
 Mon, 30 Aug 2021 19:38:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="198577492"
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; d="scan'208";a="198577492"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 12:38:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; d="scan'208";a="540706042"
Received: from unerlige-ril-10.jf.intel.com ([10.165.21.208])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 12:38:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, jason@jlekstrand.net
Subject: [PATCH 7/8] drm/i915/perf: Whitelist OA counter and buffer registers
Date: Mon, 30 Aug 2021 12:38:50 -0700
Message-Id: <20210830193851.15607-8-umesh.nerlige.ramappa@intel.com>
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

It is useful to have markers in the OA reports to identify triggered
reports. Whitelist some OA counters that can be used as markers.

A triggered report can be found faster if we can sample the HW tail and
head registers when the report was triggered. Whitelist OA buffer
specific registers.

v2:
- Bump up the perf revision (Lionel)
- Use indexing for counters (Lionel)
- Fix selftest for oa ticking register (Umesh)

v3: Pardon whitelisted registers for selftest (Umesh)

v4:
- Document whitelisted registers (Lionel)
- Fix live isolated whitelist for OA regs (Umesh)

v5:
- Free up whitelist slots. Remove GPU_TICKS and A20 counter (Piotr)
- Whitelist registers only if perf_stream_paranoid is set to 0 (Jon)

v6: Move oa whitelist array to i915_perf (Chris)

Signed-off-by: Piotr Maciejewski <piotr.maciejewski@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 18 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_reg.h  | 16 ++++++++++++++--
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 30f5025b2ff6..de3d1738aabe 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1367,11 +1367,19 @@ free_noa_wait(struct i915_perf_stream *stream)
 static const i915_reg_t gen9_oa_wl_regs[] = {
 	{ __OAREPORTTRIG2 | RING_FORCE_TO_NONPRIV_ACCESS_RW },
 	{ __OAREPORTTRIG6 | RING_FORCE_TO_NONPRIV_ACCESS_RW },
+	{ __OA_PERF_COUNTER_A(18) | (RING_FORCE_TO_NONPRIV_ACCESS_RW |
+				     RING_FORCE_TO_NONPRIV_RANGE_4) },
+	{ __GEN8_OASTATUS | (RING_FORCE_TO_NONPRIV_ACCESS_RD |
+			     RING_FORCE_TO_NONPRIV_RANGE_4) },
 };
 
 static const i915_reg_t gen12_oa_wl_regs[] = {
 	{ __GEN12_OAG_OAREPORTTRIG2 | RING_FORCE_TO_NONPRIV_ACCESS_RW },
 	{ __GEN12_OAG_OAREPORTTRIG6 | RING_FORCE_TO_NONPRIV_ACCESS_RW },
+	{ __GEN12_OAG_PERF_COUNTER_A(18) | (RING_FORCE_TO_NONPRIV_ACCESS_RW |
+					    RING_FORCE_TO_NONPRIV_RANGE_4) },
+	{ __GEN12_OAG_OASTATUS | (RING_FORCE_TO_NONPRIV_ACCESS_RD |
+				  RING_FORCE_TO_NONPRIV_RANGE_4) },
 };
 
 static int intel_engine_apply_oa_whitelist(struct i915_perf_stream *stream)
@@ -4623,8 +4631,16 @@ int i915_perf_ioctl_version(void)
 	 *    into the OA buffer. This applies only to gen8+. The feature can
 	 *    only be accessed if perf_stream_paranoid is set to 0 by privileged
 	 *    user.
+	 *
+	 * 7: Whitelist below OA registers for user to identify the location of
+	 *    triggered reports in the OA buffer. This applies only to gen8+.
+	 *    The feature can only be accessed if perf_stream_paranoid is set to
+	 *    0 by privileged user.
+	 *
+	 *    - OA buffer head/tail/status/buffer registers for read only
+	 *    - OA counters A18, A19, A20 for read/write
 	 */
-	return 6;
+	return 7;
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c5c6adbe5b6f..b4c6bfc33a18 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -695,7 +695,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define  GEN7_OASTATUS2_HEAD_MASK           0xffffffc0
 #define  GEN7_OASTATUS2_MEM_SELECT_GGTT     (1 << 0) /* 0: PPGTT, 1: GGTT */
 
-#define GEN8_OASTATUS _MMIO(0x2b08)
+#define __GEN8_OASTATUS 0x2b08
+#define GEN8_OASTATUS _MMIO(__GEN8_OASTATUS)
 #define  GEN8_OASTATUS_TAIL_POINTER_WRAP    (1 << 17)
 #define  GEN8_OASTATUS_HEAD_POINTER_WRAP    (1 << 16)
 #define  GEN8_OASTATUS_OVERRUN_STATUS	    (1 << 3)
@@ -755,7 +756,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define  GEN12_OAG_OA_DEBUG_DISABLE_GO_1_0_REPORTS     (1 << 2)
 #define  GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS (1 << 1)
 
-#define GEN12_OAG_OASTATUS _MMIO(0xdafc)
+#define __GEN12_OAG_OASTATUS 0xdafc
+#define GEN12_OAG_OASTATUS _MMIO(__GEN12_OAG_OASTATUS)
 #define  GEN12_OAG_OASTATUS_COUNTER_OVERFLOW (1 << 2)
 #define  GEN12_OAG_OASTATUS_BUFFER_OVERFLOW  (1 << 1)
 #define  GEN12_OAG_OASTATUS_REPORT_LOST      (1 << 0)
@@ -998,6 +1000,16 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define OAREPORTTRIG8_NOA_SELECT_6_SHIFT    24
 #define OAREPORTTRIG8_NOA_SELECT_7_SHIFT    28
 
+/* Performance counters registers */
+#define __OA_PERF_COUNTER_A(idx)	(0x2800 + 8 * (idx))
+#define OA_PERF_COUNTER_A(idx)		_MMIO(__OA_PERF_COUNTER_A(idx))
+#define OA_PERF_COUNTER_A_UDW(idx)		_MMIO(__OA_PERF_COUNTER_A(idx) + 4)
+
+/* Gen12 Performance counters registers */
+#define __GEN12_OAG_PERF_COUNTER_A(idx)	(0xD980 + 8 * (idx))
+#define GEN12_OAG_PERF_COUNTER_A(idx)	_MMIO(__GEN12_OAG_PERF_COUNTER_A(idx))
+#define GEN12_OAG_PERF_COUNTER_A_UDW(idx) _MMIO(__GEN12_OAG_PERF_COUNTER_A(idx) + 4)
+
 /* Same layout as OASTARTTRIGX */
 #define GEN12_OAG_OASTARTTRIG1 _MMIO(0xd900)
 #define GEN12_OAG_OASTARTTRIG2 _MMIO(0xd904)
-- 
2.20.1

