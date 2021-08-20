Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60A33F36E0
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 00:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670A06EB36;
	Fri, 20 Aug 2021 22:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680276EB2B;
 Fri, 20 Aug 2021 22:50:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216580032"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216580032"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="513098560"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>,
	<tony.ye@intel.com>,
	<zhengguo.xu@intel.com>
Subject: [PATCH 02/27] drm/i915/guc: Allow flexible number of context ids
Date: Fri, 20 Aug 2021 15:44:21 -0700
Message-Id: <20210820224446.30620-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210820224446.30620-1-matthew.brost@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
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

Number of available GuC contexts ids might be limited.
Stop referring in code to macro and use variable instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 112dd29a63fe..6fd2719d1b75 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -60,6 +60,10 @@ struct intel_guc {
 	spinlock_t contexts_lock;
 	/** @guc_ids: used to allocate new guc_ids */
 	struct ida guc_ids;
+	/** @num_guc_ids: number of guc_ids that can be used */
+	u32 num_guc_ids;
+	/** @max_guc_ids: max number of guc_ids that can be used */
+	u32 max_guc_ids;
 	/**
 	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
 	 */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 46158d996bf6..8235e49bb347 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -344,7 +344,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 {
 	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
 
-	GEM_BUG_ON(index >= GUC_MAX_LRC_DESCRIPTORS);
+	GEM_BUG_ON(index >= guc->max_guc_ids);
 
 	return &base[index];
 }
@@ -353,7 +353,7 @@ static struct intel_context *__get_context(struct intel_guc *guc, u32 id)
 {
 	struct intel_context *ce = xa_load(&guc->context_lookup, id);
 
-	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
+	GEM_BUG_ON(id >= guc->max_guc_ids);
 
 	return ce;
 }
@@ -363,8 +363,7 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
 	u32 size;
 	int ret;
 
-	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
-			  GUC_MAX_LRC_DESCRIPTORS);
+	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) * guc->max_guc_ids);
 	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
 					     (void **)&guc->lrc_desc_pool_vaddr);
 	if (ret)
@@ -1193,7 +1192,7 @@ static void guc_submit_request(struct i915_request *rq)
 static int new_guc_id(struct intel_guc *guc)
 {
 	return ida_simple_get(&guc->guc_ids, 0,
-			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
+			      guc->num_guc_ids, GFP_KERNEL |
 			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 }
 
@@ -2704,6 +2703,8 @@ static bool __guc_submission_selected(struct intel_guc *guc)
 
 void intel_guc_submission_init_early(struct intel_guc *guc)
 {
+	guc->max_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
+	guc->num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
 	guc->submission_supported = __guc_submission_supported(guc);
 	guc->submission_selected = __guc_submission_selected(guc);
 }
@@ -2713,7 +2714,7 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 {
 	struct intel_context *ce;
 
-	if (unlikely(desc_idx >= GUC_MAX_LRC_DESCRIPTORS)) {
+	if (unlikely(desc_idx >= guc->max_guc_ids)) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
 			"Invalid desc_idx %u", desc_idx);
 		return NULL;
@@ -3063,6 +3064,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 
 	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
 		   atomic_read(&guc->outstanding_submission_g2h));
+	drm_printf(p, "GuC Number GuC IDs: %u\n", guc->num_guc_ids);
+	drm_printf(p, "GuC Max GuC IDs: %u\n", guc->max_guc_ids);
 	drm_printf(p, "GuC tasklet count: %u\n\n",
 		   atomic_read(&sched_engine->tasklet.count));
 
-- 
2.32.0

