Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8230136E7B8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 11:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B770B6E1AA;
	Thu, 29 Apr 2021 09:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799DC88A33;
 Thu, 29 Apr 2021 09:13:06 +0000 (UTC)
IronPort-SDR: UVNzwCjH7o7fc0OOxrIExi5fqRFg3/9h5sygE8ujom44+uvAV4s2p6+xWF8U/xG6R5fblZUR48
 6NoGrMwbGzFg==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197011308"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="197011308"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:06 -0700
IronPort-SDR: OaUXyzmJrfMT9cPxg9pGev35Unzf5YvpK/cYBHOFK7QpAEtLJN1eDbX17gounrgcACTeKwAKMB
 DiO/aaRPieOQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="537298812"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.64])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:05 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915/icl: Use appropriate helper for a masked
 workaround
Date: Thu, 29 Apr 2021 10:12:52 +0100
Message-Id: <20210429091254.855248-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
References: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Instead of "open coding" WaEnableFloatBlendOptimization:icl via
wa_write_clr_set, which should be for non-masked workarounds, add a new
helper wa_masked_en_no_verify and use it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index a7abf9ca78ec..07579bb9b6a7 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -215,6 +215,12 @@ wa_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 	wa_masked_add(wal, reg, _MASKED_BIT_ENABLE(val), val);
 }
 
+static void
+wa_masked_en_no_verify(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
+{
+	wa_masked_add(wal, reg, _MASKED_BIT_ENABLE(val), 0);
+}
+
 static void
 wa_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 {
@@ -595,10 +601,9 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 			     GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC);
 
 	/* WaEnableFloatBlendOptimization:icl */
-	wa_write_clr_set(wal,
-			 GEN10_CACHE_MODE_SS,
-			 0, /* write-only, so skip validation */
-			 _MASKED_BIT_ENABLE(FLOAT_BLEND_OPTIMIZATION_ENABLE));
+	wa_masked_en_no_verify(wal,
+			       GEN10_CACHE_MODE_SS,
+			       FLOAT_BLEND_OPTIMIZATION_ENABLE);
 
 	/* WaDisableGPGPUMidThreadPreemption:icl */
 	wa_masked_field_set(wal, GEN8_CS_CHICKEN1,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
