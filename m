Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD53806C0
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 12:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315A6E2C0;
	Fri, 14 May 2021 10:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22B36E2C0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 10:04:41 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lhUdv-0006Dg-MD; Fri, 14 May 2021 12:02:03 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lhUdi-0001XB-CF; Fri, 14 May 2021 12:01:50 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: Only select I2C_ALGOBIT for drivers that actually need it
Date: Fri, 14 May 2021 12:01:42 +0200
Message-Id: <20210514100142.1182997-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 dri-devel@lists.freedesktop.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 kernel@pengutronix.de, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 nouveau@lists.freedesktop.org, Tian Tao <tiantao6@hisilicon.com>,
 intel-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on a drm driver that doesn't need the i2c algobit stuff I
noticed that DRM selects this code even tough only 8 drivers actually use
it. While also only some drivers use i2c, keep the select for I2C for the
next cleanup patch. Still prepare this already by also selecting I2C for
the individual drivers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/Kconfig                 | 5 ++++-
 drivers/gpu/drm/ast/Kconfig             | 2 ++
 drivers/gpu/drm/gma500/Kconfig          | 2 ++
 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
 drivers/gpu/drm/i915/Kconfig            | 2 ++
 drivers/gpu/drm/mgag200/Kconfig         | 2 ++
 drivers/gpu/drm/nouveau/Kconfig         | 2 ++
 7 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3c16bd1afd87..351ea617c498 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -12,7 +12,6 @@ menuconfig DRM
 	select HDMI
 	select FB_CMDLINE
 	select I2C
-	select I2C_ALGOBIT
 	select DMA_SHARED_BUFFER
 	select SYNC_FILE
 # gallium uses SYS_kcmp for os_same_file_description() to de-duplicate
@@ -233,6 +232,8 @@ config DRM_RADEON
         select DRM_KMS_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
@@ -254,6 +255,8 @@ config DRM_AMDGPU
 	select DRM_SCHED
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
index fbcf2f45cef5..bcc25decd485 100644
--- a/drivers/gpu/drm/ast/Kconfig
+++ b/drivers/gpu/drm/ast/Kconfig
@@ -6,6 +6,8 @@ config DRM_AST
 	select DRM_VRAM_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	help
 	 Say yes for experimental AST GPU driver. Do not enable
 	 this driver without having a working -modesetting,
diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 0cff20265f97..e26c3a24955d 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -3,6 +3,8 @@ config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
 	select DRM_KMS_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
 	select ACPI_VIDEO if ACPI
 	select BACKLIGHT_CLASS_DEVICE if ACPI
diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
index 43943e980203..ac8c42dc79f6 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -6,6 +6,8 @@ config DRM_HISI_HIBMC
 	select DRM_VRAM_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	help
 	  Choose this option if you have a Hisilicon Hibmc soc chipset.
 	  If M is selected the module will be called hibmc-drm.
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 69f57ca9c68d..b3bb6f7cfbbc 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -13,6 +13,8 @@ config DRM_I915
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select RELAY
+	select I2C
+	select I2C_ALGOBIT
 	select IRQ_WORK
 	# i915 depends on ACPI_VIDEO when ACPI is enabled
 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index eec59658a938..b28c5e4828f4 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -4,6 +4,8 @@ config DRM_MGAG200
 	depends on DRM && PCI && MMU
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	help
 	 This is a KMS driver for Matrox G200 chips. It supports the original
 	 MGA G200 desktop chips and the server variants. It requires 0.3.0
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 9436310d0854..8823f0b24c73 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -7,6 +7,8 @@ config DRM_NOUVEAU
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
 	select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
 	select X86_PLATFORM_DEVICES if ACPI && X86

base-commit: 315d99318179b9cd5077ccc9f7f26a164c9fa998
-- 
2.30.2

