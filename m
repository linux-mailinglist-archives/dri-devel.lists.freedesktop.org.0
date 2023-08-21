Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F378222F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5588410E19D;
	Mon, 21 Aug 2023 04:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id C280310E195
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:04:59 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-5b-64e2ded5f456
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 07/25] dept: Apply sdt_might_sleep_{start,
 end}() to wait_for_completion()/complete()
Date: Mon, 21 Aug 2023 12:46:19 +0900
Message-Id: <20230821034637.34630-8-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTH9zz33udeKiXXTrOrzIlNyBaX4UvUHI0xEkn2fHEhWbZkGsVq
 70Y3KFgExcxRpL6BGGqCdYJLgVkrdAoXljC0roPxNiNWraww7EaHTgaIUIsi+FLY/HLyy/mf
 8/v0FxhNE7dQMBj3yCajLk1LVKxqJLrigzuBoH758Ng7YD2+HMKPj7JQfslFwHuxBoGrIR/D
 YOuH8PvEMIKp6zcYsJV6EVT032WgoS2AwO08SOD2QAz4wqMEOkuLCBRUXSJwc2gaQ9+pkxhq
 lM1wraQSg2fyHxZsgwTKbAU4Mh5gmHRU8+Awx0PQeYaH6f4V0Bno5sDd+z58+10fgSvuThba
 GoMYbjeVEwi4XnJwra2DBa+1mIMfHlYSGJpwMOAIj/Jwy2PHUGuJiA6HXnDQXuzBcPj7Ogy+
 nssIrh79C4Pi6ibQEh7GUK+UMvDsfCuC4IkRHg4dn+ShLP8EgqJDp1i48bydA0vfaph6Wk42
 rqMtw6MMtdTvpe4JO0t/q5ToT2fu8tRytZendiWb1juX0qorg5hWjIc5qlQfI1QZP8nTwhEf
 pg+7unjacXqKpQM+G06O3aJar5fTDDmyadmGHarUIfcIn/nz3H1nvb/yZtQQU4iiBElcJbVe
 /JN5zaF/W/gZJuK7kt8/ObufJ8ZJ9cX3uUKkEhjxyBzJ+eg6mQneFDOknnPmWWbFeOlHqzXC
 gqAWV0vWkv+di6WaWs8sR4lrJOVyE5phTeRkrP9vdsYpiUeipO77Lva/hwXSL04/W4LUdvRG
 NdIYjDnpOkPaqoTUXKNhX8KujHQFRRrlODC9tRGNez9uRqKAtNHqHW8H9RpOl5OVm96MJIHR
 zlPHPunXa9R6Xe5+2ZSRYspOk7OaUazAat9Sr5zYq9eIX+j2yF/JcqZsep1iIWqhGeHEpGN1
 d8Y/s3+SmR3dsT55bE7oc0sDF3fQX/2e3zcYetCYuJvEPdrSHv/1hYSiMlNez72COmtV9pOu
 NYGe4v1LhpTTnjzLRzn3UmIyzYtDO41/2EJJC17Oz6df+gvDLYnfPDe+2N2bcrM9edei2hDJ
 W9ZXUvTpxqRN67Yt2T7Qunalls1K1a1YypiydK8AMADUhk0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa1BMcRgGcP//ubYsx2o4IzNYg5FxGzKvcZnGlw4zjBkfXGe0Y49atja7
 iWUiukhsWiZLbUmxVkWclnFb1kbJpZYSkWhdU1tuGymXjfHlnd/M88zz6WUJhZUazmpi40V9
 rEqrpGWkbPHs5EmPmr3qqfsdDJj3TQX/13QSrGWlNHjOlCAodezE0HorAh53tSPouV9LgCXb
 g+BYy3MCHJXNCJz2XTTUvR4I9f5OGqqz99KQXFRGw4O2XgxNhw5gKJEWwd2sQgyu7nckWFpp
 yLUk48B5j6HbVsyALWkseO05DPS2TIPq5gYKKvKqKXA+nQhH8ptouOqsJqHyohdD3WUrDc2l
 vym4W3mbBI/ZRMHpjkIa2rpsBNj8nQw8dBVgOJsSWEv78ouCKpMLQ9rxcxjqG68guJb+EoNU
 2kBDhb8dQ7mUTcCPk7cQeDN9DKTu62Ygd2cmgr2ph0io/VlFQUpTGPR8t9Lhs4WK9k5CSCnf
 LDi7CkjhTiEvXMp5zggp154yQoG0SSi3hwpFV1uxcOyznxKk4j20IH0+wAgZvnosdNTUMMLt
 wz2k8LregpeMWCmboxa1mgRRP2VepCy6zelj4q4P3pLnuckkIcfADBTE8twM/suHCqbPNDee
 f/Kkm+hzMDeKLze9pTKQjCW43f15+8f7dF8whNPxjSeS/prkxvLnzeaAWVbOhfHmLOLf5ki+
 5Kzrr4O4mbx05TLqsyJQ+dTyisxCsgLUrxgFa2ITYlQabdhkw4ZoY6xmy+S1uhgJBX7Glthr
 voi+1kW4Ecci5QB55AivWkGpEgzGGDfiWUIZLA/51qJWyNUq41ZRr1uj36QVDW4UwpLKYfKF
 y8RIBRelihc3iGKcqP+fYjZoeBKaH56o+0B5l6403Sua8OKVlP8i5JRnvex4pnX1Nps7XDYs
 rqN3QXbNiinPojY3rtG7+sdsz5i5pBg7jPPT8XLL0B2+Ew0RiXNTfW+1Z1aV4dwFYzaOvrAi
 9ODckzeiRrfdyNftqXq4blBD4puj0zWzhvCD08YdzslsrXXHm2bZjasmHFWShmjVtFBCb1D9
 AXJoOr8vAwAA
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
index 62b32b19e0a8..32d535abebf3 100644
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

