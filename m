Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD028C659D
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FDE10E6DE;
	Wed, 15 May 2024 11:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFM4QkHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5210E729
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715772296; x=1747308296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ctI9WxoGAttGEpr6ZcCQ3c8r9tvT8qQVKWJ1IRNvCRo=;
 b=ZFM4QkHISI/r2lFnH9x9CcsvMX8nJ48pNT4zEaR08Kmv3oAWzL9PY/q3
 nhtSKf0TB/P8T2wA4gMv4YZ8WOGCxNFRa0w8H4kiZUfwbGEi33otLKRpJ
 QtBNXuVi0GtaNafXvcK9oCoUYb98SbrIIRziMx/R0UzkbU0WCNRe54GBb
 Cd429nU2ab31plSJ24KhNUdszFe3ovL2nCncZv+jN2cD153RpVBDHMCZJ
 mqcPJl4AEHyrnrGq8XTMGOCdzrZl8ZrKs80js8ESYS/NpihlufuQg0woo
 PUFqXGv8BN3m2aN3FH/xSqCzMakiKPOVzlJrHdFouR4LlEuXhVky7gkcv g==;
X-CSE-ConnectionGUID: CawZPYyJRsiTwldO3YnhJA==
X-CSE-MsgGUID: wjZrUBX4TGGbdgd1755KjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22955377"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="22955377"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:24:56 -0700
X-CSE-ConnectionGUID: 9GiHoxvhSXGdXPdM1NwRew==
X-CSE-MsgGUID: bSm3G/1uRvWXfW0JRlVm9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30955239"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:24:54 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v12 03/10] drm/ttm/tests: Set DMA mask in KUnit device
Date: Wed, 15 May 2024 13:24:26 +0200
Message-Id: <af53ba04935ac30f1635efae25158d5c5c4d17af.1715767062.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715767062.git.karolina.stolarek@intel.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
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

