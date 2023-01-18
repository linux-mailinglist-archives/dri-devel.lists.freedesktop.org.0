Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEFF6721B8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE1510E785;
	Wed, 18 Jan 2023 15:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E84E10E784;
 Wed, 18 Jan 2023 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674056736; x=1705592736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r4W7l/3g2FF9m+Bbn+8NEkNQ+AUW9MsI1xwl1GBeVcA=;
 b=kUt88PFkfsOJ3giMyl1qJ69QOXxX8r8xqbhHBG5+LCcHDLHdA1Az/UOB
 OvGB8c9tJVQzXLI7norMldebbnRo5829I91RzWm300IXr84AtYmTc/xO1
 pSLfeZlYoWnxeep//m3gNvJoZs5IYdC0jbCVX8o/SVFlWvaDCJJzSidk8
 GhYQ6QUGV462c3a6pB1c/UUGAA+KxURlkN4cjm5yEyrSWRiM88mZ4Mt5w
 xUu4skEXgxpVlD+QQPaegoo/0C3TyRkS4Ob164OvzgbA4tTm1u+LI1J69
 +ScGwodxNqwOoamfhhoD+KlrCT9cEoeJHbQfvXngPNDSfalV8zekXpPYB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322701359"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="322701359"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:45:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661759365"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="661759365"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:45:30 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/7] io_uring: use __xchg if possible
Date: Wed, 18 Jan 2023 16:44:48 +0100
Message-Id: <20230118154450.73842-5-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118154450.73842-1-andrzej.hajda@intel.com>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently introduced helper simplifies the code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 io_uring/io_uring.c | 7 ++-----
 io_uring/slist.h    | 6 ++----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 2ac1cd8d23ea62..2b46a692d69022 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -54,6 +54,7 @@
 #include <linux/fdtable.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/percpu.h>
 #include <linux/slab.h>
 #include <linux/bvec.h>
@@ -1095,8 +1096,6 @@ static void __io_req_find_next_prep(struct io_kiocb *req)
 
 static inline struct io_kiocb *io_req_find_next(struct io_kiocb *req)
 {
-	struct io_kiocb *nxt;
-
 	/*
 	 * If LINK is set, we have dependent requests in this chain. If we
 	 * didn't fail this request, queue the first one up, moving any other
@@ -1105,9 +1104,7 @@ static inline struct io_kiocb *io_req_find_next(struct io_kiocb *req)
 	 */
 	if (unlikely(req->flags & IO_DISARM_MASK))
 		__io_req_find_next_prep(req);
-	nxt = req->link;
-	req->link = NULL;
-	return nxt;
+	return __xchg(&req->link, NULL);
 }
 
 static void ctx_flush_and_put(struct io_ring_ctx *ctx, bool *locked)
diff --git a/io_uring/slist.h b/io_uring/slist.h
index f27601fa46607b..d3a743a1adc626 100644
--- a/io_uring/slist.h
+++ b/io_uring/slist.h
@@ -2,6 +2,7 @@
 #define INTERNAL_IO_SLIST_H
 
 #include <linux/io_uring_types.h>
+#include <linux/non-atomic/xchg.h>
 
 #define wq_list_for_each(pos, prv, head)			\
 	for (pos = (head)->first, prv = NULL; pos; prv = pos, pos = (pos)->next)
@@ -121,10 +122,7 @@ static inline void wq_list_del(struct io_wq_work_list *list,
 static inline
 struct io_wq_work_node *wq_stack_extract(struct io_wq_work_node *stack)
 {
-	struct io_wq_work_node *node = stack->next;
-
-	stack->next = node->next;
-	return node;
+	return __xchg(&stack->next, stack->next->next);
 }
 
 static inline struct io_wq_work *wq_next_work(struct io_wq_work *work)
-- 
2.34.1

