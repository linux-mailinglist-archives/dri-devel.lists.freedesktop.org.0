Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFDB9F1568
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 20:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0FB10E444;
	Fri, 13 Dec 2024 19:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhftqDZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D181B10E444;
 Fri, 13 Dec 2024 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734116545; x=1765652545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+Q6oqS4L1e0hKVpIk+xmhbTXnLRNIDqiKqvbJ8/aYas=;
 b=RhftqDZjW8t1+Cz9RVGIAcNSvT/1SiM5lKgJm2QVfLv5IWIdwzFceQVT
 osAK70Xk2SF5psKZ+E5wDCXh5LMVwpz0L0V2x1Bu8YGmPPDmJs1di7DtY
 EKogcR3zIIi62o/IUdjqcx6X6l9L3FzXSI3SsjLd4Uw8BWWX9YUzXOH4o
 N8dUO8VRqLa0H9Fy8c8HdYazcbHQs3zLIumsQSJghrbbOxNVEBY24UHwL
 y+w1ElNTzEFPiopPR2GN/mB1/3g0aFyy9SchPPZ+xYG447BTS9A4sbRp0
 0nJIKDRdFPLTFdSB+2SE09t7D1VFrrc/A6ewUmuV+a4AMkW8xQX2+mMRl g==;
X-CSE-ConnectionGUID: qNrMcw9gQo+0MGgxXm6uuQ==
X-CSE-MsgGUID: roSUwAAgRtC4Nr0htdkf2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45055484"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45055484"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 11:02:25 -0800
X-CSE-ConnectionGUID: 35aqRVB4QaiMxqMWvk0Opw==
X-CSE-MsgGUID: 24lgRxd7TS+bZDoCk5/Vkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133970662"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.163])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 11:02:22 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] drm/i915/selftests: Use preemption timeout on cleanup
Date: Fri, 13 Dec 2024 19:59:48 +0100
Message-ID: <20241213190122.513709-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

Many selftests call igt_flush_test() on cleanup.  With default preemption
timeout of compute engines raised to 7.5 seconds, hardcoded flush timeout
of 3 seconds is too short.  That results in GPU forcibly wedged and kernel
taineted, then IGT abort triggered.  CI BAT runs loose a part of their
expected coverage.

Calculate the flush timeout based on the longest preemption timeout
currently configured for any engine.  That way, selftest can still report
detected issues as non-critical, and the GPU gets a chance to recover from
preemptible hangs and prepare for fluent execution of next test cases.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/igt_flush_test.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/igt_flush_test.c b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
index 29110abb4fe05..d4b216065f2eb 100644
--- a/drivers/gpu/drm/i915/selftests/igt_flush_test.c
+++ b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
@@ -19,12 +19,21 @@ int igt_flush_test(struct drm_i915_private *i915)
 	int ret = 0;
 
 	for_each_gt(gt, i915, i) {
+		struct intel_engine_cs *engine;
+		unsigned long timeout_ms = 0;
+		unsigned int id;
+
 		if (intel_gt_is_wedged(gt))
 			ret = -EIO;
 
+		for_each_engine(engine, gt, id) {
+			if (engine->props.preempt_timeout_ms > timeout_ms)
+				timeout_ms = engine->props.preempt_timeout_ms;
+		}
+
 		cond_resched();
 
-		if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
+		if (intel_gt_wait_for_idle(gt, HZ * timeout_ms / 500) == -ETIME) {
 			pr_err("%pS timed out, cancelling all further testing.\n",
 			       __builtin_return_address(0));
 
-- 
2.47.1

