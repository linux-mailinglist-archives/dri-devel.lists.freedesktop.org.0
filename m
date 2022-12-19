Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C426508A9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 09:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48D510E206;
	Mon, 19 Dec 2022 08:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A87E10E206
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:39:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7BdX-00055t-G9; Mon, 19 Dec 2022 09:36:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7BdS-000I7t-UR; Mon, 19 Dec 2022 09:36:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7BdS-006GXR-8z; Mon, 19 Dec 2022 09:36:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Dave Airlie <airlied@redhat.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <jstultz@google.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v3] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
Date: Mon, 19 Dec 2022 09:36:27 +0100
Message-Id: <20221219083627.1401627-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5224;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ZqfFbvgJpMyKVKFmiZCYnPmobkFNQjvPehywec6oyBE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjoCKHEJAtYyv1GKjnjBFZ0ZCBl4J5k3935lB4hMVw
 9i3WuFyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY6AihwAKCRDB/BR4rcrsCcixB/
 9hHo0+rNOd9s5KE7RHOsnO3muEbuMyw3QJhVVfVboODKLwdKCmjvBrrjRCG61slD4Xm5T6TnhZ0rHY
 gEaIra20QAEkhbb1rDBig3igiMCvo3TOSg07DiOfbJAQivllRgTvvYZ5Sta55/ipBt58svNiQpdkd3
 7hvV5XzAXzK6RNL6H1tg71K2M2RI0AFI4rdJf2ACrubw/fAc/lHKxy8CxO0GjqhRvGrsG0TAfiQdYA
 /ghQjMcj3J4H4XapZ8XwJJSJlhSHIxh/VU1kzB6AEuA4U8z03CU829UClkJGz6lASW97FQXMzKoZJ+
 rwf5wKvKN0Jn6M68TphEMosYDhGEHP
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
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
Cc: kernel@pengutronix.de, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on a drm driver that doesn't need the i2c algobit stuff I
noticed that DRM selects this code even though only 8 drivers actually use
it. While also only some drivers use i2c, keep the select for I2C for the
next cleanup patch. Still prepare this already by also selecting I2C for
the individual drivers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/Kconfig                 | 1 -
 drivers/gpu/drm/amd/amdgpu/Kconfig      | 2 ++
 drivers/gpu/drm/ast/Kconfig             | 2 ++
 drivers/gpu/drm/gma500/Kconfig          | 2 ++
 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
 drivers/gpu/drm/i915/Kconfig            | 2 ++
 drivers/gpu/drm/mgag200/Kconfig         | 2 ++
 drivers/gpu/drm/nouveau/Kconfig         | 2 ++
 drivers/gpu/drm/radeon/Kconfig          | 2 ++
 9 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 315cbdf61979..93c732a8f870 100644
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
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 5fcd510f1abb..5341b6b242c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -13,6 +13,8 @@ config DRM_AMDGPU
 	select DRM_TTM_HELPER
 	select POWER_SUPPLY
 	select HWMON
+	select I2C
+	select I2C_ALGOBIT
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
 	select DRM_BUDDY
diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
index d367a90cd3de..563fa7a3b546 100644
--- a/drivers/gpu/drm/ast/Kconfig
+++ b/drivers/gpu/drm/ast/Kconfig
@@ -4,6 +4,8 @@ config DRM_AST
 	depends on DRM && PCI && MMU
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	help
 	 Say yes for experimental AST GPU driver. Do not enable
 	 this driver without having a working -modesetting,
diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 807b989e3c77..2efc0eb41c64 100644
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
index 4e41c144a290..126504318a4f 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -7,6 +7,8 @@ config DRM_HISI_HIBMC
 	select DRM_VRAM_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	help
 	  Choose this option if you have a Hisilicon Hibmc soc chipset.
 	  If M is selected the module will be called hibmc-drm.
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 3efce05d7b57..c6e3792622f2 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -18,6 +18,8 @@ config DRM_I915
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
index 03d12caf9e26..a0bb3987bf63 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -10,6 +10,8 @@ config DRM_NOUVEAU
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
 	select X86_PLATFORM_DEVICES if ACPI && X86
 	select ACPI_WMI if ACPI && X86
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index 97a277f9a25e..62a596d3a891 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -15,6 +15,8 @@ config DRM_RADEON
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
+	select I2C
+	select I2C_ALGOBIT
 	# radeon depends on ACPI_VIDEO when ACPI is enabled, for select to work
 	# ACPI_VIDEO's dependencies must also be selected.
 	select INPUT if ACPI

base-commit: ca39c4daa6f7f770b1329ffb46f1e4a6bcc3f291
-- 
2.38.1

