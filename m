Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38D294D8B1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 00:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD57610EA14;
	Fri,  9 Aug 2024 22:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0fjWZvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A4210EA11;
 Fri,  9 Aug 2024 22:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723242464; x=1754778464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5NsFxeHz5H781GU70fSvGb8d+biJ1SrQI5t3Iz1xhm4=;
 b=k0fjWZvBnj+OPNxItE2+e3o4JyIqI2391mNEbsYyblxrbHYeGaHi8xdf
 2LxAWsI5EJwQjgzJZaFoT/b8wdnc4/MT7zXM3dcR41l7pc1nfS5lICZZn
 vgqydZzkpQgcpVJmV9fVx/gPlERz0bbmsXpxivYUd2CHcBq7s840VLLTx
 /BrSx/h7hkBf2OWCMnBfI3mZ3Ln0zBL6PlRyJqjIBETARKYFLEGkvcVJk
 Ct2HGRj6TvvInYxhqFsh/poYviHLiuAhx4nrwPDjz4ZPAvR9UmoSXZBwo
 iYD0Zkk71X7zEw0MoCesgS/cYH/dzSGBIBXhmdUTlFaF22lDZC7IzPjjI w==;
X-CSE-ConnectionGUID: fhmsjkq6R32HHLBzYgCaNg==
X-CSE-MsgGUID: A4GLeNRzSaqS9Ab4F0SjmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25229650"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="25229650"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
X-CSE-ConnectionGUID: FOR7/2yKRCiAdYThcoZIyA==
X-CSE-MsgGUID: gVoIWKkETiKThh1mDYVCPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62641783"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v3 2/5] workqueue: Change workqueue lockdep map to pointer
Date: Fri,  9 Aug 2024 15:28:24 -0700
Message-Id: <20240809222827.3211998-3-matthew.brost@intel.com>
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

Will help enable user-defined lockdep maps for workqueues.

Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 kernel/workqueue.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 90a98c9b0ac6..24df85589dc0 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -364,7 +364,8 @@ struct workqueue_struct {
 #ifdef CONFIG_LOCKDEP
 	char			*lock_name;
 	struct lock_class_key	key;
-	struct lockdep_map	lockdep_map;
+	struct lockdep_map	__lockdep_map;
+	struct lockdep_map	*lockdep_map;
 #endif
 	char			name[WQ_NAME_LEN]; /* I: workqueue name */
 
@@ -3203,7 +3204,7 @@ __acquires(&pool->lock)
 	lockdep_start_depth = lockdep_depth(current);
 	/* see drain_dead_softirq_workfn() */
 	if (!bh_draining)
-		lock_map_acquire(&pwq->wq->lockdep_map);
+		lock_map_acquire(pwq->wq->lockdep_map);
 	lock_map_acquire(&lockdep_map);
 	/*
 	 * Strictly speaking we should mark the invariant state without holding
@@ -3237,7 +3238,7 @@ __acquires(&pool->lock)
 	pwq->stats[PWQ_STAT_COMPLETED]++;
 	lock_map_release(&lockdep_map);
 	if (!bh_draining)
-		lock_map_release(&pwq->wq->lockdep_map);
+		lock_map_release(pwq->wq->lockdep_map);
 
 	if (unlikely((worker->task && in_atomic()) ||
 		     lockdep_depth(current) != lockdep_start_depth ||
@@ -3873,8 +3874,8 @@ static void touch_wq_lockdep_map(struct workqueue_struct *wq)
 	if (wq->flags & WQ_BH)
 		local_bh_disable();
 
-	lock_map_acquire(&wq->lockdep_map);
-	lock_map_release(&wq->lockdep_map);
+	lock_map_acquire(wq->lockdep_map);
+	lock_map_release(wq->lockdep_map);
 
 	if (wq->flags & WQ_BH)
 		local_bh_enable();
@@ -3908,7 +3909,7 @@ void __flush_workqueue(struct workqueue_struct *wq)
 	struct wq_flusher this_flusher = {
 		.list = LIST_HEAD_INIT(this_flusher.list),
 		.flush_color = -1,
-		.done = COMPLETION_INITIALIZER_ONSTACK_MAP(this_flusher.done, wq->lockdep_map),
+		.done = COMPLETION_INITIALIZER_ONSTACK_MAP(this_flusher.done, (*wq->lockdep_map)),
 	};
 	int next_color;
 
@@ -4768,7 +4769,8 @@ static void wq_init_lockdep(struct workqueue_struct *wq)
 		lock_name = wq->name;
 
 	wq->lock_name = lock_name;
-	lockdep_init_map(&wq->lockdep_map, lock_name, &wq->key, 0);
+	wq->lockdep_map = &wq->__lockdep_map;
+	lockdep_init_map(wq->lockdep_map, lock_name, &wq->key, 0);
 }
 
 static void wq_unregister_lockdep(struct workqueue_struct *wq)
-- 
2.34.1

