Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A4495379
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 18:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDAF10E772;
	Thu, 20 Jan 2022 17:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA2010E662;
 Thu, 20 Jan 2022 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642700574; x=1674236574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jkjejS8TT9tQlSwLu0JxBJbfl7YBYRxFvOfs3it60sM=;
 b=Rwonf47ip74aKTjAAThIXvmDUDWLRu1FPlKHYXgWfwBjXnWDdWQMamG9
 HOlg0yWdGFB1+X8yD15ErSZDzomcpnR48BgMsV22art++WtlZThTlky15
 D9eJ+ckolsIw7ZD6V6yrO90PR4MiOmq4cui28IUdtui3E3QwYqZfzeZnD
 wtAuiTMglMbkhfJhJTTu2fytsvoBKwUsQPVhNJsYgORKaDmsDAkfvuNhV
 ec3GlLSOIvDtk9YJzH0ytf5KPbgYEbcz6iHoJzc89PJshxKF/JdqwAONM
 1fQ1ArY1F5AsvX9dlIXiQAzt2HEhHnXEmF2gn/GX1B1jI06E5N+pRu47J A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245366384"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245366384"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 09:42:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="532885101"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga008.jf.intel.com with ESMTP; 20 Jan 2022 09:42:53 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Don't restart WL for every frequency step
Date: Thu, 20 Jan 2022 09:42:43 -0800
Message-Id: <20220120174243.13726-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.34.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move spinner start out of the steps loop. If we restart WL for each
freq step, the rapid start/stop causes SLPC algorithm to think that
GT busyness is 50% for it's evaluation interval. This leads to SLPC
not increasing the requested frequency as per the test expectation.

Fixes: 8ee2c227822e (drm/i915/guc/slpc: Add SLPC selftest)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_slpc.c | 104 ++++++++++++------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
index b768cea5943d..eef416747c67 100644
--- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -79,6 +79,29 @@ static int live_slpc_clamp_min(void *arg)
 		if (!intel_engine_can_store_dword(engine))
 			continue;
 
+		st_engine_heartbeat_disable(engine);
+
+		rq = igt_spinner_create_request(&spin,
+						engine->kernel_context,
+						MI_NOOP);
+		if (IS_ERR(rq)) {
+			err = PTR_ERR(rq);
+			st_engine_heartbeat_enable(engine);
+			break;
+		}
+
+		i915_request_add(rq);
+
+		if (!igt_wait_for_spinner(&spin, rq)) {
+			pr_err("%s: Spinner did not start\n",
+			       engine->name);
+			igt_spinner_end(&spin);
+			st_engine_heartbeat_enable(engine);
+			intel_gt_set_wedged(engine->gt);
+			err = -EIO;
+			break;
+		}
+
 		/* Go from min to max in 5 steps */
 		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
 		max_act_freq = slpc_min_freq;
@@ -88,29 +111,6 @@ static int live_slpc_clamp_min(void *arg)
 			if (err)
 				break;
 
-			st_engine_heartbeat_disable(engine);
-
-			rq = igt_spinner_create_request(&spin,
-							engine->kernel_context,
-							MI_NOOP);
-			if (IS_ERR(rq)) {
-				err = PTR_ERR(rq);
-				st_engine_heartbeat_enable(engine);
-				break;
-			}
-
-			i915_request_add(rq);
-
-			if (!igt_wait_for_spinner(&spin, rq)) {
-				pr_err("%s: Spinner did not start\n",
-				       engine->name);
-				igt_spinner_end(&spin);
-				st_engine_heartbeat_enable(engine);
-				intel_gt_set_wedged(engine->gt);
-				err = -EIO;
-				break;
-			}
-
 			/* Wait for GuC to detect business and raise
 			 * requested frequency if necessary.
 			 */
@@ -131,9 +131,6 @@ static int live_slpc_clamp_min(void *arg)
 			act_freq =  intel_rps_read_actual_frequency(rps);
 			if (act_freq > max_act_freq)
 				max_act_freq = act_freq;
-
-			igt_spinner_end(&spin);
-			st_engine_heartbeat_enable(engine);
 		}
 
 		pr_info("Max actual frequency for %s was %d\n",
@@ -145,6 +142,9 @@ static int live_slpc_clamp_min(void *arg)
 			err = -EINVAL;
 		}
 
+		igt_spinner_end(&spin);
+		st_engine_heartbeat_enable(engine);
+
 		if (err)
 			break;
 	}
@@ -210,6 +210,29 @@ static int live_slpc_clamp_max(void *arg)
 		if (!intel_engine_can_store_dword(engine))
 			continue;
 
+		st_engine_heartbeat_disable(engine);
+
+		rq = igt_spinner_create_request(&spin,
+						engine->kernel_context,
+						MI_NOOP);
+		if (IS_ERR(rq)) {
+			st_engine_heartbeat_enable(engine);
+			err = PTR_ERR(rq);
+			break;
+		}
+
+		i915_request_add(rq);
+
+		if (!igt_wait_for_spinner(&spin, rq)) {
+			pr_err("%s: SLPC spinner did not start\n",
+			       engine->name);
+			igt_spinner_end(&spin);
+			st_engine_heartbeat_enable(engine);
+			intel_gt_set_wedged(engine->gt);
+			err = -EIO;
+			break;
+		}
+
 		/* Go from max to min in 5 steps */
 		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
 		max_act_freq = slpc_min_freq;
@@ -219,29 +242,6 @@ static int live_slpc_clamp_max(void *arg)
 			if (err)
 				break;
 
-			st_engine_heartbeat_disable(engine);
-
-			rq = igt_spinner_create_request(&spin,
-							engine->kernel_context,
-							MI_NOOP);
-			if (IS_ERR(rq)) {
-				st_engine_heartbeat_enable(engine);
-				err = PTR_ERR(rq);
-				break;
-			}
-
-			i915_request_add(rq);
-
-			if (!igt_wait_for_spinner(&spin, rq)) {
-				pr_err("%s: SLPC spinner did not start\n",
-				       engine->name);
-				igt_spinner_end(&spin);
-				st_engine_heartbeat_enable(engine);
-				intel_gt_set_wedged(engine->gt);
-				err = -EIO;
-				break;
-			}
-
 			delay_for_h2g();
 
 			/* Verify that SWREQ indeed was set to specific value */
@@ -261,9 +261,6 @@ static int live_slpc_clamp_max(void *arg)
 			if (act_freq > max_act_freq)
 				max_act_freq = act_freq;
 
-			st_engine_heartbeat_enable(engine);
-			igt_spinner_end(&spin);
-
 			if (err)
 				break;
 		}
@@ -277,6 +274,9 @@ static int live_slpc_clamp_max(void *arg)
 			err = -EINVAL;
 		}
 
+		st_engine_heartbeat_enable(engine);
+		igt_spinner_end(&spin);
+
 		if (igt_flush_test(gt->i915)) {
 			err = -EIO;
 			break;
-- 
2.34.0

