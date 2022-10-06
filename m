Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B075F7072
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 23:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A935B10E8D5;
	Thu,  6 Oct 2022 21:37:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBBC10E4FF;
 Thu,  6 Oct 2022 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665092229; x=1696628229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=16e4dab4lV5mo9Wxt1/9MaR9zOyTsfTE2RXghu4YBms=;
 b=mSx1Ry8A85va10JLtJ9d3595eG4QjsiNPkGifpvXr3n5CqW64Xs/KwRT
 8SE7cfJmaZC1Sxbh0q+jwH1275pInY8RUQTJJmvA6ZJkqfxw0/RrzA0na
 O5wl/Ao15I7o5uDV1351jvkXiIh2DwkFJYHftsv+sSOj+eSVJthgT1jrg
 JrHEraA0pxwUFyREV0ouDqobs13OwlYuFvgLD7/BciuOPzPKn5+dxUutI
 AWNiRc38eeRx12I//ZBcTd8SfcXjz+s3C6EgN8hm8p315PH5r24Ho8UAI
 Z6zMyXRUkhcAnzrfcMvsBqvDQbD+cUlpioYpn/K8NpCR6tmn5azuNoJkz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="283945773"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="283945773"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 14:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="627176772"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="627176772"
Received: from relo-linux-5.jf.intel.com ([10.165.21.188])
 by fmsmga007.fm.intel.com with ESMTP; 06 Oct 2022 14:37:08 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v5 3/4] drm/i915: Make the heartbeat play nice with long
 pre-emption timeouts
Date: Thu,  6 Oct 2022 14:38:12 -0700
Message-Id: <20221006213813.1563435-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006213813.1563435-1-John.C.Harrison@Intel.com>
References: <20221006213813.1563435-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Compute workloads are inherently not pre-emptible for long periods on
current hardware. As a workaround for this, the pre-emption timeout
for compute capable engines was disabled. This is undesirable with GuC
submission as it prevents per engine reset of hung contexts. Hence the
next patch will re-enable the timeout but bumped up by an order of
magnitude.

However, the heartbeat might not respect that. Depending upon current
activity, a pre-emption to the heartbeat pulse might not even be
attempted until the last heartbeat period. Which means that only one
period is granted for the pre-emption to occur. With the aforesaid
bump, the pre-emption timeout could be significantly larger than this
heartbeat period.

So adjust the heartbeat code to take the pre-emption timeout into
account. When it reaches the final (high priority) period, it now
ensures the delay before hitting reset is bigger than the pre-emption
timeout.

v2: Fix for selftests which adjust the heartbeat period manually.
v3: Add FIXME comment about selftests. Add extra FIXME comment and
drm_notices when setting heartbeat to a non-default value (review
feedback from Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index a3698f611f457..9a527e1f5be65 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -22,9 +22,37 @@
 
 static bool next_heartbeat(struct intel_engine_cs *engine)
 {
+	struct i915_request *rq;
 	long delay;
 
 	delay = READ_ONCE(engine->props.heartbeat_interval_ms);
+
+	rq = engine->heartbeat.systole;
+
+	/*
+	 * FIXME: The final period extension is disabled if the period has been
+	 * modified from the default. This is to prevent issues with certain
+	 * selftests which override the value and expect specific behaviour.
+	 * Once the selftests have been updated to either cope with variable
+	 * heartbeat periods (or to override the pre-emption timeout as well,
+	 * or just to add a selftest specific override of the extension), the
+	 * generic override can be removed.
+	 */
+	if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER &&
+	    delay == engine->defaults.heartbeat_interval_ms) {
+		long longer;
+
+		/*
+		 * The final try is at the highest priority possible. Up until now
+		 * a pre-emption might not even have been attempted. So make sure
+		 * this last attempt allows enough time for a pre-emption to occur.
+		 */
+		longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
+		longer = intel_clamp_heartbeat_interval_ms(engine, longer);
+		if (longer > delay)
+			delay = longer;
+	}
+
 	if (!delay)
 		return false;
 
@@ -288,6 +316,17 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
 	if (!delay && !intel_engine_has_preempt_reset(engine))
 		return -ENODEV;
 
+	/* FIXME: Remove together with equally marked hack in next_heartbeat. */
+	if (delay != engine->defaults.heartbeat_interval_ms &&
+	    delay < 2 * engine->props.preempt_timeout_ms) {
+		if (intel_engine_uses_guc(engine))
+			drm_notice(&engine->i915->drm, "%s heartbeat interval adjusted to a non-default value which may downgrade individual engine resets to full GPU resets!\n",
+				   engine->name);
+		else
+			drm_notice(&engine->i915->drm, "%s heartbeat interval adjusted to a non-default value which may cause engine resets to target innocent contexts!\n",
+				   engine->name);
+	}
+
 	intel_engine_pm_get(engine);
 
 	err = mutex_lock_interruptible(&ce->timeline->mutex);
-- 
2.37.3

