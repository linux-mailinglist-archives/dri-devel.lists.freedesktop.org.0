Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EBB3B7B4B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 03:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D086E91A;
	Wed, 30 Jun 2021 01:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADF16E915
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 01:34:37 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 cx9-20020a17090afd89b0290170a3e085edso316940pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 18:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFvfw3znc9/iNgUeu9+epS+fTvKPZKLuhAUaTL0kY/M=;
 b=oJpnLzmEuM+/uMBXpQoc4X8AngeoGclUDsnVQ33jUTM2egEVhMJCBUDpXcH6nrLmLx
 82TQkoyi4f0rkpVhElAKnsaSTOfD6OmughNSeXmHMm+j4LHIzeDaZawrx4TFdwTvkvrZ
 0m6YLmyM3JPKZ8t0/wSpkHfYfoZ4A9e2eiQIAkun3gG80Bv2aYJYlKVh5V2HokFE8Byx
 TN0BFmtpEVrmCsBlOzxffG4lfxMs3c2pDf5aLQfsmtPizwrjdnpBOK0zpapq/F9k2KvW
 PYJ4xkQ78400cqdx6qVaZ5sZDY5J2AxtEr6nCwEa+0qA9T50kiR/CxbeBV30DR1XWWdt
 6I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFvfw3znc9/iNgUeu9+epS+fTvKPZKLuhAUaTL0kY/M=;
 b=E3+kdlPRhKZVMGelRTOGgfgSen3DfLZutvdE+vHMYc1ANHyD6C91fG8Gz5BNCZdiun
 ek5Fiq5oCuZTk5GglXbYRdrGu7h24vkW7zERyhK5tXJ0WTlh+o3XV4EQxaWP2mXAP/vX
 vgKXByoMFo1HFpXFyICKr74A5oDHAH/J7ioicmYqGJAELePXul1QEL3n6XulkH/5fdKX
 jhRuuMF5KRCE+5zk7/OLNfezG2pWGaQwtxqjT7W23L9lokgAsMAvxYXuq5d6zHUrROkb
 G+KQYO3EjaspKS0yo/uYPhbkNv3/sticpIfnE5lNvnBaqUCDpOhr6mxneR/8HMGtD0EN
 42dg==
X-Gm-Message-State: AOAM5303PGP9XsoFiw3/AGmqeO0QTX4/It+d73iO001LKaAYRdqE9Ipa
 G+BucZD4FkEIzYxP8Q+s27C9bQ==
X-Google-Smtp-Source: ABdhPJye9DDg0sagcLOtuXFoJZtGmUVapq2S6vfxaIYk+1HENhJqEUJ3Rpiz4dsjZGx74LGwHaDkvw==
X-Received: by 2002:a17:902:6b84:b029:ee:f966:1911 with SMTP id
 p4-20020a1709026b84b02900eef9661911mr30460530plk.69.1625016877203; 
 Tue, 29 Jun 2021 18:34:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 g8sm20252901pja.14.2021.06.29.18.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 18:34:36 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 5/5] dma-buf: system_heap: Add deferred freeing to the
 system heap
Date: Wed, 30 Jun 2021 01:34:21 +0000
Message-Id: <20210630013421.735092-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630013421.735092-1-john.stultz@linaro.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Utilize the deferred free helper library in the system heap.

This provides a nice performance bump and puts the
system heap performance on par with ION.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Rework deferred-free api to use reason enum as suggested by
  Suren Baghdasaryan
* Rework for deferred-free api change to use nr_pages rather
  than size as suggsted by Suren Baghdasaryan
v8:
* Reworked to drop buffer zeroing logic, as the drm_page_pool now
  handles that.
---
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 28 ++++++++++++++++++++++------
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 7e28934e0def..10632ccfb4a5 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -5,6 +5,7 @@ config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
 	select DRM_PAGE_POOL
+	select DMABUF_HEAPS_DEFERRED_FREE
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 85ceca2ed61d..8a0170b0427e 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -22,6 +22,7 @@
 #include <linux/vmalloc.h>
 
 #include <drm/page_pool.h>
+#include "deferred-free-helper.h"
 
 static struct dma_heap *sys_heap;
 
@@ -33,6 +34,7 @@ struct system_heap_buffer {
 	struct sg_table sg_table;
 	int vmap_cnt;
 	void *vaddr;
+	struct deferred_freelist_item deferred_free;
 };
 
 struct dma_heap_attachment {
@@ -290,27 +292,41 @@ static void system_heap_free_pages(struct drm_page_pool *pool, struct page *p)
 	__free_pages(p, pool->order);
 }
 
-static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+static void system_heap_buf_free(struct deferred_freelist_item *item,
+				 enum df_reason reason)
 {
-	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct system_heap_buffer *buffer;
 	struct sg_table *table;
 	struct scatterlist *sg;
 	int i, j;
 
+	buffer = container_of(item, struct system_heap_buffer, deferred_free);
 	table = &buffer->sg_table;
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		struct page *page = sg_page(sg);
 
-		for (j = 0; j < NUM_ORDERS; j++) {
-			if (compound_order(page) == orders[j])
-				break;
+		if (reason == DF_UNDER_PRESSURE) {
+			__free_pages(page, compound_order(page));
+		} else {
+			for (j = 0; j < NUM_ORDERS; j++) {
+				if (compound_order(page) == orders[j])
+					break;
+			}
+			drm_page_pool_add(&pools[j], page);
 		}
-		drm_page_pool_add(&pools[j], page);
 	}
 	sg_free_table(table);
 	kfree(buffer);
 }
 
+static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
+
+	deferred_free(&buffer->deferred_free, system_heap_buf_free, npages);
+}
+
 static const struct dma_buf_ops system_heap_buf_ops = {
 	.attach = system_heap_attach,
 	.detach = system_heap_detach,
-- 
2.25.1

