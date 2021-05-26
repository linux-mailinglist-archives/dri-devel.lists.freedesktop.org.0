Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893CE3919AB
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F85B6ED15;
	Wed, 26 May 2021 14:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C8A6ED15;
 Wed, 26 May 2021 14:15:34 +0000 (UTC)
IronPort-SDR: RYC+NXzn7nBc6RT9jb3Ot29vzmsD02KRz81mNxjOJjC4BK9YVhyxaMqAcljjf1UX8WYZIZryvU
 S0C7x6gTqGKA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660550"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660550"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:07 -0700
IronPort-SDR: 98PBj+H60+6U3jU8lSIdCVF5c3czWQLtliOYphmCIMl3aeK9r7ApJonPUu5UmYyE/xDYi539Ii
 UH3IeY3MQLDA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206275"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:06 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/12] drm/i915: Remove notion of GEM from
 i915_gem_shrinker_taints_mutex
Date: Wed, 26 May 2021 15:14:46 +0100
Message-Id: <20210526141456.2334192-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Since we dropped the use of dev->struct_mutex from inside the shrinker,
we no longer include that as part of our fs_reclaim tainting. We can
drop the i915 argument and rebrand it as a generic fs_reclaim tainter.

v2 (Tvrtko):
 * Rebase.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com> # v1
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 14 --------------
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.h |  2 --
 drivers/gpu/drm/i915/gt/intel_gtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c        |  2 +-
 drivers/gpu/drm/i915/i915_utils.c            | 13 +++++++++++++
 drivers/gpu/drm/i915/i915_utils.h            |  2 ++
 6 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index f4fb68e8955a..d68679a89d93 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -438,20 +438,6 @@ void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915)
 	unregister_shrinker(&i915->mm.shrinker);
 }
 
-void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
-				    struct mutex *mutex)
-{
-	if (!IS_ENABLED(CONFIG_LOCKDEP))
-		return;
-
-	fs_reclaim_acquire(GFP_KERNEL);
-
-	mutex_acquire(&mutex->dep_map, 0, 0, _RET_IP_);
-	mutex_release(&mutex->dep_map, _RET_IP_);
-
-	fs_reclaim_release(GFP_KERNEL);
-}
-
 #define obj_to_i915(obj__) to_i915((obj__)->base.dev)
 
 void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.h b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.h
index 8512470f6fd6..17ad82ea961f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.h
@@ -27,7 +27,5 @@ unsigned long i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 unsigned long i915_gem_shrink_all(struct drm_i915_private *i915);
 void i915_gem_driver_register__shrinker(struct drm_i915_private *i915);
 void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915);
-void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
-				    struct mutex *mutex);
 
 #endif /* __I915_GEM_SHRINKER_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 9b98f9d9faa3..70d207057ce5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -156,7 +156,7 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	lockdep_set_subclass(&vm->mutex, subclass);
 
 	if (!intel_vm_no_concurrent_access_wa(vm->i915)) {
-		i915_gem_shrinker_taints_mutex(vm->i915, &vm->mutex);
+		fs_reclaim_taints_mutex(&vm->mutex);
 	} else {
 		/*
 		 * CHV + BXT VTD workaround use stop_machine(),
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index d5094be6d90f..213dcfef68b1 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1405,7 +1405,7 @@ void intel_gt_init_reset(struct intel_gt *gt)
 	 * within the shrinker, we forbid ourselves from performing any
 	 * fs-reclaim or taking related locks during reset.
 	 */
-	i915_gem_shrinker_taints_mutex(gt->i915, &gt->reset.mutex);
+	fs_reclaim_taints_mutex(&gt->reset.mutex);
 
 	/* no GPU until we are ready! */
 	__set_bit(I915_WEDGED, &gt->reset.flags);
diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
index f9e780dee9de..90c7f0c4838c 100644
--- a/drivers/gpu/drm/i915/i915_utils.c
+++ b/drivers/gpu/drm/i915/i915_utils.c
@@ -114,3 +114,16 @@ void set_timer_ms(struct timer_list *t, unsigned long timeout)
 	/* Keep t->expires = 0 reserved to indicate a canceled timer. */
 	mod_timer(t, jiffies + timeout ?: 1);
 }
+
+void fs_reclaim_taints_mutex(struct mutex *mutex)
+{
+	if (!IS_ENABLED(CONFIG_LOCKDEP))
+		return;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+
+	mutex_acquire(&mutex->dep_map, 0, 0, _RET_IP_);
+	mutex_release(&mutex->dep_map, _RET_IP_);
+
+	fs_reclaim_release(GFP_KERNEL);
+}
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index f02f52ab5070..4133d5193839 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -266,6 +266,8 @@ static inline int list_is_last_rcu(const struct list_head *list,
 	return READ_ONCE(list->next) == head;
 }
 
+void fs_reclaim_taints_mutex(struct mutex *mutex);
+
 static inline unsigned long msecs_to_jiffies_timeout(const unsigned int m)
 {
 	unsigned long j = msecs_to_jiffies(m);
-- 
2.30.2

