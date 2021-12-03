Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D680A4680F2
	for <lists+dri-devel@lfdr.de>; Sat,  4 Dec 2021 00:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F828AB621;
	Fri,  3 Dec 2021 23:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF324AB620;
 Fri,  3 Dec 2021 23:56:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="237016981"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="237016981"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 15:56:43 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="678282784"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 15:56:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Rollback seqno when request creation fails
Date: Fri,  3 Dec 2021 15:51:12 -0800
Message-Id: <20211203235112.3358-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gem_ctx_create.basic-files can slam on kernel contexts to the extent
where request creation fails because the ring is full. When this happens
seqno numbers are skipped which can result the below GEM_BUG_ON blowing
in gt/intel_engine_pm.c:__engine_unpark:

GEM_BUG_ON(ce->timeline->seqno !=
           READ_ONCE(*ce->timeline->hwsp_seqno));

Fixup request creation code to roll back seqno when request creation
fails.

v2:
 (CI)
  - Fix build error

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_timeline.c | 8 ++++++++
 drivers/gpu/drm/i915/gt/intel_timeline.h | 1 +
 drivers/gpu/drm/i915/i915_request.c      | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index 438bbc7b8147..3785e5605549 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -301,6 +301,14 @@ static u32 timeline_advance(struct intel_timeline *tl)
 	return tl->seqno += 1 + tl->has_initial_breadcrumb;
 }
 
+void intel_timeline_rollback_seqno(struct intel_timeline *tl)
+{
+	GEM_BUG_ON(!atomic_read(&tl->pin_count));
+	GEM_BUG_ON(tl->seqno & tl->has_initial_breadcrumb);
+
+	tl->seqno -= 1 + tl->has_initial_breadcrumb;
+}
+
 static noinline int
 __intel_timeline_get_seqno(struct intel_timeline *tl,
 			   u32 *seqno)
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.h b/drivers/gpu/drm/i915/gt/intel_timeline.h
index 57308c4d664a..a2f2e0ea186f 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.h
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.h
@@ -72,6 +72,7 @@ void intel_timeline_enter(struct intel_timeline *tl);
 int intel_timeline_get_seqno(struct intel_timeline *tl,
 			     struct i915_request *rq,
 			     u32 *seqno);
+void intel_timeline_rollback_seqno(struct intel_timeline *tl);
 void intel_timeline_exit(struct intel_timeline *tl);
 void intel_timeline_unpin(struct intel_timeline *tl);
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index a72c8f0346a0..86f32ee082f7 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -966,6 +966,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 
 err_unwind:
 	ce->ring->emit = rq->head;
+	intel_timeline_rollback_seqno(tl);
 
 	/* Make sure we didn't add ourselves to external state before freeing */
 	GEM_BUG_ON(!list_empty(&rq->sched.signalers_list));
-- 
2.33.1

