Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCA64DA7F1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 03:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3AF10E4F6;
	Wed, 16 Mar 2022 02:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B0E410E4F5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 02:27:11 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.53 with ESMTP; 16 Mar 2022 11:27:09 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 16 Mar 2022 11:27:09 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH RFC v5 04/21] dept: Apply Dept to spinlock
Date: Wed, 16 Mar 2022 11:26:16 +0900
Message-Id: <1647397593-16747-5-git-send-email-byungchul.park@lge.com>
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

Makes Dept able to track dependencies by spinlock.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/lockdep.h            | 18 +++++++++++++++---
 include/linux/spinlock.h           | 25 +++++++++++++++++++++++++
 include/linux/spinlock_types_raw.h | 13 +++++++++++++
 3 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 2aab445..01e7427 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -583,9 +583,21 @@ static inline void print_irqtrace_events(struct task_struct *curr)
 #define lock_acquire_shared(l, s, t, n, i)		lock_acquire(l, s, t, 1, 1, n, i)
 #define lock_acquire_shared_recursive(l, s, t, n, i)	lock_acquire(l, s, t, 2, 1, n, i)
 
-#define spin_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
-#define spin_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
-#define spin_release(l, i)			lock_release(l, i)
+#define spin_acquire(l, s, t, i)					\
+do {									\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+	dept_spin_lock(&(l)->dmap, s, t, NULL, "spin_unlock", i);	\
+} while (0)
+#define spin_acquire_nest(l, s, t, n, i)				\
+do {									\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+	dept_spin_lock(&(l)->dmap, s, t, (n) ? &(n)->dmap : NULL, "spin_unlock", i); \
+} while (0)
+#define spin_release(l, i)						\
+do {									\
+	lock_release(l, i);						\
+	dept_spin_unlock(&(l)->dmap, i);				\
+} while (0)
 
 #define rwlock_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
 #define rwlock_acquire_read(l, s, t, i)					\
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 5c0c517..0e2c28d 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -95,6 +95,31 @@
 # include <linux/spinlock_up.h>
 #endif
 
+#ifdef CONFIG_DEPT
+#define dept_spin_lock(m, ne, t, n, e_fn, ip)				\
+do {									\
+	if (t) {							\
+		dept_ecxt_enter(m, 1UL, ip, __func__, e_fn, ne);	\
+		dept_ask_event(m);					\
+	} else if (n) {							\
+		dept_ecxt_enter_nokeep(m);				\
+		dept_ask_event(m);					\
+	} else {							\
+		dept_wait(m, 1UL, ip, __func__, ne);			\
+		dept_ecxt_enter(m, 1UL, ip, __func__, e_fn, ne);	\
+		dept_ask_event(m);					\
+	}								\
+} while (0)
+#define dept_spin_unlock(m, ip)						\
+do {									\
+	dept_event(m, 1UL, ip, __func__);				\
+	dept_ecxt_exit(m, 1UL, ip);					\
+} while (0)
+#else
+#define dept_spin_lock(m, ne, t, n, e_fn, ip)	do { } while (0)
+#define dept_spin_unlock(m, ip)			do { } while (0)
+#endif
+
 #ifdef CONFIG_DEBUG_SPINLOCK
   extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char *name,
 				   struct lock_class_key *key, short inner);
diff --git a/include/linux/spinlock_types_raw.h b/include/linux/spinlock_types_raw.h
index 91cb36b..5a9b25d 100644
--- a/include/linux/spinlock_types_raw.h
+++ b/include/linux/spinlock_types_raw.h
@@ -26,16 +26,28 @@
 
 #define SPINLOCK_OWNER_INIT	((void *)-1L)
 
+#ifdef CONFIG_DEPT
+# define RAW_SPIN_DMAP_INIT(lockname)	.dmap = { .name = #lockname },
+# define SPIN_DMAP_INIT(lockname)	.dmap = { .name = #lockname },
+# define LOCAL_SPIN_DMAP_INIT(lockname)	.dmap = { .name = #lockname },
+#else
+# define RAW_SPIN_DMAP_INIT(lockname)
+# define SPIN_DMAP_INIT(lockname)
+# define LOCAL_SPIN_DMAP_INIT(lockname)
+#endif
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 # define RAW_SPIN_DEP_MAP_INIT(lockname)		\
 	.dep_map = {					\
 		.name = #lockname,			\
 		.wait_type_inner = LD_WAIT_SPIN,	\
+		RAW_SPIN_DMAP_INIT(lockname)		\
 	}
 # define SPIN_DEP_MAP_INIT(lockname)			\
 	.dep_map = {					\
 		.name = #lockname,			\
 		.wait_type_inner = LD_WAIT_CONFIG,	\
+		SPIN_DMAP_INIT(lockname)		\
 	}
 
 # define LOCAL_SPIN_DEP_MAP_INIT(lockname)		\
@@ -43,6 +55,7 @@
 		.name = #lockname,			\
 		.wait_type_inner = LD_WAIT_CONFIG,	\
 		.lock_type = LD_LOCK_PERCPU,		\
+		LOCAL_SPIN_DMAP_INIT(lockname)		\
 	}
 #else
 # define RAW_SPIN_DEP_MAP_INIT(lockname)
-- 
1.9.1

