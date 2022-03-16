Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F34DA7EF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 03:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9633D10E4FF;
	Wed, 16 Mar 2022 02:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6703210E4E0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 02:27:11 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.52 with ESMTP; 16 Mar 2022 11:27:10 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 16 Mar 2022 11:27:10 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH RFC v5 06/21] dept: Apply Dept to rwlock
Date: Wed, 16 Mar 2022 11:26:18 +0900
Message-Id: <1647397593-16747-7-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1647397593-16747-1-git-send-email-byungchul.park@lge.com>
References: <1647397593-16747-1-git-send-email-byungchul.park@lge.com>
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

Makes Dept able to track dependencies by rwlock.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/lockdep.h        | 25 ++++++++++++++++-----
 include/linux/rwlock.h         | 50 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/rwlock_api_smp.h |  8 +++----
 include/linux/rwlock_types.h   |  7 ++++++
 4 files changed, 81 insertions(+), 9 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 42237fc..91f8783 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -599,16 +599,31 @@ static inline void print_irqtrace_events(struct task_struct *curr)
 	dept_spin_unlock(&(l)->dmap, i);				\
 } while (0)
 
-#define rwlock_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
+#define rwlock_acquire(l, s, t, i)					\
+do {									\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+	dept_rwlock_wlock(&(l)->dmap, s, t, NULL, "write_unlock", i);	\
+} while (0)
 #define rwlock_acquire_read(l, s, t, i)					\
 do {									\
-	if (read_lock_is_recursive())					\
+	if (read_lock_is_recursive()) {				\
 		lock_acquire_shared_recursive(l, s, t, NULL, i);	\
-	else								\
+		dept_rwlock_rlock(&(l)->dmap, s, t, NULL, "read_unlock", i, 0);\
+	} else {							\
 		lock_acquire_shared(l, s, t, NULL, i);			\
+		dept_rwlock_rlock(&(l)->dmap, s, t, NULL, "read_unlock", i, 1);\
+	}								\
+} while (0)
+#define rwlock_release(l, i)						\
+do {									\
+	lock_release(l, i);						\
+	dept_rwlock_wunlock(&(l)->dmap, i);				\
+} while (0)
+#define rwlock_release_read(l, i)					\
+do {									\
+	lock_release(l, i);						\
+	dept_rwlock_runlock(&(l)->dmap, i);				\
 } while (0)
-
-#define rwlock_release(l, i)			lock_release(l, i)
 
 #define seqcount_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
 #define seqcount_acquire_read(l, s, t, i)	lock_acquire_shared_recursive(l, s, t, NULL, i)
diff --git a/include/linux/rwlock.h b/include/linux/rwlock.h
index 8f416c5..cd4c6b0 100644
--- a/include/linux/rwlock.h
+++ b/include/linux/rwlock.h
@@ -28,6 +28,56 @@
 	do { *(lock) = __RW_LOCK_UNLOCKED(lock); } while (0)
 #endif
 
+#ifdef CONFIG_DEPT
+#define DEPT_EVT_RWLOCK_R		1UL
+#define DEPT_EVT_RWLOCK_W		(1UL << 1)
+#define DEPT_EVT_RWLOCK_RW		(DEPT_EVT_RWLOCK_R | DEPT_EVT_RWLOCK_W)
+
+#define dept_rwlock_wlock(m, ne, t, n, e_fn, ip)			\
+do {									\
+	if (t) {							\
+		dept_ecxt_enter(m, DEPT_EVT_RWLOCK_W, ip, __func__, e_fn, ne);\
+		dept_ask_event(m);					\
+	} else if (n) {							\
+		dept_ecxt_enter_nokeep(m);				\
+		dept_ask_event(m);					\
+	} else {							\
+		dept_wait(m, DEPT_EVT_RWLOCK_RW, ip, __func__, ne);	\
+		dept_ecxt_enter(m, DEPT_EVT_RWLOCK_W, ip, __func__, e_fn, ne);\
+		dept_ask_event(m);					\
+	}								\
+} while (0)
+#define dept_rwlock_rlock(m, ne, t, n, e_fn, ip, q)			\
+do {									\
+	if (t) {							\
+		dept_ecxt_enter(m, DEPT_EVT_RWLOCK_R, ip, __func__, e_fn, ne);\
+		dept_ask_event(m);					\
+	} else if (n) {							\
+		dept_ecxt_enter_nokeep(m);				\
+		dept_ask_event(m);					\
+	} else {							\
+		dept_wait(m, (q) ? DEPT_EVT_RWLOCK_RW : DEPT_EVT_RWLOCK_W, ip, __func__, ne);\
+		dept_ecxt_enter(m, DEPT_EVT_RWLOCK_R, ip, __func__, e_fn, ne);\
+		dept_ask_event(m);					\
+	}								\
+} while (0)
+#define dept_rwlock_wunlock(m, ip)					\
+do {									\
+	dept_event(m, DEPT_EVT_RWLOCK_W, ip, __func__);			\
+	dept_ecxt_exit(m, DEPT_EVT_RWLOCK_W, ip);			\
+} while (0)
+#define dept_rwlock_runlock(m, ip)					\
+do {									\
+	dept_event(m, DEPT_EVT_RWLOCK_R, ip, __func__);			\
+	dept_ecxt_exit(m, DEPT_EVT_RWLOCK_R, ip);			\
+} while (0)
+#else
+#define dept_rwlock_wlock(m, ne, t, n, e_fn, ip)	do { } while (0)
+#define dept_rwlock_rlock(m, ne, t, n, e_fn, ip, q)	do { } while (0)
+#define dept_rwlock_wunlock(m, ip)			do { } while (0)
+#define dept_rwlock_runlock(m, ip)			do { } while (0)
+#endif
+
 #ifdef CONFIG_DEBUG_SPINLOCK
  extern void do_raw_read_lock(rwlock_t *lock) __acquires(lock);
  extern int do_raw_read_trylock(rwlock_t *lock);
diff --git a/include/linux/rwlock_api_smp.h b/include/linux/rwlock_api_smp.h
index dceb0a5..a222cf1 100644
--- a/include/linux/rwlock_api_smp.h
+++ b/include/linux/rwlock_api_smp.h
@@ -228,7 +228,7 @@ static inline void __raw_write_unlock(rwlock_t *lock)
 
 static inline void __raw_read_unlock(rwlock_t *lock)
 {
-	rwlock_release(&lock->dep_map, _RET_IP_);
+	rwlock_release_read(&lock->dep_map, _RET_IP_);
 	do_raw_read_unlock(lock);
 	preempt_enable();
 }
@@ -236,7 +236,7 @@ static inline void __raw_read_unlock(rwlock_t *lock)
 static inline void
 __raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
 {
-	rwlock_release(&lock->dep_map, _RET_IP_);
+	rwlock_release_read(&lock->dep_map, _RET_IP_);
 	do_raw_read_unlock(lock);
 	local_irq_restore(flags);
 	preempt_enable();
@@ -244,7 +244,7 @@ static inline void __raw_read_unlock(rwlock_t *lock)
 
 static inline void __raw_read_unlock_irq(rwlock_t *lock)
 {
-	rwlock_release(&lock->dep_map, _RET_IP_);
+	rwlock_release_read(&lock->dep_map, _RET_IP_);
 	do_raw_read_unlock(lock);
 	local_irq_enable();
 	preempt_enable();
@@ -252,7 +252,7 @@ static inline void __raw_read_unlock_irq(rwlock_t *lock)
 
 static inline void __raw_read_unlock_bh(rwlock_t *lock)
 {
-	rwlock_release(&lock->dep_map, _RET_IP_);
+	rwlock_release_read(&lock->dep_map, _RET_IP_);
 	do_raw_read_unlock(lock);
 	__local_bh_enable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
 }
diff --git a/include/linux/rwlock_types.h b/include/linux/rwlock_types.h
index 1948442..6dddc5b 100644
--- a/include/linux/rwlock_types.h
+++ b/include/linux/rwlock_types.h
@@ -5,11 +5,18 @@
 # error "Do not include directly, include spinlock_types.h"
 #endif
 
+#ifdef CONFIG_DEPT
+# define RW_DMAP_INIT(lockname) .dmap = { .name = #lockname },
+#else
+# define RW_DMAP_INIT(lockname)
+#endif
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 # define RW_DEP_MAP_INIT(lockname)					\
 	.dep_map = {							\
 		.name = #lockname,					\
 		.wait_type_inner = LD_WAIT_CONFIG,			\
+		RW_DMAP_INIT(lockname)					\
 	}
 #else
 # define RW_DEP_MAP_INIT(lockname)
-- 
1.9.1

