Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 306A760547C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 02:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986DF10E175;
	Thu, 20 Oct 2022 00:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DE710E13D;
 Thu, 20 Oct 2022 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666225805; x=1697761805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nEJZ6GkF0ScYDUEj7xbr66zKGQ4iLqTWcqXdisS+bRk=;
 b=OcmKf3TLhD81UICYxmLeQllo7yGWtf6fd/9P7dPC9eTRCy00Jdc+pV/w
 xZXMOw9Hhh9k9MC1TC75Deet/N2KFPDFgkwQEP1pa6NVFJiPo2FnD5HV6
 CO8a5Wlu94UQXdP5DjpFyWyRWvpkUU2m1lAR/LA+iWwYr/uQUXwTs8EEP
 LX0x3qE8au8cl7DcilwhT9xHjl+RUxUQLhjNNmhfzsNMMTkMmU3QRriGY
 5VDSeFIsb6qtrHWNJhOhHVo0vx1VOIDRpBpPZ0TPzeeOJbDqf4ZWGJCuK
 J9NqsQi6474cAi3mMjxx6JysNXOpCQ9QxqRaK9KZOTa09G1U2X6AZPN08 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="307666796"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="307666796"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 17:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="718740846"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="718740846"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2022 17:30:04 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/slpc: Optmize waitboost for SLPC
Date: Wed, 19 Oct 2022 17:29:44 -0700
Message-Id: <20221020002944.4228-1-vinay.belgaumkar@intel.com>
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
CTB. There is no need to request for RP0 if GuC is already requesting the
same.

v2: Add the tracing back, and check requested freq
in the worker thread (Tvrtko)
v3: Check requested freq in dec_waiters as well

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c         |  3 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 14 +++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index fc23c562d9b2..18b75cf08d1b 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1016,6 +1016,9 @@ void intel_rps_boost(struct i915_request *rq)
 		if (rps_uses_slpc(rps)) {
 			slpc = rps_to_slpc(rps);
 
+			GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
+				 rq->fence.context, rq->fence.seqno);
+
 			/* Return if old value is non zero */
 			if (!atomic_fetch_inc(&slpc->num_waiters))
 				schedule_work(&slpc->boost_work);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index b7cdeec44bd3..9dbdbab1515a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -227,14 +227,19 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 static void slpc_boost_work(struct work_struct *work)
 {
 	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
+	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
 	int err;
 
 	/*
 	 * Raise min freq to boost. It's possible that
 	 * this is greater than current max. But it will
 	 * certainly be limited by RP0. An error setting
-	 * the min param is not fatal.
+	 * the min param is not fatal. No need to boost
+	 * if we are already requesting it.
 	 */
+	if (intel_rps_get_requested_frequency(rps) == slpc->boost_freq)
+		return;
+
 	mutex_lock(&slpc->lock);
 	if (atomic_read(&slpc->num_waiters)) {
 		err = slpc_force_min_freq(slpc, slpc->boost_freq);
@@ -728,6 +733,7 @@ int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val)
 
 void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
 {
+	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
 	/*
 	 * Return min back to the softlimit.
 	 * This is called during request retire,
@@ -735,8 +741,10 @@ void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
 	 * set_param fails.
 	 */
 	mutex_lock(&slpc->lock);
-	if (atomic_dec_and_test(&slpc->num_waiters))
-		slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
+	if (atomic_dec_and_test(&slpc->num_waiters)) {
+		if (intel_rps_get_requested_frequency(rps) != slpc->min_freq_softlimit)
+			slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
+	}
 	mutex_unlock(&slpc->lock);
 }
 
-- 
2.35.1

