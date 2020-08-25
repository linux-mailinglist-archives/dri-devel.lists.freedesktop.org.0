Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925852510F9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 06:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A246D6E84F;
	Tue, 25 Aug 2020 04:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0043.hostedemail.com
 [216.40.44.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562656E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 04:57:02 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 7303412C8;
 Tue, 25 Aug 2020 04:57:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:541:800:960:966:973:988:989:1260:1311:1314:1345:1359:1437:1461:1515:1534:1542:1711:1730:1747:1777:1792:2196:2199:2393:2559:2562:3138:3139:3140:3141:3142:3353:3865:3867:3868:4321:4385:4605:5007:6119:6261:7903:10004:10848:11026:11473:11657:11658:11914:12043:12048:12296:12297:12438:12555:12895:12986:13894:13972:14181:14394:14721:21080:21433:21451:21627:21740:30029:30054:30056,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: tooth95_1d0aaa027059
X-Filterd-Recvd-Size: 3852
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Aug 2020 04:56:58 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 10/29] drm/i915: Avoid comma separated statements
Date: Mon, 24 Aug 2020 21:56:07 -0700
Message-Id: <d687691df8f9978c7b2362c18d77a16b49be76b0.1598331148.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c           | 8 +++++---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c    | 6 ++++--
 drivers/gpu/drm/i915/gt/selftest_workarounds.c | 6 ++++--
 drivers/gpu/drm/i915/intel_runtime_pm.c        | 6 ++++--
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 699125928272..114c13285ff1 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -323,10 +323,12 @@ static int __gen8_ppgtt_alloc(struct i915_address_space * const vm,
 			}
 
 			spin_lock(&pd->lock);
-			if (likely(!pd->entry[idx]))
+			if (likely(!pd->entry[idx])) {
 				set_pd_entry(pd, idx, pt);
-			else
-				alloc = pt, pt = pd->entry[idx];
+			} else {
+				alloc = pt;
+				pt = pd->entry[idx];
+			}
 		}
 
 		if (lvl) {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index 66fcbf9d0fdd..54408d0b5e6e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -139,8 +139,10 @@ long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout)
 	LIST_HEAD(free);
 
 	interruptible = true;
-	if (unlikely(timeout < 0))
-		timeout = -timeout, interruptible = false;
+	if (unlikely(timeout < 0)) {
+		timeout = -timeout;
+		interruptible = false;
+	}
 
 	flush_submission(gt, timeout); /* kick the ksoftirqd tasklets */
 	spin_lock(&timelines->lock);
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index febc9e6692ba..3e4cbeed20bd 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -521,8 +521,10 @@ static int check_dirty_whitelist(struct intel_context *ce)
 
 		srm = MI_STORE_REGISTER_MEM;
 		lrm = MI_LOAD_REGISTER_MEM;
-		if (INTEL_GEN(engine->i915) >= 8)
-			lrm++, srm++;
+		if (INTEL_GEN(engine->i915) >= 8) {
+			lrm++;
+			srm++;
+		}
 
 		pr_debug("%s: Writing garbage to %x\n",
 			 engine->name, reg);
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 153ca9e65382..f498f1c80755 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -201,8 +201,10 @@ __print_intel_runtime_pm_wakeref(struct drm_printer *p,
 		unsigned long rep;
 
 		rep = 1;
-		while (i + 1 < dbg->count && dbg->owners[i + 1] == stack)
-			rep++, i++;
+		while (i + 1 < dbg->count && dbg->owners[i + 1] == stack) {
+			rep++;
+			i++;
+		}
 		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
 		drm_printf(p, "Wakeref x%lu taken at:\n%s", rep, buf);
 	}
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
