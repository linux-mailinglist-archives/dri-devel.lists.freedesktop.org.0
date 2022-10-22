Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB436082D5
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 02:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A08D10E688;
	Sat, 22 Oct 2022 00:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E7710E688;
 Sat, 22 Oct 2022 00:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666398333; x=1697934333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z1UilT44Yjelz3Tc3wyWL9hS8/jkr7z5/uqckIKNdpc=;
 b=X+TOmGuN0V92OjK90S5j1EA5T+9GNqoMJhLD3OrDr6OTLfAcZCFbCjkF
 yVBuK5UbnwTjS01IWD488KiqA8W3ANcTwy9FwB1017Gx+GIm8W5kGHkmt
 ZvZotkFfKSUeMM6LD+G4PTDeYIZRiM+r+oC2sobO81nQPAvRQIS7+Uu+D
 jEjZMCdpWB/KDzDwNpm4wlmZhiI8WwXewerSSKIPEdKDViHYSV4d2Hi62
 K8AdOPCWt+zrfKJ7TTtHzMYaObDOsKyc1sNpiYSSe6w5Ogh7E+jSRoU+C
 lHUL1rbK1hBK9le95HA0Uyw8OrfSrfBJp6ZHcj6+YyNvEWT02u3W2g9YR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="294533932"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="294533932"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="608576062"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="608576062"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 21 Oct 2022 17:25:31 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/i915/slpc: Optmize waitboost for SLPC
Date: Fri, 21 Oct 2022 17:24:52 -0700
Message-Id: <20221022002452.36716-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Waitboost (when SLPC is enabled) results in a H2G message. This can result
in thousands of messages during a stress test and fill up an already full
CTB. There is no need to request for RP0 if boost_freq and the min softlimit
are the same.

v2: Add the tracing back, and check requested freq
in the worker thread (Tvrtko)
v3: Check requested freq in dec_waiters as well
v4: Only check min_softlimit against boost_freq. Limit this
optimization for server parts for now.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index fc23c562d9b2..32e1f5dde5bb 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1016,9 +1016,15 @@ void intel_rps_boost(struct i915_request *rq)
 		if (rps_uses_slpc(rps)) {
 			slpc = rps_to_slpc(rps);
 
+			if (slpc->min_freq_softlimit == slpc->boost_freq)
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

