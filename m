Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD64CCE70
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 08:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278F610F4A0;
	Fri,  4 Mar 2022 07:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 60AAF10F4A0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 07:07:07 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.53 with ESMTP; 4 Mar 2022 16:07:07 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 4 Mar 2022 16:07:07 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH v4 06/24] dept: Apply Dept to mutex families
Date: Fri,  4 Mar 2022 16:06:25 +0900
Message-Id: <1646377603-19730-7-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1646377603-19730-1-git-send-email-byungchul.park@lge.com>
References: <1646377603-19730-1-git-send-email-byungchul.park@lge.com>
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
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
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

Makes Dept able to track dependencies by mutex families.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/lockdep.h | 18 +++++++++++++++---
 include/linux/mutex.h   | 33 +++++++++++++++++++++++++++++++++
 include/linux/rtmutex.h |  7 +++++++
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 529ea18..6653a4f 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -615,9 +615,21 @@ static inline void print_irqtrace_events(struct task_struct *curr)
 #define seqcount_acquire_read(l, s, t, i)	lock_acquire_shared_recursive(l, s, t, NULL, i)
 #define seqcount_release(l, i)			lock_release(l, i)
 
-#define mutex_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
-#define mutex_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
-#define mutex_release(l, i)			lock_release(l, i)
+#define mutex_acquire(l, s, t, i)					\
+do {									\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+	dept_mutex_lock(&(l)->dmap, s, t, NULL, "mutex_unlock", i);	\
+} while (0)
+#define mutex_acquire_nest(l, s, t, n, i)				\
+do {									\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+	dept_mutex_lock(&(l)->dmap, s, t, (n) ? &(n)->dmap : NULL, "mutex_unlock", i);\
+} while (0)
+#define mutex_release(l, i)						\
+do {									\
+	lock_release(l, i);						\
+	dept_mutex_unlock(&(l)->dmap, i);				\
+} while (0)
 
 #define rwsem_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
 #define rwsem_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 8f226d4..204f976 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -20,11 +20,18 @@
 #include <linux/osq_lock.h>
 #include <linux/debug_locks.h>
 
+#ifdef CONFIG_DEPT
+# define DMAP_MUTEX_INIT(lockname)	.dmap = { .name = #lockname, .skip_cnt = ATOMIC_INIT(0) },
+#else
+# define DMAP_MUTEX_INIT(lockname)
+#endif
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
 		, .dep_map = {					\
 			.name = #lockname,			\
 			.wait_type_inner = LD_WAIT_SLEEP,	\
+			DMAP_MUTEX_INIT(lockname)		\
 		}
 #else
 # define __DEP_MAP_MUTEX_INITIALIZER(lockname)
@@ -75,6 +82,32 @@ struct mutex {
 #endif
 };
 
+#ifdef CONFIG_DEPT
+#define dept_mutex_lock(m, ne, t, n, e_fn, ip)				\
+do {									\
+	if (t) {							\
+		dept_ecxt_enter(m, 1UL, ip, __func__, e_fn, ne);	\
+		dept_ask_event(m);					\
+	} else if (n) {							\
+		dept_skip(m);						\
+	} else {							\
+		dept_wait(m, 1UL, ip, __func__, ne);			\
+		dept_ecxt_enter(m, 1UL, ip, __func__, e_fn, ne);	\
+		dept_ask_event(m);					\
+	}								\
+} while (0)
+#define dept_mutex_unlock(m, ip)					\
+do {									\
+	if (!dept_unskip_if_skipped(m)) {				\
+		dept_event(m, 1UL, ip, __func__);			\
+		dept_ecxt_exit(m, ip);					\
+	}								\
+} while (0)
+#else
+#define dept_mutex_lock(m, ne, t, n, e_fn, ip)	do { } while (0)
+#define dept_mutex_unlock(m, ip)		do { } while (0)
+#endif
+
 #ifdef CONFIG_DEBUG_MUTEXES
 
 #define __DEBUG_MUTEX_INITIALIZER(lockname)				\
diff --git a/include/linux/rtmutex.h b/include/linux/rtmutex.h
index 7d04988..712d6e6 100644
--- a/include/linux/rtmutex.h
+++ b/include/linux/rtmutex.h
@@ -76,11 +76,18 @@ static inline void rt_mutex_debug_task_free(struct task_struct *tsk) { }
 	__rt_mutex_init(mutex, __func__, &__key); \
 } while (0)
 
+#ifdef CONFIG_DEPT
+#define DMAP_RT_MUTEX_INIT(mutexname)	.dmap = { .name = #mutexname, .skip_cnt = ATOMIC_INIT(0) },
+#else
+#define DMAP_RT_MUTEX_INIT(mutexname)
+#endif
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 #define __DEP_MAP_RT_MUTEX_INITIALIZER(mutexname)	\
 	.dep_map = {					\
 		.name = #mutexname,			\
 		.wait_type_inner = LD_WAIT_SLEEP,	\
+		DMAP_RT_MUTEX_INIT(mutexname)		\
 	}
 #else
 #define __DEP_MAP_RT_MUTEX_INITIALIZER(mutexname)
-- 
1.9.1

