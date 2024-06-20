Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B8910BC1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B7210EB07;
	Thu, 20 Jun 2024 16:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IC6q9kYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DAD10EB06;
 Thu, 20 Jun 2024 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718900213; x=1750436213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nyXHlmPjmVl4BelSN8tZhMbFvc1+rhLZOViXqO1DZ20=;
 b=IC6q9kYftPsvg4DVVG6h1Oib0ICnb66t059bzbiGYptPxB3wTAzn7lIG
 4ahBoqGTqbWuZuBesV9mwHPGEA4xIbQJ/WL7EEgGev24ZNKsOOixJ8HHA
 oQ3K+fBAsC4zFIhSltnXdNn8LW2P5Bq96mCZBlwExDNf3GlQDQgd08GXs
 mzgfnP8rj4jFMLtj/L/Es9ygw2yUZZbYqAii9cpX1OH9yt54a7ZUJPtcN
 NBh+iiHjsm1jesZMe4HVGz/CwUc7W+N/D54lFFOTPrpP0q396LQmbD5hq
 RrqAqo81GqK25qIunP7jHA2uhOwbl+FhDfMCaPjuz9Pd4eNlD9Mwv5TDu w==;
X-CSE-ConnectionGUID: pPwjF4d8Sx+HxcXlnkISKA==
X-CSE-MsgGUID: ESPV/ZVdRQmfxLPce5Bw3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="26527449"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="26527449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 09:16:52 -0700
X-CSE-ConnectionGUID: 32wONTXWSm6NtiUu3O+0Ug==
X-CSE-MsgGUID: qYpf8XC4TNuEApblQzGYFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42400796"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 09:16:50 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/ttm/pool: Revert to clear-on-alloc to honor
 TTM_TT_FLAG_ZERO_ALLOC
Date: Thu, 20 Jun 2024 18:01:47 +0200
Message-ID: <20240620160147.29819-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently ttm pool is not honoring TTM_TT_FLAG_ZERO_ALLOC flag and
clearing pages on free. It does help with allocation latency but clearing
happens even if drm driver doesn't passes the flag. If clear on free
is needed then a new flag can be added for that purpose.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 6e1fd6985ffc..cbbd722185ee 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -224,15 +224,6 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 /* Give pages into a specific pool_type */
 static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
 {
-	unsigned int i, num_pages = 1 << pt->order;
-
-	for (i = 0; i < num_pages; ++i) {
-		if (PageHighMem(p))
-			clear_highpage(p + i);
-		else
-			clear_page(page_address(p + i));
-	}
-
 	spin_lock(&pt->lock);
 	list_add(&p->lru, &pt->pages);
 	spin_unlock(&pt->lock);
@@ -240,15 +231,26 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
 }
 
 /* Take pages from a specific pool_type, return NULL when nothing available */
-static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
+static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, bool clear)
 {
 	struct page *p;
 
 	spin_lock(&pt->lock);
 	p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
 	if (p) {
+		unsigned int i, num_pages = 1 << pt->order;
+
 		atomic_long_sub(1 << pt->order, &allocated_pages);
 		list_del(&p->lru);
+		if (clear) {
+			for (i = 0; i < num_pages; ++i) {
+				if (PageHighMem(p))
+					clear_highpage(p + i);
+				else
+					clear_page(page_address(p + i));
+			}
+		}
+
 	}
 	spin_unlock(&pt->lock);
 
@@ -279,7 +281,7 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
 	list_del(&pt->shrinker_list);
 	spin_unlock(&shrinker_lock);
 
-	while ((p = ttm_pool_type_take(pt)))
+	while ((p = ttm_pool_type_take(pt, false)))
 		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
 }
 
@@ -330,7 +332,7 @@ static unsigned int ttm_pool_shrink(void)
 	list_move_tail(&pt->shrinker_list, &shrinker_list);
 	spin_unlock(&shrinker_lock);
 
-	p = ttm_pool_type_take(pt);
+	p = ttm_pool_type_take(pt, false);
 	if (p) {
 		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
 		num_pages = 1 << pt->order;
@@ -457,10 +459,11 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	     num_pages;
 	     order = min_t(unsigned int, order, __fls(num_pages))) {
 		struct ttm_pool_type *pt;
+		bool clear = tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC;
 
 		page_caching = tt->caching;
 		pt = ttm_pool_select_type(pool, tt->caching, order);
-		p = pt ? ttm_pool_type_take(pt) : NULL;
+		p = pt ? ttm_pool_type_take(pt, clear) : NULL;
 		if (p) {
 			r = ttm_pool_apply_caching(caching, pages,
 						   tt->caching);
@@ -480,7 +483,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 				if (num_pages < (1 << order))
 					break;
 
-				p = ttm_pool_type_take(pt);
+				p = ttm_pool_type_take(pt, clear);
 			} while (p);
 		}
 
-- 
2.42.0

