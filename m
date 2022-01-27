Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7D49DCCD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4151510EE1B;
	Thu, 27 Jan 2022 08:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04A3B10E72F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 01:11:20 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.53 with ESMTP; 27 Jan 2022 10:11:20 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 27 Jan 2022 10:11:20 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org, mingo@redhat.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH on v5.17-rc1 13/14] dept: Separate out SDT(Single-event
 Dependency Tracker) header
Date: Thu, 27 Jan 2022 10:11:11 +0900
Message-Id: <1643245873-15542-13-git-send-email-byungchul.park@lge.com>
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

Now that Dept has already been applied to major synchronization
machanisms e.g. spinlock, wait_for_completion and the like, we can take
advantage of Dept by default if CONFIG_DEPT is on.

However, sometimes we need to manually tag wait/event on places where
Dept hasn't been applied. SDT(Single-event Dependency Tracker) would be
useful in that case to tag those. The usage is like:

1. Initialize dmap in the instance associated to the wait/event.

	sdt_map_init(dmap);

2. Add the following just before the wait.

	sdt_wait(dmap);

3. Add the following just before the event.

	sdt_event(dmap);

For better reference of SDT APIs, separated the APIs from dept.h.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/dept.h     | 36 --------------------------------
 include/linux/dept_sdt.h | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 36 deletions(-)
 create mode 100644 include/linux/dept_sdt.h

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 5a726bf..10ef7fc 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -504,32 +504,6 @@ struct dept_map_common {
  */
 extern void dept_key_init(struct dept_key *k);
 extern void dept_key_destroy(struct dept_key *k);
-
-#define DEPT_SDT_MAP_INIT(dname)	{ .name = #dname }
-#define DEFINE_DEPT_SDT(x)		\
-	struct dept_map x = DEPT_SDT_MAP_INIT(x)
-
-/*
- * SDT(Single-event Dependency Tracker) APIs
- *
- * In case that one dept_map instance maps to a single event, SDT APIs
- * can be used.
- */
-#define sdt_map_init(m)							\
-	do {								\
-		static struct dept_key __key;				\
-		dept_map_init(m, &__key, 0, #m);			\
-	} while (0)
-#define sdt_map_init_key(m, k)		dept_map_init(m, k, 0, #m)
-
-#define sdt_wait(m)							\
-	do {								\
-		dept_asked_event(m);					\
-		dept_wait(m, 1UL, _THIS_IP_, "wait", 0);		\
-	} while (0)
-#define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
-#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, "event")
-#define sdt_ecxt_exit(m)		dept_ecxt_exit(m, _THIS_IP_)
 #else /* !CONFIG_DEPT */
 struct dept_task { };
 struct dept_key  { };
@@ -563,15 +537,5 @@ struct dept_map_common {
 #define dept_asked_event_split_map(me, mc)		do { } while (0)
 #define dept_key_init(k)				do { (void)(k); } while (0)
 #define dept_key_destroy(k)				do { (void)(k); } while (0)
-
-#define DEPT_SDT_MAP_INIT(dname)
-#define DEFINE_DEPT_SDT(x)
-
-#define sdt_map_init(m)					do { } while (0)
-#define sdt_map_init_key(m, k)				do { (void)(k); } while (0)
-#define sdt_wait(m)					do { } while (0)
-#define sdt_ecxt_enter(m)				do { } while (0)
-#define sdt_event(m)					do { } while (0)
-#define sdt_ecxt_exit(m)				do { } while (0)
 #endif
 #endif /* __LINUX_DEPT_H */
diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
new file mode 100644
index 0000000..32a4a9e
--- /dev/null
+++ b/include/linux/dept_sdt.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Dept Single-event Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_SDT_H
+#define __LINUX_DEPT_SDT_H
+
+#ifdef CONFIG_DEPT
+
+#include <linux/dept.h>
+
+#define DEPT_SDT_MAP_INIT(dname)	{ .name = #dname }
+#define DEFINE_DEPT_SDT(x)		\
+	struct dept_map x = DEPT_SDT_MAP_INIT(x)
+
+/*
+ * SDT(Single-event Dependency Tracker) APIs
+ *
+ * In case that one dept_map instance maps to a single event, SDT APIs
+ * can be used.
+ */
+#define sdt_map_init(m)							\
+	do {								\
+		static struct dept_key __key;				\
+		dept_map_init(m, &__key, 0, #m);			\
+	} while (0)
+#define sdt_map_init_key(m, k)		dept_map_init(m, k, 0, #m)
+
+#define sdt_wait(m)							\
+	do {								\
+		dept_asked_event(m);					\
+		dept_wait(m, 1UL, _THIS_IP_, "wait", 0);		\
+	} while (0)
+#define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
+#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, "event")
+#define sdt_ecxt_exit(m)		dept_ecxt_exit(m, _THIS_IP_)
+#else /* !CONFIG_DEPT */
+#define DEPT_SDT_MAP_INIT(dname)
+#define DEFINE_DEPT_SDT(x)
+
+#define sdt_map_init(m)					do { } while (0)
+#define sdt_map_init_key(m, k)				do { (void)(k); } while (0)
+#define sdt_wait(m)					do { } while (0)
+#define sdt_ecxt_enter(m)				do { } while (0)
+#define sdt_event(m)					do { } while (0)
+#define sdt_ecxt_exit(m)				do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_SDT_H */
-- 
1.9.1

