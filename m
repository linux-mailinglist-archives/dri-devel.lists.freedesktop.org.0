Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C406485EA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D796C10E55F;
	Fri,  9 Dec 2022 15:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD1210E55C;
 Fri,  9 Dec 2022 15:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670600971; x=1702136971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o1lBXTS0l85rw4UgwYORhpCZBScKKuo94fvh9ppX5JI=;
 b=XjLIFDCmb0judSQdEFP+v2tnlgwbAQnrGC9Bc2FrUHYOCZsiRbn8V3m7
 /b1DW2hrDQAXMjc6Vf5lLsFrzMl4qakyych/vgw8a5ih3y0TMIIL2LaOw
 dM34Dtd16hpqI3IboeNUZBCBjZ6D20io1VWj8Tn9am5pO+PuCHFaKLFp5
 R1ZAdORq/WcCBmXhXNj0EPjYl6NQh5OcfV+7uLI/MCPbV/Db/ZH4NTOle
 9m+gWcqCBF3YPzImotHFFqT/PoZo0KaoLDdcfY4S2Q3g+C4laTG1zQJaz
 +vETUFLLYM24ythD6mYyUx20Y424t2uPUayk3gTE0p/X4zjAPjGmd/R+e Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="315119831"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="315119831"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="647433375"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="647433375"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:27 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915: kill fetch_and_zero
Date: Fri,  9 Dec 2022 16:48:43 +0100
Message-Id: <20221209154843.4162814-5-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209154843.4162814-1-andrzej.hajda@intel.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Better use recently introduced kernel core helper.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c             | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c            | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c               | 6 +++---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 4 ++--
 drivers/gpu/drm/i915/i915_hwmon.c                     | 2 +-
 drivers/gpu/drm/i915/i915_perf.c                      | 2 +-
 drivers/gpu/drm/i915/i915_query.c                     | 2 +-
 drivers/gpu/drm/i915/i915_request.c                   | 4 ++--
 drivers/gpu/drm/i915/i915_vma.c                       | 2 +-
 drivers/gpu/drm/i915/intel_memory_region.c            | 2 +-
 drivers/gpu/drm/i915/intel_uncore.c                   | 4 ++--
 drivers/gpu/drm/i915/intel_wakeref.c                  | 4 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp.c                  | 2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c          | 4 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c              | 2 +-
 15 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 05a27723ebb8cb..5498bd00ffd5e1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -209,7 +209,7 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
 
 	assert_object_held_shared(obj);
 
-	pages = fetch_and_zero(&obj->mm.pages);
+	pages = exchange(&obj->mm.pages, NULL);
 	if (IS_ERR_OR_NULL(pages))
 		return pages;
 
@@ -515,7 +515,7 @@ void __i915_gem_object_release_map(struct drm_i915_gem_object *obj)
 	 * Furthermore, since this is an unsafe operation reserved only
 	 * for construction time manipulation, we ignore locking prudence.
 	 */
-	unmap_object(obj, page_mask_bits(fetch_and_zero(&obj->mm.mapping)));
+	unmap_object(obj, page_mask_bits(exchange(&obj->mm.mapping, 0)));
 
 	i915_gem_object_unpin_map(obj);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index bc952107880734..6901b2529d1b29 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -652,7 +652,7 @@ static void
 i915_gem_object_release_stolen(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct drm_mm_node *stolen = fetch_and_zero(&obj->stolen);
+	struct drm_mm_node *stolen = exchange(&obj->stolen, NULL);
 
 	GEM_BUG_ON(!stolen);
 	i915_gem_stolen_remove_node(i915, stolen);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 5247d88b3c13e6..075112ebe30247 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -447,7 +447,7 @@ int i915_ttm_purge(struct drm_i915_gem_object *obj)
 		 */
 		shmem_truncate_range(file_inode(i915_tt->filp),
 				     0, (loff_t)-1);
-		fput(fetch_and_zero(&i915_tt->filp));
+		fput(exchange(&i915_tt->filp, 0));
 	}
 
 	obj->write_domain = 0;
@@ -779,7 +779,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 	int ret;
 
 	/* First try only the requested placement. No eviction. */
-	real_num_busy = fetch_and_zero(&placement->num_busy_placement);
+	real_num_busy = exchange(&placement->num_busy_placement, 0);
 	ret = ttm_bo_validate(bo, placement, &ctx);
 	if (ret) {
 		ret = i915_ttm_err_to_gem(ret);
@@ -905,7 +905,7 @@ static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
 	 */
 
 	if (obj->mm.rsgt)
-		i915_refct_sgt_put(fetch_and_zero(&obj->mm.rsgt));
+		i915_refct_sgt_put(exchange(&obj->mm.rsgt, 0));
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index ac02fb03659208..4d456f74d5d901 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -615,7 +615,7 @@ static void throttle_release(struct i915_request **q, int count)
 		if (IS_ERR_OR_NULL(q[i]))
 			continue;
 
-		i915_request_put(fetch_and_zero(&q[i]));
+		i915_request_put(exchange(&q[i], 0));
 	}
 }
 
@@ -1072,7 +1072,7 @@ __sseu_prepare(const char *name,
 err_fini:
 	igt_spinner_fini(*spin);
 err_free:
-	kfree(fetch_and_zero(spin));
+	kfree(exchange(spin, 0));
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index cca7a4350ec8fd..c9d02f1124a067 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -732,5 +732,5 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
 {
-	fetch_and_zero(&i915->hwmon);
+	exchange(&i915->hwmon, 0);
 }
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index d22f30dd4fba27..d8b412e75b6079 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1535,7 +1535,7 @@ static void oa_put_render_ctx_id(struct i915_perf_stream *stream)
 {
 	struct intel_context *ce;
 
-	ce = fetch_and_zero(&stream->pinned_ctx);
+	ce = exchange(&stream->pinned_ctx, NULL);
 	if (ce) {
 		ce->tag = 0; /* recomputed on next submission after parking */
 		intel_context_unpin(ce);
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 00871ef9979204..ace0f6f98a430b 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -404,7 +404,7 @@ static int query_perf_config_list(struct drm_i915_private *i915,
 		if (!ids)
 			return -ENOMEM;
 
-		alloc = fetch_and_zero(&n_configs);
+		alloc = exchange(&n_configs, 0);
 
 		ids[n_configs++] = 1ull; /* reserved for test_config */
 		rcu_read_lock();
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index f949a9495758a0..9173b6c33d03c4 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -117,7 +117,7 @@ static void i915_fence_release(struct dma_fence *fence)
 	GEM_BUG_ON(rq->guc_prio != GUC_PRIO_INIT &&
 		   rq->guc_prio != GUC_PRIO_FINI);
 
-	i915_request_free_capture_list(fetch_and_zero(&rq->capture_list));
+	i915_request_free_capture_list(exchange(&rq->capture_list, 0));
 	if (rq->batch_res) {
 		i915_vma_resource_put(rq->batch_res);
 		rq->batch_res = NULL;
@@ -1948,7 +1948,7 @@ static void request_wait_wake(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct request_wait *wait = container_of(cb, typeof(*wait), cb);
 
-	wake_up_process(fetch_and_zero(&wait->tsk));
+	wake_up_process(exchange(&wait->tsk, 0));
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 34f0e6c923c26d..d3498314357073 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -635,7 +635,7 @@ void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags)
 	struct i915_vma *vma;
 	struct drm_i915_gem_object *obj;
 
-	vma = fetch_and_zero(p_vma);
+	vma = exchange(p_vma, NULL);
 	if (!vma)
 		return;
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 9a4a7fb55582db..95d3ca1aa9a8f1 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -367,7 +367,7 @@ void intel_memory_regions_driver_release(struct drm_i915_private *i915)
 
 	for (i = 0; i < ARRAY_SIZE(i915->mm.regions); i++) {
 		struct intel_memory_region *region =
-			fetch_and_zero(&i915->mm.regions[i]);
+			exchange(&i915->mm.regions[i], NULL);
 
 		if (region)
 			intel_memory_region_destroy(region);
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 614013745fcafe..c86abf1755039a 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -627,7 +627,7 @@ void intel_uncore_resume_early(struct intel_uncore *uncore)
 	if (!intel_uncore_has_forcewake(uncore))
 		return;
 
-	restore_forcewake = fetch_and_zero(&uncore->fw_domains_saved);
+	restore_forcewake = exchange(&uncore->fw_domains_saved, 0);
 	forcewake_early_sanitize(uncore, restore_forcewake);
 
 	iosf_mbi_register_pmic_bus_access_notifier(&uncore->pmic_bus_access_nb);
@@ -2249,7 +2249,7 @@ static void fw_domain_fini(struct intel_uncore *uncore,
 
 	GEM_BUG_ON(domain_id >= FW_DOMAIN_ID_COUNT);
 
-	d = fetch_and_zero(&uncore->fw_domain[domain_id]);
+	d = exchange(&uncore->fw_domain[domain_id], NULL);
 	if (!d)
 		return;
 
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index dfd87d08221807..01ee7713e8171b 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -16,7 +16,7 @@ static void rpm_get(struct intel_wakeref *wf)
 
 static void rpm_put(struct intel_wakeref *wf)
 {
-	intel_wakeref_t wakeref = fetch_and_zero(&wf->wakeref);
+	intel_wakeref_t wakeref = exchange(&wf->wakeref, 0);
 
 	intel_runtime_pm_put(wf->rpm, wakeref);
 	INTEL_WAKEREF_BUG_ON(!wakeref);
@@ -134,7 +134,7 @@ static void wakeref_auto_timeout(struct timer_list *t)
 	if (!refcount_dec_and_lock_irqsave(&wf->count, &wf->lock, &flags))
 		return;
 
-	wakeref = fetch_and_zero(&wf->wakeref);
+	wakeref = exchange(&wf->wakeref, 0);
 	spin_unlock_irqrestore(&wf->lock, flags);
 
 	intel_runtime_pm_put(wf->rpm, wakeref);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 5efe61f6754601..d2c13bf7e9acf2 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -104,7 +104,7 @@ static int create_vcs_context(struct intel_pxp *pxp)
 static void destroy_vcs_context(struct intel_pxp *pxp)
 {
 	if (pxp->ce)
-		intel_engine_destroy_pinned_context(fetch_and_zero(&pxp->ce));
+		intel_engine_destroy_pinned_context(exchange(&pxp->ce, 0));
 }
 
 static void pxp_init_full(struct intel_pxp *pxp)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 85572360c71a99..89e37ebb93b0ab 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -132,7 +132,7 @@ static void pxp_terminate(struct intel_pxp *pxp)
 static void pxp_terminate_complete(struct intel_pxp *pxp)
 {
 	/* Re-create the arb session after teardown handle complete */
-	if (fetch_and_zero(&pxp->hw_state_invalidated))
+	if (exchange(&pxp->hw_state_invalidated, 0))
 		pxp_create_arb_session(pxp);
 
 	complete_all(&pxp->termination);
@@ -146,7 +146,7 @@ static void pxp_session_work(struct work_struct *work)
 	u32 events = 0;
 
 	spin_lock_irq(gt->irq_lock);
-	events = fetch_and_zero(&pxp->session_events);
+	events = exchange(&pxp->session_events, 0);
 	spin_unlock_irq(gt->irq_lock);
 
 	if (!events)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index b0c9170b139542..345656515b8f0e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -231,7 +231,7 @@ static int alloc_streaming_command(struct intel_pxp *pxp)
 
 static void free_streaming_command(struct intel_pxp *pxp)
 {
-	struct drm_i915_gem_object *obj = fetch_and_zero(&pxp->stream_cmd.obj);
+	struct drm_i915_gem_object *obj = exchange(&pxp->stream_cmd.obj, NULL);
 
 	if (!obj)
 		return;
-- 
2.34.1

