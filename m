Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D0064C0C3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 00:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC64B10E37B;
	Tue, 13 Dec 2022 23:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DAE10E377;
 Tue, 13 Dec 2022 23:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670974895; x=1702510895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gXr5hdftXSwTe8HYtWAX09BmtGpQEaMwG752pf1xvfQ=;
 b=DNlxfOkLqPAzo3qYDMLBzLc2vW3fddgJtdW5IlCET76ZMoPFpsnk3pjx
 5E2SEbiyAik5vXrwiDcJndZAfNjqcw44rT5/a90A8iOCeKp4igcBfs58C
 u/jPYXwM92dEfQ2UXYGOscuRXHlhqZtWSmNnWNj1GRYWbl7b9OuvCymi+
 rjB77OCTEfWhMKE855oFefBvh7BAiuWlvXVIIAlvktKbmEmLU5EPUGnHM
 WbwMP3m2JOacd30ZYQhlUs350AHPWODlUDQHsanhvWJWc/nL35l/4edSJ
 O01zjw42EEYm3MFeq8zJD4kBQVEstyKndmWz1GqcfnLtzClMOxQ1dQmUg A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="319407332"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="319407332"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 15:41:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="823072950"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="823072950"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 15:41:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/dg2: Return Wa_22012654132 to just specific steppings
Date: Tue, 13 Dec 2022 15:41:19 -0800
Message-Id: <20221213234119.2963317-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
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

Programming of the ENABLE_PREFETCH_INTO_IC bit originally showed up in
both the general DG2 tuning guide (applicable to all DG2
variants/steppings) and under Wa_22012654132 (applicable only to
specific steppings).  It has now been removed from the tuning guide, and
the guidance is to only program it in the specific steppings associated
with the workaround.

Bspec: 68331
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 27 ++++++++++-----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 7d71f5bbddc8..bf84efb3f15f 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2913,20 +2913,6 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
 	if (IS_DG2(i915)) {
 		wa_mcr_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
 		wa_mcr_write_clr_set(wal, RT_CTRL, STACKID_CTRL, STACKID_CTRL_512);
-
-		/*
-		 * This is also listed as Wa_22012654132 for certain DG2
-		 * steppings, but the tuning setting programming is a superset
-		 * since it applies to all DG2 variants and steppings.
-		 *
-		 * Note that register 0xE420 is write-only and cannot be read
-		 * back for verification on DG2 (due to Wa_14012342262), so
-		 * we need to explicitly skip the readback.
-		 */
-		wa_mcr_add(wal, GEN10_CACHE_MODE_SS, 0,
-			   _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
-			   0 /* write-only, so skip validation */,
-			   true);
 	}
 
 	/*
@@ -3022,6 +3008,19 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		/* Wa_18017747507:dg2 */
 		wa_masked_en(wal, VFG_PREEMPTION_CHICKEN, POLYGON_TRIFAN_LINELOOP_DISABLE);
 	}
+
+	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_C0) || IS_DG2_G11(i915))
+		/*
+		 * Wa_22012654132
+		 *
+		 * Note that register 0xE420 is write-only and cannot be read
+		 * back for verification on DG2 (due to Wa_14012342262), so
+		 * we need to explicitly skip the readback.
+		 */
+		wa_mcr_add(wal, GEN10_CACHE_MODE_SS, 0,
+			   _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
+			   0 /* write-only, so skip validation */,
+			   true);
 }
 
 static void
-- 
2.38.1

