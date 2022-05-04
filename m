Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FDE519A80
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7864510FB55;
	Wed,  4 May 2022 08:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6D3310FB25
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:49:22 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.53 with ESMTP; 4 May 2022 17:19:22 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 4 May 2022 17:19:22 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH RFC v6 21/21] dept: Unstage wait when tagging a normal sleep
 wait
Date: Wed,  4 May 2022 17:17:49 +0900
Message-Id: <1651652269-15342-22-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
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
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
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

Staging a wait and commit have been introduced to handle conditional
sleeps that can be determined in __schedule() whether it actually goes
to sleep or not. With this feature, actual wait tagging is delayed
until __schedule().

Unfortunately, an ambiguity arises when a normal sleep wait that doesn't
require staging and commit, is involved in the middle of handling a
conditional sleep e.g. between prepare_to_wait_*() and __schedule(),
which is a very rare case tho.

So let it give up handling the conditional sleep by unstaging it
unconditionally when a normal sleep wait gets involved, to avoid the
ambiguity.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 kernel/dependency/dept.c | 55 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 14dc33b..ce6d5b3 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -2166,6 +2166,21 @@ static void __dept_wait(struct dept_map *m, unsigned long w_f,
 	}
 }
 
+static inline void stage_map(struct dept_task *dt, struct dept_map *m)
+{
+	dt->stage_m = m;
+}
+
+static inline void unstage_map(struct dept_task *dt)
+{
+	dt->stage_m = NULL;
+}
+
+static inline struct dept_map *staged_map(struct dept_task *dt)
+{
+	return dt->stage_m;
+}
+
 void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip,
 	       const char *w_fn, int ne, bool sleep)
 {
@@ -2183,27 +2198,24 @@ void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip,
 
 	flags = dept_enter();
 
+	/*
+	 * There's no way to distinguish between a staged wait and this
+	 * one, in the middle of handling a wait that requires staging
+	 * and commit in __schedule().
+	 *
+	 * The wait that has been tagged dept_wait() with sleep == true
+	 * should ignore the staged wait in __schedule() if it exists,
+	 * to avoid the ambiguity. It can be done by unstaging it.
+	 */
+	if (sleep)
+		unstage_map(dt);
+
 	__dept_wait(m, w_f, ip, w_fn, ne, sleep);
 
 	dept_exit(flags);
 }
 EXPORT_SYMBOL_GPL(dept_wait);
 
-static inline void stage_map(struct dept_task *dt, struct dept_map *m)
-{
-	dt->stage_m = m;
-}
-
-static inline void unstage_map(struct dept_task *dt)
-{
-	dt->stage_m = NULL;
-}
-
-static inline struct dept_map *staged_map(struct dept_task *dt)
-{
-	return dt->stage_m;
-}
-
 void dept_stage_wait(struct dept_map *m, unsigned long w_f,
 		     const char *w_fn, int ne)
 {
@@ -2565,6 +2577,19 @@ void dept_wait_split_map(struct dept_map_each *me,
 
 	flags = dept_enter();
 
+	/*
+	 * There's no way to distinguish between a staged wait and this
+	 * one, in the middle of handling a wait that requires staging
+	 * and commit in __schedule().
+	 *
+	 * The wait that has been tagged dept_wait_split_map() with
+	 * sleep == true should ignore the staged wait in __schedule()
+	 * if it exists, to avoid the ambiguity. It can be done by
+	 * unstaging it.
+	 */
+	if (sleep)
+		unstage_map(dt);
+
 	k = mc->keys ?: &mc->keys_local;
 	c = check_new_class(&mc->keys_local, k, 0, 0UL, mc->name);
 	if (c)
-- 
1.9.1

