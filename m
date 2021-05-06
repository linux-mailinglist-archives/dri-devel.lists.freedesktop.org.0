Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E9E375B44
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156DF6EE1E;
	Thu,  6 May 2021 18:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACAD6EDAD;
 Thu,  6 May 2021 18:57:15 +0000 (UTC)
IronPort-SDR: mt8y43erbZzhc19fABmE6StkLsSl3a8mhDqbVCblqHaQVGBJ67FS8/GyaHeRxx2p7/13MZYQOY
 SZxLEAm9YUcw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531041"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: Mb1HRBx7lclpO6mLHvsOKHuIu7os/19XxAwhm1lXVeedyeBYcmPyJRc4h0GJ39eN5nvLSqRpGI
 c027ou/tWQEA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583679"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 96/97] drm/i915/guc: Update GuC documentation
Date: Thu,  6 May 2021 12:14:50 -0700
Message-Id: <20210506191451.77768-97-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 99 ++++++++++++++-----
 1 file changed, 77 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 337ddc0dab6b..594a99ea4f5c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -29,21 +29,6 @@
 /**
  * DOC: GuC-based command submission
  *
- * IMPORTANT NOTE: GuC submission is currently not supported in i915. The GuC
- * firmware is moving to an updated submission interface and we plan to
- * turn submission back on when that lands. The below documentation (and related
- * code) matches the old submission model and will be updated as part of the
- * upgrade to the new flow.
- *
- * GuC stage descriptor:
- * During initialization, the driver allocates a static pool of 1024 such
- * descriptors, and shares them with the GuC. Currently, we only use one
- * descriptor. This stage descriptor lets the GuC know about the workqueue and
- * process descriptor. Theoretically, it also lets the GuC know about our HW
- * contexts (context ID, etc...), but we actually employ a kind of submission
- * where the GuC uses the LRCA sent via the work item instead. This is called
- * a "proxy" submission.
- *
  * The Scratch registers:
  * There are 16 MMIO-based registers start from 0xC180. The kernel driver writes
  * a value to the action register (SOFT_SCRATCH_0) along with any data. It then
@@ -52,13 +37,45 @@
  * processes the request. The kernel driver polls waiting for this update and
  * then proceeds.
  *
- * Work Items:
- * There are several types of work items that the host may place into a
- * workqueue, each with its own requirements and limitations. Currently only
- * WQ_TYPE_INORDER is needed to support legacy submission via GuC, which
- * represents in-order queue. The kernel driver packs ring tail pointer and an
- * ELSP context descriptor dword into Work Item.
- * See gse_add_request()
+ * Command Transport buffers (CTBs):
+ * Covered in detail in other sections but CTBs (host-to-guc, H2G, guc-to-host
+ * G2H) are how the i915 controls submissions.
+ *
+ * Context registration:
+ * Before a context can be submitted it must be registered with the GuC via a
+ * H2G. A unique guc_id associated with each context. The context is either
+ * registered at request creation time (no flow control) or at submission time
+ * (flow control). It will stay registered until the context is destroyed or a
+ * flow control condition is met (e.g. pressure on guc_ids).
+ *
+ * Context submission:
+ * The i915 updates the LRC tail value in memory. Either a schedule enable H2G
+ * or context submit H2G is used to submit a context.
+ *
+ * Context unpin:
+ * To unpin a context a H2G is used to disable scheduling and when the
+ * corresponding G2H returns indicating the scheduling disable operation has
+ * completed it is safe to unpin the context. While a disable is in flight it
+ * isn't safe to resubmit the context so a fence is used to stall all future
+ * requests until the G2H is returned.
+ *
+ * Context deregistration:
+ * Before a context can be destroyed or we steal its guc_id we must deregister
+ * the context with the GuC via H2G. If stealing the guc_id it isn't safe to
+ * submit anything to this guc_id until the deregister completes so a fence is
+ * used to stall all requests associated with this guc_ids until the
+ * corresponding G2H returns indicating the guc_id has been deregistered.
+ *
+ * guc_ids:
+ * Unique number associated with private GuC context data passed in during
+ * context registration / submission / deregistration. 64k available. Simple ida
+ * is used for allocation.
+ *
+ * Stealing guc_ids:
+ * If no guc_ids are available they can be stolen from another context at
+ * request creation time if that context is unpinned. If nothing can be found at
+ * request creation time, flow control is triggered (serializing all submission
+ * until flow control exits) and guc_ids are stolden at submission time.
  *
  * GuC flow control state machine:
  * The tasklet, workqueue (retire_worker), and the G2H handlers together more or
@@ -79,6 +96,44 @@
  * STALL_MOVE_LRC_TAIL		Tasklet will try to move LRC tail
  * STALL_ADD_REQUEST		Tasklet will try to add the request (submit
  *				context)
+ *
+ * Locking:
+ * In the GuC submission code we have 4 basic spin locks which protect
+ * everything. Details about each below.
+ *
+ * gse->sched_engine->lock
+ * This is the submission lock for all contexts that share a GuC submit engine
+ * (gse), thus only 1 context which share a gse can be submitting at a time.
+ *
+ * guc->contexts_lock
+ * Protects guc_id allocation. Global lock i.e. Only 1 context that uses GuC
+ * submission can hold this at a time.
+ *
+ * ce->guc_state.lock
+ * Protects everything under ce->guc_state. Ensures that a context is in the
+ * correct state before issuing a H2G. e.g. We don't issue a schedule disable
+ * on disabled context (bad idea), we don't issue schedule enable when a
+ * schedule disable is inflight, etc... Lock individual to each context.
+ *
+ * ce->guc_active.lock
+ * Protects everything under ce->guc_active which is the current requests
+ * inflight on the context / priority management. Lock individual to each
+ * context.
+ *
+ * Lock ordering rules:
+ * ce->guc_state.lock -> gse->sched_engine->lock -> ce->guc_active.lock
+ * gse->sched_engine->lock -> guc->contexts_lock
+ *
+ * Reset races:
+ * When a GPU full reset is triggered it is assumed that some G2H responses to
+ * a H2G can be lost as the GuC is likely toast. Losing these G2H can prove to
+ * fatal as we do certain operations upon receiving a G2H (e.g. destroy
+ * contexts, release guc_ids, etc...). Luckly when this occurs we can scrub
+ * context state and cleanup appropriately, however this is quite racey. To
+ * avoid races the rules are check for submission being disabled (i.e. check for
+ * mid reset) with the appropriate lock being held. If submission is disabled
+ * don't send the H2G. The reset code must disable submission and flush all
+ * locks before scrubbing for missing G2H.
  */
 
 static struct intel_context *
-- 
2.28.0

