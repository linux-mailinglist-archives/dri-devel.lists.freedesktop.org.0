Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E58745901
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D365210E1FB;
	Mon,  3 Jul 2023 09:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4725010E1F0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:42 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-46-64a299b2c9a4
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 07/25] dept: Apply sdt_might_sleep_{start,
 end}() to wait_for_completion()/complete()
Date: Mon,  3 Jul 2023 18:47:34 +0900
Message-Id: <20230703094752.79269-8-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTH9zz33ufedlavlekzNdM1cRqM77CcLWqMX7zZZuJiSLaZTRt7
 I90KmoJINSZVwBcEIkyovCktpuugm3KLEV/KOlQUVKjYICNALBEVoeLQory42WL8cvLL+Z/z
 +/QXGO1lbrZgTE6Vzcl6k46oWXVoin2JUuwwLG+wrob8nOUQfnmEhbKzbgL+P6sRuGsPYOi/
 vgHujwwiGL/TyoCt0I/AHuxmoLaxB4HXdZDAvYdTIRAeItBUeIxARuVZAncHJjB0FRVgqFY2
 wq3jDgy+0ccs2PoJlNoycGQ8wTDqrOLBaV0Ava4SHiaCK6Cpp50Db+diKD7VReCKt4mFxrpe
 DPculRHocf/Pwa3Gmyz483M5+OOZg8DAiJMBZ3iIhzZfBYZzmRHRoRf/cXAj14fh0JkaDIF/
 LiOoP/IAg+JuJ3A1PIjBoxQyMPbbdQS9eSEesnJGeSg9kIfgWFYRC61vbnCQ2RUP46/LyLov
 pauDQ4yU6dkjeUcqWKnZQaWLJd28lFnfyUsVym7J44qVKq/0Y8k+HOYkpeookZThAl7KDgWw
 9KylhZdunhxnpYcBG9405wf1aoNsMqbJ5mVrt6kTB7whftdf09PL/dd4K6qdmo1UAhXjaN/9
 Mfyea2s6uSgTcSHt6Bhlohwjzqee3EeRvVpgxMMfUtfzOyQazBDT6YtX9ZPMigtoccHQpEgj
 xtOJdjf7TjqPVp/zTYpU4ue073UeirI2ctNV3EOiUir+qqI5Sjl59/Ax/dvVwR5Hmgr0QRXS
 GpPTkvRGU9zSREuyMX3p9p1JCopUyrl/YksdGvZvbkCigHRTNB377AYtp09LsSQ1ICowuhhN
 RvC0Qasx6C17ZfPOrebdJjmlAc0RWN0szcqRPQatuEOfKv8iy7tk8/sUC6rZVmR9Vcl+P/fn
 57etv4ebz3xVnv5079MQu/LapzNbVPlt875wtl2ip/9NzRaWzbKM5cZ6dxTkL150wlVzovvr
 LZ8ctGc13/3pRxRIWHP+5bSEb4LTP9qM7Kbz4meOygv2vpIinOCrW9/bGrf9u2kxahpvWXuy
 dOuqi7ctG8psm771dAcLdTo2JVG/IpYxp+jfAl/A82VOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxiG977fkW7Vz1rjt26JpBGNmgkmgk/mMpfsh++WbPGPJ/whjf20
 DQdJqwjqErTonAoTNmRAUUApDVSoX2uCaJHAqBwiVGkQGkAhqGsAWYCCHHZoXfbnyZX7vnP9
 enhKVcZoeGPaCcmUpkvRsgpa8f1Oy2dycaU+ru7XGMi/Ggeh2Us0WOsdLPjqahE43OcwBNt2
 w/O5CQRLT3ooKCr0IagYGaLA7R1G4LGfZ6F3bAX4Q1MsdBReYcFyq56Fp+PLGAavF2Colb+D
 rmuVGJoX3tBQFGShtMiCw+cPDAu2Gg5s2TEwai/hYHlkG3QM9zHQWtbBgCewBYpvDLLw0NNB
 g7dhFENvo5WFYcc/DHR522nw5ecycOdtJQvjczYKbKEpDp41l2Nw5oRtF2f+ZuBxbjOGi7fv
 YvAPPEDQdOklBtnRx0JraAKDSy6kYLG6DcFo3iQHF64ucFB6Lg/BlQvXaej56zEDOYPxsPTO
 yn61k7ROTFEkx3WKeObKadJZKZL7JUMcyWkKcKRcPklc9s3k1sMgJhXTIYbINT+xRJ4u4Mjl
 ST8mb7u7OdL+2xJNxvxFeM+niYov9FKKMUMyxX6ZpDCMeya59EerMst8v3PZyL3iMoriRWG7
 6L4bYCLMChvF/v4FKsJqIVp05b4O5wqeEn78ULT/+YSNFKuFTHFmvuk900KMWFwwhSOsFOLF
 5T4H/Z90nVjrbH4vihISxFfv8lCEVeHNYPEwew0pytEHNUhtTMtI1RlT4reakw1ZacbMrUeO
 p8oo/DS2H5bzG9Bs7+4WJPBI+5Gy/0yFXsXoMsxZqS1I5CmtWmkZualXKfW6rNOS6fhh08kU
 ydyCPuFp7Vrlt/ulJJVwTHdCSpakdMn0f4v5KE02cq7ZV/v1lslOxdL8ITFTLD1brQxqDq0M
 zFbvjf4laZ2BCezN9388dFDj6bSquxMbY7vXnj86Lfvt3wxs2vXadiNhTzTxFgg7fJqzzjV9
 L1421NVbFxuPVZVsiB1wz/fvMqyaWd36uanw3vY2NZ8tl/zsTV6//kB6leW22RVcTHJqabNB
 t20zZTLr/gX+XJbcMAMAAA==
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

