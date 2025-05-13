Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A96AB5211
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5384E10E579;
	Tue, 13 May 2025 10:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDDBB10E557
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:08 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-2c-682319f04278
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
Subject: [PATCH v15 23/43] dept: apply timeout consideration to dma fence wait
Date: Tue, 13 May 2025 19:07:10 +0900
Message-Id: <20250513100730.12664-24-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSWUxTaRTH+b67tlBzUwSvYKLWGI1GRozLicsMxgfuPGg0PmjURBu5Q5th
 MQVZNETQQhCEYGegDiAU0NrQIrVgXAYQQWvByDBDB6ECaiHGKosibURxnNbl5eSX/8n5nfNw
 WEL+gIpg1UmpoiZJmaCgpaR0IqRmzZuFy1RrZ95FgXcmn4TKRgsNvVfNCCzNORg892PhsW8c
 wcdHfxGgL+1FUPN8mIBm+wiCVtNpGvrG5oHTO0VDV2khDWfqGmn4+/UchqEyHQazbSc8Nb4g
 4WFJLQa9h4YK/RnsLy8xzBrrGTBmLwe3qZyBuefR0DXST0GrazX8UTVEQ0trFwn2m24Mfbcr
 aRixfKbgod1Bgq84EnrPF1HQMFlLw2ufkQCjd4qBf9oNGOyGcLBq/cK8d/9R8KCoHUPepWsY
 nIN/ImjLf4bBZumnodM7jqHJVkrAhyv3EbiLJxjIPTfLQEVOMYLC3DIStEMb4ON7/+aLM9GQ
 U20loeFTP4rZJliqLEjoHJ8iBG1TuvDB+y8ttPoMpNBdywu3yocZQdvmYgSD7bjQZFol1LV4
 sFAz7aUEW/1ZWrBN6xihYMKJhcmeHmb3ogPSrXFigjpN1Pzw4xGpanT0LXmsj824PKsjs5GZ
 KUASlufW85fKG/B3rtBNEgGmuRX8wMDsF57PLeGbil5QBUjKElx/MP/44iAKNEK5XXynedI/
 zLIkt5w3nFsZiGXcRt7RZkVfnYt5s7X9i0fizz9d6SEDLOc28CUGMxlw8txvEv59t/vbQQv5
 u6YBsgTJDCioHsnVSWmJSnXC+ihVZpI6I+pocqIN+d/LmDV38Caa7t3bgTgWKUJkDs9SlZxS
 pqVkJnYgniUU82U5N/yRLE6ZeULUJB/WHE8QUzpQJEsqFsjW+dLj5Fy8MlX8VRSPiZrvXcxK
 IrKR8VDwyeSni8LPx7c0mq7+wjC1++50bw4KDf4p7+egrhh3ljPVXhUW69ldlx52Iu6e5Ul4
 TGwyd2pLoeSVayTkbkTkKdeOlb6NmsEyreOlNHdp85N5LXpztX5T1v7te0crr+9p9xS4ZsLW
 pY1Jbyx2DGfohn/Pt46uueAMXRD/GVNjCjJFpYxeRWhSlP8DjYy1a1oDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5+7q8XBJE+JXRaSJGULrRcs6Ut0utIF6QKVK09tNDU2My0C
 lxq1nK2BSnlpmm3mVq6tuyni0FyamdqsMCutUNJZ5qyVWbPoy8uP3wPP8+Vl8MBr5GxGkZQi
 qJJkSgklIkSbYzIXf561QL5UUx0M3tEzBBRVWSlou2FBYL2lwWCgYS10jQ0i+PnkKQ4FeW0I
 St+9xuFWYw+CmopTFHS8nw6d3mEKXHnnKMi8UkXBs0/jGHTnGzCw2DfBG9NHApr1ZRgUDFBQ
 WJCJ+U8/Bj5TJQ2mjDDorbhEw/g7Kbh63CQ4i10k1LyKgIsl3RQ8rHER0HivF4OOB0UU9Fh/
 k9Dc2ETAWG4ItF3QkXDdU0bBpzETDibvMA3tdUYMGo0zwZblbz39dYKER7o6DE6X38Sg82U1
 gtozbzGwW90UOL2DGDjseTj8MDcg6M0doiE7x0dDoSYXwbnsfAKyuqPh53f/cvGoFDSXbQRc
 /+VGq2N5a4kV8c7BYZzPchzjf3ifU3zNmJHgH5dx/P1Lr2k+q/YVzRvtR3lHxSL+ysMBjC8d
 8ZK8vfIsxdtHDDSvHerEeE9rK70ldLdoZYKgVKQKqsjYeJG8r+8LcaSDSbvqMxAZyEJrUQDD
 sVFcocGDTzLFLuRevPD95SB2HufQfSS1SMTgrHsq11X8Ek0GM9jNnNPiwbSIYQg2jDPmhE9q
 Mbuca6q1oX+dczmLre5vT4Df/zK3EpMcyEZzeqOF0COREU2pREGKpNREmUIZvUR9WJ6epEhb
 ciA50Y78D2Q6OX7hHhrtWFuPWAZJpombBubLA0lZqjo9sR5xDC4JEmvu+pU4QZZ+XFAl71Md
 VQrqehTCEJJg8fodQnwge0iWIhwWhCOC6n+KMQGzM5C5pSTmWZz+fNEXd/4K/bc9t324B4Wc
 CHb09c65sUC67Xe4q3XDTqdx+8buuBD91lDp4ER5V3hcWnwMFSdxaGOrPyekRPVHVE0otxx8
 bo5a1XJ1na59VZ9hmVcYGY54kLdGF7krJ3K/OVQmCW6w7c15O/VO9oehIP06j7uwf+XIXQmh
 lsuki3CVWvYHX/MN/zwDAAA=
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

