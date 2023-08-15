Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF0977D416
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 22:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3C210E293;
	Tue, 15 Aug 2023 20:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1410E294;
 Tue, 15 Aug 2023 20:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692131360; x=1723667360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ReswyNDgQzA3g8so7QVV8af56vcYeIhA2sXH7Xg/Knw=;
 b=iL1b2v2di5AFlkSEBF3PPTqq3WZXMGEwB7bvMXbOGR/iiptzNsscxRMi
 r+CdPlVlLm2Fg+YC/XnMEViBnKUM5oEy/L16yaFXZwKXvOU8zcoHls2yD
 /RL1LRtk2lwp8JNNZ3jLrRuM7iPvEIpQ0E1gAqsIkbVqqZbbcJzPB8gs/
 lPmb2BxOMb2vn6LsPJEzPgtIQHASYNNP+zKBzd+PMkRTVp9r2WYQIlwob
 VdTOR7kcWAeDa+gpx2P3lUlyw3K+Sni3zHPu8UUbsaPQNDtUCHbG50TBe
 SHM5AK0GHl1n/63sg++mmQgzmrN2Ie2b/u3AfOE39stl8pCvMdDQJlBLX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372366875"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="372366875"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 13:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="907746494"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="907746494"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 15 Aug 2023 13:29:18 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/i915/pxp/mtl: Update pxp-firmware response timeout
Date: Tue, 15 Aug 2023 13:29:14 -0700
Message-Id: <20230815202916.1211768-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230815202916.1211768-1-alan.previn.teres.alexis@intel.com>
References: <20230815202916.1211768-1-alan.previn.teres.alexis@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the max GSC-fw response time to match updated internal
fw specs. Because this response time is an SLA on the firmware,
not inclusive of i915->GuC->HW handoff latency, when submitting
requests to the GSC fw via intel_gsc_uc_heci_cmd_submit_nonpriv,
start the count after the request hits the GSC command streamer.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 3 +++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h                | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
index 89ed5ee9cded..ae45855594ac 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
@@ -186,6 +186,9 @@ intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
 	i915_request_add(rq);
 
 	if (!err) {
+		if (wait_for(i915_request_started(rq), 200))
+			drm_dbg(&gsc_uc_to_gt(gsc)->i915->drm,
+				"Delay in gsc-heci-non-priv submission to gsccs-hw");
 		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
 				      msecs_to_jiffies(timeout_ms)) < 0)
 			err = -ETIME;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
index 298ad38e6c7d..4368f010bbd3 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -10,10 +10,10 @@
 
 struct intel_pxp;
 
-#define GSC_REPLY_LATENCY_MS 210
+#define GSC_REPLY_LATENCY_MS 350
 /*
- * Max FW response time is 200ms, to which we add 10ms to account for overhead
- * such as request preparation, GuC submission to hw and pipeline completion times.
+ * Max FW response time is 350ms, but this should be counted from the time the
+ * command has hit the GSC-CS hardware, not the preceding handoff to GuC CTB.
  */
 #define GSC_PENDING_RETRY_MAXCOUNT 40
 #define GSC_PENDING_RETRY_PAUSE_MS 50
-- 
2.39.0

