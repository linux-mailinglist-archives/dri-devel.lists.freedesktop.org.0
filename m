Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2783A95A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E76F10F71E;
	Wed, 24 Jan 2024 12:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id A5E7F10F72D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:10 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-35-65b0fbb6fc5a
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 15/26] dept: Apply sdt_might_sleep_{start,
 end}() to dma fence wait
Date: Wed, 24 Jan 2024 20:59:26 +0900
Message-Id: <20240124115938.80132-16-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSW1BMcRwHcP9zb7XmzLqdynXNjpmMyxrMT2PIA04PGoZB9cCODrujFhvV
 MlHaqFW5TUU3tbLWlsouKaxJphKVpYZsabRTdI/YRheXlvHym8/8Lt+nH4NLKkhvRqU+JmjU
 ijApJSJEA575S8vGS4UVjTo/uJS8AlzfEwnILimiwF5ciKDoXhwGPdVb4N1IP4Lxhlc4ZKTZ
 EeR3fMDhXk07ApvpDAVNndOg2TVEQV3aeQrib5RQ8LpvAoO29MsYFFq2wsuLBgwqRz8TkNFD
 QVZGPDZZujEYNZppMMbKwGnKpGGiQw517W9JsDmWwLXcNgoe2+oIqCl3YtD0MJuC9qLfJLys
 eU6A/VIKCXcGDRT0jRhxMLqGaHhTmYdBqW4y6Oy3XyTUplRicLbgLgbN7x8heJL4EQNL0VsK
 nrn6MbBa0nAYu1WNwJk6QENC8igNWXGpCM4npBPw6mctCbq21TD+I5vy9+Of9Q/hvM4axdtG
 8gj+hYHjKzI/0LzuiYPm8yzHeavJl7/xuAfj84ddJG8xJ1G8ZfgyzesHmjF+sLGR5p9fHSf4
 zuYMbJtPsGhdqBCmihQ0y9fvEylTWxvRkThxtOU6HYu6RHrkwXDsKi69tx79t6E6AXebYhdz
 LS2jfz2DXcBZUz6ReiRicPbcVM70pYHSI4aZzu7iTH073DsEK+MKvr6g3Raza7ghVy/+L3M+
 V1ha+dcek/071xyE2xJ2NffRfIF2Z3JsvAfXcdNJ/zvw4p6aWoiLSJyHppiRRKWODFeowlYt
 U2rVquhl+w+HW9DkQxljJkLK0bB9RxViGST1FPubSwQJqYiM0IZXIY7BpTPELV7FgkQcqtCe
 EDSH92qOhwkRVciHIaSzxStHokIl7EHFMeGQIBwRNP+nGOPhHYtSCwOaSkLG5FcOaNf6+Hnl
 dA5oF0Jgr+yBv+3rvpPBZdJ665hj02nrnk3MbbHBWRxU9z5Qbr/fqgv2PCWbrSuIDIq5Kquo
 LY6ex27flax2ytUBcaG5c4Wj7UmEsq90w/WbuYtyujbvnNetfOc/p2tmcGDAXt9p+vRZG2+d
 ++GA3VIiQqmQ++KaCMUfAxQQ8EwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSf0yMcRwHcN/nd6ezx7nNI4admVUkm/hs0rLZPLMxw5gfm57pUaer7K6O
 DCt1J0eptiRFp3LO3alcNFKtdfo9iRpJWhqSfhzqmnMdivnns9c+78/ef30YXFZA+jHKuARR
 HSeoFJSEkOzclLqmylMhBrdML4fsy8HgmkwnoLDcRkFnmRWB7UEKBsON2+D11CgCz7PnOOTl
 diK49f4dDg+a+hHUms9T0PVhHnS7nBS05l6iILWknIIXI9MY9F3NwcBq3wHtWcUY1LuHCMgb
 pqAgLxWbGZ8xcJssNJiSV8Kg+ToN0+/XQWv/KxIcN1pJqO0NhPybfRTU1LYS0PRoEIOu6kIK
 +m2/SWhvaiGgMzuDhHvjxRSMTJlwMLmcNLysN2JQkTbTpp/4RUJzRj0G+tL7GHS/eYKgLn0A
 A7vtFQUO1ygGlfZcHH7eaUQwmDlGg+6ym4aClEwEl3RXCXjubSYhrS8EPD8KqfBNvGPUifNp
 lSf52ikjwbcVc/zj6+9oPq2ul+aN9kS+0hzAl9QMY/yt7y6St1suUrz9ew7NG8a6MX68o4Pm
 W655CP5Ddx62a8lBSWikqFJqRfXasAhJdObbDnQiRXrKXkQno48SA/JhOHY9V9yow2dNsau4
 nh73X8vZ5VxlxifSgCQMzl6Yy5m/PqMMiGEWsPs488ie2RuCXcmVfmujZy1lN3BO1xf8X+cy
 zlpR/9c+M/t7+b3ErGVsCDdguUJnIYkRzbEguTJOGysoVSFBmpjopDjlqaCj8bF2NPMyprPT
 2Y/QZNe2BsQySOErDbeUizJS0GqSYhsQx+AKubRnUZkok0YKSadFdfwRdaJK1DSgxQyhWCjd
 vl+MkLFRQoIYI4onRPX/FGN8/JLR/MNLI6u8+bvu6ir2/YzCgw9vVYX2h7qE8pGevf7Hgs+c
 G9dD1UWnPP7axv0Td7mh12FX3Hpv5u1Jw0S7XKJvPzdQV/3DI+R4OzYbDVmDhzYEhhWRCdXp
 q7V94Vbf7BV+x72yjT5hrjm7n24pPeKwObRj/gfGEsmhqtK3D/18JxWEJlpYF4CrNcIfhViG
 ai4DAAA=
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

Makes Dept able to track dma fence waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 8aa8f8cb7071..76dba11f0dab 100644
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

