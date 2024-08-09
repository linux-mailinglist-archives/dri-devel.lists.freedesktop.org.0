Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCDA94D8B4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 00:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1544B10EA19;
	Fri,  9 Aug 2024 22:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgB4wKEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EA610EA12;
 Fri,  9 Aug 2024 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723242465; x=1754778465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vBcSLoAHnTlPr0DGOVnoBXIz4sPiLaWiqyEvFFFmiIY=;
 b=IgB4wKExkrY2PzRTg7crBOz1cDkgU7IywTXJxNRvD0tzxpFVzkEiqPCy
 DxRqMtv8tsy2ddQY3kqyPFddqrS9aSroJ4Z/jm3qRUoGYq3hVZ6Qv4tcz
 2mH6OPnfFZBJ5MS7ZpaRLyjGe0wWocBAGvyAi5a/2j4koeC72DAK+bMvS
 UU6tI/jBi931Vg9QDSvmDG2J9odtgZX45IsielG1Sou4wXGDUnYLETyQu
 9gr530tQ5LwXAiye89IVwUr+bokGgPjnu4EkGj0NxDsQk2bp6wHzoHn/p
 g5xCNu30BInzMgt2kkgMDsej5HJuGiQJg8kcfrH/ARcd5tVc/ONmgDpv/ w==;
X-CSE-ConnectionGUID: sSr3mdOZQxKt+3nwxze4TQ==
X-CSE-MsgGUID: dFNZL7MCStGF1sT7MO01hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25229656"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="25229656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
X-CSE-ConnectionGUID: qsRtHUBhTtW4Cm8kiOMtUA==
X-CSE-MsgGUID: GHxpiMNHT+OIgHLHQyakJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62641784"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v3 3/5] workqueue: Add interface for user-defined workqueue
 lockdep map
Date: Fri,  9 Aug 2024 15:28:25 -0700
Message-Id: <20240809222827.3211998-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809222827.3211998-1-matthew.brost@intel.com>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
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

Add an interface for a user-defined workqueue lockdep map, which is
helpful when multiple workqueues are created for the same purpose. This
also helps avoid leaking lockdep maps on each workqueue creation.

v2:
 - Add alloc_workqueue_lockdep_map (Tejun)
v3:
 - Drop __WQ_USER_OWNED_LOCKDEP (Tejun)
 - static inline alloc_ordered_workqueue_lockdep_map (Tejun)

Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/workqueue.h | 52 +++++++++++++++++++++++++++++++++++++++
 kernel/workqueue.c        | 28 +++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 4eb8f9563136..8ccbf510880b 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -507,6 +507,58 @@ void workqueue_softirq_dead(unsigned int cpu);
 __printf(1, 4) struct workqueue_struct *
 alloc_workqueue(const char *fmt, unsigned int flags, int max_active, ...);
 
+#ifdef CONFIG_LOCKDEP
+/**
+ * alloc_workqueue_lockdep_map - allocate a workqueue with user-defined lockdep_map
+ * @fmt: printf format for the name of the workqueue
+ * @flags: WQ_* flags
+ * @max_active: max in-flight work items, 0 for default
+ * @lockdep_map: user-defined lockdep_map
+ * @...: args for @fmt
+ *
+ * Same as alloc_workqueue but with the a user-define lockdep_map. Useful for
+ * workqueues created with the same purpose and to avoid leaking a lockdep_map
+ * on each workqueue creation.
+ *
+ * RETURNS:
+ * Pointer to the allocated workqueue on success, %NULL on failure.
+ */
+__printf(1, 5) struct workqueue_struct *
+alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
+			    struct lockdep_map *lockdep_map, ...);
+
+/**
+ * alloc_ordered_workqueue_lockdep_map - allocate an ordered workqueue with
+ * user-defined lockdep_map
+ *
+ * @fmt: printf format for the name of the workqueue
+ * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
+ * @lockdep_map: user-defined lockdep_map
+ * @args: args for @fmt
+ *
+ * Same as alloc_ordered_workqueue but with the a user-define lockdep_map.
+ * Useful for workqueues created with the same purpose and to avoid leaking a
+ * lockdep_map on each workqueue creation.
+ *
+ * RETURNS:
+ * Pointer to the allocated workqueue on success, %NULL on failure.
+ */
+__printf(1, 4) static inline struct workqueue_struct *
+alloc_ordered_workqueue_lockdep_map(const char *fmt, unsigned int flags,
+				    struct lockdep_map *lockdep_map, ...)
+{
+	struct workqueue_struct *wq;
+	va_list args;
+
+	va_start(args, lockdep_map);
+	wq = alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | flags,
+					 1, lockdep_map, args);
+	va_end(args);
+
+	return wq;
+}
+#endif
+
 /**
  * alloc_ordered_workqueue - allocate an ordered workqueue
  * @fmt: printf format for the name of the workqueue
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 24df85589dc0..f4b50a995e99 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -4775,11 +4775,17 @@ static void wq_init_lockdep(struct workqueue_struct *wq)
 
 static void wq_unregister_lockdep(struct workqueue_struct *wq)
 {
+	if (wq->lockdep_map != &wq->__lockdep_map)
+		return;
+
 	lockdep_unregister_key(&wq->key);
 }
 
 static void wq_free_lockdep(struct workqueue_struct *wq)
 {
+	if (wq->lockdep_map != &wq->__lockdep_map)
+		return;
+
 	if (wq->lock_name != wq->name)
 		kfree(wq->lock_name);
 }
@@ -5756,6 +5762,28 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
 }
 EXPORT_SYMBOL_GPL(alloc_workqueue);
 
+#ifdef CONFIG_LOCKDEP
+__printf(1, 5)
+struct workqueue_struct *
+alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags,
+			    int max_active, struct lockdep_map *lockdep_map, ...)
+{
+	struct workqueue_struct *wq;
+	va_list args;
+
+	va_start(args, lockdep_map);
+	wq = __alloc_workqueue(fmt, flags, max_active, args);
+	va_end(args);
+	if (!wq)
+		return NULL;
+
+	wq->lockdep_map = lockdep_map;
+
+	return wq;
+}
+EXPORT_SYMBOL_GPL(alloc_workqueue_lockdep_map);
+#endif
+
 static bool pwq_busy(struct pool_workqueue *pwq)
 {
 	int i;
-- 
2.34.1

