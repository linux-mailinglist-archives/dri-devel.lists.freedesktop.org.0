Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE473EC78
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 23:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B040010E257;
	Mon, 26 Jun 2023 21:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AB7B10E200
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:13:55 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-06-64997d6d445e
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 22/25] dept: Apply timeout consideration to dma fence wait
Date: Mon, 26 Jun 2023 20:56:57 +0900
Message-Id: <20230626115700.13873-23-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
References: <20230626115700.13873-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTdxjG/Z/L/5x21pzUyw6M6FKDJl5hUfNmzsXED/4THbpo1OgHbehR
 qqWyoiguKgreqhDUAApMazGlFlAsqCjU1Co3FYGBtZJSJxMVuS3MVi7dpdT45c0vz/s8z6eH
 p5VONpLX6vdIBr1ap8JyRt4/0Txff/CiJqbJJcDZMzHg/3iSgcIbpRharpcgKK08QkFP7Up4
 EehDMNbUTENeTguCK687aais8yFwWI9iaHszCdr9gxgac05jSC+6gaG1N0iBN/ccBSX2n+BJ
 tpkC58g7BvJ6MBTkpVOh856CEYuNA0taNHRZ8zkIvo6FRp+bBUfHXLh4yYuhxtHIQF1VFwVt
 9wox+Er/Y+FJXQMDLWczWSgbMGPoDVhosPgHOfjdaaKgPCNU9CHooOD43/+yUJ/pDNHVmxS0
 v6xGcP/kHxTYS90YHvr7KKiw59AwWlyLoCurn4NjZ0Y4KDiSheD0sVwGmv+pZyHDuxjGhgvx
 8qXkYd8gTTIq9hFHwMSQx2aR3M3v5EjG/Q6OmOx7SYV1Dimq6aHIlSE/S+y2U5jYh85xxNjf
 ThGvuwaTgWfPONJwYYxZG7VZ/oNG0mlTJMPCH7fJEx6N2dikNn6/57kNp6ESzohkvCgsEqu7
 XfQXNl3rZcYZC7NFj2ckrE8RvhUrMt+yRiTnaaHoK/Fdw6NweLIQJ9Z6ysImRogWy//KosZZ
 ISwRK0dN6HPpDLGk3Bn2yEJ69VNzWFcKi8WjXhceLxWF8zKx+Wkm8zkQIT6wephspDChCTak
 1OpTEtVa3aIFCal67f4F8bsT7Si0K8vB4JYqNNSyzoUEHqkmKmKmX9AoWXVKcmqiC4k8rZqi
 mDacp1EqNOrUA5Jh91bDXp2U7ELf8Izqa8V3gX0apbBDvUfaJUlJkuHLl+JlkWlIGf1b66uO
 jT2W69r8VT9PvXPgTcTmD2/XyOJWPK7yde5M37S9bFn0su7RWPf61ZjT5W6s/6g69GfHiWJ3
 xC/kUHzU2tbvzYFNp+Ydjqcbgxua9Nt86bd+zT3syMqfFWWsjIgxFt+eZXV/ulxHz0yKz74a
 OVA4L9HavaTLU2CZELdi57CKSU5Qx86hDcnq/wHaIHOuUwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0iTeRzH7/t9nuf7PC4XD0vqodBiFEKRGWV8oIgiwieP6zqIO7grcrWH
 XG6rNlsaBpYWnTVTyaZpMafsbLOyzT+snIi/l3dpabZkWdrPpenRNWlO66bRP29evD/v9/uv
 D0cpbMxiTqPPkAx6lVZJZLRs58bc1bqTZerEztfroOhCIgQ/naOh4lYtgd6bTgS19acwBNqT
 4cnkGILwPz0UWEp6EVQOP6OgvmMIgafmNIG+V/OhPzhBwFtynkBu1S0CD0enMfgvF2Nwun6C
 7kIbhubQWxosAQLlllwckXcYQnYHC/acFTBSc4WF6eG14B0aYKD1qpcBz+AqKLvmJ9Do8dLQ
 0TCCoe9uBYGh2q8MdHd00dBbZGbgxriNwOiknQJ7cIKFR81WDHV5kbX30x4MZ//7wkCnuTlC
 1bcx9D+9h6Dp3AsMrtoBAq3BMQxuVwkFU3+1Ixgp+MDCmQshFspPFSA4f+YyDT0znQzk+ZMg
 /LmCbNkkto5NUGKe+7jombTS4n2bIN658owV85oGWdHqOia6a1aKVY0BLFZ+DDKiy/EnEV0f
 i1kx/0M/Fv0DjUQcf/CAFbtKw/Su2N9lm9SSVmOSDGs2p8rS2sIO5kgfl+l77CA5yMnmoyhO
 4NcL1uuj9CwTPl7w+ULULMfwywS3+Q2Tj2QcxVfNE952tc0VFvA7hXbfjbkQza8Q6v4twLMs
 5zcI9VNW9G10qeCsa57LREX8e3/b5nwFnySc9reQQiSzoh8cKEajN+lUGm1SgjE9LUuvyUw4
 cFjnQpHPsZ+cLmpAn/qSWxDPIWW0PDGuVK1gVCZjlq4FCRyljJEv/GxRK+RqVdYJyXB4n+GY
 VjK2oCUcrVwkT/lNSlXwB1UZUrokHZEM36+Yi1qcg6LLeQXhMyoafzTrtVUjgbK9hTteL+81
 jCUvmfTW52b/OmOMLYl+uS7z6bgJF3elzO/ZuqV0z66bqzQJvO9S+FAgOrtta7fOm/rLxe3b
 4hyWyod/+PfY02LLB2emqhfGhZ5Xx7tfOFtTSrObUtIPDHNHs813GnQ79nc0TT3/md9tUtLG
 NNXalZTBqPofGOA1JDUDAAA=
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 26 Jun 2023 21:03:35 +0000
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
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, paolo.valente@linaro.org,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to dma fence wait.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 1db4bc0e8adc..a1ede7b467cd 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -783,7 +783,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -887,7 +887,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
-- 
2.17.1

