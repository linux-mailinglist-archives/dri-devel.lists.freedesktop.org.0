Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBFF8C67F9
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 15:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F0710E91F;
	Wed, 15 May 2024 13:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nIEWiQt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4C610E5D2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:58:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E21A6614D5;
 Wed, 15 May 2024 13:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40576C32786;
 Wed, 15 May 2024 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715781480;
 bh=5mlKKVq2eJW/2EfLe5DfEKj2I4ZhUMzP6qbNsK6waI0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nIEWiQt3XuLSsZQZbWwRK/SZdLBw0yS/Z0FGjHBgaacZPjdEhuvlesyZ8P2aS0pKQ
 srv93C5wQVlqvWYipTMZJtZkgbHq/VwWSyr800bzc1x5redx59NQJdYgwBXAAOXVp3
 bd/xYluu06uM4adros5GaK5yunJRLnzDWy3zsrWOlhAz4ooJ7GaW7Refb43pAaAke+
 pD4dZONJjf5kqS7QGfLgjzNkk8J9bmYLNCnLz4HFQBSobuX9Ph5jn4qfMdiIkcX4Fa
 sMtVnTiOpr2gkKTD8v9lNzqDJXZ5ixtZSVg6BTB/p1gmSmVvl0HWAyEOChq5jbIPfh
 dJB3NWSekMMSg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:57:01 +0200
Subject: [PATCH 6/8] dma-buf: heaps: system: Handle ECC flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-6-54cbbd049511@kernel.org>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5mlKKVq2eJW/2EfLe5DfEKj2I4ZhUMzP6qbNsK6waI0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+wMqyhNdctYvMNP72vKxoNKqpU9Xykhq7o8rXG6Tn
 j5n3OvTMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACai9oKxviBz/06PH5mvm05b
 6tktPvglcFHO/COB24oK7X9dO274mbmNbaropF3il/T3vueOYvK4zlhnOz+6QcGIT+jg7wdWG/p
 ro9hjbR7cPlj0R+6uyrtsn7LCnum7/dcYenOmb/x/NPNHRxkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Now that we have introduced ECC-related flags for the dma-heaps buffer
allocations, let's honour these flags depending on the memory setup.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 8b5e6344eea4..dd7c8b6f9cf6 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -18,13 +18,15 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/of.h>
 
 struct system_heap {
 	struct dma_heap *heap;
+	bool ecc_enabled;
 };
 
 struct system_heap_buffer {
 	struct dma_heap *heap;
 	struct list_head attachments;
@@ -336,10 +338,11 @@ static struct page *alloc_largest_available(unsigned long size,
 static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 					    unsigned long len,
 					    unsigned long fd_flags,
 					    unsigned long heap_flags)
 {
+	struct system_heap *sys_heap = dma_heap_get_drvdata(heap);
 	struct system_heap_buffer *buffer;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	unsigned long size_remaining = len;
 	unsigned int max_order = orders[0];
 	struct dma_buf *dmabuf;
@@ -347,10 +350,16 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	struct scatterlist *sg;
 	struct list_head pages;
 	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;
 
+	if (!sys_heap->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_PROTECTED))
+		return ERR_PTR(-EINVAL);
+
+	if (sys_heap->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_UNPROTECTED))
+		return ERR_PTR(-EINVAL);
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&buffer->attachments);
@@ -430,10 +439,13 @@ static int system_heap_create(void)
 
 	sys_heap = kzalloc(sizeof(*sys_heap), GFP_KERNEL);
 	if (!sys_heap)
 		return -ENOMEM;
 
+	if (of_memory_get_ecc_correction_bits() > 0)
+		sys_heap->ecc_enabled = true;
+
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
 	exp_info.priv = sys_heap;
 
 	sys_heap->heap = dma_heap_add(&exp_info);

-- 
2.44.0

