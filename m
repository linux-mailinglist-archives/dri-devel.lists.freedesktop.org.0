Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNBzILL8fGnLPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:47:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E50BDF0D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C8010EA4D;
	Fri, 30 Jan 2026 18:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyKDDCDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C8010E1A5;
 Fri, 30 Jan 2026 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769798829; x=1801334829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hH3P6LKIOhFqaAtdtiXK7SgxprB7PxiowO0i8ZrXilc=;
 b=CyKDDCDoJtNanqbx80VLzr7N+VtDz0i3VuiBKRmj5ZI0UTnRUKoLHWVk
 lJiBoVf2+ICP4cMBMNOt94G96CYZVJsPjmGLMosxI32++FPOQOYKeyxh7
 cv34PU7wg2cb+spvvNwGqnzgafg5pFWCF2W7/95Uu8ru6RJ+BXge00Cd2
 Qdx1kdTXvhwZBKXBEPx5St+s04ZTYJ9crL0orsuptE7D9udwm0z3xvR4J
 NIGMLY/cM1nxfmckAj7jesXNYP/n1+NYDMkXxAUp0sLUX0IJi4JAEwzvy
 o7SikUjH8UA6q9I5uT/fOqOeDZqyLPVzvW03iIwi/GM33+rK2OkyXk0PQ g==;
X-CSE-ConnectionGUID: DqzvSPeSR8mQ8rRjqyGwZg==
X-CSE-MsgGUID: cE97jT/oRySp3XcsWgcIwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70071907"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70071907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:47:08 -0800
X-CSE-ConnectionGUID: B4nyQC+qRei5NHDcsRfpHQ==
X-CSE-MsgGUID: uzhKT1pOSr6OoKRyomlWEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="231839736"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.98])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:47:03 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH v4] drm/i915/selftests: Defer signalling the request fence
Date: Fri, 30 Jan 2026 19:45:08 +0100
Message-ID: <20260130184507.45233-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.niemiec@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 36E50BDF0D
X-Rspamd-Action: no action

The i915_active selftests live_active_wait and live_active_retire
operate on an i915_active attached to a mock, empty request, created as
part of test setup. A fence is attached to this request to control when
the request is processed. The tests then wait for the completion of the
active with __i915_active_wait(), and the test is considered successful
if this results in setting a variable in the active callback.

However, the behavior of __i915_active_wait() is such that if the
refcount for the active is 0, the function is almost completely skipped;
waiting on a already completed active yields no effect. This includes a
subsequent call to the retire() function of the active (which is the
callback that the test is interested about, and which dictates whether
its successful or not). So, if the active is completed before the
aforementioned call to __i915_active_wait(), the test will fail.

Most of the test runs in a single thread, including creating the
request, creating the fence for it, signalling that fence, and calling
__i915_active_wait(). However, the request itself is handled
asynchronously. This creates a race condition where if the request is
completed after signalling the fence, but before waiting on its active,
the active callback will not be invoked, failing the test.

Defer signalling the request's fence, to ensure the main test thread
gets to call __i915_active_wait() before request completion.

v4:
- Lower the delay timeout to 50ms (Jonathan)
- Put the check on work_finished inside a helper function (Jonathan)

v3:
- Embed the variables inside the live_active struct (Andi)
- Move the schedule_delayed_work call closer to the wait (Andi)
- Implement error handling in case an error state - the wait has
  finished, but the deferred work didn't run - is somehow achieved (Andi)

v2:
- Clarify the need for a fix a little more (Krzysztof K., Janusz)

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_active.c | 51 +++++++++++++++++---
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 36c3a5460221..eadd0a8bc094 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -21,6 +21,10 @@ struct live_active {
 	struct i915_active base;
 	struct kref ref;
 	bool retired;
+
+	struct i915_sw_fence *submit;
+	struct delayed_work work;
+	bool work_finished;
 };
 
 static void __live_get(struct live_active *active)
@@ -76,11 +80,37 @@ static struct live_active *__live_alloc(struct drm_i915_private *i915)
 	return active;
 }
 
+static void __live_submit_work_handler(struct work_struct *work)
+{
+	struct delayed_work *d_work = container_of(work, struct delayed_work, work);
+	struct live_active *active = container_of(d_work, struct live_active, work);
+	i915_sw_fence_commit(active->submit);
+	heap_fence_put(active->submit);
+	active->work_finished = true;
+}
+
+static int
+__live_work_confirm_finished(struct drm_i915_private *i915,
+			     struct live_active *active)
+{
+	int err = 0;
+
+	if (!active->work_finished) {
+		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
+
+		drm_printf(&p, "active->work hasn't finished, something went\
+				terribly wrong\n");
+		err = -EINVAL;
+		cancel_delayed_work_sync(&active->work);
+	}
+
+	return err;
+}
+
 static struct live_active *
 __live_active_setup(struct drm_i915_private *i915)
 {
 	struct intel_engine_cs *engine;
-	struct i915_sw_fence *submit;
 	struct live_active *active;
 	unsigned int count = 0;
 	int err = 0;
@@ -89,8 +119,11 @@ __live_active_setup(struct drm_i915_private *i915)
 	if (!active)
 		return ERR_PTR(-ENOMEM);
 
-	submit = heap_fence_create(GFP_KERNEL);
-	if (!submit) {
+	INIT_DELAYED_WORK(&active->work, __live_submit_work_handler);
+	active->work_finished = false;
+
+	active->submit = heap_fence_create(GFP_KERNEL);
+	if (!active->submit) {
 		kfree(active);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -109,7 +142,7 @@ __live_active_setup(struct drm_i915_private *i915)
 		}
 
 		err = i915_sw_fence_await_sw_fence_gfp(&rq->submit,
-						       submit,
+						       active->submit,
 						       GFP_KERNEL);
 		if (err >= 0)
 			err = i915_active_add_request(&active->base, rq);
@@ -134,8 +167,6 @@ __live_active_setup(struct drm_i915_private *i915)
 	}
 
 out:
-	i915_sw_fence_commit(submit);
-	heap_fence_put(submit);
 	if (err) {
 		__live_put(active);
 		active = ERR_PTR(err);
@@ -156,6 +187,8 @@ static int live_active_wait(void *arg)
 	if (IS_ERR(active))
 		return PTR_ERR(active);
 
+	schedule_delayed_work(&active->work, msecs_to_jiffies(50));
+
 	__i915_active_wait(&active->base, TASK_UNINTERRUPTIBLE);
 	if (!READ_ONCE(active->retired)) {
 		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
@@ -166,6 +199,8 @@ static int live_active_wait(void *arg)
 		err = -EINVAL;
 	}
 
+	err = __live_work_confirm_finished(i915, active);
+
 	__live_put(active);
 
 	if (igt_flush_test(i915))
@@ -186,6 +221,8 @@ static int live_active_retire(void *arg)
 	if (IS_ERR(active))
 		return PTR_ERR(active);
 
+	schedule_delayed_work(&active->work, msecs_to_jiffies(50));
+
 	/* waits for & retires all requests */
 	if (igt_flush_test(i915))
 		err = -EIO;
@@ -199,6 +236,8 @@ static int live_active_retire(void *arg)
 		err = -EINVAL;
 	}
 
+	err = __live_work_confirm_finished(i915, active);
+
 	__live_put(active);
 
 	return err;
-- 
2.45.2

