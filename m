Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F099E40C479
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 13:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A20899E7;
	Wed, 15 Sep 2021 11:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCB2899D4;
 Wed, 15 Sep 2021 11:42:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="209523663"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="209523663"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 04:42:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544809370"
Received: from emurray1-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.236.35])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 04:42:03 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm/i915/debugfs: Do not report currently active engine when
 describing objects
Date: Wed, 15 Sep 2021 12:41:53 +0100
Message-Id: <20210915114153.951670-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

It is not very useful to have code which tries to report a rapidly
transient state which will not report anything majority of the time,
especially since it is currently only used from
<debugfs>/i915_gem_framebuffers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 17 -----------------
 drivers/gpu/drm/i915/i915_debugfs.c        |  5 -----
 2 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..3043fcbd31bd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -503,23 +503,6 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
 	i915_gem_object_unpin_pages(obj);
 }
 
-static inline struct intel_engine_cs *
-i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
-{
-	struct intel_engine_cs *engine = NULL;
-	struct dma_fence *fence;
-
-	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
-	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
-	return engine;
-}
-
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 					 unsigned int cache_level);
 void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 04351a851586..1795af81bf41 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -139,7 +139,6 @@ void
 i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
-	struct intel_engine_cs *engine;
 	struct i915_vma *vma;
 	int pin_count = 0;
 
@@ -229,10 +228,6 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 		seq_printf(m, " (stolen: %08llx)", obj->stolen->start);
 	if (i915_gem_object_is_framebuffer(obj))
 		seq_printf(m, " (fb)");
-
-	engine = i915_gem_object_last_write_engine(obj);
-	if (engine)
-		seq_printf(m, " (%s)", engine->name);
 }
 
 static int i915_gem_object_info(struct seq_file *m, void *data)
-- 
2.30.2

