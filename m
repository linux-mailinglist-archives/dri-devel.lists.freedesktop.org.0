Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5388B83A955
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD6D10F6F4;
	Wed, 24 Jan 2024 12:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D4A710F732
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:09 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-c5-65b0fbb52f43
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 08/26] dept: Apply sdt_might_sleep_{start,end}() to swait
Date: Wed, 24 Jan 2024 20:59:19 +0900
Message-Id: <20240124115938.80132-9-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRSH/b93Z6uXJfRmRDKwe6ZlcjANoQ+9fQiioKAIXfmSq6k10zKI
 vKbNvIat8tLUmGuarq1ArdlSsky8S5qYqJlp3nK5kTorZ/Tl8ON3zvN8OgwuqSE9GHnkFUEZ
 KVNIKREhmlpVvOvFokHwGf3hDzl3fMA2l0ZAQVUFBe2V5QgqnidgMP72EPTYJxEstrThoM5r
 R1A89BmH540DCMy6RAq6RlZDt22Ggqa8dAqSSqso6JhwYNB/LxeDcuMRaM4uwcAy/40A9TgF
 +eokbHmMYTCv1dOgjfeCYd1DGhxDvtA08JEEc98OeFDUT8ErcxMBjdXDGHTVFlAwUPGHhObG
 9wS052SQ8HS6hIIJuxYHrW2Ghk6LBgND8rLo1s/fJLzLsGBw6/EzDLo/vURQlzaIgbHiIwUN
 tkkMTMY8HBbK3iIYzpyiIeXOPA35CZkI0lPuEdC29I6E5P59sPirgAoO4BsmZ3A+2XSVN9s1
 BP+hhONrHn6m+eS6PprXGGN4k247X/pqHOOLrTaSN+pvU7zRmkvzqqlujJ9ubaX59/cXCX6k
 W40d3XBKFBgmKOSxgnL3gVBReGaajbrUyFwzx08S8aiNUiFXhmP9uNSeWVqFmJX8yIacNcVu
 4Xp753Fndmc9OVPGKKlCIgZnU9043Y+WFXYte4Qb7RkinCzBenE1po3OWszu44a/lhL/9Ju4
 coNlxePK+nNPH/St9JLlm0F9Fu10cmyqK9fpSMT/Aeu5N7peIhuJNchFjyTyyNgImVzh5x0e
 Fym/5n0uKsKIlh9Ke8NxuhpZ24/XI5ZB0lXiYH2VICFlsdFxEfWIY3Cpu7h3faUgEYfJ4q4L
 yqgQZYxCiK5HGxhCuk68x341TMKel10RLgrCJUH5f4sxrh7x6PbmgKWF7xbN2P3dE9UuDs+s
 g8cvezUEgHjN5aDg07Vbz41su1sYFmS9cWyv4+zNM4WzmwIV38VF6W5lRaEZrVZ11hMX93VD
 ZRHoROXSG2vpVP3+EM/X/sw3Q4HCpbjWcYEl/VVjdzNj6r6ktZoGT+bVSe2BHb9jD3/JnfMz
 eLvtlBLR4TLf7bgyWvYXhYsroUwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzVSfUyMcRz3+z3P83uejuPZuc3jbezMGPPe2dcy/OHlN6NYf9i8TEcPHZXc
 kTKslFSUioSSFKddx9Udm3DWatKxFN16k6ZWkiJL15yLdDb/fPbZ5+2vj8Cocrlpgj7ymGyI
 1IVriIJVBAYkLHrkLZWXOq2zIPPiUnAPJbOQZ7UQqH9QgsDyMB5D74tN0DTcj8BbW8dATnY9
 gtsdHxh4WN2OwFF8lkBD10RwuQcIOLMvEEgoshJ42zeCoe1qFoYS21Z4nVGIocLTw0JOL4Hc
 nAQ8Bp8xeExmHkxxc6Gz+AYPIx3LwNneyEHVTScHjtaFcD2/jcAzh5OF6sedGBqe5BFot4xy
 8Lq6hoX6zDQO7n8rJNA3bGLA5B7g4V1FAYbSxLG1pB9/OHiZVoEh6U4ZBlfLUwTPkz9isFka
 CVS5+zHYbdkM/Lr3AkFn+lcezl308JAbn47gwrmrLNT9fslBYpsWvD/zyLoAWtU/wNBE+wnq
 GC5g6atCiZbf+MDTxOetPC2wHaf24gW06FkvprcH3Ry1mVMItQ1m8TT1qwvTb2/e8LTmmpel
 Xa4cvG3GTsXqUDlcHy0blqwJUYSlJ7tJVLUQ44jrZ+NQHUlFgiCJ/tItN0pFfgIR50nNzR7G
 x9XibMme9olLRQqBEc+Pl4q/1xKfMVncKn1q6mB9XVacK5XbZ/pkpaiVOruLWB+XxFlSSWnF
 vx0/caV0/3rrP101lvlovsRnIEUBGmdGan1kdIROH65dbDwcFhupj1m8/0iEDY1dxnR6JPMx
 GmrYVIlEAWkmKNeZrbKK00UbYyMqkSQwGrWyeeoDWaUM1cWelA1H9hqOh8vGSjRdYDVTlJt3
 yCEq8aDumHxYlqNkw38XC37T4tCj0ffDizKcV5SvXO/OBAbOcZfOrFKrA7LmrxqNvxRUtHuz
 K9TjFXf3hfRtH0j5Tpsua4OeLFye1Hx3wqD/5bUb1h9V+Q8GBbeX2coP3DnVOOnsii35OzcE
 H5ojSWXBu8hvHDN/9p6hlEouu8XRfTPfKtbkaVfXnu7p3tjTvWaf5UuXhjWG6ZYtYAxG3V8+
 1AJ4LgMAAA==
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

Makes Dept able to track dependencies by swaits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index d324419482a0..277ac74f61c3 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -6,6 +6,7 @@
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/dept_sdt.h>
 #include <asm/current.h>
 
 /*
@@ -161,6 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
+	sdt_might_sleep_start(NULL);					\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
@@ -176,6 +178,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 		cmd;							\
 	}								\
 	finish_swait(&wq, &__wait);					\
+	sdt_might_sleep_end();						\
 __out:	__ret;								\
 })
 
-- 
2.17.1

