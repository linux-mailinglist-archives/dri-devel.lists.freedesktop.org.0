Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B04CC931
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0940C10E3A4;
	Thu,  3 Mar 2022 22:37:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2C710E38E;
 Thu,  3 Mar 2022 22:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646347058; x=1677883058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+ZaC5eBzBDrJItv3YIuvFo1Ck8vEL6cCpX5y8GOfbE=;
 b=UKZip2Fr+YfweOCFW5/YPOe664sPsKiXnwUyieBHl5Zx97y6Bg5f0tFp
 E8X1FTfgDJUtdG/Rk3Qtrq1MymbteyNTkQeol9Q3T5NNkmRv/6GlNuu8I
 KyhneNardNph+ooW8UcxshhfpkKPreWdHfbLvWbLp/55W/ACoCcSj+Akb
 y9tTYYmZ01StjU1YXq9i0EYhhvZJZrEb5MFpuX5QrLMO6o+bl3hAr3tyc
 DZwmLx0toL+V8ygJfSxrZXdL7umb55aeJZyuWyJ9Tf5Us9uU0rA+fB6+M
 1kOg6TnhMOrzO6UCC080TjFPX++wxa1zKR23mZANKK6PzvUTZDcNtlAsX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233794765"
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="233794765"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 14:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="609745291"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2022 14:37:38 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 3/4] drm/i915: Make the heartbeat play nice with long
 pre-emption timeouts
Date: Thu,  3 Mar 2022 14:37:36 -0800
Message-Id: <20220303223737.708659-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303223737.708659-1-John.C.Harrison@Intel.com>
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index a3698f611f45..0dc53def8e42 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -22,9 +22,27 @@
 
 static bool next_heartbeat(struct intel_engine_cs *engine)
 {
+	struct i915_request *rq;
 	long delay;
 
 	delay = READ_ONCE(engine->props.heartbeat_interval_ms);
+
+	rq = engine->heartbeat.systole;
+
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
+		if (longer > delay)
+			delay = longer;
+	}
+
 	if (!delay)
 		return false;
 
-- 
2.25.1

