Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C144DB7FE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 19:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0700110E92F;
	Wed, 16 Mar 2022 18:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390FF10E92F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 18:37:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91083618B8;
 Wed, 16 Mar 2022 18:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB06C340E9;
 Wed, 16 Mar 2022 18:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647455837;
 bh=AeOKmCyzq1uIA6ULnTh98t5emlpFl5gxplN7rmXD6BI=;
 h=From:To:Cc:Subject:Date:From;
 b=Qockax2Wfb9NicmpzRdcZsGmXxQ288gBYZ1jXZDnmCyNI5T0nA+duNoHrBT9avwLO
 cHBehu4dH8vAvxB1d87pIy4Ov4pfvc/FeQD3LLfMhNZl99EPVsAljonngYLtCErt97
 s7ctPZUnA2QYbgyE3OIQdB7AN1JngCj2OqJAXvFwXImb9nW5PA9va3OsazHqNgjWXv
 uTktlMJ7CTXLAyQllkKGDxrajDY0i55gUpl223flIJQXH+Unat1Lm0L1EQdkCHAp2+
 oAdoNjEusV0T7DUZFYsP+ojVz8hI3adWn3OWMrn55rr9XE/liQQSRJOUNKWiXIavGf
 jER51JVbhKioQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/panel: add CONFIG_DRM_KMS_HELPER dependencies
Date: Wed, 16 Mar 2022 19:36:46 +0100
Message-Id: <20220316183708.1505846-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@intel.com>, Dillon Min <dillon.minfei@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Deepak Rawat <drawat.floss@gmail.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The driver fails to build when the KMS helpers are disabled:

ld.lld: error: undefined symbol: drm_gem_fb_get_obj
>>> referenced by drm_mipi_dbi.c
>>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
>>> referenced by drm_mipi_dbi.c
>>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_fb_dirty) in archive drivers/built-in.a

ld.lld: error: undefined symbol: drm_gem_fb_begin_cpu_access
>>> referenced by drm_mipi_dbi.c
>>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a

ld.lld: error: undefined symbol: drm_fb_swab
>>> referenced by drm_mipi_dbi.c
>>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a

ld.lld: error: undefined symbol: drm_fb_xrgb8888_to_rgb565
>>> referenced by drm_mipi_dbi.c
>>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a

ld.lld: error: undefined symbol: drm_fb_memcpy
>>> referenced by drm_mipi_dbi.c
>>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a

This is fairly hard to hit in randconfig drivers, but it eventually
did trigger for me in a configuration where all other DRM drivers
are loadable modules, but DRM_PANEL_WIDECHIPS_WS2401 was built-in.

Adding a dependency in all drivers that select DRM_MIPI_DBI avoids
the problem for now, adding the dependency in DRM_MIPI_DBI as well
should help make it easier to figure out why it breaks if someone
forgets the dependency the next time.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/Kconfig       | 2 +-
 drivers/gpu/drm/panel/Kconfig | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

I see this warning on 5.17-rc8, but did not test it on linux-next,
which may already have a fix.


diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b1f22e457fd0..d5ec0b77c010 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -30,7 +30,7 @@ menuconfig DRM
 
 config DRM_MIPI_DBI
 	tristate
-	depends on DRM
+	depends on DRM_KMS_HELPER
 
 config DRM_MIPI_DSI
 	bool
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 0aec5a10b064..96887d0efb9f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -425,6 +425,7 @@ config DRM_PANEL_SAMSUNG_DB7430
 	tristate "Samsung DB7430-based DPI panels"
 	depends on OF && SPI && GPIOLIB
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_KMS_HELPER
 	select DRM_MIPI_DBI
 	help
 	  Say Y here if you want to enable support for the Samsung
@@ -440,6 +441,7 @@ config DRM_PANEL_SAMSUNG_S6D16D0
 config DRM_PANEL_SAMSUNG_S6D27A1
 	tristate "Samsung S6D27A1 DPI panel driver"
 	depends on OF && SPI && GPIOLIB
+	depends on DRM_KMS_HELPER
 	select DRM_MIPI_DBI
 	help
 	  Say Y here if you want to enable support for the Samsung
@@ -476,6 +478,7 @@ config DRM_PANEL_SAMSUNG_S6E63M0_SPI
 	depends on SPI
 	depends on DRM_PANEL_SAMSUNG_S6E63M0
 	default DRM_PANEL_SAMSUNG_S6E63M0
+	depends on DRM_KMS_HELPER
 	select DRM_MIPI_DBI
 	help
 	  Say Y here if you want to be able to access the Samsung
@@ -677,6 +680,7 @@ config DRM_PANEL_WIDECHIPS_WS2401
 	tristate "Widechips WS2401 DPI panel driver"
 	depends on SPI && GPIOLIB
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_KMS_HELPER
 	select DRM_MIPI_DBI
 	help
 	  Say Y here if you want to enable support for the Widechips WS2401 DPI
-- 
2.29.2

