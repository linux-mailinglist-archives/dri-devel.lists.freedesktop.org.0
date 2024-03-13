Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E29D87A961
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 15:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB1710F1DD;
	Wed, 13 Mar 2024 14:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M56+wCHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABEE10F1DD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710339734; x=1741875734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TyVkbm4zYlf/khwVe1GLc/357ALevU3GdV5O86ZyQDU=;
 b=M56+wCHnFjUGfkWuD3//DZg1+PEUB0YJf+RTJ0KErq0BvZXnUpfOMXbR
 1N8xtXNcgrkPKEJ3ZuG4O+7zwUVzdLd0WwPk2J+Zg7fqmpJrCIZXKW5YC
 S5bhQr/uh2iy0EUvwYQ52mSepZMbgKezL2k9A00rrwkdBxyflRPWu70Jm
 dJP6SCsqcjzuaif2GmbPnZ0Kty8U/MFVo5tn5XRjMKA3veWo6/NUK84EE
 YRF7OAXG0H0pCzkWnzHxexRUsa6ozrMWl5rsSuEPPYYBvHtC0G7TiemYZ
 cO6Y9rjfL2lkKwvi2bPq4RfLJc+xV1jo5Ld6emO+e1JNRTaUKbdlC9fz9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22557077"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="22557077"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="12393370"
Received: from unknown (HELO kdrobnik-desk.toya.net.pl) ([10.245.244.225])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:21:57 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Karolina Stolarek <karolina.stolarek@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] drm/tests: Build KMS helpers when DRM_KUNIT_TEST_HELPERS is
 enabled
Date: Wed, 13 Mar 2024 15:21:42 +0100
Message-Id: <20240313142142.1318718-1-karolina.stolarek@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 66671944e176 ("drm/tests: helpers: Add atomic helpers")
introduced a dependency on CRTC helpers in KUnit test helpers.
Select the former when building KUnit test helpers to avoid
linker errors.

Fixes: 66671944e176 ("drm/tests: helpers: Add atomic helpers")
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
Run into this when trying to run TTM KUnit tests. As for now,
TTM KUnit test suite are the only outside user of these helpers,
but I think it makes sense to explicitly select DRM_KMS_HELPER
together with DRM_KUNIT_TEST_HELPERS, instead of doing it in
DRM_TTM_KUNIT_TEST.

 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c08e18108c2a..91776996ada4 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -68,6 +68,7 @@ config DRM_USE_DYNAMIC_DEBUG
 config DRM_KUNIT_TEST_HELPERS
 	tristate
 	depends on DRM && KUNIT
+	select DRM_KMS_HELPER
 	help
 	  KUnit Helpers for KMS drivers.
 
@@ -80,7 +81,6 @@ config DRM_KUNIT_TEST
 	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_GEM_SHMEM_HELPER
-	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS
 	select DRM_LIB_RANDOM
 	select PRIME_NUMBERS
-- 
2.34.1

