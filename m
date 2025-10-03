Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E7BB808B
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9A910E96E;
	Fri,  3 Oct 2025 20:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFlHuOT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD95B10E96A;
 Fri,  3 Oct 2025 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759522322; x=1791058322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ymR6jOTkPFIpanURhrp6K46hNXbXEG0fz6xpglbVO8=;
 b=PFlHuOT0tG0tq9x6RHvA9XkCbLCPA43Cq2RIXaTexloGo8vBhhA8Rxnh
 7UAYV+BwtHFQbPS5TYWiEAtSDPbGNmRybyx/QVaQYatv+6YMyOGUpg9rB
 aHJgNvuXMBAItJ5dXSI3B/JMBxW0nkP1rpufndqZ6KpNV3irGTvJzBEMC
 c8GDxDYRBtxYXZIcobDxJ+ze0r/cVDmzdIyKIX2/7KrTTtTZQrL6uoOnT
 4Q7Z2jDaeduHN/lLtt+og7SdyPVXBvbrYC6/0jT8xk4/jm7KoXE04F216
 gAWfFyWTG60LGgK9waCqjdWRraSIegWWlZ9mAOxmiRwq0+lyvZfD+h6T9 w==;
X-CSE-ConnectionGUID: ldcPp/PlRiC2h74vZEAwSQ==
X-CSE-MsgGUID: fbIyZ41ZT5mbmj+O/p0tSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="87265207"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="87265207"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
X-CSE-ConnectionGUID: nSaSAV0YS4y1AiOWsxxNOA==
X-CSE-MsgGUID: FpkMngJ+T3m3itHdlMEaag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178656983"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [RFC PATCH v2 1/4] drm/sched: Add pending job list iterator
Date: Fri,  3 Oct 2025 13:11:53 -0700
Message-Id: <20251003201156.1995113-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003201156.1995113-1-matthew.brost@intel.com>
References: <20251003201156.1995113-1-matthew.brost@intel.com>
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
iterator which safely walks DRM scheduler list either locklessly
asserting DRM scheduler is stopped or takes pending job list lock.

v2:
 - Fix checkpatch (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/gpu_scheduler.h | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..bb49d8b715eb 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -698,4 +698,68 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
 
+/* Inlines */
+
+/**
+ * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
+ * @sched: DRM scheduler associated with pending job iterator
+ * @stopped: DRM scheduler stopped state associated with pending job iterator
+ */
+struct drm_sched_pending_job_iter {
+	struct drm_gpu_scheduler *sched;
+	bool stopped;
+};
+
+/* Drivers should never call this directly */
+static inline struct drm_sched_pending_job_iter
+__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched, bool stopped)
+{
+	struct drm_sched_pending_job_iter iter = {
+		.sched = sched,
+		.stopped = stopped,
+	};
+
+	if (stopped)
+		WARN_ON(!READ_ONCE(sched->pause_submit));
+	else
+		spin_lock(&sched->job_list_lock);
+
+	return iter;
+}
+
+/* Drivers should never call this directly */
+static inline void
+__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
+{
+	if (iter.stopped)
+		WARN_ON(!READ_ONCE(iter.sched->pause_submit));
+	else
+		spin_unlock(&iter.sched->job_list_lock);
+}
+
+DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
+	     __drm_sched_pending_job_iter_end(_T),
+	     __drm_sched_pending_job_iter_begin(__sched, __stopped),
+	     struct drm_gpu_scheduler *__sched, bool __stopped);
+static inline void
+*class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
+{return _T; }
+#define class_drm_sched_pending_job_iter_is_conditional false
+
+/**
+ * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
+ * @__job: Current pending job being iterated over
+ * @__sched: DRM scheduler to iterate over pending jobs
+ * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
+ * @__stopped: DRM scheduler stopped state
+ *
+ * Iterator for each pending job in scheduler, filtering on an entity, and
+ * enforcing locking rules (either scheduler fully stopped or correctly takes
+ * job_list_lock).
+ */
+#define drm_sched_for_each_pending_job(__job, __sched, __entity, __stopped)	\
+	scoped_guard(drm_sched_pending_job_iter, (__sched), (__stopped))	\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))
+
 #endif
-- 
2.34.1

