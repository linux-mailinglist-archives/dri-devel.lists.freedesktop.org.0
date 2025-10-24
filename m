Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEB5C07760
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 19:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FEB10EB28;
	Fri, 24 Oct 2025 17:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLQmnCHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C3C10EB2C;
 Fri, 24 Oct 2025 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761325553; x=1792861553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4sqTU3mD+VDwwBEE1sK0AXQAdYQPGX6o20dXsnXPrE4=;
 b=ZLQmnCHDZkvM7AP4RK256fEGt4sG9HwxB7Ezr/Rye5qzInpGdjfHcvaW
 WqZey1Xt2ES7gImvjwrFmLLTNHfEKYOvv20Vsc/ZpPTH2EbgvaKid+feA
 rfp9elV8FP3tqiicdc7hWdD2lrZsWsKB/YkTOWF21SjN35vaTmT7JZSJT
 D9pNLNomsqoLw1OIr3HJPaB36NqJasoGwYv32JtQVojIMUPBbrLag6G6Z
 pdVVV7YvV5zn8m5LCtRWC9oqRbSY2dF2YCOXqa+XREqcGTMka9Oo917dc
 844Jbxt+xesMJfQJeTuVqFhAPp1+6bep0ocuwTtHngdbjNIwINW6EMmg4 A==;
X-CSE-ConnectionGUID: Jkn1NufgRfWENMvZkUvMSA==
X-CSE-MsgGUID: 7IYhava6SteCpY1Ggh3xlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63410864"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63410864"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 10:05:52 -0700
X-CSE-ConnectionGUID: lEUe2pYSSkm7SlLEBDTquQ==
X-CSE-MsgGUID: N/R7Xb/uTwqRdUL29bqMEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="215392221"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.244])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 10:05:48 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH] drm/i915/selftests: Defer signalling the request fence
Date: Fri, 24 Oct 2025 19:03:14 +0200
Message-ID: <20251024170313.135544-2-krzysztof.niemiec@intel.com>
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

The i915_active selftests operate on an active attached to a mock
request. This request is created during the test, and a fence is
attached to it for the test to control when the request is processed.
However, because signalling the fence happens inside the same thread as
the test, and before a call to __i915_active_wait(), a race condition is
created where if the request is processed before the aforementioned
call, the active callback will not be called.

Defer signalling the request's fence, so that the request completes only
after the test's call to __i915_active_wait().

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

