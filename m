Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976F7ACCD58
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 20:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE68E10E8F1;
	Tue,  3 Jun 2025 18:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDcuB+gK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3562210E8E8;
 Tue,  3 Jun 2025 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748976480; x=1780512480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WXKhhr+z0UCZg6yh5mirtVgA06WudZ0BQWfM68iQoow=;
 b=VDcuB+gKIvyWUJo6eunm35WpLMMQxjHI5tdjGpKYE12mDGCuYNisOx8j
 S1KCMyFpT27g8gsLZUtreIJVp0jMBI7hJghM4FdL2eDt8+z6C2hdxJy8T
 i6fjVlXf/fi2d+/XlsxXb8lKQusBkYdxKzf9hCyP5RWiE2luojIU1su+l
 3z6zr9woL8kJ180jIX5I7A0fXx1nBMFH8Utaa28bq50oBlo0ZWr24ebic
 K/y0Ix3QqZ+aIm1LQsxruyT0W2OlB5snem9xSsEd9OxH+M4uBjHowU2WU
 b+9ortAMcO17MPGSUB8xVQSPGfv07aNhiXu35+3IwTaJ/OQs9itcNKfQB A==;
X-CSE-ConnectionGUID: U42U7olFSwOQkLNKVZWgoQ==
X-CSE-MsgGUID: I4kJbuTcTH+zf+RIxGlpnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51033246"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="51033246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:47:58 -0700
X-CSE-ConnectionGUID: oHB13HARSMK6qZHbA7AvRg==
X-CSE-MsgGUID: 3+Kkqs3vQs2Hm/IAaw4jOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="144917744"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:47:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org,
	<intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/ttm: Fix build with CONFIG_DEBUG_FS=n
Date: Tue,  3 Jun 2025 11:47:51 -0700
Message-ID: <20250603184750.3304647-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the define outside the ifdef for CONFIG_DEBUG_FS to fix the build.
This currently breaks drm kunit tests:

	$ ./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/ttm/tests/.kunitconfig
	ERROR:root:../drivers/gpu/drm/ttm/ttm_pool.c: In function ‘ttm_pool_mgr_init’:
	../drivers/gpu/drm/ttm/ttm_pool.c:1335:30: error: ‘TTM_SHRINKER_BATCH’ undeclared (first use in this function)
	 1335 |         mm_shrinker->batch = TTM_SHRINKER_BATCH;

Fixes: 22b929b25293 ("drm/ttm: Increase pool shrinker batch target")
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index e671812789ea7..2dead28a6c1c0 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1132,6 +1132,9 @@ void ttm_pool_fini(struct ttm_pool *pool)
 }
 EXPORT_SYMBOL(ttm_pool_fini);
 
+/* Free average pool number of pages.  */
+#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
+
 static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
 					    struct shrink_control *sc)
 {
@@ -1265,9 +1268,6 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 }
 EXPORT_SYMBOL(ttm_pool_debugfs);
 
-/* Free average pool number of pages.  */
-#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
-
 /* Test the shrinker functions and dump the result */
 static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
 {
-- 
2.49.0

