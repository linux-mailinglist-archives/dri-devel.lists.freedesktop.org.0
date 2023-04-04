Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B06D6D9B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA6C10E796;
	Tue,  4 Apr 2023 20:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D246710E7A3;
 Tue,  4 Apr 2023 20:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680638855; x=1712174855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sVeAl0LJgppUUvMgxCSPNnqWYtg52UGwS9nkoILVWys=;
 b=AASTFasDeAksYrKdoQTABsbpQOQJiaPKFmv+XgmpTftxidq/tOLEztfF
 9QXll0rqq19KE+2YTm60JaZsGcmMvrJdUgnzOx97lFYS0En9EtX8W6z1s
 pnjqIhkNlvANQHUNwZuN+258jtxt4C74Zpn1OvQ9eHcBhIiVzrO16TR+P
 nnFfB8hQjGeV3Uh2mBApz7NbWNHHh7Vp4MpDc+SkIIx13hXVW0XJILwUV
 aX4ZarRoLmwvVkc1duiCtnKaAPjGZUEnKT5e2vdmaiOClvlxyzkmjAfzg
 JU/EQlWw9GT0/6Vowy+svWEEb2HOJQM+gzuCNqnLX6r9L7qApr4ro2kzi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="326324758"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="326324758"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689022018"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="689022018"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.33.67])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:07:33 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v3 2/3] drm/ttm: Reduce the number of used allocation
 orders for TTM pages
Date: Tue,  4 Apr 2023 22:06:49 +0200
Message-Id: <20230404200650.11043-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
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
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
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
v3:
- Avoid compilation errors for architectures with special PFN_SHIFTs

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index dfce896c4bae..18c342a919a2 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -47,6 +47,11 @@
 
 #include "ttm_module.h"
 
+#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
+#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
+/* Some architectures have a weird PMD_SHIFT */
+#define TTM_DIM_ORDER (__TTM_DIM_ORDER <= MAX_ORDER ? __TTM_DIM_ORDER : MAX_ORDER)
+
 /**
  * struct ttm_pool_dma - Helper object for coherent DMA mappings
  *
@@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
 
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
@@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	else
 		gfp_flags |= GFP_HIGHUSER;
 
-	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
+	for (order = min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages));
 	     num_pages;
 	     order = min_t(unsigned int, order, __fls(num_pages))) {
 		struct ttm_pool_type *pt;
@@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 
 	if (use_dma_alloc) {
 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < MAX_ORDER; ++j)
+			for (j = 0; j < TTM_DIM_ORDER; ++j)
 				ttm_pool_type_init(&pool->caching[i].orders[j],
 						   pool, i, j);
 	}
@@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
 
 	if (pool->use_dma_alloc) {
 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < MAX_ORDER; ++j)
+			for (j = 0; j < TTM_DIM_ORDER; ++j)
 				ttm_pool_type_fini(&pool->caching[i].orders[j]);
 	}
 
@@ -637,7 +642,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
 	unsigned int i;
 
 	seq_puts(m, "\t ");
-	for (i = 0; i < MAX_ORDER; ++i)
+	for (i = 0; i < TTM_DIM_ORDER; ++i)
 		seq_printf(m, " ---%2u---", i);
 	seq_puts(m, "\n");
 }
@@ -648,7 +653,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
 {
 	unsigned int i;
 
-	for (i = 0; i < MAX_ORDER; ++i)
+	for (i = 0; i < TTM_DIM_ORDER; ++i)
 		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
 	seq_puts(m, "\n");
 }
@@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 {
 	unsigned int i;
 
+	BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
+	BUILD_BUG_ON(TTM_DIM_ORDER < 1);
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
@@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
 {
 	unsigned int i;
 
-	for (i = 0; i < MAX_ORDER; ++i) {
+	for (i = 0; i < TTM_DIM_ORDER; ++i) {
 		ttm_pool_type_fini(&global_write_combined[i]);
 		ttm_pool_type_fini(&global_uncached[i]);
 
-- 
2.39.2

