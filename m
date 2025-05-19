Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2EABB89F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755BE10E388;
	Mon, 19 May 2025 09:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9D6410E24F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:43 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-a4-682af76e43e1
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
Subject: [PATCH v16 13/42] dept: apply sdt_might_sleep_{start,
 end}() to wait_for_completion()/complete()
Date: Mon, 19 May 2025 18:17:57 +0900
Message-Id: <20250519091826.19752-14-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTH9zz39t5LZ/Xaod6BZqzxFSOKojnZpjHGZY8mbMaRJc4P8zpu
 druValpBWLKNjkK0CPGtoKKsFlOatghrTWRqCYOAMAPr8IrQIFM2iUSQCLQMYW4F45eTX845
 /9/5cjhKe1uVwOmNRySTUTToGDWtHpnnXGecTJY39JQuh8jEMRou1voYCF31IvBds2AYavkI
 7keHEUx3/E5BuT2E4PKjBxRca+1HEHT/yMDdv+eDEhlloN1ezEBBVS0DfzydwdBXdhqD158O
 f7oGabhz0omhfIiBivICHCtPMEy5PCy48lfAgPsCCzOPUqG9v1sFwfBaOF/Zx8CtYDsNrfUD
 GO7euMhAv+8/FdxpbaMhWpoIoVMlKqh55mTgadRFgSsyykJXowNDq2Mx1FljwqLxlyq4XdKI
 oejKzxiU3psIGo49xOD3dTPQHBnGEPDbKXhR3YJgoHSEhcITUyxUWEoRFBeW0WDt2wzT/8Qu
 X5pIBctPdTTU/NuNtm8lvkofIs3DoxSxBo6SF5F7DAlGHTT5zSmQXy48YIm1IcwShz+bBNzJ
 pOrWECaXxyIq4vccZ4h/7DRLbCMKJs86O9k9Sz9Xf5ApGfQ5kmn9tgNqebrJhg8HF+Y+uRdC
 +Sgw34biOIFPE5wtN6nXXHBiEM0yw68Senqm5vrxfJIQKBlU2ZCao/juN4X7l3rnlt7iZeGU
 vYqdZZpfITy+0hZjjtPwW4Si6ytfOd8RvHWNc564WDtc3DwX1fKbBcVbSc86Bb4iThhVXrKv
 Am8Lv7p76JNI40BveJBWb8zJEvWGtBQ5z6jPTfnyUJYfxd7L9d3M/no0Fvq0CfEc0s3T1AXX
 yFqVmGPOy2pCAkfp4jWewGpZq8kU876VTIe+MGUbJHMTSuRo3RLNxujRTC3/lXhE+kaSDkum
 11PMxSXko2VtwarkFMb6mKOaTQcXTe7tqH6eJH8ibhW2LFqdF1bSf9jpsHTYupSMsc9qPuxa
 suPc2gXbJhzjSbkG847wROL6so74dHd/b+/XmQ2WNFKbsvv7eGVPtlK9a+b9xfJf19/L+HgS
 nx2ub9ugT9jnWXfGC+PLVoo1V1sKM97dtMDeqaPNspiaTJnM4v/IgWivWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxTH9zzvlWrJa0V9I3FbOtkcDFaimBM1xLkYnyxx2TcTv8wqb2xj
 KaRVpCYq2EKwCAGTFpXLCjSVQbmsJRleylgZ1c6JXCooQxSCBCJKghRF8FIwfjn55fzP+Z0v
 h6cUvzMbea3+uGTQq3VKVkbLft5pTtS/iteobMUyCM8V0FDR7Gahp6kBgbs1F8NU1z4YnJ9G
 sHj3HgVlth4E1aOPKGgNjCDw1Z1joX88GkLhGRaCtkIWzLXNLPQ+W8IwbL+IocGzHx67Jmi4
 U1KDoWyKhfIyM46USQwLrnoOXDlxMFZ3hYOl0WQIjgww0FkZZMA3lACXq4ZZuOkL0hBoG8PQ
 f72ChRH3ewbuBG7TMF8cCz2lRQw0vqhh4dm8iwJXeIaDvg4HhoBjPbRYItb8l+8YuFXUgSHf
 +QeG0MMbCNoLnmDwuAdY6AxPY/B6bBS8udqFYKz4OQd5FxY4KM8tRlCYZ6fBMpwCi68jlyvn
 kiH3txYaGt8OoN2pxF3lRqRzeoYiFu9J8iZ8nyW+eQdN/q0RybUrjzhiaR/iiMNzgnjr4knt
 zSlMqmfDDPHUn2eJZ/YiR6zPQ5i86O7mftl0ULYrTdJpsyTD96mHZJpFvxVn+tZkT97vQTnI
 G21FUbwobBPNFybQMrPCN+KDBwvUMscIX4reognGimQ8JQysEgcrH64MrRU0YqmtlltmWogT
 nzpvR5jn5cJ2Mf/Prz86vxAbWjpWPFGR9lBh58qqQkgRQw1VdAmSOdBn9ShGq89KV2t1KUnG
 YxqTXpuddCQj3YMiD+Q6vVTahub69/mRwCPlanmL71uNglFnGU3pfiTylDJGXu/dolHI09Sm
 U5Ih41fDCZ1k9KNYnlZukP90QDqkEI6qj0vHJClTMnxKMR+1MQflv8pzdv/N6kx7MlWXNs3G
 SRomsfXHrvH/3QmmJ18xaUOLTZ7RaWe7dLZ1whm95od1ZpWpuuRdwa5AwKo6nNWU2rg/ru1w
 KDaI24823zqTtGXr5b0laxNtvXfRjVVocLxg82QGcR+4/p89z96XvQNZ/+m2+PZGv/Zf/fw7
 e4LqLyVt1KiT4ymDUf0B+5bOWzwDAAA=
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

Make dept able to track dependencies by wait_for_completion()/complete().

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

