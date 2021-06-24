Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC68F3B27B2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540D56EA0E;
	Thu, 24 Jun 2021 06:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C43D6E9FA;
 Thu, 24 Jun 2021 06:47:30 +0000 (UTC)
IronPort-SDR: Lnxi3AhayNOrtMBIjS/6rxQny3U61RdhOznI1Gpi9mbTe6pCTj5IxzzMCEdU6nb6bGKZCueJ0U
 vCELKUvLBPnA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346757"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346757"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: r8xuQqRAkNYmWSjWzuZZaRcLGWSxY/oX0Ed6uHcRiu+6GeGuMCHeeGAtwCfY4UAuvT54cx/eNF
 eBnInw8kibCw==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390917"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/47] drm/i915: Disable preempt busywait when using GuC
 scheduling
Date: Thu, 24 Jun 2021 00:04:47 -0700
Message-Id: <20210624070516.21893-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable preempt busywait when using GuC scheduling. This isn't need as
the GuC control preemption when scheduling.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 87b06572fd2e..f7aae502ec3d 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -506,7 +506,8 @@ gen8_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
 	*cs++ = MI_USER_INTERRUPT;
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
-	if (intel_engine_has_semaphores(rq->engine))
+	if (intel_engine_has_semaphores(rq->engine) &&
+	    !intel_uc_uses_guc_submission(&rq->engine->gt->uc))
 		cs = emit_preempt_busywait(rq, cs);
 
 	rq->tail = intel_ring_offset(rq, cs);
@@ -598,7 +599,8 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
 	*cs++ = MI_USER_INTERRUPT;
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
-	if (intel_engine_has_semaphores(rq->engine))
+	if (intel_engine_has_semaphores(rq->engine) &&
+	    !intel_uc_uses_guc_submission(&rq->engine->gt->uc))
 		cs = gen12_emit_preempt_busywait(rq, cs);
 
 	rq->tail = intel_ring_offset(rq, cs);
-- 
2.28.0

