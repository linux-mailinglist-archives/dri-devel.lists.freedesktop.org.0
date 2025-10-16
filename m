Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1288CBE571A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE9010E35A;
	Thu, 16 Oct 2025 20:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dL9z3Ugd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A51E10E34E;
 Thu, 16 Oct 2025 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760647711; x=1792183711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JzfKqVf62lQYERGiExiaqThnJq+syeJQOk5r0qhEjSs=;
 b=dL9z3Ugd7/g6eDs/A33RZWcLMuPKraR8tp3tbhfUBKzyfiwzPz25wBvF
 59gUDrTTYzdqDVRq8Om/6dQzLRzrmvRdtOSAOSe9QGdBluneXyjLQxfq2
 CYrUqqrJP48VuD/5UHwM6nxIABpOOWhFCQ3NUcH4FyWyNEgI4JnmBxnCI
 x44aej4wJ2eRd7ObkJ/rGr6m6XDPR6Dh9L2hLXtJJnaolTJyxiLRyuj+3
 VHkeyugTFJ0W9DgDKOFoT2KWK0RqCq0a8cJAmlQFo2/6omZ3u20tlRd+g
 rCg7hxvs6DoXt2gb/ZVuGGk4uX6gTf4U1CPgJ/tYhaHb1PQJeZGGRZODt g==;
X-CSE-ConnectionGUID: h1W3uvRcQnSHUyQjU1c+Hg==
X-CSE-MsgGUID: geiBXut5RSGIm9bwEgU98Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65472183"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65472183"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
X-CSE-ConnectionGUID: GXbpS9fGShmgJB3+vXbOPw==
X-CSE-MsgGUID: tsCXI4sqRF+dPo1VNzvdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186572838"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [PATCH v3 1/7] drm/sched: Add pending job list iterator
Date: Thu, 16 Oct 2025 13:48:20 -0700
Message-Id: <20251016204826.284077-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016204826.284077-1-matthew.brost@intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop open coding pending job list in drivers. Add pending job list
iterator which safely walks DRM scheduler list asserting DRM scheduler
is stopped.

v2:
 - Fix checkpatch (CI)
v3:
 - Drop locked version (Christian)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/gpu_scheduler.h | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..7f31eba3bd61 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -698,4 +698,56 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
 
+/* Inlines */
+
+/**
+ * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
+ * @sched: DRM scheduler associated with pending job iterator
+ */
+struct drm_sched_pending_job_iter {
+	struct drm_gpu_scheduler *sched;
+};
+
+/* Drivers should never call this directly */
+static inline struct drm_sched_pending_job_iter
+__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
+{
+	struct drm_sched_pending_job_iter iter = {
+		.sched = sched,
+	};
+
+	WARN_ON(!READ_ONCE(sched->pause_submit));
+	return iter;
+}
+
+/* Drivers should never call this directly */
+static inline void
+__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
+{
+	WARN_ON(!READ_ONCE(iter.sched->pause_submit));
+}
+
+DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
+	     __drm_sched_pending_job_iter_end(_T),
+	     __drm_sched_pending_job_iter_begin(__sched),
+	     struct drm_gpu_scheduler *__sched);
+static inline void *
+class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
+{ return _T; }
+#define class_drm_sched_pending_job_iter_is_conditional false
+
+/**
+ * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
+ * @__job: Current pending job being iterated over
+ * @__sched: DRM scheduler to iterate over pending jobs
+ * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
+ *
+ * Iterator for each pending job in scheduler, filtering on an entity, and
+ * enforcing scheduler is fully stopped
+ */
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))
+
 #endif
-- 
2.34.1

