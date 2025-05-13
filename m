Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C93BAB51F7
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F17410E551;
	Tue, 13 May 2025 10:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A76A10E379
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:08 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-bc-682319efd1c9
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
Subject: [PATCH v15 16/43] dept: apply sdt_might_sleep_{start,
 end}() to hashed-waitqueue wait
Date: Tue, 13 May 2025 19:07:03 +0900
Message-Id: <20250513100730.12664-17-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbWxLYRTHPc+9vfe2W7mp4dokrCISYsxbTgTxzfVBQiyREKGxS8tWS0ut
 QqzMwmYzYkb3otusm62zapdg1plJy2ammL3Ziw2jsa1JaZltaL18Ofnlf05+53w4DCF7LIpk
 VOrDgkatSJBTElIyEl68xDt7vnJZmmcF+L+eJSG/2kKB+1YlAkuNAYPHuRE6AsMIxp89JyA3
 x42gaKCXgBpXHwJH+SkKXr2fCm1+LwVNORkUnC6ppuDF5wkMPVcuYai0bYZ+8xAJT7OLMeR6
 KMjLPY2D5ROGMXMFDeaUBTBYbqRhYiAWmvraReDoXgzXCnsoqHM0keC6O4jhVW0+BX2WXyJ4
 6npCQiArCtwXM0VQNVpMweeAmQCz30vDywYTBpdpJlhTg8K0Lz9F8DizAUPajdsY2rruI6g/
 +xaDzdJOwSP/MAa7LYeAH2VOBINZIzScOT9GQ54hC0HGmSskpPasgvHvwc0FX2PBcN1KQtVk
 O9qwjrcUWhD/aNhL8Kn2o/wP/2uKdwRMJN9czPH3jL00n1rfTfMm2xHeXr6IL6nzYL7I5xfx
 topzFG/zXaL59JE2zI+2ttJb5uyQrI0XElQ6QbN0/R6JsqblHErqZ5JL3NVECuqn0pGY4diV
 XH1zM/2fzfkdOMQUu5Dr7BwjQhzBzuPsmUOidCRhCLY9jOso6EKhxnR2F/cx51twiGFIdgFn
 rFsTiqXsaq529DL665zLVVob/njEwXyyrJUMsYxdxWWbKsmQk2PzxNwnb+m/I2ZzD8s7yWwk
 NaEpFUimUusSFaqElTFKvVqVHLP3UKINBd/LfGJi513kc29rRCyD5OHSJ55opUyk0Gn1iY2I
 Ywh5hNRwJxhJ4xX6Y4Lm0G7NkQRB24iiGFI+S7o8cDRexu5XHBYOCkKSoPnfxYw4MgUV+JbH
 dOOZb23fdq8wLcObwkY/tGie6QXdjO3c1QvjTm1/n6+77rnOaU802Pf3nlpYFmWMc4cZ4yI2
 zXtXWhW9xeHYU3U72Vo6YFFPmV94IGMopWjxzshbJ2upaeFOe7TsuLWLQeM7urY+SDp4TO/p
 cbW8nvXxzU28Txx3efqkS05qlYrYRYRGq/gNiTI3HFoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSaUxTaRSG/e5OnZorEuZaBpcaYoJRbLTkRI3RH4YvY9x+mWhUGr3SKqBt
 gQEnZsACCk4ZIFaUzQqmIBTBC4mo1BAQlMGpnQFBHRYlE5SwNKm0yubYavxz8uR5T97z53Bk
 8G1awekSk0RDoiZeycgo2d6tpvXu5Wu0G689Cwfv9CUKSuvtDLju1CKwN2UQMNYRA/2+CQRz
 fz0nocjiQnDz7SAJTZ1DCBzVFxjo+W8J9HrdDHRZLjNgqqxn4O/xeQIGrhYSUCvtgWHbKAXd
 +RUEFI0xUFJkIvzjPQEzthoWbOkRMFJdzML8WxV0DfXR0F7WRYPj9Tq4Xj7AQIuji4LO5hEC
 eh6UMjBk/5+G7s6nFPjywsBVYKahbqqCgXGfjQSb183CP61WAjqtodCQ6W/N/vCZhifmVgKy
 b90loPfVQwSPLr0hQLL3MdDunSCgUbKQMFvVgWAkb5KFrN9nWCjJyENwOesqBZkDapj75L9c
 Nq2CjBsNFNQt9KEd27G93I5w+4SbxJmNv+BZ7wsGO3xWCv9ZIeD7xYMsznz0msVWKRk3Vkfi
 ypYxAt/0eGks1eQwWPIUsjh3spfAU04nuz/8kGzbCTFelyIaorbHyrRNz3LQ2WEutdJVT6aj
 YSYXBXECv1mwlfYTAWb4tcLLlzNkgEP4VUKjeZTORTKO5PsWC/1lr1AgWMYfEd5ZPvqXOI7i
 I4Tili0BLeejhQdTV9C3zpVCbUPr154gv1+oclIBDubVQr61lspHMitaVINCdIkpCRpdvHqD
 8bQ2LVGXuuH4mQQJ+R/Idn6+oBlN98S0IZ5Dyh/kT8dWa4NpTYoxLaENCRypDJFn3PMr+QlN
 2jnRcOaYITleNLahMI5S/ij/+aAYG8zHaZLE06J4VjR8TwkuSJGOemP36mN/XVOfE6XYvdNd
 MJv0+Ld9o58GTbtMSdez1Qqp3FO1Y1P/+cowZ2iJc8483nQy7l/T0j+OvtEYXO/xqfCIuslU
 H5+1UGg5YNHXqc3RoioibtnhA4rd637Sb5WSFSuizfootapDf3Em9JS+NCbV45mOjvFNpH92
 bLrWvVxJGbUaVSRpMGq+AKEJfCU8AwAA
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

