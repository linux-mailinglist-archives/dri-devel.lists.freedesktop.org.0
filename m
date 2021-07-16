Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3293CBD36
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326ED6EA22;
	Fri, 16 Jul 2021 19:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AF16E9E1;
 Fri, 16 Jul 2021 19:59:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596731"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596731"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238966"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/51] drm/i915: Add i915_sched_engine destroy vfunc
Date: Fri, 16 Jul 2021 13:16:57 -0700
Message-Id: <20210716201724.54804-25-matthew.brost@intel.com>
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

This help the backends clean up when the schedule engine object gets
destroyed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_scheduler.c       | 3 ++-
 drivers/gpu/drm/i915/i915_scheduler.h       | 4 +---
 drivers/gpu/drm/i915/i915_scheduler_types.h | 5 +++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 3a58a9130309..4fceda96deed 100644
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

