Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E777DFA2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1A410E33F;
	Wed, 16 Aug 2023 10:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C768A10E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692183348; x=1723719348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1eMVWimSUIV7QWrHudamLXVRisQDmASt7dPPp3q9qRw=;
 b=lhijc7pC0l+eeYv1hLSCaF56gCDR81g748nzcCf8qL9rteHe+CVwWQEX
 qula8HbxHHQjIUYDp+nXVufcx4g4HBmwctcYPr+HQ/O0tAUG5XduM8/cp
 1t7rSWJLr1d1maBMg+vAfLa266MyIueIE7joYCUhclPdqS31qbJ9G/2TD
 FxNqK7mPZu8FuzXGKCN42cdZWRIC1m69PfN2D8Ai3c4k/2JXYH5vn8L3A
 XwSDUxDj8wYlzyj89gf1Z4S/eXU3Msldvjyp0WJ29D7p3PzSfkYZu8Veu
 OWXTsy4Y7Xrax1Oc3SIaIXXisefd0Z8vP+hI70kqsyCrs0D7KXPEFV8zl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458854197"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="458854197"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 03:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="877740539"
Received: from bokrzesi-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.9.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 03:55:50 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm/tests: Fix type conversion in ttm_pool_test
Date: Wed, 16 Aug 2023 12:55:08 +0200
Message-Id: <20230816105508.1135410-1-karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a warning about casting an integer of different size in
ttm_pool_alloc_basic_dma_addr() subtest. Cast the DMA address to
uintptr_t before casting it to a generic pointer.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308150419.PaHfWntn-lkp@intel.com/
---
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 8d90870fb199..2d9cae8cd984 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -228,8 +228,8 @@ static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
 	dma1 = tt->dma_address[0];
 	dma2 = tt->dma_address[tt->num_pages - 1];
 
-	KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
-	KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
+	KUNIT_ASSERT_NOT_NULL(test, (void *)(uintptr_t)dma1);
+	KUNIT_ASSERT_NOT_NULL(test, (void *)(uintptr_t)dma2);
 
 	ttm_pool_free(pool, tt);
 	ttm_tt_fini(tt);
-- 
2.25.1

