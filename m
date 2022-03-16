Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0546E4DA802
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 03:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7784510E4B2;
	Wed, 16 Mar 2022 02:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7C4E10E4F7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 02:27:11 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.53 with ESMTP; 16 Mar 2022 11:27:11 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 16 Mar 2022 11:27:11 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH RFC v5 14/21] dept: Apply SDT to wait(waitqueue)
Date: Wed, 16 Mar 2022 11:26:26 +0900
Message-Id: <1647397593-16747-15-git-send-email-byungchul.park@lge.com>
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

Makes SDT able to track dependencies by wait(waitqueue).

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/wait.h |  6 +++++-
 kernel/sched/wait.c  | 16 ++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 851e07d..2133998 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -7,6 +7,7 @@
 #include <linux/list.h>
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
+#include <linux/dept_sdt.h>
 
 #include <asm/current.h>
 #include <uapi/linux/wait.h>
@@ -37,6 +38,7 @@ struct wait_queue_entry {
 struct wait_queue_head {
 	spinlock_t		lock;
 	struct list_head	head;
+	struct dept_map		dmap;
 };
 typedef struct wait_queue_head wait_queue_head_t;
 
@@ -56,7 +58,8 @@ struct wait_queue_head {
 
 #define __WAIT_QUEUE_HEAD_INITIALIZER(name) {					\
 	.lock		= __SPIN_LOCK_UNLOCKED(name.lock),			\
-	.head		= LIST_HEAD_INIT(name.head) }
+	.head		= LIST_HEAD_INIT(name.head),				\
+	.dmap		= DEPT_SDT_MAP_INIT(name) }
 
 #define DECLARE_WAIT_QUEUE_HEAD(name) \
 	struct wait_queue_head name = __WAIT_QUEUE_HEAD_INITIALIZER(name)
@@ -67,6 +70,7 @@ struct wait_queue_head {
 	do {									\
 		static struct lock_class_key __key;				\
 										\
+		sdt_map_init(&(wq_head)->dmap);					\
 		__init_waitqueue_head((wq_head), #wq_head, &__key);		\
 	} while (0)
 
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index eca3810..fc5a16a 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -105,6 +105,7 @@ static int __wake_up_common(struct wait_queue_head *wq_head, unsigned int mode,
 		if (flags & WQ_FLAG_BOOKMARK)
 			continue;
 
+		sdt_event(&wq_head->dmap);
 		ret = curr->func(curr, mode, wake_flags, key);
 		if (ret < 0)
 			break;
@@ -268,6 +269,9 @@ void __wake_up_pollfree(struct wait_queue_head *wq_head)
 		__add_wait_queue(wq_head, wq_entry);
 	set_current_state(state);
 	spin_unlock_irqrestore(&wq_head->lock, flags);
+
+	if (state & TASK_NORMAL)
+		sdt_wait_prepare(&wq_head->dmap);
 }
 EXPORT_SYMBOL(prepare_to_wait);
 
@@ -286,6 +290,10 @@ void __wake_up_pollfree(struct wait_queue_head *wq_head)
 	}
 	set_current_state(state);
 	spin_unlock_irqrestore(&wq_head->lock, flags);
+
+	if (state & TASK_NORMAL)
+		sdt_wait_prepare(&wq_head->dmap);
+
 	return was_empty;
 }
 EXPORT_SYMBOL(prepare_to_wait_exclusive);
@@ -331,6 +339,9 @@ long prepare_to_wait_event(struct wait_queue_head *wq_head, struct wait_queue_en
 	}
 	spin_unlock_irqrestore(&wq_head->lock, flags);
 
+	if (!ret && state & TASK_NORMAL)
+		sdt_wait_prepare(&wq_head->dmap);
+
 	return ret;
 }
 EXPORT_SYMBOL(prepare_to_wait_event);
@@ -352,7 +363,9 @@ int do_wait_intr(wait_queue_head_t *wq, wait_queue_entry_t *wait)
 		return -ERESTARTSYS;
 
 	spin_unlock(&wq->lock);
+	sdt_wait_prepare(&wq->dmap);
 	schedule();
+	sdt_wait_finish();
 	spin_lock(&wq->lock);
 
 	return 0;
@@ -369,7 +382,9 @@ int do_wait_intr_irq(wait_queue_head_t *wq, wait_queue_entry_t *wait)
 		return -ERESTARTSYS;
 
 	spin_unlock_irq(&wq->lock);
+	sdt_wait_prepare(&wq->dmap);
 	schedule();
+	sdt_wait_finish();
 	spin_lock_irq(&wq->lock);
 
 	return 0;
@@ -389,6 +404,7 @@ void finish_wait(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_en
 {
 	unsigned long flags;
 
+	sdt_wait_finish();
 	__set_current_state(TASK_RUNNING);
 	/*
 	 * We can check for list emptiness outside the lock
-- 
1.9.1

