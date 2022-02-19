Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF854BCD57
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 09:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7054010F75E;
	Sun, 20 Feb 2022 08:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C70B10E231
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 10:58:44 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.53 with ESMTP; 19 Feb 2022 19:58:43 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 19 Feb 2022 19:58:43 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH v2 12/18] dept: Introduce split map concept and new APIs for
 them
Date: Sat, 19 Feb 2022 19:58:25 +0900
Message-Id: <1645268311-24222-13-git-send-email-byungchul.park@lge.com>
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

There is a case where all maps used for a type of wait/event is so large
in size. For instance, struct page can be a type for (un)lock_page().
The additional memory size for the maps would be 'the # of pages *
sizeof(struct dept_map)' if each struct page keeps its map all the way,
which might be too big to accept in some system.

It'd better to have split map, one is for each instance and the other
is for the type which is commonly used, and new APIs using them. So
introduced split map and new APIs for them.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/dept.h     |  80 ++++++++++++++++++++++---------
 kernel/dependency/dept.c | 122 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+), 22 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index c0bbb8e..e2d4aea 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -362,6 +362,30 @@ struct dept_map {
 	bool				nocheck;
 };
 
+struct dept_map_each {
+	/*
+	 * wait timestamp associated to this map
+	 */
+	unsigned int wgen;
+};
+
+struct dept_map_common {
+	const char *name;
+	struct dept_key *keys;
+	int sub_usr;
+
+	/*
+	 * It's local copy for fast acces to the associated classes. And
+	 * Also used for dept_key instance for statically defined map.
+	 */
+	struct dept_key keys_local;
+
+	/*
+	 * whether this map should be going to be checked or not
+	 */
+	bool nocheck;
+};
+
 struct dept_task {
 	/*
 	 * all event contexts that have entered and before exiting
@@ -451,6 +475,11 @@ struct dept_task {
 extern void dept_ecxt_exit(struct dept_map *m, unsigned long ip);
 extern void dept_skip(struct dept_map *m);
 extern bool dept_unskip_if_skipped(struct dept_map *m);
+extern void dept_split_map_each_init(struct dept_map_each *me);
+extern void dept_split_map_common_init(struct dept_map_common *mc, struct dept_key *k, const char *n);
+extern void dept_wait_split_map(struct dept_map_each *me, struct dept_map_common *mc, unsigned long ip, const char *w_fn, int ne);
+extern void dept_event_split_map(struct dept_map_each *me, struct dept_map_common *mc, unsigned long ip, const char *e_fn);
+extern void dept_ask_event_split_map(struct dept_map_each *me, struct dept_map_common *mc);
 
 /*
  * for users who want to manage external keys
@@ -460,31 +489,38 @@ struct dept_task {
 #else /* !CONFIG_DEPT */
 struct dept_key  { };
 struct dept_map  { };
+struct dept_map_each    { };
+struct dept_map_commmon { };
 struct dept_task { };
 
 #define DEPT_TASK_INITIALIZER(t)
 
-#define dept_on()				do { } while (0)
-#define dept_off()				do { } while (0)
-#define dept_init()				do { } while (0)
-#define dept_task_init(t)			do { } while (0)
-#define dept_task_exit(t)			do { } while (0)
-#define dept_free_range(s, sz)			do { } while (0)
-#define dept_map_init(m, k, s, n)		do { (void)(n); (void)(k); } while (0)
-#define dept_map_reinit(m)			do { } while (0)
-#define dept_map_nocheck(m)			do { } while (0)
-
-#define dept_wait(m, w_f, ip, w_fn, ne)		do { (void)(w_fn); } while (0)
-#define dept_stage_wait(m, w_f, w_fn, ne)	do { (void)(w_fn); } while (0)
-#define dept_ask_event_wait_commit(ip)		do { } while (0)
-#define dept_clean_stage()			do { } while (0)
-#define dept_ecxt_enter(m, e_f, ip, c_fn, e_fn, ne) do { (void)(c_fn); (void)(e_fn); } while (0)
-#define dept_ask_event(m)			do { } while (0)
-#define dept_event(m, e_f, ip, e_fn)		do { (void)(e_fn); } while (0)
-#define dept_ecxt_exit(m, ip)			do { } while (0)
-#define dept_skip(m)				do { } while (0)
-#define dept_unskip_if_skipped(m)		(false)
-#define dept_key_init(k)			do { (void)(k); } while (0)
-#define dept_key_destroy(k)			do { (void)(k); } while (0)
+#define dept_on()					do { } while (0)
+#define dept_off()					do { } while (0)
+#define dept_init()					do { } while (0)
+#define dept_task_init(t)				do { } while (0)
+#define dept_task_exit(t)				do { } while (0)
+#define dept_free_range(s, sz)				do { } while (0)
+#define dept_map_init(m, k, s, n)			do { (void)(n); (void)(k); } while (0)
+#define dept_map_reinit(m)				do { } while (0)
+#define dept_map_nocheck(m)				do { } while (0)
+
+#define dept_wait(m, w_f, ip, w_fn, ne)			do { (void)(w_fn); } while (0)
+#define dept_stage_wait(m, w_f, w_fn, ne)		do { (void)(w_fn); } while (0)
+#define dept_ask_event_wait_commit(ip)			do { } while (0)
+#define dept_clean_stage()				do { } while (0)
+#define dept_ecxt_enter(m, e_f, ip, c_fn, e_fn, ne)	do { (void)(c_fn); (void)(e_fn); } while (0)
+#define dept_ask_event(m)				do { } while (0)
+#define dept_event(m, e_f, ip, e_fn)			do { (void)(e_fn); } while (0)
+#define dept_ecxt_exit(m, ip)				do { } while (0)
+#define dept_skip(m)					do { } while (0)
+#define dept_unskip_if_skipped(m)			(false)
+#define dept_split_map_each_init(me)			do { } while (0)
+#define dept_split_map_common_init(mc, k, n)		do { (void)(n); (void)(k); } while (0)
+#define dept_wait_split_map(me, mc, ip, w_fn, ne)	do { } while (0)
+#define dept_event_split_map(me, mc, ip, e_fn)		do { } while (0)
+#define dept_ask_event_split_map(me, mc)		do { } while (0)
+#define dept_key_init(k)				do { (void)(k); } while (0)
+#define dept_key_destroy(k)				do { (void)(k); } while (0)
 #endif
 #endif /* __LINUX_DEPT_H */
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 0fc200c..84409759 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -2323,6 +2323,128 @@ void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip,
 }
 EXPORT_SYMBOL_GPL(dept_event);
 
+void dept_split_map_each_init(struct dept_map_each *me)
+{
+	struct dept_task *dt = dept_task();
+	unsigned long flags;
+
+	if (READ_ONCE(dept_stop) || dt->recursive)
+		return;
+
+	flags = dept_enter();
+
+	me->wgen = 0U;
+
+	dept_exit(flags);
+}
+EXPORT_SYMBOL_GPL(dept_split_map_each_init);
+
+void dept_split_map_common_init(struct dept_map_common *mc,
+				struct dept_key *k, const char *n)
+{
+	struct dept_task *dt = dept_task();
+	unsigned long flags;
+
+	if (READ_ONCE(dept_stop) || dt->recursive)
+		return;
+
+	flags = dept_enter();
+
+	if (mc->keys != k)
+		mc->keys = k;
+	clean_classes_cache(&mc->keys_local);
+
+	/*
+	 * sub_usr is not used with split map.
+	 */
+	mc->sub_usr = 0;
+	mc->name = n;
+	mc->nocheck = false;
+
+	dept_exit(flags);
+}
+EXPORT_SYMBOL_GPL(dept_split_map_common_init);
+
+void dept_wait_split_map(struct dept_map_each *me,
+			 struct dept_map_common *mc,
+			 unsigned long ip, const char *w_fn, int ne)
+{
+	struct dept_task *dt = dept_task();
+	struct dept_class *c;
+	struct dept_key *k;
+	unsigned long flags;
+
+	if (READ_ONCE(dept_stop) || dt->recursive)
+		return;
+
+	if (mc->nocheck)
+		return;
+
+	flags = dept_enter();
+
+	k = mc->keys ?: &mc->keys_local;
+	c = check_new_class(&mc->keys_local, k, 0, mc->name);
+	if (c)
+		add_wait(c, ip, w_fn, ne);
+
+	dept_exit(flags);
+}
+EXPORT_SYMBOL_GPL(dept_wait_split_map);
+
+void dept_ask_event_split_map(struct dept_map_each *me,
+			      struct dept_map_common *mc)
+{
+	struct dept_task *dt = dept_task();
+	unsigned long flags;
+	unsigned int wg;
+
+	if (READ_ONCE(dept_stop) || dt->recursive)
+		return;
+
+	if (mc->nocheck)
+		return;
+
+	flags = dept_enter();
+
+	/*
+	 * Avoid zero wgen.
+	 */
+	wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
+	WRITE_ONCE(me->wgen, wg);
+
+	dept_exit(flags);
+}
+EXPORT_SYMBOL_GPL(dept_ask_event_split_map);
+
+void dept_event_split_map(struct dept_map_each *me,
+			  struct dept_map_common *mc,
+			  unsigned long ip, const char *e_fn)
+{
+	struct dept_task *dt = dept_task();
+	struct dept_class *c;
+	struct dept_key *k;
+	unsigned long flags;
+
+	if (READ_ONCE(dept_stop) || dt->recursive)
+		return;
+
+	if (mc->nocheck)
+		return;
+
+	flags = dept_enter();
+
+	k = mc->keys ?: &mc->keys_local;
+	c = check_new_class(&mc->keys_local, k, 0, mc->name);
+	if (c) {
+		add_ecxt((void *)me, c, 0UL, NULL, e_fn, 0);
+		do_event((void *)me, c, READ_ONCE(me->wgen), ip);
+		pop_ecxt((void *)me);
+	}
+
+	dept_exit(flags);
+}
+EXPORT_SYMBOL_GPL(dept_event_split_map);
+
 void dept_ecxt_exit(struct dept_map *m, unsigned long ip)
 {
 	struct dept_task *dt = dept_task();
-- 
1.9.1

