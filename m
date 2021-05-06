Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E793375B45
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A61E6EDB0;
	Thu,  6 May 2021 18:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEA06ED91;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: RyMTUi3OhxPitwZ7kvVUV7w5QOes5/al5DzqWw/mMRVkzB4o/7SGo9NZebOlzdbAk8P8kLehc3
 +Bd+287wFA3Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531034"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531034"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: 5d7IR3DP1c/0qa976KHE7pl4TU8Guc3HvxzAUbt4b8TYvcqIBQlG/degsURZczo4AuI10I/oXs
 Ko//+8Lm73lg==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583624"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 81/97] drm/i915/guc: Allow flexible number of context ids
Date: Thu,  6 May 2021 12:14:35 -0700
Message-Id: <20210506191451.77768-82-matthew.brost@intel.com>
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

Number of available GuC contexts ids might be limited.
Stop refering in code to macro and use variable instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h           |  2 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 +++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 306d6857d683..9b1a89530844 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -53,6 +53,8 @@ struct intel_guc {
 	 */
 	spinlock_t contexts_lock;
 	struct ida guc_ids;
+	u32 num_guc_ids;
+	u32 max_guc_ids;
 	struct list_head guc_id_list;
 
 	bool submission_selected;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a20d7205895a..8f40e534bc81 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -228,7 +228,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 {
 	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
 
-	GEM_BUG_ON(index >= GUC_MAX_LRC_DESCRIPTORS);
+	GEM_BUG_ON(index >= guc->max_guc_ids);
 
 	return &base[index];
 }
@@ -237,7 +237,7 @@ static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
 {
 	struct intel_context *ce = xa_load(&guc->context_lookup, id);
 
-	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
+	GEM_BUG_ON(id >= guc->max_guc_ids);
 
 	return ce;
 }
@@ -247,8 +247,7 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
 	u32 size;
 	int ret;
 
-	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
-			  GUC_MAX_LRC_DESCRIPTORS);
+	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) * guc->max_guc_ids);
 	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
 					     (void **)&guc->lrc_desc_pool_vaddr);
 	if (ret)
@@ -1008,7 +1007,7 @@ static void guc_submit_request(struct i915_request *rq)
 static int new_guc_id(struct intel_guc *guc)
 {
 	return ida_simple_get(&guc->guc_ids, GUC_ID_START,
-			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
+			      guc->num_guc_ids, GFP_KERNEL |
 			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 }
 
@@ -2142,6 +2141,8 @@ static bool __guc_submission_selected(struct intel_guc *guc)
 
 void intel_guc_submission_init_early(struct intel_guc *guc)
 {
+	guc->max_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
+	guc->num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
 	guc->submission_selected = __guc_submission_selected(guc);
 }
 
@@ -2150,7 +2151,7 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 {
 	struct intel_context *ce;
 
-	if (unlikely(desc_idx >= GUC_MAX_LRC_DESCRIPTORS)) {
+	if (unlikely(desc_idx >= guc->max_guc_ids)) {
 		drm_dbg(&guc_to_gt(guc)->i915->drm,
 			"Invalid desc_idx %u", desc_idx);
 		return NULL;
@@ -2451,6 +2452,8 @@ void intel_guc_log_submission_info(struct intel_guc *guc,
 
 	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
 		   atomic_read(&guc->outstanding_submission_g2h));
+	drm_printf(p, "GuC Number GuC IDs: %u\n", guc->num_guc_ids);
+	drm_printf(p, "GuC Max GuC IDs: %u\n", guc->max_guc_ids);
 	drm_printf(p, "GuC tasklet count: %u\n\n",
 		   atomic_read(&sched_engine->tasklet.count));
 
@@ -2474,7 +2477,6 @@ void intel_guc_log_context_info(struct intel_guc *guc,
 {
 	struct intel_context *ce;
 	unsigned long index;
-
 	xa_for_each(&guc->context_lookup, index, ce) {
 		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
 		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
-- 
2.28.0

