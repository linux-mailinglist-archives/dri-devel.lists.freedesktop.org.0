Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5B7C714E3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 23:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA14310E6A3;
	Wed, 19 Nov 2025 22:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsKcbjAl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2DD10E271;
 Wed, 19 Nov 2025 22:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763592074; x=1795128074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6hQeEIVvJcwcbTxa6weR3U7IequVN5HxxQadPLCJ+nY=;
 b=KsKcbjAl0KNeTj0QTRyIn8fAqSCrdjcN9AR1axmTfCmeI1gjO5ylsQEH
 5CE8DWy6AVYK9+1oAok9eOdS5RnSXHpiPfwgOA3euJoZUZsxyQjhd0ST/
 QG7/2Py02Zz/Nuo98SWAF22C2kNebwrmicSHQRyNRo7/jpFJGN9E8Tvjq
 UIe2/acj+7LULCqBgCq5KoFJJ+mtOidbVDQvux9xgZ42/QUJTnrSqXqLW
 RryvpTOdhBKYbcfCst1uggRMcLPgAjuCtW64BI0pRQ3nlG9x2uljC1BHD
 c1hmEfqw0FSqNHKcxKjZ6EOusi2z83Ip1d6cHbYaDkQTbx1cXy44dPMcT w==;
X-CSE-ConnectionGUID: h32pOxbXR6KYFtvmoF8P0w==
X-CSE-MsgGUID: zzy4yaFRRT+oMZR8ofabcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76755382"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="76755382"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:41:12 -0800
X-CSE-ConnectionGUID: 31w41FQ7Rs+r7KcfztL2yA==
X-CSE-MsgGUID: 8KYs1ivNT5qcnl8R3pU2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="228504134"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:41:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, umesh.nerlige.ramappa@intel.com,
 christian.koenig@amd.com, pstanner@redhat.com, dakr@kernel.org
Subject: [PATCH v4 2/8] drm/sched: Add pending job list iterator
Date: Wed, 19 Nov 2025 14:41:00 -0800
Message-Id: <20251119224106.3733883-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119224106.3733883-1-matthew.brost@intel.com>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
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
v4:
 - Reorder patch (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/gpu_scheduler.h | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 385bf34e76fe..9d228513d06c 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -730,4 +730,54 @@ static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
 		dma_fence_is_signaled(&s_fence->finished);
 }
 
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

