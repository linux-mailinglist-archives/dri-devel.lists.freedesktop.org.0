Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649D29423D0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 02:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C641910E362;
	Wed, 31 Jul 2024 00:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3nQnf1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094D910E230;
 Wed, 31 Jul 2024 00:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722385832; x=1753921832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6iC7cqHHEWf0XvOJNVvsLe4YM0JKB2yPfC3YrzQWYqU=;
 b=E3nQnf1KYtrY3HARDotOePBY6RU6EFEE3lygpqHQiP+2Hwpa/wI7AP4r
 kl0zzcJvs29OLeiVClUJzvuG2MI2vCMto1sx9/7Kfp1PovpjsCdX/ezkZ
 /vZ9arIjMDEz+molYmNIiqT2GeH5tCT4MsSaNRIHGMpbD50rusuDNtn+b
 joIygXQ9ZTk92hCQ0Ly829M6bmM9K3weZ1uIBmv6XXeEQloivs3pZfr09
 WKpMEzMz1pyrv0GD2QJ6bE4yRo9naLYzyUYPkTxKkX9JC0ZUwLsQSQbty
 KvImsqt8G1Uj1xaEv0gCGLZnASJgCe6AmX2V3lXMREb+1PBnR18gGI2wI A==;
X-CSE-ConnectionGUID: lHm7NacvTKuOp98fduGkRw==
X-CSE-MsgGUID: pkY4ay5kSOencOtboJGZzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23156090"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23156090"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:31 -0700
X-CSE-ConnectionGUID: U8SOASvxQPis1+P4kIkyhg==
X-CSE-MsgGUID: Y++OagSdRQuU43mO7bkTyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="77781799"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 3/5] workqueue: Add interface for user-defined workqueue
 lockdep map
Date: Tue, 30 Jul 2024 17:31:17 -0700
Message-Id: <20240731003119.2422940-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240731003119.2422940-1-matthew.brost@intel.com>
References: <20240731003119.2422940-1-matthew.brost@intel.com>
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

Implement a new internal workqueue flag, __WQ_USER_OWNED_LOCKDEP, to
indicate that the user will set up the workqueue lockdep map using the
new function alloc_workqueue_lockdep_map. Also add helper macro
alloc_ordered_workqueue_lockdep_map.

v2:
 - Add alloc_workqueue_lockdep_map (Tejun)

Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/workqueue.h | 25 +++++++++++++++++++++++++
 kernel/workqueue.c        | 28 ++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index d9968bfc8eac..1707870ef7c5 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -406,6 +406,7 @@ enum wq_flags {
 	__WQ_DRAINING		= 1 << 16, /* internal: workqueue is draining */
 	__WQ_ORDERED		= 1 << 17, /* internal: workqueue is ordered */
 	__WQ_LEGACY		= 1 << 18, /* internal: create*_workqueue() */
+	__WQ_USER_OWNED_LOCKDEP	= 1 << 19, /* internal: workqueue has user owned lockdep map */
 
 	/* BH wq only allows the following flags */
 	__WQ_BH_ALLOWS		= WQ_BH | WQ_HIGHPRI,
@@ -507,6 +508,30 @@ void workqueue_softirq_dead(unsigned int cpu);
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
+ * Same as alloc_workqueue but with the a user-defined lockdep_map. Useful for
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
+#define alloc_ordered_workqueue_lockdep_map(fmt, flags, lockdep_map, args...)	\
+	alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, lockdep_map, ##args)
+#endif
+
 /**
  * alloc_ordered_workqueue - allocate an ordered workqueue
  * @fmt: printf format for the name of the workqueue
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index b3fa4d044f69..e1361dedbe06 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -4795,11 +4795,17 @@ static void wq_init_lockdep(struct workqueue_struct *wq)
 
 static void wq_unregister_lockdep(struct workqueue_struct *wq)
 {
+	if (wq->flags & __WQ_USER_OWNED_LOCKDEP)
+		return;
+
 	lockdep_unregister_key(&wq->key);
 }
 
 static void wq_free_lockdep(struct workqueue_struct *wq)
 {
+	if (wq->flags & __WQ_USER_OWNED_LOCKDEP)
+		return;
+
 	if (wq->lock_name != wq->name)
 		kfree(wq->lock_name);
 }
@@ -5792,6 +5798,28 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
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
+	wq = __alloc_workqueue(fmt, flags | __WQ_USER_OWNED_LOCKDEP, max_active, args);
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

