Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DCB83A961
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F94110F728;
	Wed, 24 Jan 2024 12:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED1EB10F731
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:09 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-b5-65b0fbb512f0
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 07/26] dept: Apply sdt_might_sleep_{start,
 end}() to wait_for_completion()/complete()
Date: Wed, 24 Jan 2024 20:59:18 +0900
Message-Id: <20240124115938.80132-8-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0zMcRjHfb4/r+P4OjbfmLFbzWQkqj3MLGbzMT/G/GMYjr5zN3XlUmQz
 3ZVECllOP3CVnXMd5XvHUHGyUlEdtZyWVimkn0vXnBJ3mX+evfa8n+f111tCyp/R8yVqzQlB
 q1FGKRgpJR2YUbD80XipsFKfFgJXL60E92gaBfklVgacD4oRWO06AnqrNsOHsX4E4/WNJBiy
 nQgKOj+RYK9uR1Bh1jPQ1D0Tmt1DDNRmpzOQXFTCwLu+CQLarmcRUCxuhzdXCglweL5SYOhl
 IM+QTHjHNwI8JgsLpqRA6DLnsjDRGQK17S00VLQug5xbbQyUV9RSUP2ki4CmZ/kMtFv/0PCm
 uoYC59UMGu4PFjLQN2YiweQeYuG9w0hAaYpXlPpjkobXGQ4CUu88JKD5YxmC52kdBIjWFgZe
 ufsJsInZJPy6W4WgK3OAhXOXPCzk6TIRpJ+7TkHj79c0pLSFwfjPfCZiLX7VP0TiFNtJXDFm
 pHBdIY+f5n5iccrzVhYbxXhsMwfhovJeAheMuGksWi4wWBzJYvHFgWYCDzY0sLjmxjiFu5sN
 xM4Fe6XrIoUodYKgDV5/SKqqbe+hY1/MPjUxeTYJ2WdeRH4Sngvly85b0X/ObNDTPma4JbzL
 5SF9PJdbzNsyvnj3UgnJnZ/Om4frGV8wh1PxrQ29U0xxgXyhwz4lknFhfPmLYvqfdBFfXOqY
 Evlx4fz9nFbKx3LvTYflMuuT8lyyH+/ILWL/PfjzL80u6gqSGdE0C5KrNQnRSnVU6ApVokZ9
 asWRmGgReRtlOjOx7wkace6uRJwEKWbIIiwlgpxWJsQlRlciXkIq5spc/g8EuSxSmXha0MYc
 1MZHCXGVaIGEUsyTrRo7GSnnjipPCMcEIVbQ/k8Jid/8JLR/y657uvCN3FO9+pgx4ABZpLFu
 7dGpNn3Ub5y1ZlcP3X9tx+qqL31ZTeLhDS835Jnc8QGmwNCbb22Pt12OaNnjH3T8tj14+eh6
 g9gtLlWKYqqnLmcytkuKs9oSB0oGv3+LqF9UFjzsvD1cs7kvbDRg4a/sztTPdbdcZHqg7vji
 NQoqTqUMCSK1ccq/nZYfxk0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX+P13H5dcJPnm9rJpNI+hijf6zvPI3ZPM2mGz86rthdjphJ
 RVF3ZMsl4Tp2bleUK+ah41YunfRALZUctUJKWbqbdB7umH8+e+39fu/110dESgvoEJEiMUlQ
 JcqVMkZMidcvS5t/d7RUiDB7J0NOdgS4hzMpKCgpZqDxdhGC4vKTBPQ6YuG1px/BaF0DCfrc
 RgSFnW9JKK92IbCZUxlo6g6EZvcgA87cLAbSrpcw8LLPS0DHxQsEFFnXQe15IwH2kY8U6HsZ
 uKxPI3znEwEjJgsLppRQ6DLns+DtXAhOVwsNVVecNNja58Glqx0MVNicFFTf7yKg6WEBA67i
 3zTUVtdQ0JijpeHWgJGBPo+JBJN7kIVXdgMBpek+2+lvv2h4prUTcPrGHQKa2x4heJz5ngBr
 cQsDVe5+AsqsuST8uOlA0KX7wsKp7BEWLp/UIcg6dZGChp/PaEjviILR7wVMzDJc1T9I4vSy
 w9jmMVD4uZHHD/Lfsjj9cTuLDdZDuMwchq9X9BK4cMhNY6vlDIOtQxdYfPZLM4EH6utZXJM3
 SuHuZj2xYdp28fLdglKhEVQLVsSJ452uHvrgk6Aj3l8nUlB54FkUIOK5xbyuPpX2M8PN4Vtb
 R0g/B3Oz+DLtB18uFpFcxlje/LWO8RcTuHi+vb73L1NcKG+0lyM/S7govuJJEf1POpMvKrX/
 FQVwS/hbl9opP0t9m/eWc+x5JDagMRYUrEjUJMgVyqhw9f745ETFkfBdBxKsyPczpuPenPto
 uCm2EnEiJBsnibGUCFJarlEnJ1QiXkTKgiWtU24LUsluefJRQXVgp+qQUlBXoqkiSjZZsnqL
 ECfl9sqThP2CcFBQ/W8JUUBICnrp6O/RGHuCFk3qyIyMvLYmfPqMb9vr5IPad66W2d4b27QZ
 A8c6dVWRXbiPHaOmYuduLgyKvjmnbV/a8zzb1GhPd/6E8dGf25I2vfjpqandOm+NO+Pum2sT
 d3wtiWswOp5+3rQyIkDfY1pKdt9TV6buWaWhlGsdoYaEjTG2sKEQ3bCMUsfLF4aRKrX8D8Uv
 ZDsvAwAA
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

