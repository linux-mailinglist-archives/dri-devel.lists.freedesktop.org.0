Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D8ABB87A
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F44B10E2C8;
	Mon, 19 May 2025 09:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41B2610E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:47 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-40-682af76ff51e
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
Subject: [PATCH v16 23/42] dept: apply timeout consideration to dma fence wait
Date: Mon, 19 May 2025 18:18:07 +0900
Message-Id: <20250519091826.19752-24-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzH+/6e73T8nKcfebzNkJEM+zDMHx6+G/K0MbFx0487ri53pJit
 SLiUc1u1irqKk7uj3PnDQ9dSpDRE6WkJZUhPlDsilyvzz2evfd57vz7/fDhSXkFP4tQRR0Rd
 hFKjYKSUtMs/Z572R6BqgdE2A9zfz1FwucDOQPUtGwL7nTgC2h+vg3pPJ4Lfz16QkJZSjSDn
 /RsS7pS3IHDln2Kg5sNIqHX3MFCZksjA6bwCBl52DBDQnGoiwObYCG8tHymoMuYSkNbOQGba
 acI3PhPQb7GyYImdCa35GSwMvA+GypY6GlxNcyE9q5mBIlclBeV3WwmouX+ZgRb7IA1V5RUU
 eJIDoPpSEg03u3MZ6PBYSLC4e1h4VWImoNw8HgrjfcKEPi8NT5JKCEi4epuA2sYHCIrPvSPA
 Ya9joMzdSYDTkULCr+uPEbQmd7Fw5kI/C5lxyQgSz6RSEN+8GH7/9F2+8j0Y4rILKbj5pw6t
 WoHtWXaEyzp7SBzvPIZ/uV8z2OUxU/hproDvZbxhcXxxE4vNjqPYmR+I84raCZzT66axw3qe
 wY5eE4sNXbUE7n7+nN08OVS6PEzUqKNEXdDKvVJVW9s3KrKGi77Wb6JikY01IAkn8IuExrcZ
 1H++132dHGKGnyU0NPQP81h+uuBM+kgbkJQj+boRQv2VRjQUjOFDBG9KAjHEFD9T+GAdHGYZ
 v0TIbikm/0mnCbbCkmGW+PZNiWXDXTm/WKi1ZVFDUoHPkwjGolbmX2Gi8DC/gTIimRn5WZFc
 HREVrlRrFs1XxUSoo+fv04Y7kO+/LCcHdt1FvdXbShHPIYW/rNA1RyWnlVH6mPBSJHCkYqzM
 6pytksvClDHHRZ12j+6oRtSXogCOUkyQLfQcC5PzB5RHxEOiGCnq/qcEJ5kUi/xuNwUpI5d2
 XMOH32mmeS+ufnFjWVBu33ZHYExq274QkzajIdrQHJp5VWENGzm6zzBiS5o3YOoY737/9foT
 j17P+DolcsOO3evPti+LvRW6zvgs8aB2k7Yi1H/DwNo1m1buLB5HP8yr+nSgt+vn1oRRW+tP
 DlZI9piC5hZM9fvSt3eyPV1B6VXK4EBSp1f+BRl9DwZbAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxjF977flWqXL7XRTxhDmxg3CCrJWB6zxZgsjncYLzNeEvaHNOOb
 7SyFtAKyxQTkotLRQE0hKGDFWbGtE1qyeCthVHCIFwZdwQZQwBBRLhmjKIpoYdk/J7+ck+c8
 /xyeUjiYSF6rPyIZ9GqdipXRsp1fFMRnvIzVbGrql0No5iQN1VddLHT95kTgasrHMNaWBL2z
 4wje3H9IQaW1C8H5oQEKmtoHEXjrj7PQ8/RD8IemWOiwmlgouHCVhb9ezGPor7BgcLp3wGP7
 KA2dZXUYKsdYOFtZgMPyDMOc3cGBPW8dDNef4WB+KAE6BgMM+Go6GPAG46Cqtp+FW94OGtqv
 DWPouVHNwqDrHQOd7X/SMGuOgq7yUgauTNax8GLWToE9NMVBd4sNQ7ttJTQUhluL/11g4E5p
 C4biXxsx+B/dRNB88gkGtyvAgi80jsHjtlLw+lIbgmHzBAdFv8xxcDbfjMBUVEFDYX8ivHkV
 /lwzkwD55xpouPI2gLZuIa5aFyK+8SmKFHpyyOvQ3yzxztpocrdOJNfPDHCksDnIEZs7i3jq
 Y8mFW2OYnJ8OMcTtOMUS97SFIyUTfkwmHzzgdkenyL5Mk3TabMmwcUuqTDMy8g+d2cMfvThn
 ofOQkytBEbwofCZen7xELTIrrBf7+uaWWCmsET2lo0wJkvGUEFgm9tY8QovBCmGnuGAtxotM
 C+vEp453SywXPhfPDTZT/5XGiM6GliWOCPtBk2/pViEkin5nLV2GZDb0gQMptfrsdLVWl7jB
 eFiTq9ce3fB9RrobhRdkPzZffg3N9CS1IoFHquXyBu+nGgWjzjbmprcikadUSrnD84lGIU9T
 5/4kGTIOGrJ0krEVRfG0apU8+YCUqhAOqY9IhyUpUzL8n2I+IjIP3Vyetno93nPAOjQTQy37
 rnhHzr62r76pHtobF/ew21Fpet4bv9b76rH0bH+X/sfT9HBZ49fmy6sWMjb+sDm13uI/mHL7
 xPTLPxp/V54o6I5auysnhSTf69tT9FHWxKbgDZmvc5t5u6nq458339EFy/aNDuRHKy3P0yMD
 bcFjmsxvV8TnqmijRp0QSxmM6vdu8+cZPQMAAA==
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

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to dma fence wait.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 5d2fd2f6a46d..a45e5416f2dd 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -784,7 +784,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -888,7 +888,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
-- 
2.17.1

