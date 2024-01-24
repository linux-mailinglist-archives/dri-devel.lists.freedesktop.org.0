Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9ED83A967
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B95910F738;
	Wed, 24 Jan 2024 12:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4919A10F734
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:11 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-a6-65b0fbb7d9da
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 23/26] dept: Make Dept able to work with an external wgen
Date: Wed, 24 Jan 2024 20:59:34 +0900
Message-Id: <20240124115938.80132-24-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRTHe573NlfLl3V7MqJYiGCkJhmHCJOieguMoA9FGTXyRYe62bwH
 gaV20UwT1rpITI21pqltoyybTUdeKmvlLBMVNamkmWVNtFmmVl8OP/7n/H+fjoSS1zMBEpU6
 VdSqlYkKVkpLRxaUrbvvqxXDSj5shksXwsD74xwNpTVVLLiqKxFU2U5hGH6yE96OexD42l9S
 oNe5EJQN9FJga+5DYDedZqFjaCG4vaMstOkKWMipqGHh1ecpDD2XSzBUWqLhWXE5BsfkRxr0
 wyxc1+fgmfEJw6TRzIExOxAGTdc4mBpYD219bxiwd6+Fqzd6WHhkb6OhuW4QQ8fDUhb6qqYZ
 eNbcSoPrUiEDd76Us/B53EiB0TvKwWuHAUNt7ozozPffDLQUOjCcuXkXg/tdPYKGc/0YLFVv
 WHB6PRisFh0FP289QTB4cYSDvAuTHFw/dRFBQd5lGl7+amEgtycCfBOlbNQmwekZpYRca4Zg
 HzfQwtNyIjy41ssJuQ3dnGCwpAlWU7BQ8WgYC2VjXkawmM+zgmWshBPyR9xY+PLiBSe0XvHR
 wpBbj/euOCjdHCsmqtJFbWjkUWm87VMnlZy/JdNWfJvKRp7wfOQnIfwGMtI6wf5nd8XbOWb5
 INLVNUnN8mJ+NbEWfmDykVRC8WfnE9PX9rmjRXw0sXY+RrNM84GkNKdyriDjN5K6e9X/pKtI
 Za1jLvebye9c7aZnWc5HkH5zETcrJXyOH+mcqGf+FpaTRlMXXYxkBjTPjOQqdXqSUpW4ISQ+
 S63KDDmmSbKgmZcynpw6VIfGXPuaEC9BigWyKHONKGeU6SlZSU2ISCjFYlnX8mpRLotVZp0Q
 tZoj2rREMaUJrZDQimWy8PGMWDkfp0wVE0QxWdT+32KJX0A2mne6oP0wCVa6ArO0g4HTmrrt
 xq21/RkhPvy+R91aFB0eE9WY+c23csku+3TM3qP3B55r9uh0OxLMRfzA7tD9+7c6DqQ6ncdG
 TftiP0oNcYvOE3/9keQk5/GHQ4reVZqigKiDfXv8rwTnpccFmXsjb/uvMaxb2r67wxNpu9u5
 bYwo6JR45fpgSpui/ANk+Ha5TgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5+7q9VhCZ1KqFYiGJVWyxeMkvrgITAkiC4EOfKQKzdlM9NA
 sNS11Jkz1C4rvLF02rRtlOYlm+U1L+WyJU7LpJQ0w5xk2kWNvjz8eJ73fT49DC65S65jFKo4
 Qa2SR0spESE6HJyy7fFclRAwbdgChswA8EzrCDBWVlDQYylHUGG/jMHYi1B4OzOOYK6zG4f8
 3B4EhR/cONibBxHUl16hoHdkJTg9kxS05WZQkFJcScGrL/MYDOTlYFBuDYOO7CIMGmc/E5A/
 RsGd/BRsQUYxmDWZaTAl+8Jw6W0a5j8EQttgHwlNd9tIqO/fCrfuDVBQV99GQHP1MAa9T4wU
 DFb8IaGjuZWAHoOehAdfiyj4MmPCweSZpOF1YwEGVakLbdrvv0lo0TdioC15iIHzXS2CBt17
 DKwVfRQ0ecYxsFlzcfh5/wWC4awJGtIyZ2m4czkLQUZaHgHdv1pISB2QwdwPIxUSzDeNT+J8
 qu0iXz9TQPDtRRxfc9tN86kN/TRfYL3A20r9+eK6MYwvnPKQvNV8jeKtUzk0nz7hxPivXV00
 33pzjuBHnPlYuM9J0d5IIVoRL6h37IsQRdlH3+Cx6fsT7NlleDIa35mOvBiO3c05i99Si0yx
 fpzLNYsvsje7kbPpP5HpSMTg7NXlXOm3zqWj1WwYZ3vzFC0ywfpyxpTypQcxu4erfmSh/pVu
 4MqrGpd8rwX/wa1+YpElrIx7b75OZyNRAVpmRt4KVbxSroiWbdecj0pUKRK2n4lRWtHCaExJ
 84ZqNN0b6kAsg6QrxCHmSkFCyuM1iUoH4hhc6i12rbUIEnGkPPGSoI45rb4QLWgcaD1DSNeI
 Dx0TIiTsWXmccF4QYgX1/xRjvNYlo1NhSqnFflW2NjyvpmRT0EHtK+U5iaU29PsRvGSgy91t
 aWD89h9sv3gkyOD2PeqIK/70s2zXgSHXy5hVkqP6ZzVBKGQiq2My0aXXuZJy7OpCFxf/o0au
 VWU0bdZ2tu416q4cKjpwQ5bl2Bl+fPRjhPvbUP+JLrpveHOLz3PdpjIpoYmSB/rjao38L2WF
 VicwAwAA
X-CFilter-Loop: Reflected
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 her0gyugyu@gmail.com, kernel_team@skhynix.com,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 gwan-gyeong.mun@intel.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 longman@redhat.com, tglx@linutronix.de, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 penberg@kernel.org, minchan@kernel.org, max.byungchul.park@gmail.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a case where total maps for its wait/event is so large in size.
For instance, struct page for PG_locked and PG_writeback is the case.
The additional memory size for the maps would be 'the # of pages *
sizeof(struct dept_map)' if each struct page keeps its map all the way,
which might be too big to accept.

It'd be better to keep the minimum data in the case, which is timestamp
called 'wgen' that Dept makes use of. So made Dept able to work with an
external wgen when needed.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h     | 18 ++++++++++++++----
 include/linux/dept_sdt.h |  4 ++--
 kernel/dependency/dept.c | 30 +++++++++++++++++++++---------
 3 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 0280e45cc2af..dea53ad5b356 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -482,6 +482,13 @@ struct dept_task {
 	bool				in_sched;
 };
 
+/*
+ * for subsystems that requires compact use of memory e.g. struct page
+ */
+struct dept_ext_wgen{
+	unsigned int wgen;
+};
+
 #define DEPT_TASK_INITIALIZER(t)				\
 {								\
 	.wait_hist = { { .wait = NULL, } },			\
@@ -512,6 +519,7 @@ extern void dept_task_exit(struct task_struct *t);
 extern void dept_free_range(void *start, unsigned int sz);
 extern void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u, const char *n);
 extern void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u, const char *n);
+extern void dept_ext_wgen_init(struct dept_ext_wgen *ewg);
 extern void dept_map_copy(struct dept_map *to, struct dept_map *from);
 
 extern void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip, const char *w_fn, int sub_l, long timeout);
@@ -521,8 +529,8 @@ extern void dept_clean_stage(void);
 extern void dept_stage_event(struct task_struct *t, unsigned long ip);
 extern void dept_ecxt_enter(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *c_fn, const char *e_fn, int sub_l);
 extern bool dept_ecxt_holding(struct dept_map *m, unsigned long e_f);
-extern void dept_request_event(struct dept_map *m);
-extern void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *e_fn);
+extern void dept_request_event(struct dept_map *m, struct dept_ext_wgen *ewg);
+extern void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *e_fn, struct dept_ext_wgen *ewg);
 extern void dept_ecxt_exit(struct dept_map *m, unsigned long e_f, unsigned long ip);
 extern void dept_sched_enter(void);
 extern void dept_sched_exit(void);
@@ -551,6 +559,7 @@ extern void dept_hardirqs_off(void);
 struct dept_key  { };
 struct dept_map  { };
 struct dept_task { };
+struct dept_ext_wgen { };
 
 #define DEPT_MAP_INITIALIZER(n, k) { }
 #define DEPT_TASK_INITIALIZER(t)   { }
@@ -563,6 +572,7 @@ struct dept_task { };
 #define dept_free_range(s, sz)				do { } while (0)
 #define dept_map_init(m, k, su, n)			do { (void)(n); (void)(k); } while (0)
 #define dept_map_reinit(m, k, su, n)			do { (void)(n); (void)(k); } while (0)
+#define dept_ext_wgen_init(wg)				do { } while (0)
 #define dept_map_copy(t, f)				do { } while (0)
 
 #define dept_wait(m, w_f, ip, w_fn, sl, t)		do { (void)(w_fn); } while (0)
@@ -572,8 +582,8 @@ struct dept_task { };
 #define dept_stage_event(t, ip)				do { } while (0)
 #define dept_ecxt_enter(m, e_f, ip, c_fn, e_fn, sl)	do { (void)(c_fn); (void)(e_fn); } while (0)
 #define dept_ecxt_holding(m, e_f)			false
-#define dept_request_event(m)				do { } while (0)
-#define dept_event(m, e_f, ip, e_fn)			do { (void)(e_fn); } while (0)
+#define dept_request_event(m, wg)			do { } while (0)
+#define dept_event(m, e_f, ip, e_fn, wg)		do { (void)(e_fn); } while (0)
 #define dept_ecxt_exit(m, e_f, ip)			do { } while (0)
 #define dept_sched_enter()				do { } while (0)
 #define dept_sched_exit()				do { } while (0)
diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
index 21fce525f031..8cdac7982036 100644
--- a/include/linux/dept_sdt.h
+++ b/include/linux/dept_sdt.h
@@ -24,7 +24,7 @@
 
 #define sdt_wait_timeout(m, t)						\
 	do {								\
-		dept_request_event(m);					\
+		dept_request_event(m, NULL);				\
 		dept_wait(m, 1UL, _THIS_IP_, __func__, 0, t);		\
 	} while (0)
 #define sdt_wait(m) sdt_wait_timeout(m, -1L)
@@ -49,7 +49,7 @@
 #define sdt_might_sleep_end()		dept_clean_stage()
 
 #define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
-#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__)
+#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__, NULL)
 #define sdt_ecxt_exit(m)		dept_ecxt_exit(m, 1UL, _THIS_IP_)
 #else /* !CONFIG_DEPT */
 #define sdt_map_init(m)			do { } while (0)
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 5c996f11abd5..fb33c3758c25 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -2186,6 +2186,11 @@ void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u,
 }
 EXPORT_SYMBOL_GPL(dept_map_reinit);
 
+void dept_ext_wgen_init(struct dept_ext_wgen *ewg)
+{
+	ewg->wgen = 0U;
+}
+
 void dept_map_copy(struct dept_map *to, struct dept_map *from)
 {
 	if (unlikely(!dept_working())) {
@@ -2371,7 +2376,7 @@ static void __dept_wait(struct dept_map *m, unsigned long w_f,
  */
 static void __dept_event(struct dept_map *m, unsigned long e_f,
 			 unsigned long ip, const char *e_fn,
-			 bool sched_map)
+			 bool sched_map, unsigned int wg)
 {
 	struct dept_class *c;
 	struct dept_key *k;
@@ -2393,7 +2398,7 @@ static void __dept_event(struct dept_map *m, unsigned long e_f,
 	c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, sched_map);
 
 	if (c && add_ecxt(m, c, 0UL, NULL, e_fn, 0)) {
-		do_event(m, c, READ_ONCE(m->wgen), ip);
+		do_event(m, c, wg, ip);
 		pop_ecxt(m, c);
 	}
 }
@@ -2606,7 +2611,7 @@ void dept_stage_event(struct task_struct *requestor, unsigned long ip)
 	if (!m.keys)
 		goto exit;
 
-	__dept_event(&m, 1UL, ip, "try_to_wake_up", sched_map);
+	__dept_event(&m, 1UL, ip, "try_to_wake_up", sched_map, m.wgen);
 exit:
 	dept_exit(flags);
 }
@@ -2785,10 +2790,11 @@ bool dept_ecxt_holding(struct dept_map *m, unsigned long e_f)
 }
 EXPORT_SYMBOL_GPL(dept_ecxt_holding);
 
-void dept_request_event(struct dept_map *m)
+void dept_request_event(struct dept_map *m, struct dept_ext_wgen *ewg)
 {
 	unsigned long flags;
 	unsigned int wg;
+	unsigned int *wg_p;
 
 	if (unlikely(!dept_working()))
 		return;
@@ -2801,21 +2807,25 @@ void dept_request_event(struct dept_map *m)
 	 */
 	flags = dept_enter_recursive();
 
+	wg_p = ewg ? &ewg->wgen : &m->wgen;
+
 	/*
 	 * Avoid zero wgen.
 	 */
 	wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
-	WRITE_ONCE(m->wgen, wg);
+	WRITE_ONCE(*wg_p, wg);
 
 	dept_exit_recursive(flags);
 }
 EXPORT_SYMBOL_GPL(dept_request_event);
 
 void dept_event(struct dept_map *m, unsigned long e_f,
-		unsigned long ip, const char *e_fn)
+		unsigned long ip, const char *e_fn,
+		struct dept_ext_wgen *ewg)
 {
 	struct dept_task *dt = dept_task();
 	unsigned long flags;
+	unsigned int *wg_p;
 
 	if (unlikely(!dept_working()))
 		return;
@@ -2823,24 +2833,26 @@ void dept_event(struct dept_map *m, unsigned long e_f,
 	if (m->nocheck)
 		return;
 
+	wg_p = ewg ? &ewg->wgen : &m->wgen;
+
 	if (dt->recursive) {
 		/*
 		 * Dept won't work with this even though an event
 		 * context has been asked. Don't make it confused at
 		 * handling the event. Disable it until the next.
 		 */
-		WRITE_ONCE(m->wgen, 0U);
+		WRITE_ONCE(*wg_p, 0U);
 		return;
 	}
 
 	flags = dept_enter();
 
-	__dept_event(m, e_f, ip, e_fn, false);
+	__dept_event(m, e_f, ip, e_fn, false, READ_ONCE(*wg_p));
 
 	/*
 	 * Keep the map diabled until the next sleep.
 	 */
-	WRITE_ONCE(m->wgen, 0U);
+	WRITE_ONCE(*wg_p, 0U);
 
 	dept_exit(flags);
 }
-- 
2.17.1

