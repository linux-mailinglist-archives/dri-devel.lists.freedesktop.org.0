Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB285F765
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 12:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34C010E2A9;
	Thu, 22 Feb 2024 11:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJCbxRnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD8110E11E;
 Thu, 22 Feb 2024 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708602390; x=1740138390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4JA+YDcz7JfYy8kEkawYTsTRXessyKnJ+86flWcJMEc=;
 b=YJCbxRnp4Pjks23lHi1PlDzfsjfZ+icGDx4fTvRQy3AXj/n0qsythGcx
 yf6XThfUl4+y5CBr3tuuPG4XL/a0Uy4glK8IKMt8YjvLmlaEbyng0PofU
 wgL7rt4IM+ujldY83Dr/WQn/Q0dnhufFyVU9FmQPYScM1Wk2Fc8+4Kgcn
 iX6nQhZ/goBA1i/ErR5CJoKsw3iUuuSo2TO0HcC7keNHWKlqQVTJfvxTl
 I7ervXZqEI89Ynk0LgO2ZFBsd38eOJHR6NRFnaLonSmkXK4UbE+pBHR9i
 S96/xByY0rPZ/iUQKJHnsDgQJpC72zriHatEqGNMUAmiryCvz0Ak6sEn8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6598707"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6598707"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5628384"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.23.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:46:26 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rahul Kumar Singh <rahul.kumar.singh@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] drm/i915/selftests: Fix dependency of some timeouts on HZ
Date: Thu, 22 Feb 2024 12:32:40 +0100
Message-ID: <20240222113347.648945-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Third argument of i915_request_wait() accepts a timeout value in jiffies.
Most users pass either a simple HZ based expression, or a result of
msecs_to_jiffies(), or MAX_SCHEDULE_TIMEOUT, or a very small number not
exceeding 4 if applicable as that value.  However, there is one user --
intel_selftest_wait_for_rq() -- that passes a WAIT_FOR_RESET_TIME symbol,
defined as a large constant value that most probably represents a desired
timeout in ms.  While that usage results in the intended value of timeout
on usual x86_64 kernel configurations, it is not portable across different
architectures and custom kernel configs.

Rename the symbol to clearly indicate intended units and convert it to
jiffies before use.

Fixes: 3a4bfa091c46 ("drm/i915/selftest: Fix workarounds selftest for GuC submission")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
index 2990dd4d4a0d8..e14ac0ab1314d 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
@@ -3,6 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <linux/jiffies.h>
+
 //#include "gt/intel_engine_user.h"
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
@@ -12,7 +14,7 @@
 
 #define REDUCED_TIMESLICE	5
 #define REDUCED_PREEMPT		10
-#define WAIT_FOR_RESET_TIME	10000
+#define WAIT_FOR_RESET_TIME_MS	10000
 
 struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt)
 {
@@ -91,7 +93,7 @@ int intel_selftest_wait_for_rq(struct i915_request *rq)
 {
 	long ret;
 
-	ret = i915_request_wait(rq, 0, WAIT_FOR_RESET_TIME);
+	ret = i915_request_wait(rq, 0, msecs_to_jiffies(WAIT_FOR_RESET_TIME_MS));
 	if (ret < 0)
 		return ret;
 

base-commit: 661a9b14c215bc3ba24badcac80ce4eb3f57d3ff
-- 
2.43.0

