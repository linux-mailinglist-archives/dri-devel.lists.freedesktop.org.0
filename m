Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81138A83AF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A2C1134CC;
	Wed, 17 Apr 2024 13:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9DazYdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A708010F608
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713359034; x=1744895034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=02P+51L3U443MMrOZzAeV8IaL1L+16p1wpYQxSvKRDU=;
 b=Y9DazYdbRqrsG01XtukE0ntiUHv0UxZYjMo4jWMxZLUHAuOY0X4waHFd
 vCp6V/fXR6YA8o3KJjL0wFwFLpf2hNUdZ3jyM0YdbJd9IhR/Sk3Zs5Te1
 UhZFBfp12rv520HMHnahuKxuUf5fp8MbK8RdA9lds6yRIzqUaVyXgEO8W
 ZqlwO4n2M/KPvmRbTdZViI9pZqXvQ+4dXtXIRxWo15htxInGZaOqg79aP
 Vtpbh5ZJm5iwMtd1jNisSzzJQZJPSKxCO5ZbOqnRdVrbo2pA8O2vfyr27
 B7keo58rQDDZDhO+wvGGW2fAPcxorU+KjNADbdVY/ddyDqLqKoQ5Bk0d+ w==;
X-CSE-ConnectionGUID: Zh9HGZXGSnGq2XMJjElRGw==
X-CSE-MsgGUID: BC+PKvHCRMCJy2jdToiJrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20268289"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="20268289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:45 -0700
X-CSE-ConnectionGUID: awW4CS97S6WYdEsPxOyclw==
X-CSE-MsgGUID: 11Me8tFRSwCzC5mVRQG+Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53568989"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.244.75])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:44 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v11 03/10] drm/ttm/tests: Set DMA mask in KUnit device
Date: Wed, 17 Apr 2024 15:03:16 +0200
Message-Id: <b73b911c18c2d1a0eab954e6dc53cbc10461758c.1713357042.git.karolina.stolarek@intel.com>
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

In commit d393acce7b3f ("drm/tests: Switch to kunit devices"),
DRM test helpers migrated away from using a dummy platform driver
in favour of KUnit device. This means that DMA masks for the device
are not set but are required by ttm_pool_alloc tests.

Set the DMA mask for coherent mappings to unblock testing.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 7b7c1fa805fc..cb1cd676f8ae 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -98,6 +98,9 @@ struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
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

