Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2E9782234
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148C010E1A2;
	Mon, 21 Aug 2023 04:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC47E10E189
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:05:00 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-eb-64e2ded695c7
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 16/25] dept: Apply sdt_might_sleep_{start,
 end}() to dma fence wait
Date: Mon, 21 Aug 2023 12:46:28 +0900
Message-Id: <20230821034637.34630-17-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz3SbUxTZxQH8D3Pvfe5l0rNTTHxatWRJmjE+BrAEzONJibekS0u0xgjErmu
 N6OzFNMqLyZmoKiAQkQCnUKWAqY2gKItvlYcYETQAFUrooHGVnwhgGil3SrVjeK2Lye/nH/O
 /9PhKJWTmcvpDPtko0HSa4iCVoxF1yzt8/i0KwbDC6HsxAoITBTSUN3USMB1oQFBY3M+huE7
 m+BJcBTBZHcvBeYKF4Ia7yAFzR0eBC22QwQeDc0Ed2CcQFfFcQKH65oIPBgJYxioPIWhwf49
 3D9Zi6E19JoG8zCBKvNhPDXeYAhZ61mw5sWBz3aGhbB3JXR5+hhoebYETv8+QOBmSxcNHdd8
 GB7dqCbgafybgfsdnTS4ykoYOP+2lsBI0EqBNTDOwsNWC4aLBVNFRz98ZuBuSSuGo2cvYXA/
 dSK4Vfgcg72xj8DtwCgGh72Cgo/n7iDwlY6xcOREiIWq/FIEx49U0tD76S4DBQOJMPlXNVm/
 Rrw9Ok6JBY5ssSVoocV7tYJ4/cwgKxbcesaKFvt+0WGLF+tuDmOxxh9gRHt9ERHt/lOsWDzm
 xuLbnh5W7PxtkhaH3Gb8g3qH4hutrNdlycbl69IU6eWhHrI3X5ljcZxl89BLRTGK4gQ+QXBU
 HaP+9+ur0yb8IqG/PzTtWXys4Ch5xRQjBUfxx2YItnfdJBLE8KlCeXMXjpjm44Q3/jEmYiWf
 JNR2/vFv6ddCw8XWaUdN7e3OGyhiFZ8ovPe+oCOlAl8eJRR9cpIvB3OENls/fRIpLeireqTS
 GbIyJJ0+YVl6rkGXs+ynzAw7mnop68FwyjXkd21pRzyHNNHKtHk+rYqRsky5Ge1I4CjNLKX6
 T69WpdRKuQdkY+Yu4369bGpHao7WzFauCmZrVfzP0j55jyzvlY3/pZiLmpuH6nbEFyXFzCuN
 29pWXbR1STh5zbcPh37l2mISNi6Y/8QbF7Z8V6HdlvNBvTrZw0Ub9my/krZzyJRKH8p0XU7z
 O7Imrvok2cn3hvI7sn959WN7vXG+O7HMo5+RseW52RDbn2zdTUkzk2r8wxPdsYs3P36hXp6y
 oTJ2JGdbamHw4FqrhjalSyvjKaNJ+gcAEHXBTgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSe0xTZxgGcL/vnPOdQ7fOk0riiZi4NWHLIF5IxLwJzmjC4tlUNDOLycwm
 jT1IuRTTAoMREwr1MhAjKLIpmlpIJYAip6gIRSsItBAQLUFk0I2OCUSQySizghfqsn/e/PI8
 yfPXy1Gqi8wqTqdPlwx6TYqaKGhFXEz+2gGvT7vBO7ccik9uAP/cCRrK62oJ9F2rQVDbYMIw
 2b4dHs9PIVjoeUBBWWkfgsujIxQ0dHgRtFTlEfCMfQT9/hkC7tJCAvkVdQQePlvEMHyuBEON
 vAu6T1sxOAPjNJRNErhQlo+XzgSGgK2aBVtuOPiqzrOwOBoFbu8AA20X3Qy0DEXCr5eGCTha
 3DR0NPoweJrKCXhr3zLQ3eGioa+4iIGrz60Ens3bKLD5Z1h45LRguG5eWjv2zxsGOoucGI5V
 1mPof9KM4M6JPzDItQME2vxTGOxyKQWvrrQj8J2aZuHoyQALF0ynEBQePUfDg9edDJiHo2Hh
 ZTnZGiO2Tc1Qotn+o9gyb6HFLqsg3j4/wormO0OsaJEzRHtVhFjhmMTi5Vk/I8rVPxNRni1h
 xYLpfiw+7+1lRdcvC7Q41l+G96z+TrFZK6XoMiXD+i3xisQzgV5y2KTMstgr2Vz0l6IAhXAC
 v1Gwj9+igib8Z8LgYOC9Q/mPBXvRU6YAKTiKP/6BUPV3DwkWK/jvhTMNbhw0zYcLE7PTTNBK
 fpNgdd2l/htdI9Rcd753yFIuNzehoFV8tPBi9E/6NFJY0LJqFKrTZ6ZqdCnR64zJidl6Xda6
 g2mpMlp6GtuRxeJGNOfZ3op4Dqk/VMav9mlVjCbTmJ3aigSOUocqw/4d1aqUWk32T5Ih7YAh
 I0UytqIwjlavVH69T4pX8Yc06VKyJB2WDP+3mAtZlYsc5jf8b/X7XaYe0knys35/Nf75y6e8
 Z4fekfPNFxN9WwvVy1Pl2Ncu396kWBxn7zqwbQcXl1D9ZVd5XuQ934SGW7Z/c2SEAx2JLFmj
 z4v96lruJ9/WeQZvph9XWROaknaaYG9ojjvjftpZZ/hkRtgNa+buq/ZPu2NGhnbail/8cFtN
 GxM1URGUwah5B5yxqSkwAwAA
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
index f177c56269bb..ad2d7a94c868 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -16,6 +16,7 @@
 #include <linux/dma-fence.h>
 #include <linux/sched/signal.h>
 #include <linux/seq_file.h>
+#include <linux/dept_sdt.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/dma_fence.h>
@@ -782,6 +783,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
+	sdt_might_sleep_start(NULL);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -795,6 +797,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 		if (ret > 0 && intr && signal_pending(current))
 			ret = -ERESTARTSYS;
 	}
+	sdt_might_sleep_end();
 
 	if (!list_empty(&cb.base.node))
 		list_del(&cb.base.node);
@@ -884,6 +887,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
+	sdt_might_sleep_start(NULL);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
@@ -898,6 +902,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		if (ret > 0 && intr && signal_pending(current))
 			ret = -ERESTARTSYS;
 	}
+	sdt_might_sleep_end();
 
 	__set_current_state(TASK_RUNNING);
 
-- 
2.17.1

