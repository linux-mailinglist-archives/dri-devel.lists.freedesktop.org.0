Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A4FA9F8B0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E1710E23C;
	Mon, 28 Apr 2025 18:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xd4FNjLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADD510E233;
 Mon, 28 Apr 2025 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745865408; x=1777401408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sn0Gj3DrQO4kqTKFj5M9ENCciwJnG1UsZz0J425zSWg=;
 b=Xd4FNjLnOVh2vBZlMflroVy5v48vCAsBnyx7ZBOLBzERiCQ2T6Yoem0D
 AoQhAnMfTFX+BNy56yD0xCfEXCNd/7u8+pI1eIEb6HTq5NPAhA6yBszu+
 D2RwG9nZhWgdXsVfudHGK1XWYTdw5vEj6+LdrBIDMe8g0T702VK8d0IOM
 1qSfp5wUeUHUMIiu1mwpLamJSwf0v8hjpeZ3oYhR7Axo65qGqPLos9fjz
 uW8s5Wt4dYJjI4dor4d5oFHiq+r8b4z3aeVAXJH0CxZMDAbOF/F6HY62S
 ypv6RcBALtpspNx1ABKjCLjY+Jaxrhg+NHU5fCaKRaSqol7SH1L/Kgp0S g==;
X-CSE-ConnectionGUID: N3s2KQArRhimc5OI9nQbBg==
X-CSE-MsgGUID: QjjcdCkJR7GOSk2jznirsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="65003749"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="65003749"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 11:36:47 -0700
X-CSE-ConnectionGUID: 7A/HKTWUSHm/MpbPrNS1Cg==
X-CSE-MsgGUID: GMAbaPjIQL6RMQmEA6SwPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="133909867"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa008.fm.intel.com with ESMTP; 28 Apr 2025 11:36:47 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2] drm/i915/slpc: Balance the inc/dec for num_waiters
Date: Mon, 28 Apr 2025 11:35:55 -0700
Message-Id: <20250428183555.3250021-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

As seen in some recent failures, SLPC num_waiters value is < 0.
This happens because the inc/dec are not balanced. We should skip
decrement for the same conditions as the increment. Currently, we
do that for power saving profile mode. This patch also ensures that
num_waiters is incremented in the case min_softlimit is at boost
freq. It ensures that we don't reduce the frequency while this request
is in flight.

v2: Add Fixes tags

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13598
Fixes: f864a29afc32 ("drm/i915/slpc: Optmize waitboost for SLPC")
Fixes: 4a82ceb04ad4 ("drm/i915/slpc: Add sysfs for SLPC power profiles")
Cc: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 8731f275fdd9..b609e3aa2122 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1003,6 +1003,10 @@ void intel_rps_dec_waiters(struct intel_rps *rps)
 	if (rps_uses_slpc(rps)) {
 		slpc = rps_to_slpc(rps);
 
+		/* Don't decrement num_waiters for req where increment was skipped */
+		if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
+			return;
+
 		intel_guc_slpc_dec_waiters(slpc);
 	} else {
 		atomic_dec(&rps->num_waiters);
@@ -1031,11 +1035,15 @@ void intel_rps_boost(struct i915_request *rq)
 			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
 				return;
 
-			if (slpc->min_freq_softlimit >= slpc->boost_freq)
-				return;
-
 			/* Return if old value is non zero */
 			if (!atomic_fetch_inc(&slpc->num_waiters)) {
+				/*
+				 * Skip queuing boost work if frequency is already boosted,
+				 * but still increment num_waiters.
+				 */
+				if (slpc->min_freq_softlimit >= slpc->boost_freq)
+					return;
+
 				GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
 					 rq->fence.context, rq->fence.seqno);
 				queue_work(rps_to_gt(rps)->i915->unordered_wq,
-- 
2.38.1

