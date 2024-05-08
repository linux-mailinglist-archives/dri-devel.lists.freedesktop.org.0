Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B468BF9F7
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DA710FA58;
	Wed,  8 May 2024 10:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE30E113537
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-06-663b4a3a89ab
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
Subject: [PATCH v14 15/28] dept: Apply sdt_might_sleep_{start,
 end}() to dma fence wait
Date: Wed,  8 May 2024 18:47:12 +0900
Message-Id: <20240508094726.35754-16-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSfUzMcRwHcN/v77Gb47fT5id/4LaYkKfio8yY4TebsTF/sMVNv6ubntxd
 nWy20uWh1NIkKlxlp9URvzzk4exk14PIIUkqapT0xHHHVTvuNP989trn4f3XhyUUEhXEahL0
 ojZBFaekZaRseGrpkoitkepl7vyFcOb0MnD9PElCSbWFBsf1KgSWW+kYBuxb4K17CMH48xcE
 FBY4EJT2dBFwq74bgbXiGA2vP02DVtcoDU0F2TRklFfT8HJwAkPnuXwMVdI2aM4rw2Dz9JNQ
 OEBDcWEG9pUvGDzmSgbMacHQW1HEwETPcmjqbqPA2rEILlzqpOGhtYmE+tpeDK/vl9DQbflD
 QXN9IwmOMzkUXBspo2HQbSbA7Bpl4JXNhOGG0Rd0/IeXgoYcG4bjV25iaH33AMGjkx8xSJY2
 Gp64hjDUSAUEjF21I+jNHWYg87SHgeL0XATZmedIMHaGw/jvEnr9GuHJ0CghGGsMgtVtIoWn
 Zbxwr6iLEYyPOhjBJCULNRUhQvnDASyUOl2UIFWeogXJmc8IWcOtWBhpaWGExvPjpPCptRDv
 CNojWxstxmlSRO3SdftlsWP3MnFSuvxwQ1Y6kYY+y7JQAMtzYXztq6/kfzvysrHfNLeAb2/3
 EH4HcnP5mpw+ym+CG5LxV1o2+z2D281L9Rd9tyxLcsF80zODn3JuFW9zspOJc/iqG7Z/KQG+
 9rv+EeS3ggvnH2QUMZM7P1l+sHrXpGfxjyvayTwkN6EplUihSUiJV2niwkJjUxM0h0MPJMZL
 yPdJ5qMTe2uR07GzDnEsUk6V22ZGqBWUKkWXGl+HeJZQBsrtJ1arFfJoVeoRUZu4T5scJ+rq
 0GyWVM6Ur3AbohVcjEovHhTFJFH7f4rZgKA0pN+QmNSzIsIcnG9SR2a92eRdTIeEiR3rdJ+/
 77sc6f1210AH3AX90fDAxvhig/VOH8Xd9hRturyyrW9eDuM8O7rxVEF5cp73l2x+rhFFfV0V
 Eaz98CfDLor2tHLveO6xscEymP7re9ePQzetFjZqTHG/WR0VSr236xtitsesUZK6WNXyEEKr
 U/0FanoJeUUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0iTYRTA8Z7nvTpavCyhF4WKkRTZxSjr1KL6VA9F1w8JQpdRr7mcU7bU
 NAPNS+WtGU3LXM0LS3RlTqGrMTQvy7KVYmU20ywTlwNrkhcqV/Tl8OMc+H86PKUwMUG8RndK
 0uvUWiUro2V7VBkrN+1URYXl9s6Hwrww8P24QENprY0F150aBLaGdAwjLTvgzYQHwfSLlxQU
 m1wIygY+UNDQ6kbQWHWOha6hedDt87LgNOWykFFRy8Kr0RkMfUWXMdTYd0OHsRyDY3KYhuIR
 Fq4XZ+DZ8RXDpLWaA2taCAxWlXAwM7AGnO4eBprNTgYae0Ph2o0+Fh43OmlovT+IoethKQtu
 228GOlrbaXAV5jNwe6ychdEJKwVWn5eD1w4LhruZs7Xs778YaMt3YMiurMPQ/e4RgicXPmKw
 23pYaPZ5MNTbTRRM3WpBMFjwjYOsvEkOrqcXIMjNKqIhsy8cpn+Wsts2kWaPlyKZ9UmkccJC
 k2flInlQ8oEjmU96OWKxJ5D6quWk4vEIJmXjPobYqy+yxD5+mSM537oxGevs5Ej71WmaDHUX
 433BkbLNxyWtJlHSr95yVBY99SALx6fLT7flpFNp6LMsBwXworBOdBlzsd+ssFR8+3aS8jtQ
 WCzW539h/KYEj0ys7Nzu93zhoGhvNdM5iOdpIUR0Pk/yUy6sFx3j/L/iIrHmruNvJWB2/W54
 DPmtEMLFRxklnBHJLGhONQrU6BJj1Rpt+CpDTHSyTnN61bG4WDuafRbr2ZnC++hH144mJPBI
 OVfuYlVRCkadaEiObUIiTykD5S3nN0Qp5MfVySmSPu6IPkErGZpQME8rF8h3RkhHFcIJ9Skp
 RpLiJf3/K+YDgtLQp5PHZvqX3azr3wu22v2rjX09eaqw0P5UTaU52LDLczL1ZzkfI1OkRC61
 nHvuDTXVaF8cXmluO6QuUGW/j/AuvBKMqag3DQkKY1HSpUNttrVbxweEr2WBqSSkx+yutfZu
 rBi+F3HpQMrIkLT3k0E3Nfpleom2zl0mr1pxJjnuqZI2RKvXLKf0BvUfj5YZAigDAAA=
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

Makes Dept able to track dma fence waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0393a9bba3a8..d6f9b339b143 100644
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

