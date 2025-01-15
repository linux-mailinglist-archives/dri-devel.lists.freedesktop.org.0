Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D9EA123DE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D5C10E66B;
	Wed, 15 Jan 2025 12:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rb/1RRgX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957E910E66B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736944678; x=1768480678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M+S+Xvq3H4ou5eHBOh3z2m7kHLsFukayfpS8ZkDVYws=;
 b=Rb/1RRgX56ipyPwK1cXrAyf5AOcIrAdeAAvKBltHUxAB4x0h6KyADWIW
 c0L3nLTOpco7ClhmIE5siPRnt9cPRzeDBKYVsq+2WSdayuAhjOeuS+3QO
 lVr495jJBseHaC46g/elxy9Ft1VxwaRGra8H2ql7TsVm9aROm52/5TC3K
 5EMHwjxEXdjIAA3GdIro8WG70JtmR4QcdvyR7k1V5vm/3b/Umky5e+Z51
 1PiCkTX+qz9FVcIROMJsX3asZjR0ShfEFaHkWckyw+6e7eS0c+fguvuRV
 5PsAkav53Ajs4r3Ms0XcYVRdBq9p30hZ6hd6aOEBGRy3dHmTIFJFneD5a A==;
X-CSE-ConnectionGUID: FAhYpAV+Sl+gCKpX1dCr5w==
X-CSE-MsgGUID: ckonS1UjRxaC9jpb95ReNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36972055"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="36972055"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 04:37:58 -0800
X-CSE-ConnectionGUID: 1UjaPVPJTTi5XZSC/hshBw==
X-CSE-MsgGUID: 4fgYLPgsQLCUerBftpOcRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="110092111"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.179])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 04:37:56 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/tests/buddy: fix build with unused prng
Date: Wed, 15 Jan 2025 12:37:35 +0000
Message-ID: <20250115123734.154243-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We no longer use the prng, which leads to the following warning:

drivers/gpu/drm/tests/drm_buddy_test.c: In function
‘drm_test_buddy_alloc_clear’:
drivers/gpu/drm/tests/drm_buddy_test.c:264:23: error: unused variable
‘prng’ [-Werror=unused-variable]
  264 |         DRM_RND_STATE(prng, random_seed);

Reported-by: Jani Nikula <jani.nikula@intel.com>
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 8cb3a1e2b350 ("drm/buddy: Add a testcase to verify the multiroot fini")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 4b5818f9f2a9..7a0e523651f0 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -261,7 +261,6 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 static void drm_test_buddy_alloc_clear(struct kunit *test)
 {
 	unsigned long n_pages, total, i = 0;
-	DRM_RND_STATE(prng, random_seed);
 	const unsigned long ps = SZ_4K;
 	struct drm_buddy_block *block;
 	const int max_order = 12;
-- 
2.47.1

