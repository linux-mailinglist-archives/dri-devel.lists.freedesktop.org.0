Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D7A25EAF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 16:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE8010E06C;
	Mon,  3 Feb 2025 15:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="h1tRFrO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4319910E06C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RwlNTjpd0rJasnoGNM3ufPVLcTUdTbOqRs5Ru2cyKjU=; b=h1tRFrO9wFbe7vUYJDVbpgHet7
 v6KVEPdcLNOVMSCRQ0dsFdm7onMwnWCq1FVls/BhzLX6L3/TyZZ0TmJMO2DUYOck7H9UIaRPS+8pV
 pULKePU94N1X3ZR3V0DRj8r8eS/Wiequ7/LF7f/cMNikc4JXrhm5E4JABiW0cgZoi5zpVTGPa4/s/
 PyU2tUxhB7rXiZELkHK4jcGdmqVn6vwRZsJUVe5KEiOLhtLkknHeTbLpoOmCgH/Wg56HYpX81SzWg
 H9syeEjke9+9rJcdvKi3yCgtDd47hZz549ChMjU8nKAxSYMtTlwhNvRJ9rVsnelOtPhmoeZMVfgOC
 jdMWuzXQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1teyOm-0035r1-3K; Mon, 03 Feb 2025 16:30:14 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 1/5] drm: Move some options to separate new Kconfig.debug
Date: Mon,  3 Feb 2025 15:30:02 +0000
Message-ID: <20250203153007.63400-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250203153007.63400-1-tvrtko.ursulin@igalia.com>
References: <20250203153007.63400-1-tvrtko.ursulin@igalia.com>
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

Move some options out into a new debug specific kconfig file in order to
make things a bit cleaner.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/Kconfig       | 98 ++---------------------------------
 drivers/gpu/drm/Kconfig.debug | 92 ++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 93 deletions(-)
 create mode 100644 drivers/gpu/drm/Kconfig.debug

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fbef3f471bd0..807743d54911 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -26,6 +26,11 @@ menuconfig DRM
 	  details.  You should also select and configure AGP
 	  (/dev/agpgart) support if it is available for your platform.
 
+menu "DRM debugging options"
+depends on DRM
+source "drivers/gpu/drm/Kconfig.debug"
+endmenu
+
 if DRM
 
 config DRM_MIPI_DBI
@@ -37,65 +42,6 @@ config DRM_MIPI_DSI
 	bool
 	depends on DRM
 
-config DRM_DEBUG_MM
-	bool "Insert extra checks and debug info into the DRM range managers"
-	default n
-	depends on DRM
-	depends on STACKTRACE_SUPPORT
-	select STACKDEPOT
-	help
-	  Enable allocation tracking of memory manager and leak detection on
-	  shutdown.
-
-	  Recommended for driver developers only.
-
-	  If in doubt, say "N".
-
-config DRM_USE_DYNAMIC_DEBUG
-	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
-	depends on DRM
-	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
-	depends on JUMP_LABEL
-	help
-	  Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
-	  Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
-	  bytes per callsite, the .data costs can be substantial, and
-	  are therefore configurable.
-
-config DRM_KUNIT_TEST_HELPERS
-	tristate
-	depends on DRM && KUNIT
-	select DRM_KMS_HELPER
-	help
-	  KUnit Helpers for KMS drivers.
-
-config DRM_KUNIT_TEST
-	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
-	depends on DRM && KUNIT && MMU
-	select DRM_BUDDY
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HDMI_STATE_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_EXEC
-	select DRM_EXPORT_FOR_TESTS if m
-	select DRM_GEM_SHMEM_HELPER
-	select DRM_KUNIT_TEST_HELPERS
-	select DRM_LIB_RANDOM
-	select PRIME_NUMBERS
-	default KUNIT_ALL_TESTS
-	help
-	  This builds unit tests for DRM. This option is not useful for
-	  distributions or general kernels, but only for kernel
-	  developers working on DRM and associated drivers.
-
-	  For more information on KUnit and unit tests in general,
-	  please refer to the KUnit documentation in
-	  Documentation/dev-tools/kunit/.
-
-	  If in doubt, say "N".
-
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
@@ -247,23 +193,6 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
-config DRM_TTM_KUNIT_TEST
-        tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
-        default n
-        depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
-        select DRM_TTM
-        select DRM_BUDDY
-        select DRM_EXPORT_FOR_TESTS if m
-        select DRM_KUNIT_TEST_HELPERS
-        default KUNIT_ALL_TESTS
-        help
-          Enables unit tests for TTM, a GPU memory manager subsystem used
-          to manage memory buffers. This option is mostly useful for kernel
-          developers. It depends on (UML || COMPILE_TEST) since no other driver
-          which uses TTM can be loaded while running the tests.
-
-          If in doubt, say "N".
-
 config DRM_EXEC
 	tristate
 	depends on DRM
@@ -465,9 +394,6 @@ config DRM_HYPERV
 
 	 If M is selected the module will be called hyperv_drm.
 
-config DRM_EXPORT_FOR_TESTS
-	bool
-
 # Separate option as not all DRM drivers use it
 config DRM_PANEL_BACKLIGHT_QUIRKS
 	tristate
@@ -480,20 +406,6 @@ config DRM_PRIVACY_SCREEN
 	bool
 	default n
 
-config DRM_WERROR
-	bool "Compile the drm subsystem with warnings as errors"
-	depends on DRM && EXPERT
-	depends on !WERROR
-	default n
-	help
-	  A kernel build should not cause any compiler warnings, and this
-	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
-
-	  The drm subsystem enables more warnings than the kernel default, so
-	  this config option is disabled by default.
-
-	  If in doubt, say N.
-
 endif
 
 # Separate option because drm_panel_orientation_quirks.c is shared with fbdev
diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
new file mode 100644
index 000000000000..a35d74171b7b
--- /dev/null
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -0,0 +1,92 @@
+config DRM_USE_DYNAMIC_DEBUG
+	bool "use dynamic debug to implement drm.debug"
+	default n
+	depends on BROKEN
+	depends on DRM
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
+	depends on JUMP_LABEL
+	help
+	 Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
+	 Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
+	 bytes per callsite, the .data costs can be substantial, and
+	 are therefore configurable.
+
+config DRM_WERROR
+	bool "Compile the drm subsystem with warnings as errors"
+	depends on DRM && EXPERT
+	depends on !WERROR
+	default n
+	help
+	  A kernel build should not cause any compiler warnings, and this
+	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
+
+	  The drm subsystem enables more warnings than the kernel default, so
+	  this config option is disabled by default.
+
+	  If in doubt, say N.
+
+config DRM_DEBUG_MM
+	bool "Insert extra checks and debug info into the DRM range managers"
+	default n
+	depends on DRM
+	depends on STACKTRACE_SUPPORT
+	select STACKDEPOT
+	help
+	  Enable allocation tracking of memory manager and leak detection on
+	  shutdown.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+
+config DRM_KUNIT_TEST_HELPERS
+	tristate
+	depends on DRM && KUNIT
+	select DRM_KMS_HELPER
+	help
+	  KUnit Helpers for KMS drivers.
+
+config DRM_KUNIT_TEST
+	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
+	depends on DRM && KUNIT && MMU
+	select DRM_BUDDY
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_EXEC
+	select DRM_EXPORT_FOR_TESTS if m
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KUNIT_TEST_HELPERS
+	select DRM_LIB_RANDOM
+	select PRIME_NUMBERS
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for DRM. This option is not useful for
+	  distributions or general kernels, but only for kernel
+	  developers working on DRM and associated drivers.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+
+	  If in doubt, say "N".
+
+config DRM_TTM_KUNIT_TEST
+	tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
+	default n
+	depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
+	select DRM_TTM
+	select DRM_BUDDY
+	select DRM_EXPORT_FOR_TESTS if m
+	select DRM_KUNIT_TEST_HELPERS
+	default KUNIT_ALL_TESTS
+	help
+	  Enables unit tests for TTM, a GPU memory manager subsystem used
+	  to manage memory buffers. This option is mostly useful for kernel
+	  developers. It depends on (UML || COMPILE_TEST) since no other driver
+	  which uses TTM can be loaded while running the tests.
+
+	  If in doubt, say "N".
+
+config DRM_EXPORT_FOR_TESTS
+	bool
-- 
2.48.0

