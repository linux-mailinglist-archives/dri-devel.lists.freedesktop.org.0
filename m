Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75EABB878
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D798210E2A4;
	Mon, 19 May 2025 09:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E7D010E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:45 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-e4-682af76e80fc
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
Subject: [PATCH v16 17/42] dept: apply sdt_might_sleep_{start,
 end}() to dma fence
Date: Mon, 19 May 2025 18:18:01 +0900
Message-Id: <20250519091826.19752-18-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTHfe69vfe2o3rtnLvTJWod6NiGYmA5BjX7Ynw+uGSLiYnug1a5
 2ma0kPJeMwOzKiuCikF8oV0pWpu2AraNQaHASujsCK6bWKBDVGJUYmsTRutAfGln/HLyy/mf
 8ztfDkvK/KJlrEpTImg1igI5LaEk0bSWrzQvMpXrY715EJ+poaC53UlDsM2BwOmpJmBqYBuM
 JCIIXg79SUJTYxBBy8N7JHj8Ewi8tp9puPNoIQzHYzQEGmtpONLaTsNfz+YJGD/bQIDD9S3c
 tz6mYPCUhYCmKRouNh0hkuUpAbNWOwPWqnSYtF1gYP5hNgQmQiLwhr+A86ZxGrq9AQr8nZME
 3LnZTMOE840IBv23KEjUL4fg6ToRXH1uoeFZwkqCNR5j4O8+MwF+81Lo0CeFx/59LYLf6/oI
 OHbpGgHDY10IemoeEOByhmjoj0cIcLsaSZi7MoBgsj7KwNETswxcrK5HUHv0LAX68Vx4+V/y
 snEmG6p/7aDg6qsQ+mYzdpqcCPdHYiTWu8vxXPwujb0JM4X/sPD4xoV7DNb3hBlsdpVity0T
 t3ZPEbhlOi7CLvsvNHZNNzDYEB0m8PPbt5nvPt0t2ZQvFKjKBO26LXslyq7jl8miZmnFU89J
 pgrNSwxIzPJcDu8zGpn33Hs3TKWY5tbwo6OzZIqXcCt5d91jkQFJWJILfcCPGMeQAbHsh9z3
 fPR4XgopLp0/N5CWGpdyX/PG1h7ynXIF7+jo+5/FyX64th+lWMbl8sMOE5VS8twZMW8ZHKHe
 LXzC/2YbpU4hqRktsCOZSlOmVqgKcrKUlRpVRdb+QrULJb/L+tP8D51oOrjDhzgWydOkHd7P
 lTKRoqy4Uu1DPEvKl0jt7rVKmTRfUakTtIV7tKUFQrEPLWcp+cfSDYnyfBl3UFEi/CgIRYL2
 fUqw4mVVSL2x3LY6sPWkmIvq/dmmotgTz6t/8MqaQs1ncupLW++NXQ2bRvY5HHOd16srDqhN
 JQvCi7e3zugWh3RDteflQ+HC8KrEFnNO97pbhhr3oxUvDmXhNt2qvMj1gxken/RwYFfCaJHr
 cs8FQ1t3dnHjGZtDh+0ftY1lRPaoF5VuyJBTxUpFdiapLVa8BfVWACVZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSf0zMcRgHcJ/v774c350b3/m9MyREyJ6pYTZ8/Q5/2Pgjt/rOna7L7ogY
 6+ryo1x+bDlSuYpz6tK5axa5tHIpDVGKlrhmVvTD6OL6gTvmn2evPc+z9/PPw+BSKzmFUWkO
 iVqNQi2nWILdFpG6SPMjRLnE0DUbvANnCMgptVHQeKcYga1Mj0G3ewO0DvYgGH72AgdTViOC
 fM87HMpqOxC4rCkUNH0cD83efgrqszIoSC0speDllxEM2i9fwqDYsRXeWz4R0HChAANTNwXX
 TKmYv3Rh4LMU0WBJngOd1mwaRjxhUN/RQkJNbj0JrrYFcDWvnYKHrnoCass7MWh6kENBh+03
 CQ21dQQMZk6FxotGEkr6Cij4MmjBweLtp+FVlRmDWvMksBv8qae+/yLhibEKg1M37mLQ/LYC
 QeWZDxg4bC0U1Hh7MHA6snAYuuVG0JnZS0PaOR8N1/SZCDLSLhNgaA+H4Z/+y7kDYaC/bieg
 ZLQFrVkl2PJsSKjp6ccFg/OIMOR9TQmuQTMhPC3ghfvZ72jBUNlGC2bHYcFpDREKH3ZjQv43
 Lyk4is5SguPbJVpI723GhL7nz+mo6XvYyFhRrUoUtYtX7WOVFadv4gdzJEe7ys7TyWiETUdB
 DM8t5x+9biMCprh5/Js3PjxgGTeLdxo/kemIZXCuZSzfmvsWpSOGmcjt4HtPRwRIcHP4K+5x
 gXUJt4LPLazE/0XO5IvtVX8d5O+3ZdSggKVcON9cnEdcQKwZjSlCMpUmMV6hUoeH6uKUSRrV
 0dCYhHgH8v+P5cTIxXI00LShGnEMko+T2F3zlVJSkahLiq9GPIPLZZIiZ7BSKolVJB0TtQnR
 2sNqUVeNpjKEfLJk025xn5TbrzgkxoniQVH7f4oxQVOS0Zhd78uHNpfM6OVY92S90zTps7J8
 7rIGo4KLMWxZmRARkpfhC4+MOe7rz/9R53GtDYXtE66cc52Nim5iZnl00tEE9XDf3nurHxdM
 G/VUVbjXd0YciHwgW3DyxcY0tiNlaUpclsmOvurGbm99ykXpox3Z684ncrd/b9spM6qtwQvl
 hE6pCAvBtTrFHwJcWHs7AwAA
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

Make dept able to track dependencies by dma fence waits and signals.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f0cdd3e99d36..5d2fd2f6a46d 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -16,6 +16,7 @@
 #include <linux/dma-fence.h>
 #include <linux/sched/signal.h>
 #include <linux/seq_file.h>
+#include <linux/dept_sdt.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/dma_fence.h>
@@ -783,6 +784,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
+	sdt_might_sleep_start(NULL);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -796,6 +798,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 		if (ret > 0 && intr && signal_pending(current))
 			ret = -ERESTARTSYS;
 	}
+	sdt_might_sleep_end();
 
 	if (!list_empty(&cb.base.node))
 		list_del(&cb.base.node);
@@ -885,6 +888,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
+	sdt_might_sleep_start(NULL);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
@@ -899,6 +903,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		if (ret > 0 && intr && signal_pending(current))
 			ret = -ERESTARTSYS;
 	}
+	sdt_might_sleep_end();
 
 	__set_current_state(TASK_RUNNING);
 
-- 
2.17.1

