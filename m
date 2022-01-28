Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D24A0064
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACA910E64A;
	Fri, 28 Jan 2022 18:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DDF10E5CB;
 Fri, 28 Jan 2022 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643395932; x=1674931932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PzzBi2+LB1Na/jfOueySihbt7n2cABn4KoK4T5UK9d0=;
 b=FnU42RD76ABGPpLJDZ7/Z+ByKxDh7seEE4h84OreJYz5laADwkw8jw0n
 +RA4zgYMIO8YIIfiEiMCld9yofBbXwvdS6eG9sUMx1W1WTb1JXz1RKck5
 lu0/ojMAg6zBUgE5IzSILK7k/zGDZ4R2Ppq5l8ammv9vYWNwMYj63ZBO4
 XkHCJwT5koVdrOVkazFKtP/f+uTyTC4pczmOB6w3GrDyIMIiD/v42CLR6
 QmzLwHbRdymO1zUl/COyK7/y8vO7w+JH0x/GzVy1+7uOreHbaXVTjjeSP
 jH+NFY31bsB53Jo5y2MWMpPXpHyc891+BWj4hMPlBNfZ0UDfg2YO64sSA Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="310490186"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="310490186"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="625718024"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:08 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/i915/dg2: Add Wa_22011450934
Date: Sat, 29 Jan 2022 00:22:05 +0530
Message-Id: <20220128185209.18077-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220128185209.18077-1-ramalingam.c@intel.com>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An indirect ctx wabb is implemented as per Wa_22011450934 to avoid rcs
restore hang during context restore of a preempted context in GPGPU mode

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Chris Wilson <chris.p.wilson@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h     |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 89a95a125fc8..8440f4b0f613 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1165,6 +1165,29 @@ gen12_emit_cmd_buf_wa(const struct intel_context *ce, u32 *cs)
 	return cs;
 }
 
+/*
+ * On DG2 during context restore of a preempted context in GPGPU mode,
+ * RCS restore hang is detected. This is extremely timing dependent.
+ * To address this below sw wabb is implemented for DG2 A steppings.
+ */
+static u32 *
+dg2_emit_rcs_hang_wabb(const struct intel_context *ce, u32 *cs)
+{
+	*cs++ = MI_LOAD_REGISTER_IMM(1);
+	*cs++ = i915_mmio_reg_offset(GEN12_STATE_ACK_DEBUG);
+	*cs++ = 0x21;
+
+	*cs++ = MI_LOAD_REGISTER_REG;
+	*cs++ = i915_mmio_reg_offset(RING_NOPID(ce->engine->mmio_base));
+	*cs++ = i915_mmio_reg_offset(GEN12_CULLBIT1);
+
+	*cs++ = MI_LOAD_REGISTER_REG;
+	*cs++ = i915_mmio_reg_offset(RING_NOPID(ce->engine->mmio_base));
+	*cs++ = i915_mmio_reg_offset(GEN12_CULLBIT2);
+
+	return cs;
+}
+
 static u32 *
 gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
 {
@@ -1172,6 +1195,11 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
 	cs = gen12_emit_cmd_buf_wa(ce, cs);
 	cs = gen12_emit_restore_scratch(ce, cs);
 
+	/* Wa_22011450934:dg2 */
+	if (IS_DG2_GRAPHICS_STEP(ce->engine->i915, G10, STEP_A0, STEP_B0) ||
+	    IS_DG2_GRAPHICS_STEP(ce->engine->i915, G11, STEP_A0, STEP_B0))
+		cs = dg2_emit_rcs_hang_wabb(ce, cs);
+
 	/* Wa_16013000631:dg2 */
 	if (IS_DG2_GRAPHICS_STEP(ce->engine->i915, G10, STEP_B0, STEP_C0) ||
 	    IS_DG2_G11(ce->engine->i915))
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index ec48406eb37a..3f94f4b5ef6c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -12026,4 +12026,8 @@ enum skl_power_gate {
 #define SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731C)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
 
+#define GEN12_CULLBIT1			_MMIO(0x6100)
+#define GEN12_CULLBIT2			_MMIO(0x7030)
+#define GEN12_STATE_ACK_DEBUG		_MMIO(0x20BC)
+
 #endif /* _I915_REG_H_ */
-- 
2.20.1

