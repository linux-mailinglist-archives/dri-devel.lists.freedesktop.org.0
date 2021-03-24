Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75B2348285
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFA46EA8C;
	Wed, 24 Mar 2021 20:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4B6EA70;
 Wed, 24 Mar 2021 20:05:28 +0000 (UTC)
IronPort-SDR: SiJwnEIcU6ohwjuQve/W6+XOFQD7dKLZzAEjsobeZSgWsQH7FTRMKOpum+3IVEBBbbBWUO1Y0c
 cjPn2u9qJZoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188482325"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="188482325"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 13:05:23 -0700
IronPort-SDR: CmRtjb8Qb1AwAy3oOOCXjX6hSbeU5R0mFfV72Oe17agL7JqAjDElqFskCVNZ+WidytoVWubUh7
 vqoSPU1avB0w==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="391423635"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 13:05:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/gen12: Add recommended hardware tuning value
Date: Wed, 24 Mar 2021 13:04:59 -0700
Message-Id: <20210324200502.1731265-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200502.1731265-1-lucas.demarchi@intel.com>
References: <20210324200502.1731265-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Caz Yokoyama <caz.yokoyama@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Caz Yokoyama <caz.yokoyama@intel.com>

Follow Bspec 31870 to set recommended tuning values for certain GT
register.  These values aren't workarounds per-se, but it's best to
handle them in the same general area of the driver, especially since
there may be real workarounds that update other bits of the same
registers.

At the moment the only value we need to worry about is the
TDS_TIMER setting in FF_MODE2.  This setting was previously
described as "Wa_1604555607" on some platforms, but the spec
tells us that we should continue to program this on all current
gen12 platforms, even those that do not have that WA.

Bspec: 31870

v2: Rephrase some comments to make them clearer (Matt)

Cc: Clinton Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Caz Yokoyama <caz.yokoyama@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 48 ++++++++++++++++-----
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3b4a7da60f0b..2e367f95b989 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -646,9 +646,38 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 	wa_masked_en(wal, GEN9_ROW_CHICKEN4, GEN11_DIS_PICK_2ND_EU);
 }
 
+/*
+ * These settings aren't actually workarounds, but general tuning settings that
+ * need to be programmed on several platforms.
+ */
+static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
+				     struct i915_wa_list *wal)
+{
+	/*
+	 * Although some platforms refer to it as Wa_1604555607, we need to
+	 * program it even on those that don't explicitly list that
+	 * workaround.
+	 *
+	 * Note that the programming of this register is further modified
+	 * according to the FF_MODE2 guidance given by Wa_1608008084:gen12.
+	 * Wa_1608008084 tells us the FF_MODE2 register will return the wrong
+	 * value when read. The default value for this register is zero for all
+	 * fields and there are no bit masks. So instead of doing a RMW we
+	 * should just write TDS timer value. For the same reason read
+	 * verification is ignored.
+	 */
+	wa_add(wal,
+	       FF_MODE2,
+	       FF_MODE2_TDS_TIMER_MASK,
+	       FF_MODE2_TDS_TIMER_128,
+	       0);
+}
+
 static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
 				       struct i915_wa_list *wal)
 {
+	gen12_ctx_gt_tuning_init(engine, wal);
+
 	/*
 	 * Wa_1409142259:tgl
 	 * Wa_1409347922:tgl
@@ -675,19 +704,15 @@ static void tgl_ctx_workarounds_init(struct intel_engine_cs *engine,
 	gen12_ctx_workarounds_init(engine, wal);
 
 	/*
-	 * Wa_1604555607:tgl,rkl
+	 * Wa_16011163337
 	 *
-	 * Note that the implementation of this workaround is further modified
-	 * according to the FF_MODE2 guidance given by Wa_1608008084:gen12.
-	 * FF_MODE2 register will return the wrong value when read. The default
-	 * value for this register is zero for all fields and there are no bit
-	 * masks. So instead of doing a RMW we should just write the GS Timer
-	 * and TDS timer values for Wa_1604555607 and Wa_16011163337.
+	 * Like in gen12_ctx_gt_tuning_init(), read verification is ignored due
+	 * to Wa_1608008084.
 	 */
 	wa_add(wal,
 	       FF_MODE2,
-	       FF_MODE2_GS_TIMER_MASK | FF_MODE2_TDS_TIMER_MASK,
-	       FF_MODE2_GS_TIMER_224  | FF_MODE2_TDS_TIMER_128,
+	       FF_MODE2_GS_TIMER_MASK,
+	       FF_MODE2_GS_TIMER_224,
 	       0);
 }
 
@@ -707,12 +732,13 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
 	/*
 	 * Wa_16011163337
 	 *
-	 * Like in tgl_ctx_workarounds_init(), read verification is ignored due
+	 * Like in gen12_ctx_gt_tuning_init(), read verification is ignored due
 	 * to Wa_1608008084.
 	 */
 	wa_add(wal,
 	       FF_MODE2,
-	       FF_MODE2_GS_TIMER_MASK, FF_MODE2_GS_TIMER_224, 0);
+	       FF_MODE2_GS_TIMER_MASK,
+	       FF_MODE2_GS_TIMER_224, 0);
 }
 
 static void
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
