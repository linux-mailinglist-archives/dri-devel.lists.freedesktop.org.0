Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF394B5FE4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621FD10E3BD;
	Tue, 15 Feb 2022 01:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D0310E3BA;
 Tue, 15 Feb 2022 01:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644887675; x=1676423675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bgzf1R0oui967Sawt6/XmNfFsAvWNxVUE/W9jzQKDy0=;
 b=eEDOpLn+qtVHyb3zxzlBHon3ddx03GN7oueUjK9t1Hr30hTD3F7IyN8h
 DB2j53TsoFL/GI7K63CC2zuA//mQue2svhnPJ1glfVPYUpAEp5w8FTw0e
 BqMgb3n9Jocq/i9ttECeu4RADN4Kn9yPI1Wo/0i8lykH9bw6F7Y/2p5gG
 1SL9sr7FQH2vW8rq6jf0/WQoWqgkA+YP4FsE5XCgWfLUKoBNyZGQtUb61
 V0jjqDql6tkYS4g1/izcuHtY+TN6qoJcdKDCuKaUn1Rs4/zt+Bm/1HL/V
 sdWycQqNuPqrGf9JgtbB1qFKoMo+bxzFCiBpJ0i8ZV/4YYNStRkimM5Ty A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250428629"
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; d="scan'208";a="250428629"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 17:14:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; d="scan'208";a="703360547"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 17:14:34 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Initialize GuC submission locks and queues early
Date: Mon, 14 Feb 2022 17:11:23 -0800
Message-Id: <20220215011123.734572-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move initialization of submission-related spinlock, lists and workers to
init_early. This fixes an issue where if the GuC init fails we might
still try to get the lock in the context cleanup code. Note that it is
safe to call the GuC context cleanup code even if the init failed
because all contexts are initialized with an invalid GuC ID, which will
cause the GuC side of the cleanup to be skipped, so it is easier to just
make sure the variables are initialized than to special case the cleanup
to handle the case when they're not.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/4932
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0da..2160da2c83cbf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1818,24 +1818,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	 */
 	GEM_BUG_ON(!guc->lrc_desc_pool);
 
-	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
-
-	spin_lock_init(&guc->submission_state.lock);
-	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
-	ida_init(&guc->submission_state.guc_ids);
-	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
-	INIT_WORK(&guc->submission_state.destroyed_worker,
-		  destroyed_worker_func);
-	INIT_WORK(&guc->submission_state.reset_fail_worker,
-		  reset_fail_worker_func);
-
 	guc->submission_state.guc_ids_bitmap =
 		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
 	if (!guc->submission_state.guc_ids_bitmap)
 		return -ENOMEM;
 
-	spin_lock_init(&guc->timestamp.lock);
-	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
 	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
 	guc->timestamp.shift = gpm_timestamp_shift(gt);
 
@@ -3831,6 +3818,20 @@ static bool __guc_submission_selected(struct intel_guc *guc)
 
 void intel_guc_submission_init_early(struct intel_guc *guc)
 {
+	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
+
+	spin_lock_init(&guc->submission_state.lock);
+	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
+	ida_init(&guc->submission_state.guc_ids);
+	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
+	INIT_WORK(&guc->submission_state.destroyed_worker,
+		  destroyed_worker_func);
+	INIT_WORK(&guc->submission_state.reset_fail_worker,
+		  reset_fail_worker_func);
+
+	spin_lock_init(&guc->timestamp.lock);
+	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
+
 	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
 	guc->submission_supported = __guc_submission_supported(guc);
 	guc->submission_selected = __guc_submission_selected(guc);
-- 
2.25.1

