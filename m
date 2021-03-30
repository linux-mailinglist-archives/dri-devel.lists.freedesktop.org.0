Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82F34EB85
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 17:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1BF6E916;
	Tue, 30 Mar 2021 15:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296DF6E911;
 Tue, 30 Mar 2021 15:06:47 +0000 (UTC)
IronPort-SDR: HIwQDfO4PgJxMogyN+XT6glkVMEqyMBIwg831PzqfXvieHPs4NZ0w1CU9TSRc/copjzI2KTVww
 Kc+9NXbKYEcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="178917951"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="178917951"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 08:06:46 -0700
IronPort-SDR: Az5Jhl21qsF8JZHq2yTnBJuI3bdbKig11tfn2KuvtUl9RYz4S7wAxLqlQsy9dSxYBK2JxlHWzH
 I9pD78OHIhIQ==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="455058076"
Received: from beautiful-one.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.201.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 08:06:44 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pmu: Do not report 100% RC6 if not supported
Date: Tue, 30 Mar 2021 16:06:37 +0100
Message-Id: <20210330150637.2547762-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Eero T Tamminen <eero.t.tamminen@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We use GT parked status to estimate RC6 while not in use, however if RC6
is not supported to start with that does not work very well and produces a
false 100% RC6 readout.

Fix by not advancing the estimated RC6 counter when feature is not
supported.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 1fe699e30113 ("drm/i915/pmu: Fix sleep under atomic in RC6 readout")
Reported-by: Eero T Tamminen <eero.t.tamminen@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 41651ac255fa..02fe0d22c470 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -191,7 +191,10 @@ static u64 get_rc6(struct intel_gt *gt)
 		 * on top of the last known real value, as the approximated RC6
 		 * counter value.
 		 */
-		val = ktime_since_raw(pmu->sleep_last);
+		if (gt->rc6.supported)
+			val = ktime_since_raw(pmu->sleep_last);
+		else
+			val = 0;
 		val += pmu->sample[__I915_SAMPLE_RC6].cur;
 	}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
