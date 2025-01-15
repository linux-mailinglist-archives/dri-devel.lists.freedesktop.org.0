Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743DBA123FF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7672510E387;
	Wed, 15 Jan 2025 12:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGYfRpH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1681D10E387
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736945395; x=1768481395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HF6qUplndnBrh1BlDH2Y9ysH0qs/05QJg2Kb3sG5qMU=;
 b=bGYfRpH/JyQMduH2gGmq0AZOKeSoAz6RyMPfNkqlGSkJ91J3bBuz9G2y
 f2ybdWzqEsMS/6DsVK58HDcKHp6W0SUx3hF7l6hjZGOLps4DrsiGHIdgQ
 P3+rbhgGLT3WPLIg8AASgI77fqtavNcf6YstK4BsCtmdr0fj6ASGES3c5
 FE3W9CPM7cCBF3kRRF7I9t6kWel1V97NJvRuo5mbD2+nf0up8x7eTHSAp
 QcxfLLxHlM16YcC0MRpOtO2OlCvHd8mDWOT782YVT06GAb5hIlFPFEn60
 2w0KNgfxZrcdqkPf/QMsJCd7+g8f5erLDbR49t6CdBcwvL04r3+m+Xqzv A==;
X-CSE-ConnectionGUID: h+rwAvjuRI+g1fTkX5aMPw==
X-CSE-MsgGUID: Tv+LZI1kSuqxe2b/A/6HNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="41213386"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="41213386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 04:49:54 -0800
X-CSE-ConnectionGUID: J44SEfRyQuqG23JQECziOw==
X-CSE-MsgGUID: 7KnDNMieStiRTfAr98dS4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105606258"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.179])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 04:49:52 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2] drm/tests/buddy: fix build with unused prng
Date: Wed, 15 Jan 2025 12:49:42 +0000
Message-ID: <20250115124941.155990-2-matthew.auld@intel.com>
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

v2 (Thomas)
 - Add Closes links

Reported-by: Jani Nikula <jani.nikula@intel.com>
Closes: https://lore.kernel.org/dri-devel/875xmggvcs.fsf@intel.com/
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Closes: https://lore.kernel.org/dri-devel/3f816555e6913fdbcb254523f65c98088d70581b.camel@intel.com/
Fixes: 8cb3a1e2b350 ("drm/buddy: Add a testcase to verify the multiroot fini")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

