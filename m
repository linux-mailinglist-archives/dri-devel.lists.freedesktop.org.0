Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4184C1B3DA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3157710E7BE;
	Wed, 29 Oct 2025 14:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ap6enF5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D90210E7BC;
 Wed, 29 Oct 2025 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761748525; x=1793284525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EyWyky2ijugQWWs1/yN4aYw+E8++TcLHwhuuPwobd6I=;
 b=Ap6enF5bvbQX8nLcsG6l87VYUmTTNsiald+ogboP5Jn4q5nBh6yh3+ZY
 zz7ZCDtrCHPixX0zxDWo2tuDzmcIsgnw6YEw23WfxfVh1Idf9VRMKZP5k
 X75MpeVMfYqUdrkZ0WZkzX4nKZMZ3ut3E1MbTootmLqiHFtNAipy9Ye2O
 Rap3fZYCR9gqrIYxJL3im6m5aH8ExwinkFkTzT3H2GQeKFQ/b+1Mxop5C
 JDJYpjDW0IfYfMLAOGRwm6ZFCyQ6tYgKhhsCf/q36TiptGQoZVO1IfGRx
 4nPb9jwIYAEMAbl98CAKBiFL92FiaHuhC9TEUhJQ+RHoqJHfw5H/JUxu0 g==;
X-CSE-ConnectionGUID: 4/PUqIKPRJmZldWfGr+VYQ==
X-CSE-MsgGUID: ttRKZx+WSCyI2OsvCGss3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="89339963"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="89339963"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:35:24 -0700
X-CSE-ConnectionGUID: MHFIl+/FRjqrzxHBOgzdaw==
X-CSE-MsgGUID: Bcbs+SnrTK+Y0JuDExPInQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="186031524"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.187])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:35:21 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH v2] drm/i915/selftests: Defer signalling the request fence
Date: Wed, 29 Oct 2025 15:35:02 +0100
Message-ID: <20251029143501.42998-2-krzysztof.niemiec@intel.com>
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

v2:
- Clarify the need for a fix a little more (Krzysztof K., Janusz)

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_active.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 0d89d70b9c36..a82a56c3eeb6 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -74,15 +74,25 @@ static struct live_active *__live_alloc(struct drm_i915_private *i915)
 	return active;
 }
 
+static struct i915_sw_fence *submit;
+static struct delayed_work __live_submit_work;
+
+static void __live_submit_work_handler(struct work_struct *work)
+{
+	i915_sw_fence_commit(submit);
+	heap_fence_put(submit);
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
 
+	INIT_DELAYED_WORK(&__live_submit_work, __live_submit_work_handler);
+
 	active = __live_alloc(i915);
 	if (!active)
 		return ERR_PTR(-ENOMEM);
@@ -132,8 +142,7 @@ __live_active_setup(struct drm_i915_private *i915)
 	}
 
 out:
-	i915_sw_fence_commit(submit);
-	heap_fence_put(submit);
+	schedule_delayed_work(&__live_submit_work, msecs_to_jiffies(500));
 	if (err) {
 		__live_put(active);
 		active = ERR_PTR(err);
-- 
2.45.2

