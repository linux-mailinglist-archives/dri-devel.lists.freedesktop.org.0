Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58F9423CF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 02:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02D610E359;
	Wed, 31 Jul 2024 00:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uiuwddvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D178A10E262;
 Wed, 31 Jul 2024 00:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722385832; x=1753921832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g59QcdS841R2ElrGLaqTv8bw9mQqMYsEaa2rIjEi6K4=;
 b=UiuwddvqLQ0dbqhzVSYNPDMOy29cEMJ/sE301lRRDx21SZvuWu85kOHN
 f8pcf5/md23Hm6wilEhpZTY3vfEgQaVjK455oCWiWRYIC0x21qB+Zbuwd
 aoCjsLIeJpWNHyrbTVgw+llPHh81Da9yVaMid0uI6SqwsT2dnVYWitpK6
 2a+ZRIUY5ifBUL8ktO3yk0M4w3/KKDxa0ew7mAEKGALFw0lL8WrSxHnPy
 mJN+WdLPDrbnEZR4ZAl58sKkNNiEbi3ZcoXvB9Cy6E/AC9MCFSArVFyoL
 zhYnn9CqeX2KbN0u8H7xx+ZhvaU4mKfLet487s17oayKNuAc8/OQTcm6T A==;
X-CSE-ConnectionGUID: 23n2wYa6Q2+uSBDUPKoutA==
X-CSE-MsgGUID: d7dcyn8MRMWPwEpCk/uPZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23156078"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23156078"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:31 -0700
X-CSE-ConnectionGUID: xjpDosHyThOcHkcd7ZCarw==
X-CSE-MsgGUID: g+wMVQZpRgysvmnxiUlolQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="77781797"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 1/5] workqueue: Split alloc_workqueue into internal
 function and lockdep init
Date: Tue, 30 Jul 2024 17:31:15 -0700
Message-Id: <20240731003119.2422940-2-matthew.brost@intel.com>
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
 kernel/workqueue.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 3fbaecfc88c2..c9bdd6a23a2b 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5657,9 +5657,9 @@ static void wq_adjust_max_active(struct workqueue_struct *wq)
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
@@ -5725,12 +5725,11 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
 	INIT_LIST_HEAD(&wq->flusher_overflow);
 	INIT_LIST_HEAD(&wq->maydays);
 
-	wq_init_lockdep(wq);
 	INIT_LIST_HEAD(&wq->list);
 
 	if (flags & WQ_UNBOUND) {
 		if (alloc_node_nr_active(wq->node_nr_active) < 0)
-			goto err_unreg_lockdep;
+			goto err_free_wq;
 	}
 
 	if (alloc_and_link_pwqs(wq) < 0)
@@ -5762,9 +5761,6 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
 err_free_node_nr_active:
 	if (wq->flags & WQ_UNBOUND)
 		free_node_nr_active(wq->node_nr_active);
-err_unreg_lockdep:
-	wq_unregister_lockdep(wq);
-	wq_free_lockdep(wq);
 err_free_wq:
 	free_workqueue_attrs(wq->unbound_attrs);
 	kfree(wq);
@@ -5773,6 +5769,25 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
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

