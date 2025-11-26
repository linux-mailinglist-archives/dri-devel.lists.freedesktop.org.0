Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873E5C8BCCB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 21:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0438410E6EB;
	Wed, 26 Nov 2025 20:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBYWiVAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A5D10E68C;
 Wed, 26 Nov 2025 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764188361; x=1795724361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KGVjeCRSxqAJp6ZHvk+uIdlOjameX8llKpK7bxqvdJw=;
 b=HBYWiVAMOUcZLR18wVjHcgRWbKvC3FJKS05gXmVx5dCt1dmEurBnSS4a
 62Qx0GZ73X94nwTwArn3yQNiZZn58DWOOK9kyudZl9r28WjJEYI6+Wk7E
 5N7HfFlFJNa/s4o2Cf/qJL3Qnjskbc43S9Lk7lkymywyxzxMJGImPWQ5k
 EYiVanoSIkecswWkAL4/RzSeLbiEtjRvhiq0YusQbsUB3e5kj//mt1nVV
 LE1ODqH4yLqQTyWkwRETyetOpCwoBI5a92U00ZbzLzy+ZCbl+HZxwSVAv
 kicXTreKD1H6UWYT1ogo4wge7qITZCZYXf9sVeuVfYWRsTdJvAXW0dw+2 A==;
X-CSE-ConnectionGUID: 8Km5INxyQ8+uXJPoTDLSzg==
X-CSE-MsgGUID: hroIi92qSaOxiASr37OzOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76864163"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="76864163"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:19:20 -0800
X-CSE-ConnectionGUID: tWd0QA12TGu+IYhfunNLlA==
X-CSE-MsgGUID: e83KkbSNT32ZOOGoukHT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193137294"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:19:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/8] drm/sched: Add pending job list iterator
Date: Wed, 26 Nov 2025 12:19:10 -0800
Message-Id: <20251126201916.618996-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126201916.618996-1-matthew.brost@intel.com>
References: <20251126201916.618996-1-matthew.brost@intel.com>
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
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

