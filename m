Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8303919AC
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2D26ED26;
	Wed, 26 May 2021 14:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2C76ED15;
 Wed, 26 May 2021 14:15:34 +0000 (UTC)
IronPort-SDR: 3WOZXyhG8KNjkC33JPTPTeZ07HCNuRp6twryT+PJNKz1CNtWSYkb0K9/q/5vEp1buRhXjVGUDI
 HYuvKS5La8ag==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660557"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660557"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:09 -0700
IronPort-SDR: bjFtb2RGi10ritGPd0/anbotQij33oy1QHKZH+lLIxW12lTeE2GHvQMr6U7Px9kym9/s/tcCBX
 TTa7W9YF2bgw==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206291"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:07 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/12] drm/i915: Lift marking a lock as used to utils
Date: Wed, 26 May 2021 15:14:47 +0100
Message-Id: <20210526141456.2334192-4-tvrtko.ursulin@linux.intel.com>
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

After calling lock_set_subclass() the lock _must_ be used, or else
lockdep's internal nr_used_locks becomes unbalanced. Extract the little
utility function to i915_utils.c

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +------------
 drivers/gpu/drm/i915/i915_utils.c         | 15 +++++++++++++++
 drivers/gpu/drm/i915/i915_utils.h         |  7 +++++++
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 3f9a811eb02b..15566819539f 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -794,18 +794,7 @@ intel_engine_init_active(struct intel_engine_cs *engine, unsigned int subclass)
 
 	spin_lock_init(&engine->active.lock);
 	lockdep_set_subclass(&engine->active.lock, subclass);
-
-	/*
-	 * Due to an interesting quirk in lockdep's internal debug tracking,
-	 * after setting a subclass we must ensure the lock is used. Otherwise,
-	 * nr_unused_locks is incremented once too often.
-	 */
-#ifdef CONFIG_DEBUG_LOCK_ALLOC
-	local_irq_disable();
-	lock_map_acquire(&engine->active.lock.dep_map);
-	lock_map_release(&engine->active.lock.dep_map);
-	local_irq_enable();
-#endif
+	mark_lock_used_irq(&engine->active.lock);
 }
 
 static struct intel_context *
diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
index 90c7f0c4838c..894de60833ec 100644
--- a/drivers/gpu/drm/i915/i915_utils.c
+++ b/drivers/gpu/drm/i915/i915_utils.c
@@ -127,3 +127,18 @@ void fs_reclaim_taints_mutex(struct mutex *mutex)
 
 	fs_reclaim_release(GFP_KERNEL);
 }
+
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+void __mark_lock_used_irq(struct lockdep_map *lock)
+{
+	/*
+	 * Due to an interesting quirk in lockdep's internal debug tracking,
+	 * after setting a subclass we must ensure the lock is used. Otherwise,
+	 * nr_unused_locks is incremented once too often.
+	 */
+	local_irq_disable();
+	lock_map_acquire(lock);
+	lock_map_release(lock);
+	local_irq_enable();
+}
+#endif
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 4133d5193839..c3d234133da7 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -455,6 +455,13 @@ static inline bool timer_expired(const struct timer_list *t)
 	return timer_active(t) && !timer_pending(t);
 }
 
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+void __mark_lock_used_irq(struct lockdep_map *lock);
+#define mark_lock_used_irq(lock) __mark_lock_used_irq(&(lock)->dep_map)
+#else
+#define mark_lock_used_irq(lock)
+#endif
+
 /*
  * This is a lookalike for IS_ENABLED() that takes a kconfig value,
  * e.g. CONFIG_DRM_I915_SPIN_REQUEST, and evaluates whether it is non-zero
-- 
2.30.2

