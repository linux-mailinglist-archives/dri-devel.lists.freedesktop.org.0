Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03694D8B2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 00:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C2610EA16;
	Fri,  9 Aug 2024 22:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CafiMnuC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99D410EA12;
 Fri,  9 Aug 2024 22:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723242464; x=1754778464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZTr6JyEn1nSzgdfSh1QuqS59D0zZxggT3OqlXoJsrlE=;
 b=CafiMnuCYPLO3wdzzo6bUthdpLunUCxj7AmPhr5i7vKq0h8n5z9VfVL2
 lDo/bnA0aonVQjCUn7r0eIt0ynbBxKaxrzxEcUyJLn8iCoYYeILH/3eeO
 uUl+N0mI6GfleEvZjVwcgGZdw4rJ4EG9GuR920fklkXjF2+QcBhBwIwNq
 rCZ/HF+IAdba3GGFGUlC+jPkUMAyR1iCvlHX86JU1Up1poLMQkDAl0+2g
 3hlDd1cgqUdXb9tB2W8N/Rzt0CRQ9U2T8fs0Rn4CneIIkIFxxRlKUOcaI
 DpRLJT7CUtx/wNMG/Hg0zhq0hcuQeL22TqaoCzGBMwGc6b0dc5BgM+2xt g==;
X-CSE-ConnectionGUID: ghRx4BReTHmqr55HxV6bxQ==
X-CSE-MsgGUID: gdb9ETDZQqWkYF8QcUrTQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25229644"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="25229644"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
X-CSE-ConnectionGUID: LScDgSonScyBM7vJaVgrww==
X-CSE-MsgGUID: N+9j/irpR96KLJvRSuTSWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62641782"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:27:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v3 1/5] workqueue: Split alloc_workqueue into internal
 function and lockdep init
Date: Fri,  9 Aug 2024 15:28:23 -0700
Message-Id: <20240809222827.3211998-2-matthew.brost@intel.com>
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
 kernel/workqueue.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1745ca788ede..90a98c9b0ac6 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5612,9 +5612,9 @@ static void wq_adjust_max_active(struct workqueue_struct *wq)
 }
 
 __printf(1, 4)
-struct workqueue_struct *alloc_workqueue(const char *fmt,
-					 unsigned int flags,
-					 int max_active, ...)
+static struct workqueue_struct *__alloc_workqueue(const char *fmt,
+						  unsigned int flags,
+						  int max_active, ...)
 {
 	va_list args;
 	struct workqueue_struct *wq;
@@ -5680,12 +5680,11 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
 	INIT_LIST_HEAD(&wq->flusher_overflow);
 	INIT_LIST_HEAD(&wq->maydays);
 
-	wq_init_lockdep(wq);
 	INIT_LIST_HEAD(&wq->list);
 
 	if (flags & WQ_UNBOUND) {
 		if (alloc_node_nr_active(wq->node_nr_active) < 0)
-			goto err_unreg_lockdep;
+			goto err_free_wq;
 	}
 
 	/*
@@ -5724,9 +5723,6 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
 		kthread_flush_worker(pwq_release_worker);
 		free_node_nr_active(wq->node_nr_active);
 	}
-err_unreg_lockdep:
-	wq_unregister_lockdep(wq);
-	wq_free_lockdep(wq);
 err_free_wq:
 	free_workqueue_attrs(wq->unbound_attrs);
 	kfree(wq);
@@ -5737,6 +5733,25 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
 	destroy_workqueue(wq);
 	return NULL;
 }
+
+__printf(1, 4)
+struct workqueue_struct *alloc_workqueue(const char *fmt,
+					 unsigned int flags,
+					 int max_active, ...)
+{
+	struct workqueue_struct *wq;
+	va_list args;
+
+	va_start(args, max_active);
+	wq = __alloc_workqueue(fmt, flags, max_active, args);
+	va_end(args);
+	if (!wq)
+		return NULL;
+
+	wq_init_lockdep(wq);
+
+	return wq;
+}
 EXPORT_SYMBOL_GPL(alloc_workqueue);
 
 static bool pwq_busy(struct pool_workqueue *pwq)
-- 
2.34.1

