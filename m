Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB94A35C84
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 12:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2718B10EC39;
	Fri, 14 Feb 2025 11:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bLffq9rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2598F10E263;
 Fri, 14 Feb 2025 11:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4YzmRfpN3jFLIB9dUkGmP+K9+k6D/YnyXi9ufIFa40Q=; b=bLffq9rmo43igb98zuencKu54n
 IeihEHuGmiNZUNZlytdrp6X3aylSnA0AosUOSPnKtwrbot5xr1lquDMItYYf7Wi6zI8/bE5uDlC5T
 bVogHyDirVJkG0GJ8XgRm26729puZQ4DP5Iiad+KjMnCcbphgvTfvJeWmGsJM+0mwEXzl1ndpvqF3
 Q5IOGQMO0matAYiwIAwf7U6nfos8yqaqw/szDhOg9mIGUtwp1Dl8C6+Mb4CH0FvmL9dzDGtm5R7AH
 SoNWAuaIOtBcKzaJDlaCnUgGa+IUZET095J7B2aJzhrouFr6lLJAoyRyYrxqTewdHHljOOKkw3PhJ
 Vmk6ayjw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1titrZ-000VFe-HH; Fri, 14 Feb 2025 12:28:11 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 1/5] drm: Move some options to separate new Kconfig.debug
Date: Fri, 14 Feb 2025 11:28:00 +0000
Message-ID: <20250214112805.20008-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250214112805.20008-1-tvrtko.ursulin@igalia.com>
References: <20250214112805.20008-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/Kconfig       | 109 ++--------------------------------
 drivers/gpu/drm/Kconfig.debug | 103 ++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+), 104 deletions(-)
 create mode 100644 drivers/gpu/drm/Kconfig.debug

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d9986fd52194..46ba24592553 100644
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
@@ -463,9 +392,6 @@ config DRM_HYPERV
 
 	 If M is selected the module will be called hyperv_drm.
 
-config DRM_EXPORT_FOR_TESTS
-	bool
-
 # Separate option as not all DRM drivers use it
 config DRM_PANEL_BACKLIGHT_QUIRKS
 	tristate
@@ -478,31 +404,6 @@ config DRM_PRIVACY_SCREEN
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
-config DRM_HEADER_TEST
-	bool "Ensure DRM headers are self-contained and pass kernel-doc"
-	depends on DRM && EXPERT
-	default n
-	help
-	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
-	  include/drm compile, are self-contained, have header guards, and have
-	  no kernel-doc warnings.
-
-	  If in doubt, say N.
-
 endif
 
 # Separate option because drm_panel_orientation_quirks.c is shared with fbdev
diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
new file mode 100644
index 000000000000..601d7e07d421
--- /dev/null
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -0,0 +1,103 @@
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
+config DRM_HEADER_TEST
+	bool "Ensure DRM headers are self-contained and pass kernel-doc"
+	depends on DRM && EXPERT
+	default n
+	help
+	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
+	  include/drm compile, are self-contained, have header guards, and have
+	  no kernel-doc warnings.
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

