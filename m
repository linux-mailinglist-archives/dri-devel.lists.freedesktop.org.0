Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF46E5395
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D9710E5FB;
	Mon, 17 Apr 2023 21:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A4D10E5FA;
 Mon, 17 Apr 2023 21:05:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4726A62203;
 Mon, 17 Apr 2023 21:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83730C433D2;
 Mon, 17 Apr 2023 21:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681765528;
 bh=52CmbMWSGGlcsW0V31cEnaaOdCM0vYFCDeDCtkUevl0=;
 h=From:To:Cc:Subject:Date:From;
 b=GwWfpxW4bU6LZiq+Q8pr5OqGmmUa/5KdN85Ai8A0eDaznC0OnH4A/r02FYwzR9bbP
 UhmPxtE3k7+tEpJy4Zd3/k5hO0VYaF7pEK2HQMSvhmozzsh0Z8XZvHI5A4aWBRuTTm
 YT3IhkxDLQ6tIEpCyfj6XN+AeyKunLeafgyNZNFatfXlZFw5PKgT7wYDzKaX1JsHqK
 PgBc/4rOyZB1wrw3vEBeMDIIoZz0iEu7DNdQbe/H/VyYreGS6MHoYvIDMSpsWhJB81
 vhor1cAGc+wKO53K7B0DQhVKVozvCy51HCNxi2hub53JvXOeVD2fXSUJTuevUKcW4N
 ufmoTAICrFe1w==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/radeon: move prototypes to header
Date: Mon, 17 Apr 2023 23:04:50 +0200
Message-Id: <20230417210523.2553531-1-arnd@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Global functions in radeon_atpx_handler.c are not declared in a header
but instead in each file using them. This risks the types getting out
of sync and causes warnings:

drivers/gpu/drm/radeon/radeon_atpx_handler.c:64:6: error: no previous prototype for 'radeon_has_atpx' [-Werror=missing-prototypes]
drivers/gpu/drm/radeon/radeon_atpx_handler.c:68:6: error: no previous prototype for 'radeon_has_atpx_dgpu_power_cntl' [-Werror=missing-prototypes]
drivers/gpu/drm/radeon/radeon_atpx_handler.c:72:6: error: no previous prototype for 'radeon_is_atpx_hybrid' [-Werror=missing-prototypes]
drivers/gpu/drm/radeon/radeon_atpx_handler.c:76:6: error: no previous prototype for 'radeon_atpx_dgpu_req_power_for_displays' [-Werror=missing-prototypes]
drivers/gpu/drm/radeon/radeon_atpx_handler.c:594:6: error: no previous prototype for 'radeon_register_atpx_handler' [-Werror=missing-prototypes]
drivers/gpu/drm/radeon/radeon_atpx_handler.c:612:6: error: no previous prototype for 'radeon_unregister_atpx_handler' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/radeon/radeon.h              | 18 ++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_acpi.c         |  6 ------
 drivers/gpu/drm/radeon/radeon_atpx_handler.c |  1 +
 drivers/gpu/drm/radeon/radeon_device.c       |  8 --------
 drivers/gpu/drm/radeon/radeon_drv.c          | 13 -------------
 drivers/gpu/drm/radeon/radeon_kms.c          |  6 ------
 6 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 8afb03bbce29..74fb4dfc3e5e 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2964,6 +2964,24 @@ void radeon_irq_kms_set_irq_n_enabled(struct radeon_device *rdev,
 void radeon_audio_component_init(struct radeon_device *rdev);
 void radeon_audio_component_fini(struct radeon_device *rdev);
 
+/* atpx handler */
+#if defined(CONFIG_VGA_SWITCHEROO)
+bool radeon_has_atpx(void);
+void radeon_register_atpx_handler(void);
+void radeon_unregister_atpx_handler(void);
+bool radeon_has_atpx_dgpu_power_cntl(void);
+bool radeon_is_atpx_hybrid(void);
+bool radeon_atpx_dgpu_req_power_for_displays(void);
+#else
+static inline bool radeon_has_atpx(void) { return false; }
+static inline void radeon_register_atpx_handler(void) {}
+static inline void radeon_unregister_atpx_handler(void) {}
+static inline bool radeon_has_atpx_dgpu_power_cntl(void) { return false; }
+static inline bool radeon_is_atpx_hybrid(void) { return false; }
+static inline bool radeon_atpx_dgpu_req_power_for_displays(void) { return false; }
+#endif
+
+
 #include "radeon_object.h"
 
 #endif
diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 5771d1fcb073..695c673eb9f6 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -38,12 +38,6 @@
 #include "radeon_acpi.h"
 #include "radeon_pm.h"
 
-#if defined(CONFIG_VGA_SWITCHEROO)
-bool radeon_atpx_dgpu_req_power_for_displays(void);
-#else
-static inline bool radeon_atpx_dgpu_req_power_for_displays(void) { return false; }
-#endif
-
 #define ACPI_AC_CLASS           "ac_adapter"
 
 struct atif_verify_interface {
diff --git a/drivers/gpu/drm/radeon/radeon_atpx_handler.c b/drivers/gpu/drm/radeon/radeon_atpx_handler.c
index 6f93f54bf651..dfd30558f8e8 100644
--- a/drivers/gpu/drm/radeon/radeon_atpx_handler.c
+++ b/drivers/gpu/drm/radeon/radeon_atpx_handler.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 
 #include "radeon_acpi.h"
+#include "radeon.h"
 
 struct radeon_atpx_functions {
 	bool px_params;
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index afbb3a80c0c6..180f8aa971b4 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -113,14 +113,6 @@ static const char radeon_family_name[][16] = {
 	"LAST",
 };
 
-#if defined(CONFIG_VGA_SWITCHEROO)
-bool radeon_has_atpx_dgpu_power_cntl(void);
-bool radeon_is_atpx_hybrid(void);
-#else
-static inline bool radeon_has_atpx_dgpu_power_cntl(void) { return false; }
-static inline bool radeon_is_atpx_hybrid(void) { return false; }
-#endif
-
 #define RADEON_PX_QUIRK_DISABLE_PX  (1 << 0)
 
 struct radeon_px_quirk {
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index e4374814f0ef..d8d75b347678 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -128,19 +128,6 @@ int radeon_mode_dumb_create(struct drm_file *file_priv,
 			    struct drm_device *dev,
 			    struct drm_mode_create_dumb *args);
 
-/* atpx handler */
-#if defined(CONFIG_VGA_SWITCHEROO)
-void radeon_register_atpx_handler(void);
-void radeon_unregister_atpx_handler(void);
-bool radeon_has_atpx_dgpu_power_cntl(void);
-bool radeon_is_atpx_hybrid(void);
-#else
-static inline void radeon_register_atpx_handler(void) {}
-static inline void radeon_unregister_atpx_handler(void) {}
-static inline bool radeon_has_atpx_dgpu_power_cntl(void) { return false; }
-static inline bool radeon_is_atpx_hybrid(void) { return false; }
-#endif
-
 int radeon_no_wb;
 int radeon_modeset = -1;
 int radeon_dynclks = -1;
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index e0214cf1b43b..2a491381fb26 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -41,12 +41,6 @@
 #include "radeon_drv.h"
 #include "radeon_kms.h"
 
-#if defined(CONFIG_VGA_SWITCHEROO)
-bool radeon_has_atpx(void);
-#else
-static inline bool radeon_has_atpx(void) { return false; }
-#endif
-
 /**
  * radeon_driver_unload_kms - Main unload function for KMS.
  *
-- 
2.39.2

