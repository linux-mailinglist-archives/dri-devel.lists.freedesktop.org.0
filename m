Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E344536C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 13:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F856F45E;
	Thu,  4 Nov 2021 12:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357546F39B;
 Thu,  4 Nov 2021 12:59:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="229155696"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="229155696"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 05:59:08 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="542225134"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.164])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 05:59:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Use clear_and_wake_up_bit() for the
 per-engine reset bitlocks
Date: Thu,  4 Nov 2021 13:58:44 +0100
Message-Id: <20211104125844.707783-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some selftests assume that nothing will attempt to grab these bitlocks
while they are held by the selftests. With GuC, for example, that is
not true because the hanging workloads may cause the GuC code to attempt
to grab them for a global reset, and that may cause it to end up
sleeping on the bit never waking up. Regardless whether that will be
the final solution for GuC, use clear_and_wake_up_bit() pending a more
thorough investigation on how this should be handled moving forward.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 8 ++++----
 drivers/gpu/drm/i915/selftests/igt_reset.c   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 7e2d99dd012d..8590419be4c6 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -528,7 +528,7 @@ static int igt_reset_nop_engine(void *arg)
 				break;
 			}
 		} while (time_before(jiffies, end_time));
-		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
+		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
 		st_engine_heartbeat_enable(engine);
 
 		pr_info("%s(%s): %d resets\n", __func__, engine->name, count);
@@ -679,7 +679,7 @@ static int igt_reset_fail_engine(void *arg)
 out:
 		pr_info("%s(%s): %d resets\n", __func__, engine->name, count);
 skip:
-		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
+		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
 		st_engine_heartbeat_enable(engine);
 		intel_context_put(ce);
 
@@ -824,7 +824,7 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
 			if (err)
 				break;
 		} while (time_before(jiffies, end_time));
-		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
+		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
 		st_engine_heartbeat_enable(engine);
 		pr_info("%s: Completed %lu %s resets\n",
 			engine->name, count, active ? "active" : "idle");
@@ -1165,7 +1165,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			if (err)
 				break;
 		} while (time_before(jiffies, end_time));
-		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
+		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
 		st_engine_heartbeat_enable_no_pm(engine);
 
 		pr_info("i915_reset_engine(%s:%s): %lu resets\n",
diff --git a/drivers/gpu/drm/i915/selftests/igt_reset.c b/drivers/gpu/drm/i915/selftests/igt_reset.c
index 9f8590b868a9..a2838c65f8a5 100644
--- a/drivers/gpu/drm/i915/selftests/igt_reset.c
+++ b/drivers/gpu/drm/i915/selftests/igt_reset.c
@@ -36,7 +36,7 @@ void igt_global_reset_unlock(struct intel_gt *gt)
 	enum intel_engine_id id;
 
 	for_each_engine(engine, gt, id)
-		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
+		clear_and_wake_up_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
 
 	clear_bit(I915_RESET_BACKOFF, &gt->reset.flags);
 	wake_up_all(&gt->reset.queue);
-- 
2.31.1

