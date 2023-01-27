Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8572B67DACE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A0210E161;
	Fri, 27 Jan 2023 00:29:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B9110E157;
 Fri, 27 Jan 2023 00:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674779340; x=1706315340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMGVM3oKDx1++G5z9tXhnD/tSjRvUWveU/E16hB4uys=;
 b=WloEnYf606i1G+nU9w0ph57EQzLpDmpkhiphfmIHzjtvHjZOhw4d9GyP
 M0pgVa8qMGu/rtspUdfOPfy1maUhkoC5TqiVTMtpk7M+trcDG8knsFuvN
 MbbGgf3Iati5E3nkvmJM35sDNPMJbBBOm7lGmdMGazk1tOLZGQPh0NQOu
 OVFt23kB2ZziBsVZty3eYd4XDLwP0w9luc51fcWWFFhdGdrYuHCdRNZcs
 cAgA3NepGF7bmHvwGux1mQ28qAkuCYax8uEwIHyKk9QgsIYuOxXT0qVhH
 5W2+aXzrydgZkrUKkIENF7f3MrGKiRaEerqDTloOVEfYjN6aF/6vxVVmE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="324687310"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="324687310"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 16:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805621913"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="805621913"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2023 16:28:52 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v6 5/8] drm/i915: Allow error capture of a pending request
Date: Thu, 26 Jan 2023 16:28:39 -0800
Message-Id: <20230127002842.3169194-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127002842.3169194-1-John.C.Harrison@Intel.com>
References: <20230127002842.3169194-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A hang situation has been observed where the only requests on the
context were either completed or not yet started according to the
breaadcrumbs. However, the register state claimed a batch was (maybe)
in progress. So, allow capture of the pending request on the grounds
that this might be better than nothing.

v2: Reword 'not started' warning message (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 225f1b11a6b93..904f21e1380cd 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1624,12 +1624,9 @@ capture_engine(struct intel_engine_cs *engine,
 		return NULL;
 
 	intel_engine_get_hung_entity(engine, &ce, &rq);
-	if (rq && !i915_request_started(rq)) {
+	if (rq && !i915_request_started(rq))
 		drm_info(&engine->gt->i915->drm, "Got hung context on %s with active request %lld:%lld [0x%04X] not yet started\n",
 			 engine->name, rq->fence.context, rq->fence.seqno, ce->guc_id.id);
-		i915_request_put(rq);
-		rq = NULL;
-	}
 
 	if (rq) {
 		capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
-- 
2.39.1

