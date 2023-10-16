Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F377CA2AA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 10:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C38210E150;
	Mon, 16 Oct 2023 08:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDED10E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697446352; x=1728982352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uREWBZ3QE3lo5PZJ/8XOcyWiLRSSuZeDtPbh0pmAYkg=;
 b=BLKckb0+IJ4hFCi5OJJ047Q0m4nVzTi/iXGny8rspDkLdJK9Jef9Z4B1
 DM47nUqXomyCx/Zb0Wjn8D2Vxi2rmGym1h8udUEY6zWoO73Vmk7oteBn9
 /jxB5VWfN124Ywwg6zb7u2ldarZDaSx0AuItvEmRGA0XfUdUCY7nl2aD2
 l/2C80oVEF754vkH5oAdXjelG0QezY1YWOFZTf55XTYrqEihZB0iTO8JT
 hf9p+KBh8+qQuF0yJHdAH9iYLIw00HChT7RKVtrJMmlTNTFWJc6Yo46BB
 6uTDlV/ixEUmoasa/poaAPGmLRGocj5a54yxiJbRCnnJZEB9JIfInn4kn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416548628"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="416548628"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 01:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002858723"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="1002858723"
Received: from gsawicki-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.intel.com) ([10.213.0.246])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 01:52:30 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/4] drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
Date: Mon, 16 Oct 2023 10:52:10 +0200
Message-Id: <e6d4e94e871e9e8b5b39872e6e0b25613968b5a6.1697445193.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1697445193.git.karolina.stolarek@intel.com>
References: <cover.1697445193.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove a leftover definition of page order and pass an empty flag value
in ttm_pool_pre_populated().

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 2d9cae8cd984..b97f7b6daf5b 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -78,10 +78,9 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
 	struct ttm_test_devices *devs = priv->devs;
 	struct ttm_pool *pool;
 	struct ttm_tt *tt;
-	unsigned long order = __fls(size / PAGE_SIZE);
 	int err;
 
-	tt = ttm_tt_kunit_init(test, order, caching, size);
+	tt = ttm_tt_kunit_init(test, 0, caching, size);
 	KUNIT_ASSERT_NOT_NULL(test, tt);
 
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
-- 
2.25.1

