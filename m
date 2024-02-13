Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C040185323B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 14:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3607910E53A;
	Tue, 13 Feb 2024 13:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X2GzlSb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AF710E51B;
 Tue, 13 Feb 2024 13:48:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48837614A3;
 Tue, 13 Feb 2024 13:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A354C433C7;
 Tue, 13 Feb 2024 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707832103;
 bh=26cXrqFjrg0ao0r9xUFAr1Dg4GgkrO8FmiGX8abfNuM=;
 h=From:To:Cc:Subject:Date:From;
 b=X2GzlSb8rmaizrJ0LylQls2sNtypF+9i+aT25Vuuvh7WYZjxmctA3xM2UEvgXAHQ9
 LkHZlxozy10NCqsfaltRaUMEVm1POUxpoifOXVzrPA/7gyXDeedg54An0zypsT5+Bm
 5pL153obBaefWUE4e90RlGfLmnHfeYrp8lYPzkTZ+MQkti4KJPa6SEXkE2vy29EgEB
 ybIafh9Y/c0rAcuxQpDQ880xxUtDcVNVqnV34nzeQnDVi2C1vnRp07/VQKJO6SgBd1
 mMfBjKc5K4eYKyYJPaorx6Ar5BXdJS9P2vSyOtN0fOwTUeorMq/U7/HBLji2sl0VHG
 CPPlBN4LzpySQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: skip building debugfs code for CONFIG_DEBUG_FS=n
Date: Tue, 13 Feb 2024 14:48:05 +0100
Message-Id: <20240213134817.3347574-1-arnd@kernel.org>
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

Some of the debugfs functions are stubbed out in these configurations,
so trying to build the .c file with the definition fails:

In file included from include/uapi/linux/posix_types.h:5,
                 from drivers/gpu/drm/i915/display/intel_pipe_crc.c:27:
drivers/gpu/drm/i915/display/intel_pipe_crc.c: At top level:
include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
    8 | #define NULL ((void *)0)
      |                ^~~~
drivers/gpu/drm/i915/display/intel_pipe_crc.c:549:20: note: in expansion of macro 'intel_crtc_get_crc_sources'
  549 | const char *const *intel_crtc_get_crc_sources(struct drm_crtc *crtc,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~

Stop trying to build them by making the Makefile entries conditional,
same as for the i915 driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index efcf0ab7a1a6..7c10ffdb7809 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -213,8 +213,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_ddi.o \
 	i915-display/intel_ddi_buf_trans.o \
 	i915-display/intel_display.o \
-	i915-display/intel_display_debugfs.o \
-	i915-display/intel_display_debugfs_params.o \
 	i915-display/intel_display_device.o \
 	i915-display/intel_display_driver.o \
 	i915-display/intel_display_irq.o \
@@ -258,7 +256,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_modeset_setup.o \
 	i915-display/intel_modeset_verify.o \
 	i915-display/intel_panel.o \
-	i915-display/intel_pipe_crc.o \
 	i915-display/intel_pmdemand.o \
 	i915-display/intel_pps.o \
 	i915-display/intel_psr.o \
@@ -275,6 +272,13 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/skl_universal_plane.o \
 	i915-display/skl_watermark.o
 
+ifdef CONFIG_DEBUG_FS
+xe-$(CONFIG_DRM_XE_DISPLAY) += \
+	i915-display/intel_display_debugfs.o \
+	i915-display/intel_display_debugfs_params.o \
+	i915-display/intel_pipe_crc.o
+endif
+
 ifeq ($(CONFIG_ACPI),y)
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_acpi.o \
-- 
2.39.2

