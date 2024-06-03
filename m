Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DEC8D8412
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4350C10E3AF;
	Mon,  3 Jun 2024 13:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjqYK4Ev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5449210E3AF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717421796; x=1748957796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ctI9WxoGAttGEpr6ZcCQ3c8r9tvT8qQVKWJ1IRNvCRo=;
 b=gjqYK4EvU7EgOoGuWqMM0gN+Ms2mrOJCVNTMhMCbzywmngRvubbJthHq
 a31x5ZoFbxzym3IelyH0+ZkEfJhCpqb/BRq0zUd8WMAa57dBCpJeJV0Va
 HwNtOjQRrauM9hpCTXUuVwXccim+ahQiyZAUaXB/92UMS4QID3ZFSGfxm
 jZf64LJ1PjVxWZUplYac7OnmrchT22c5cOfWF6KPUhb5dRLN1ghK84iC7
 aKH8BtUvYALutGbWMgZQIJ+FffuOzSUngHZgidy4xZNSoYrv1VcJiLsMK
 XVhi3tGQJFYsx1kfZ8ufwSkwr30mcSusY2E1EbpgvvZY0zBjp4d+e+zfR A==;
X-CSE-ConnectionGUID: qAbHXXSTSpq6qkYsCjbePw==
X-CSE-MsgGUID: D57wVQMySVaDFejsZxwDXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17752523"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17752523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:36:36 -0700
X-CSE-ConnectionGUID: 5oCguml2TTSXw4/4oADz/Q==
X-CSE-MsgGUID: KtsBzZeWQ3Sso0FGIDBkcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36960008"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.157])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:36:34 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v13 03/12] drm/ttm/tests: Set DMA mask in KUnit device
Date: Mon,  3 Jun 2024 15:36:06 +0200
Message-Id: <bf408855b9f62cdc08af7db5ac161fdcdc6f2583.1717420597.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717420597.git.karolina.stolarek@intel.com>
References: <cover.1717420597.git.karolina.stolarek@intel.com>
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

In commit d393acce7b3f ("drm/tests: Switch to kunit devices"),
DRM test helpers migrated away from using a dummy platform driver
in favour of KUnit device. This means that DMA masks for the device
are not set but are required by ttm_pool_alloc tests.

Set the DMA mask for coherent mappings to unblock testing.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 5be317a0af56..c9ee7fe7c36d 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -103,6 +103,9 @@ struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
 	devs->dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, devs->dev);
 
+	/* Set mask for alloc_coherent mappings to enable ttm_pool_alloc testing */
+	devs->dev->coherent_dma_mask = -1;
+
 	devs->drm = __drm_kunit_helper_alloc_drm_device(test, devs->dev,
 							sizeof(*devs->drm), 0,
 							DRIVER_GEM);
-- 
2.34.1

