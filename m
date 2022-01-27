Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE5149DCC5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A5610EA25;
	Thu, 27 Jan 2022 08:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D08710E4CD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 01:11:19 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.53 with ESMTP; 27 Jan 2022 10:11:18 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 27 Jan 2022 10:11:18 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org, mingo@redhat.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH on v5.17-rc1 08/14] dept: Apply Dept to seqlock
Date: Thu, 27 Jan 2022 10:11:06 +0900
Message-Id: <1643245873-15542-8-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1643245873-15542-1-git-send-email-byungchul.park@lge.com>
References: <1643245733-14513-1-git-send-email-byungchul.park@lge.com>
 <1643245873-15542-1-git-send-email-byungchul.park@lge.com>
X-Mailman-Approved-At: Thu, 27 Jan 2022 08:44:34 +0000
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
 bfields@fieldses.org, kernel-team@lge.com, joel@joelfernandes.org,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 paolo.valente@linaro.org, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, ngupta@vflare.org,
 johannes.berg@intel.com, dan.j.williams@intel.com, josef@toxicpanda.com,
 rostedt@goodmis.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, axboe@kernel.dk,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, linux-mm@kvack.org, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Makes Dept able to track dependencies by seqlock with adding wait
annotation on read side of seqlock.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/seqlock.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index 37ded6b..35929c9 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -23,6 +23,13 @@
 
 #include <asm/processor.h>
 
+#ifdef CONFIG_DEPT
+#define DEPT_EVT_ALL		((1UL << DEPT_MAX_SUBCLASSES_EVT) - 1)
+#define dept_seq_wait(m, ip)	dept_wait(m, DEPT_EVT_ALL, ip, __func__, 0)
+#else
+#define dept_seq_wait(m, ip)	do { } while (0)
+#endif
+
 /*
  * The seqlock seqcount_t interface does not prescribe a precise sequence of
  * read begin/retry/end. For readers, typically there is a call to
@@ -148,7 +155,7 @@ static inline void seqcount_lockdep_reader_access(const seqcount_t *s)
  * This lock-unlock technique must be implemented for all of PREEMPT_RT
  * sleeping locks.  See Documentation/locking/locktypes.rst
  */
-#if defined(CONFIG_LOCKDEP) || defined(CONFIG_PREEMPT_RT)
+#if defined(CONFIG_LOCKDEP) || defined(CONFIG_DEPT) || defined(CONFIG_PREEMPT_RT)
 #define __SEQ_LOCK(expr)	expr
 #else
 #define __SEQ_LOCK(expr)
@@ -203,6 +210,12 @@ static inline void seqcount_lockdep_reader_access(const seqcount_t *s)
 	__SEQ_LOCK(locktype	*lock);					\
 } seqcount_##lockname##_t;						\
 									\
+static __always_inline void						\
+__seqprop_##lockname##_wait(const seqcount_##lockname##_t *s)		\
+{									\
+	__SEQ_LOCK(dept_seq_wait(&(lockmember)->dep_map.dmap, _RET_IP_));\
+}									\
+									\
 static __always_inline seqcount_t *					\
 __seqprop_##lockname##_ptr(seqcount_##lockname##_t *s)			\
 {									\
@@ -271,6 +284,8 @@ static inline void __seqprop_assert(const seqcount_t *s)
 	lockdep_assert_preemption_disabled();
 }
 
+static inline void __seqprop_wait(const seqcount_t *s) { }
+
 #define __SEQ_RT	IS_ENABLED(CONFIG_PREEMPT_RT)
 
 SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    s->lock,        raw_spin, raw_spin_lock(s->lock))
@@ -311,6 +326,7 @@ static inline void __seqprop_assert(const seqcount_t *s)
 #define seqprop_sequence(s)		__seqprop(s, sequence)
 #define seqprop_preemptible(s)		__seqprop(s, preemptible)
 #define seqprop_assert(s)		__seqprop(s, assert)
+#define seqprop_dept_wait(s)		__seqprop(s, wait)
 
 /**
  * __read_seqcount_begin() - begin a seqcount_t read section w/o barrier
@@ -360,6 +376,7 @@ static inline void __seqprop_assert(const seqcount_t *s)
 #define read_seqcount_begin(s)						\
 ({									\
 	seqcount_lockdep_reader_access(seqprop_ptr(s));			\
+	seqprop_dept_wait(s);						\
 	raw_read_seqcount_begin(s);					\
 })
 
-- 
1.9.1

