Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D7B7A66E9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 16:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4405810E3DB;
	Tue, 19 Sep 2023 14:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E5610E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695134462; x=1726670462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uREWBZ3QE3lo5PZJ/8XOcyWiLRSSuZeDtPbh0pmAYkg=;
 b=oKLCWepniCpSJpqzT3on04OK1dIClmKKQZP4uXKraJihJrajQjfT6Drl
 exqOU66bW5QRV+6PepVnSh0k56lXxr8ZhvhPN2vnUO18oXx+KH19iz1aB
 0ztYzCnWRQMFGpfvyIeqSylQ9du+5/G3WQN6GPH/mltqfzqXJN4DQbnkg
 uYLMpHnLocqHkPjyfDh4G01sQWIIgc7Y22SUkNC//3ykGrGqqkhk5uULc
 SBW9VxZOFx23uqxJsS8tz9WOuVC1fX5AMX1mjFh+ewpun7z9sYoBg1gbt
 IOms+vOiKwnK+vdBWlb634JRU2j4JM2OXbY1b4au8RGOuecBjmv/L82Hf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410886801"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="410886801"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="811743185"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="811743185"
Received: from jbrzezin-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.17.188])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:40:07 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
Date: Tue, 19 Sep 2023 16:39:45 +0200
Message-Id: <a4c3c436d7adf7bd672df8bb5b26936b5277b5e1.1695133574.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695133574.git.karolina.stolarek@intel.com>
References: <cover.1695133574.git.karolina.stolarek@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
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

