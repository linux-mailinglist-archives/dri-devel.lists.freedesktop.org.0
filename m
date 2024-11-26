Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926CD9D9CD4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF3A10E98E;
	Tue, 26 Nov 2024 17:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UU7AhRD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A5710E973;
 Tue, 26 Nov 2024 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732643141; x=1764179141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nZMJwEdjNoBvlGVgeI7A/wYeq0nHCWPF1Z/N58o2JT8=;
 b=UU7AhRD50HS9eYT0nff9uROoyDgUR8L8Sv2YrivlZXzmfSp/RXqfMmWi
 /mB65MFjHM4hUfLJm7rImdFRGcjFkJWVpOJ3FuWlVFQ7PCV3UVN+G2pgA
 YQbMgtIL7BpJ1lr9enRvUA3ZgtnLRR3g5zolFNH/Wg5G6xZdvlvHAf3bl
 Ml1Qv3L26MMetDaTJMVaTUW7Bw/Dlyz3oLxaEtQY+dhe4/bBbC3XLgctZ
 bBw//IFnv23JzdvBDZTcgL0IBPW0c4af1Zn7GAOXH3qmtEqaRNLP0k++E
 Ct50nEopKx2HN0D+tlK7yjYEluI53MYUe9vrRTBIWFpwPx8c/SIX3N0+u Q==;
X-CSE-ConnectionGUID: TqaUHgy/QLe5evRHCmv6ZA==
X-CSE-MsgGUID: lkQy8JYVRVOYjJPA7dGhNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32676921"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32676921"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:41 -0800
X-CSE-ConnectionGUID: RWsP5VpFSN64IY3/h09ONA==
X-CSE-MsgGUID: FlKAl7ytQqSrNoNZpvfEKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92152587"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 7/8] drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
Date: Tue, 26 Nov 2024 09:46:14 -0800
Message-Id: <20241126174615.2665852-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126174615.2665852-1-matthew.brost@intel.com>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
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

We only allow continguous BOs to be vmapped, set XE_BO_FLAG_PINNED on
BOs in migrate selftest as this forces continguous BOs and selftest uses
vmaps.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 1a192a2a941b..4cef3b20bd17 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -83,7 +83,8 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 						   bo->size,
 						   ttm_bo_type_kernel,
 						   region |
-						   XE_BO_FLAG_NEEDS_CPU_ACCESS);
+						   XE_BO_FLAG_NEEDS_CPU_ACCESS |
+						   XE_BO_FLAG_PINNED);
 	if (IS_ERR(remote)) {
 		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %pe\n",
 			   str, remote);
@@ -642,7 +643,9 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 
 	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
 				   DRM_XE_GEM_CPU_CACHING_WC,
-				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+				   XE_BO_FLAG_SYSTEM |
+				   XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				   XE_BO_FLAG_PINNED);
 
 	if (IS_ERR(sys_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
@@ -666,7 +669,8 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 
 	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
 				   DRM_XE_GEM_CPU_CACHING_WC,
-				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				   XE_BO_FLAG_PINNED);
 
 	if (IS_ERR(ccs_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
@@ -690,7 +694,8 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 
 	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
 				    DRM_XE_GEM_CPU_CACHING_WC,
-				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				    XE_BO_FLAG_PINNED);
 	if (IS_ERR(vram_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
 			   PTR_ERR(vram_bo));
-- 
2.34.1

