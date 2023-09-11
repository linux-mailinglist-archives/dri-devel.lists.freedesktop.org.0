Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A057F79A734
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F64610E280;
	Mon, 11 Sep 2023 10:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C40010E285
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694427511; x=1725963511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yUDGq1LbTHEUofJgXQxeITc9uln2nxkF7swh59IxVzA=;
 b=UYicO32bs2s7aVEZFS7M90EVMCZ/pGzLwzXa3XIJBRstnmGlvmxqhkz8
 uGqWCQRYGGmJtX2mpUdWkRn4g/4wZqtm5uL1BTJ1Q1dGLU0y3tEFcyE57
 nAJAe4Po7iw+MxB+a8hMIenL/fgCBUgL9oriBgjhNrBrdsGjxR1GQl/nn
 iny1FVd/gnLlfxiNmXwg5zv/RyWONN03wC5u8ZRK/1yy8WCrBzNGacONl
 7LV7kM7MJzRTH4lxcsWVGY2+Yc+OnvVPk47sszkDaYRB44q5YyOAYgYuM
 LnpJPIlz0r1JTgWlIIi0O1XPTS9jWDfc0jWVuEsrHykMoPqazwyFaEs9q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="409013116"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="409013116"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:18:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="772533046"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="772533046"
Received: from adolasin-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.intel.com) ([10.213.28.224])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:18:29 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/ttm/tests: Don't pass order as page flags
Date: Mon, 11 Sep 2023 12:18:00 +0200
Message-Id: <8606c5667263b780d2e0f3073f38641c847d9c49.1694422112.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694422112.git.karolina.stolarek@intel.com>
References: <cover.1694422112.git.karolina.stolarek@intel.com>
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

Delete a leftover order definition from ttm_pool_pre_populated() helper.
Pass an empty page flag to ttm_tt_kunit_init().

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

