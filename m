Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8EFBB8085
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA26010E96A;
	Fri,  3 Oct 2025 20:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCwQgNeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEDD10E968;
 Fri,  3 Oct 2025 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759522322; x=1791058322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0EOL8vhHtdvMoGJhVTvk3haBJNhDK29tBOMnfl9YPaI=;
 b=TCwQgNeOd8DU3AXGYs/i8mMKjbzyuc4jCY7ZrMqaNg+vZvCPl0uxdCBQ
 y4Sc7CdToginKUJuxr2f8Ehdmwo+27rcBegB54CU4IMl3bWn9ofwGZm0F
 ElYVLHQhEkPwpNpbLH8qCfEwvFjXtMJbHSBL76AOXocllLx9zkjVHXyNS
 vsJ7PrGYK2SZ7gbQf+g9GCsTSXM9/wfqECV51FboHPZWHLbvzAFxLt5w/
 b7pmkYa1QFDMEH7411ToOE3MBXlNxehDs3nqF72rB+w60CoigS0HF2SvG
 gActLWruOqqQEKZkjahzkbrB3NVOA6Z/pzwTXOAFMa5bY6PAEWvmpPx0Q w==;
X-CSE-ConnectionGUID: 9EaPWx+XRniGuXlg4ixoxw==
X-CSE-MsgGUID: tih73EaRQqSUpHLZEBlXjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="87265212"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="87265212"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
X-CSE-ConnectionGUID: Ajh35uRERGycI36Jmxe7vg==
X-CSE-MsgGUID: 2GY0kcMxTPK5B5ViLF/wAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178656984"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [RFC PATCH v2 2/4] drm/sched: Add several job helpers to avoid
 drivers touching scheduler state
Date: Fri,  3 Oct 2025 13:11:54 -0700
Message-Id: <20251003201156.1995113-3-matthew.brost@intel.com>
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

Add helpers to find first pending job, pending job count, and a jobs
signaled state. Expected to used driver side on recovery and debug
flows.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/gpu_scheduler.h | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index bb49d8b715eb..e1e264c2043e 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -762,4 +762,56 @@ static inline void
 		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
 			for_each_if(!(__entity) || (__job)->entity == (__entity))
 
+/**
+ * drm_sched_first_pending_job() - DRM scheduler first pending job
+ * @sched: DRM scheduler
+ *
+ * Find DRM scheduler first pending job, drivers should only call this function
+ * when scheduler is stopped or job can immediately disappear resulting in a
+ * UAF.
+ *
+ * Return: First pending job or NULL
+ */
+static inline struct drm_sched_job *
+drm_sched_first_pending_job(struct drm_gpu_scheduler *sched)
+{
+	WARN_ON(!READ_ONCE(sched->pause_submit));
+	guard(spinlock)(&sched->job_list_lock);
+	return list_first_entry_or_null(&sched->pending_list,
+					struct drm_sched_job, list);
+}
+
+/**
+ * drm_sched_pending_job_count() - DRM scheduler pending job count
+ * @sched: DRM scheduler
+ *
+ * Determine DRM scheduler pending job count. If scheduler if not stopped, this
+ * value can immediately change, thus drivers must guard against using to count
+ * to anything memory unsafe. Use with caution.
+ *
+ * Return: Number of pending jobs
+ */
+static inline int drm_sched_pending_job_count(struct drm_gpu_scheduler *sched)
+{
+	guard(spinlock)(&sched->job_list_lock);
+	return list_count_nodes(&sched->pending_list);
+}
+
+/**
+ * drm_sched_job_is_signaled() - DRM scheduler job is signaled
+ * @job: DRM scheduler job
+ *
+ * Determine if DRM scheduler job is signaled. DRM scheduler should be stopped
+ * to obtain a stable snapshot of state.
+ *
+ * Return: True if job is signaled, False otherwise
+ */
+static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
+{
+	struct drm_sched_fence *s_fence = job->s_fence;
+
+	WARN_ON(!READ_ONCE(job->sched->pause_submit));
+	return s_fence->parent && dma_fence_is_signaled(s_fence->parent);
+}
+
 #endif
-- 
2.34.1

