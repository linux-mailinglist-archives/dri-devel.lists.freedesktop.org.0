Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAFD4BCD5D
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 09:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE1E10F774;
	Sun, 20 Feb 2022 08:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2177B10E249
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 10:58:41 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.51 with ESMTP; 19 Feb 2022 19:58:41 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 19 Feb 2022 19:58:41 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH v2 04/18] dept: Add a API for skipping dependency check
 temporarily
Date: Sat, 19 Feb 2022 19:58:17 +0900
Message-Id: <1645268311-24222-5-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1645268311-24222-1-git-send-email-byungchul.park@lge.com>
References: <1645268311-24222-1-git-send-email-byungchul.park@lge.com>
X-Mailman-Approved-At: Sun, 20 Feb 2022 08:44:16 +0000
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
 axboe@kernel.dk, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dept would skip check for dmaps marked by dept_map_nocheck() permanently.
However, sometimes it needs to skip check for some dmaps temporarily and
back to normal, for instance, lock acquisition with a nest lock.

Lock usage check with regard to nest lock could be performed by Lockdep,
however, dependency check is not necessary for that case. So prepared
for it by adding two new APIs, dept_skip() and dept_unskip_if_skipped().

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/dept.h     |  9 +++++++++
 include/linux/dept_sdt.h |  2 +-
 include/linux/lockdep.h  |  4 +++-
 kernel/dependency/dept.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index c3fb3cf..c0bbb8e 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -352,6 +352,11 @@ struct dept_map {
 	unsigned int			wgen;
 
 	/*
+	 * for skipping dependency check temporarily
+	 */
+	atomic_t			skip_cnt;
+
+	/*
 	 * whether this map should be going to be checked or not
 	 */
 	bool				nocheck;
@@ -444,6 +449,8 @@ struct dept_task {
 extern void dept_ask_event(struct dept_map *m);
 extern void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *e_fn);
 extern void dept_ecxt_exit(struct dept_map *m, unsigned long ip);
+extern void dept_skip(struct dept_map *m);
+extern bool dept_unskip_if_skipped(struct dept_map *m);
 
 /*
  * for users who want to manage external keys
@@ -475,6 +482,8 @@ struct dept_task {
 #define dept_ask_event(m)			do { } while (0)
 #define dept_event(m, e_f, ip, e_fn)		do { (void)(e_fn); } while (0)
 #define dept_ecxt_exit(m, ip)			do { } while (0)
+#define dept_skip(m)				do { } while (0)
+#define dept_unskip_if_skipped(m)		(false)
 #define dept_key_init(k)			do { (void)(k); } while (0)
 #define dept_key_destroy(k)			do { (void)(k); } while (0)
 #endif
diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
index 375c4c3..e9d558d 100644
--- a/include/linux/dept_sdt.h
+++ b/include/linux/dept_sdt.h
@@ -13,7 +13,7 @@
 #include <linux/dept.h>
 
 #ifdef CONFIG_DEPT
-#define DEPT_SDT_MAP_INIT(dname)	{ .name = #dname }
+#define DEPT_SDT_MAP_INIT(dname)	{ .name = #dname, .skip_cnt = ATOMIC_INIT(0) }
 
 /*
  * SDT(Single-event Dependency Tracker) APIs
diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index c56f6b6..c1a56fe 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -488,7 +488,9 @@ enum xhlock_context_t {
  */
 #define STATIC_DEPT_MAP_INIT(_name, _key) .dmap = {		\
 	.name = (_name),					\
-	.keys = NULL },
+	.keys = NULL,						\
+	.skip_cnt = ATOMIC_INIT(0),				\
+	},
 #else
 #define STATIC_DEPT_MAP_INIT(_name, _key)
 #endif
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 8e0effd..69d91ca 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1943,6 +1943,7 @@ void dept_map_init(struct dept_map *m, struct dept_key *k, int sub,
 	m->name = n;
 	m->wgen = 0U;
 	m->nocheck = false;
+	atomic_set(&m->skip_cnt, 0);
 exit:
 	dept_exit(flags);
 }
@@ -1961,6 +1962,7 @@ void dept_map_reinit(struct dept_map *m)
 	clean_classes_cache(&m->keys_local);
 	m->wgen = 0U;
 	m->nocheck = false;
+	atomic_set(&m->skip_cnt, 0);
 
 	dept_exit(flags);
 }
@@ -2344,6 +2346,53 @@ void dept_ecxt_exit(struct dept_map *m, unsigned long ip)
 }
 EXPORT_SYMBOL_GPL(dept_ecxt_exit);
 
+void dept_skip(struct dept_map *m)
+{
+	struct dept_task *dt = dept_task();
+	unsigned long flags;
+
+	if (READ_ONCE(dept_stop) || dt->recursive)
+		return;
+
+	if (m->nocheck)
+		return;
+
+	flags = dept_enter();
+
+	atomic_inc(&m->skip_cnt);
+
+	dept_exit(flags);
+}
+EXPORT_SYMBOL_GPL(dept_skip);
+
+/*
+ * Return true if successfully unskip, otherwise false.
+ */
+bool dept_unskip_if_skipped(struct dept_map *m)
+{
+	struct dept_task *dt = dept_task();
+	unsigned long flags;
+	bool ret = false;
+
+	if (READ_ONCE(dept_stop) || dt->recursive)
+		return false;
+
+	if (m->nocheck)
+		return false;
+
+	flags = dept_enter();
+
+	if (!atomic_read(&m->skip_cnt))
+		goto exit;
+
+	atomic_dec(&m->skip_cnt);
+	ret = true;
+exit:
+	dept_exit(flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dept_unskip_if_skipped);
+
 void dept_task_exit(struct task_struct *t)
 {
 	struct dept_task *dt = &t->dept_task;
-- 
1.9.1

