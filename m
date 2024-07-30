Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB22794229D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 00:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C430010E574;
	Tue, 30 Jul 2024 22:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuyX+OMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682A910E305;
 Tue, 30 Jul 2024 22:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722377815; x=1753913815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qCyhA4EZ+YVt5V2C/j3gEoE4CkrbPbSQ4eW9bIIZI3o=;
 b=fuyX+OMFKvUfGSIo40FkuL1D1VyTqvY3Vjc42XVLt52Q2tyVKPag6Wd2
 4ukv2UliV6xQthi3JLwbjaivUSvBK3hytmhtEnHxZUYjXy9EGcKoJ+GQM
 BXCRMnvV4Eb1tvT21ZWeI6kAu0mA4N1X8L9MLxuCmsFQpsatrfq442NF9
 VBZkzUYEko45vqmsbzinbhmEMCxiHgkfyrptmzkMHo+NCwt8hFMEd7I7j
 aVyL55frW45SJ4QTOrIkbfd8I7fRhy9ssYhOsGbyoN8PTpFFUzN4PdDZe
 VLGTYKIGcgDH9LsuJCTwtOhmqTnpYPjN0f3e2TyyphJKVZ7s08kzjFaJz w==;
X-CSE-ConnectionGUID: w+nkM9KCSMCPFus9Wzj9bA==
X-CSE-MsgGUID: RFIJiXDaSCCYLLSEJW6ztQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24094124"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="24094124"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:16:55 -0700
X-CSE-ConnectionGUID: lPUoaK04Rlur3pRGWxuJ8g==
X-CSE-MsgGUID: nN2hCdBdRPeP6gSawUSfVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="58613341"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:16:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH 1/3] workqueue: Add interface for user-defined workqueue
 lockdep map
Date: Tue, 30 Jul 2024 15:17:40 -0700
Message-Id: <20240730221742.2248527-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730221742.2248527-1-matthew.brost@intel.com>
References: <20240730221742.2248527-1-matthew.brost@intel.com>
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

Implement a new workqueue flag, WQ_USER_OWNED_LOCKDEP, to indicate that
the user will set up the workqueue lockdep map using the new function
wq_init_user_lockdep_map.

Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/workqueue.h |  3 +++
 kernel/workqueue.c        | 44 ++++++++++++++++++++++++++++++++-------
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index d9968bfc8eac..3e6db0889e2b 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -223,6 +223,8 @@ struct execute_work {
 };
 
 #ifdef CONFIG_LOCKDEP
+void wq_init_user_lockdep_map(struct workqueue_struct *wq,
+			      struct lockdep_map *lockdep_map);
 /*
  * NB: because we have to copy the lockdep_map, setting _key
  * here is required, otherwise it could get initialised to the
@@ -401,6 +403,7 @@ enum wq_flags {
 	 * http://thread.gmane.org/gmane.linux.kernel/1480396
 	 */
 	WQ_POWER_EFFICIENT	= 1 << 7,
+	WQ_USER_OWNED_LOCKDEP	= 1 << 8,	/* allow users to define lockdep map */
 
 	__WQ_DESTROYING		= 1 << 15, /* internal: workqueue is destroying */
 	__WQ_DRAINING		= 1 << 16, /* internal: workqueue is draining */
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 3fbaecfc88c2..228b52b8d7c4 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -366,7 +366,8 @@ struct workqueue_struct {
 #ifdef CONFIG_LOCKDEP
 	char			*lock_name;
 	struct lock_class_key	key;
-	struct lockdep_map	lockdep_map;
+	struct lockdep_map	__lockdep_map;
+	struct lockdep_map	*lockdep_map;
 #endif
 	char			name[WQ_NAME_LEN]; /* I: workqueue name */
 
@@ -3220,7 +3221,7 @@ __acquires(&pool->lock)
 	lockdep_start_depth = lockdep_depth(current);
 	/* see drain_dead_softirq_workfn() */
 	if (!bh_draining)
-		lock_map_acquire(&pwq->wq->lockdep_map);
+		lock_map_acquire(pwq->wq->lockdep_map);
 	lock_map_acquire(&lockdep_map);
 	/*
 	 * Strictly speaking we should mark the invariant state without holding
@@ -3254,7 +3255,7 @@ __acquires(&pool->lock)
 	pwq->stats[PWQ_STAT_COMPLETED]++;
 	lock_map_release(&lockdep_map);
 	if (!bh_draining)
-		lock_map_release(&pwq->wq->lockdep_map);
+		lock_map_release(pwq->wq->lockdep_map);
 
 	if (unlikely((worker->task && in_atomic()) ||
 		     lockdep_depth(current) != lockdep_start_depth ||
@@ -3892,8 +3893,8 @@ static void touch_wq_lockdep_map(struct workqueue_struct *wq)
 	if (wq->flags & WQ_BH)
 		local_bh_disable();
 
-	lock_map_acquire(&wq->lockdep_map);
-	lock_map_release(&wq->lockdep_map);
+	lock_map_acquire(wq->lockdep_map);
+	lock_map_release(wq->lockdep_map);
 
 	if (wq->flags & WQ_BH)
 		local_bh_enable();
@@ -3927,7 +3928,8 @@ void __flush_workqueue(struct workqueue_struct *wq)
 	struct wq_flusher this_flusher = {
 		.list = LIST_HEAD_INIT(this_flusher.list),
 		.flush_color = -1,
-		.done = COMPLETION_INITIALIZER_ONSTACK_MAP(this_flusher.done, wq->lockdep_map),
+		.done = COMPLETION_INITIALIZER_ONSTACK_MAP(this_flusher.done,
+							   (*wq->lockdep_map)),
 	};
 	int next_color;
 
@@ -4778,26 +4780,54 @@ static int init_worker_pool(struct worker_pool *pool)
 }
 
 #ifdef CONFIG_LOCKDEP
+/**
+ * wq_init_user_lockdep_map - init user lockdep map for workqueue
+ * @wq: workqueue to init lockdep map for
+ * @lockdep_map: lockdep map to use for workqueue
+ *
+ * Initialize workqueue with a user defined lockdep map. WQ_USER_OWNED_LOCKDEP
+ * must be set for workqueue.
+ */
+void wq_init_user_lockdep_map(struct workqueue_struct *wq,
+			      struct lockdep_map *lockdep_map)
+{
+	if (WARN_ON_ONCE(!(wq->flags & WQ_USER_OWNED_LOCKDEP)))
+		return;
+
+	wq->lockdep_map = lockdep_map;
+}
+EXPORT_SYMBOL_GPL(wq_init_user_lockdep_map);
+
 static void wq_init_lockdep(struct workqueue_struct *wq)
 {
 	char *lock_name;
 
+	if (wq->flags & WQ_USER_OWNED_LOCKDEP)
+		return;
+
 	lockdep_register_key(&wq->key);
 	lock_name = kasprintf(GFP_KERNEL, "%s%s", "(wq_completion)", wq->name);
 	if (!lock_name)
 		lock_name = wq->name;
 
 	wq->lock_name = lock_name;
-	lockdep_init_map(&wq->lockdep_map, lock_name, &wq->key, 0);
+	wq->lockdep_map = &wq->__lockdep_map;
+	lockdep_init_map(wq->lockdep_map, lock_name, &wq->key, 0);
 }
 
 static void wq_unregister_lockdep(struct workqueue_struct *wq)
 {
+	if (wq->flags & WQ_USER_OWNED_LOCKDEP)
+		return;
+
 	lockdep_unregister_key(&wq->key);
 }
 
 static void wq_free_lockdep(struct workqueue_struct *wq)
 {
+	if (wq->flags & WQ_USER_OWNED_LOCKDEP)
+		return;
+
 	if (wq->lock_name != wq->name)
 		kfree(wq->lock_name);
 }
-- 
2.34.1

