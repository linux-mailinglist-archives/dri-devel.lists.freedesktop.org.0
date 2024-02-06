Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42A84B03D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 09:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8D11124C5;
	Tue,  6 Feb 2024 08:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F92010E2CE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 04:15:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CB3612FC;
 Mon,  5 Feb 2024 20:16:10 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.42.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E71473F762;
 Mon,  5 Feb 2024 20:15:24 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm/cma: Drop cma_get_name()
Date: Tue,  6 Feb 2024 09:45:18 +0530
Message-Id: <20240206041518.438801-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Feb 2024 08:46:32 +0000
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

cma_get_name() just returns cma->name without any additional transformation
unlike other helpers such as cma_get_base() and cma_get_size(). This helper
is not worth the additional indirection, and can be dropped after replacing
directly with cma->name in the sole caller __add_cma_heap().

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 include/linux/cma.h              | 1 -
 mm/cma.c                         | 5 -----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 4a63567e93ba..6ceb15060b02 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -376,7 +376,7 @@ static int __add_cma_heap(struct cma *cma, void *data)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	exp_info.name = cma->name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
diff --git a/include/linux/cma.h b/include/linux/cma.h
index 9db877506ea8..12ab7cd1d529 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -25,7 +25,6 @@ struct cma;
 extern unsigned long totalcma_pages;
 extern phys_addr_t cma_get_base(const struct cma *cma);
 extern unsigned long cma_get_size(const struct cma *cma);
-extern const char *cma_get_name(const struct cma *cma);
 
 extern int __init cma_declare_contiguous_nid(phys_addr_t base,
 			phys_addr_t size, phys_addr_t limit,
diff --git a/mm/cma.c b/mm/cma.c
index ed6581ef50c1..2627f4ba481f 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -45,11 +45,6 @@ unsigned long cma_get_size(const struct cma *cma)
 	return cma->count << PAGE_SHIFT;
 }
 
-const char *cma_get_name(const struct cma *cma)
-{
-	return cma->name;
-}
-
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {
-- 
2.25.1

