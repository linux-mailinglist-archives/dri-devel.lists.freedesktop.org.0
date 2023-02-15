Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E269808B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC91910EB26;
	Wed, 15 Feb 2023 16:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88510EB26;
 Wed, 15 Feb 2023 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477751; x=1708013751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lg54Wj3Uus7sgYkxzG0fkQLBuUlNaWkXXIuWPp8+ayM=;
 b=UdK5Mro7bgLWRglXkZgifToheaq4mfXffpULsFJs0Hik7Ky09bl/ehzH
 UEdGNYEshB95cY46F4Zcz4tCWTAvsxQ8I43UxI94BJF5Tlsxpgf5k0+HD
 GMjrSaUKjHlLdMeXOPWKtY1OYwfLnTWUpBC5Lj9oO9tB5BSbHZQbKfqS5
 F7LvgDTdLIVcaLpVSEVl4fGXen2Yn226PJ8QeJoHfiyjSEKZBfdG1Xpaz
 YyND4zOsNOiJfQ3n3/PEeqJfhMa8W3aC38LAJ4H+ZwIppmhGcVaaI08xF
 Zf17T+cIaZGBy5+DHMxuPrhBs9X/pC34fC2LgOsVYIbwF1f6+sgTxzPmi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393871158"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393871158"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472824"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472824"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:41 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 15/16] drm/ttm: Use fault-injection to test error paths
Date: Wed, 15 Feb 2023 17:14:04 +0100
Message-Id: <20230215161405.187368-16-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-graphics-maintainer@vmware.com,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use fault-injection to test partial TTM swapout and interrupted swapin.
Return -EINTR for swapin to test the callers ability to handle and
restart the swapin, and on swapout perform a partial swapout to test that
the swapin and release_shrunken functionality.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Kconfig        | 10 ++++++++++
 drivers/gpu/drm/ttm/ttm_pool.c | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1efd33411a92..a78eed9af2c1 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -202,6 +202,16 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
+config DRM_TTM_SHRINK_FAULT_INJECT
+	bool "Enable fault injection during TTM shrinking"
+	depends on DRM_TTM
+	default n
+	help
+	  Inject recoverable failures during TTM shrinking and recovery of
+	  shrunken objects. For DRM driver developers only.
+
+	  If in doubt, choose N.
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 319998b4a325..d7c604593689 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -453,6 +453,7 @@ static bool ttm_pool_restore_valid(const struct ttm_pool_tt_restore *restore)
 static int ttm_pool_swapin(struct ttm_pool_tt_restore *restore,
 			   struct ttm_operation_ctx *ctx)
 {
+	static unsigned long __maybe_unused swappedin;
 	unsigned int i, nr = 1 << restore->order;
 	int ret = 0;
 
@@ -468,6 +469,13 @@ static int ttm_pool_swapin(struct ttm_pool_tt_restore *restore,
 			if (swap.val == 0)
 				continue;
 
+			if (IS_ENABLED(CONFIG_DRM_TTM_SHRINK_FAULT_INJECT) &&
+			    ctx->interruptible &&
+			    ++swappedin % 100 == 0) {
+				ret = -EINTR;
+				break;
+			}
+
 			ret = swap_copy_folio(swap, restore->first_page[i], 0,
 					      ctx->interruptible);
 			if (ret)
@@ -905,7 +913,14 @@ long ttm_pool_shrink_tt(struct ttm_pool *pool, struct ttm_tt *ttm)
 	if (current_is_kswapd())
 		alloc_gfp |= __GFP_NOMEMALLOC;
 
-	for (i = 0; i < ttm->num_pages; ++i) {
+	num_pages = ttm->num_pages;
+
+	/* Pretend doing fault injection by shrinking only half of the pages. */
+
+	if (IS_ENABLED(CONFIG_DRM_TTM_SHRINK_FAULT_INJECT))
+		num_pages = DIV_ROUND_UP(num_pages, 2);
+
+	for (i = 0; i < num_pages; ++i) {
 		page = ttm->pages[i];
 		if (unlikely(!page))
 			continue;
-- 
2.34.1

