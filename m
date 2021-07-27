Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD543D6A89
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C586FFE4;
	Tue, 27 Jul 2021 00:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E486FC38;
 Tue, 27 Jul 2021 00:05:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="191932124"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="191932124"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:05:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="662339144"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:05:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/33] drm/i915: Add i915_sched_engine destroy vfunc
Date: Mon, 26 Jul 2021 17:23:21 -0700
Message-Id: <20210727002348.97202-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210727002348.97202-1-matthew.brost@intel.com>
References: <20210727002348.97202-1-matthew.brost@intel.com>
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

This is required to allow backend specific cleanup

v2:
 (John H)
  - Rework commit message

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_scheduler.c       | 3 ++-
 drivers/gpu/drm/i915/i915_scheduler.h       | 4 +---
 drivers/gpu/drm/i915/i915_scheduler_types.h | 5 +++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 561c649e59f7..2804fd5b660b 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -431,7 +431,7 @@ void i915_request_show_with_schedule(struct drm_printer *m,
 	rcu_read_unlock();
 }
 
-void i915_sched_engine_free(struct kref *kref)
+static void default_destroy(struct kref *kref)
 {
 	struct i915_sched_engine *sched_engine =
 		container_of(kref, typeof(*sched_engine), ref);
@@ -453,6 +453,7 @@ i915_sched_engine_create(unsigned int subclass)
 
 	sched_engine->queue = RB_ROOT_CACHED;
 	sched_engine->queue_priority_hint = INT_MIN;
+	sched_engine->destroy = default_destroy;
 
 	INIT_LIST_HEAD(&sched_engine->requests);
 	INIT_LIST_HEAD(&sched_engine->hold);
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 650ab8e0db9f..3c9504e9f409 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -51,8 +51,6 @@ static inline void i915_priolist_free(struct i915_priolist *p)
 struct i915_sched_engine *
 i915_sched_engine_create(unsigned int subclass);
 
-void i915_sched_engine_free(struct kref *kref);
-
 static inline struct i915_sched_engine *
 i915_sched_engine_get(struct i915_sched_engine *sched_engine)
 {
@@ -63,7 +61,7 @@ i915_sched_engine_get(struct i915_sched_engine *sched_engine)
 static inline void
 i915_sched_engine_put(struct i915_sched_engine *sched_engine)
 {
-	kref_put(&sched_engine->ref, i915_sched_engine_free);
+	kref_put(&sched_engine->ref, sched_engine->destroy);
 }
 
 static inline bool
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index 5935c3152bdc..00384e2c5273 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -163,6 +163,11 @@ struct i915_sched_engine {
 	 */
 	void *private_data;
 
+	/**
+	 * @destroy: destroy schedule engine / cleanup in backend
+	 */
+	void	(*destroy)(struct kref *kref);
+
 	/**
 	 * @kick_backend: kick backend after a request's priority has changed
 	 */
-- 
2.28.0

