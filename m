Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA748A83AE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89AC1134CB;
	Wed, 17 Apr 2024 13:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkbEYO3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADE11134CB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713359033; x=1744895033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3GqT6SMaEuf0YJvA7Ay8H3rHqzm3N5W/1jC/lM0CHOo=;
 b=DkbEYO3MqQDIInxV6Ib123O7zZEqVGBLnj2cg5cILm9peGb5NmFhMKBm
 7JCJV4ZjDghw+lXeC2LLHim9RPnWjFM43/Khi14QG/W63MNJytQHEZ6d1
 p5YFTgxZVUVefgbZ6+nClqfCKPT6X8wFucBscA2A4Pl61jSsSyozqZ0Sf
 wZZel27mpuaswuCTzWn4NIePVIecMLBJA5w0ugbaVNTYlf4ltKrt9K5Fs
 YDakF1/nz9vCwC8pgHQEtCypTxuwc+5f2CBP62WHNBp7blSMP9CrllgpP
 g+oPVpEKw8pj4nW85hiVxU0Qu4jMaOCy8akURD3abQgWrK5XXwzHdedae g==;
X-CSE-ConnectionGUID: m70lTVqwQ2emAdomCvRYzg==
X-CSE-MsgGUID: wY+FBfS0RCam2vSgrmlulg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20268272"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="20268272"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:41 -0700
X-CSE-ConnectionGUID: kvqendY1SPSqQT6y9fer5g==
X-CSE-MsgGUID: xaLApmipRVqjHqDsKupqmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53568967"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.244.75])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:39 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v11 01/10] drm/ttm/tests: Fix a warning in
 ttm_bo_unreserve_bulk
Date: Wed, 17 Apr 2024 15:03:14 +0200
Message-Id: <4b5a19219e4a1313fd438d52431b57cb7b77b34a.1713357042.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713357042.git.karolina.stolarek@intel.com>
References: <cover.1713357042.git.karolina.stolarek@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BOs in a bulk move have to share the same reservation object. That is
not the case in the ttm_bo_unreserve_bulk subtest. Share bo2's resv
object with bo1 to fix the issue.

Fixes: 995279d280d1 ("drm/ttm/tests: Add tests for ttm_bo functions")
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 1f8a4f8adc92..632306adc4a1 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -339,6 +339,9 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 
+	/* Share the reservation object in the same bulk move */
+	bo1->base.resv = bo2->base.resv;
+
 	dma_resv_lock(bo1->base.resv, NULL);
 	ttm_bo_set_bulk_move(bo1, &lru_bulk_move);
 	dma_resv_unlock(bo1->base.resv);
-- 
2.34.1

