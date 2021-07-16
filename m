Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B73CBD25
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14726EA07;
	Fri, 16 Jul 2021 19:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFC66E9D0;
 Fri, 16 Jul 2021 19:59:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596703"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596703"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238863"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/51] drm/i915/guc: Remove GuC stage descriptor,
 add LRC descriptor
Date: Fri, 16 Jul 2021 13:16:35 -0700
Message-Id: <20210716201724.54804-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
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

Remove old GuC stage descriptor, add LRC descriptor which will be used
by the new GuC interface implemented in this patch series.

v2:
 (John Harrison)
  - s/lrc/LRC/g

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 65 -----------------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 72 ++++++-------------
 3 files changed, 25 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 72e4653222e2..2625d2d5959f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -43,8 +43,8 @@ struct intel_guc {
 	struct i915_vma *ads_vma;
 	struct __guc_ads_blob *ads_blob;
 
-	struct i915_vma *stage_desc_pool;
-	void *stage_desc_pool_vaddr;
+	struct i915_vma *lrc_desc_pool;
+	void *lrc_desc_pool_vaddr;
 
 	/* Control params for fw initialization */
 	u32 params[GUC_CTL_MAX_DWORDS];
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 28245a217a39..4e4edc368b77 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -26,9 +26,6 @@
 #define GUC_CLIENT_PRIORITY_NORMAL	3
 #define GUC_CLIENT_PRIORITY_NUM		4
 
-#define GUC_MAX_STAGE_DESCRIPTORS	1024
-#define	GUC_INVALID_STAGE_ID		GUC_MAX_STAGE_DESCRIPTORS
-
 #define GUC_MAX_LRC_DESCRIPTORS		65535
 #define	GUC_INVALID_LRC_ID		GUC_MAX_LRC_DESCRIPTORS
 
@@ -181,68 +178,6 @@ struct guc_process_desc {
 	u32 reserved[30];
 } __packed;
 
-/* engine id and context id is packed into guc_execlist_context.context_id*/
-#define GUC_ELC_CTXID_OFFSET		0
-#define GUC_ELC_ENGINE_OFFSET		29
-
-/* The execlist context including software and HW information */
-struct guc_execlist_context {
-	u32 context_desc;
-	u32 context_id;
-	u32 ring_status;
-	u32 ring_lrca;
-	u32 ring_begin;
-	u32 ring_end;
-	u32 ring_next_free_location;
-	u32 ring_current_tail_pointer_value;
-	u8 engine_state_submit_value;
-	u8 engine_state_wait_value;
-	u16 pagefault_count;
-	u16 engine_submit_queue_count;
-} __packed;
-
-/*
- * This structure describes a stage set arranged for a particular communication
- * between uKernel (GuC) and Driver (KMD). Technically, this is known as a
- * "GuC Context descriptor" in the specs, but we use the term "stage descriptor"
- * to avoid confusion with all the other things already named "context" in the
- * driver. A static pool of these descriptors are stored inside a GEM object
- * (stage_desc_pool) which is held for the entire lifetime of our interaction
- * with the GuC, being allocated before the GuC is loaded with its firmware.
- */
-struct guc_stage_desc {
-	u32 sched_common_area;
-	u32 stage_id;
-	u32 pas_id;
-	u8 engines_used;
-	u64 db_trigger_cpu;
-	u32 db_trigger_uk;
-	u64 db_trigger_phy;
-	u16 db_id;
-
-	struct guc_execlist_context lrc[GUC_MAX_ENGINES_NUM];
-
-	u8 attribute;
-
-	u32 priority;
-
-	u32 wq_sampled_tail_offset;
-	u32 wq_total_submit_enqueues;
-
-	u32 process_desc;
-	u32 wq_addr;
-	u32 wq_size;
-
-	u32 engine_presence;
-
-	u8 engine_suspended;
-
-	u8 reserved0[3];
-	u64 reserved1[1];
-
-	u64 desc_private;
-} __packed;
-
 #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
 
 #define CONTEXT_POLICY_DEFAULT_EXECUTION_QUANTUM_US 1000000
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e9c237b18692..a366890fb840 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -65,57 +65,35 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 	return rb_entry(rb, struct i915_priolist, node);
 }
 
-static struct guc_stage_desc *__get_stage_desc(struct intel_guc *guc, u32 id)
+/* Future patches will use this function */
+__attribute__ ((unused))
+static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 {
-	struct guc_stage_desc *base = guc->stage_desc_pool_vaddr;
+	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
 
-	return &base[id];
-}
-
-static int guc_stage_desc_pool_create(struct intel_guc *guc)
-{
-	u32 size = PAGE_ALIGN(sizeof(struct guc_stage_desc) *
-			      GUC_MAX_STAGE_DESCRIPTORS);
+	GEM_BUG_ON(index >= GUC_MAX_LRC_DESCRIPTORS);
 
-	return intel_guc_allocate_and_map_vma(guc, size, &guc->stage_desc_pool,
-					      &guc->stage_desc_pool_vaddr);
+	return &base[index];
 }
 
-static void guc_stage_desc_pool_destroy(struct intel_guc *guc)
-{
-	i915_vma_unpin_and_release(&guc->stage_desc_pool, I915_VMA_RELEASE_MAP);
-}
-
-/*
- * Initialise/clear the stage descriptor shared with the GuC firmware.
- *
- * This descriptor tells the GuC where (in GGTT space) to find the important
- * data structures related to work submission (process descriptor, write queue,
- * etc).
- */
-static void guc_stage_desc_init(struct intel_guc *guc)
+static int guc_lrc_desc_pool_create(struct intel_guc *guc)
 {
-	struct guc_stage_desc *desc;
-
-	/* we only use 1 stage desc, so hardcode it to 0 */
-	desc = __get_stage_desc(guc, 0);
-	memset(desc, 0, sizeof(*desc));
-
-	desc->attribute = GUC_STAGE_DESC_ATTR_ACTIVE |
-			  GUC_STAGE_DESC_ATTR_KERNEL;
+	u32 size;
+	int ret;
 
-	desc->stage_id = 0;
-	desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
+	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
+			  GUC_MAX_LRC_DESCRIPTORS);
+	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
+					     (void **)&guc->lrc_desc_pool_vaddr);
+	if (ret)
+		return ret;
 
-	desc->wq_size = GUC_WQ_SIZE;
+	return 0;
 }
 
-static void guc_stage_desc_fini(struct intel_guc *guc)
+static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
 {
-	struct guc_stage_desc *desc;
-
-	desc = __get_stage_desc(guc, 0);
-	memset(desc, 0, sizeof(*desc));
+	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
 }
 
 static void guc_add_request(struct intel_guc *guc, struct i915_request *rq)
@@ -410,26 +388,25 @@ int intel_guc_submission_init(struct intel_guc *guc)
 {
 	int ret;
 
-	if (guc->stage_desc_pool)
+	if (guc->lrc_desc_pool)
 		return 0;
 
-	ret = guc_stage_desc_pool_create(guc);
+	ret = guc_lrc_desc_pool_create(guc);
 	if (ret)
 		return ret;
 	/*
 	 * Keep static analysers happy, let them know that we allocated the
 	 * vma after testing that it didn't exist earlier.
 	 */
-	GEM_BUG_ON(!guc->stage_desc_pool);
+	GEM_BUG_ON(!guc->lrc_desc_pool);
 
 	return 0;
 }
 
 void intel_guc_submission_fini(struct intel_guc *guc)
 {
-	if (guc->stage_desc_pool) {
-		guc_stage_desc_pool_destroy(guc);
-	}
+	if (guc->lrc_desc_pool)
+		guc_lrc_desc_pool_destroy(guc);
 }
 
 static int guc_context_alloc(struct intel_context *ce)
@@ -695,7 +672,6 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 
 void intel_guc_submission_enable(struct intel_guc *guc)
 {
-	guc_stage_desc_init(guc);
 }
 
 void intel_guc_submission_disable(struct intel_guc *guc)
@@ -705,8 +681,6 @@ void intel_guc_submission_disable(struct intel_guc *guc)
 	GEM_BUG_ON(gt->awake); /* GT should be parked first */
 
 	/* Note: By the time we're here, GuC may have already been reset */
-
-	guc_stage_desc_fini(guc);
 }
 
 static bool __guc_submission_selected(struct intel_guc *guc)
-- 
2.28.0

