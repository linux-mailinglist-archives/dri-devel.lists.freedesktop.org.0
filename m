Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA3466691E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 03:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5982210E854;
	Thu, 12 Jan 2023 02:53:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0497110E2D8;
 Thu, 12 Jan 2023 02:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673492023; x=1705028023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XnRmxT4Yo4EB6vMENnHBwfcxOtPanwyqtRWI9HJBVS4=;
 b=DrZfkvhvyC8bAb5Jj4jDDeuZ0ukzHPCqNp2/T1P6VyD4mPSZ63v9IOrw
 P8VpB5nfKpm58dP41XmtZJGHdvo48V5IyGfyCBKS43R9W8OyCLagGxxv7
 1cC3rERs2W2XyK031N14XUT8883BTestfuQH3ArMVn4IID8+4e3f4BIGR
 tTkvVwv/mlywelfP8GmMJRotQPzBRaX2oLt7C1YBP6vNEGrpzTsv9gSHI
 5BPtbrWwFwT7UT4t6a0/ME5r9nkj0jfZKfP8B9YR3wY0IE6DKju/0TMSY
 lJpyraGP61z9tFHCWWDAjv4rIbXdg7YZamdLO3uTT+D85KmzL43BTCCLQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350823500"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="350823500"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 18:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="986359629"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="986359629"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jan 2023 18:53:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/4] drm/i915: Allow error capture of a pending request
Date: Wed, 11 Jan 2023 18:53:09 -0800
Message-Id: <20230112025311.2577084-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A hang situation has been observed where the only requests on the
context were either completed or not yet started according to the
breaadcrumbs. However, the register state claimed a batch was (maybe)
in progress. So, allow capture of the pending request on the grounds
that this might be better than nothing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index bd2cf7d235df0..2e338a9667a4b 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1628,11 +1628,9 @@ capture_engine(struct intel_engine_cs *engine,
 	if (ce) {
 		intel_engine_clear_hung_context(engine);
 		rq = intel_context_find_active_request(ce);
-		if (rq && !i915_request_started(rq)) {
-			drm_info(&engine->gt->i915->drm, "Got hung context on %s with no active request!\n",
-				 engine->name);
-			rq = NULL;
-		}
+		if (rq && !i915_request_started(rq))
+			drm_info(&engine->gt->i915->drm, "Confused - active request not yet started: %lld:%lld, ce = 0x%04X/%s!\n",
+				 rq->fence.context, rq->fence.seqno, ce->guc_id.id, engine->name);
 	} else {
 		/*
 		 * Getting here with GuC enabled means it is a forced error capture
-- 
2.39.0

