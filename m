Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C834CCE71
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 08:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908F210F589;
	Fri,  4 Mar 2022 07:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FCC110F57E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 07:07:09 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.53 with ESMTP; 4 Mar 2022 16:07:09 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 4 Mar 2022 16:07:09 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH v4 22/24] dept: Don't create dependencies between different
 depths in any case
Date: Fri,  4 Mar 2022 16:06:41 +0900
Message-Id: <1646377603-19730-23-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1646377603-19730-1-git-send-email-byungchul.park@lge.com>
References: <1646377603-19730-1-git-send-email-byungchul.park@lge.com>
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

Dept already prevents creating dependencies between different depths of
the class indicated by *_lock_nested() when the lock acquisitions happen
consecutively.

   lock A0 with depth
   lock_nested A1 with depth + 1
   ...
   unlock A1
   unlock A0

Dept does not create A0 -> A1 dependency in this case, either.

However, once another class cut in, the code becomes problematic. When
Dept tries to create real dependencies, it does not only create real
ones but also wrong ones between different depths of the class.

   lock A0 with depth
   lock B
   lock_nested A1 with depth + 1
   ...
   unlock A1
   unlock B
   unlock A0

Even in this case, Dept should not create A0 -> A1 dependency.

So let Dept not create wrong dependencies between different depths of
the class in any case.

Reported-by: 42.hyeyoo@gmail.com
Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 kernel/dependency/dept.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 5d4efc3..cc1b3a3 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1458,14 +1458,7 @@ static void add_wait(struct dept_class *c, unsigned long ip,
 
 		eh = dt->ecxt_held + i;
 		if (eh->ecxt->class != c || eh->nest == ne)
-			break;
-	}
-
-	for (; i >= 0; i--) {
-		struct dept_ecxt_held *eh;
-
-		eh = dt->ecxt_held + i;
-		add_dep(eh->ecxt, w);
+			add_dep(eh->ecxt, w);
 	}
 
 	if (!wait_consumed(w) && !rich_stack) {
-- 
1.9.1

