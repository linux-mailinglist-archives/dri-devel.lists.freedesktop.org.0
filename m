Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7724A4CCE77
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 08:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77D610F58C;
	Fri,  4 Mar 2022 07:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id 51A6210F2BD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 07:07:10 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.51 with ESMTP; 4 Mar 2022 16:07:09 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 4 Mar 2022 16:07:09 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH v4 24/24] dept: Disable Dept on that map once it's been
 handled until next turn
Date: Fri,  4 Mar 2022 16:06:43 +0900
Message-Id: <1646377603-19730-25-git-send-email-byungchul.park@lge.com>
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

Dept works with waits preceeding an event, that might lead a deadlock.
Once the event has been handled, it's hard to ensure further waits
actually contibute to deadlock until next turn, which will start when
a sleep associated with that map happens.

So let Dept start tracking dependency when a sleep happens and stop
tracking dependency once the event e.i. wake up, has been handled.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 kernel/dependency/dept.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index cc1b3a3..1c91db8 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -2325,6 +2325,12 @@ void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip,
 		do_event((void *)m, c, READ_ONCE(m->wgen), ip);
 		pop_ecxt((void *)m);
 	}
+
+	/*
+	 * Keep the map diabled until the next sleep.
+	 */
+	WRITE_ONCE(m->wgen, 0);
+
 	dept_exit(flags);
 }
 EXPORT_SYMBOL_GPL(dept_event);
@@ -2447,6 +2453,11 @@ void dept_event_split_map(struct dept_map_each *me,
 		pop_ecxt((void *)me);
 	}
 
+	/*
+	 * Keep the map diabled until the next sleep.
+	 */
+	WRITE_ONCE(me->wgen, 0);
+
 	dept_exit(flags);
 }
 EXPORT_SYMBOL_GPL(dept_event_split_map);
-- 
1.9.1

