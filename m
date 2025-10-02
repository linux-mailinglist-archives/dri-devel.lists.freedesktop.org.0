Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B9BB283C
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B12110E770;
	Thu,  2 Oct 2025 05:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oILoe/CS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217D310E76E;
 Thu,  2 Oct 2025 05:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759382170; x=1790918170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r03qy28edAygZS4ywjyqPVsfxLufHepjYCvJCXfc0tA=;
 b=oILoe/CSSYUHemCNibA70L+PCMp1n9fuXSb+tpv5BfY+e9mA+h4f2aJI
 bpOypUM9A/USXeNTYIG8oLc59K5/4rAukbadiON/lqJKmPT/uzKFkDzey
 +xcmP3dc/MBHH9bnBxesV7lwdOpeh8cMPMpLnCSTm/AMhndRPUGIVLw3i
 KDpxMjxgK807b0E+3urRQQ2hlM34M/J418d+7zVUiyZY8Ut0E716unc+p
 uMVe+ra+FfeQ0REUGThF8zIv8lS4pu1onJM0lmbMiDMxLlmv2BtGcnOTm
 PIhHPuHWSfRV0xT5TYbsjIWmczKUGsMGhaLEMxHcGgkuFKWeTHQtxwnSb w==;
X-CSE-ConnectionGUID: uAGTq8y5RfqoQ0/hN9izpg==
X-CSE-MsgGUID: ryGu1evxT56GemFnmRBUOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65303145"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65303145"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:16:09 -0700
X-CSE-ConnectionGUID: U6J/dxDBQJCZxN20eoWp5A==
X-CSE-MsgGUID: sBdZ3nmATI+2AYel6Sizqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="183264639"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:16:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexdeucher@gmail.com, dakr@kernel.org, christian.koenig@amd.com,
 pstanner@redhat.com
Subject: [RFC PATCH 1/4] drm/sched: Add pending job list iterator
Date: Wed,  1 Oct 2025 22:16:01 -0700
Message-Id: <20251002051604.1865322-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002051604.1865322-1-matthew.brost@intel.com>
References: <20251002051604.1865322-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/gpu_scheduler.h | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..a2dcabab8284 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -698,4 +698,68 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
 
+/* Inlines */
+
+/**
+ * struct drm_sched_iter_pending_job - DRM scheduler pending job iterator state
+ * @sched: DRM scheduler associated with pending job iterator
+ * @stopped: DRM scheduler stopped state associated with pending job iterator
+ */
+struct drm_sched_iter_pending_job {
+	struct drm_gpu_scheduler *sched;
+	bool stopped;
+};
+
+/* Drivers should never call this directly */
+static inline struct drm_sched_iter_pending_job
+__drm_sched_iter_pending_job_begin(struct drm_gpu_scheduler *sched, bool stopped)
+{
+	struct drm_sched_iter_pending_job iter = {
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
+__drm_sched_iter_pending_job_end(const struct drm_sched_iter_pending_job iter)
+{
+	if (iter.stopped)
+		WARN_ON(!READ_ONCE(iter.sched->pause_submit));
+	else
+		spin_unlock(&iter.sched->job_list_lock);
+}
+
+DEFINE_CLASS(drm_sched_iter_pending_job, struct drm_sched_iter_pending_job,
+	     __drm_sched_iter_pending_job_end(_T);,
+	     __drm_sched_iter_pending_job_begin(__sched, __stopped),
+	     struct drm_gpu_scheduler * __sched, bool __stopped);
+static inline void
+*class_drm_sched_iter_pending_job_lock_ptr(class_drm_sched_iter_pending_job_t *_T)
+{return _T; }
+#define class_drm_sched_iter_pending_job_is_conditional false
+
+/**
+ * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
+ * @__job: Current pending job being iterated over
+ * @__sched: DRM scheduler to iterate over pending jobs
+ * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
+ * @__stopped: DRM scheduler stopped state
+ *
+ * Iterator for each pending job in scheduler, filtering on an entity, and
+ * enforcing locking rules (either scheduler fully stoppped or correctly takes
+ * job_list_lock).
+ */
+#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
+	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
+	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
+	for_each_if(!__entitiy || (__job)->entity == (__entitiy))
+
 #endif
-- 
2.34.1

