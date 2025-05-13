Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBCAAB51F4
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED33110E37F;
	Tue, 13 May 2025 10:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31F2710E551
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:08 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-9c-682319ef5bc7
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
Subject: [PATCH v15 14/43] dept: apply sdt_might_sleep_{start,end}() to swait
Date: Tue, 13 May 2025 19:07:01 +0900
Message-Id: <20250513100730.12664-15-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX8P39+v4/g5Lb88TK41EyJP+zBPY+OHMdOYeRg395u7dZVd
 KjW2jvIQPXg4TZTrypU6ymVDLlK6VEopidVRLG5KxJ1SHu6Yfz577f35fF6ffz4sKauiJ7Dq
 8AOiNlyhkWMJJekdZZzV5+uvmmOv9gPntxMUXC4yY2i8UYjAfEtHgKNqDbxw9SAYqn9KQrq+
 EUF2ZwcJt2x2BGX5RzA0vxsNLc4+DDX6UxiO5hRhaPo4TED7hbMEFFo2wGtTNwV1aUYC0h0Y
 LqUfJdzlAwGDpgIGTPEB0JWfwcBwZzDU2FtpKHs1Ay5mtWOwltVQYLvTRUBz6WUMdvNvGups
 jylwpUyExjPJNFz/ZMTw0WUiweTsY+BZuYEAm8EHihPcwmNff9FQnVxOwLHcmwS0vLyH4P6J
 NwRYzK0YKp09BJRY9CT8yKtC0JXSy0Di6UEGLulSEJxKvEBBQvsCGBpwX878Fgy6K8UUXP/Z
 ilYsFcxZZiRU9vSRQkJJjPDD+RwLZS4DJdQaeeFuRgcjJNx/xQgGS5RQkh8o5FgdhJDd76QF
 S8FJLFj6zzJCUm8LIXxqaGA2TdouWaIUNepoUTt72R6Jqr/zOb2/ij3YdrWUiUcNOAmxLM/N
 581GvyTk9Re/5BXRHsbcNL6tbZD0sDfnx5ckd7tzCUtyrSP5F5kvkWd3HLeBz6rb50GKC+Cv
 HgHPuJRbyDdV96B/yil8YXH5X42XO/+Z10B5WMYt4NMMhZRHyXPnvPi3uan0vwVf/mF+G5WG
 pAY0ogDJ1OHRYQq1Zn6QKjZcfTBob0SYBbmfy3R4eMcd1N8YUoE4FslHSR87pqpktCI6Mjas
 AvEsKfeW6m67I6lSERsnaiN2a6M0YmQFmshS8vHSua4YpYzbpzgghoriflH7v0uwXhPiUdwW
 +6OdnH/iuvdrH1Z0L7q2efJT7F23LDQkcCBTb5WPvbJeiWqzlB0Ztc9US3xDqCeWjQPT9m6a
 XanTpJYuDZ7y/YNkSK9XkSN9DuUWnZyXnX7ejx/zeVuTNS4oB6+a7nP7s23rakfBqmH/lbsW
 xhhmpi4vj/31oF4NUQFdh6yLj8upSJUiOJDURir+ABpoeWlYAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX8P39+vc2e/JfyI4cxsTLSJzzy0Nhs/kvGXeZo7+q07rsMd
 kc30cCylhCVPnRNdqcvlzibpcruU0qRUJ7f0NENcmnRH5OGO+eez117vz96ffz4sGVpCT2PV
 2kOiTqvUyLGEkmxckb5waOoc1WLPBSn4RjIouGa1YGi5U4bAci+VgIG6tfDS70Xw49lzEvLz
 WhDc6HtNwr36bgSOkjQMbW8mQLtvCENjXhaG9JtWDK0fxwjouniegDJbHPSY31LQlFtIQP4A
 hqv56URgvCdg1FzKgDllLvSXXGFgrC8SGrvdNNQWNNLg8CyAy8YuDNWORgrqK/sJaKu6hqHb
 8puGpvoGCvw54dByLpuG8k+FGD76zSSYfUMMvHCaCKg3TYYKQ6D11JdfNDzJdhJw6tZdAtpf
 PURQk9FLgM3ixlDr8xJgt+WR8L24DkF/ziADJ8+MMnA1NQdB1smLFBi6ouDHt8DlgpFISL1e
 QUH5TzeKiRYsRgsSar1DpGCwHxG++zqw4PCbKOFpIS88uPKaEQw1HkYw2Q4L9pL5ws3qAUK4
 MeyjBVvpaSzYhs8zQuZgOyF8am5mNs3YJlkZL2rUSaJuUbRCohru66AP1LFHO4uqmBTUjDNR
 CMtzS/jPxVY6yJibx3d2jpJBDuNm8fbstwEvYUnOPZ5/WfAKZSKWncjF8camhCBS3Fy+KA2C
 6zJuKd/6xIv+Vc7kyyqcf2tCAv5ncTMV5FAuis81lVG5SGJC40pRmFqblKhUa6Ii9PtUyVr1
 0Yg9+xNtKPA/5uNj5yrRSNtaF+JYJJfKGgZmq0JpZZI+OdGFeJaUh8lS7weULF6ZfEzU7d+l
 O6wR9S4UzlLyKbL1W0RFKJegPCTuE8UDou5/SrAh01JQzSpFe/huXYbz0YQW1+r4rfkHz8g8
 pGyl9HeVQbFsDdYqLjXEvstLk9r81qLexfqdk25XfN2YEBMR6z6b6bnT4Ynd/jgqYfPzZ8Zf
 nk29neXuMFdPT/SGvuQZrZVuLFu+V9M2vTDrxOA6e9dMb/Wlmjj9h5gjzu5vO6TpDuvUfqOc
 0quUkfNJnV75B8OURQw7AwAA
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

Make dept able to track dependencies by swaits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index d324419482a0..277ac74f61c3 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -6,6 +6,7 @@
 #include <linux/stddef.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/dept_sdt.h>
 #include <asm/current.h>
 
 /*
@@ -161,6 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
+	sdt_might_sleep_start(NULL);					\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
@@ -176,6 +178,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 		cmd;							\
 	}								\
 	finish_swait(&wq, &__wait);					\
+	sdt_might_sleep_end();						\
 __out:	__ret;								\
 })
 
-- 
2.17.1

