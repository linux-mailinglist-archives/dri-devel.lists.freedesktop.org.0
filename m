Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84592782222
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA3510E191;
	Mon, 21 Aug 2023 04:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 72B6510E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:04:59 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-1b-64e2ded4b3b0
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 03/25] dept: Add single event dependency tracker
 APIs
Date: Mon, 21 Aug 2023 12:46:15 +0900
Message-Id: <20230821034637.34630-4-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxTHfZ731nbUvHkx8RGWuTUhGo0iBszJNHPZYnz2YQnJRkwciTT0
 jTRycUVRXJaA1upAFEiw45INcOmagre3GC9YgzXlIgK1VmUEq1TCbCx324mgDkv8cvLL+f/P
 79NRMdJ1LkFlzD8gm/L1uTpew2rG45o2+ANBw6apPwGqTm2CyKuTLDRcbOXBe6EFQWtbKYaQ
 Zyc8joYRzPcNMGCt8SJoGnnCQFtnAIHLfpSHB6PLwR+Z5KGnppyHY+cu8nD/5QKG4bPVGFqU
 76G3shlDx9y/LFhDPNRbj+HF8QLDnM0hgK0kCYL2OgEWRlKgJ/CIA9fQeqj9Y5iHm64eFjqv
 BTE8uNHAQ6D1PQe9nd0seKsqODg/0czDy6iNAVtkUgBfRyOGS+ZFkWX2HQddFR0YLH9dxuD/
 px3BrZPPMCitj3i4EwljcCo1DLz524MgeHpcgOOn5gSoLz2NoPz4WRYG3nZxYB5Og/nXDfzX
 X9I74UmGmp2HqCvayNK7zYRer3siUPOtIYE2Kgep076OnrsZwrRpJsJRxfEbT5WZaoGWjfsx
 nejvF2j37/MsHfVbcXribs02g5xrLJJNyV9laXLclXXc/scrD0etq0uQXypDahURU4mvNIQ+
 sncmHGNeXEMGB+eYD7xC/Jw4K8a4MqRRMeKJT4h9qo//EMSL6aS9vid2wIpJZHrUF9trxTTy
 8N0sXpKuJi2XOmIitbiFKO03Yn1psTM98pxd6pSrycPpXUu8ity2D7KVSNuIljmQZMwvytMb
 c1M35hTnGw9vzC7IU9DiQ9l+XfjpGprx/uBGogrp4rRZnwYNEqcvKizOcyOiYnQrtIn/jRgk
 rUFffEQ2FewxHcyVC90oUcXqVmo3Rw8ZJHGv/oC8T5b3y6aPKVapE0pQZu2Rre2ku0uybA+n
 ktrs5OQ3+vLi6m93pcTtbNvyTVZ82577O4p0a+95/M4M3/JtWpL9NBOudPZrvhsbSv+MpM9m
 +AoiqT/C7hO9DrO6/9Waq2cy46s8E5vjpi44ImmWhKSrGZ6fB0Ic+mVMLJOUhUCX22ApvdL3
 QkO/WObSsYU5+pR1jKlQ/z9mIX9jTAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/3+/7u47j5zT9yONtechTjewzGWbGd7as+Uds6HI/Oj1o
 d5RME5WHklVbjp6WY1eriDvzVKnVeriaSp3QKu40pBRxkRKV+ee9997v9+f110fGKLO4uTJt
 +HFJF64OVRE5K9/lG7fK1uXQeL0xzYfUy17g/H6RhaziIgLNdwoRFN0/i6Gnege8HOpDMPKs
 iQFDejOCG/ZOBu7XdCEoyz9HoLV7OticAwSs6UkE4m4WE3jeO4qh42oahkKzHzSkGDFUDH9g
 wdBDINMQh8flI4ZhUwEPplgPcORn8DBq9wZrVxsHVdlWDsraV8D1nA4CpWVWFmoeOTC0Pski
 0FX0h4OGmjoWmlOTObjdbyTQO2RiwOQc4KGlIhfD3fhx2vlvYxzUJldgOH/rHgbb6xIETy++
 xWAuaiNQ5ezDYDGnM/ArrxqB48pnHhIuD/OQefYKgqSEqyw0/a7lIL7DB0Z+ZpEtvrSqb4Ch
 8ZYoWjaUy9J6o0gfZ3TyNP5pO09zzSeoJd+T3iztwfTGoJOj5oJLhJoH03ia+NmGaX9jI0/r
 ro2wtNtmwP7z9sk3aqRQbaSkW7MpUB5cmZLBRbx0OzlkWBiLbMpE5CIThXVi82AfmvBEWCq+
 ejXMTHhXYZFoSX7PJSK5jBEuTBXzvzwjE8UswV8sybROHrCCh/i1u2UyVwg+4ouxb/gfdKFY
 eLdiEuQirBfNJU8m98rxzVf7OzYFyXPRlALkqg2PDFNrQ31W60OCo8O1J1cfOhZmRuM/Y4oZ
 TX2EvrfuqESCDKmmKQLnOTRKTh2pjw6rRKKMUbkq3H/YNUqFRh19StIdO6g7ESrpK5G7jFW5
 KXbukQKVwhH1cSlEkiIk3f8Wy1zmxiKyL8gYYtnQOXM3Xem1xHet30rvpI4pNQaDyjsIx3xs
 mfOW9MaMLU442uJWVxqgjfLfemCGkNbZFLDfb1V5fyzOeTj4mJVCThV/Wr5sW47b6ekKj/rs
 Npex0jxd0O/tKeoFZ7ZXN5ZH2Y8e9tu8bE59/Z2Agb17AhOts1+veeCeZyxQsfpgtbcno9Or
 /wI+DQQ/LwMAAA==
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

Wrapped the base APIs for easier annotation on wait and event. Start
with supporting waiters on each single event. More general support for
multiple events is a future work. Do more when the need arises.

How to annotate (the simplest way):

1. Initaialize a map for the interesting wait.

   /*
    * Recommand to place along with the wait instance.
    */
   struct dept_map my_wait;

   /*
    * Recommand to place in the initialization code.
    */
   sdt_map_init(&my_wait);

2. Place the following at the wait code.

   sdt_wait(&my_wait);

3. Place the following at the event code.

   sdt_event(&my_wait);

That's it!

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept_sdt.h | 62 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 include/linux/dept_sdt.h

diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
new file mode 100644
index 000000000000..12a793b90c7e
--- /dev/null
+++ b/include/linux/dept_sdt.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Single-event Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_SDT_H
+#define __LINUX_DEPT_SDT_H
+
+#include <linux/kernel.h>
+#include <linux/dept.h>
+
+#ifdef CONFIG_DEPT
+#define sdt_map_init(m)							\
+	do {								\
+		static struct dept_key __key;				\
+		dept_map_init(m, &__key, 0, #m);			\
+	} while (0)
+
+#define sdt_map_init_key(m, k)		dept_map_init(m, k, 0, #m)
+
+#define sdt_wait(m)							\
+	do {								\
+		dept_request_event(m);					\
+		dept_wait(m, 1UL, _THIS_IP_, __func__, 0);		\
+	} while (0)
+
+/*
+ * sdt_might_sleep() and its family will be committed in __schedule()
+ * when it actually gets to __schedule(). Both dept_request_event() and
+ * dept_wait() will be performed on the commit.
+ */
+
+/*
+ * Use the code location as the class key if an explicit map is not used.
+ */
+#define sdt_might_sleep_start(m)					\
+	do {								\
+		struct dept_map *__m = m;				\
+		static struct dept_key __key;				\
+		dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__);\
+	} while (0)
+
+#define sdt_might_sleep_end()		dept_clean_stage()
+
+#define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
+#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__)
+#define sdt_ecxt_exit(m)		dept_ecxt_exit(m, 1UL, _THIS_IP_)
+#else /* !CONFIG_DEPT */
+#define sdt_map_init(m)			do { } while (0)
+#define sdt_map_init_key(m, k)		do { (void)(k); } while (0)
+#define sdt_wait(m)			do { } while (0)
+#define sdt_might_sleep_start(m)	do { } while (0)
+#define sdt_might_sleep_end()		do { } while (0)
+#define sdt_ecxt_enter(m)		do { } while (0)
+#define sdt_event(m)			do { } while (0)
+#define sdt_ecxt_exit(m)		do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_SDT_H */
-- 
2.17.1

