Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D21ABB899
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CE810E37E;
	Mon, 19 May 2025 09:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9868B10E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:49 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-b9-682af770961a
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
Subject: [PATCH v16 31/42] dept: assign dept map to mmu notifier invalidation
 synchronization
Date: Mon, 19 May 2025 18:18:15 +0900
Message-Id: <20250519091826.19752-32-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxTHfd47lZrXjuijYGaaEDdMFYzY88EZk2l8YrLMxMREjbpuvLGN
 LWKLCCbLQBGVSoMiMG9YQEtD66itiZdZglQLaERQpEgQsSpZJ7dh2w1FXUH9cvLL+Z/zO1+O
 QCta2fmCLjNbMmZq9EpOxsiG46tVWf+maFPf2NQQCR9h4GyDk4OOPxwInFcKKAjdWQeB6BCC
 d/cf0FBZ3oGg+vlTGq74+xF47Qc4ePRyFnRFRjloKzdzcLC2gYPO15MU9FWcoMDh/gGe2QYZ
 uFdaQ0FliIMzlQepWPmLgglbPQ+2/GQI2k/zMPk8Ddr6u1nw9i6GU1V9HNz0tjHgvxak4NGN
 sxz0Oz+ycM/fykDUkggdx0tYuDRSw8HrqI0GW2SUh4dNVgr81jngKowJi958YKGlpImCoguX
 Keh68ieCxiMDFLid3Rz4IkMUeNzlNLytu4MgaBnm4dCxCR7OFFgQmA9VMFDYlw7v/otdPhdO
 g4LzLgYuve9Gq78jzionIr6hUZoUevaRt5HHHPFGrQy5W4PJ9dNPeVLY2MsTq3sv8dhTSO3N
 EEWqxyMscdcf5Yh7/ARPioe7KDLS3s5vSNoiW5kh6XU5knHpqp9k2tqBMZQVUOeOTf7N5qN+
 VTGKE7C4HD8Mt1Bf+J+TL6aZExfhnp4JeooTxIXYUzLIFiOZQIvdM3Hg3BM0FXwlbsPvexqn
 mRGT8cvyID/FcnEFtlSHPku/xg5X07QoLtbvNfum5xViOu5yVDFTUiyWxWHnhIX7tDAP37L3
 MKVIbkUz6pFCl5lj0Oj0y5do8zJ1uUt+2W1wo9h/2X6d3HoNjXdsbEaigJTxcpf3W62C1eSY
 8gzNCAu0MkFe7/lGq5BnaPL2S8bdO4x79ZKpGSUKjHKufFl0X4ZC3KnJlnZJUpZk/JJSQtz8
 fJQtpeJjnSrf7c7AesgvYneWPUZXRxrC5kFYIWTnOlLjfbWdJ0/pAy0H7qevPRosTUxX5+GK
 7c+2JiSNLuM572GVuXl/HTNzU3z7QOXGV78ZdgUO3yrIKFk1Vqa/vfmj4XuiDq3ZHjLZk3+W
 1y1QXdyj/j3UmlzlZ11JYfTjbCVj0mrSUmijSfM/8QQ2DVsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/p+s4fjuN34qxMyRT2hwfY3nY6Dvk4R+MmW75zZ0ed3dS
 zFZKo3SLqTyVq+y0u4vrzoa4pDiOSZRKUoqZdOShi3Lhyvzz2Wuf92evzz9vCSU3M0ESTaJe
 1Caq4hWslJZuXJa5IPlHqHqhpzEAvAPHaLhw1cpC4xULAuu1DAy996OgddCD4NeTpxQUFTQi
 KO1+TcE1VycCZ8URFpreTYRmbz8L7oJcFjLLr7LwrM+HoaPwFAaLPRq6TO9peJxfhqGol4Xz
 RZnYPz5gGDKZOTClz4aeinMc+LojwN3ZwkB9sZsBZ/t8OFvSwcJtp5sG140eDE3VF1jotP5h
 4LHrIQ2DhmBoPJnHQOXnMhb6Bk0UmLz9HDyvNWJwGaeALctvzf7+m4EHebUYsi9VYWh+eQtB
 zbE3GOzWFhbqvR4MDnsBBcOX7yPoMXzi4OiJIQ7OZxgQ5B4tpCGrQwm/fvo/Fw9EQMZFGw2V
 Iy1oZSSxllgRqff0UyTLcYAMe1+wxDlopMmjMoHcPPeaI1k17Rwx2vcTR0UoKb/di0npNy9D
 7ObjLLF/O8WRnE/NmHxuaOA2T98hXb5HjNekiNrwyBipuvzNF5TcuiT1i+8jk446F+SgAInA
 LxK+nn6LR5nl5wptbUPUKAfyMwVH3nsmB0klFN8yXmgtfolGg8n8LmGkrWaMaX628K6ghxtl
 Gb9YMJT24n/SGYLFVjsmCvDv23Prx+7lvFJotpTQ+UhqROPMKFCTmJKg0sQrw3Rx6rRETWpY
 bFKCHfkbZDrsO3kDDTRF1SFeghQTZDbnPLWcUaXo0hLqkCChFIEysyNELZftUaUdFLVJu7X7
 40VdHQqW0IqpsnXbxBg5v1elF+NEMVnU/k+xJCAoHc1Syyb6fDGXZbp74UsMO+92BYfFXp+q
 Lt8effbtNoIyHu17vrrK69Gv6ftTTc95kW+SrjqyN3B9Q/vWV6UrTgwob0Zmb+Ydu1zdXfq4
 YVg61xM+LarK/SCkmlg3rtWzkcIhRYVpfVDXmexN0TXKSVs2hMpi19g+WHTW8KTCOyOpClqn
 VkWEUlqd6i9J66ZnPQMAAA==
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

Resolved the following false positive by introducing explicit dept map
and annotations for dealing with this case:

   *** DEADLOCK ***
   context A
       [S] (unknown)(<sched>:0)
       [W] lock(&mm->mmap_lock:0)
       [E] try_to_wake_up(<sched>:0)

   context B
       [S] lock(&mm->mmap_lock:0)
       [W] mmu_interval_read_begin(<sched>:0)
       [E] unlock(&mm->mmap_lock:0)

   [S]: start of the event context
   [W]: the wait blocked
   [E]: the event not reachable

dept already tracks dependencies between scheduler sleep and ttwu based
on internal timestamp called wgen.  However, in case that more than one
event contexts are overwrapped, dept has chance to wrongly guess the
start of the event context like the following:

   <before this patch>

   context A: lock L
   context A: mmu_notifier_invalidate_range_start()

   context B: lock L'
   context B: mmu_interval_read_begin() : wait
   <- here is the start of the event context of C.
   context B: unlock L'

   context C: lock L''
   context C: mmu_notifier_invalidate_range_start()

   context A: mmu_notifier_invalidate_range_end()
   context A: unlock L

   context C: mmu_notifier_invalidate_range_end() : ttwu
   <- here is the end of the event context of C.  dept observes a wait,
      lock L'' within the event context of C.  Which causes a false
      positive dept report.

   context C: unlock L''

By explicitly annotating the interesting event context range, make dept
work with more precise information like:

   <after this patch>

   context A: lock L
   context A: mmu_notifier_invalidate_range_start()

   context B: lock L'
   context B: mmu_interval_read_begin() : wait
   context B: unlock L'

   context C: lock L''
   context C: mmu_notifier_invalidate_range_start()
   <- here is the start of the event context of C.

   context A: mmu_notifier_invalidate_range_end()
   context A: unlock L

   context C: mmu_notifier_invalidate_range_end() : ttwu
   <- here is the end of the event context of C.  dept doesn't observe
      the wait, lock L'' within the event context of C.  context C is
      responsible only for the range delimited by
      mmu_notifier_invalidate_range_{start,end}().

   context C: unlock L''

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/mmu_notifier.h | 26 ++++++++++++++++++++++++++
 mm/mmu_notifier.c            | 31 +++++++++++++++++++++++++++++--
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index bc2402a45741..1e256f5305b7 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -428,6 +428,14 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
 	return 0;
 }
 
+#ifdef CONFIG_DEPT
+void mmu_notifier_invalidate_dept_ecxt_start(struct mmu_notifier_range *range);
+void mmu_notifier_invalidate_dept_ecxt_end(struct mmu_notifier_range *range);
+#else
+static inline void mmu_notifier_invalidate_dept_ecxt_start(struct mmu_notifier_range *range) {}
+static inline void mmu_notifier_invalidate_dept_ecxt_end(struct mmu_notifier_range *range) {}
+#endif
+
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
@@ -439,6 +447,12 @@ mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 		__mmu_notifier_invalidate_range_start(range);
 	}
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
+
+	/*
+	 * From now on, waiters could be there by this start until
+	 * mmu_notifier_invalidate_range_end().
+	 */
+	mmu_notifier_invalidate_dept_ecxt_start(range);
 }
 
 /*
@@ -459,6 +473,12 @@ mmu_notifier_invalidate_range_start_nonblock(struct mmu_notifier_range *range)
 		ret = __mmu_notifier_invalidate_range_start(range);
 	}
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
+
+	/*
+	 * From now on, waiters could be there by this start until
+	 * mmu_notifier_invalidate_range_end().
+	 */
+	mmu_notifier_invalidate_dept_ecxt_start(range);
 	return ret;
 }
 
@@ -470,6 +490,12 @@ mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range)
 
 	if (mm_has_notifiers(range->mm))
 		__mmu_notifier_invalidate_range_end(range);
+
+	/*
+	 * The event context that has been started by
+	 * mmu_notifier_invalidate_range_start() ends.
+	 */
+	mmu_notifier_invalidate_dept_ecxt_end(range);
 }
 
 static inline void mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index fc18fe274505..850d75952f98 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -46,6 +46,7 @@ struct mmu_notifier_subscriptions {
 	unsigned long active_invalidate_ranges;
 	struct rb_root_cached itree;
 	wait_queue_head_t wq;
+	struct dept_map dmap;
 	struct hlist_head deferred_list;
 };
 
@@ -165,6 +166,25 @@ static void mn_itree_inv_end(struct mmu_notifier_subscriptions *subscriptions)
 	wake_up_all(&subscriptions->wq);
 }
 
+#ifdef CONFIG_DEPT
+void mmu_notifier_invalidate_dept_ecxt_start(struct mmu_notifier_range *range)
+{
+	struct mmu_notifier_subscriptions *subscriptions =
+		range->mm->notifier_subscriptions;
+
+	if (subscriptions)
+		sdt_ecxt_enter(&subscriptions->dmap);
+}
+void mmu_notifier_invalidate_dept_ecxt_end(struct mmu_notifier_range *range)
+{
+	struct mmu_notifier_subscriptions *subscriptions =
+		range->mm->notifier_subscriptions;
+
+	if (subscriptions)
+		sdt_ecxt_exit(&subscriptions->dmap);
+}
+#endif
+
 /**
  * mmu_interval_read_begin - Begin a read side critical section against a VA
  *                           range
@@ -246,9 +266,12 @@ mmu_interval_read_begin(struct mmu_interval_notifier *interval_sub)
 	 */
 	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
-	if (is_invalidating)
+	if (is_invalidating) {
+		sdt_might_sleep_start(&subscriptions->dmap);
 		wait_event(subscriptions->wq,
 			   READ_ONCE(subscriptions->invalidate_seq) != seq);
+		sdt_might_sleep_end();
+	}
 
 	/*
 	 * Notice that mmu_interval_read_retry() can already be true at this
@@ -625,6 +648,7 @@ int __mmu_notifier_register(struct mmu_notifier *subscription,
 
 		INIT_HLIST_HEAD(&subscriptions->list);
 		spin_lock_init(&subscriptions->lock);
+		sdt_map_init(&subscriptions->dmap);
 		subscriptions->invalidate_seq = 2;
 		subscriptions->itree = RB_ROOT_CACHED;
 		init_waitqueue_head(&subscriptions->wq);
@@ -1070,9 +1094,12 @@ void mmu_interval_notifier_remove(struct mmu_interval_notifier *interval_sub)
 	 */
 	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
-	if (seq)
+	if (seq) {
+		sdt_might_sleep_start(&subscriptions->dmap);
 		wait_event(subscriptions->wq,
 			   mmu_interval_seq_released(subscriptions, seq));
+		sdt_might_sleep_end();
+	}
 
 	/* pairs with mmgrab in mmu_interval_notifier_insert() */
 	mmdrop(mm);
-- 
2.17.1

