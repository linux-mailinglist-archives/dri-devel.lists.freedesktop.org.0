Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8C2437309
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 09:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343C26E8F5;
	Fri, 22 Oct 2021 07:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-1.mail.aliyun.com (out28-1.mail.aliyun.com [115.124.28.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40846E511
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 01:49:44 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1947132|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00895314-0.00138788-0.989659;
 FP=13645255560291118206|1|1|8|0|-1|-1|-1; HT=ay29a033018047211;
 MF=huangshuosheng@allwinnertech.com; NM=1; PH=DS; RN=10; RT=10; SR=0;
 TI=SMTPD_---.LflF5bR_1634867362; 
Received: from allwinnertech.com(mailfrom:huangshuosheng@allwinnertech.com
 fp:SMTPD_---.LflF5bR_1634867362)
 by smtp.aliyun-inc.com(10.147.40.44); Fri, 22 Oct 2021 09:49:41 +0800
From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
To: sumit.semwal@linaro.org, lmark@codeaurora.org, labbott@redhat.com,
 Brian.Starkey@arm.com, john.stultz@linaro.org, christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Shuosheng Huang <huangshuosheng@allwinnertech.com>
Subject: [PATCH v2] dma-buf: heaps: init heaps in subsys_initcall
Date: Fri, 22 Oct 2021 09:48:50 +0800
Message-Id: <20211022014850.22933-1-huangshuosheng@allwinnertech.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Oct 2021 07:46:03 +0000
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

Some built-in modules will failed to use dma-buf heap to allocate
memory if the heap drivers are too late to be initialized.
To fix this issue, move initialization of dma-buf heap drivers in
subsys_initcall() which is more earlier to be called.

Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 2 +-
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0c05b79870f9..e051403a346d 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -400,6 +400,6 @@ static int add_default_cma_heap(void)
 
 	return ret;
 }
-module_init(add_default_cma_heap);
+subsys_initcall(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..3d6927657ec9 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -435,5 +435,5 @@ static int system_heap_create(void)
 
 	return 0;
 }
-module_init(system_heap_create);
+subsys_initcall(system_heap_create);
 MODULE_LICENSE("GPL v2");
-- 
2.29.0

