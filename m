Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B65AD385F3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 20:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050DD10E25A;
	Fri, 16 Jan 2026 19:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHmQriv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05B610E25A;
 Fri, 16 Jan 2026 19:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768592062; x=1800128062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U3O+T+iLXb0giBjJetcAYQUBfHiHL0Y0fMElJAUxCM0=;
 b=LHmQriv2EtM024T4Qe0PhMGez4kaXhPqPDITHCTlybNbTgbGZp033Flx
 IXrvyU9ejo5j1VpaCjEZyBg5MiCJUTwa7GqtuSBXzJl+Ntw8UWO6jhAML
 pPBAspvtceDkyWL+q+MHQQ1xwEHqj7vBp6yFbr4JOY7C2CidIavhggRbW
 Uu8Cs8Rmjv2py4sQ4hA3StsJPxz5+D870+iVKlWMO3st7OjpdrqHYU5Bd
 71GwqdHJVI2rgJ+LOaan59V3XtzSl7hCHpa7I76ItT9wiDKj8eoYp3t6G
 8HYT5LTzXo57DMgZAWJfAYD8yAr+8Cf5bq29dRb+z1XfX2wwtsPVBrCln g==;
X-CSE-ConnectionGUID: 1l6oxNrWR8C2Dlw0HljB2g==
X-CSE-MsgGUID: W/vOSyPtSfas5fEFIBWsxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69959963"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="69959963"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 11:34:21 -0800
X-CSE-ConnectionGUID: feKgUSvxSV6ixLFaW9dlJQ==
X-CSE-MsgGUID: 203SMtdHRVOkdAkhOjccOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="204936344"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.228])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 11:34:18 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH v3] drm/i915/selftests: Defer signalling the request fence
Date: Fri, 16 Jan 2026 20:33:55 +0100
Message-ID: <20260116193354.80806-2-krzysztof.niemiec@intel.com>
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
 drivers/gpu/drm/i915/selftests/i915_active.c | 47 +++++++++++++++++---
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 0d89d70b9c36..2052a3c2e563 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -19,6 +19,10 @@ struct live_active {
 	struct i915_active base;
 	struct kref ref;
 	bool retired;
+
+	struct i915_sw_fence *submit;
+	struct delayed_work work;
+	bool work_finished;
 };
 
 static void __live_get(struct live_active *active)
@@ -74,11 +78,19 @@ static struct live_active *__live_alloc(struct drm_i915_private *i915)
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
 static struct live_active *
 __live_active_setup(struct drm_i915_private *i915)
 {
 	struct intel_engine_cs *engine;
-	struct i915_sw_fence *submit;
 	struct live_active *active;
 	unsigned int count = 0;
 	int err = 0;
@@ -87,8 +99,11 @@ __live_active_setup(struct drm_i915_private *i915)
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
@@ -107,7 +122,7 @@ __live_active_setup(struct drm_i915_private *i915)
 		}
 
 		err = i915_sw_fence_await_sw_fence_gfp(&rq->submit,
-						       submit,
+						       active->submit,
 						       GFP_KERNEL);
 		if (err >= 0)
 			err = i915_active_add_request(&active->base, rq);
@@ -132,8 +147,6 @@ __live_active_setup(struct drm_i915_private *i915)
 	}
 
 out:
-	i915_sw_fence_commit(submit);
-	heap_fence_put(submit);
 	if (err) {
 		__live_put(active);
 		active = ERR_PTR(err);
@@ -154,6 +167,8 @@ static int live_active_wait(void *arg)
 	if (IS_ERR(active))
 		return PTR_ERR(active);
 
+	schedule_delayed_work(&active->work, msecs_to_jiffies(500));
+
 	__i915_active_wait(&active->base, TASK_UNINTERRUPTIBLE);
 	if (!READ_ONCE(active->retired)) {
 		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
@@ -164,6 +179,15 @@ static int live_active_wait(void *arg)
 		err = -EINVAL;
 	}
 
+	if (!active->work_finished) {
+		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
+
+		drm_printf(&p, "active->work hasn't finished, something went\
+				terribly wrong\n");
+		err = -EINVAL;
+		cancel_delayed_work_sync(&active->work);
+	}
+
 	__live_put(active);
 
 	if (igt_flush_test(i915))
@@ -184,6 +208,8 @@ static int live_active_retire(void *arg)
 	if (IS_ERR(active))
 		return PTR_ERR(active);
 
+	schedule_delayed_work(&active->work, msecs_to_jiffies(500));
+
 	/* waits for & retires all requests */
 	if (igt_flush_test(i915))
 		err = -EIO;
@@ -197,6 +223,15 @@ static int live_active_retire(void *arg)
 		err = -EINVAL;
 	}
 
+	if (!active->work_finished) {
+		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
+
+		drm_printf(&p, "active->work hasn't finished, something went\
+				terribly wrong\n");
+		err = -EINVAL;
+		cancel_delayed_work_sync(&active->work);
+	}
+
 	__live_put(active);
 
 	return err;
-- 
2.45.2

