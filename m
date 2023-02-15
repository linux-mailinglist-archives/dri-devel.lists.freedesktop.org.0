Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F269805D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C003610E269;
	Wed, 15 Feb 2023 16:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271B410E269;
 Wed, 15 Feb 2023 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477718; x=1708013718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CA6Gd5JNe0QIjwqEaLurGUUyFsS+XKhHwV/GCIHG1zw=;
 b=AakKCsX99plUdfGH8SbAL292jriIjFAAB/B8NEXd3K8m9/Tprp06fDRS
 gpIRR1Bz91mGVJgZWspbGoGd7mB086ejEfJuwjzvkp0cn7tG1OsAIpXMQ
 uoQshIlHSbVCqBe/R+ks9P5A0zCu4OHYzK516CmgZbht6Y4/2+PT1zx6Z
 GTDsVnd1VjNl4TNfFcMMKM62h3YJ2etqvJkGaUQEtFNYWIfiPazu/Zdel
 KXo+CPaTQduRuSvwO4E2Z2GdvCtkEtoIhqHjAEt7kUSrEm0INu9KBB7g6
 idi0YaUBLvGBz+m09MxDWAw1GlIavmFAGm4okEth8HxKI0QuR6Yk5dfGX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393870966"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393870966"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472509"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472509"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:10 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 09/16] drm/ttm: Introduce shrink throttling.
Date: Wed, 15 Feb 2023 17:13:58 +0100
Message-Id: <20230215161405.187368-10-thomas.hellstrom@linux.intel.com>
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

Since pages are not immediately freed by the TTM shrinker but rather
inserted into the swap cache, the system will keep on calling the
shrinker rapidly filling the swap cache which has a negative impact
on system performance.

When shrinking, throttle on the number of pages present in the swap
cache.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 5a57117c21ec..848adf2a623e 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -432,6 +432,42 @@ static unsigned long ttm_tt_shrinker_count(struct shrinker *shrink,
 	return num_pages ? num_pages : SHRINK_EMPTY;
 }
 
+#define TTM_SWAP_MIN_SWAP_PAGES (SZ_128M >> PAGE_SHIFT)
+#define TTM_SWAP_MAX_SWAPCACHE_PAGES (SZ_1G >> PAGE_SHIFT)
+static unsigned long ttm_tt_shrinker_throttle(unsigned long pages)
+{
+	unsigned long
+		tmp = get_nr_swap_pages();
+
+	/*
+	 * Draining available swap space too far will trigger
+	 * systemd-oomd even if there are a huge number of dirty pages
+	 * available for laundry and free in the swap cache. Don't drain
+	 * the available swap-space too far.
+	 */
+	if (tmp > TTM_SWAP_MIN_SWAP_PAGES)
+		tmp -= TTM_SWAP_MIN_SWAP_PAGES;
+	else
+		tmp = 0;
+
+	pages = min(tmp, pages);
+
+	/*
+	 * Our shrinker doesn't immediately free pages unless they belong
+	 * to purgeable objects. Rather they are inserted into the swap-cache.
+	 * But the system doesn't really get this and continues to call our
+	 * shrinker thinking it's still out of memory, when it could just
+	 * laundry pages in the swap cache and free them. So throttle on the
+	 * number of pages in the swap cache.
+	 */
+
+	tmp = total_swapcache_pages();
+	if (tmp > TTM_SWAP_MAX_SWAPCACHE_PAGES)
+		pages = 0;
+
+	return pages;
+}
+
 static unsigned long ttm_tt_shrinker_scan(struct shrinker *shrink,
 					  struct shrink_control *sc)
 {
@@ -459,6 +495,10 @@ static unsigned long ttm_tt_shrinker_scan(struct shrinker *shrink,
 		nr_to_scan -= freed;
 	else
 		nr_to_scan = 0;
+
+	if (nr_to_scan)
+		nr_to_scan = ttm_tt_shrinker_throttle(nr_to_scan);
+
 	if (!nr_to_scan)
 		return freed ? freed : SHRINK_STOP;
 
-- 
2.34.1

