Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C018BFA0A
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D12113541;
	Wed,  8 May 2024 10:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D0DD113527
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-c5-663b4a39573f
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
Subject: [PATCH v14 11/28] dept: Apply sdt_might_sleep_{start,
 end}() to wait_for_completion()/complete()
Date: Wed,  8 May 2024 18:47:08 +0900
Message-Id: <20240508094726.35754-12-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0yTZxQAYN/3u1Kp+awYP1jGZo0xwYiwwHa8xC0uGe+cM9P5S3/MBj6k
 sQVTFOzMJlhQ7gEmdhTcuJiuQrVSunhFKwYEzKBOwpBgh42g1QJJtYRKo2ud/jl5cm45Pw5P
 KRxMHK/OPiTpslUaJSujZdPRzes2btuUmVT2NBpqKpIg8LKEhkablQXXhXYEVkchBm9PGvwz
 50Ow8NcQBcY6F4LmRw8pcPS6EXRZjrNw//ESGA7MstBfV86CodXGwr3nIQzjp2sxtNu/hbvV
 LRicwSc0GL0sNBgNOByeYgia2zgwF6wGj8XEQehRMvS7RxjoGlsL9b+Ns3C9q5+G3sseDPev
 NrLgtr5h4G5vHw2umkoGzs+0sPB8zkyBOTDLwd/OJgwXi8KLTrx4zcCdSieGE2c7MAw/uIbg
 RskEBrt1hIXbAR+GTnsdBa/+6EHgqZrmoLgiyEFDYRWC8uLTNBSNp8LCfCP7xQZy2zdLkaLO
 fNI110STgRaRXDE95EjRjTGONNkPk05LAmm97sWk2R9giL2tlCV2fy1HyqaHMZkZHORI368L
 NHk8bMTfxe2Rbc6QNOo8Sbd+yz5ZVr97kjl4c+mR0OtjBcixpAxF8aKQIpqe/UK/t6HbxkXM
 CmvE0dEgFXGM8LHYWTnFREwJPpl4dvCriJcJWeL80E0cMS2sFuvL/3w7Kxc+FU8Z5qn/d34k
 tl90vnVUOP/gyQyKWCGkitcMpnC/LNzzhhenCi+9OyJWvGUZpauRvAktakMKdXaeVqXWpCRm
 6bPVRxLTc7R2FP4l80+hvZeR3/V9NxJ4pIyWO1dszFQwqrxcvbYbiTyljJH3nPwsUyHPUOl/
 lHQ5P+gOa6TcbvQBTytXyD+Zy89QCPtVh6QDknRQ0r2vYj4qrgDVedom/Wdi6zX7gtLAJeuz
 k2lkW1KOr9Zna4wfm4zXL5/Z4u0QV626sjWUprXk+z886u1oXbd9rT7Qap06tUwjpQ99/o1j
 V3A2IXHn7tKvUyZaXsROxAiu33d8uf9cxfzi4gPpyaXHbLIpi0n788q+TbXu40P/GgdiPLCj
 2pjQwyvp3CxVcgKly1X9B41FmvJHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSbUhTYRQH8J7nvs3R6rasbhoYA+mNzF7UU0ZEUF2UpA+RIEXd6qqrabap
 aRBZUzPNSMktzUKtlqhlTQPTfGHicka63DANlZTKLN9IZzOX5Yq+HH6cP+f/6UgIuY7ykihj
 40V1rKBS0FJSGhas3bg9JDjS35y/FXKu+4NjKoOEwsoKGqxPyhFUVF/GMNyyH95NjyCYfdNB
 gD7PiqB4oI+AanM/gvrSKzTYPi4Cu2OcBkteFg3a+5U0vP3mwtCry8VQbjwAr2+WYGiaGSJB
 P0zDHb0Wz48vGGYMZQwYUnxhsLSAAdfAZrD0d1HQfNdCQf37DZB/r5eGl/UWEsw1gxhstYU0
 9Ff8puC1uZUEa042BY/HSmj4Nm0gwOAYZ6CzqQjD09T5tvTJOQpeZTdhSH/wDIO9pw5BQ8YH
 DMaKLhqaHSMYqox5BPx81IJg8MYoA2nXZxi4c/kGgqw0HQmpvQEw6yykd+/gm0fGCT616jxf
 P11E8m0lHP+ioI/hUxveM3yRMYGvKl3P3385jPni7w6KN5Zdo3nj91yGzxy1Y36svZ3hW2/P
 kvxHux4f9I6Q7jwlqpSJonrTruPSaEv/JyqucUmSa+5SCqpelIk8JBy7jdOaKhm3aXYN1909
 Q7jtya7mqrI/U24T7IiUe9C+z+2lbDTn7GjEbpOsL5ef9fzvrYwN5G5pncS/Th+u/GnTX3vM
 73uGxpDbcjaAq9MWMDeRtAgtKEOeytjEGEGpCvDTnIlOjlUm+Z08G2NE899iuOjKqUFTtv0m
 xEqQYqHMSgdHyikhUZMcY0KchFB4ylquBkXKZaeE5Aui+uwxdYJK1JiQt4RUrJCFhIvH5WyU
 EC+eEcU4Uf0/xRIPrxQU7nSOBhqPdnakhPSsPbTOJ0zVtS60wfVLf6A7N792cWTQ88yBV3uW
 5bW27dXfjb83MRdy5O2EzRpqPmH/6ji90mvL8GTNgqGksCBSWBWcWKb7sUrYuDw3PS5U5tiT
 eRJ/nTzHXe1x9m5q7BvtTHtmmjq8dSJqu201266bdF6IeOijIDXRwub1hFoj/AFChrUtKQMA
 AA==
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

