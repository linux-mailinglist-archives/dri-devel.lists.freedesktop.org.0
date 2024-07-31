Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B929423CE
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 02:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5B810E341;
	Wed, 31 Jul 2024 00:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWP6XaRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0168810E04A;
 Wed, 31 Jul 2024 00:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722385832; x=1753921832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9VB0D6qtSFvrmgUitG4lhcQZt2t0l9f3P97TzqnDp48=;
 b=EWP6XaRBviGaHq3ogH3qm+plnP+JBaRv6LEMBBVP+BDARFJN+W3QXcyJ
 MW81UNc7X2sVTUmSLGDLAqg1aS5yG3CfVoabv/aY4fT51ZgudBGMUB3nL
 ApVdj9z/LxBa+qYeNtQaWBL/P5KxoPQjRhzt2tmtLFhgEwG7HYCdUfnG0
 uC1rxNoG/eMMumBHHLwRNc/5JWtpPHL3rb0CuV+SzKe+iZLGruDl7GxhX
 IEPDFftyyUOwg+V6emVTytOIpH3e7WouF4Ae3kp3Fl662zMZ1LlYxuxhJ
 OIMZ4K+dY7iNprK1Q9Qws0keprJlOPvAhKchzCrHGrdZw5TExr3gXUaE8 g==;
X-CSE-ConnectionGUID: qv3EXLOaS3Grn35vDxf68g==
X-CSE-MsgGUID: f0fugzhOQfOmGWH4JnOyTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23156084"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23156084"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:31 -0700
X-CSE-ConnectionGUID: PcAjtUvuSueJEW9URfTEwQ==
X-CSE-MsgGUID: zkV+Pj5MRvqcGWfBoTaUkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="77781798"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 2/5] workqueue: Change workqueue lockdep map to pointer
Date: Tue, 30 Jul 2024 17:31:16 -0700
Message-Id: <20240731003119.2422940-3-matthew.brost@intel.com>
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

Will help enable user-defined lockdep maps for workqueues.

Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 kernel/workqueue.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index c9bdd6a23a2b..b3fa4d044f69 100644
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
@@ -3927,7 +3928,7 @@ void __flush_workqueue(struct workqueue_struct *wq)
 	struct wq_flusher this_flusher = {
 		.list = LIST_HEAD_INIT(this_flusher.list),
 		.flush_color = -1,
-		.done = COMPLETION_INITIALIZER_ONSTACK_MAP(this_flusher.done, wq->lockdep_map),
+		.done = COMPLETION_INITIALIZER_ONSTACK_MAP(this_flusher.done, (*wq->lockdep_map)),
 	};
 	int next_color;
 
@@ -4788,7 +4789,8 @@ static void wq_init_lockdep(struct workqueue_struct *wq)
 		lock_name = wq->name;
 
 	wq->lock_name = lock_name;
-	lockdep_init_map(&wq->lockdep_map, lock_name, &wq->key, 0);
+	wq->lockdep_map = &wq->__lockdep_map;
+	lockdep_init_map(wq->lockdep_map, lock_name, &wq->key, 0);
 }
 
 static void wq_unregister_lockdep(struct workqueue_struct *wq)
-- 
2.34.1

