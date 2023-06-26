Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B973EC79
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4F110E25C;
	Mon, 26 Jun 2023 21:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id ECEC210E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:53 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-fc-64997d6b187d
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 07/25] dept: Apply sdt_might_sleep_{start,
 end}() to wait_for_completion()/complete()
Date: Mon, 26 Jun 2023 20:56:42 +0900
Message-Id: <20230626115700.13873-8-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0wTWRSAvXdm7kwrxXHQdUSDpgaNbBZxRT3xHU10YlyzCf80Zrexk21D
 qaZIAY0JVDSKgA+ClYeKZVMQWMWCikKRRXn5oi4EqanNwpqFCkiCFq3go9X45+RLzne+X4ej
 hCYmktMbD8gmo8agJkpaORpm+8lwuFAb1/FfGJzJiQP/2+M0lFyrJuC6WoWgui4Tg691Gzyb
 GEEw+biLAmuBC8Hl/hcU1LV5ETgrLAS6X4ZDj3+MQGfBSQJHyq4ReDo8hcFz7iyGKscv8PC0
 DUNzYJAGq49AsfUIDo4hDAF7JQv2jGgYqChiYap/OXR6exlwPv8RCi96CDQ6O2loqx/A0H2n
 hIC3+jMDD9s6aHCdyWXgr9c2AsMTdgrs/jEW/mkuxVCTFQy9mnJiOPbmEwPtuc1B+vM6hh53
 A4Km4/9icFT3ErjnH8FQ6yig4EN5K4KBvFEWjuYEWCjOzENw8ug5Gro+tjOQ5VkJk+9LyKa1
 0r2RMUrKqk2VnBOltPTAJkq3i16wUlbTc1YqdaRItRUxUlmjD0uXx/2M5Kg8QSTH+FlWyh7t
 wZKnt5FIr588YaWO85P0r/N3KddpZYPeLJuWbfhdqRt2jrL7785Mu+C6z2aguvBspOBEPl48
 cdfOfOe8Ri8dYsIvEfv6AlSIZ/ELxdrc/4OOkqP4suniYMd9NhtxXASvE9utiSGk+WjRkrco
 pKv4lWKxLx9/Sy4Qq2qav2YU/Cqx4ZENhVgIOhZPCwklRT5fIX6cHKS/HcwV/67oo08jVSma
 VokEvdGcpNEb4mN16UZ9WuzefUkOFPwq++Gp3fVo3JXQgngOqcNUcVHntQKjMSenJ7UgkaPU
 s1Q/vLdqBZVWk35QNu37zZRikJNb0DyOVs9R/TyRqhX4PzQH5ERZ3i+bvm8xp4jMQGnCou1b
 r86OX3qqfNOQ111UcyeyIYJ/xM2u3/vWGLMhqnBj4e7M/pkzfN05CbSQeGvbxZrWl3veWHcM
 da3enhAetTHCycTO2TyQv+TmmiJL30HSv97dZYo0+y7N8+6MXqEIuG+8WydYdqa4dery1MVm
 7SH87PaNrdmWLSuom1c+pavpZJ1meQxlStZ8AYYYLbRRAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTZxzGfd9zpVpzrGQ70+iWGmbCNoRkLP8EYvxgwhsTCS5EE2OinT2x
 DVBNy3ULCxRQVoUIBst1KcVUhDpYSyJKqwSQy0ToBJmTyoS4YVcuCbOEjoq2Gr88+SXPk9+n
 h6cUFmYHr9VlS3qdKlPJymhZalLJVxmFdep493QcVF2Kh8CrchoaO+wseH5pR2DvKsbgu58C
 f6wuIFh/OE6BucaDoHn2GQVdgzMI3K1GFiZebIXJwDILIzUXWShp6WDhd38Ig/dqNYZ2x2F4
 cNmKoTc4T4PZx0KDuQSH4yWGoK2NA1tRDMy11nMQmk2AkZkpBvqbRhhwP/0C6n72suByj9Aw
 2D2HYeJOIwsz9jcMPBgcpsFTVcHAzSUrC/5VGwW2wDIHj3otGDpLw7Z/Q24M5//bYGCoojdM
 137FMPlnD4K75c8xOOxTLPQHFjA4HTUU/H/9PoK5ykUOyi4FOWgorkRwsewqDeOvhxgo9SbC
 +lojeyCZ9C8sU6TUmUfcqxaa/GYVye36ZxwpvfuUIxZHDnG2xpIWlw+T5pUAQxxtP7HEsVLN
 EdPiJCbeKRdLlsbGODJcu06n7TouS1ZLmdpcSb9v/ymZxu9e5M7d25bf5BngilDXVhOK4kXh
 a7HSNUNHmBX2ik+eBKkIRwufic6KfxgTkvGU0LJZnB8e4EyI57cLGnHInBFBWogRjZV7InO5
 kCg2+K7g98pPxfbO3neaKOEbsWfUiiKsCG+M3j72MpJZ0KY2FK3V5WaptJmJcYYMTYFOmx93
 +myWA4V/YysMVXWjVxMpfUjgkXKLPH53rVrBqHINBVl9SOQpZbT8ozWzWiFXqwq+l/RnT+pz
 MiVDH9rJ08qP5YeOSacUwhlVtpQhSeck/YcW81E7ilA2/iTQZFtT5M+lpfr1BX9X9QSNLToy
 O/Gt74Znant62cnj6ZoX1F+PX36Z0J13PqbrwHzzeHaeufqG1TV2dLTZ9FDv3J3y+U2j/8St
 nluHpjeX/Di6b4C6Xu9MXklL2mUvzzmi+a7wynNe+XiobuPC9MYPb5JOHBxrV4T2PvK3xaYr
 aYNGlRBL6Q2qt1umRrEzAwAA
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 26 Jun 2023 21:03:34 +0000
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
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, paolo.valente@linaro.org,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
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

