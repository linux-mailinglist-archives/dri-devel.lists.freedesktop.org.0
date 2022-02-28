Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E00C14C6660
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 10:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C46910E323;
	Mon, 28 Feb 2022 09:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id D7D6E10E2A1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 09:57:21 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.53 with ESMTP; 28 Feb 2022 18:57:21 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 28 Feb 2022 18:57:21 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH v3 20/21] dept: Add nocheck version of init_completion()
Date: Mon, 28 Feb 2022 18:56:59 +0900
Message-Id: <1646042220-28952-21-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1646042220-28952-1-git-send-email-byungchul.park@lge.com>
References: <1646042220-28952-1-git-send-email-byungchul.park@lge.com>
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

For completions who don't want to get tracked by Dept, added
init_completion_nocheck() to disable Dept on it.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/completion.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/linux/completion.h b/include/linux/completion.h
index a1ad5a8..9bd3bc9 100644
--- a/include/linux/completion.h
+++ b/include/linux/completion.h
@@ -30,6 +30,7 @@ struct completion {
 };
 
 #ifdef CONFIG_DEPT
+#define dept_wfc_nocheck(m)			dept_map_nocheck(m)
 #define dept_wfc_init(m, k, s, n)		dept_map_init(m, k, s, n)
 #define dept_wfc_reinit(m)			dept_map_reinit(m)
 #define dept_wfc_wait(m, ip)						\
@@ -41,6 +42,7 @@ struct completion {
 #define dept_wfc_enter(m, ip)			dept_ecxt_enter(m, 1UL, ip, "completion_context_enter", "complete", 0)
 #define dept_wfc_exit(m, ip)			dept_ecxt_exit(m, ip)
 #else
+#define dept_wfc_nocheck(m)			do { } while (0)
 #define dept_wfc_init(m, k, s, n)		do { (void)(n); (void)(k); } while (0)
 #define dept_wfc_reinit(m)			do { } while (0)
 #define dept_wfc_wait(m, ip)			do { } while (0)
@@ -55,10 +57,11 @@ struct completion {
 #define WFC_DEPT_MAP_INIT(work)
 #endif
 
+#define init_completion_nocheck(x) __init_completion(x, NULL, #x, false)
 #define init_completion(x)					\
 	do {							\
 		static struct dept_key __dkey;			\
-		__init_completion(x, &__dkey, #x);		\
+		__init_completion(x, &__dkey, #x, true);	\
 	} while (0)
 
 #define init_completion_map(x, m) init_completion(x)
@@ -117,10 +120,15 @@ static inline void complete_release(struct completion *x) {}
  */
 static inline void __init_completion(struct completion *x,
 				     struct dept_key *dkey,
-				     const char *name)
+				     const char *name, bool check)
 {
 	x->done = 0;
-	dept_wfc_init(&x->dmap, dkey, 0, name);
+
+	if (check)
+		dept_wfc_init(&x->dmap, dkey, 0, name);
+	else
+		dept_wfc_nocheck(&x->dmap);
+
 	init_swait_queue_head(&x->wait);
 }
 
-- 
1.9.1

