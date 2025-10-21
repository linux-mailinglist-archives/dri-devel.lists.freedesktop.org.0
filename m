Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC65BF8F4E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A0A10E355;
	Tue, 21 Oct 2025 21:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPgTKDn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D2910E34F;
 Tue, 21 Oct 2025 21:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761082796; x=1792618796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/3gsznqjETCpL20UYfZwzexm+NaWvwrW1/yQ+wV6JyY=;
 b=SPgTKDn2CtloiudTjZ9OTbsItem/0QKvPQsVglaoUPxq7HR2sJpaHnhM
 BudgvQ8KlYKYluSloIdFJeRPtmJmX0wBCsPjl74fGuRNl7O6Jz8Aiwsmu
 vOCy/K8fvgiDi59U+U5Ixleo86ET6YCgSY9aXhRKo8ums23Kc2HKTBv4b
 +yfVKj9ugyZ2AliAigtOzLfqUDlf/zAqo7aaaxkDcN375lBa8GtTJcBVn
 3y91Gx0WfR6GGiit0RXuvtqaC8DqsbnULgFIrfhKNxhoYo6+3l4bKjYdI
 /RimS0CErr7/Juu4w3j87MfN3cUjm13MfaG3Lv5BQ/096j2j9NPhgXA1O g==;
X-CSE-ConnectionGUID: 6v9GG1TRSHGH2GtuN/quKQ==
X-CSE-MsgGUID: de7c/T/tQMOm05l22rh4aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63131556"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63131556"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:39:56 -0700
X-CSE-ConnectionGUID: vBqdgJ5qTUKDgNHJC/1Vnw==
X-CSE-MsgGUID: WNCBPE2aRt+VeBntHPyDbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184099254"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:39:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: jiangshanlai@gmail.com, tj@kernel.org, simona.vetter@ffwll.ch,
 christian.koenig@amd.com, pstanner@redhat.com, dakr@kernel.org
Subject: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Date: Tue, 21 Oct 2025 14:39:50 -0700
Message-Id: <20251021213952.746900-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021213952.746900-1-matthew.brost@intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
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

Drivers often use workqueues that are in the reclaim path (e.g., DRM
scheduler workqueues). It is useful to teach lockdep that memory cannot
be allocated on these workqueues. Add an interface to taint workqueue
lockdep with reclaim.

Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/workqueue.h | 19 +++++++++++++++++++
 kernel/workqueue.c        |  9 +++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index dabc351cc127..954c7eb7e225 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -553,6 +553,25 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
 						1, lockdep_map, ##args))
 #endif
 
+
+#ifdef CONFIG_LOCKDEP
+/**
+ * taint_reclaim_workqueue - taint workqueue lockdep map with reclaim
+ * @wq: workqueue to taint with reclaim
+ * gfp: gfp taint
+ *
+ * Drivers often use workqueues that are in the reclaim path (e.g., DRM
+ * scheduler workqueues). It is useful to teach lockdep that memory cannot be
+ * allocated on these workqueues.
+ */
+extern void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp);
+#else
+static inline void taint_reclaim_workqueue(struct workqueue_struct *wq,
+					   gfp_t gfp)
+{
+}
+#endif
+
 /**
  * alloc_ordered_workqueue - allocate an ordered workqueue
  * @fmt: printf format for the name of the workqueue
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 45320e27a16c..fea410c20b71 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5846,6 +5846,15 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags,
 	return wq;
 }
 EXPORT_SYMBOL_GPL(alloc_workqueue_lockdep_map);
+
+void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp)
+{
+	fs_reclaim_acquire(gfp);
+	lock_map_acquire(wq->lockdep_map);
+	lock_map_release(wq->lockdep_map);
+	fs_reclaim_release(gfp);
+}
+EXPORT_SYMBOL_GPL(taint_reclaim_workqueue);
 #endif
 
 static bool pwq_busy(struct pool_workqueue *pwq)
-- 
2.34.1

