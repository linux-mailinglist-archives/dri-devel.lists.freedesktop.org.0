Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D46AE318
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCEA10E4D9;
	Tue,  7 Mar 2023 14:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7736110E4D5;
 Tue,  7 Mar 2023 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678200452; x=1709736452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LJQuvh6GVNJoJUngRBTHj6FV4nPpG8xXndw7yOVQK30=;
 b=HBOvh85n19fu5Cp6htyG+wN0MoyPOplXyUxA511ld4lM68diVhVVo/C1
 p3SmnmtMQYWcxNK4VK7baunWjwMElEZs/2aJQWPGfws4ozseBmPfKVkHq
 NVodMlaY+xd/VcOAqE7CnINU00EJhjk5RN+JUVEF6kgvIbxRwv5pRb86B
 AFwX9lolzKyWxd/4U6HXU0yiH2owLV/yQoQ6f5PMTfgbwvGm+8YWajPXJ
 FG/NQioiQX2rUJzOnJKhfYawj8iYpBZIfnmvB3A9t7shv3p0sWqAbUv8/
 SU2VmPECQRFZHlKIRgESjenoapUmQXjJufRXuo2RPHSL0WCWiVlc+CAoS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400687328"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="400687328"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:47:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800414435"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="800414435"
Received: from peiwangc-mobl1.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.10])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:47:28 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/ttm: Reduce the number of used allocation orders
 for TTM pages
Date: Tue,  7 Mar 2023 15:46:20 +0100
Message-Id: <20230307144621.10748-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When swapping out, we will split multi-order pages both in order to
move them to the swap-cache and to be able to return memory to the
swap cache as soon as possible on a page-by-page basis.
Reduce the page max order to the system PMD size, as we can then be nicer
to the system and avoid splitting gigantic pages.

Looking forward to when we might be able to swap out PMD size folios
without splitting, this will also be a benefit.

v2:
- Include all orders up to the PMD size (Christian König)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 0b6e20613d19..939845d853af 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -47,6 +47,9 @@
 
 #include "ttm_module.h"
 
+#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
+#define TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
+
 /**
  * struct ttm_pool_dma - Helper object for coherent DMA mappings
  *
@@ -65,11 +68,11 @@ module_param(page_pool_size, ulong, 0644);
 
 static atomic_long_t allocated_pages;
 
-static struct ttm_pool_type global_write_combined[MAX_ORDER];
-static struct ttm_pool_type global_uncached[MAX_ORDER];
+static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
+static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
 
-static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
-static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
+static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
+static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
 
 static spinlock_t shrinker_lock;
 static struct list_head shrinker_list;
@@ -431,7 +434,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	else
 		gfp_flags |= GFP_HIGHUSER;
 
-	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
+	for (order = min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages));
 	     num_pages;
 	     order = min_t(unsigned int, order, __fls(num_pages))) {
 		struct ttm_pool_type *pt;
@@ -550,7 +553,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 
 	if (use_dma_alloc) {
 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < MAX_ORDER; ++j)
+			for (j = 0; j < TTM_DIM_ORDER; ++j)
 				ttm_pool_type_init(&pool->caching[i].orders[j],
 						   pool, i, j);
 	}
@@ -570,7 +573,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
 
 	if (pool->use_dma_alloc) {
 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < MAX_ORDER; ++j)
+			for (j = 0; j < TTM_DIM_ORDER; ++j)
 				ttm_pool_type_fini(&pool->caching[i].orders[j]);
 	}
 
@@ -624,7 +627,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
 	unsigned int i;
 
 	seq_puts(m, "\t ");
-	for (i = 0; i < MAX_ORDER; ++i)
+	for (i = 0; i < TTM_DIM_ORDER; ++i)
 		seq_printf(m, " ---%2u---", i);
 	seq_puts(m, "\n");
 }
@@ -635,7 +638,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
 {
 	unsigned int i;
 
-	for (i = 0; i < MAX_ORDER; ++i)
+	for (i = 0; i < TTM_DIM_ORDER; ++i)
 		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
 	seq_puts(m, "\n");
 }
@@ -738,13 +741,15 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 {
 	unsigned int i;
 
+	BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
+
 	if (!page_pool_size)
 		page_pool_size = num_pages;
 
 	spin_lock_init(&shrinker_lock);
 	INIT_LIST_HEAD(&shrinker_list);
 
-	for (i = 0; i < MAX_ORDER; ++i) {
+	for (i = 0; i < TTM_DIM_ORDER; ++i) {
 		ttm_pool_type_init(&global_write_combined[i], NULL,
 				   ttm_write_combined, i);
 		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
@@ -777,7 +782,7 @@ void ttm_pool_mgr_fini(void)
 {
 	unsigned int i;
 
-	for (i = 0; i < MAX_ORDER; ++i) {
+	for (i = 0; i < TTM_DIM_ORDER; ++i) {
 		ttm_pool_type_fini(&global_write_combined[i]);
 		ttm_pool_type_fini(&global_uncached[i]);
 
-- 
2.39.2

