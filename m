Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE40D5EEB91
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 04:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBDA10E9D1;
	Thu, 29 Sep 2022 02:17:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD7210E9B3;
 Thu, 29 Sep 2022 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664417840; x=1695953840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ENpCFuUeyMklBPIs4eytPNwOQzZ/U5oKTlL7Vk++Cko=;
 b=XubDWglyBNmmpXTH47NzkQjVZago6D4ugZdA0UQBt1hBUUQht6oLV4QH
 07lIS79wOBU6dV8qzY7b9UREzeei8W67n5PPR3dL/QFrzlKWaaM4uYHpo
 2DrufjQCcesxHT4u/yy5BcDIi4dWJci/J7tFxuPYlwqp3FMPAbwVfKQwO
 OgBaVATmE/dsb269ihc7apGFdcmtFWV6q4GujQtU3Z62mQWjoTSRJc2Rl
 +B/qeLHSniHh6Yr7JKEmRkmsHwF43qSrMsPxqp2HL1BtyMBQFQ1U8E22s
 GCrb5tNskzdcsGcuwJDpCWCMQK8DMjvl/lV8FlZQ4ozTbtiYcFVbMJKL8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="281484119"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="281484119"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 19:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="573275948"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="573275948"
Received: from relo-linux-5.jf.intel.com ([10.165.21.142])
 by orsmga003.jf.intel.com with ESMTP; 28 Sep 2022 19:17:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 3/4] drm/i915: Make the heartbeat play nice with long
 pre-emption timeouts
Date: Wed, 28 Sep 2022 19:18:12 -0700
Message-Id: <20220929021813.2172701-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
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
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index a3698f611f457..823a790a0e2ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -22,9 +22,28 @@
 
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
+		longer = intel_clamp_heartbeat_interval_ms(engine, longer);
+		if (longer > delay)
+			delay = longer;
+	}
+
 	if (!delay)
 		return false;
 
-- 
2.37.3

