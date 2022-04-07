Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F2B4F8523
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 18:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BC610E290;
	Thu,  7 Apr 2022 16:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EC110E290;
 Thu,  7 Apr 2022 16:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649349993; x=1680885993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DBMCO4V0RJ/UUY2J1irP3zA6T34+ts+T70cp8fvTGQI=;
 b=i1hUGajKFCfS9vXQyzkaBlmPPhJD4E+cxx0EPbHdiK95mOwo5Bl2apb6
 Y21vfZvDanDgSnmd9srxKoZ6aFspW/139W7L0tiza/DQxxESykUQrI3YL
 4EeOnklQecTenI7sSF/LkOJsH0TSwU/eW23dEMoVZrgJihZD5n+/FsxBu
 xIkHJCMtx9a599MeUJcou4uTvorlbO3KhmTyxLquN4pyPOm8w9HerbtN0
 5tTxsqaY8uQ4CFDlTECxg8J/Y1pNwo1Mr1J4tgWg3GSwJMTIgEBaXyqfI
 xbr3fY7Toc4gFUTPZOIWlXOWk7d5eogMLgIbma5aXKpJRaPB+JEAsfweP w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261072539"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="261072539"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 09:46:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="571134188"
Received: from doboyle-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.221])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 09:46:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: fix broken build
Date: Thu,  7 Apr 2022 17:45:31 +0100
Message-Id: <20220407164532.1242578-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I guess this was missed in the conversion or something.

Fixes: 7bc80a5462c3 ("dma-buf: add enum dma_resv_usage v4")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_deps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_deps.c b/drivers/gpu/drm/i915/i915_deps.c
index 999210b37325..297b8e4e42ee 100644
--- a/drivers/gpu/drm/i915/i915_deps.c
+++ b/drivers/gpu/drm/i915/i915_deps.c
@@ -226,7 +226,7 @@ int i915_deps_add_resv(struct i915_deps *deps, struct dma_resv *resv,
 	struct dma_fence *fence;
 
 	dma_resv_assert_held(resv);
-	dma_resv_for_each_fence(&iter, resv, true, fence) {
+	dma_resv_for_each_fence(&iter, resv, dma_resv_usage_rw(true), fence) {
 		int ret = i915_deps_add_dependency(deps, fence, ctx);
 
 		if (ret)
-- 
2.34.1

