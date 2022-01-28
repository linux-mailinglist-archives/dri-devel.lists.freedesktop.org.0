Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F54A0065
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C0C10E6D9;
	Fri, 28 Jan 2022 18:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD57B10E6D9;
 Fri, 28 Jan 2022 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643395937; x=1674931937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KsIBZZ4VxWwVy1BlaR+Adfd3mV1tuB07oNSgHkb7Yqc=;
 b=av+LXLrkZ3bAe8HknNS305qAHXlii4AXBdrFXhV9/bUnWxAdBuXDUoAN
 XtRou/wx4/G8crJMk0iJ0nz/zFwkDlDHfXppLvWuLFLJxWYB6f+HvMTIp
 7jicGGrCCFzJo4DgtEYc8QZn6ACCnRCORWpJTDH40Rcmp1DaeD4IubNxu
 46bvQwJr3AUxv0c7m/Re/YaMC0wewbP6bLA32xwnmGPVLqJIgaTzvLcE5
 TNO/C+/pWWWLM2NVHF/edAhQLgQLCRNRkwi9sNqUBwBmxqN3Xh8y5YPvb
 RKNGofiUKQxmvMITU1SqneOrAVypjm0wTjFQHm7F+fSXawGczF+C1TCzl w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="310490200"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="310490200"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="625718060"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:12 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/i915: More gt idling time with guc submission
Date: Sat, 29 Jan 2022 00:22:07 +0530
Message-Id: <20220128185209.18077-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220128185209.18077-1-ramalingam.c@intel.com>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On i915_selftest@live@gt_timelines, we create many contexts in loop and
create and submit request and then destoy contexts. Destroying the context
needs to disable scheduling, wait for G2H, deregister context and wait
for G2H to destroy each context. Idling of the gt has to wait for all
this to complete which is taking ~3sec for this test.

Hence we are increasing the igt_flush_test's timeout for gt idling to
3Sec.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/selftests/igt_flush_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/igt_flush_test.c b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
index b84594601d30..b484e12df417 100644
--- a/drivers/gpu/drm/i915/selftests/igt_flush_test.c
+++ b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
@@ -19,7 +19,7 @@ int igt_flush_test(struct drm_i915_private *i915)
 
 	cond_resched();
 
-	if (intel_gt_wait_for_idle(gt, HZ) == -ETIME) {
+	if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
 		pr_err("%pS timed out, cancelling all further testing.\n",
 		       __builtin_return_address(0));
 
-- 
2.20.1

