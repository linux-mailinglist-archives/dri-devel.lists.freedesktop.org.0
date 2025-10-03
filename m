Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7DFBB6073
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9022C10E70A;
	Fri,  3 Oct 2025 07:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3B6710E79F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 08:28:47 +0000 (UTC)
X-AuditID: a67dfc5b-c2dff70000001609-6d-68de340f44eb
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
 yunseong.kim@ericsson.com, ysk@kzalloc.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com,
 corbet@lwn.net, catalin.marinas@arm.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 luto@kernel.org, sumit.semwal@linaro.org, gustavo@padovan.org,
 christian.koenig@amd.com, andi.shyti@kernel.org, arnd@arndb.de,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org,
 surenb@google.com, mcgrof@kernel.org, petr.pavlu@suse.com,
 da.gomez@kernel.org, samitolvanen@google.com, paulmck@kernel.org,
 frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com,
 josh@joshtriplett.org, urezki@gmail.com, mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com, qiang.zhang@linux.dev, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, chuck.lever@oracle.com,
 neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
 trondmy@kernel.org, anna@kernel.org, kees@kernel.org,
 bigeasy@linutronix.de, clrkwllms@kernel.org, mark.rutland@arm.com,
 ada.coupriediaz@arm.com, kristina.martsenko@arm.com,
 wangkefeng.wang@huawei.com, broonie@kernel.org, kevin.brodsky@arm.com,
 dwmw@amazon.co.uk, shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
 yuzhao@google.com, baolin.wang@linux.alibaba.com, usamaarif642@gmail.com,
 joel.granados@kernel.org, richard.weiyang@gmail.com,
 geert+renesas@glider.be, tim.c.chen@linux.intel.com, linux@treblig.org,
 alexander.shishkin@linux.intel.com, lillian@star-ark.net,
 chenhuacai@kernel.org, francesco@valla.it, guoweikang.kernel@gmail.com,
 link@vivo.com, jpoimboe@kernel.org, masahiroy@kernel.org,
 brauner@kernel.org, thomas.weissschuh@linutronix.de, oleg@redhat.com,
 mjguzik@gmail.com, andrii@kernel.org, wangfushuai@baidu.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, rcu@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: [PATCH v17 17/47] dept: apply sdt_might_sleep_{start,
 end}() to dma fence
Date: Thu,  2 Oct 2025 17:12:17 +0900
Message-Id: <20251002081247.51255-18-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSbUxTZxQHcJ9773NbGqrXauJVmC9VNL6AYtCdGbeoQb0LMTr9YKIxo4Gr
 bSxgWkAgmpQ3JQZRUUCkuiLaEVpobeNGWRFFRQ0irShWBWy11hBgqGtBFOwA47df/ud/zqcj
 JCWdeI5QkZzKq5JlSiktokQDoZWR02J65KvO5yyFgL+AAq3JSEOBpRyDo86AYPhLBQn5tiAF
 /pGXAgg2tiAodRaT8J/5Kw0lHi8NvXe3QrD7HQHPhvoR6L1fCfDePI5grPQg/HHZSkNjdQ4N
 b09fJ6HDOxWeBAZpGHBqCfjXTIMupxHDxYpiBLlVJhps7gYBOPtGCegqLSbAYNkGr/Q+Ckqv
 zYKKslwCSmr/IWBEXyOAh1VdFOg1ETDqiYagLgW6T5VQUDfQjqHPV0zDq3vHMPytcQvA/8RD
 gLHQR4LlTSeG8ktdNNgbH1BQMOZH0FL/moCOBi0NhebrGHqMQQyaimEMjw0OCkzvXAS0ttyn
 oL2hFsPVZ04CPG4XBmvbQxKGisI2JHLD+UUUV2P9i+CMl4yIu90/SHJ51sPc1dZ+mvsceEpz
 Z9oiOduFbgGXd+OFgNNZ0ri8OwOYs1Yv46rsvQRX+TGAuRd9P++I2iNan8grFem8auUv8SL5
 NYeGPKQVZ9gdj7AGjYpOoBAhy8SwtvtP6e8+U2maNM0sYV2uEXLCM5n5rPWkD0+YZFrD2U7n
 ignPYH5jgwE/NWGKiWDdpuzJvphZy3p8ZejbzXmswXxzMg8Zzzs8rZN9CbOGzR/MI04g0Xin
 LIR9/HYMf1uYzd6qdlGnkViHptQgiSI5PUmmUMZEyTOTFRlRCSlJFjT+bfqjo3vr0UfHrmbE
 CJE0VOyI6JZLsCxdnZnUjFghKZ0pjq/ukkvEibLMLF6V8rsqTcmrm1GYkJLOEq8eOpwoYQ7I
 UvmDPH+IV32fEsKQORr0p4HfPteV1RR1j1F++mlHhH16bmR9dmyBJKxtfxxGsdr2jHXtue8X
 pTWfi51xITzcvadj5xVHzssFS61F7uOnzEZ13JFC349vftUdsen3BcvOLs+aUlP7fKFr4yao
 89p+iH++5YM9bvPefPbolqHCJnGM3prgz05bvO9WVe/a3dGhUkotl0UvI1Vq2f+WFdoJaQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUhTcRTG+9/XOZpcluHNomJlRqQVZRxKoi/RpTcSo6IvuerWhlNjK9Mi
 2NSZlNYcTMtZ+ULDdDl1FlkZomTUsrZZFuXUlW2V2iC3ypyuzejL4Xee5+HwfDgCXHyPjBPI
 s07xyiypQkIJCeGezQWJ0RsGZWt9LZugX9NJQMBfTECVxUxBces1EuxNjQiGAsUIfk0ZcdC2
 hwiY1vfQ4J/8QEOoowdBuUOPg7lNg8FE8wwFo90/EBjcIxRUfNUQ4DOVIKj0GGn4+mQ7jA89
 JCHk8mLw9ucYAtPIDAYjnRcQTJdnwM1aKwVTva9wqDDYEdS4XTh8aQ6bbT2DCDrq8yn4rLuL
 Q99INLwO+Ch4ZrhEwbijCoPvzRRU53eQcN2oR1BQZ6Gg/HorAe3DD2hwjAYxGCjXY9DYuhuG
 TB4CbLpaLNwvnGqJBWNFARYeXzAw3HmIwaSpgYYXdQMEmNTxYOztI+FjfSUNQfc6CFVnQ0+j
 lwbXFQMBTeOvyK0GxP3SXia4Bus9jNM6pynOfMOMuKk/esT5bxXgnFYXXrvHfDhXaD3D3bKN
 UdyfwBuK6/hZTXDPa1murDeRa6900Vzh4/f03k2HhCnHeIU8h1eu2ZIulLXY1fjJKlHuI/tL
 Uo2CwosoSsAyG9iyGgsVYYpJYN+9m8QjHMMsZa2lHjLCOGNbxPY7Vkd4HpPKhgJ+IsIEE88O
 WzSzeRGzkXV7KtC/m0vYxubOWT0qrPe5bbN5MZPMan2FmA4Jq9GcBhQjz8rJlMoVyUmqDFle
 ljw36Wh2ZisKf5PpfLDsPvL3be9CjABJ5ooc8S6ZmJTmqPIyuxArwCUxovT6AZlYdEyad5ZX
 Zh9Wnlbwqi60UEBIYkU7DvDpYuaE9BSfwfMneeV/FxNExalRW8LwYufmbue+T4a5Eylpu++s
 XbZG6lTsWvnG3Jbi2QNpuh2p7xMpPPfqnONe70Tp+rTY/uffng7OXF1hj3+sUBO3zxlVitES
 x2/N2NudT5HTXPrgQHRqnKypvsS7y2pLXl50LrTgQ862IzXBpfMTajJPHNyvrXPkB4rEP2It
 SUUSQiWTrluFK1XSvylOh+5JAwAA
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Oct 2025 07:00:55 +0000
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
index 3f78c56b58dc..787fa10a49f1 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -16,6 +16,7 @@
 #include <linux/dma-fence.h>
 #include <linux/sched/signal.h>
 #include <linux/seq_file.h>
+#include <linux/dept_sdt.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/dma_fence.h>
@@ -800,6 +801,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
+	sdt_might_sleep_start(NULL);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -813,6 +815,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 		if (ret > 0 && intr && signal_pending(current))
 			ret = -ERESTARTSYS;
 	}
+	sdt_might_sleep_end();
 
 	if (!list_empty(&cb.base.node))
 		list_del(&cb.base.node);
@@ -902,6 +905,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
+	sdt_might_sleep_start(NULL);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
@@ -916,6 +920,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		if (ret > 0 && intr && signal_pending(current))
 			ret = -ERESTARTSYS;
 	}
+	sdt_might_sleep_end();
 
 	__set_current_state(TASK_RUNNING);
 
-- 
2.17.1

