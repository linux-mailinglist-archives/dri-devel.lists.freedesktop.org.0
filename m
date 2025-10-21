Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74ECBF7C14
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 18:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8E610E622;
	Tue, 21 Oct 2025 16:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdtJifZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6ED110E622;
 Tue, 21 Oct 2025 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761065088; x=1792601088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ybt3k3C+4E/vLkpaCO/Lv50cvBYbSc1iDz6xDEyUV14=;
 b=GdtJifZKjj+Dc3a0nQAo6Su5LellBa/1W+VzoH1pxIe/xJYzLtg0l7Vx
 wNr+amGicA/J2ONFc8t6ktuoMxaFCgl/x3DtE3nCoXyDvlKDRMXiFqele
 ygesw00ZR6QgsOb9dev6AfzUI9YSl1CPDKTpMXqsbzuPzzsiakl18FqIV
 +x+pa70se/lldXyoBmOici3ABx+cmO7GGFUwyYc+1AAu1wSwJiCbAPZeS
 O+QGD7Ciyn20GIU882Nxs9daTLMogQ2s9pM7IqmtXQr8OMFbLuj+Zk+z8
 az5Q9Fm68u910phft1L97h56lU2hRvhwSjENPeK4QxcMZ8H3WxxjoDvkE w==;
X-CSE-ConnectionGUID: 4h3Tzvl6Sa6FQtCdqDzU8A==
X-CSE-MsgGUID: RxZ97CcwSX2EI4JTRG2xcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63108303"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63108303"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:44:47 -0700
X-CSE-ConnectionGUID: wOXdAZZiSKWoMQjASR8jwg==
X-CSE-MsgGUID: FytIk8NyQhaD6vgBp524OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184414742"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.235])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:44:44 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH] drm/buddy: Mark drm_test_buddy_fragmentation_performance test
 as slow
Date: Tue, 21 Oct 2025 18:43:42 +0200
Message-ID: <20251021164341.6154-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

Mark the newly introduced drm_test_buddy_fragmentation_performance test
as KUNIT_SPEED_SLOW, as it might take more than a second on some
systems.

Fixes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 5f40b5343bd8..672423af7c17 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -876,7 +876,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
 	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
-	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
+	KUNIT_CASE_SLOW(drm_test_buddy_fragmentation_performance),
 	{}
 };
 
-- 
2.45.2

