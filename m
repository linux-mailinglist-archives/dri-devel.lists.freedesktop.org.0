Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D804C99C3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA12D10E8F2;
	Wed,  2 Mar 2022 00:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DC910E8F2;
 Wed,  2 Mar 2022 00:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646180161; x=1677716161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WwlDtpsEN3mdq0aq4w1wHhlU6G7u9lJbzuc0XkqBS1M=;
 b=SvDCjWH85m7PG2KuMIN+ndYdKAGOyCVSrrsmA0cJKGqG+pIKCpFFUJOi
 9+8O20ZV43auhIZB+iqr97yL1PLlY9B9VQZ1GwjZmUNJ8mH3IjYKSdtQa
 OL93gEbz9XZVEittNrIiJf3FKnscd++iFEIFuj23i2/MNGEebWuHsikUe
 RHYlEFmZXAzJu8vI1N5zjFCChXlgILdEH39ZCzFe+yiH7T9rhtjCZwT7C
 0MZb26Ag0Kq2qNhWLpKvVO75e/Vxwe8OjEsFdy4TdsFxpToqz9nSduY3R
 7PuKQ3iPSe5/qxMVqDvItKAL0JYQSZgqsS47pqhPmQIDiTRWM8V66VNRM A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="313992152"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="313992152"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:16:01 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="493324075"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:16:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 08/13] drm/i915/xehp: Enable ccs/dual-ctx in RCU_MODE
Date: Tue,  1 Mar 2022 16:15:54 -0800
Message-Id: <20220302001554.1836066-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301235121.GB25848@unerlige-ril-10.165.21.154>
References: <20220301235121.GB25848@unerlige-ril-10.165.21.154>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have to specify in the Render Control Unit Mode register
when CCS is enabled.

v2:
 - Move RCU_MODE programming to a helper function.  (Tvrtko)
 - Clean up and clarify comments.  (Tvrtko)
 - Add RCU_MODE to the GuC save/restore list.  (Daniele)
v3:
 - Move this patch before the GuC ADS update to enable compute engines;
   the definition of RCU_MODE and its insertion into the save/restore
   list moves to this patch.  (Daniele)
v4:
 - Call xehp_enable_ccs_engines() directly in guc_resume() and
   execlists_resume() rather than adding an extra layer of wrapping to
   the engine->resume() vfunc.  (Umesh)

Bspec: 46034
Original-author: Michel Thierry
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h          |  2 ++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 17 +++++++++++++++++
 .../drm/i915/gt/intel_execlists_submission.c    |  3 +++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h         |  3 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c      |  4 ++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   |  3 +++
 6 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index be4b1e65442f..1c0ab05c3c40 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -265,6 +265,8 @@ intel_engine_create_pinned_context(struct intel_engine_cs *engine,
 
 void intel_engine_destroy_pinned_context(struct intel_context *ce);
 
+void xehp_enable_ccs_engines(struct intel_engine_cs *engine);
+
 #define ENGINE_PHYSICAL	0
 #define ENGINE_MOCK	1
 #define ENGINE_VIRTUAL	2
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 2136c56d3abc..92f4cf9833ee 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2070,6 +2070,23 @@ intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
 	return active;
 }
 
+void xehp_enable_ccs_engines(struct intel_engine_cs *engine)
+{
+	/*
+	 * If there are any non-fused-off CCS engines, we need to enable CCS
+	 * support in the RCU_MODE register.  This only needs to be done once,
+	 * so for simplicity we'll take care of this in the RCS engine's
+	 * resume handler; since the RCS and all CCS engines belong to the
+	 * same reset domain and are reset together, this will also take care
+	 * of re-applying the setting after i915-triggered resets.
+	 */
+	if (!CCS_MASK(engine->gt))
+		return;
+
+	intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
+			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "mock_engine.c"
 #include "selftest_engine.c"
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index c8407cc96c42..3e0c81f06bd0 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2911,6 +2911,9 @@ static int execlists_resume(struct intel_engine_cs *engine)
 
 	enable_execlists(engine);
 
+	if (engine->class == RENDER_CLASS)
+		xehp_enable_ccs_engines(engine);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 84f189738a68..e629443e07ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1327,6 +1327,9 @@
 #define   ECOBITS_PPGTT_CACHE64B		(3 << 8)
 #define   ECOBITS_PPGTT_CACHE4B			(0 << 8)
 
+#define GEN12_RCU_MODE				_MMIO(0x14800)
+#define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
+
 #define CHV_FUSE_GT				_MMIO(VLV_DISPLAY_BASE + 0x2168)
 #define   CHV_FGT_DISABLE_SS0			(1 << 10)
 #define   CHV_FGT_DISABLE_SS1			(1 << 11)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 847e00390b00..29fbe4681ca7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -335,6 +335,10 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
 	ret |= GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
 
+	if (engine->class == RENDER_CLASS &&
+	    CCS_MASK(engine->gt))
+		ret |= GUC_MMIO_REG_ADD(regset, GEN12_RCU_MODE, true);
+
 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
 		ret |= GUC_MMIO_REG_ADD(regset, wa->reg, wa->masked_reg);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 891b98236155..65690d4b2266 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3595,6 +3595,9 @@ static int guc_resume(struct intel_engine_cs *engine)
 	setup_hwsp(engine);
 	start_engine(engine);
 
+	if (engine->class == RENDER_CLASS)
+		xehp_enable_ccs_engines(engine);
+
 	return 0;
 }
 
-- 
2.34.1

