Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FCDABB882
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2581F10E30E;
	Mon, 19 May 2025 09:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id E6A4010E24F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:44 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-d5-682af76ec40c
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
Subject: [PATCH v16 16/42] dept: apply sdt_might_sleep_{start,
 end}() to hashed-waitqueue wait
Date: Mon, 19 May 2025 18:18:00 +0900
Message-Id: <20250519091826.19752-17-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/7VqvTsjxdoBhYaXRZN1/CIvpQByK6fcrosvLUVrpkNi+B
 oKW1vKWGSqU2NZZtK/XMIKvZcmXZxVaaqehME0nUJGsr0y5z1ZeXh+d539/z5WVw+RNyDqPR
 nhR0WlWkgpIS0qEpJUu130LUK9xiKHi+GggorLBS4LplQWCtTsag//EWeOcdRDD28hUOBXku
 BCXdnThU17sR2MtPU9DUOxWaPcMUNOSlU3CmrIKC1wPjGHTk52JgEbdBl6mPgOfZpRgU9FNw
 peAM5hsfMRg1mWkwJQVBT/llGsa7ldDgbiHB3r4ELhV3UHDf3kBA/Z0eDJruFlLgtv4m4Xn9
 UwK8WXPBlZNJws1PpRQMeE04mDzDNLxxGDGoN86CyhQf8OyXXyQ8yXRgcPZaFQbNbfcQ1Bre
 YyBaWyhwegYxsIl5OPy4/hhBT9YQDakZozRcSc5CkJ6aT0BKxxoY++5rLvqqhOSrlQTc/NmC
 Nq7nrcVWxDsHh3E+xRbH//C8pXi710jwz0o5vuZyJ82n1LbTvFHU87byEL7sfj/Gl4x4SF40
 n6d4cSSX5tOGmjH+U2MjvWNeuDQsQojUxAq65RsOStXVL86j6C4mvsxVgSehLioNSRiOXc0l
 v3EQaYjx63OvmQmbYhdxra2j+IQOYBdwtsw+Mg1JGZxtmcy9K2pDE8EMdh93u6/QzyHYIO7h
 C4vfl7FruTb3BeIvfz5nqXT4QRKf357u9O/I2TVcs6WYmIBy7EUJl2Fu/3cwm3tY3kpkI5kR
 TTIjuUYbG6XSRK5epk7QauKXHT4RJSLfe5kSx/feQSOu3XWIZZBiiqzSHqyWk6rYmISoOsQx
 uCJAZrYtVstlEaqEU4LuxAGdPlKIqUNzGUIRKFvpjYuQs0dVJ4XjghAt6P6nGCOZk4QODb1f
 mdH0c5XJvbOA3KW/pe6eduzZWCAzFjTDpT0epHIEdm4K2xOdfyM80TnyISfUPPnisWBDaNvW
 gYCiR8rY2u3Zyld43PTNOevs1pqnm2f2pAqWKDGscfRQ35HEOLZq/8aFUw0RAZKi+JwmffSD
 z5se1fQazoX2tjov5C6QrdIriBi1ShmC62JUfwB3y8NxWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSeUiTcRzG+723y9XbMntJshrZsegQMr7QQf/50kUIEQSVQ1/aaq7a8oxA
 Uzs0zQK1dK6lsmybaZuBHRNztDStZk5T8yamomaHM007ptA/Dx+e58vz/PNlcMlDcgWjVF8Q
 NGq5SkqJCNGhnamb1T9lim3P6oPAO3GNAF2FhQLXIzMCS1UKBsOvwuHj5CiCmbfvccjPdSG4
 39+NQ5WzB4G97DIFLZ8Xgds7TkFDbiYFqSUVFDSPzGLQlXcbA7P1IPQaPQQ05hRjkD9MQWF+
 KuaTIQymjSYajMkhMFBWQMNsfyg09LSR4ChqIMHeuQnu6rsoeGFvIMBZPYBByzMdBT2WvyQ0
 OusJmMwOAtetLBLKvxRTMDJpxMHoHafhQ60BA6chECrTfK1Xfvwh4XVWLQZXSh9j4O54jqDm
 Wh8GVksbBQ7vKAY2ay4Ovx68QjCQPUZD+o1pGgpTshFkpucRkNYVBjNTvuWiiVBIuVdJQPnv
 NrR3D2/RWxDvGB3H+TRbPP/L20rx9kkDwb8p5vinBd00n1bTSfMGayxvK5PxJS+GMf7+dy/J
 W03XKd76/TbNZ4y5Mf7Lu3f04ZXHRLuiBZUyTtBs3RMpUlQ1XUfnepmEElcFnox6qQzEMBy7
 nbvazGQgP4Zi13Pt7dP4HAewqzlblofMQCIGZ9sWch+LOtBcsJQ9zj3x6Kg5JtgQ7mWTed4X
 szu4jp6bxBxz7CrOXFk7X+Tn8zszHfM3EjaMc5v1RA4SGdACEwpQquNi5EpV2BbtGUWiWpmw
 JepsjBX5Hsh4afZWNZpoCa9DLIOk/uJK+0aFhJTHaRNj6hDH4NIAscm2QSERR8sTkwTN2ZOa
 WJWgrUNBDCFdLt53VIiUsKfkF4QzgnBO0PxPMcZvRTLaHfSJjL/U7zwhK22tGxpsX7tpcdN+
 pi80OOe0o0q8P5kpPX/6W9JVYdVMju5AY+GJY10B8RPu2fB1g3f8GUOwalnekdTADVO7Wwvd
 hkbTyHJdRLNLfzE+SuEfQn5dsKagfHBJua6793e9Xlo2HrH4TkTN3jHlZVmSyzPtCda+TpcS
 WoU8VIZrtPJ/tuvmajwDAAA=
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

Make dept able to track dependencies by hashed-waitqueue waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait_bit.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index 9e29d79fc790..179a616ad245 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -6,6 +6,7 @@
  * Linux wait-bit related types and methods:
  */
 #include <linux/wait.h>
+#include <linux/dept_sdt.h>
 
 struct wait_bit_key {
 	unsigned long		*flags;
@@ -257,6 +258,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 	struct wait_bit_queue_entry __wbq_entry;			\
 	long __ret = ret; /* explicit shadow */				\
 									\
+	sdt_might_sleep_start(NULL);					\
 	init_wait_var_entry(&__wbq_entry, var,				\
 			    exclusive ? WQ_FLAG_EXCLUSIVE : 0);		\
 	for (;;) {							\
@@ -274,6 +276,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 		cmd;							\
 	}								\
 	finish_wait(__wq_head, &__wbq_entry.wq_entry);			\
+	sdt_might_sleep_end();						\
 __out:	__ret;								\
 })
 
-- 
2.17.1

