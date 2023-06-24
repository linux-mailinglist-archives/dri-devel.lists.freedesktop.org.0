Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AEA73CBFF
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 19:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA5010E07D;
	Sat, 24 Jun 2023 17:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AE210E009;
 Sat, 24 Jun 2023 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687627080; x=1719163080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c30KrreN7/GB/ngoSIdSdI0DuqnFwW6/O3MZAv+wURU=;
 b=ZD8aLHkY2/wxtyENNdHV3VFTeGKe4XbCT08oNE1mPSCkh597ewCa8TNB
 R/ozGNR5iCqqPp//cN2J/yn5EsncweHoxjP5VjnnWHllAKm1mpOG0XbCM
 8LBgIT0ceWXthoZkbJy1gKhKANbHj2N3I6y01qFchxcnj8m/t+Cogon4P
 iGkfPX+KA48H4NOV7HKNYpOEif+62vMr8dPyQvNzwifZqmS+MTa3sghbt
 A0JiZl3me/8zVqMrszVhuAEzz5cYIg87ECO0UkDH/VphiNRDBHAWoq4f7
 J5+MjnYWhc9FwK8Y0cii5M9BqmlbVOR9yfgEVVYhvBxUlB1p5jUrayDcB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="340557470"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="340557470"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="1045977418"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="1045977418"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:17:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/i915/gt: Clear all bits from GEN12_FF_MODE2
Date: Sat, 24 Jun 2023 10:17:53 -0700
Message-Id: <20230624171757.3906095-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230624171757.3906095-1-lucas.demarchi@intel.com>
References: <20230624171757.3906095-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now context workarounds don't do a rmw and instead only write to
the register. Since 2 separate programmings to the same register are
coalesced into a single write, this is not problematic for
GEN12_FF_MODE2 since both TDS and GS timer are going to be written
together and the other remaining bits be zeroed.

However in order to fix other workarounds that may want to preserve the
unrelated bits in the same register, context workarounds need to
be changed to a rmw. To prepare for that, move the programming of
GEN12_FF_MODE2 to a single place so the value passed for "clear" can
be all the bits. Otherwise the second workaround would be dropped as
it'd be detected as overwriting a previously programmed workaround.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 51 +++++++--------------
 1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 8f8346df3c18..7d48bd57b6ef 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -693,40 +693,11 @@ static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
 		   0, false);
 }
 
-/*
- * These settings aren't actually workarounds, but general tuning settings that
- * need to be programmed on several platforms.
- */
-static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
-				     struct i915_wa_list *wal)
-{
-	/*
-	 * Although some platforms refer to it as Wa_1604555607, we need to
-	 * program it even on those that don't explicitly list that
-	 * workaround.
-	 *
-	 * Note that the programming of this register is further modified
-	 * according to the FF_MODE2 guidance given by Wa_1608008084:gen12.
-	 * Wa_1608008084 tells us the FF_MODE2 register will return the wrong
-	 * value when read. The default value for this register is zero for all
-	 * fields and there are no bit masks. So instead of doing a RMW we
-	 * should just write TDS timer value. For the same reason read
-	 * verification is ignored.
-	 */
-	wa_add(wal,
-	       GEN12_FF_MODE2,
-	       FF_MODE2_TDS_TIMER_MASK,
-	       FF_MODE2_TDS_TIMER_128,
-	       0, false);
-}
-
 static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
 				       struct i915_wa_list *wal)
 {
 	struct drm_i915_private *i915 = engine->i915;
 
-	gen12_ctx_gt_tuning_init(engine, wal);
-
 	/*
 	 * Wa_1409142259:tgl,dg1,adl-p
 	 * Wa_1409347922:tgl,dg1,adl-p
@@ -748,15 +719,27 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
 			    GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL);
 
 	/*
-	 * Wa_16011163337
+	 * Wa_16011163337 - GS_TIMER
+	 *
+	 * TDS_TIMER: Although some platforms refer to it as Wa_1604555607, we
+	 * need to program it even on those that don't explicitly list that
+	 * workaround.
+	 *
+	 * Note that the programming of GEN12_FF_MODE2 is further modified
+	 * according to the FF_MODE2 guidance given by Wa_1608008084.
+	 * Wa_1608008084 tells us the FF_MODE2 register will return the wrong
+	 * value when read from the CPU.
 	 *
-	 * Like in gen12_ctx_gt_tuning_init(), read verification is ignored due
-	 * to Wa_1608008084.
+	 * The default value for this register is zero for all fields.
+	 * So instead of doing a RMW we should just write the desired values
+	 * for TDS and GS timers. Note that since the readback can't be trusted,
+	 * the clear mask is just set to ~0 to make sure other bits are not
+	 * inadvertently set. For the same reason read verification is ignored.
 	 */
 	wa_add(wal,
 	       GEN12_FF_MODE2,
-	       FF_MODE2_GS_TIMER_MASK,
-	       FF_MODE2_GS_TIMER_224,
+	       ~0,
+	       FF_MODE2_TDS_TIMER_128 | FF_MODE2_GS_TIMER_224,
 	       0, false);
 
 	if (!IS_DG1(i915)) {
-- 
2.40.1

