Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D154519A6E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F5210FAE7;
	Wed,  4 May 2022 08:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C12D10FAE7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:49:20 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.53 with ESMTP; 4 May 2022 17:19:20 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 4 May 2022 17:19:20 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH RFC v6 08/21] dept: Apply Dept to rwsem
Date: Wed,  4 May 2022 17:17:36 +0900
Message-Id: <1651652269-15342-9-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Makes Dept able to track dependencies by rwsem.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/lockdep.h      | 24 ++++++++++++++++++++----
 include/linux/percpu-rwsem.h |  4 +++-
 include/linux/rwsem.h        | 22 ++++++++++++++++++++++
 3 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index b59d8f3..b0e097f 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -634,10 +634,26 @@ static inline void print_irqtrace_events(struct task_struct *curr)
 	dept_mutex_unlock(&(l)->dmap, i);				\
 } while (0)
 
-#define rwsem_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
-#define rwsem_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
-#define rwsem_acquire_read(l, s, t, i)		lock_acquire_shared(l, s, t, NULL, i)
-#define rwsem_release(l, i)			lock_release(l, i)
+#define rwsem_acquire(l, s, t, i)					\
+do {									\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+	dept_rwsem_lock(&(l)->dmap, s, t, NULL, "up_write", i);		\
+} while (0)
+#define rwsem_acquire_nest(l, s, t, n, i)				\
+do {									\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+	dept_rwsem_lock(&(l)->dmap, s, t, (n) ? &(n)->dmap : NULL, "up_write", i);\
+} while (0)
+#define rwsem_acquire_read(l, s, t, i)					\
+do {									\
+	lock_acquire_shared(l, s, t, NULL, i);				\
+	dept_rwsem_lock(&(l)->dmap, s, t, NULL, "up_read", i);		\
+} while (0)
+#define rwsem_release(l, i)						\
+do {									\
+	lock_release(l, i);						\
+	dept_rwsem_unlock(&(l)->dmap, i);				\
+} while (0)
 
 #define lock_map_acquire(l)			lock_acquire_exclusive(l, 0, 0, NULL, _THIS_IP_)
 #define lock_map_acquire_read(l)		lock_acquire_shared_recursive(l, 0, 0, NULL, _THIS_IP_)
diff --git a/include/linux/percpu-rwsem.h b/include/linux/percpu-rwsem.h
index 5fda40f..9a0603d 100644
--- a/include/linux/percpu-rwsem.h
+++ b/include/linux/percpu-rwsem.h
@@ -21,7 +21,9 @@ struct percpu_rw_semaphore {
 };
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
-#define __PERCPU_RWSEM_DEP_MAP_INIT(lockname)	.dep_map = { .name = #lockname },
+#define __PERCPU_RWSEM_DEP_MAP_INIT(lockname)	.dep_map = {	\
+	.name = #lockname,					\
+	.dmap = DEPT_MAP_INITIALIZER(lockname) },
 #else
 #define __PERCPU_RWSEM_DEP_MAP_INIT(lockname)
 #endif
diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
index efa5c32..ed4c34e 100644
--- a/include/linux/rwsem.h
+++ b/include/linux/rwsem.h
@@ -21,6 +21,7 @@
 	.dep_map = {					\
 		.name = #lockname,			\
 		.wait_type_inner = LD_WAIT_SLEEP,	\
+		.dmap = DEPT_MAP_INITIALIZER(lockname)	\
 	},
 #else
 # define __RWSEM_DEP_MAP_INIT(lockname)
@@ -32,6 +33,27 @@
 #include <linux/osq_lock.h>
 #endif
 
+#ifdef CONFIG_DEPT
+#define dept_rwsem_lock(m, ne, t, n, e_fn, ip)				\
+do {									\
+	if (t) {							\
+		dept_ecxt_enter(m, 1UL, ip, __func__, e_fn, ne);	\
+	} else if (n) {							\
+		dept_ecxt_enter_nokeep(m);				\
+	} else {							\
+		dept_wait(m, 1UL, ip, __func__, ne);			\
+		dept_ecxt_enter(m, 1UL, ip, __func__, e_fn, ne);	\
+	}								\
+} while (0)
+#define dept_rwsem_unlock(m, ip)					\
+do {									\
+	dept_ecxt_exit(m, 1UL, ip);					\
+} while (0)
+#else
+#define dept_rwsem_lock(m, ne, t, n, e_fn, ip)	do { } while (0)
+#define dept_rwsem_unlock(m, ip)		do { } while (0)
+#endif
+
 /*
  * For an uncontended rwsem, count and owner are the only fields a task
  * needs to touch when acquiring the rwsem. So they are put next to each
-- 
1.9.1

