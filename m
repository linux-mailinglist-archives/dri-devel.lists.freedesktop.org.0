Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1D867583
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D89010F15F;
	Mon, 26 Feb 2024 12:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FYqHb7pj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A1A10F15F;
 Mon, 26 Feb 2024 12:47:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DFF16118C;
 Mon, 26 Feb 2024 12:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7236EC433C7;
 Mon, 26 Feb 2024 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708951663;
 bh=vPnudlAxEBtSwaSh16NplVrq2SvEXPSzaOEsHkk1YQc=;
 h=From:To:Cc:Subject:Date:From;
 b=FYqHb7pjQYLZRQcpUsUksBUteFXpvb15TA3fQeT3qftscQBkT/quRXHxaBoDeIZK/
 OHn7d7D0euJdnIYvpn8QsSgcGMOgThM0dfJKN1CsdkG9G0bzYJkpNraiDWziCSkgaW
 zGh4Kx1eVSqy2ZXI0YrpKu3sXdtn2lfpfixfieFK/MZWgDYZT+dMfAdA9m1yi1UOiW
 fXbq3nlo9J+G7J81H5P8n2Yy/+Kxbym8cwD//m2h3qFI7C3hcgky8XB6ZN02yY7b4i
 Wd9aKoGJYKdN729IMDTUYV65OV2Mdp0SYGBNZ9ggOKbyptFCiY7OViVw4HJe7M+aO8
 Lo7b2hwIQuOMw==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] [v2] drm/xe/kunit: fix link failure with built-in xe
Date: Mon, 26 Feb 2024 13:46:36 +0100
Message-Id: <20240226124736.1272949-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

From: Arnd Bergmann <arnd@arndb.de>

When the driver is built-in but the tests are in loadable modules,
the helpers don't actually get put into the driver:

ERROR: modpost: "xe_kunit_helper_alloc_xe_device" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!

Change the Makefile to ensure they are always part of the driver
even when the rest of the kunit tests are in loadable modules.

Fixes: 5095d13d758b ("drm/xe/kunit: Define helper functions to allocate fake xe device")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: don't remove KUNIT dependency
---
 drivers/gpu/drm/xe/Kconfig       | 1 +
 drivers/gpu/drm/xe/Kconfig.debug | 1 -
 drivers/gpu/drm/xe/Makefile      | 6 ++++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 6d4428b19a4c..c3a3b204ae5b 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -11,6 +11,7 @@ config DRM_XE
 	select DRM_BUDDY
 	select DRM_EXEC
 	select DRM_KMS_HELPER
+	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST != n
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
 	select DRM_DISPLAY_DP_HELPER
diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 549065f57a78..df02e5d17d26 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -76,7 +76,6 @@ config DRM_XE_KUNIT_TEST
 	depends on DRM_XE && KUNIT && DEBUG_FS
 	default KUNIT_ALL_TESTS
 	select DRM_EXPORT_FOR_TESTS if m
-	select DRM_KUNIT_TEST_HELPERS
 	help
 	  Choose this option to allow the driver to perform selftests under
 	  the kunit framework
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4c6ffe4b2172..b596e4482a9b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -158,8 +158,10 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o
 
-xe-$(CONFIG_DRM_XE_KUNIT_TEST) += \
-	tests/xe_kunit_helpers.o
+# include helpers for tests even when XE is built-in
+ifdef CONFIG_DRM_XE_KUNIT_TEST
+xe-y += tests/xe_kunit_helpers.o
+endif
 
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
-- 
2.39.2

