Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE332375B50
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A437A6EE2B;
	Thu,  6 May 2021 18:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD716EDA6;
 Thu,  6 May 2021 18:57:15 +0000 (UTC)
IronPort-SDR: umOQ+7Fwqa9fHNbCgPzMoCcykU4P2Xaa5SARlEIxrbi34l2YK1D1xnuqPEd2SEAnr3Iist/2dG
 GixG1YilSGsQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531038"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531038"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: 8/aiaH1YCwlC7pYC8cfSLOxHlrNtI5FVHL57z8fefnysrqL83X6o3rdd311R4I744cNc8RmV+t
 2TpUVXHNH2nw==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583652"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 89/97] drm/i915/guc: Check return of __xa_store when
 registering a context
Date: Thu,  6 May 2021 12:14:43 -0700
Message-Id: <20210506191451.77768-90-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check return of __xa_store when registering a context as this can fail
in a rare case if not memory can not be allocated. If this occurs fall
back on the tasklet flow control and try again in the future.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3157eeb2599..608b30907f4c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -503,18 +503,24 @@ static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
 	return __get_context(guc, id);
 }
 
-static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
+static inline int set_lrc_desc_registered(struct intel_guc *guc, u32 id,
 					   struct intel_context *ce)
 {
 	unsigned long flags;
+	void *ret;
 
 	/*
 	 * xarray API doesn't have xa_save_irqsave wrapper, so calling the
 	 * lower level functions directly.
 	 */
 	xa_lock_irqsave(&guc->context_lookup, flags);
-	__xa_store(&guc->context_lookup, id, ce, GFP_ATOMIC);
+	ret = __xa_store(&guc->context_lookup, id, ce, GFP_ATOMIC);
 	xa_unlock_irqrestore(&guc->context_lookup, flags);
+
+	if (unlikely(xa_is_err(ret)))
+		return -EBUSY;	/* Try again in future */
+
+	return 0;
 }
 
 static int guc_submission_busy_loop(struct intel_guc* guc,
@@ -1831,7 +1837,9 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	rcu_read_unlock();
 
 	reset_lrc_desc(guc, desc_idx);
-	set_lrc_desc_registered(guc, desc_idx, ce);
+	ret = set_lrc_desc_registered(guc, desc_idx, ce);
+	if (unlikely(ret))
+		return ret;
 
 	desc = __get_lrc_desc(guc, desc_idx);
 	desc->engine_class = engine_class_to_guc_class(engine->class);
-- 
2.28.0

