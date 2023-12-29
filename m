Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9906981FEE4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 11:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C5C10E292;
	Fri, 29 Dec 2023 10:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A3010E290;
 Fri, 29 Dec 2023 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703845798; x=1735381798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fGmU28QIli68y1QEaQ8cgxGOuo8jLxlnvW+srSjwiwM=;
 b=nzFSFtNB3WpqELOjKL+hbjaXrw2AQlGNVR0C1MmRR9I9YFHkzv72nbLk
 MdctB4Fs+VeuzPWVwmM5vtj3sMpHoHnyhgq19IAiTyJcaO3WCSi0QDnCk
 PuxehopHTi4bKRHqZobnXlWnkUUJTRQwdSJ4iUVJTxaOhzVEKr24hRXSg
 5/mXkNOzvdf04FvBAgMANaPtpY075wnELI8pLHLT+skZck4Zw0LnFEfrm
 FVJtHXgqEACbNqoiRmzkG+k/mkgkfVZITjYf0KzzPp0bdsZQB9wbp+ng0
 SWSnA5y/cbVHwNQAs8LReUjiHWaHHOFsk57mC0rWOxSNMxglw3+jIrpAS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="395527191"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="395527191"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 02:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="869368110"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="869368110"
Received: from jquigley-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.51.13])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 02:28:42 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 2/4] drm/i915/guc: Use the new gt_to_guc() wrapper
Date: Fri, 29 Dec 2023 11:27:32 +0100
Message-ID: <20231229102734.674362-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229102734.674362-1-andi.shyti@linux.intel.com>
References: <20231229102734.674362-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the guc reference from the gt using the gt_to_guc() helper.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |  4 +--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  6 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 28 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  4 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  4 +--
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  2 +-
 9 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index e2e42b3e0d5d..3b69bc6616bd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -298,7 +298,7 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
 	memcpy_toio(gsc->local_vaddr, src, gsc->fw.size);
 	memset_io(gsc->local_vaddr + gsc->fw.size, 0, gsc->local->size - gsc->fw.size);
 
-	intel_guc_write_barrier(&gt->uc.guc);
+	intel_guc_write_barrier(gt_to_guc(gt));
 
 	i915_gem_object_unpin_map(gsc->fw.obj);
 
@@ -351,7 +351,7 @@ static int gsc_fw_query_compatibility_version(struct intel_gsc_uc *gsc)
 	void *vaddr;
 	int err;
 
-	err = intel_guc_allocate_and_map_vma(&gt->uc.guc, GSC_VER_PKT_SZ * 2,
+	err = intel_guc_allocate_and_map_vma(gt_to_guc(gt), GSC_VER_PKT_SZ * 2,
 					     &vma, &vaddr);
 	if (err) {
 		gt_err(gt, "failed to allocate vma for GSC version query\n");
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
index 40817ebcca71..a7d5465655f9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
@@ -358,7 +358,8 @@ static int proxy_channel_alloc(struct intel_gsc_uc *gsc)
 	void *vaddr;
 	int err;
 
-	err = intel_guc_allocate_and_map_vma(&gt->uc.guc, GSC_PROXY_CHANNEL_SIZE,
+	err = intel_guc_allocate_and_map_vma(gt_to_guc(gt),
+					     GSC_PROXY_CHANNEL_SIZE,
 					     &vma, &vaddr);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 63724e17829a..1ef470e64604 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -956,7 +956,7 @@ u32 intel_guc_engine_usage_offset(struct intel_guc *guc)
 
 struct iosys_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine)
 {
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(engine->gt);
 	u8 guc_class = engine_class_to_guc_class(engine->class);
 	size_t offset = offsetof(struct __guc_ads_blob,
 				 engine_usage.engines[guc_class][ilog2(engine->logical_mask)]);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index a1cd40d80517..488372b71555 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1441,7 +1441,7 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *ebuf,
 	if (!cap || !ee->engine)
 		return -ENODEV;
 
-	guc = &ee->engine->gt->uc.guc;
+	guc = gt_to_guc(ee->engine->gt);
 
 	i915_error_printf(ebuf, "global --- GuC Error Capture on %s command stream:\n",
 			  ee->engine->name);
@@ -1543,7 +1543,7 @@ bool intel_guc_capture_is_matching_engine(struct intel_gt *gt,
 	if (!gt || !ce || !engine)
 		return false;
 
-	guc = &gt->uc.guc;
+	guc = gt_to_guc(gt);
 	if (!guc->capture)
 		return false;
 
@@ -1573,7 +1573,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 	if (!gt || !ee || !ce)
 		return;
 
-	guc = &gt->uc.guc;
+	guc = gt_to_guc(gt);
 	if (!guc->capture)
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index cc9569af7f0c..b67a15f74276 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -111,7 +111,7 @@ static bool has_table(struct drm_i915_private *i915)
 static int guc_hwconfig_init(struct intel_gt *gt)
 {
 	struct intel_hwconfig *hwconfig = &gt->info.hwconfig;
-	struct intel_guc *guc = &gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(gt);
 	int ret;
 
 	if (!has_table(gt->i915))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a259f1118c5a..17629e26e899 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -391,7 +391,7 @@ static inline void set_context_guc_id_invalid(struct intel_context *ce)
 
 static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
 {
-	return &ce->engine->gt->uc.guc;
+	return gt_to_guc(ce->engine->gt);
 }
 
 static inline struct i915_priolist *to_priolist(struct rb_node *rb)
@@ -1233,7 +1233,7 @@ static void __get_engine_usage_record(struct intel_engine_cs *engine,
 static void guc_update_engine_gt_clks(struct intel_engine_cs *engine)
 {
 	struct intel_engine_guc_stats *stats = &engine->stats.guc;
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(engine->gt);
 	u32 last_switch, ctx_id, total;
 
 	lockdep_assert_held(&guc->timestamp.lock);
@@ -1298,7 +1298,7 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 	struct intel_engine_guc_stats stats_saved, *stats = &engine->stats.guc;
 	struct i915_gpu_error *gpu_error = &engine->i915->gpu_error;
 	struct intel_gt *gt = engine->gt;
-	struct intel_guc *guc = &gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(gt);
 	u64 total, gt_stamp_saved;
 	unsigned long flags;
 	u32 reset_count;
@@ -1525,7 +1525,7 @@ static void guc_fini_engine_stats(struct intel_guc *guc)
 
 void intel_guc_busyness_park(struct intel_gt *gt)
 {
-	struct intel_guc *guc = &gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(gt);
 
 	if (!guc_submission_initialized(guc))
 		return;
@@ -1552,7 +1552,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
 
 void intel_guc_busyness_unpark(struct intel_gt *gt)
 {
-	struct intel_guc *guc = &gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(gt);
 	unsigned long flags;
 	ktime_t unused;
 
@@ -2130,7 +2130,7 @@ static bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
 static void guc_submit_request(struct i915_request *rq)
 {
 	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
-	struct intel_guc *guc = &rq->engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(rq->engine->gt);
 	unsigned long flags;
 
 	/* Will be called from irq-context when using foreign fences. */
@@ -2596,7 +2596,7 @@ static int __guc_context_set_context_policies(struct intel_guc *guc,
 static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
 {
 	struct intel_engine_cs *engine = ce->engine;
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(engine->gt);
 	struct context_policy policy;
 	u32 execution_quantum;
 	u32 preemption_timeout;
@@ -2672,7 +2672,7 @@ static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
 static void prepare_context_registration_info_v69(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(engine->gt);
 	u32 ctx_id = ce->guc_id.id;
 	struct guc_lrc_desc_v69 *desc;
 	struct intel_context *child;
@@ -2741,7 +2741,7 @@ static void prepare_context_registration_info_v70(struct intel_context *ce,
 						  struct guc_ctxt_registration_info *info)
 {
 	struct intel_engine_cs *engine = ce->engine;
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(engine->gt);
 	u32 ctx_id = ce->guc_id.id;
 
 	GEM_BUG_ON(!engine->mask);
@@ -2804,7 +2804,7 @@ static int try_context_registration(struct intel_context *ce, bool loop)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(engine->gt);
 	intel_wakeref_t wakeref;
 	u32 ctx_id = ce->guc_id.id;
 	bool context_registered;
@@ -4435,7 +4435,7 @@ static void guc_sched_engine_destroy(struct kref *kref)
 int intel_guc_submission_setup(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *i915 = engine->i915;
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(engine->gt);
 
 	/*
 	 * The setup relies on several assumptions (e.g. irqs always enabled)
@@ -5194,7 +5194,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 
 void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 {
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(engine->gt);
 	struct intel_context *ce;
 	struct i915_request *rq;
 	unsigned long index;
@@ -5256,7 +5256,7 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
 				    struct i915_request *hung_rq,
 				    struct drm_printer *m)
 {
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(engine->gt);
 	struct intel_context *ce;
 	unsigned long index;
 	unsigned long flags;
@@ -5708,7 +5708,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 	if (!ve)
 		return ERR_PTR(-ENOMEM);
 
-	guc = &siblings[0]->gt->uc.guc;
+	guc = gt_to_guc(siblings[0]->gt);
 
 	ve->base.i915 = siblings[0]->i915;
 	ve->base.gt = siblings[0]->gt;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index ba9e07fc2b57..9b5141b422e5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -384,7 +384,7 @@ int intel_huc_init(struct intel_huc *huc)
 	if (HAS_ENGINE(gt, GSC0)) {
 		struct i915_vma *vma;
 
-		vma = intel_guc_allocate_vma(&gt->uc.guc, PXP43_HUC_AUTH_INOUT_SIZE * 2);
+		vma = intel_guc_allocate_vma(gt_to_guc(gt), PXP43_HUC_AUTH_INOUT_SIZE * 2);
 		if (IS_ERR(vma)) {
 			err = PTR_ERR(vma);
 			huc_info(huc, "Failed to allocate heci pkt\n");
@@ -488,7 +488,7 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
 int intel_huc_auth(struct intel_huc *huc, enum intel_huc_authentication_type type)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
-	struct intel_guc *guc = &gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(gt);
 	int ret;
 
 	if (!intel_uc_fw_is_loaded(&huc->fw))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 756093eaf2ad..d80278eb45d7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -807,7 +807,7 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
 static int check_mtl_huc_guc_compatibility(struct intel_gt *gt,
 					   struct intel_uc_fw_file *huc_selected)
 {
-	struct intel_uc_fw_file *guc_selected = &gt->uc.guc.fw.file_selected;
+	struct intel_uc_fw_file *guc_selected = &gt_to_guc(gt)->fw.file_selected;
 	struct intel_uc_fw_ver *huc_ver = &huc_selected->ver;
 	struct intel_uc_fw_ver *guc_ver = &guc_selected->ver;
 	bool new_huc, new_guc;
@@ -1209,7 +1209,7 @@ static int uc_fw_rsa_data_create(struct intel_uc_fw *uc_fw)
 	 * since its GGTT offset will be GuC accessible.
 	 */
 	GEM_BUG_ON(uc_fw->rsa_size > PAGE_SIZE);
-	vma = intel_guc_allocate_vma(&gt->uc.guc, PAGE_SIZE);
+	vma = intel_guc_allocate_vma(gt_to_guc(gt), PAGE_SIZE);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index c900aac85adb..68feb55654f7 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -144,7 +144,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 static int intel_guc_steal_guc_ids(void *arg)
 {
 	struct intel_gt *gt = arg;
-	struct intel_guc *guc = &gt->uc.guc;
+	struct intel_guc *guc = gt_to_guc(gt);
 	int ret, sv, context_index = 0;
 	intel_wakeref_t wakeref;
 	struct intel_engine_cs *engine;
-- 
2.43.0

