Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60A85D176
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 08:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A44B10E38E;
	Wed, 21 Feb 2024 07:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCK2Hgl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D77110E371;
 Wed, 21 Feb 2024 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708500828; x=1740036828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WtzN/zuuF5Giq3H1uYH21SKzPx18aViDs45cU0spU+I=;
 b=GCK2Hgl8C5kEswBM44U7UDUP0KCKIIxu7xcNi+RuEvaRoAmhHWSRTaaz
 eRxyXvqEInK4RE9Canak/pXp3xb2fISPji6Afli09vfAhH+WKly1mFAFU
 xNq1/NeW6buDzMM+jlOYc67n6Pe4tQ/9K8dSpdwzfx/Tp2AWZ5eCIMuco
 maFJIzk1YLI99vWj6BCdk+gsLlFnSdPa70lVJR7uq69Y0/tMC0V5s7s6T
 nsUUyorUsjYz/H3EhfpUnKtJO9XFFu++JqT1+JsudEf5f/ClWXdZfKN+I
 m4BcRSh5Fsr4Mi8SwDLMddx7NAEvGELGWicyJOCyloYYps26H9cIYTvc6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13266417"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="13266417"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 23:33:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5273376"
Received: from ahashmi-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.166])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 23:33:45 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: [PATCH] drm/ttm: Fix an invalid freeing on already freed page in
 error path
Date: Wed, 21 Feb 2024 08:33:24 +0100
Message-ID: <20240221073324.3303-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

If caching mode change fails due to, for example, OOM we
free the allocated pages in a two-step process. First the pages
for which the caching change has already succeeded. Secondly
the pages for which a caching change did not succeed.

However the second step was incorrectly freeing the pages already
freed in the first step.

Fix.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 379989e7cbdc ("drm/ttm/pool: Fix ttm_pool_alloc error path")
Cc: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.4+
---
 drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index b62f420a9f96..112438d965ff 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -387,7 +387,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 				enum ttm_caching caching,
 				pgoff_t start_page, pgoff_t end_page)
 {
-	struct page **pages = tt->pages;
+	struct page **pages = &tt->pages[start_page];
 	unsigned int order;
 	pgoff_t i, nr;
 
-- 
2.43.0

