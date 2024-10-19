Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CE9A5075
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 21:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E13F10E3A8;
	Sat, 19 Oct 2024 19:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDQdpNvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B645610E3AC;
 Sat, 19 Oct 2024 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729365605; x=1760901605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hSbQ9RTe5ZXX2fn3WclbmFPhn+u7StIBRgeeFTsYYZ4=;
 b=aDQdpNvk+gBuRqIPi5KSDlsTWSFehu3abO/JtY607zadI7UVPVjbWhEP
 1Yj1vRa4HsK95ZcH+0t5EPlqy4kl+Gmpb/FRRsKMsJ7YPgX9kdm95tfnT
 S6+ZTsCqeGCJax7GnOzCRFRXxmGV18Ha73g1HSNvpgwZGWS1Ig0t/05DS
 22YwhPi8XsiQ4h89bcPCIerRqS+ZIweFSXz3H5eZM6kh+8D2DLF/P1mF1
 64/WNmZ+n0O1gEWZMbszNEg8Dq+R6aCT58WFSFtsZHqzjGfFXzelSmNWD
 C2c756+woH4mos3gN/R8lf78kj/PwTHncG2uGPZT7oUcP5yfaAXS7jvo8 Q==;
X-CSE-ConnectionGUID: lqCyDG5iTM6PJxycZv89/Q==
X-CSE-MsgGUID: imxNUCnISp+ybEJWjaMYfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28978588"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="28978588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:05 -0700
X-CSE-ConnectionGUID: h6hN4qu9S7eUl1SbQ63rYQ==
X-CSE-MsgGUID: s6NmQkOlSPaNU4mt+z2r3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="84212408"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 5/6] drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
Date: Sat, 19 Oct 2024 12:20:29 -0700
Message-Id: <20241019192030.1505020-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241019192030.1505020-1-matthew.brost@intel.com>
References: <20241019192030.1505020-1-matthew.brost@intel.com>
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

