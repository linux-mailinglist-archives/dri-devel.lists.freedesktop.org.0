Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAC87315A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27258113013;
	Wed,  6 Mar 2024 08:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2EC8510EB6A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:31 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-18-65e82f7ece15
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
Subject: [PATCH v13 15/27] dept: Apply sdt_might_sleep_{start,
 end}() to dma fence wait
Date: Wed,  6 Mar 2024 17:55:01 +0900
Message-Id: <20240306085513.41482-16-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+59zds7ZanJYhqf1wVp0M1ILizeKsC/1JxCiKKIkG3poIzWZ
 eVllaF4wTVNDLbPUJcvUNDfzkk6moWWXZWW11KTESvOW2rzNrGn15eXH8z487/PhZUlZpUjO
 qoPPCJpgZaCCllCSoSW6TRc8+gTPrLoNkH7ZE2w/EynILS+loa2sBEFpZQwB/c174f3EIAL7
 i5ckZGe2ISj4/JGEypZuBKaiizS86XWCdtsIDa2ZyTTE3i6n4dXALAFdWRkElBh84FmajgDz
 9DcKsvtpuJEdSzhGHwHT+mIG9NFroKcoh4HZz5uhtfudCEwdG+H6rS4a6k2tFLTU9BDw5mEu
 Dd2lv0XwrOUJBW3pKSK4N6yjYWBCT4LeNsLAa3M+AffjHEEJ43MieJxiJiChsIKA9g91CBoS
 PxFgKH1HwyPbIAFGQyYJM3eaEfSkDjEQf3magRsxqQiS47MoiOvaCvapXNp7O340OELiOGME
 Nk3kU/ipjse1OR8ZHNfQweB8Qxg2Frnh2/X9BC4Ys4mwofgSjQ1jGQxOGmon8LDFwuAn1+wU
 7m3PJvbLj0p2BgiB6nBB47HrhESV2mlBITHSSEMeE42+SJKQmOU5L173IIn+z1/zrGieaW4d
 b7VOk/PszK3kjSlfRfNMcoMSvtCyZ56Xcof5mM6RBQ/FreFHOzsWWMpt4/V1GczfTFe+5L55
 QRc79CvDVxZuybit/IvYAgdLHJ4plr/54/m/Esv5xiIrlYak+WhRMZKpg8ODlOpAL3eVNlgd
 6e5/OsiAHL+kj5o9VoPG2g42IY5FiiVSb/E3QSZShodqg5oQz5IKZ+n5mV5BJg1Qas8KmtN+
 mrBAIbQJrWAphYt0y0REgIw7qTwjnBKEEEHzf0uwYnk0Whbf4llVM9B49S1yc18cNqMSRqN0
 xoryHa8nqxLOig9qh9ePfddWHKq2LvWsl93zkZfVxB+Rp5nta1XJ1axv4TlX+7Z9XnNDzXlH
 Zw4kbDmCN1zwi1Ikenj3/Rq3avx9E532Tr732N3hW+viLF910pJ73LQ6xKVndNzJuVdyl05X
 UKEq5WY3UhOq/ANcJVTZRwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0hTYRgH8N73nPOebbQ4LaND0m0glZElZTxUdKHbW1Tkl+6Qow65nBab
 mnZ1ucIyLQdqqdW0WEPtdtYHyxTRNO2yrFmZTkmxcuWli7NMqZzRl4cf/+fh/+lRMJosbqJC
 HxMrGWN0Bi1RsaqNi5JnH5vTKc3tezsWMs7OBV9fCgt5t4oJ1N8sQlB814zBW70G3vR3IRh8
 9pyB7Mx6BPltLQzcrWlFUOY4QcDdMQYafL0E6jJTCSRfvUXgxechDJ4sK4YieQM8OV+AoWLg
 IwvZXgK52cl4eHRiGLAX8mBPCoJ2Rw4PQ22hUNf6moOqS3UclDXNgouXPQQelNWxUFPSjsF9
 P49Aa/EfDp7U1LJQn5HGwY2eAgKf++0M2H29PLyssGG4bRluO/X9NweP0iownLp2B0PD21IE
 5SnvMMjFrwlU+bowOOVMBn5dr0bQnt7Nw8mzAzzkmtMRpJ7MYsHiCYPBn3lk2UJa1dXLUIvz
 IC3rt7H0cYFI7+W08NRS3sRTmxxHnY5gevWBF9P8bz6OyoWnCZW/WXl6prsB0x6Xi6e1FwZZ
 2tGQjTcFblct3iMZ9PGScc6SCFVkerMLHTCrE+QrfBJ6rzqDlApRmC9+uNKI/CbCdLGxcYDx
 O0CYKjrTPnB+M0KXSrzmWu33OGGzaG7uHblhhSDxa3PTiNXCAtFeauX/dU4Ri25XjOTK4fxc
 zznit0YIE58l55PzSGVDowpRgD4mPlqnN4SFmKIiE2P0CSG790fLaPhb7EeHMkpQn3tNJRIU
 SDtavUz5UdJwunhTYnQlEhWMNkB95FeHpFHv0SUekoz7dxnjDJKpEgUqWO0E9botUoRG2KuL
 laIk6YBk/L/FCuXEJDRj+6SwrARuZVxE6sx3s8dXP3UvHrfTcrjaHJT0aKt0eaXDXY/zwg93
 BpNIb/nkT9McX0J3r3rVZs98GC44l7QGquct3RdiDbgZkd8fq7z0eJtn8Af2eo6XlJzOPdpS
 mlKz1prTTePHrNrXUbvj5/yi8JyoToNNtqzXrhBSlhcaXFrWFKkLDWaMJt1fHuldUikDAAA=
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

