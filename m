Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B9B6485E6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974A910E559;
	Fri,  9 Dec 2022 15:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004CF10E557;
 Fri,  9 Dec 2022 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670600963; x=1702136963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mw9eo/aYoMGGtYijebmGg28/6iNIQKdRtevPy10xMBs=;
 b=fUdW/3iwgjNEGcPYWCfAG1zYHBngmaJPJHK3SNhh58vft7nIYDqS0H6r
 J9Gsph4jn1Dc0Dg+fJ0g57P4qLtkEe8YerME8YIq3n4j9X2ezkAnAEiq8
 mtCIyZc+9JE2dH6r4oJw5ug6r/OlwC8RSBcLBC6YsxXsxSDXcOdV2LWn4
 GZkoI8uZoSQoH0Cs+p0WAYookx1iJauZAForez82lM7rBoNWaDTDf23jQ
 GIb83ihEKXilRtLmMsgSFgj2rjr0DXUuSaNAoP/UjZjKdzAxl98B1JV8k
 A87d++yjTk1O7mIOnQOOkqFIQs4tCfIIgOw6xcqoZjhlBDLK7V5bs6eVE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="315119807"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="315119807"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="647433358"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="647433358"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:20 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/gt: kill fetch_and_zero usage
Date: Fri,  9 Dec 2022 16:48:41 +0100
Message-Id: <20221209154843.4162814-3-andrzej.hajda@intel.com>
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
 drivers/gpu/drm/i915/gt/intel_engine_cs.c            | 2 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c     | 4 ++--
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c                 | 4 ++--
 drivers/gpu/drm/i915/gt/intel_gsc.c                  | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                   | 4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm.c                | 2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                  | 6 +++---
 drivers/gpu/drm/i915/gt/intel_migrate.c              | 2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                  | 2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                  | 2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c           | 2 +-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c   | 2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c          | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c                | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c             | 2 +-
 16 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index c33e0d72d6702b..de318d96d52abd 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1024,7 +1024,7 @@ static void cleanup_status_page(struct intel_engine_cs *engine)
 	/* Prevent writes into HWSP after returning the page to the system */
 	intel_engine_set_hwsp_writemask(engine, ~0u);
 
-	vma = fetch_and_zero(&engine->status_page.vma);
+	vma = exchange(&engine->status_page.vma, NULL);
 	if (!vma)
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 9a527e1f5be655..6029fafaaa674f 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -229,7 +229,7 @@ static void heartbeat(struct work_struct *wrk)
 	mutex_unlock(&ce->timeline->mutex);
 out:
 	if (!engine->i915->params.enable_hangcheck || !next_heartbeat(engine))
-		i915_request_put(fetch_and_zero(&engine->heartbeat.systole));
+		i915_request_put(exchange(&engine->heartbeat.systole, 0));
 	intel_engine_pm_put(engine);
 }
 
@@ -244,7 +244,7 @@ void intel_engine_unpark_heartbeat(struct intel_engine_cs *engine)
 void intel_engine_park_heartbeat(struct intel_engine_cs *engine)
 {
 	if (cancel_delayed_work(&engine->heartbeat.work))
-		i915_request_put(fetch_and_zero(&engine->heartbeat.systole));
+		i915_request_put(exchange(&engine->heartbeat.systole, 0));
 }
 
 void intel_gt_unpark_heartbeats(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 49a8f10d76c77b..29e78078d55a8b 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3197,7 +3197,7 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 		RB_CLEAR_NODE(rb);
 
 		spin_lock(&ve->base.sched_engine->lock);
-		rq = fetch_and_zero(&ve->request);
+		rq = exchange(&ve->request, NULL);
 		if (rq) {
 			if (i915_request_mark_eio(rq)) {
 				rq->engine = engine;
@@ -3602,7 +3602,7 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
 
 		spin_lock_irq(&ve->base.sched_engine->lock);
 
-		old = fetch_and_zero(&ve->request);
+		old = exchange(&ve->request, NULL);
 		if (old) {
 			GEM_BUG_ON(!__i915_request_is_complete(old));
 			__i915_request_submit(old);
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 0c7fe360f87331..2eb0173c6e968c 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -684,7 +684,7 @@ static void fini_aliasing_ppgtt(struct i915_ggtt *ggtt)
 {
 	struct i915_ppgtt *ppgtt;
 
-	ppgtt = fetch_and_zero(&ggtt->alias);
+	ppgtt = exchange(&ggtt->alias, NULL);
 	if (!ppgtt)
 		return;
 
@@ -1238,7 +1238,7 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
 				   was_bound);
 
 		if (obj) { /* only used during resume => exclusive access */
-			write_domain_objs |= fetch_and_zero(&obj->write_domain);
+			write_domain_objs |= exchange(&obj->write_domain, 0);
 			obj->read_domains |= I915_GEM_DOMAIN_GTT;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
index bcc3605158dbde..7226b42bb70b2a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.c
+++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
@@ -70,7 +70,7 @@ gsc_ext_om_alloc(struct intel_gsc *gsc, struct intel_gsc_intf *intf, size_t size
 
 static void gsc_ext_om_destroy(struct intel_gsc_intf *intf)
 {
-	struct drm_i915_gem_object *obj = fetch_and_zero(&intf->gem_obj);
+	struct drm_i915_gem_object *obj = exchange(&intf->gem_obj, NULL);
 
 	if (!obj)
 		return;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 4e7af9bc73ad05..a277bd47db813e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -757,7 +757,7 @@ int intel_gt_init(struct intel_gt *gt)
 	intel_uc_fini(&gt->uc);
 err_engines:
 	intel_engines_release(gt);
-	i915_vm_put(fetch_and_zero(&gt->vm));
+	i915_vm_put(exchange(&gt->vm, 0));
 err_pm:
 	intel_gt_pm_fini(gt);
 	intel_gt_fini_scratch(gt);
@@ -806,7 +806,7 @@ void intel_gt_driver_release(struct intel_gt *gt)
 {
 	struct i915_address_space *vm;
 
-	vm = fetch_and_zero(&gt->vm);
+	vm = exchange(&gt->vm, NULL);
 	if (vm) /* FIXME being called twice on error paths :( */
 		i915_vm_put(vm);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 16db85fab0b19b..f066936994a9e2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -123,7 +123,7 @@ static int __gt_unpark(struct intel_wakeref *wf)
 static int __gt_park(struct intel_wakeref *wf)
 {
 	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
-	intel_wakeref_t wakeref = fetch_and_zero(&gt->awake);
+	intel_wakeref_t wakeref = exchange(&gt->awake, 0);
 	struct drm_i915_private *i915 = gt->i915;
 
 	GT_TRACE(gt, "\n");
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7771a19008c604..9a2bfb6d14196c 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1144,7 +1144,7 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 static struct intel_timeline *
 pinned_timeline(struct intel_context *ce, struct intel_engine_cs *engine)
 {
-	struct intel_timeline *tl = fetch_and_zero(&ce->timeline);
+	struct intel_timeline *tl = exchange(&ce->timeline, NULL);
 
 	return intel_timeline_create_from_engine(engine, page_unmask_bits(tl));
 }
@@ -1261,8 +1261,8 @@ void lrc_fini(struct intel_context *ce)
 	if (!ce->state)
 		return;
 
-	intel_ring_put(fetch_and_zero(&ce->ring));
-	i915_vma_put(fetch_and_zero(&ce->state));
+	intel_ring_put(exchange(&ce->ring, 0));
+	i915_vma_put(exchange(&ce->state, 0));
 }
 
 void lrc_destroy(struct kref *kref)
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index b405a04135ca21..2c076a51b66b30 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -1116,7 +1116,7 @@ void intel_migrate_fini(struct intel_migrate *m)
 {
 	struct intel_context *ce;
 
-	ce = fetch_and_zero(&m->context);
+	ce = exchange(&m->context, NULL);
 	if (!ce)
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 2ee4051e4d9613..2451ebddb0f982 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -702,7 +702,7 @@ void intel_rc6_fini(struct intel_rc6 *rc6)
 
 	intel_rc6_disable(rc6);
 
-	pctx = fetch_and_zero(&rc6->pctx);
+	pctx = exchange(&rc6->pctx, NULL);
 	if (pctx)
 		i915_gem_object_put(pctx);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 9ad3bc7201cbaa..a102d8768e1d7b 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1831,7 +1831,7 @@ static void rps_work(struct work_struct *work)
 	u32 pm_iir = 0;
 
 	spin_lock_irq(gt->irq_lock);
-	pm_iir = fetch_and_zero(&rps->pm_iir) & rps->pm_events;
+	pm_iir = exchange(&rps->pm_iir, 0) & rps->pm_events;
 	client_boost = atomic_read(&rps->num_waiters);
 	spin_unlock_irq(gt->irq_lock);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 76fbae358072df..ca0a38de696eec 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -171,7 +171,7 @@ static int live_context_size(void *arg)
 		 * active state is sufficient, we are only checking that we
 		 * don't use more than we planned.
 		 */
-		saved = fetch_and_zero(&engine->default_state);
+		saved = exchange(&engine->default_state, NULL);
 
 		/* Overlaps with the execlists redzone */
 		engine->context_size += I915_GTT_PAGE_SIZE;
diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
index 87ceb0f374b673..9e901f1d5d76a9 100644
--- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
@@ -269,7 +269,7 @@ static int live_ctx_switch_wa(void *arg)
 		if (IS_GRAPHICS_VER(gt->i915, 4, 5))
 			continue; /* MI_STORE_DWORD is privileged! */
 
-		saved_wa = fetch_and_zero(&engine->wa_ctx.vma);
+		saved_wa = exchange(&engine->wa_ctx.vma, NULL);
 
 		intel_engine_pm_get(engine);
 		err = __live_ctx_switch_wa(engine);
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index 522d0190509ccc..d74b13b1b38a6e 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -892,7 +892,7 @@ static int create_watcher(struct hwsp_watcher *w,
 static int check_watcher(struct hwsp_watcher *w, const char *name,
 			 bool (*op)(u32 hwsp, u32 seqno))
 {
-	struct i915_request *rq = fetch_and_zero(&w->rq);
+	struct i915_request *rq = exchange(&w->rq, NULL);
 	u32 offset, end;
 	int err;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 4f4b519e12c1b7..0085b1727dd47a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -166,7 +166,7 @@ static void __uc_capture_load_err_log(struct intel_uc *uc)
 
 static void __uc_free_load_err_log(struct intel_uc *uc)
 {
-	struct drm_i915_gem_object *log = fetch_and_zero(&uc->load_err_log);
+	struct drm_i915_gem_object *log = exchange(&uc->load_err_log, NULL);
 
 	if (log)
 		i915_gem_object_put(log);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 6c83a8b66c9e32..44ff6da26bd698 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -1055,7 +1055,7 @@ void intel_uc_fw_cleanup_fetch(struct intel_uc_fw *uc_fw)
 	if (!intel_uc_fw_is_available(uc_fw))
 		return;
 
-	i915_gem_object_put(fetch_and_zero(&uc_fw->obj));
+	i915_gem_object_put(exchange(&uc_fw->obj, 0));
 
 	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_SELECTED);
 }
-- 
2.34.1

