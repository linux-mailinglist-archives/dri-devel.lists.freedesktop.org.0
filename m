Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF43DF750
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB7889E3B;
	Tue,  3 Aug 2021 22:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A22989B48;
 Tue,  3 Aug 2021 22:11:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745893"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745893"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512698"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/46] drm/i915/guc: Check return of __xa_store when
 registering a context
Date: Tue,  3 Aug 2021 15:29:03 -0700
Message-Id: <20210803222943.27686-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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

Check return of __xa_store when registering a context as this can fail
in a rare case if not memory can not be allocated. If this occurs fall
back on the tasklet flow control and try again in the future.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 842094de848d..a7f7174b5343 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -505,18 +505,24 @@ static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
 	return __get_context(guc, id);
 }
 
-static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
-					   struct intel_context *ce)
+static inline int set_lrc_desc_registered(struct intel_guc *guc, u32 id,
+					  struct intel_context *ce)
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
 
 static int guc_submission_send_busy_loop(struct intel_guc *guc,
@@ -1854,7 +1860,9 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
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

