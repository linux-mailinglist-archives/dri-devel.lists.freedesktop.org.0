Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF29FAB5203
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCBB10E566;
	Tue, 13 May 2025 10:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id F3E8D10E563
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:22 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-de-682319f29c68
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v15 34/43] dept: make dept aware of lockdep_set_lock_cmp_fn()
 annotation
Date: Tue, 13 May 2025 19:07:21 +0900
Message-Id: <20250513100730.12664-35-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRSH+7/Xbbl4WVGvGV1mF7C0jIoDNQkKer8UXSC6Qa18ayNvzTIN
 JM1VZmlm6MrrvLBsW2lbkJUrs5yaqcvMNMxSzBo5jeWm5rI2qy+Hh+fH+Z0vR4BLGsi5AmXU
 SV4VJY+QUiJC5PArDnb6BypWWRwB4BpJJSC/wkiB7a4BgfF+Mgb2ui3wzj2IYKK5FQdNtg1B
 ce8HHO5bexBYys9R8KZ/BrS7hilozL5MQUppBQWvv3kw6M7JwsBg2gofdQMENGWWYKCxU5Cn
 ScG84ysG4zo9DbqkJdBXnkuDpzcUGns6SLC8Xw43C7spqLY0EmCt6sPgzaN8CnqMv0losjYQ
 4M4IANu1dBLuDJVQ8M2tw0HnGqahrUaLgVU7GyrV3sILPyZJqE+vweBC2T0M2rseI3iS+gkD
 k7GDgueuQQzMpmwcft6qQ9CX4aDh/JVxGvKSMxBcPp9DgLp7LUyMeS8XjIRCclElAXd+daCN
 Ms5YaETc88FhnFObT3M/XW8pzuLWEtzLEpZ7mPuB5tRP3tOc1nSKM5cHcaXVdowrdrpIzqS/
 RHEmZxbNpTnaMW6opYXePm+faEM4H6GM41Urww6JFEOGARRzY1m8pyiHTEL5C9KQUMAya1jb
 7QrsP4/lXqd9TDHL2M7OcdzHs5iFrDl9gExDIgHOdExn3xV0IV8wk9nDqr/0Uz4mmCXs57ae
 qQUxs45tzukj/pYuYA2VNVNe6PW/brVMeQmzls3UGghfKcvkCVlbu/7fgj/7rLyTyERiLZqm
 RxJlVFykXBmxJkSREKWMDzkSHWlC3v/SJXr2VyGnbVctYgRI6idusC9SSEh5XGxCZC1iBbh0
 ljj5gVeJw+UJZ3hV9EHVqQg+thYFCAjpHPFq9+lwCXNMfpI/zvMxvOp/igmEc5OQyD94PbPN
 sXM07eHwkaT6On2grMxelsUr0+cnas5OGwybDJMUpD4e237ixTPh5pTmi6GykdsGR130HHrU
 s+eSvEt2oHHUtTTxyjFZVuF+/VVN/VHr4dk7v29q3VHdJo2cKLq+otQvjNi7e3IgYLFz8TnN
 oq3ZT82lr141WVf8iN/ULSViFfLQIFwVK/8DnYI+O1sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTH99zXUq1eEfUqYWIJkviCkog5mUb95hOSOeMXlZjNRq+2ESq2
 QqmbsUhVRCFVR+t4Le1WCb0gtia+UBQhorURUbAqVlTimKQIkdFGtIoF45eTX37/nP/5ciRk
 bD29QKJSHxQ0akWWnJFS0k1rCpePzk9SrrR5CAiNFVFQeVFkoKvRiUC8XEDA4O2N8CQ8hODT
 /QckWMq6ENS+fkHC5Y4+BC11RxnofjMDekIjDHjLTjFQaL/IwMNghICA+SwBTtfP8NIxQIHP
 ZCPAMshAhaWQiI63BIw76llwGJKhv66chcjrNPD2+Wlor/LS0NK7FP6qDjDgafFS0HG1n4Du
 65UM9IkTNPg67lIQLo2HrjMlNDQM2xgIhh0kOEIjLDxqtRLQYZ0LTcZo6/H/v9Bwp6SVgON/
 XyKg51kzghtFrwhwiX4G2kNDBLhdZSR8vHAbQX/pOxaOnR5noaKgFMGpY2YKjIF0+PQherlq
 LA0KapooaPjsRxvWYbFaRLh9aITERrcOfww9ZnBL2ErhezYeXyt/wWLjjV4WW1252F23BNs9
 gwSuHQ3R2FV/ksGu0bMsLn7XQ+Dhzk52c0KmdO1uIUuVJ2hWrNspVQ47B1DO+ZT8SI2ZNqDK
 hcUoRsJzq/gP5efYSWa4FP7p03FykuO4RN5dMkAXI6mE5PzT+CdVz9BkMJvbxhv/e8NMMsUl
 8/8+6ptakHGr+fvmfupb6ULe2dQ65WOi/vOFzikfy6XzJquTMiGpFf1Qj+JU6rxshSorPVW7
 T6lXq/JTd+3PdqHoBzkOR85cRWPdG9sQJ0Hy6bK7g4uUsbQiT6vPbkO8hJTHyQquRJVst0J/
 SNDs/02TmyVo21C8hJLPk2VsFXbGcnsVB4V9gpAjaL6nhCRmgQF1KytuOUI6X6YvIz5js7Qm
 1Zz8py/Y0Nusc3kyb845F7G8/2XvqGFiIt+SsMOxfkcgQbo4eOT3XwMGddI80/PtKWt0Yc8m
 XaZpg9ruH5gx84+co3pnYu6PpV58+ITtQXrvIjG47HHCrESxGakP/GNoDG7TL63dI563/2TP
 dW8pklNapSJtCanRKr4CRA6kRT0DAAA=
X-CFilter-Loop: Reflected
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

commit eb1cfd09f788e (lockdep: Add lock_set_cmp_fn() annotation) has
been added to address the issue that lockdep was not able to detect a
true deadlock like the following:

   https://lore.kernel.org/lkml/20220510232633.GA18445@X58A-UD3R/

The approach is only for lockdep but dept should work being aware of it
because the new annotation is already used to avoid false positive of
lockdep in the code.

Make dept aware of the new lockdep annotation.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h     | 10 +++++++++
 kernel/dependency/dept.c | 48 +++++++++++++++++++++++++++++++++++-----
 kernel/locking/lockdep.c |  1 +
 3 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index b1e5a1ec6763..19d72b0b0c4b 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -135,6 +135,11 @@ struct dept_map {
 	const char			*name;
 	struct dept_key			*keys;
 
+	/*
+	 * keep lockdep map to handle lockdep_set_lock_cmp_fn().
+	 */
+	void				*lockdep_map;
+
 	/*
 	 * subclass that can be set from user
 	 */
@@ -161,6 +166,7 @@ struct dept_map {
 {									\
 	.name = #n,							\
 	.keys = (struct dept_key *)(k),					\
+	.lockdep_map = NULL,						\
 	.sub_u = 0,							\
 	.map_key = { .classes = { NULL, } },				\
 	.wgen = 0U,							\
@@ -432,6 +438,8 @@ extern void dept_softirqs_on_ip(unsigned long ip);
 extern void dept_hardirqs_on(void);
 extern void dept_softirqs_off(void);
 extern void dept_hardirqs_off(void);
+
+#define dept_set_lockdep_map(m, lockdep_m) ({ (m)->lockdep_map = lockdep_m; })
 #else /* !CONFIG_DEPT */
 struct dept_key { };
 struct dept_map { };
@@ -474,5 +482,7 @@ struct dept_ext_wgen { };
 #define dept_hardirqs_on()				do { } while (0)
 #define dept_softirqs_off()				do { } while (0)
 #define dept_hardirqs_off()				do { } while (0)
+
+#define dept_set_lockdep_map(m, lockdep_m)		do { } while (0)
 #endif
 #endif /* __LINUX_DEPT_H */
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 8bea64bab379..5397167c7031 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1624,9 +1624,39 @@ static int next_wgen(void)
 	return atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
 }
 
-static void add_wait(struct dept_class *c, unsigned long ip,
-		     const char *w_fn, int sub_l, bool sched_sleep,
-		     bool timeout)
+/*
+ * XXX: This is a temporary patch needed until lockdep stops tracking
+ * dependency in wrong way.  lockdep has added an annotation to specify
+ * a callback to determin whether the given lock aquisition order is
+ * okay or not in its own way.  Even though dept is already working
+ * correctly with sub class on that issue, it needs to be aware of the
+ * annotation anyway.
+ */
+static bool lockdep_cmp_fn(struct dept_map *prev, struct dept_map *next)
+{
+	/*
+	 * Assumes the cmp_fn thing comes from struct lockdep_map.
+	 */
+	struct lockdep_map *p_lock = (struct lockdep_map *)prev->lockdep_map;
+	struct lockdep_map *n_lock = (struct lockdep_map *)next->lockdep_map;
+	struct lock_class *p_class = p_lock ? p_lock->class_cache[0] : NULL;
+	struct lock_class *n_class = n_lock ? n_lock->class_cache[0] : NULL;
+
+	if (!p_class || !n_class)
+		return false;
+
+	if (p_class != n_class)
+		return false;
+
+	if (!p_class->cmp_fn)
+		return false;
+
+	return p_class->cmp_fn(p_lock, n_lock) < 0;
+}
+
+static void add_wait(struct dept_map *m, struct dept_class *c,
+		unsigned long ip, const char *w_fn, int sub_l,
+		bool sched_sleep, bool timeout)
 {
 	struct dept_task *dt = dept_task();
 	struct dept_wait *w;
@@ -1667,8 +1697,13 @@ static void add_wait(struct dept_class *c, unsigned long ip,
 		if (!eh->ecxt)
 			continue;
 
-		if (eh->ecxt->class != c || eh->sub_l == sub_l)
-			add_dep(eh->ecxt, w);
+		if (eh->ecxt->class == c && eh->sub_l != sub_l)
+			continue;
+
+		if (i == dt->ecxt_held_pos - 1 && lockdep_cmp_fn(eh->map, m))
+			continue;
+
+		add_dep(eh->ecxt, w);
 	}
 
 	wg = next_wgen();
@@ -2154,6 +2189,7 @@ void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u,
 	m->name = n;
 	m->wgen = 0U;
 	m->nocheck = !valid_key(k);
+	m->lockdep_map = NULL;
 
 	dept_exit_recursive(flags);
 }
@@ -2377,7 +2413,7 @@ static void __dept_wait(struct dept_map *m, unsigned long w_f,
 		if (!c)
 			continue;
 
-		add_wait(c, ip, w_fn, sub_l, sched_sleep, timeout);
+		add_wait(m, c, ip, w_fn, sub_l, sched_sleep, timeout);
 	}
 }
 
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index d2805ce250cb..acab023eb015 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -5036,6 +5036,7 @@ void lockdep_set_lock_cmp_fn(struct lockdep_map *lock, lock_cmp_fn cmp_fn,
 		class->print_fn = print_fn;
 	}
 
+	dept_set_lockdep_map(&lock->dmap, lock);
 	lockdep_recursion_finish();
 	raw_local_irq_restore(flags);
 }
-- 
2.17.1

