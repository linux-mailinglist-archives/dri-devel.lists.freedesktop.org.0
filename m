Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330844DA7F9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 03:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B1110E4DC;
	Wed, 16 Mar 2022 02:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6137C10E306
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 02:27:11 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.51 with ESMTP; 16 Mar 2022 11:27:09 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 16 Mar 2022 11:27:09 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH RFC v5 03/21] dept: Embed Dept data in Lockdep
Date: Wed, 16 Mar 2022 11:26:15 +0900
Message-Id: <1647397593-16747-4-git-send-email-byungchul.park@lge.com>
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

Dept should work independently from Lockdep. However, there's no choise
but to rely on Lockdep code and its instances for now.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/lockdep.h       | 72 ++++++++++++++++++++++++++++++++++++++++---
 include/linux/lockdep_types.h |  3 ++
 kernel/locking/lockdep.c      | 12 ++++----
 3 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 467b942..2aab445 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -20,6 +20,33 @@
 extern int prove_locking;
 extern int lock_stat;
 
+#ifdef CONFIG_DEPT
+static inline void dept_after_copy_map(struct dept_map *to,
+				       struct dept_map *from)
+{
+	int i;
+
+	if (from->keys == &from->keys_local)
+		to->keys = &to->keys_local;
+
+	if (!to->keys)
+		return;
+
+	/*
+	 * Since the class cache can be modified concurrently we could observe
+	 * half pointers (64bit arch using 32bit copy insns). Therefore clear
+	 * the caches and take the performance hit.
+	 *
+	 * XXX it doesn't work well with lockdep_set_class_and_subclass(), since
+	 *     that relies on cache abuse.
+	 */
+	for (i = 0; i < DEPT_MAX_SUBCLASSES_CACHE; i++)
+		to->keys->classes[i] = NULL;
+}
+#else
+#define dept_after_copy_map(t, f)	do { } while (0)
+#endif
+
 #ifdef CONFIG_LOCKDEP
 
 #include <linux/linkage.h>
@@ -43,6 +70,8 @@ static inline void lockdep_copy_map(struct lockdep_map *to,
 	 */
 	for (i = 0; i < NR_LOCKDEP_CACHING_CLASSES; i++)
 		to->class_cache[i] = NULL;
+
+	dept_after_copy_map(&to->dmap, &from->dmap);
 }
 
 /*
@@ -176,8 +205,19 @@ struct held_lock {
 	current->lockdep_recursion -= LOCKDEP_OFF;	\
 } while (0)
 
-extern void lockdep_register_key(struct lock_class_key *key);
-extern void lockdep_unregister_key(struct lock_class_key *key);
+extern void __lockdep_register_key(struct lock_class_key *key);
+extern void __lockdep_unregister_key(struct lock_class_key *key);
+
+#define lockdep_register_key(k)				\
+do {							\
+	__lockdep_register_key(k);			\
+	dept_key_init(&(k)->dkey);			\
+} while (0)
+#define lockdep_unregister_key(k)			\
+do {							\
+	__lockdep_unregister_key(k);			\
+	dept_key_destroy(&(k)->dkey);			\
+} while (0)
 
 /*
  * These methods are used by specific locking variants (spinlocks,
@@ -185,9 +225,18 @@ struct held_lock {
  * to lockdep:
  */
 
-extern void lockdep_init_map_type(struct lockdep_map *lock, const char *name,
+extern void __lockdep_init_map_type(struct lockdep_map *lock, const char *name,
 	struct lock_class_key *key, int subclass, u8 inner, u8 outer, u8 lock_type);
 
+#define lockdep_init_map_type(l, n, k, s, i, o, t)		\
+do {								\
+	__lockdep_init_map_type(l, n, k, s, i, o, t);		\
+	if ((k) == &__lockdep_no_validate__)			\
+		dept_map_nocheck(&(l)->dmap);			\
+	else							\
+		dept_map_init(&(l)->dmap, &(k)->dkey, s, n);	\
+} while (0)
+
 static inline void
 lockdep_init_map_waits(struct lockdep_map *lock, const char *name,
 		       struct lock_class_key *key, int subclass, u8 inner, u8 outer)
@@ -431,13 +480,28 @@ enum xhlock_context_t {
 	XHLOCK_CTX_NR,
 };
 
+#ifdef CONFIG_DEPT
+/*
+ * TODO: I found the case to use an address of other than a real key as
+ * _key, for instance, in workqueue. So for now, we cannot use the
+ * assignment like '.dmap.keys = &(_key)->dkey' unless it's fixed.
+ */
+#define STATIC_DEPT_MAP_INIT(_name, _key) .dmap = {		\
+	.name = (_name),					\
+	.keys = NULL,						\
+	},
+#else
+#define STATIC_DEPT_MAP_INIT(_name, _key)
+#endif
+
 #define lockdep_init_map_crosslock(m, n, k, s) do {} while (0)
 /*
  * To initialize a lockdep_map statically use this macro.
  * Note that _name must not be NULL.
  */
 #define STATIC_LOCKDEP_MAP_INIT(_name, _key) \
-	{ .name = (_name), .key = (void *)(_key), }
+	{ .name = (_name), .key = (void *)(_key), \
+	STATIC_DEPT_MAP_INIT(_name, _key) }
 
 static inline void lockdep_invariant_state(bool force) {}
 static inline void lockdep_free_task(struct task_struct *task) {}
diff --git a/include/linux/lockdep_types.h b/include/linux/lockdep_types.h
index d224308..50c8879 100644
--- a/include/linux/lockdep_types.h
+++ b/include/linux/lockdep_types.h
@@ -11,6 +11,7 @@
 #define __LINUX_LOCKDEP_TYPES_H
 
 #include <linux/types.h>
+#include <linux/dept.h>
 
 #define MAX_LOCKDEP_SUBCLASSES		8UL
 
@@ -76,6 +77,7 @@ struct lock_class_key {
 		struct hlist_node		hash_entry;
 		struct lockdep_subclass_key	subkeys[MAX_LOCKDEP_SUBCLASSES];
 	};
+	struct dept_key				dkey;
 };
 
 extern struct lock_class_key __lockdep_no_validate__;
@@ -185,6 +187,7 @@ struct lockdep_map {
 	int				cpu;
 	unsigned long			ip;
 #endif
+	struct dept_map			dmap;
 };
 
 struct pin_cookie { unsigned int val; };
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index f8a0212..e324d61 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -1184,7 +1184,7 @@ static inline struct hlist_head *keyhashentry(const struct lock_class_key *key)
 }
 
 /* Register a dynamically allocated key. */
-void lockdep_register_key(struct lock_class_key *key)
+void __lockdep_register_key(struct lock_class_key *key)
 {
 	struct hlist_head *hash_head;
 	struct lock_class_key *k;
@@ -1207,7 +1207,7 @@ void lockdep_register_key(struct lock_class_key *key)
 restore_irqs:
 	raw_local_irq_restore(flags);
 }
-EXPORT_SYMBOL_GPL(lockdep_register_key);
+EXPORT_SYMBOL_GPL(__lockdep_register_key);
 
 /* Check whether a key has been registered as a dynamic key. */
 static bool is_dynamic_key(const struct lock_class_key *key)
@@ -4771,7 +4771,7 @@ static inline int check_wait_context(struct task_struct *curr,
 /*
  * Initialize a lock instance's lock-class mapping info:
  */
-void lockdep_init_map_type(struct lockdep_map *lock, const char *name,
+void __lockdep_init_map_type(struct lockdep_map *lock, const char *name,
 			    struct lock_class_key *key, int subclass,
 			    u8 inner, u8 outer, u8 lock_type)
 {
@@ -4831,7 +4831,7 @@ void lockdep_init_map_type(struct lockdep_map *lock, const char *name,
 		raw_local_irq_restore(flags);
 	}
 }
-EXPORT_SYMBOL_GPL(lockdep_init_map_type);
+EXPORT_SYMBOL_GPL(__lockdep_init_map_type);
 
 struct lock_class_key __lockdep_no_validate__;
 EXPORT_SYMBOL_GPL(__lockdep_no_validate__);
@@ -6291,7 +6291,7 @@ void lockdep_reset_lock(struct lockdep_map *lock)
 }
 
 /* Unregister a dynamically allocated key. */
-void lockdep_unregister_key(struct lock_class_key *key)
+void __lockdep_unregister_key(struct lock_class_key *key)
 {
 	struct hlist_head *hash_head = keyhashentry(key);
 	struct lock_class_key *k;
@@ -6326,7 +6326,7 @@ void lockdep_unregister_key(struct lock_class_key *key)
 	/* Wait until is_dynamic_key() has finished accessing k->hash_entry. */
 	synchronize_rcu();
 }
-EXPORT_SYMBOL_GPL(lockdep_unregister_key);
+EXPORT_SYMBOL_GPL(__lockdep_unregister_key);
 
 void __init lockdep_init(void)
 {
-- 
1.9.1

