Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1745AF8A7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 01:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D724E10E105;
	Tue,  6 Sep 2022 23:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C9310E098;
 Tue,  6 Sep 2022 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662508187; x=1694044187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gx1g/bJxfXXLcWi5G/O65Z1VuWmCk9iDmou8Sp3Wlfg=;
 b=kSfqpTx6SVpDjNfGbwxvG0oYdKLCCZTmMcJAJP7mlvy4ybz1e4PzMR74
 JXvcDnUQIA19a+bUEGO3hB4hNDN0sgMU448HNY7kRuNY4wsDDmUacemS9
 stGZHFSL2h+4nxFOAfPh+0Qg+9bhzmXuNGiaAvwabqUp6zojDkJuz04dv
 avvklIj8vyiRF28aNHiffrvPlxUIi8z/NpBYhjllkhaYr7MqVtZaMiLt5
 9ldsOCFcf5o8vQuSeEJE1NPZyNPKaGpQ9letwvAXBAbsamhMtI7yzu9DT
 dAyqQSFwwj4my5Cek6qjXt2gHFJv+JMPQub08MUazK7/LUuv1VrnJNb2G g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276477215"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="276477215"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="675920337"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 11/14] drm/i915/mtl: Add gsi_offset when emitting aux table
 invalidation
Date: Tue,  6 Sep 2022 16:49:31 -0700
Message-Id: <20220906234934.3655440-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906234934.3655440-1-matthew.d.roper@intel.com>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The aux table invalidation registers are a bit unique --- they're
engine-centric registers that reside in the GSI register space rather
than within the engines' regular MMIO ranges.  That means that when
issuing invalidation on engines in the standalone media GT, the GSI
offset must be added to the regular MMIO offset for the invalidation
registers.

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 15 ++++++++++-----
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 ++-
 drivers/gpu/drm/i915/gt/intel_lrc.c      |  9 ++++++---
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 98645797962f..e49fa6fa6aee 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -165,10 +165,12 @@ static u32 preparser_disable(bool state)
 	return MI_ARB_CHECK | 1 << 8 | state;
 }
 
-u32 *gen12_emit_aux_table_inv(u32 *cs, const i915_reg_t inv_reg)
+u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
 {
+	u32 gsi_offset = gt->uncore->gsi_offset;
+
 	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
-	*cs++ = i915_mmio_reg_offset(inv_reg);
+	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
 	*cs++ = AUX_INV;
 	*cs++ = MI_NOOP;
 
@@ -254,7 +256,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		if (!HAS_FLAT_CCS(rq->engine->i915)) {
 			/* hsdes: 1809175790 */
-			cs = gen12_emit_aux_table_inv(cs, GEN12_GFX_CCS_AUX_NV);
+			cs = gen12_emit_aux_table_inv(rq->engine->gt,
+						      cs, GEN12_GFX_CCS_AUX_NV);
 		}
 
 		*cs++ = preparser_disable(false);
@@ -313,9 +316,11 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 
 	if (aux_inv) { /* hsdes: 1809175790 */
 		if (rq->engine->class == VIDEO_DECODE_CLASS)
-			cs = gen12_emit_aux_table_inv(cs, GEN12_VD0_AUX_NV);
+			cs = gen12_emit_aux_table_inv(rq->engine->gt,
+						      cs, GEN12_VD0_AUX_NV);
 		else
-			cs = gen12_emit_aux_table_inv(cs, GEN12_VE0_AUX_NV);
+			cs = gen12_emit_aux_table_inv(rq->engine->gt,
+						      cs, GEN12_VE0_AUX_NV);
 	}
 
 	if (mode & EMIT_INVALIDATE)
diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
index 32e3d2b831bb..e4d24c811dd6 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
@@ -13,6 +13,7 @@
 #include "intel_gt_regs.h"
 #include "intel_gpu_commands.h"
 
+struct intel_gt;
 struct i915_request;
 
 int gen8_emit_flush_rcs(struct i915_request *rq, u32 mode);
@@ -45,7 +46,7 @@ u32 *gen8_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
 u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
 u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
 
-u32 *gen12_emit_aux_table_inv(u32 *cs, const i915_reg_t inv_reg);
+u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg);
 
 static inline u32 *
 __gen8_emit_pipe_control(u32 *batch, u32 flags0, u32 flags1, u32 offset)
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 070cec4ff8a4..08214683e130 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1278,7 +1278,8 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
 
 	/* hsdes: 1809175790 */
 	if (!HAS_FLAT_CCS(ce->engine->i915))
-		cs = gen12_emit_aux_table_inv(cs, GEN12_GFX_CCS_AUX_NV);
+		cs = gen12_emit_aux_table_inv(ce->engine->gt,
+					      cs, GEN12_GFX_CCS_AUX_NV);
 
 	/* Wa_16014892111 */
 	if (IS_DG2(ce->engine->i915))
@@ -1304,9 +1305,11 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
 	/* hsdes: 1809175790 */
 	if (!HAS_FLAT_CCS(ce->engine->i915)) {
 		if (ce->engine->class == VIDEO_DECODE_CLASS)
-			cs = gen12_emit_aux_table_inv(cs, GEN12_VD0_AUX_NV);
+			cs = gen12_emit_aux_table_inv(ce->engine->gt,
+						      cs, GEN12_VD0_AUX_NV);
 		else if (ce->engine->class == VIDEO_ENHANCEMENT_CLASS)
-			cs = gen12_emit_aux_table_inv(cs, GEN12_VE0_AUX_NV);
+			cs = gen12_emit_aux_table_inv(ce->engine->gt,
+						      cs, GEN12_VE0_AUX_NV);
 	}
 
 	return cs;
-- 
2.37.2

