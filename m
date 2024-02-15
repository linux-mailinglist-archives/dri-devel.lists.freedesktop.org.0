Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3945856B6F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428B010E401;
	Thu, 15 Feb 2024 17:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngGxD5bJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358DC10E136;
 Thu, 15 Feb 2024 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708019206; x=1739555206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ydBIJ4BSOuMNv4/d1kEpcsLwARN5fMaGVW2a+5OgKdE=;
 b=ngGxD5bJHXUr7ph1JZw176wfNxGFr2aestoliCf1sRvZaPLke98JGB29
 i5163OrAPzCVCq7rn4voD/slBYLIF8ltKU/qIVtRYBJCxNTpOF8TN+zdA
 ADtlHTSww2oWn+OVy0xdv0HaODBWLeeFp0q9544FwG0y6FbYYi97CzgNQ
 HkQTOYSzHO8L8l8Zb0Um0IRN38TeKAsU/NNZywvE5utHBeSwrtbWQmHgK
 4EaII5a6VjPIBGrXDQX4hYVJd4EfcvHitN9l8M0jWjubS46YppGBo1jWF
 Jai2337NCUVPrhoByavYMKnF2zaF0apB5AnDDGoPVXncDjKCWOtmdkthq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13513978"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13513978"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3892065"
Received: from dhalpin-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.158])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@redhat.com>
Subject: [PATCH 1/6] drm/tests/drm_buddy: fix 32b build
Date: Thu, 15 Feb 2024 17:44:32 +0000
Message-ID: <20240215174431.285069-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
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

Doesn't seem to compile on 32b, presumably due to u64 mod/division.
Simplest is to just switch over to u32 here. Also make print modifiers
consistent with that.

Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@redhat.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index fee6bec757d1..edacc1adb28f 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -21,7 +21,7 @@ static inline u64 get_size(int order, u64 chunk_size)
 
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 {
-	u64 mm_size, ps = SZ_4K, i, n_pages, total;
+	u32 mm_size, ps = SZ_4K, i, n_pages, total;
 	struct drm_buddy_block *block;
 	struct drm_buddy mm;
 	LIST_HEAD(left);
@@ -56,30 +56,30 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 		KUNIT_ASSERT_FALSE_MSG(test,
 				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							      ps, ps, list, 0),
-				       "buddy_alloc hit an error size=%d\n",
+				       "buddy_alloc hit an error size=%u\n",
 				       ps);
 	} while (++i < n_pages);
 
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%d\n", 3 * ps);
+			       "buddy_alloc didn't error size=%u\n", 3 * ps);
 
 	drm_buddy_free_list(&mm, &middle);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+			       "buddy_alloc didn't error size=%u\n", 3 * ps);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   2 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
+			       "buddy_alloc didn't error size=%u\n", 2 * ps);
 
 	drm_buddy_free_list(&mm, &right);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+			       "buddy_alloc didn't error size=%u\n", 3 * ps);
 	/*
 	 * At this point we should have enough contiguous space for 2 blocks,
 	 * however they are never buddies (since we freed middle and right) so
@@ -88,13 +88,13 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							    2 * ps, ps, &allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc hit an error size=%d\n", 2 * ps);
+			       "buddy_alloc hit an error size=%u\n", 2 * ps);
 
 	drm_buddy_free_list(&mm, &left);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							    3 * ps, ps, &allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc hit an error size=%d\n", 3 * ps);
+			       "buddy_alloc hit an error size=%u\n", 3 * ps);
 
 	total = 0;
 	list_for_each_entry(block, &allocated, link)
-- 
2.43.0

