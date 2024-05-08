Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F7F8BFA15
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7463811354A;
	Wed,  8 May 2024 10:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 15FE9113531
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:54 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-45-663b4a3836b1
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
Subject: [PATCH v14 03/28] dept: Add single event dependency tracker APIs
Date: Wed,  8 May 2024 18:47:00 +0900
Message-Id: <20240508094726.35754-4-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTH9zz3lTs6r5XIFT64dFETDSoG9PgSs8RE74y6RY0f9ANWe7HV
 gloERWMCUhgW0WrEbpUpINYGqmBrjC+AtaQoELFqVTCUCKljjVC02moFpwXjl5Nfzvn/f58O
 S8gdVBKryd4n6bKVWgXNkdxwfHXK4tVLM+dfHOXg5LH5EH5fSkJlg40Gz5V6BLZrhRgC7lXw
 PDKEYPTBQwJMFR4E1f0+Aq619SFoth6h4Yn/J/CGR2horyijoehCAw2PXo9h6D1zCkO9fS10
 GmswOKODJJgCNJw1FeHY+A9D1FLHgKVgBgxYzQyM9adCe98zCppfzIG/z/XS0NTcTkLbjQEM
 T25V0tBn+0JBZ9t9Ejwnyym4HKyh4XXEQoAlPMLAY2cVhkZ9TFTy7n8K7pU7MZTUXsXg7bmN
 oKX0JQa77RkNreEhDA57BQGfLrkRDBwfZqD4WJSBs4XHEZQVnyFB35sOox8r6V8Xi61DI4So
 d+wXmyNVpNhRI4g3zT5G1Le8YMQqe67osM4WLzQFsFgdClOive4oLdpDpxjRMOzFYrCrixHv
 /zVKin6vCf+RtJlbppK0mjxJN2/5Vk7tMpqpPc8TD0RM0wuQV25AcazApwldw6+I7/zWYptg
 mp8ldHdHJziB/1lwlP9LjTPBD3FCbdfKcZ7C/yY8bXzDGBDLkvwMocc4ZXwt49OFPl8n/qac
 LtQ3Oic0cfxCoWcwiMZZHsvcLjLHqlws85EVzJYg9a0wTbhr7SaNSFaFfqhDck12XpZSo02b
 q87P1hyYu313lh3FXslyeGzLDRTybHAhnkWKeJkzcUmmnFLm5eRnuZDAEooEmfvPRZlymUqZ
 f1DS7c7Q5WqlHBdKZklFomxBZL9Kzu9Q7pN2SdIeSff9itm4pAKkTVQd8oMv/s670KdJCTO5
 8/0dq93qvRt/8Y/9s+5Ex4Ied/pggff6j7lrjCo20KRsXbc+dXmywW8XHC69j9u0xaFLNzxc
 Mblw79Q3DbRnfeDSTtNp98vP1schfbItJa32Q0YwevpDKabLplkNRb8XZuDiRUtajpblq0v4
 lM/bFGSOWpk6m9DlKL8Cl/UHnUYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+//P1dnqMCUP+cEYdMFIk7RetDthpyipT0UENfKYS52xqWVo
 WFNT09BAV17CSy3RVTbNrDSW4tIss1zpTFeaZNLSbhst18UVfXn58TwPv08vS8iKqYWsUpUk
 qlWKeDktISVREdoVsD0iZmW/IwSK8leC41sOCeU3DDT0Xa9HYGg6hWGycysMOO0IZp48JUBX
 3IeganSEgCazDUFb7Wka+sfngcUxTUN38VkatDU3aHj2wY1huOQ8hnrjTugprMZgck2QoJuk
 oUynxbPnPQaXvo4BfcZiGKstZcA9GgLdtpcUdFR0U9A2tBwuXhqmobWtmwRzyxiG/rvlNNgM
 vynoMXeR0FdUQMG1qWoaPjj1BOgd0ww8N1ViaMictWV//UXBwwIThuzLNzFYrPcQ3M95g8Fo
 eElDh8OOodFYTMCPq50Ixs59ZCAr38VA2alzCM5mlZCQORwGM9/L6Y3hQod9mhAyG48Jbc5K
 UnhUzQt3SkcYIfP+ECNUGpOFxtpAoaZ1EgtVXxyUYKzLpQXjl/OMkPfRgoWp3l5G6LowQwrj
 Fh3e5b9PsjZajFemiOrg9Qclse2FpdTRAb/jTl1ABrLI8pAXy3Oh/Ge9gfAwzS3lBwddf9mX
 W8Q3FryjPExwdgl/uTfSwz7cNv5FwycmD7EsyS3mrYU+nljKhfG2kR78TxnA1zeY/mq8uNW8
 dWIKeVg2u7mnLWUKkaQSzalDvkpVSoJCGR8WpImLTVUpjwcdSkwwotln0ae7i1rQt/6t7Yhj
 kXyutI+OiJFRihRNakI74llC7ivtPLMmRiaNVqSeENWJB9TJ8aKmHfmzpNxPun2PeFDGHVYk
 iXGieFRU/28x67UwA+2TOVOhaUVGy25r8o7DEYMtFa+cri0ynb8k3b3Otlb6uOzW5qr5reb1
 u3NfaJWbUqrqLHRIbqItMHf/kYAN7gfRzeFBWwzWS2yFd7B3GsoPDm2+ElewyGEPjEyf9yZ8
 geL2yZ+R3hO39pY8cS9JOyBvjqqGZa2rxNdvs0wq81iUnNTEKkICCbVG8QdySKOkKAMAAA==
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

