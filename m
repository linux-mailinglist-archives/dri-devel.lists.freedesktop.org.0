Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE72DAB5224
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80BD10E583;
	Tue, 13 May 2025 10:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8EF8510E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:08 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-cc-682319ef77c9
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
Subject: [PATCH v15 17/43] dept: apply sdt_might_sleep_{start,
 end}() to dma fence
Date: Tue, 13 May 2025 19:07:04 +0900
Message-Id: <20250513100730.12664-18-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRiH+59zds5xuTitsGMG5SKFIsvQeIOMoA+diMhQKAupUx7ayC2Z
 ZRlFM9dN81KgonmZs9baltlmN2+Z0sosW7WWhZc0kaSpYW1lLWsz+vLy8P5+PO+Xl8alj0Xz
 aYXqkKBW8akyUkyIR4Orl38JXSxfWb0KPN/OEVB+00KCo9aMwFKfhcHIo43w1utG8Ov5CxxK
 ihwIqgd6cai39yFoNp4i4fXQLHB6xknoKMolIbvmJgkvP/sw6Cm+hIHZugX6DcMEdBbqMSgZ
 IeFySTbmH58wmDSYKDBolsCgsYwC30A0dPS5RND8fhmUVvaQ0NTcQYD93iAGrxvKSeiz/BFB
 p/0JAd78MHBczBPBjTE9CZ+9BhwMnnEKXrXqMLDrQqBO6xee+Tolgsd5rRicuXILA+e7RgQt
 5z5gYLW4SGj3uDGwWYtw+HntEYLB/FEKTl+YpOByVj6C3NPFBGh7YuHXD//lim/RkFVVR8CN
 3y60Po6zVFoQ1+4exzmt7Qj30/OG5Jq9OoJ7qme5+2W9FKdteU9xOuthzmZcytU0jWBc9YRH
 xFlN50nOOnGJ4nJGnRg31tVFxS/YKV6bIqQqMgT1inV7xPLGs1fxtHLJ0U/1BZQG+cQ5KIhm
 mRg2t18j+s/OxgYswCQTyXZ3T+IBnsssYm15w/6OmMYZ10z2bcU7FAjmMNvY8q+vpksEs4R1
 6AvIAEuY1ay7JR/9ky5kzXWt050g//73tS4iwFImli3UmYmAlGWqgtjsqn8ilgllHxq7iUIk
 0aEZJiRVqDKUvCI1JkqeqVIcjdp3UGlF/vcynPDtuocmHAltiKGRLFjyZCRcLhXxGemZyjbE
 0rhsriTrrn8lSeEzjwnqg7vVh1OF9DYURhOyeZJV3iMpUmY/f0g4IAhpgvp/itFB8zXIUtGw
 ac1eVeSth+oY2CRxRWlMtbNzooI3xFpX8NeTOhNoe6Jla/hysnBIkeFWJh2fKulMjltrmmgv
 3s4MlEYMJ37faJh1J2XHx+SwxMEtm5/t8ginQioi4sac8TW+fZUR4UPKB96n2jy9Kp7PPGB2
 2ow/CppOJt+eo9kztaamV0aky/nopbg6nf8L6y132FoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0wTaRiF+b6Z+aZ0rRkrwUHjrUKI9bKSWPPGdUV/qBOjRv2hCYmX7jqx
 jYDaIsImm4BcVJSCJoAoYEGtDVSLA/GGIKFa6ZLtVqgFDaISNRCqEKXNIvXSavzz5sk5J+f9
 c2SUsp6ZKdOnZ4iGdG2qishp+Zbf8paMxi3QLTv+NREC4ydoqLLbCHiuNyCwNediGH64AXqD
 fgST//5HQUWZB0Htq+cUNDsHELRajxHoeT0VvIFRAq6yUwTyLtkJPB4JYegvP4uhQdoMLyxv
 aegqrcNQMUzgQkUeDp8hDBOWehYsOQkwaD3PQuhVErgGfAw4ql0MtD5bBJU1/QTutbpocN4e
 xNBzt4rAgO0rA13OThqCplngOVPMwLX3dQRGghYKLIFRFrrbzRic5lhozA+3Fn78wsCj4nYM
 hZdvYPA+bUHQduIlBsnmI+AI+DE0SWUUfLr6EMGg6R0LBacnWLiQa0JwqqCchvx+DUz+H/5c
 PZ4EuRcbabj22YfWrBZsNTYkOPyjlJDfdFT4FHhChNagmRb+qeOFO+efs0J+2zNWMEtHhCar
 Wrh0bxgLtR8CjCDVnySC9OEsKxS982LhvdvNbp2dIl+1T0zVZ4qGX1fvletajl+hDlUpsoaa
 S9gcFJIXoWgZzy3nvS13cYQJl8j39U1QEY7h5vFNxW+ZIiSXUZzvF763+imKGNO5bXzVx+7v
 IZpL4D11JSTCCm4F728zoR+lc/mGxvbvmeiw/vmqm46wktPwpeYGuhTJzSiqHsXo0zPTtPpU
 zVLjAV12uj5r6Z8H0yQUXpDl79CZ22i8Z0MH4mRINUXROTxfp2S0mcbstA7EyyhVjCL3VlhS
 7NNm/yUaDu4xHEkVjR1oloxWzVBs3CnuVXL7tRniAVE8JBp+ulgWPTMHqZPHtkt9OyY98ec0
 1pUZsZopKb0+NX14bdyI33Hz0RidpTVHJ6waUioTXDc6216Qvpbd6mnr4na4bdZyoz3FHuWI
 XXC/ZPGeO0kmT6VzU2L/xXj7m4KuPyrlC3cVFhnXuJ50/578INktWXTro7xfxoJMbRfeb50d
 aifxujkWFW3UaZPUlMGo/QYe7KZkPQMAAA==
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

