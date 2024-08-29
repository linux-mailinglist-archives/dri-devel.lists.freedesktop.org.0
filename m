Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E63964ADB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 18:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577D710E71D;
	Thu, 29 Aug 2024 16:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MO/vLSM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64BE10E71B;
 Thu, 29 Aug 2024 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724947201; x=1756483201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kIbeBcvklRZnAUyEaogr4BsfGsKIwHXOjt9dIl1120s=;
 b=MO/vLSM1Vg/cuxXQt9mmkEwZYQJNqqV63DrZeU/aI+zxp8VMSwPy2OVa
 te4YhR0RmQr0eTPh9O334Ai0mMN5VgFijq3LzAR12WwH8E3yzMdUgKQL0
 Nt5x43NsW2R6UsrGxpiLhc6qJF5FyKu2z/JKDX7Bzv6t28a7ybOJntXDe
 fNh4QYOVTfnNgf/TFBJps5ygHV8ZTMvEOdo9fZ4KOWNdTZKvvDvuqgj01
 hTBS1kmBqYEcQEw2bEH3SKwa/ppIhV7nPoGK9znp0lsNXAzdwRczS4QhE
 f541M8pRZfri6n2rVwGF01FjhV0czSXytXQjA0kMcutQEaN41N+IosEjE Q==;
X-CSE-ConnectionGUID: UA/qxn23TZiaiinMhj1DZQ==
X-CSE-MsgGUID: IzPVuKGESWufEmAp0QeWpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27313790"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="27313790"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:00:01 -0700
X-CSE-ConnectionGUID: U1FTIqQYQ8ujxx5ZZCRvEA==
X-CSE-MsgGUID: YliLZ7OsQvaylZ8R7B+OmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63455324"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP; 29 Aug 2024 08:59:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C22D8956; Thu, 29 Aug 2024 18:59:56 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 2/2] drm/i915/fence: Mark debug_fence_free() with
 __maybe_unused
Date: Thu, 29 Aug 2024 18:58:38 +0300
Message-ID: <20240829155950.1141978-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
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

When debug_fence_free() unused, it
prevents kernel builds with `make W=1` and CONFIG_WERROR=y:

.../i915_sw_fence.c:118:20: error: unused function 'debug_fence_free' [-Werror,-Wunused-function]
  118 | static inline void debug_fence_free(struct i915_sw_fence *fence)
      |                    ^~~~~~~~~~~~~~~~

Fix this by marking debug_fence_free() with __maybe_unused.

Fixes: fc1584059d6c ("drm/i915: Integrate i915_sw_fence with debugobjects")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index d4020ff3549a..1d4cc91c0e40 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -77,7 +77,7 @@ static inline void debug_fence_destroy(struct i915_sw_fence *fence)
 	debug_object_destroy(fence, &i915_sw_fence_debug_descr);
 }
 
-static inline void debug_fence_free(struct i915_sw_fence *fence)
+static inline __maybe_unused void debug_fence_free(struct i915_sw_fence *fence)
 {
 	debug_object_free(fence, &i915_sw_fence_debug_descr);
 	smp_wmb(); /* flush the change in state before reallocation */
@@ -115,7 +115,7 @@ static inline void debug_fence_destroy(struct i915_sw_fence *fence)
 {
 }
 
-static inline void debug_fence_free(struct i915_sw_fence *fence)
+static inline __maybe_unused void debug_fence_free(struct i915_sw_fence *fence)
 {
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac

