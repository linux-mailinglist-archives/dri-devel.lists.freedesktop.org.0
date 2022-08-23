Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A47059ED46
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 22:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990ED10E3CA;
	Tue, 23 Aug 2022 20:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74CD10E2DC;
 Tue, 23 Aug 2022 20:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661286346; x=1692822346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RK/RmtVt7/aU2rvCEuP5iT6sn2er6dfIHbIdiIeR1gU=;
 b=N9IUNleW0Tgb09jwpYLHvLA4nil05qzlonjjI5d2ajFPDxZeCJ6enIiq
 hjJ8nR82eCHTFrj31OvqkyQ06oBE6KzfifXuQ9Gd04t1YeZcP82EdiWFL
 Ar7FPJPXetaaMd3SHgaKKhj5XhZfZIKhe1wekmk3rfX4YcO8XQsnSTgrr
 Q4N4DRtxmKR+JtZzaVKfRQ7jpuQUZeIUnHgEOfPvenw74c0s97w8FTUzz
 iwvBls6rEvGZYLzD9ZbbRLFvEfomIBE6pI0XKFbO/3yctn8EGwoDe4/Lg
 N2HLmE6F50gV/UROFtE2kntTk2ZEPYIRgfAy+alsYluLvnBbOEvFVMiXH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="319840752"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="319840752"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 13:25:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="670189975"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 13:25:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/dg2: Incorporate Wa_16014892111 into DRAW_WATERMARK
 tuning
Date: Tue, 23 Aug 2022 13:24:49 -0700
Message-Id: <20220823202449.83727-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although register tuning settings are generally implemented via the
workaround infrastructure, it turns out that the DRAW_WATERMARK register
is not properly saved/restored by hardware around power events (i.e.,
RC6 entry) so updates to the value cannot be applied in the usual
manner.  New workaround Wa_16014892111 informs us that any tuning
updates to this register must instead be applied via an INDIRECT_CTX
batch buffer.  This will ensure that the necessary value is re-applied
when a context begins running, even if an RC6 entry had wiped the
register back to hardware defaults since the last context ran.

Fixes: 6dc85721df74 ("drm/i915/dg2: Add additional tuning settings")
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6642
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c         | 21 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  2 --
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index eec73c66406c..070cec4ff8a4 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1242,6 +1242,23 @@ dg2_emit_rcs_hang_wabb(const struct intel_context *ce, u32 *cs)
 	return cs;
 }
 
+/*
+ * The bspec's tuning guide asks us to program a vertical watermark value of
+ * 0x3FF.  However this register is not saved/restored properly by the
+ * hardware, so we're required to apply the desired value via INDIRECT_CTX
+ * batch buffer to ensure the value takes effect properly.  All other bits
+ * in this register should remain at 0 (the hardware default).
+ */
+static u32 *
+dg2_emit_draw_watermark_setting(u32 *cs)
+{
+	*cs++ = MI_LOAD_REGISTER_IMM(1);
+	*cs++ = i915_mmio_reg_offset(DRAW_WATERMARK);
+	*cs++ = REG_FIELD_PREP(VERT_WM_VAL, 0x3FF);
+
+	return cs;
+}
+
 static u32 *
 gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
 {
@@ -1263,6 +1280,10 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
 	if (!HAS_FLAT_CCS(ce->engine->i915))
 		cs = gen12_emit_aux_table_inv(cs, GEN12_GFX_CCS_AUX_NV);
 
+	/* Wa_16014892111 */
+	if (IS_DG2(ce->engine->i915))
+		cs = dg2_emit_draw_watermark_setting(cs);
+
 	return cs;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 31e129329fb0..3cdb8294e13f 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2685,8 +2685,6 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
 	if (IS_DG2(i915)) {
 		wa_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
 		wa_write_clr_set(wal, RT_CTRL, STACKID_CTRL, STACKID_CTRL_512);
-		wa_write_clr_set(wal, DRAW_WATERMARK, VERT_WM_VAL,
-				 REG_FIELD_PREP(VERT_WM_VAL, 0x3FF));
 
 		/*
 		 * This is also listed as Wa_22012654132 for certain DG2
-- 
2.37.2

