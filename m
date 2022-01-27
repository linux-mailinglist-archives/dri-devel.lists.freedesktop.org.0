Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1286449DCCC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7940E10EC9A;
	Thu, 27 Jan 2022 08:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58C6310E736
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 01:11:21 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.51 with ESMTP; 27 Jan 2022 10:11:20 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 27 Jan 2022 10:11:20 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org, mingo@redhat.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH on v5.17-rc1 14/14] dept: Apply SDT to swait
Date: Thu, 27 Jan 2022 10:11:12 +0900
Message-Id: <1643245873-15542-14-git-send-email-byungchul.park@lge.com>
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

Makes SDT able to track dependencies by swait.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/swait.h | 4 ++++
 kernel/sched/swait.c  | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 6a8c22b..dbdf2ce 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -6,6 +6,7 @@
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/dept_sdt.h>
 #include <asm/current.h>
 
 /*
@@ -43,6 +44,7 @@
 struct swait_queue_head {
 	raw_spinlock_t		lock;
 	struct list_head	task_list;
+	struct dept_map		dmap;
 };
 
 struct swait_queue {
@@ -61,6 +63,7 @@ struct swait_queue {
 #define __SWAIT_QUEUE_HEAD_INITIALIZER(name) {				\
 	.lock		= __RAW_SPIN_LOCK_UNLOCKED(name.lock),		\
 	.task_list	= LIST_HEAD_INIT((name).task_list),		\
+	.dmap		= DEPT_SDT_MAP_INIT(name),			\
 }
 
 #define DECLARE_SWAIT_QUEUE_HEAD(name)					\
@@ -72,6 +75,7 @@ extern void __init_swait_queue_head(struct swait_queue_head *q, const char *name
 #define init_swait_queue_head(q)				\
 	do {							\
 		static struct lock_class_key __key;		\
+		sdt_map_init(&(q)->dmap);			\
 		__init_swait_queue_head((q), #q, &__key);	\
 	} while (0)
 
diff --git a/kernel/sched/swait.c b/kernel/sched/swait.c
index e1c655f..b6c2efb 100644
--- a/kernel/sched/swait.c
+++ b/kernel/sched/swait.c
@@ -27,6 +27,7 @@ void swake_up_locked(struct swait_queue_head *q)
 		return;
 
 	curr = list_first_entry(&q->task_list, typeof(*curr), task_list);
+	sdt_event(&q->dmap);
 	wake_up_process(curr->task);
 	list_del_init(&curr->task_list);
 }
@@ -69,6 +70,7 @@ void swake_up_all(struct swait_queue_head *q)
 	while (!list_empty(&tmp)) {
 		curr = list_first_entry(&tmp, typeof(*curr), task_list);
 
+		sdt_event(&q->dmap);
 		wake_up_state(curr->task, TASK_NORMAL);
 		list_del_init(&curr->task_list);
 
@@ -97,6 +99,9 @@ void prepare_to_swait_exclusive(struct swait_queue_head *q, struct swait_queue *
 	__prepare_to_swait(q, wait);
 	set_current_state(state);
 	raw_spin_unlock_irqrestore(&q->lock, flags);
+
+	if (state & TASK_NORMAL)
+		sdt_wait(&q->dmap);
 }
 EXPORT_SYMBOL(prepare_to_swait_exclusive);
 
@@ -119,6 +124,9 @@ long prepare_to_swait_event(struct swait_queue_head *q, struct swait_queue *wait
 	}
 	raw_spin_unlock_irqrestore(&q->lock, flags);
 
+	if (!ret && state & TASK_NORMAL)
+		sdt_wait(&q->dmap);
+
 	return ret;
 }
 EXPORT_SYMBOL(prepare_to_swait_event);
-- 
1.9.1

