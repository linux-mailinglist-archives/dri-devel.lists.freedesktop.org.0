Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F377F39AC51
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9258E6EEB1;
	Thu,  3 Jun 2021 21:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DFA6EADD;
 Thu,  3 Jun 2021 21:09:38 +0000 (UTC)
IronPort-SDR: 2QNgCsBLr67IKt7tegt2MglIXtwLAouai9FY3yqQ2H7PtgPJz4HwApBIZEZxcFpd95B7b6mpkL
 0zy7gKamGZog==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="203966020"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="203966020"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 14:09:36 -0700
IronPort-SDR: 8chWxHHc11zIZsKeCm1j5+GVR6z+54k2B8WGXxnrIK7o/JpnpBduIAEq7exsLCejGWUwW+dMot
 SejOJPXocFww==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="448015291"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 14:09:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 9/9] drm/i915/doc: Add kernel doc for i915_sched_engine
Date: Thu,  3 Jun 2021 14:27:22 -0700
Message-Id: <20210603212722.59719-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210603212722.59719-1-matthew.brost@intel.com>
References: <20210603212722.59719-1-matthew.brost@intel.com>
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
Cc: daniel.vetter@intel.com, daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/i915.rst                  |  6 ++++
 drivers/gpu/drm/i915/i915_scheduler_types.h | 37 ++++++++++++++++++---
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 42ce0196930a..8f4f5471a05b 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -425,6 +425,12 @@ User Batchbuffer Execution
 .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
    :doc: User command execution
 
+Scheduling
+----------
+.. kernel-doc:: drivers/gpu/drm/i915/i915_scheduler_types.h
+   :functions: i915_sched_engine
+
+
 Logical Rings, Logical Ring Contexts and Execlists
 --------------------------------------------------
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index 9d79514450de..e3da7517853f 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -91,7 +91,21 @@ struct i915_dependency {
 				&(rq__)->sched.signalers_list, \
 				signal_link)
 
+/**
+ * sturct i915_sched_engine - scheduler engine
+ *
+ * A schedule engine represents a submission queue with different priority
+ * bands. It contains all the common state (relative to the backend) to queue,
+ * track, and submit a request.
+ *
+ * This object at the moment is quite i915 specific but will transition into a
+ * container for the drm_gpu_scheduler plus a few other variables once the i915
+ * is integrated with the DRM scheduler.
+ */
 struct i915_sched_engine {
+	/**
+	 * @ref: reference count of schedule engine object
+	 */
 	struct kref ref;
 
 	/**
@@ -100,11 +114,18 @@ struct i915_sched_engine {
 	 */
 	spinlock_t lock;
 
+	/**
+	 * @requests: list of requests inflight on this schedule engine
+	 */
 	struct list_head requests;
-	struct list_head hold; /* ready requests, but on hold */
 
 	/**
-	 * @tasklet: softirq tasklet for bottom handler
+	 * @hold: list of requests on hold.
+	 */
+	struct list_head hold;
+
+	/**
+	 * @tasklet: softirq tasklet for submission
 	 */
 	struct tasklet_struct tasklet;
 
@@ -137,14 +158,20 @@ struct i915_sched_engine {
 	 */
 	bool no_priolist;
 
-	/* Back pointer to engine */
+	/**
+	 * @engine: back pointer to engine
+	 */
 	struct intel_engine_cs *engine;
 
-	/* Kick backend */
+	/**
+	 * @kick_backed: kick back after a request's priority has changed
+	 */
 	void	(*kick_backend)(const struct i915_request *rq,
 				int prio);
 
-	/*
+	/**
+	 * @schedule: schedule function to adjust priority of request
+	 *
 	 * Call when the priority on a request has changed and it and its
 	 * dependencies may need rescheduling. Note the request itself may
 	 * not be ready to run!
-- 
2.28.0

