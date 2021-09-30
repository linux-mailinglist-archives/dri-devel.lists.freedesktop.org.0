Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E241DFE9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 19:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF8B6EC30;
	Thu, 30 Sep 2021 17:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CAD89AB6;
 Thu, 30 Sep 2021 17:17:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="247788934"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="247788934"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 10:16:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="520489464"
Received: from dboland-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.223.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 10:16:19 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Subject: [RFC 1/6] sched: Add nice value change notifier
Date: Thu, 30 Sep 2021 18:15:47 +0100
Message-Id: <20210930171552.501553-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930171552.501553-1-tvrtko.ursulin@linux.intel.com>
References: <20210930171552.501553-1-tvrtko.ursulin@linux.intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Implement a simple notifier chain via which interested parties can track
when process nice value changes. Simple because it is global so each user
would have to track which tasks it is interested in.

To use register_user_nice_notifier and unregister_user_nice_notifier
functions are provided and new nice value and pointer to task_struct
being modified passed to the callbacks.

Opens:
 * Security. Would some sort of a  per process mechanism be better and
   feasible?
 * Put it all behind kconfig to be selected by interested drivers?

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 include/linux/sched.h |  5 +++++
 kernel/sched/core.c   | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 39039ce8ac4c..45ae9eca38c6 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2309,4 +2309,9 @@ static inline void sched_core_free(struct task_struct *tsk) { }
 static inline void sched_core_fork(struct task_struct *p) { }
 #endif
 
+struct notifier_block;
+
+extern int register_user_nice_notifier(struct notifier_block *);
+extern int unregister_user_nice_notifier(struct notifier_block *);
+
 #endif
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1bba4128a3e6..26ff75d6fe00 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6864,10 +6864,42 @@ static inline int rt_effective_prio(struct task_struct *p, int prio)
 }
 #endif
 
+ATOMIC_NOTIFIER_HEAD(user_nice_notifier_list);
+
+/**
+ * register_user_nice_notifier - Register function to be called when task nice changes
+ * @nb: Info about notifier function to be called
+ *
+ * Registers a function with the list of functions to be called when task nice
+ * value changes.
+ *
+ * Currently always returns zero, as atomic_notifier_chain_register()
+ * always returns zero.
+ */
+int register_user_nice_notifier(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_register(&user_nice_notifier_list, nb);
+}
+EXPORT_SYMBOL(register_user_nice_notifier);
+
+/**
+ * unregister_user_nice_notifier - Unregister previously registered user nice notifier
+ * @nb: Hook to be unregistered
+ *
+ * Unregisters a previously registered user nice notifier function.
+ *
+ * Returns zero on success, or %-ENOENT on failure.
+ */
+int unregister_user_nice_notifier(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_unregister(&user_nice_notifier_list, nb);
+}
+EXPORT_SYMBOL(unregister_user_nice_notifier);
+
 void set_user_nice(struct task_struct *p, long nice)
 {
 	bool queued, running;
-	int old_prio;
+	int old_prio, ret;
 	struct rq_flags rf;
 	struct rq *rq;
 
@@ -6913,6 +6945,9 @@ void set_user_nice(struct task_struct *p, long nice)
 	 */
 	p->sched_class->prio_changed(rq, p, old_prio);
 
+	ret = atomic_notifier_call_chain(&user_nice_notifier_list, nice, p);
+	WARN_ON_ONCE(ret != NOTIFY_DONE);
+
 out_unlock:
 	task_rq_unlock(rq, p, &rf);
 }
-- 
2.30.2

