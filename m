Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E1E3B7B48
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 03:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A2C6E916;
	Wed, 30 Jun 2021 01:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA2B6E0DF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 01:34:31 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 cx9-20020a17090afd89b0290170a3e085edso316771pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 18:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UQZ07rpmRfbC0AgTi5yXuUE7gB8O5W4feOgGAG87EuE=;
 b=lI4aTLFVPfy3aDa/WPXf6U9K2UtE4k3b0Yguy0hbp6hS2U+BLPP62Hi80UtchaZxij
 Y1bkau+GAlBQr/JpELHPPrBoJJrbSJ+8rx3beyRdgIye5ef0nMxCF70YkuwquwrkIto3
 r4SkX1A6lLFV/HGICKCzSKMpRpyOYCfvFTRaXmqegic/u8ocgz0YcpbzTQ64byDw/sFY
 3uq2PGFX47h175CsbqvafjEiOfBudegy0Wj2fHQf26j3DgdQuasRbnz47xtKUchGad35
 5GPa/0oWnbTxwuVRYo71q8xL6I3sTYoXMCyjUrkxG5H1AJyHNkzZOqs+lK/9x5goq0JL
 uSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UQZ07rpmRfbC0AgTi5yXuUE7gB8O5W4feOgGAG87EuE=;
 b=hWcmy0UBMCFoVM2/nLAdjyL1NgVN/PsYXmdbdGh1GIshN/L/YqXjCKQKy2p4UubI5y
 1Vm7IGjUJ78NIkT879gf9sfnzL3BNLv5vJKk6AdLzgIXiFeZieCSguXqzzvJiiSxSHDx
 ih9aSqmjEo68Pk2YOFbL+QeFp6etskerDZEjVGjoiomSB6KKUtaDBzAHm2PMyusfiNM/
 K6Y0qBU5JDgn1aLhucnGefCBqDwnWPhIXG14OyHcW1OZ5Hp37EreVb3UMOqyVQyDImXY
 tDbE8y2/D1BHAKqU+jRMuYZZfRsl0cBQjPFRrrCs+l6c2VUfkYxgCwbZe711VpiEnhAr
 3d2Q==
X-Gm-Message-State: AOAM531F7LnlfuXiOzINvQojdSyeO2v6jTOwIOXoSC5xvQivgETNcL5r
 xgJWdC8XrwttYUcf2lE5kT94fw==
X-Google-Smtp-Source: ABdhPJzxuY8XMWMewO/Jp0JI4aaqWdpv5THu0uBWtq1Ey7qw6x5RoV/BZhpDv6UYzo2biHMOt34RBg==
X-Received: by 2002:a17:902:ed95:b029:ee:aa46:547a with SMTP id
 e21-20020a170902ed95b02900eeaa46547amr30530303plj.27.1625016871442; 
 Tue, 29 Jun 2021 18:34:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 g8sm20252901pja.14.2021.06.29.18.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 18:34:30 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 1/5] drm: Add a sharable drm page-pool implementation
Date: Wed, 30 Jun 2021 01:34:17 +0000
Message-Id: <20210630013421.735092-2-john.stultz@linaro.org>
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

This adds a shrinker controlled page pool, extracted
out of the ttm_pool logic, and abstracted out a bit
so it can be used by other non-ttm drivers.

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
v8:
* Completely rewritten from scratch, using only the
  ttm_pool logic so it can be dual licensed.
v9:
* Add Kerneldoc comments similar to tmm implementation
  as suggested by ChristianK
* Mark some functions static as suggested by ChristianK
* Fix locking issue ChristianK pointed out
* Add methods to block the shrinker so users can
  make atomic calculations across multiple pools, as
  suggested by ChristianK
* Fix up Kconfig dependency issue as Reported-by:
  kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/Kconfig     |   3 +
 drivers/gpu/drm/Makefile    |   2 +
 drivers/gpu/drm/page_pool.c | 297 ++++++++++++++++++++++++++++++++++++
 include/drm/page_pool.h     |  68 +++++++++
 4 files changed, 370 insertions(+)
 create mode 100644 drivers/gpu/drm/page_pool.c
 create mode 100644 include/drm/page_pool.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3c16bd1afd87..52d9ba92b35e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -177,6 +177,9 @@ config DRM_DP_CEC
 	  Note: not all adapters support this feature, and even for those
 	  that do support this they often do not hook up the CEC pin.
 
+config DRM_PAGE_POOL
+	bool
+
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5279db4392df..affa4ca3a08e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -39,6 +39,8 @@ obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 drm_ttm_helper-y := drm_gem_ttm_helper.o
 obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 
+drm-$(CONFIG_DRM_PAGE_POOL) += page_pool.o
+
 drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
 		drm_dsc.o drm_probe_helper.o \
 		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o \
diff --git a/drivers/gpu/drm/page_pool.c b/drivers/gpu/drm/page_pool.c
new file mode 100644
index 000000000000..c07bbe3afc32
--- /dev/null
+++ b/drivers/gpu/drm/page_pool.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Sharable page pool implementation
+ *
+ * Extracted from drivers/gpu/drm/ttm/ttm_pool.c
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2021 Linaro Ltd.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Christian König, John Stultz
+ */
+
+#include <linux/module.h>
+#include <linux/highmem.h>
+#include <linux/shrinker.h>
+#include <drm/page_pool.h>
+
+static unsigned long page_pool_size; /* max size of the pool */
+
+MODULE_PARM_DESC(page_pool_size, "Number of pages in the drm page pool");
+module_param(page_pool_size, ulong, 0644);
+
+static atomic_long_t nr_managed_pages;
+
+static struct mutex shrinker_lock;
+static struct list_head shrinker_list;
+static struct shrinker mm_shrinker;
+
+/**
+ * drm_page_pool_set_max - Sets maximum size of all pools
+ *
+ * Sets the maximum number of pages allows in all pools.
+ * This can only be set once, and the first caller wins.
+ */
+void drm_page_pool_set_max(unsigned long max)
+{
+	if (!page_pool_size)
+		page_pool_size = max;
+}
+
+/**
+ * drm_page_pool_get_max - Maximum size of all pools
+ *
+ * Return the maximum number of pages allows in all pools
+ */
+unsigned long drm_page_pool_get_max(void)
+{
+	return page_pool_size;
+}
+
+/**
+ * drm_page_pool_get_total - Current size of all pools
+ *
+ * Return the number of pages in all managed pools
+ */
+unsigned long drm_page_pool_get_total(void)
+{
+	return atomic_long_read(&nr_managed_pages);
+}
+
+/**
+ * drm_page_pool_get_size - Get the number of pages in the pool
+ *
+ * @pool: Pool to calculate the size of
+ *
+ * Return the number of pages in the specified pool
+ */
+unsigned long drm_page_pool_get_size(struct drm_page_pool *pool)
+{
+	unsigned long size;
+
+	spin_lock(&pool->lock);
+	size = pool->page_count;
+	spin_unlock(&pool->lock);
+	return size;
+}
+
+/**
+ * drm_page_pool_add - Add a page to a pool
+ *
+ * @pool: Pool to add page to
+ * @page: Page to be added to the pool
+ *
+ * Gives specified page into a specific pool
+ */
+void drm_page_pool_add(struct drm_page_pool *pool, struct page *p)
+{
+	unsigned int i, num_pages = 1 << pool->order;
+
+	/* Make sure we won't grow larger then the max pool size */
+	if (page_pool_size &&
+	       ((drm_page_pool_get_total()) + num_pages > page_pool_size)) {
+		pool->free(pool, p);
+		return;
+	}
+
+	/* Be sure to zero pages before adding them to the pool */
+	for (i = 0; i < num_pages; ++i) {
+		if (PageHighMem(p))
+			clear_highpage(p + i);
+		else
+			clear_page(page_address(p + i));
+	}
+
+	spin_lock(&pool->lock);
+	list_add(&p->lru, &pool->pages);
+	pool->page_count += 1 << pool->order;
+	spin_unlock(&pool->lock);
+	atomic_long_add(1 << pool->order, &nr_managed_pages);
+
+}
+
+/**
+ * drm_page_pool_remove - Remove page from pool
+ *
+ * @pool: Pool to pull the page from
+ *
+ * Take pages from a specific pool, return NULL when nothing available
+ */
+struct page *drm_page_pool_remove(struct drm_page_pool *pool)
+{
+	struct page *p;
+
+	spin_lock(&pool->lock);
+	p = list_first_entry_or_null(&pool->pages, typeof(*p), lru);
+	if (p) {
+		atomic_long_sub(1 << pool->order, &nr_managed_pages);
+		pool->page_count -= 1 << pool->order;
+		list_del(&p->lru);
+	}
+	spin_unlock(&pool->lock);
+
+	return p;
+}
+
+/**
+ * drm_page_pool_init - Initialize a pool
+ *
+ * @pool: the pool to initialize
+ * @order: page allocation order
+ * @free_page: function pointer to free the pool's pages
+ *
+ * Initialize and add a pool type to the global shrinker list
+ */
+void drm_page_pool_init(struct drm_page_pool *pool, unsigned int order,
+			void (*free_page)(struct drm_page_pool *pool, struct page *p))
+{
+	pool->order = order;
+	spin_lock_init(&pool->lock);
+	INIT_LIST_HEAD(&pool->pages);
+	pool->free = free_page;
+	pool->page_count = 0;
+
+	mutex_lock(&shrinker_lock);
+	list_add_tail(&pool->shrinker_list, &shrinker_list);
+	mutex_unlock(&shrinker_lock);
+}
+
+/**
+ * drm_page_pool_fini - Cleanup a pool
+ *
+ * @pool: the pool to clean up
+ *
+ * Remove a pool_type from the global shrinker list and free all pages
+ */
+void drm_page_pool_fini(struct drm_page_pool *pool)
+{
+	struct page *p;
+
+	mutex_lock(&shrinker_lock);
+	list_del(&pool->shrinker_list);
+	mutex_unlock(&shrinker_lock);
+
+	while ((p = drm_page_pool_remove(pool)))
+		pool->free(pool, p);
+}
+
+/**
+ * drm_page_pool_shrink - Shrink the drm page pool
+ *
+ * Free pages using the global shrinker list. Returns
+ * the number of pages free
+ */
+unsigned int drm_page_pool_shrink(void)
+{
+	struct drm_page_pool *pool;
+	unsigned int num_freed;
+	struct page *p;
+
+	mutex_lock(&shrinker_lock);
+	pool = list_first_entry(&shrinker_list, typeof(*pool), shrinker_list);
+
+	p = drm_page_pool_remove(pool);
+	if (p) {
+		pool->free(pool, p);
+		num_freed = 1 << pool->order;
+	} else {
+		num_freed = 0;
+	}
+
+	list_move_tail(&pool->shrinker_list, &shrinker_list);
+	mutex_unlock(&shrinker_lock);
+
+	return num_freed;
+}
+
+/* As long as pages are available make sure to release at least one */
+static unsigned long drm_page_pool_shrinker_scan(struct shrinker *shrink,
+						 struct shrink_control *sc)
+{
+	unsigned long num_freed = 0;
+
+	do
+		num_freed += drm_page_pool_shrink();
+	while (!num_freed && atomic_long_read(&nr_managed_pages));
+
+	return num_freed;
+}
+
+/* Return the number of pages available or SHRINK_EMPTY if we have none */
+static unsigned long drm_page_pool_shrinker_count(struct shrinker *shrink,
+						  struct shrink_control *sc)
+{
+	unsigned long num_pages = atomic_long_read(&nr_managed_pages);
+
+	return num_pages ? num_pages : SHRINK_EMPTY;
+}
+
+/**
+ * dma_page_pool_lock_shrinker - Take the shrinker lock
+ *
+ * Takes the shrinker lock, preventing the shrinker from making
+ * changes to the pools
+ */
+void dma_page_pool_lock_shrinker(void)
+{
+	mutex_lock(&shrinker_lock);
+}
+
+/**
+ * dma_page_pool_unlock_shrinker - Release the shrinker lock
+ *
+ * Releases the shrinker lock, allowing the shrinker to free
+ * pages
+ */
+void dma_page_pool_unlock_shrinker(void)
+{
+	mutex_unlock(&shrinker_lock);
+}
+
+/**
+ * drm_page_pool_shrinker_init - Initialize globals
+ *
+ * Initialize the global locks and lists for the shrinker.
+ */
+static int drm_page_pool_shrinker_init(void)
+{
+	mutex_init(&shrinker_lock);
+	INIT_LIST_HEAD(&shrinker_list);
+
+	mm_shrinker.count_objects = drm_page_pool_shrinker_count;
+	mm_shrinker.scan_objects = drm_page_pool_shrinker_scan;
+	mm_shrinker.seeks = 1;
+	return register_shrinker(&mm_shrinker);
+}
+
+/**
+ * drm_page_pool_shrinker_fini - Finalize globals
+ *
+ * Unregister the shrinker.
+ */
+static void drm_page_pool_shrinker_fini(void)
+{
+	unregister_shrinker(&mm_shrinker);
+	WARN_ON(!list_empty(&shrinker_list));
+}
+
+module_init(drm_page_pool_shrinker_init);
+module_exit(drm_page_pool_shrinker_fini);
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/page_pool.h b/include/drm/page_pool.h
new file mode 100644
index 000000000000..860cf6c92aab
--- /dev/null
+++ b/include/drm/page_pool.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Extracted from include/drm/ttm/ttm_pool.h
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2021 Linaro Ltd
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Christian König, John Stultz
+ */
+
+#ifndef _DRM_PAGE_POOL_H_
+#define _DRM_PAGE_POOL_H_
+
+#include <linux/mmzone.h>
+#include <linux/llist.h>
+#include <linux/spinlock.h>
+
+/**
+ * drm_page_pool - Page Pool for a certain memory type
+ *
+ * @order: the allocation order our pages have
+ * @pages: the list of pages in the pool
+ * @shrinker_list: our place on the global shrinker list
+ * @lock: protection of the page list
+ * @page_count: number of pages currently in the pool
+ * @free: Function pointer to free the page
+ */
+struct drm_page_pool {
+	unsigned int order;
+	struct list_head pages;
+	struct list_head shrinker_list;
+	spinlock_t lock;
+
+	unsigned long page_count;
+	void (*free)(struct drm_page_pool *pool, struct page *p);
+};
+
+void drm_page_pool_set_max(unsigned long max);
+unsigned long drm_page_pool_get_max(void);
+unsigned long drm_page_pool_get_total(void);
+unsigned int drm_page_pool_shrink(void);
+unsigned long drm_page_pool_get_size(struct drm_page_pool *pool);
+void drm_page_pool_add(struct drm_page_pool *pool, struct page *p);
+struct page *drm_page_pool_remove(struct drm_page_pool *pool);
+void dma_page_pool_lock_shrinker(void);
+void dma_page_pool_unlock_shrinker(void);
+void drm_page_pool_init(struct drm_page_pool *pool, unsigned int order,
+			void (*free_page)(struct drm_page_pool *pool, struct page *p));
+void drm_page_pool_fini(struct drm_page_pool *pool);
+
+#endif
-- 
2.25.1

