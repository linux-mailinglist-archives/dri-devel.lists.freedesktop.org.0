Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475C67C20A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 01:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC2210E8D4;
	Thu, 26 Jan 2023 00:54:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D6610E8D3;
 Thu, 26 Jan 2023 00:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674694473; x=1706230473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMGVM3oKDx1++G5z9tXhnD/tSjRvUWveU/E16hB4uys=;
 b=PrLZrwyyAdqx7YMq8FtoN39GFTkvc5yfSugS9vfHuw7LavOZEiO/4pTg
 PtVlPsQ2sLJlaTfPvB7aVR4A7s/N25J7/hy/Y/44xDmxGpWklin3YakTf
 YcOQijBc5TenQ0Ufto+t+dq/MchUYQ35sI8a6psrslWiEnDfZsVle3vAP
 FMxpmT05F8smkGzT09KXzKDgJkgCsxB34IS5pAz9stDiWBj8byBpjccGB
 Sf0z7W5V8BnFlZsIKlsjbqLi+FoZ64JKto0dL4i8ravypJsJNywnG4bCS
 5c7ujvGIs0tkJzcbxJF1zgXukletB1TF/2svzArcGKjEu+Enq38gt5RDf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="389064429"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="389064429"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 16:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="751404293"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="751404293"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2023 16:54:32 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v5 5/8] drm/i915: Allow error capture of a pending request
Date: Wed, 25 Jan 2023 16:54:17 -0800
Message-Id: <20230126005420.160070-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126005420.160070-1-John.C.Harrison@Intel.com>
References: <20230126005420.160070-1-John.C.Harrison@Intel.com>
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

