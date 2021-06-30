Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1373B7B47
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 03:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506B96E0DF;
	Wed, 30 Jun 2021 01:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8A66E0DF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 01:34:34 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id i13so516694plb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lwmLoDhSeUynyw9WpwUoeXd78SHIQUhC9+ggRtjsFY=;
 b=HBlk9uLZFBTPmMPZXa1DY3yBqmvzmoLq9Ga/hS6DV3Y3+0uu6Cm9LR/zISXJR6fOeZ
 2MV8mIa2ielnvbs7nQz61soPcBst2ko+p169WKQAV9uGEe4EwPZ9oOpXACSwlTTk3NFQ
 O1vj4a+RurTq2Ka/FeTf/1mYe+EKjH3Jq+4//h3Wy3gMamx6gpGvk/jWd3dTZ/Ike12A
 bGHPqmy85MbuzF4v5xM+psqE8xDBcv0VTT2gs6X/Y23lHNgsX92PZV+dt3XuZmZXFP/i
 HqZ1uMOuBPYk+T8NWnglX/M0CeHZjgJEsocYYOa1vY6Fjat5gILcJ0r0gUdVM9GrsFB1
 3ODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lwmLoDhSeUynyw9WpwUoeXd78SHIQUhC9+ggRtjsFY=;
 b=irur8F/egr8DNADShug9mQJLbzh5fxn4o808pbcu7lw+PARhOJBj57jgSyRGbtGgHH
 dl9houoNK/VhLjIz179sECaxHT3kp4uswEyPc5MrXkyliDgf59hiMja7rO9wTqPVRkbp
 MQtvivCbyV1N8/sgKNNpyuCgr8uSvfhgWFa2THHxlUlaAn/PGEuQtp5ImfKlQZNRR1JZ
 K1mV+OQEE8gtmFMDMpqG+feGpZ54zT7rsp6bsBf6r2CVxM9WBu7BdQGvLkhgWXjMNsYV
 OFfQORwMSmU4R0xBKHi1ocTUXmJ/cymf4ygtvGKBneiGdRhfv429X0dC9gDo1jDt/ZO9
 KMAA==
X-Gm-Message-State: AOAM532k1Dt/BN1upfEI9Fdo8ZW9MerC85Y3Is8Y6rEHfgQvWTVZUpet
 U1MZvNSzQN6LChDph0BGvr6VIw==
X-Google-Smtp-Source: ABdhPJxMWCmXP/0OjhKqFlMasVLKq7rLdoTzTd5HNImYqVgNkNOOmmOdq+gMPC9r1CKc6CFEJnq2fQ==
X-Received: by 2002:a17:90a:5889:: with SMTP id
 j9mr36864843pji.234.1625016874317; 
 Tue, 29 Jun 2021 18:34:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 g8sm20252901pja.14.2021.06.29.18.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 18:34:33 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 3/5] dma-buf: system_heap: Add drm pagepool support to
 system heap
Date: Wed, 30 Jun 2021 01:34:19 +0000
Message-Id: <20210630013421.735092-4-john.stultz@linaro.org>
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

Utilize the drm pagepool code to speed up allocation
performance.

This is similar to the ION pagepool usage, but tries to
utilize generic code instead of a custom implementation.

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
* Fix build issue caused by selecting PAGE_POOL w/o NET
  as Reported-by: kernel test robot <lkp@intel.com>
v3:
* Simplify the page zeroing logic a bit by using kmap_atomic
  instead of vmap as suggested by Daniel Mentz
v5:
* Shift away from networking page pool completely to
  dmabuf page pool implementation
v6:
* Switch again to using the drm_page_pool code shared w/
  ttm_pool
v7:
* Slight rework for drm_page_pool changes
v8:
* Rework to use the rewritten drm_page_pool logic
* Drop explicit buffer zeroing, as the drm_page_pool handles that
v9:
* Fix compiler warning Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 26 +++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..f19bf1f82bc2 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,6 +1,7 @@
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
+	select DRM_PAGE_POOL
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index f57a39ddd063..85ceca2ed61d 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -21,6 +21,8 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#include <drm/page_pool.h>
+
 static struct dma_heap *sys_heap;
 
 struct system_heap_buffer {
@@ -54,6 +56,7 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, MID_ORDER_GFP, LOW_ORDER_GFP};
  */
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
+struct drm_page_pool pools[NUM_ORDERS];
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
 {
@@ -282,18 +285,27 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	dma_buf_map_clear(map);
 }
 
+static void system_heap_free_pages(struct drm_page_pool *pool, struct page *p)
+{
+	__free_pages(p, pool->order);
+}
+
 static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 {
 	struct system_heap_buffer *buffer = dmabuf->priv;
 	struct sg_table *table;
 	struct scatterlist *sg;
-	int i;
+	int i, j;
 
 	table = &buffer->sg_table;
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		struct page *page = sg_page(sg);
 
-		__free_pages(page, compound_order(page));
+		for (j = 0; j < NUM_ORDERS; j++) {
+			if (compound_order(page) == orders[j])
+				break;
+		}
+		drm_page_pool_add(&pools[j], page);
 	}
 	sg_free_table(table);
 	kfree(buffer);
@@ -324,7 +336,9 @@ static struct page *alloc_largest_available(unsigned long size,
 		if (max_order < orders[i])
 			continue;
 
-		page = alloc_pages(order_flags[i], orders[i]);
+		page = drm_page_pool_remove(&pools[i]);
+		if (!page)
+			page = alloc_pages(order_flags[i], orders[i]);
 		if (!page)
 			continue;
 		return page;
@@ -425,6 +439,12 @@ static const struct dma_heap_ops system_heap_ops = {
 static int system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
+	int i;
+
+	for (i = 0; i < NUM_ORDERS; i++) {
+		drm_page_pool_init(&pools[i], orders[i],
+				   system_heap_free_pages);
+	}
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
-- 
2.25.1

