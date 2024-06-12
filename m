Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751AC9051F3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9CA10E0A3;
	Wed, 12 Jun 2024 12:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbaX9vKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE7810E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718193811; x=1749729811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ctI9WxoGAttGEpr6ZcCQ3c8r9tvT8qQVKWJ1IRNvCRo=;
 b=SbaX9vKtzWHjEZ+4m/uRucyL0pc299YPWDWMusQ9scoVfrdwYFUFFytT
 eF9LsTcmVcbuYKKfUF5D+1WW1S60YvGx5AneOMuRAqVfrKwrD7t4zIfna
 rmeWDjzKjZbOIGHti7J9X7lddNmlF1LfsUukjfLp4r9bXPzbiaezNdI7F
 LJbkZibh4R4dtYj93GeazjA/ff8MuYvv6UKJ6hI/E6v33QMXf0ABpNyFJ
 BtWhUI4QIrer68W6CQO6/ADvM+EtHbjSw9n4RH30HGSlfTqyG2b2pGxVV
 XcVBMOpjiiPdNaBhzx+ABPkKQp3U/uxLJYfhowPQ7BJxsOSIUEmebjK9r A==;
X-CSE-ConnectionGUID: LJxD2c6VTdu31IqFatooYQ==
X-CSE-MsgGUID: yx6JQBSiT6+nBfIZcjnFJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15077596"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15077596"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:31 -0700
X-CSE-ConnectionGUID: cmAzb3b8SpWi98Ze3xaNTQ==
X-CSE-MsgGUID: /SFkl1QwS+SoeribZDh9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="70574038"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:29 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v14 03/12] drm/ttm/tests: Set DMA mask in KUnit device
Date: Wed, 12 Jun 2024 14:02:57 +0200
Message-Id: <dbd83b01bc835d922c070ad1c5bd9023e631e6c4.1718192625.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718192625.git.karolina.stolarek@intel.com>
References: <cover.1718192625.git.karolina.stolarek@intel.com>
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

