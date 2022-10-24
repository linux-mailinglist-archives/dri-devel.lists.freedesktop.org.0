Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581A60B39A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 19:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3F910E470;
	Mon, 24 Oct 2022 17:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FDC10E470;
 Mon, 24 Oct 2022 17:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666631500; x=1698167500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AdqBzxwJJzTj8gqrrzrBRfhiuEO4hV7/0OScqLSKirc=;
 b=Rjn9pEQVXEU3VMTZCe+hb+YE2EuQKhejtJUL5ySAyWzojHwTbWUbbT2X
 n8WhNy6GE95MT2LxLSi+0/Eaja6Jo5nvzhowyTSwC7P3dc1JyEtrPldhB
 jgPbpWNXcQoajyvFWti2YUpfoJu3fFzTvhRRdjPml0+KNsu9zUzhJLnJ8
 HmLCj7NBK4DxAX0pAWiRsfLvL/Z4+hkjhH6+kuuFEvfu6v70JUKlQQ7IS
 wAiFXqHBctcy76u9vFxJK0QwThWi+Mit2Sz9lOSZycgbUOzIL+ohJb9Yc
 4BsBZy9+GSkU4Ys2lnNCkOkyslnKkzKZ2OUfBGJLubDBSVmCb1icDHsZN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="305087722"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="305087722"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 10:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609269436"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609269436"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 24 Oct 2022 10:11:37 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5] drm/i915/slpc: Optmize waitboost for SLPC
Date: Mon, 24 Oct 2022 10:11:08 -0700
Message-Id: <20221024171108.14373-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Waitboost (when SLPC is enabled) results in a H2G message. This can result
in thousands of messages during a stress test and fill up an already full
CTB. There is no need to request for boost if min softlimit is equal or
greater than it.

v2: Add the tracing back, and check requested freq
in the worker thread (Tvrtko)
v3: Check requested freq in dec_waiters as well
v4: Only check min_softlimit against boost_freq. Limit this
optimization for server parts for now.
v5: min_softlimit can be greater than boost (Ashutosh)

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index fc23c562d9b2..2ece7a559cde 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1016,9 +1016,15 @@ void intel_rps_boost(struct i915_request *rq)
 		if (rps_uses_slpc(rps)) {
 			slpc = rps_to_slpc(rps);
 
+			if (slpc->min_freq_softlimit >= slpc->boost_freq)
+				return;
+
 			/* Return if old value is non zero */
-			if (!atomic_fetch_inc(&slpc->num_waiters))
+			if (!atomic_fetch_inc(&slpc->num_waiters)) {
+				GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
+					 rq->fence.context, rq->fence.seqno);
 				schedule_work(&slpc->boost_work);
+			}
 
 			return;
 		}
-- 
2.35.1

