Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FC04DA7F4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 03:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBDD10E4DF;
	Wed, 16 Mar 2022 02:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DAE410E306
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 02:27:12 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.51 with ESMTP; 16 Mar 2022 11:27:11 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 16 Mar 2022 11:27:11 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: [PATCH RFC v5 18/21] dept: Disable Dept within the wait_bit layer by
 default
Date: Wed, 16 Mar 2022 11:26:30 +0900
Message-Id: <1647397593-16747-19-git-send-email-byungchul.park@lge.com>
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

The struct wait_queue_head array, bit_wait_table[] in sched/wait_bit.c
are shared by all its users, which unfortunately vary in terms of class.
So each should've been assigned its own class to avoid false positives.

It'd better let Dept work at a higher layer than wait_bit. So disabled
Dept within the wait_bit layer by default.

It's worth noting that Dept is still working with the other struct
wait_queue_head ones that are mostly well-classified.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 kernel/sched/wait_bit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/wait_bit.c b/kernel/sched/wait_bit.c
index 02ce292..3e5a3eb 100644
--- a/kernel/sched/wait_bit.c
+++ b/kernel/sched/wait_bit.c
@@ -3,6 +3,7 @@
  * The implementation of the wait_bit*() and related waiting APIs:
  */
 #include "sched.h"
+#include <linux/dept.h>
 
 #define WAIT_TABLE_BITS 8
 #define WAIT_TABLE_SIZE (1 << WAIT_TABLE_BITS)
@@ -246,6 +247,8 @@ void __init wait_bit_init(void)
 {
 	int i;
 
-	for (i = 0; i < WAIT_TABLE_SIZE; i++)
+	for (i = 0; i < WAIT_TABLE_SIZE; i++) {
 		init_waitqueue_head(bit_wait_table + i);
+		dept_map_nocheck(&(bit_wait_table + i)->dmap);
+	}
 }
-- 
1.9.1

