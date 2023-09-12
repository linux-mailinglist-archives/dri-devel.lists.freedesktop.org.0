Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25E79D05F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437D510E40C;
	Tue, 12 Sep 2023 11:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D4110E40B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519388; x=1726055388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uREWBZ3QE3lo5PZJ/8XOcyWiLRSSuZeDtPbh0pmAYkg=;
 b=b06rKM+Wk7JjnErRDr82CgMjbWWy67PyXiMtEYUGRaie2DueRxEUTb5V
 +LNAmR4Dzg8ul/iIpDTOgRCkvbTMCMvZODcG0F3nM5+Ivt+1LkwV93Qv4
 qBd4LC33NgzjEQlKLq6denqWi4xo363WYUju0DJLY8BHkkseMvvJk94MB
 1Ety85vlfOmbOH2uKe55i4qvTA9P2+H1pYhJ51As6+BvxtB4yEa+zW5Im
 pjkn9y00LeF+pTeZ30OlEcAgcmvi0STY1dezE3m7Rl3VLjV5RFdqowK/d
 dS4RtBJjlG7HbYjQqc1celSd6eXqDXUPk2AjWCUJ57evGbzR+zgImbn99 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="382161533"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="382161533"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="772969526"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="772969526"
Received: from kwasilew-mobl8.ger.corp.intel.com (HELO
 kdrobnik-desk.intel.com) ([10.213.3.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:49:45 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
Date: Tue, 12 Sep 2023 13:49:21 +0200
Message-Id: <eebae34f42f581a2b5adfac5dcf3a1e3d1d8dfa2.1694517411.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694517411.git.karolina.stolarek@intel.com>
References: <cover.1694517411.git.karolina.stolarek@intel.com>
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

