Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69EE474C1D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C16410E177;
	Tue, 14 Dec 2021 19:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF88D10E177;
 Tue, 14 Dec 2021 19:35:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238880977"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="238880977"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 11:35:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="567519556"
Received: from njayagop-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.16])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 11:35:44 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 14/16] drm/i915/selftests: Use to_gt() helper for GGTT
 accesses
Date: Tue, 14 Dec 2021 21:33:44 +0200
Message-Id: <20211214193346.21231-15-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214193346.21231-1-andi.shyti@linux.intel.com>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

GGTT is currently available both through i915->ggtt and gt->ggtt, and we
eventually want to get rid of the i915->ggtt one.
Use to_gt() for all i915->ggtt accesses to help with the future
refactoring.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem.c        | 8 ++++----
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c    | 6 +++---
 drivers/gpu/drm/i915/selftests/i915_request.c    | 2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c        | 2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index b5576888cd78..1628b81d0a35 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -41,7 +41,7 @@ static int switch_to_context(struct i915_gem_context *ctx)
 
 static void trash_stolen(struct drm_i915_private *i915)
 {
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	const u64 slot = ggtt->error_capture.start;
 	const resource_size_t size = resource_size(&i915->dsm);
 	unsigned long page;
@@ -99,7 +99,7 @@ static void igt_pm_suspend(struct drm_i915_private *i915)
 	intel_wakeref_t wakeref;
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		i915_ggtt_suspend(&i915->ggtt);
+		i915_ggtt_suspend(to_gt(i915)->ggtt);
 		i915_gem_suspend_late(i915);
 	}
 }
@@ -109,7 +109,7 @@ static void igt_pm_hibernate(struct drm_i915_private *i915)
 	intel_wakeref_t wakeref;
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		i915_ggtt_suspend(&i915->ggtt);
+		i915_ggtt_suspend(to_gt(i915)->ggtt);
 
 		i915_gem_freeze(i915);
 		i915_gem_freeze_late(i915);
@@ -125,7 +125,7 @@ static void igt_pm_resume(struct drm_i915_private *i915)
 	 * that runtime-pm just works.
 	 */
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		i915_ggtt_resume(&i915->ggtt);
+		i915_ggtt_resume(to_gt(i915)->ggtt);
 		i915_gem_resume(i915);
 	}
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 48123c3e1ff0..9afe7cf9d068 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1122,7 +1122,7 @@ static int exercise_ggtt(struct drm_i915_private *i915,
 				     u64 hole_start, u64 hole_end,
 				     unsigned long end_time))
 {
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	u64 hole_start, hole_end, last = 0;
 	struct drm_mm_node *node;
 	IGT_TIMEOUT(end_time);
@@ -1182,7 +1182,7 @@ static int igt_ggtt_page(void *arg)
 	const unsigned int count = PAGE_SIZE/sizeof(u32);
 	I915_RND_STATE(prng);
 	struct drm_i915_private *i915 = arg;
-	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct drm_i915_gem_object *obj;
 	intel_wakeref_t wakeref;
 	struct drm_mm_node tmp;
@@ -2110,7 +2110,7 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_cs_tlb),
 	};
 
-	GEM_BUG_ON(offset_in_page(i915->ggtt.vm.total));
+	GEM_BUG_ON(offset_in_page(to_gt(i915)->ggtt->vm.total));
 
 	return i915_subtests(tests, i915);
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 92a859b34190..7f66f6d299b2 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -843,7 +843,7 @@ static struct i915_vma *empty_batch(struct drm_i915_private *i915)
 
 	intel_gt_chipset_flush(to_gt(i915));
 
-	vma = i915_vma_instance(obj, &i915->ggtt.vm, NULL);
+	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err;
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 1f10fe36619b..6ac15d3bc5bc 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -967,7 +967,7 @@ static int igt_vma_remapped_gtt(void *arg)
 	intel_wakeref_t wakeref;
 	int err = 0;
 
-	if (!i915_ggtt_has_aperture(&i915->ggtt))
+	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
 		return 0;
 
 	obj = i915_gem_object_create_internal(i915, 10 * 10 * PAGE_SIZE);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 8aa7b1d33865..0b469ae0f474 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -69,7 +69,7 @@ static void mock_device_release(struct drm_device *dev)
 	i915_gem_drain_workqueue(i915);
 	i915_gem_drain_freed_objects(i915);
 
-	mock_fini_ggtt(&i915->ggtt);
+	mock_fini_ggtt(to_gt(i915)->ggtt);
 	destroy_workqueue(i915->wq);
 
 	intel_region_ttm_device_fini(i915);
-- 
2.34.1

