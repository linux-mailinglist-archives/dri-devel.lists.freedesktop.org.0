Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFDB4DA827
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 03:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4A510E4FA;
	Wed, 16 Mar 2022 02:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6937910E4E3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 02:27:11 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.53 with ESMTP; 16 Mar 2022 11:27:10 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 16 Mar 2022 11:27:10 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH RFC v5 08/21] dept: Apply Dept to seqlock
Date: Wed, 16 Mar 2022 11:26:20 +0900
Message-Id: <1647397593-16747-9-git-send-email-byungchul.park@lge.com>
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

Makes Dept able to track dependencies by seqlock with adding wait
annotation on read side of seqlock.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/seqlock.h | 68 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index 37ded6b..585f45c 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -23,6 +23,31 @@
 
 #include <asm/processor.h>
 
+#ifdef CONFIG_DEPT
+#define DEPT_EVT_ALL		((1UL << DEPT_MAX_SUBCLASSES_EVT) - 1)
+#define dept_seq_wait(m, ip)	dept_wait(m, DEPT_EVT_ALL, ip, __func__, 0)
+#define dept_seq_writebegin(m, ip)				\
+do {								\
+	dept_ecxt_enter(m, 1UL, ip, __func__, "write_seqcount_end", 0);\
+	dept_ask_event(m);					\
+} while (0)
+#define dept_seq_writeend(m, ip)				\
+do {								\
+	dept_event(m, 1UL, ip, __func__);			\
+	dept_ecxt_exit(m, 1UL, ip);				\
+} while (0)
+#else
+#define dept_seq_wait(m, ip)		do { } while (0)
+#define dept_seq_writebegin(m, ip)	do { } while (0)
+#define dept_seq_writeend(m, ip)	do { } while (0)
+#endif
+
+#ifdef CONFIG_DEPT
+#define SEQ_DMAP_INIT(lockname) .dmap = { .name = #lockname }
+#else
+#define SEQ_DMAP_INIT(lockname)
+#endif
+
 /*
  * The seqlock seqcount_t interface does not prescribe a precise sequence of
  * read begin/retry/end. For readers, typically there is a call to
@@ -82,7 +107,8 @@ static inline void __seqcount_init(seqcount_t *s, const char *name,
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 
 # define SEQCOUNT_DEP_MAP_INIT(lockname)				\
-		.dep_map = { .name = #lockname }
+		.dep_map = { .name = #lockname, \
+			     SEQ_DMAP_INIT(lockname) }
 
 /**
  * seqcount_init() - runtime initializer for seqcount_t
@@ -148,7 +174,7 @@ static inline void seqcount_lockdep_reader_access(const seqcount_t *s)
  * This lock-unlock technique must be implemented for all of PREEMPT_RT
  * sleeping locks.  See Documentation/locking/locktypes.rst
  */
-#if defined(CONFIG_LOCKDEP) || defined(CONFIG_PREEMPT_RT)
+#if defined(CONFIG_LOCKDEP) || defined(CONFIG_DEPT) || defined(CONFIG_PREEMPT_RT)
 #define __SEQ_LOCK(expr)	expr
 #else
 #define __SEQ_LOCK(expr)
@@ -203,6 +229,22 @@ static inline void seqcount_lockdep_reader_access(const seqcount_t *s)
 	__SEQ_LOCK(locktype	*lock);					\
 } seqcount_##lockname##_t;						\
 									\
+static __always_inline void						\
+__seqprop_##lockname##_wait(const seqcount_##lockname##_t *s)		\
+{									\
+	__SEQ_LOCK(dept_seq_wait(&(lockmember)->dep_map.dmap, _RET_IP_));\
+}									\
+									\
+static __always_inline void						\
+__seqprop_##lockname##_writebegin(const seqcount_##lockname##_t *s)	\
+{									\
+}									\
+									\
+static __always_inline void						\
+__seqprop_##lockname##_writeend(const seqcount_##lockname##_t *s)	\
+{									\
+}									\
+									\
 static __always_inline seqcount_t *					\
 __seqprop_##lockname##_ptr(seqcount_##lockname##_t *s)			\
 {									\
@@ -271,6 +313,21 @@ static inline void __seqprop_assert(const seqcount_t *s)
 	lockdep_assert_preemption_disabled();
 }
 
+static inline void __seqprop_wait(seqcount_t *s)
+{
+	dept_seq_wait(&s->dep_map.dmap, _RET_IP_);
+}
+
+static inline void __seqprop_writebegin(seqcount_t *s)
+{
+	dept_seq_writebegin(&s->dep_map.dmap, _RET_IP_);
+}
+
+static inline void __seqprop_writeend(seqcount_t *s)
+{
+	dept_seq_writeend(&s->dep_map.dmap, _RET_IP_);
+}
+
 #define __SEQ_RT	IS_ENABLED(CONFIG_PREEMPT_RT)
 
 SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    s->lock,        raw_spin, raw_spin_lock(s->lock))
@@ -311,6 +368,9 @@ static inline void __seqprop_assert(const seqcount_t *s)
 #define seqprop_sequence(s)		__seqprop(s, sequence)
 #define seqprop_preemptible(s)		__seqprop(s, preemptible)
 #define seqprop_assert(s)		__seqprop(s, assert)
+#define seqprop_dept_wait(s)		__seqprop(s, wait)
+#define seqprop_dept_writebegin(s)	__seqprop(s, writebegin)
+#define seqprop_dept_writeend(s)	__seqprop(s, writeend)
 
 /**
  * __read_seqcount_begin() - begin a seqcount_t read section w/o barrier
@@ -360,6 +420,7 @@ static inline void __seqprop_assert(const seqcount_t *s)
 #define read_seqcount_begin(s)						\
 ({									\
 	seqcount_lockdep_reader_access(seqprop_ptr(s));			\
+	seqprop_dept_wait(s);						\
 	raw_read_seqcount_begin(s);					\
 })
 
@@ -512,6 +573,7 @@ static inline void do_raw_write_seqcount_end(seqcount_t *s)
 		preempt_disable();					\
 									\
 	do_write_seqcount_begin_nested(seqprop_ptr(s), subclass);	\
+	seqprop_dept_writebegin(s);					\
 } while (0)
 
 static inline void do_write_seqcount_begin_nested(seqcount_t *s, int subclass)
@@ -538,6 +600,7 @@ static inline void do_write_seqcount_begin_nested(seqcount_t *s, int subclass)
 		preempt_disable();					\
 									\
 	do_write_seqcount_begin(seqprop_ptr(s));			\
+	seqprop_dept_writebegin(s);					\
 } while (0)
 
 static inline void do_write_seqcount_begin(seqcount_t *s)
@@ -554,6 +617,7 @@ static inline void do_write_seqcount_begin(seqcount_t *s)
  */
 #define write_seqcount_end(s)						\
 do {									\
+	seqprop_dept_writeend(s);					\
 	do_write_seqcount_end(seqprop_ptr(s));				\
 									\
 	if (seqprop_preemptible(s))					\
-- 
1.9.1

