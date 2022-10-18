Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82C6035BE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 00:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A6510F02C;
	Tue, 18 Oct 2022 22:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9A10F02C;
 Tue, 18 Oct 2022 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666131371; x=1697667371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b1BVCrvlB3rWrMIuwKusAIEUEhLV+kpDl3mXUkURsCY=;
 b=nVlT4BKesxQucScNHWv5Dz1AREVfgcpY4FNjX150fotDhu7JtMvTUA0y
 asGYljbSaovqn89AbqSmMqglnKHUDCwBDYUvrx0P5vx7N9/iIjf+cfrgL
 XgDJ85I1kpuZumuh95JFkHIk1lDR5R8TQ5AIThSQy2ijkHIVo4WCzyYkT
 bJ9uV1bMorSrDcGXYewrvT/R4ZC+3PirJU3LGXOYS4dlOWH+vSvcN9Ow0
 c0feuS17TljkZc0UnLI7o7x0IjQGlRrjzQVMLa+OpGN76SRD3QYOAsmbc
 tRVwPHe858cb6iinXwvzdQKJC/Fi2dymypUop82Mkj9fCoZt/w3HPHqYo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="368301548"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="368301548"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 15:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="628939753"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="628939753"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga002.jf.intel.com with ESMTP; 18 Oct 2022 15:16:10 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/slpc: Optmize waitboost for SLPC
Date: Tue, 18 Oct 2022 15:15:46 -0700
Message-Id: <20221018221546.17852-1-vinay.belgaumkar@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index fc23c562d9b2..a20ae4fceac8 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1005,13 +1005,20 @@ void intel_rps_dec_waiters(struct intel_rps *rps)
 void intel_rps_boost(struct i915_request *rq)
 {
 	struct intel_guc_slpc *slpc;
+	struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
 
 	if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
 		return;
 
+	/* If GuC is already requesting RP0, skip */
+	if (rps_uses_slpc(rps)) {
+		slpc = rps_to_slpc(rps);
+		if (intel_rps_get_requested_frequency(rps) == slpc->rp0_freq)
+			return;
+	}
+
 	/* Serializes with i915_request_retire() */
 	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
-		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
 
 		if (rps_uses_slpc(rps)) {
 			slpc = rps_to_slpc(rps);
-- 
2.35.1

