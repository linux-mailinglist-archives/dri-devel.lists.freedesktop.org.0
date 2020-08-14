Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703AB245CFA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25726E443;
	Mon, 17 Aug 2020 07:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99706EB69
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 14:25:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id E1C3329A5C9
From: Ezequiel Garcia <ezequiel@collabora.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: heap-helpers: Set dma-buf exporter name
Date: Fri, 14 Aug 2020 11:25:16 -0300
Message-Id: <20200814142516.148934-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: kernel@collabora.com, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, "Andrew F . Davis" <afd@ti.com>,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the heap helper uses DEFINE_DMA_BUF_EXPORT_INFO,
which uses KBUILD_MODNAME for the dma_buf_export_info.exp_name.

This effectively makes all dma-bufs exported by the heap
helper as coming from "heap-helpers", instead of the actual heap name
(cma, system, etc).

Fix this by adding a dma-heap name getter, and then setting
dma_buf_export_info.exp_name.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/dma-buf/dma-heap.c           | 5 +++++
 drivers/dma-buf/heaps/heap-helpers.c | 1 +
 include/linux/dma-heap.h             | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index afd22c9dbdcf..13d001ee381a 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -190,6 +190,11 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 	return heap->priv;
 }
 
+const char *dma_heap_get_name(struct dma_heap *heap)
+{
+	return heap->name;
+}
+
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 9f964ca3f59c..47ecf9518442 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -30,6 +30,7 @@ struct dma_buf *heap_helper_export_dmabuf(struct heap_helper_buffer *buffer,
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
+	exp_info.exp_name = dma_heap_get_name(buffer->heap);
 	exp_info.ops = &heap_helper_ops;
 	exp_info.size = buffer->size;
 	exp_info.flags = fd_flags;
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 454e354d1ffb..0acf7e71afb5 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -50,6 +50,8 @@ struct dma_heap_export_info {
  */
 void *dma_heap_get_drvdata(struct dma_heap *heap);
 
+const char *dma_heap_get_name(struct dma_heap *heap);
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info:		information needed to register this heap
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
