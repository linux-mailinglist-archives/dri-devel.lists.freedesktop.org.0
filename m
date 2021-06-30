Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A4B3B7B4A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 03:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CFE6E917;
	Wed, 30 Jun 2021 01:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2742B6E917
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 01:34:36 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id m26so578823pgb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 18:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aWRozxEZbZiEAkUcrsi4H8KZcPOe7QSabHgZIf7aL7Y=;
 b=Da6F842aFiiJPMknoXqgJWMwKzz5M/o97rrB+COxWjuTsD9IrcbHN6yM2wBE1zidOj
 PP4BqMx/KJSaXO69vhBiPMRp99ydGeIRCqky4kRx6lAgW9YEmee51H3uX6XBuZIi9wxt
 0Umg0zdZPwvdBwfPYrdAsfgVfpAi+WOrB5+h23Rl61pBzEE70J8Wa/E7zfoJe18S/iZx
 MvGdMTXCsndySLPEu8e3v/RbASUn023YASvM5kX89tT3FAtsMrtBcDk7IWlzEhdpZCBn
 ovDSNnfTSWbmfxNyzX4kawYvweEHm1BXPPVSQz8U5BqQYPn8JNc8z4z54NWE+5vQ9EKJ
 xxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWRozxEZbZiEAkUcrsi4H8KZcPOe7QSabHgZIf7aL7Y=;
 b=mQCtSvc6QLnPJwIG3txp33PIvhD1pLsmJq2z241kQT+s/AgbKzvF8ynxUncwRpNWVz
 AFm1U/7/c3TcUP7WyqAIrUi3GVf10KEbeN0gzfAOMS5yd3LZvxPTPX5TrK408EJ3WI6h
 z37DXnbaGXUXE3CgD9a0WoCXnZIuv4QuIeuIo45q/SApex8VChKVP8n47mV8v0LCJ89a
 b7mhRr1ZHrsyViC/21mKz/q4sBjTVhhD577Dx4QGU3tZnoOuDlnwOnen4bKvB9q1RxTr
 UeK4Ry7s5CEBZaLyd6DV3+pennvF/lGOxNXizWu/ZxbES0jTmI/sA9GcvnqZ3hOZ6zTm
 RCAA==
X-Gm-Message-State: AOAM530u+VboKZUEj4YtnngdO81ciQ7MGp3BRxl51lYmqdMCelacsVgu
 iyDgZKXW36kU1FAi499oP0HhFQ==
X-Google-Smtp-Source: ABdhPJxoBxKKikgU3Z/Fu8P1ar70mlUUjSCGePfCookEsRkfPjRE/u3WGIlnshh7FdbV9iash/WBiA==
X-Received: by 2002:aa7:8e19:0:b029:30c:3dbc:8d0f with SMTP id
 c25-20020aa78e190000b029030c3dbc8d0fmr14041514pfr.27.1625016875788; 
 Tue, 29 Jun 2021 18:34:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 g8sm20252901pja.14.2021.06.29.18.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 18:34:35 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 4/5] dma-buf: heaps: Add deferred-free-helper library code
Date: Wed, 30 Jun 2021 01:34:20 +0000
Message-Id: <20210630013421.735092-5-john.stultz@linaro.org>
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

This patch provides infrastructure for deferring buffer frees.

This is a feature ION provided which when used with some form
of a page pool, provides a nice performance boost in an
allocation microbenchmark. The reason it helps is it allows the
page-zeroing to be done out of the normal allocation/free path,
and pushed off to a kthread.

As not all heaps will find this useful, its implemented as
a optional helper library that heaps can utilize.

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
* Fix sleep in atomic issue from using a mutex, by switching
  to a spinlock as Reported-by: kernel test robot <oliver.sang@intel.com>
* Cleanup API to use a reason enum for clarity and add some documentation
  comments as suggested by Suren Baghdasaryan.
v3:
* Minor tweaks so it can be built as a module
* A few small fixups suggested by Daniel Mentz
v4:
* Tweak from Daniel Mentz to make sure the shrinker
  count/freed values are tracked in pages not bytes
v5:
* Fix up page count tracking as suggested by Suren Baghdasaryan
v7:
* Rework accounting to use nr_pages rather then size, as suggested
  by Suren Baghdasaryan
---
 drivers/dma-buf/heaps/Kconfig                |   3 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/deferred-free-helper.c | 138 +++++++++++++++++++
 drivers/dma-buf/heaps/deferred-free-helper.h |  55 ++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index f19bf1f82bc2..7e28934e0def 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,3 +1,6 @@
+config DMABUF_HEAPS_DEFERRED_FREE
+	tristate
+
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032..4e7839875615 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DMABUF_HEAPS_DEFERRED_FREE) += deferred-free-helper.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
diff --git a/drivers/dma-buf/heaps/deferred-free-helper.c b/drivers/dma-buf/heaps/deferred-free-helper.c
new file mode 100644
index 000000000000..e19c8b68dfeb
--- /dev/null
+++ b/drivers/dma-buf/heaps/deferred-free-helper.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Deferred dmabuf freeing helper
+ *
+ * Copyright (C) 2020 Linaro, Ltd.
+ *
+ * Based on the ION page pool code
+ * Copyright (C) 2011 Google, Inc.
+ */
+
+#include <linux/freezer.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <linux/swap.h>
+#include <linux/sched/signal.h>
+
+#include "deferred-free-helper.h"
+
+static LIST_HEAD(free_list);
+static size_t list_nr_pages;
+wait_queue_head_t freelist_waitqueue;
+struct task_struct *freelist_task;
+static DEFINE_SPINLOCK(free_list_lock);
+
+void deferred_free(struct deferred_freelist_item *item,
+		   void (*free)(struct deferred_freelist_item*,
+				enum df_reason),
+		   size_t nr_pages)
+{
+	unsigned long flags;
+
+	INIT_LIST_HEAD(&item->list);
+	item->nr_pages = nr_pages;
+	item->free = free;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	list_add(&item->list, &free_list);
+	list_nr_pages += nr_pages;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+	wake_up(&freelist_waitqueue);
+}
+EXPORT_SYMBOL_GPL(deferred_free);
+
+static size_t free_one_item(enum df_reason reason)
+{
+	unsigned long flags;
+	size_t nr_pages;
+	struct deferred_freelist_item *item;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	if (list_empty(&free_list)) {
+		spin_unlock_irqrestore(&free_list_lock, flags);
+		return 0;
+	}
+	item = list_first_entry(&free_list, struct deferred_freelist_item, list);
+	list_del(&item->list);
+	nr_pages = item->nr_pages;
+	list_nr_pages -= nr_pages;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+
+	item->free(item, reason);
+	return nr_pages;
+}
+
+static unsigned long get_freelist_nr_pages(void)
+{
+	unsigned long nr_pages;
+	unsigned long flags;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	nr_pages = list_nr_pages;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+	return nr_pages;
+}
+
+static unsigned long freelist_shrink_count(struct shrinker *shrinker,
+					   struct shrink_control *sc)
+{
+	return get_freelist_nr_pages();
+}
+
+static unsigned long freelist_shrink_scan(struct shrinker *shrinker,
+					  struct shrink_control *sc)
+{
+	unsigned long total_freed = 0;
+
+	if (sc->nr_to_scan == 0)
+		return 0;
+
+	while (total_freed < sc->nr_to_scan) {
+		size_t pages_freed = free_one_item(DF_UNDER_PRESSURE);
+
+		if (!pages_freed)
+			break;
+
+		total_freed += pages_freed;
+	}
+
+	return total_freed;
+}
+
+static struct shrinker freelist_shrinker = {
+	.count_objects = freelist_shrink_count,
+	.scan_objects = freelist_shrink_scan,
+	.seeks = DEFAULT_SEEKS,
+	.batch = 0,
+};
+
+static int deferred_free_thread(void *data)
+{
+	while (true) {
+		wait_event_freezable(freelist_waitqueue,
+				     get_freelist_nr_pages() > 0);
+
+		free_one_item(DF_NORMAL);
+	}
+
+	return 0;
+}
+
+static int deferred_freelist_init(void)
+{
+	list_nr_pages = 0;
+
+	init_waitqueue_head(&freelist_waitqueue);
+	freelist_task = kthread_run(deferred_free_thread, NULL,
+				    "%s", "dmabuf-deferred-free-worker");
+	if (IS_ERR(freelist_task)) {
+		pr_err("Creating thread for deferred free failed\n");
+		return -1;
+	}
+	sched_set_normal(freelist_task, 19);
+
+	return register_shrinker(&freelist_shrinker);
+}
+module_init(deferred_freelist_init);
+MODULE_LICENSE("GPL v2");
+
diff --git a/drivers/dma-buf/heaps/deferred-free-helper.h b/drivers/dma-buf/heaps/deferred-free-helper.h
new file mode 100644
index 000000000000..11940328ce3f
--- /dev/null
+++ b/drivers/dma-buf/heaps/deferred-free-helper.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef DEFERRED_FREE_HELPER_H
+#define DEFERRED_FREE_HELPER_H
+
+/**
+ * df_reason - enum for reason why item was freed
+ *
+ * This provides a reason for why the free function was called
+ * on the item. This is useful when deferred_free is used in
+ * combination with a pagepool, so under pressure the page can
+ * be immediately freed.
+ *
+ * DF_NORMAL:         Normal deferred free
+ *
+ * DF_UNDER_PRESSURE: Free was called because the system
+ *                    is under memory pressure. Usually
+ *                    from a shrinker. Avoid allocating
+ *                    memory in the free call, as it may
+ *                    fail.
+ */
+enum df_reason {
+	DF_NORMAL,
+	DF_UNDER_PRESSURE,
+};
+
+/**
+ * deferred_freelist_item - item structure for deferred freelist
+ *
+ * This is to be added to the structure for whatever you want to
+ * defer freeing on.
+ *
+ * @nr_pages: number of pages used by item to be freed
+ * @free: function pointer to be called when freeing the item
+ * @list: list entry for the deferred list
+ */
+struct deferred_freelist_item {
+	size_t nr_pages;
+	void (*free)(struct deferred_freelist_item *i,
+		     enum df_reason reason);
+	struct list_head list;
+};
+
+/**
+ * deferred_free - call to add item to the deferred free list
+ *
+ * @item: Pointer to deferred_freelist_item field of a structure
+ * @free: Function pointer to the free call
+ * @nr_pages: number of pages to be freed
+ */
+void deferred_free(struct deferred_freelist_item *item,
+		   void (*free)(struct deferred_freelist_item *i,
+				enum df_reason reason),
+		   size_t nr_pages);
+#endif
-- 
2.25.1

