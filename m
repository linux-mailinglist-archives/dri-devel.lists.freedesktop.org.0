Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD364DA807
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 03:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C5F10E4ED;
	Wed, 16 Mar 2022 02:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6517B10E4DC
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
Subject: [PATCH RFC v5 07/21] dept: Apply Dept to
 wait_for_completion()/complete()
Date: Wed, 16 Mar 2022 11:26:19 +0900
Message-Id: <1647397593-16747-8-git-send-email-byungchul.park@lge.com>
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

Makes Dept able to track dependencies by
wait_for_completion()/complete().

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/completion.h | 42 ++++++++++++++++++++++++++++++++++++++++--
 kernel/sched/completion.c  | 12 ++++++++++--
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/include/linux/completion.h b/include/linux/completion.h
index 51d9ab0..76b4a2d 100644
--- a/include/linux/completion.h
+++ b/include/linux/completion.h
@@ -26,14 +26,48 @@
 struct completion {
 	unsigned int done;
 	struct swait_queue_head wait;
+	struct dept_map dmap;
 };
 
+#ifdef CONFIG_DEPT
+#define dept_wfc_init(m, k, s, n)		dept_map_init(m, k, s, n)
+#define dept_wfc_reinit(m)			dept_map_reinit(m)
+#define dept_wfc_wait(m, ip)						\
+do {									\
+	dept_ask_event(m);						\
+	dept_wait(m, 1UL, ip, __func__, 0);				\
+} while (0)
+#define dept_wfc_complete(m, ip)		dept_event(m, 1UL, ip, __func__)
+#define dept_wfc_enter(m, ip)			dept_ecxt_enter(m, 1UL, ip, "completion_context_enter", "complete", 0)
+#define dept_wfc_exit(m, ip)			dept_ecxt_exit(m, 1UL, ip)
+#else
+#define dept_wfc_init(m, k, s, n)		do { (void)(n); (void)(k); } while (0)
+#define dept_wfc_reinit(m)			do { } while (0)
+#define dept_wfc_wait(m, ip)			do { } while (0)
+#define dept_wfc_complete(m, ip)		do { } while (0)
+#define dept_wfc_enter(m, ip)			do { } while (0)
+#define dept_wfc_exit(m, ip)			do { } while (0)
+#endif
+
+#ifdef CONFIG_DEPT
+#define WFC_DEPT_MAP_INIT(work) .dmap = { .name = #work }
+#else
+#define WFC_DEPT_MAP_INIT(work)
+#endif
+
+#define init_completion(x)					\
+	do {							\
+		static struct dept_key __dkey;			\
+		__init_completion(x, &__dkey, #x);		\
+	} while (0)
+
 #define init_completion_map(x, m) init_completion(x)
 static inline void complete_acquire(struct completion *x) {}
 static inline void complete_release(struct completion *x) {}
 
 #define COMPLETION_INITIALIZER(work) \
-	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait) }
+	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait), \
+	WFC_DEPT_MAP_INIT(work) }
 
 #define COMPLETION_INITIALIZER_ONSTACK_MAP(work, map) \
 	(*({ init_completion_map(&(work), &(map)); &(work); }))
@@ -81,9 +115,12 @@ static inline void complete_release(struct completion *x) {}
  * This inline function will initialize a dynamically created completion
  * structure.
  */
-static inline void init_completion(struct completion *x)
+static inline void __init_completion(struct completion *x,
+				     struct dept_key *dkey,
+				     const char *name)
 {
 	x->done = 0;
+	dept_wfc_init(&x->dmap, dkey, 0, name);
 	init_swait_queue_head(&x->wait);
 }
 
@@ -97,6 +134,7 @@ static inline void init_completion(struct completion *x)
 static inline void reinit_completion(struct completion *x)
 {
 	x->done = 0;
+	dept_wfc_reinit(&x->dmap);
 }
 
 extern void wait_for_completion(struct completion *);
diff --git a/kernel/sched/completion.c b/kernel/sched/completion.c
index a778554..6e31cc0 100644
--- a/kernel/sched/completion.c
+++ b/kernel/sched/completion.c
@@ -29,6 +29,7 @@ void complete(struct completion *x)
 {
 	unsigned long flags;
 
+	dept_wfc_complete(&x->dmap, _RET_IP_);
 	raw_spin_lock_irqsave(&x->wait.lock, flags);
 
 	if (x->done != UINT_MAX)
@@ -58,6 +59,7 @@ void complete_all(struct completion *x)
 {
 	unsigned long flags;
 
+	dept_wfc_complete(&x->dmap, _RET_IP_);
 	lockdep_assert_RT_in_threaded_ctx();
 
 	raw_spin_lock_irqsave(&x->wait.lock, flags);
@@ -112,17 +114,23 @@ void complete_all(struct completion *x)
 }
 
 static long __sched
-wait_for_common(struct completion *x, long timeout, int state)
+_wait_for_common(struct completion *x, long timeout, int state)
 {
 	return __wait_for_common(x, schedule_timeout, timeout, state);
 }
 
 static long __sched
-wait_for_common_io(struct completion *x, long timeout, int state)
+_wait_for_common_io(struct completion *x, long timeout, int state)
 {
 	return __wait_for_common(x, io_schedule_timeout, timeout, state);
 }
 
+#define wait_for_common(x, t, s)					\
+({ dept_wfc_wait(&(x)->dmap, _RET_IP_); _wait_for_common(x, t, s); })
+
+#define wait_for_common_io(x, t, s)					\
+({ dept_wfc_wait(&(x)->dmap, _RET_IP_); _wait_for_common_io(x, t, s); })
+
 /**
  * wait_for_completion: - waits for completion of a task
  * @x:  holds the state of this particular completion
-- 
1.9.1

