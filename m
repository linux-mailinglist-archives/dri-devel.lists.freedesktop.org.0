Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C566E88C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 22:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D03910E5EA;
	Tue, 17 Jan 2023 21:37:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7764B10E5E1;
 Tue, 17 Jan 2023 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673991414; x=1705527414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S2qa84XPCfwCvLSibgiJ0AamPPWLfsfr8XdwHJ/JzZs=;
 b=OIHwyexFV/8vl6VTbbimPDOPjtUAnv2jMGK14jzTfiwpRPStw8j7vXq2
 hW5v9mMSWJ1P2wCke1pK3pEoXajB2qsBJw+C9IIZdwPa3DLIs4sOObm43
 pNY5gClLGr+REzTT7r5qhjhvhBz9aZz7A+dE3++0mRA6ZmzJUcGGwnH4M
 lua5G9IlLYXeeTtrdLJTdy2FhDloecl5uOpMGcH5aF5JqK3aUXom2FIwB
 UYTdiH0LZYEFkI5oxw3Tr0ZSyDsmGYceFwWg7hGYbFuaOnpX1kPZ1L0rB
 VM1grPJzCkM9/SQ5vg56bERC2hV5XEAE41tHI3ym9LrI31Xwqg6hsJDCu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312696227"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="312696227"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 13:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="988285027"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="988285027"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2023 13:36:53 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 3/5] drm/i915: Allow error capture of a pending request
Date: Tue, 17 Jan 2023 13:36:28 -0800
Message-Id: <20230117213630.2897570-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
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

v2: Reword 'not started' warning message (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 461489d599a7e..1d33822a8ca23 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1629,12 +1629,9 @@ capture_engine(struct intel_engine_cs *engine,
 		intel_engine_clear_hung_context(engine);
 		/* This will reference count the request (if found) */
 		rq = intel_context_find_active_request(ce);
-		if (rq && !i915_request_started(rq)) {
-			drm_info(&engine->gt->i915->drm, "Got hung context on %s with no active request!\n",
-				 engine->name);
-			i915_request_put(rq);
-			rq = NULL;
-		}
+		if (rq && !i915_request_started(rq))
+			drm_info(&engine->gt->i915->drm, "Got hung context on %s with active request %lld:%lld [0x%04X] not yet started\n",
+				 engine->name, rq->fence.context, rq->fence.seqno, ce->guc_id.id);
 	} else {
 		/*
 		 * Getting here with GuC enabled means it is a forced error capture
-- 
2.39.0

