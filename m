Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCDE87315B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667D9113015;
	Wed,  6 Mar 2024 08:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DECD10FFDA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:29 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-98-65e82f7d9635
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
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 hdanton@sina.com, her0gyugyu@gmail.com
Subject: [PATCH v13 07/27] dept: Apply sdt_might_sleep_{start,
 end}() to wait_for_completion()/complete()
Date: Wed,  6 Mar 2024 17:54:53 +0900
Message-Id: <20240306085513.41482-8-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRiA/b5zm8PJaRmdjCgHFhiphcYbmNWfOn+CsD9hhK085cgbM2+V
 aKndNbuopVZTYw0vZZuQptNptLS8zBQzU0kxt6XOtDZarss0+vPywPu8z69XREjrKV+RIv60
 oIyXx8poMSme9arYkhFkEYJvl8ng5vVgsH+/TELZ0xoaTE+qEdTUn8dgfbUP3jtmECx29xJQ
 XGhCUD4+SkC9cQyBXnOBhv5Jbxiwz9HQWXiNhuzKpzT0TbswjBTdwlCt3Q9vCyowGJxmEoqt
 NJQWZ2P3sGBwqqsYUGf5w4SmhAHX+FboHBukQD+8Ge49GKGhWd9JgrFhAkP/izIaxmr+UPDW
 2EGC6WYeBbW2ChqmHWoC1PY5Bt4ZVBjqctyhi99+U/A6z4Dh4qNnGAY+NCFoufwJg7ZmkIaX
 9hkMOm0hAT8fv0IwkT/LQO51JwOl5/MRXMstIiFnJBQWf5TRu3fwL2fmCD5Hl8rrHSqSf1PB
 8Y0lowyf0zLM8CptMq/TBPCVzVbMly/YKV5bdYXmtQu3GP7q7ADmbT09DN9xd5HkJweK8QHf
 SHFYtBCrSBGUQeFHxTGdY5+pxNYVaa7fmVmo3vsq8hRxbAhX3mim/vP0YyuxxDS7iRsaci6z
 D7uB0+VNLTsEOyPmHvXsXeKVbAzXNVqAl5hk/bmHRuOyI2FDudeaPPSvuZ6rrjMsdzzZ7dwN
 2w16iaVupzu73M1it/NDxGn7+ol/B2u4Ns0QWYAkKuRRhaSK+JQ4uSI2JDAmPV6RFng8IU6L
 3L+kznAdbkALpoPtiBUhmZdkt6dZkFLylKT0uHbEiQiZj+Tcz0lBKomWp58RlAlRyuRYIakd
 rRWRstWSbY7UaCl7Un5aOCUIiYLy/xaLPH2z0I6d8o2X7sxnOHThx7q8vhYcORPm9zE5aJfY
 1h8hnUuQlE6t80fWqMimtm5SX2seP9ab0KzIDF41GG1TWn0srVP+qlpLpt3SRRxa21x758v3
 53taE8N95iMbK8N+mc8uOnc+0DFVMpcgVlEnIlR+kpTMNXqrB6PLT7zfkRbWIiOTYuRbAwhl
 kvwvXp6YTUcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSaUiTcRwH8P7/55qrxdO0eqjoGEhUdBgqPzosCvJPUNSLinxRrnrIkc7Y
 zCNamS7xyJqCrsNqHkxRy9oWHTrPWq7DTO1Ercyy4dKoNtKJ5Yze/PjA98v31U9CyQuZORKV
 OkHUqJWxClZKS7evTV+uW/lVXPWybBrknV0Fnl+ZNBTVVLPQfqMKQbXtNAbXw0h47XUj8D17
 ToGxoB1B8cceCmyOXgT2ijQWOvunQ5dnmAVnQQ4L6aU1LLwYHMPQXZiPocqyDZ4YSjA0jgzQ
 YHSxcNmYjifOVwwj5koOzKnB0FdxiYOxjyHg7H3FQMsVJwP2d8vg4tVuFursThocd/swdN4v
 YqG3+g8DTxytNLTn5TJwfaiEhUGvmQKzZ5iDjkYThpv6ibWMn+MMPMptxJBRdgtD19taBPWZ
 HzBYql+x0OJxY7BaCigYLX+IoO/cNw7OnB3h4PLpcwhyzhTSoO8OA9/vInbjGtLiHqaI3ppE
 7F4TTR6XCOTepR6O6OvfccRkOUasFUtJaZ0Lk+IfHoZYKrNYYvmRz5Hsb12YDLW1caT1go8m
 /V1GvGNulHTdITFWlShqVkZES2OcvZ+Zow0zksfGT6Ui2/RsFCAR+FBhsNxF+c3yi4U3b0Ym
 HcQvFKy5Xxi/Kd4tFcratvgdyMcIT3sM2G+aDxauORyTHRkfJjyqyEX/NhcIVTcbJ3cC+HDh
 /NB51m/5ROdZejFrQFITmlKJglTqxDilKjZshfZITIpalbziYHycBU18i1k3lncX/eqMbEa8
 BCmmyTYGDIhyRpmoTYlrRoKEUgTJToz2i3LZIWXKcVETv19zLFbUNqO5EloxW7Z1jxgt5w8r
 E8QjonhU1PxPsSRgTiq6zkXsbe/I94bqaMa4GqlpyhFYtK3Ju3s8bfBazXxGT75HRjU9v7Nv
 Slh9XQ7+Xhv8YEO4/X1TUkP5ZuuWmrwQw50ls3bdjnofl7ReZ3NN1R9ovRFtE73zO4YWjW46
 ORAYb8pYY7NkbU/rSSz1zdxpGPV9crVIde554+vqGn7XKmhtjDJkKaXRKv8C2ya79ykDAAA=
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

Makes Dept able to track dependencies by
wait_for_completion()/complete().

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/completion.h | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/include/linux/completion.h b/include/linux/completion.h
index fb2915676574..bd2c207481d6 100644
--- a/include/linux/completion.h
+++ b/include/linux/completion.h
@@ -10,6 +10,7 @@
  */
 
 #include <linux/swait.h>
+#include <linux/dept_sdt.h>
 
 /*
  * struct completion - structure used to maintain state for a "completion"
@@ -26,14 +27,33 @@
 struct completion {
 	unsigned int done;
 	struct swait_queue_head wait;
+	struct dept_map dmap;
 };
 
+#define init_completion(x)				\
+do {							\
+	sdt_map_init(&(x)->dmap);			\
+	__init_completion(x);				\
+} while (0)
+
+/*
+ * XXX: No use cases for now. Fill the body when needed.
+ */
 #define init_completion_map(x, m) init_completion(x)
-static inline void complete_acquire(struct completion *x) {}
-static inline void complete_release(struct completion *x) {}
+
+static inline void complete_acquire(struct completion *x)
+{
+	sdt_might_sleep_start(&x->dmap);
+}
+
+static inline void complete_release(struct completion *x)
+{
+	sdt_might_sleep_end();
+}
 
 #define COMPLETION_INITIALIZER(work) \
-	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait) }
+	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait), \
+	  .dmap = DEPT_MAP_INITIALIZER(work, NULL), }
 
 #define COMPLETION_INITIALIZER_ONSTACK_MAP(work, map) \
 	(*({ init_completion_map(&(work), &(map)); &(work); }))
@@ -75,13 +95,13 @@ static inline void complete_release(struct completion *x) {}
 #endif
 
 /**
- * init_completion - Initialize a dynamically allocated completion
+ * __init_completion - Initialize a dynamically allocated completion
  * @x:  pointer to completion structure that is to be initialized
  *
  * This inline function will initialize a dynamically created completion
  * structure.
  */
-static inline void init_completion(struct completion *x)
+static inline void __init_completion(struct completion *x)
 {
 	x->done = 0;
 	init_swait_queue_head(&x->wait);
-- 
2.17.1

