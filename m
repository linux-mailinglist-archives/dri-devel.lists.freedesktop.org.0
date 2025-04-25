Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D65A9D487
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 23:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5396810E12B;
	Fri, 25 Apr 2025 21:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXIssvqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1B510E12B;
 Fri, 25 Apr 2025 21:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745617941; x=1777153941;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EIWWvmKgMBboLLE0BcMkWvBkcl/vwbnzW30fG0eOKwQ=;
 b=AXIssvqd7wEUjlojscimMcWDMfN2Qu95Qfhy6rWdWJOy9N+3sbhqaFGt
 4LoFaEy+eDw0+pgxt1JCY17aI8LIG2k1NJiZaVUs1snBUYAFHR+02C+mJ
 BHWfzcwcdjh4SB583uF9dUun30/rpaCGX5QMExyQQkfzWFkQ6b0QWgbM/
 pj6R8sj48KGBkpafl+QQQm9tPNRYclyS3H1jSCXhFDH4pNiIVo7hC6GvS
 ZusSFYG+0NRqz1a0ouiouacQ1LnQuxVRTplbf7tLz+ySp4EzysBTb6NaG
 djCaxayktBVmLxjTGE1iCM68ageThmj8psgKvjYe1aUhI3aAzj54/w/2X w==;
X-CSE-ConnectionGUID: 1K/BlgGOQCewQF8LfKeTVg==
X-CSE-MsgGUID: AySgqbBITo6dxsHmYNTqZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57484658"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="57484658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 14:52:20 -0700
X-CSE-ConnectionGUID: z+AE9oj4RcqMOQFG/qMHOQ==
X-CSE-MsgGUID: 6oGlObgEQa+iZ41qQfuAfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="138106268"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2025 14:52:19 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/i915/slpc: Balance the inc/dec for num_waiters
Date: Fri, 25 Apr 2025 14:51:18 -0700
Message-Id: <20250425215118.3035166-1-vinay.belgaumkar@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13598
Cc: Sk Anirban <sk.anirban@intel.com>
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

