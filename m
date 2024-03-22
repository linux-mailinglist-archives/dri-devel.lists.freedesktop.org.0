Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC526886E86
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E621124ED;
	Fri, 22 Mar 2024 14:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHj4JPGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE041124EA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117802; x=1742653802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=02P+51L3U443MMrOZzAeV8IaL1L+16p1wpYQxSvKRDU=;
 b=SHj4JPGTbUfKAHVVVW1gJRA6X3v9sIvqM59N4YUpmKjkVjPGqnnn2+Fp
 q4U5WfLQtgLOgSEJmzb06PdO5IJAyZyEUevqX5AQB2Mie3zeC/Mtf1Odi
 DrmHX1v48nv6yiXSvLza4SzIyApaIbpdheaoxCS9vhyXzlqy5Uq/Vafz9
 pbutFaEfRt19o8JX9ksq4ZbD182RwZ7OHdWewHdsale6AAmJPZr/c4RZE
 NyTKqNzhsrpsOkCgRO80ECMdRjFYR6OS6Gx18sibswb8Uxtjoc4artdx+
 Ba5dGHrBfkjYT45stWEWzhe1ejF69HHdGqbhEenrUI7BplSabSXJnlpjg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6022799"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6022799"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19398515"
Received: from unknown (HELO kdrobnik-desk.toya.net.pl) ([10.245.245.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:00 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v10 1/9] drm/ttm/tests: Set DMA mask in KUnit device
Date: Fri, 22 Mar 2024 15:29:50 +0100
Message-Id: <612992078bc2955925972813a8a1566053cb2cb1.1711117249.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711117249.git.karolina.stolarek@intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
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

