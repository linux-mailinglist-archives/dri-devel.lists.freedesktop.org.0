Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E532BAB5225
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3456010E576;
	Tue, 13 May 2025 10:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6107410E564
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:22 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-6c-682319f0f394
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v15 27/43] locking/lockdep: prevent various lockdep assertions
 when lockdep_off()'ed
Date: Tue, 13 May 2025 19:07:14 +0900
Message-Id: <20250513100730.12664-28-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG/Z9z9j9n0+lpRR2zKBcWFWVGl1fo+iE6UFHRlyiiRju4lTdm
 mlqB5rSrwwqzMnNaLdF52yq7zUzbakVqacuFWUqNRupI20qzy2b05eXH8zzv8355GVL2RDSV
 USceEDSJing5llCSgZCyBV/DZ6kW/egNBe+34xRcrjViaK+pQmC8mU2A27oe3vj6Efx80UZC
 UWE7grLedyTctPUgsFQcxdDxMRQ6vR4M9sJTGHKu1mJ4+WWMgO7zZwmoMm2C9wYXBc8Lygko
 cmMoLsoh/OMzASOGShoMWVHQV3GJhrHeGLD3OERgeTsfLl7pxvDAYqfAdqePgI57lzH0GP+I
 4LntKQU+XQS0n8kXQfVgOYYvPgMJBq+HhldNegJs+slQp/UX5g3/FsGT/CYC8q7VE9DpvI+g
 8fgHAkxGB4YWbz8BZlMhCaM3rAj6dAM05J4eoaE4W4fgVO55CrTdS+HnD//lkm8xkF1aR0H1
 Lwdas5I3XjEivqXfQ/Ja80F+1Psa8xafnuKflXP83UvvaF7b+Jbm9aZU3lwxj7/6wE3wZUNe
 EW+qPIF509BZmj850Enwg62t9JZpOyQrlEK8Ok3QRK/aI1FZPbOTnRPSDZ58nIUMYSeRmOHY
 Jdwnx6joP7urbTjAmJ3DdXWNkAGexM7kzPkuf0bCkKwjmHtT4kQBYyKr5Oxu53iIYqO4PJ11
 vEjKLuPMvbfxv9IZXFVd03hG7Nd/3WilAixjl3IF+ioqUMqxpWJOV2gh/y2Ec48quqgCJNWj
 oEokUyemJSjU8UsWqjIS1ekL9yYlmJD/vQxHxnbeQUPt25oRyyB5iPSpO1IlEynSUjISmhHH
 kPJJ0uwGvyRVKjIyBU3Sbk1qvJDSjCIYSj5Futh3UClj4xQHhP2CkCxo/rsEI56ahTYr0ovw
 +61hNbaOmpCcksczcyfQccv/xLlmpRa7uClBLYe2Xo9WN8LG79uKLcbu8qjIpE3O6RdWnTuy
 OpKp23cscx8OdZpXNsRqS4IOmetnTxu8tWttRKz64ZhbvD08eMO6CP0tTcLkT9KWWG2rVan1
 Hr4+PFFtdw1Fz2jLJBvmyqkUlSJmHqlJUfwFNi2KRloDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0xTZxjG/c7lO6VaPSLRo8RbFZdgRIliXrPFGDXhi1HUxcS4LNEzOLMN
 F02LCMYLjEoQpSIJEhCwwlIQymAt8Q4hsFYqWkHKpVhRCEGrYI2jKIiX1mX/vPnleZ487z+P
 jA6+zi6SqZOSJU2SmKDEckYe82PmmncLV6jWXZ3cCL7xbAZK6kwYOv6qQWBqyKDAY42G3olR
 BJ8ePaahsKADwbXBZzQ02AYQNFb9gaFreDY4fV4M9oLzGDIr6jB0vpmmwH05n4Ia8y54bhxh
 oD2vnIJCD4YrhZmU/7yiYNJYzYExPQyGqoo5mB6MBPtADwutpXYWGvtXQ1GZG8O9RjsDtltD
 FHTdKcEwYPrKQrutjYEJfSh0XMplofZtOYY3E0YajD4vB0+aDRTYDPOhXudvzfr3Cwv3c5sp
 yPrzbwqcrrsImrJfUGA29WBo9Y1SYDEX0DBVaUUwpB/j4OyFSQ6uZOgRnD97mQGdOwo+ffR/
 Lh2PhIyr9QzUfu5BWzYTU5kJkdZRL010luNkyteNSeOEgSEPygVyu/gZR3RN/RwxmI8RS1U4
 qbjnoci19z6WmKvPYWJ+n8+RnDEnRd46HNyexb/If4qTEtQpkmbt5kNyldW76qhrbqrRm4vT
 kXFODgqSCfwGwVNrwwHG/A9CX98kHeAQfplgyR1hc5BcRvM9M4XeUhcKGPP4OMHucX0PMXyY
 kKW3sgFW8BsFy+AN/F/pUqGmvvl7Jsivf650MAEO5qOEPEMNk4fkBjSjGoWok1ISRXVCVIQ2
 XpWWpE6NiD2SaEb+ARlPTV+6hca7olsQL0PKWYo2z3JVMCumaNMSW5Ago5UhioybfkkRJ6ad
 kDRHDmqOJUjaFhQqY5QLFDv2S4eC+cNishQvSUclzf8uJQtalI62Rx3I7l4x/OG6bv05Yn9Y
 uPv16X9KXu9fwxX1Fm/Y1NXtnGGIWXKh01Usth2ItuqHzfFzY71nvm7bY2tKrX8w9djd/8Ln
 NLVvXfX7SOfxrSsvrs7fHV7WGT4w9tu+tp8pW9Ho3odnfnU77j9dMPtlXKhzaqxhuy/WsX7p
 ywh+58mF4kwlo1WJkeG0Rit+A3/0fZE8AwAA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

lockdep provides APIs for assertion only if lockdep is enabled at the
moment asserting to avoid unnecessary confusion, using the following
condition, debug_locks && !this_cpu_read(lockdep_recursion).

However, lockdep_{off,on}() are also used for disabling and enabling
lockdep for a simular purpose.  Add !lockdep_recursing(current) that is
updated by lockdep_{off,on}() to the condition so that the assertions
are aware of !__lockdep_enabled if lockdep_off()'ed.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/lockdep.h  |  3 ++-
 kernel/locking/lockdep.c | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index ef03d8808c10..c83fe95199db 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -303,6 +303,7 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 	lockdep_assert_once(!current->lockdep_depth)
 
 #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
+extern bool lockdep_recursing_current(void);
 
 #define lockdep_pin_lock(l)	lock_pin_lock(&(l)->dep_map)
 #define lockdep_repin_lock(l,c)	lock_repin_lock(&(l)->dep_map, (c))
@@ -630,7 +631,7 @@ DECLARE_PER_CPU(int, hardirqs_enabled);
 DECLARE_PER_CPU(int, hardirq_context);
 DECLARE_PER_CPU(unsigned int, lockdep_recursion);
 
-#define __lockdep_enabled	(debug_locks && !this_cpu_read(lockdep_recursion))
+#define __lockdep_enabled	(debug_locks && !this_cpu_read(lockdep_recursion) && !lockdep_recursing_current())
 
 #define lockdep_assert_irqs_enabled()					\
 do {									\
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 6c984a55d5ed..d2805ce250cb 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -6889,3 +6889,13 @@ void lockdep_rcu_suspicious(const char *file, const int line, const char *s)
 	warn_rcu_exit(rcu);
 }
 EXPORT_SYMBOL_GPL(lockdep_rcu_suspicious);
+
+/*
+ * For avoiding header dependency when using (struct task_struct *)current
+ * and lockdep_recursing() at the same time.
+ */
+noinstr bool lockdep_recursing_current(void)
+{
+	return lockdep_recursing(current);
+}
+EXPORT_SYMBOL_GPL(lockdep_recursing_current);
-- 
2.17.1

