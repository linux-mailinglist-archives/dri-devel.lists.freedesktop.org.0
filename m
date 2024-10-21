Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7383D9A91ED
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABBC10E5A7;
	Mon, 21 Oct 2024 21:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJdIuy4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8148C10E119;
 Mon, 21 Oct 2024 21:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729545493; x=1761081493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nZMJwEdjNoBvlGVgeI7A/wYeq0nHCWPF1Z/N58o2JT8=;
 b=EJdIuy4B3asCvTA2X6DUS00PFach7Mn9oQCg4PT1EvqozGEyF10BvRbN
 EwyWTIyFm6DQL69xkWmk5ZTUZCIH1/kkrCIIezcCbD/llBlPycMk4ogJF
 X/cs4wbbgwEZ1VtIdhs5fO94Pga/6LqQv0tCAUxD1ebLJv8oDDlVZLEuo
 LOQvQWE1y2/hdOfzJcDJgMGDOi2l//OM9PBv0KFL4SCtux0LU3twEipNU
 WJDrYLWKasTAURUjaDI00SLTLbdhb3yDcEYuIpYsXbQUyATLr7ReGGW5N
 BTtuhX9vizczF00syg2DQBSmm6Cz+s83XKnRN+N4AQkep8Iw5y8np82C+ w==;
X-CSE-ConnectionGUID: Mxa6Yd0nQAi/LmTT3yEQ8g==
X-CSE-MsgGUID: cPVPKNbAQ/WQecnGny+b5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29257688"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="29257688"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:18:11 -0700
X-CSE-ConnectionGUID: zJ+P3zgNRsGfzTYeIR0NWQ==
X-CSE-MsgGUID: LXJvVhDVSr6d30UATVHo2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="80469603"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:18:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 8/9] drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
Date: Mon, 21 Oct 2024 14:18:34 -0700
Message-Id: <20241021211835.1675640-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021211835.1675640-1-matthew.brost@intel.com>
References: <20241021211835.1675640-1-matthew.brost@intel.com>
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

