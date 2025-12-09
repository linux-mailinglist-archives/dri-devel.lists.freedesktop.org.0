Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB344CB0FC0
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 21:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E9D10E5E9;
	Tue,  9 Dec 2025 20:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJGfaWh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9637610E625;
 Tue,  9 Dec 2025 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765310446; x=1796846446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4qPXWKIZOhbETOAZnIjvGOQxedf2OorxiHsLkTHFM1w=;
 b=dJGfaWh16ygLhgRetClmLhvAB7gqg0aYvi2Jbg/mVU1V6CRna4H5iyCi
 YqyLRzE6VZdmnIim6EG3DIiwbab15T5YUChntd0W+FM7KCqaO1l0NxW0d
 Q7DiEIdJ5OF8SaA65tqdotVhCoHhh2zW8CJaOVp0RZL52g0+aI+Bnj2PA
 NSBRiw/ymRIicqdv0pz9PtbYBxIsN2OfRVnkOrqkZ+YwCcpQcihmA0Ni2
 DjlB35NULAAMGaKvRQ/dPievVDwMled0gUTQg1cBi6U3/rnsijf8Em89W
 HAhZ9aP4+uxZySBQKCrfnJkhhZ3TNNmHNsZ9qU3XyiKwrcWX8wIRfwwrX Q==;
X-CSE-ConnectionGUID: sAudKKQPQjq5dNT64c/pug==
X-CSE-MsgGUID: hfDAL3GESMu8Jzf2d9z3sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70897458"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="70897458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:00:45 -0800
X-CSE-ConnectionGUID: 1SzB37cNQziC2ZaNm/MXfg==
X-CSE-MsgGUID: R4psy13oR4O1siDhVUSpqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="201243129"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:00:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, christian.koenig@amd.com,
 pstanner@redhat.com, dakr@kernel.org
Subject: [PATCH v9 2/2] drm/sched: Add pending job list iterator
Date: Tue,  9 Dec 2025 12:00:39 -0800
Message-Id: <20251209200039.1366764-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209200039.1366764-1-matthew.brost@intel.com>
References: <20251209200039.1366764-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

---

v2:
 - Fix checkpatch (CI)
v3:
 - Drop locked version (Christian)
v4:
 - Reorder patch (Niranjana)
v9:
 - Update drm_sched_for_each_pending_job() kernel doc (Philipp)
---
 drivers/gpu/drm/scheduler/sched_main.c |  4 ++-
 include/drm/gpu_scheduler.h            | 50 ++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 5f08719a35f5..bd7936c03da2 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -729,7 +729,9 @@ EXPORT_SYMBOL(drm_sched_start);
  *
  * Drivers can still save and restore their state for recovery operations, but
  * we shouldn't make this a general scheduler feature around the dma_fence
- * interface.
+ * interface. The suggested driver-side replacement is to use
+ * drm_sched_for_each_pending_job() after stopping the scheduler and implement
+ * their own recovery operations.
  */
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
 {
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 86b6075ce799..78e07c2507c7 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -700,4 +700,54 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
 
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
+	WARN_ON(!drm_sched_is_stopped(sched));
+	return iter;
+}
+
+/* Drivers should never call this directly */
+static inline void
+__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
+{
+	WARN_ON(!drm_sched_is_stopped(iter.sched));
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

