Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A996745919
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133C210E1FD;
	Mon,  3 Jul 2023 09:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2100110E1F0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:43 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-d8-64a299b373f9
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 16/25] dept: Apply sdt_might_sleep_{start,
 end}() to dma fence wait
Date: Mon,  3 Jul 2023 18:47:43 +0900
Message-Id: <20230703094752.79269-17-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTZxiA/c7lO6fF4rFj8agRtQkhYQx1EfOG6eKPRY8/nCYaY1QinT0b
 Hde1grLNDCyIk4uIA+QSbSuptRQvbVVEaxiEe4BuNAy1koHoRrhtaDsK6NZi/PPmyfPmfX69
 LCl/QK9i1anHRU2qMlmBpZR0cqnhY0elUbVx6g0DFwo3gvf1WQpqbloxuG7UIbA6cggYa90J
 v/smEMz39JFQUeZCYBh+RoKjbQiB03waQ/9oKLi90xg6ywow6K7exPDr+AIBnvJSAupsu6G7
 xEhAk/9PCirGMFRX6IjA+IsAv8nCgCk7AkbMVQwsDG+CzqEBGpxPPoLKyx4MD52dFLQ1jBDQ
 31iDYcj6Hw3dbR0UuC4U0VA/ZcQw7jORYPJOM/Bbk56AW7mB0JlXb2loL2oi4EztbQLcjx8g
 eHT2DwJs1gEMLd4JAuy2MhLmrrUiGCmeZCCv0M9AdU4xgoK8cgr63rTTkOuJhfnZGrw9TmiZ
 mCaFXPsJwenTU0KXkRfuVz1jhNxHTxhBb8sQ7OYo4erDMUIwzHhpwWb5CQu2mVJGODfpJoSp
 3l5G6Lg0Twmj7gpi7+pD0q0qMVmdKWo2fJYgTbzo78XpObKTenstk41eSM8hCctzm3nd09Pk
 ey7/10gHGXOR/OCgf9GHcet4e9HLgJeyJJcfwpv/7sHBxQfcV7y3twsFmeIieEfDDBNkGbeF
 1+sG0LvoWr7uVtNiSBLwL2aLF72ci+U9lUM4GOW58xI+P3scvztYyf9iHqRKkEyPlliQXJ2a
 maJUJ2+OScxKVZ+MOZaWYkOBlzKdWjjcgGZc+5oRxyLFUtng9waVnFZmarNSmhHPkoowmW74
 ikouUymzvhM1aUc1GcmithmtZinFCtknvhMqOfe18riYJIrpoub9lmAlq7JRfNXnU4U6fCDB
 clkVWlKgPPLPhth78ykHo5e1pW2fK+/pn92fEREZF8nGa/uS7nx599tpSyPVGa0NOSWJ3/Gy
 fu1ceFfo8lKHZK+zbNl59GO1Yc22n58794S76VHaQlvrLr7u/vCbcCouP/6HhI6IT9eHvK3N
 W+e7vsulv/RFjGfNcwWlTVRuiiI1WuX/9KM2Pk4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTZxjH977nnPccqjUnFeMJuqDN1MSFWyL6bKjB7IMni87LF40ukWoP
 0liqaSmXMRJYq3PcIizAuGkppDbQCWshQaENQkBBRByMMVORNjhGRFmYZVaQrXXZlye//P7J
 79PDUYp6JorT6DIkvU6lVRIZLfsiyRTjqraq44uaYqCsOB4Cr6/SUNfqIDB6qwWBo70Aw1z/
 Qfh1aR7B8sNHFFRVjCJo8D2loH1gCoHb/g2BsZl1MB5YIDBYUUTA1NhK4PGLFQzeynIMLc7D
 8OCaFUNPcJaGqjkCtVUmHDp/YAjamlmw5W8Dv72GhRVfAgxOTTDQVz/IgPvJx1B93Uug2z1I
 w0CnH8PYnToCU45/GHgwcJ+G0bISBn58ZSXwYslGgS2wwMLPPRYMbeZQ7cpfqwzcK+nBcKXp
 Jwzjv3Uh8FydxuB0TBDoC8xjcDkrKHh7sx+Bv/QlC5eLgyzUFpQiKLpcScOjd/cYMHsTYflN
 HUlOEvvmFyjR7MoS3UsWWhyyCuLtmqesaPY8YUWL0yi67DvFxu45LDYsBhjR2fwdEZ2L5axY
 +HIci69GRljx/g/LtDgzXoWPbj4l26uWtJpMSR+3P0WW9n1whFwqkGdbXE1sPnouK0QRnMDv
 Eir/tjJhJvwOYXIySIU5kt8iuEp+D3kZR/HfrhHsfz4k4WE9nyoERoZQmGl+m9DeuciGWc7v
 FiymCfRfNFpoaet5H4oI+edvSt97BZ8oeKunyDUks6APmlGkRpeZrtJoE2MNF9JydJrs2HMX
 050o9DS2vJWyTvR67GAv4jmkXCufzG1QKxhVpiEnvRcJHKWMlJt8N9QKuVqV85Wkv3hGb9RK
 hl60iaOVG+Wfn5BSFPx5VYZ0QZIuSfr/V8xFROUjpWfN9gPDQnRGF702d3R34UqW23ynaN/M
 jo67v3gOGdcplnxnU0H+2RZNOXNow9c+fzD32JcdW5OFuGfyJHvjsN8xFj1bU2Jp+TRqOm/2
 wEd743GdV5F6OsL4iXG140NOtmmotWt/sX86RkeOr1fmbVe7N54sPlJL1fv2eLTJq0rakKZK
 2EnpDap/ATXR0DQwAwAA
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

