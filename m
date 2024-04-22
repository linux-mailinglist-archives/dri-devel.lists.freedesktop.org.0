Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281918ACAAA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C689112988;
	Mon, 22 Apr 2024 10:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35438112980
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:30:48 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4VNM394ccdz4wwnT
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:30:45 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by xavier.telenet-ops.be with bizsmtp
 id EAWj2C00T0SSLxL01AWjBQ; Mon, 22 Apr 2024 12:30:45 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqw1-001cwL-D6;
 Mon, 22 Apr 2024 12:30:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqwd-005i47-EC;
 Mon, 22 Apr 2024 12:30:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/11] Revert "drm: Switch DRM_DISPLAY_HELPER to depends on"
Date: Mon, 22 Apr 2024 12:30:37 +0200
Message-Id: <1ba76cc4d96a8afefff5d1bc42fb1e1329c5da68.1713780345.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713780345.git.geert+renesas@glider.be>
References: <cover.1713780345.git.geert+renesas@glider.be>
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

This reverts commit e075e496f516bf92bc0cbaf94d64e8d4a6b58321, as helper
code should always be selected by the driver that needs it, for the
convenience of the final user configuring a kernel.

The user who configures a kernel should not need to know which helpers
are needed for the driver he is interested in.  Making a driver depend
on helper code means that the user needs to know which helpers to enable
first, which is very user-unfriendly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/Kconfig                 |  6 ++----
 drivers/gpu/drm/amd/amdgpu/Kconfig      |  6 ++----
 drivers/gpu/drm/bridge/Kconfig          | 10 +++++-----
 drivers/gpu/drm/bridge/analogix/Kconfig |  6 +++---
 drivers/gpu/drm/bridge/cadence/Kconfig  |  4 ++--
 drivers/gpu/drm/bridge/synopsys/Kconfig |  2 +-
 drivers/gpu/drm/display/Kconfig         |  1 -
 drivers/gpu/drm/exynos/Kconfig          |  2 +-
 drivers/gpu/drm/i915/Kconfig            |  2 +-
 drivers/gpu/drm/mediatek/Kconfig        |  2 +-
 drivers/gpu/drm/msm/Kconfig             |  4 ++--
 drivers/gpu/drm/nouveau/Kconfig         |  6 ++----
 drivers/gpu/drm/panel/Kconfig           | 20 ++++++++++----------
 drivers/gpu/drm/radeon/Kconfig          |  6 ++----
 drivers/gpu/drm/rockchip/Kconfig        |  4 ++--
 drivers/gpu/drm/tegra/Kconfig           |  2 +-
 drivers/gpu/drm/vc4/Kconfig             |  8 ++++----
 drivers/gpu/drm/xe/Kconfig              |  7 ++-----
 drivers/gpu/drm/xlnx/Kconfig            |  6 ++----
 19 files changed, 45 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 33792ca3eeb7ae8d..bf4020915e299861 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -74,12 +74,10 @@ config DRM_KUNIT_TEST_HELPERS
 
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on KUNIT
-	depends on MMU
+	depends on DRM && KUNIT && MMU
 	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_GEM_SHMEM_HELPER
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index cf931b94a1889746..22d88f8ef5279a0f 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -2,15 +2,13 @@
 
 config DRM_AMDGPU
 	tristate "AMD GPU"
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on MMU
-	depends on PCI
+	depends on DRM && PCI && MMU
 	depends on !UML
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_SCHED
 	select DRM_TTM
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a51ad2b3a0fb01e2..f71d57216ae0602a 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -92,10 +92,10 @@ config DRM_FSL_LDB
 
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select EXTCON
@@ -225,9 +225,9 @@ config DRM_PARADE_PS8622
 
 config DRM_PARADE_PS8640
 	tristate "Parade PS8640 MIPI DSI to eDP Converter"
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
@@ -312,9 +312,9 @@ config DRM_TOSHIBA_TC358764
 
 config DRM_TOSHIBA_TC358767
 	tristate "Toshiba TC358767 eDP bridge"
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
@@ -335,9 +335,9 @@ config DRM_TOSHIBA_TC358768
 
 config DRM_TOSHIBA_TC358775
 	tristate "Toshiba TC358775 DSI/LVDS bridge"
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
@@ -380,9 +380,9 @@ config DRM_TI_SN65DSI83
 
 config DRM_TI_SN65DSI86
 	tristate "TI SN65DSI86 DSI to eDP bridge"
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 16d18dde483ae9c4..4846b2e9be7c2a5d 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_ANALOGIX_ANX6345
 	tristate "Analogix ANX6345 bridge"
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_ANALOGIX_DP
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
@@ -15,9 +15,9 @@ config DRM_ANALOGIX_ANX6345
 
 config DRM_ANALOGIX_ANX78XX
 	tristate "Analogix ANX78XX bridge"
-	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
@@ -33,10 +33,10 @@ config DRM_ANALOGIX_DP
 config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_MIPI_DSI
 	help
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index 20143afded40e437..cced81633ddcda03 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -23,12 +23,12 @@ endif
 
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
-	depends on DRM_DISPLAY_HELPER
-	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
+	depends on OF
 	help
 	  Support Cadence DPI to DP bridge. This is an internal
 	  bridge and is meant to be directly embedded in a SoC.
diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index f366ece471462a70..15fc182d05ef02e6 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_DW_HDMI
 	tristate
-	depends on DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_MMIO
 	select CEC_CORE if CEC_NOTIFIER
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index cffa2acdbc6c0988..c77e7f85bd674dc9 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -3,7 +3,6 @@
 config DRM_DISPLAY_HELPER
 	tristate "DRM Display Helpers"
 	depends on DRM
-	default y
 	help
 	  DRM helpers for display adapters.
 
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 4b0183bf221c8bb2..733b109a509525f7 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -4,6 +4,7 @@ config DRM_EXYNOS
 	depends on OF && DRM && COMMON_CLK
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	depends on MMU
+	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
@@ -67,7 +68,6 @@ config DRM_EXYNOS_DSI
 config DRM_EXYNOS_DP
 	bool "Exynos specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
-	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
 	select DRM_DISPLAY_DP_HELPER
 	default DRM_EXYNOS
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 43183a68a09557b7..5932024f8f9547e5 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -2,7 +2,6 @@
 config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
-	depends on DRM_DISPLAY_HELPER
 	depends on X86 && PCI
 	depends on !PREEMPT_RT
 	select INTEL_GTT if X86
@@ -14,6 +13,7 @@ config DRM_I915
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 50bb28327f65fbf5..96cbe020f493ab19 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -22,9 +22,9 @@ config DRM_MEDIATEK
 
 config DRM_MEDIATEK_DP
 	tristate "DRM DPTX Support for MediaTek SoCs"
-	depends on DRM_DISPLAY_HELPER
 	depends on DRM_MEDIATEK
 	select PHY_MTK_DP
+	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	help
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 2055266506e5adf0..27d72ed8b3896b64 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -2,10 +2,9 @@
 
 config DRM_MSM
 	tristate "MSM DRM"
+	depends on DRM
 	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
 	depends on COMMON_CLK
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
 	depends on IOMMU_SUPPORT
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
@@ -17,6 +16,7 @@ config DRM_MSM
 	select REGULATOR
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 5ac852b816db262b..ceef470c9fbfcfb0 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -1,14 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on PCI
-	depends on MMU
+	depends on DRM && PCI && MMU
 	select IOMMU_API
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 5073c45481d55821..1b70ebba9571d29f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -544,11 +544,11 @@ config DRM_PANEL_RAYDIUM_RM68200
 
 config DRM_PANEL_RAYDIUM_RM692E5
 	tristate "Raydium RM692E5-based DSI panel"
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on DRM_DISPLAY_HELPER
-	depends on DRM_MIPI_DSI
 	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Raydium RM692E5-based
 	  display panels, such as the one found in the Fairphone 5 smartphone.
@@ -570,11 +570,11 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
 
 config DRM_PANEL_SAMSUNG_ATNA33XC20
 	tristate "Samsung ATNA33XC20 eDP panel"
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	help
 	  DRM panel driver for the Samsung ATNA33XC20 panel. This panel can't
@@ -810,12 +810,12 @@ config DRM_PANEL_STARTEK_KD070FHFID015
 
 config DRM_PANEL_EDP
 	tristate "support for simple Embedded DisplayPort panels"
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
 	select VIDEOMODE_HELPERS
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	help
@@ -890,11 +890,11 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 
 config DRM_PANEL_VISIONOX_R66451
 	tristate "Visionox R66451"
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on DRM_DISPLAY_HELPER
-	depends on DRM_MIPI_DSI
 	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox
 	  R66451 1080x2340 AMOLED DSI panel.
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index 07d330450f05f899..f98356be0af288f5 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -2,13 +2,11 @@
 
 config DRM_RADEON
 	tristate "ATI Radeon"
+	depends on DRM && PCI && MMU
 	depends on AGP || !AGP
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on PCI
-	depends on MMU
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
         select DRM_KMS_HELPER
 	select DRM_SUBALLOC_HELPER
         select DRM_TTM
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index b72c0bbf346da5fa..0d5260e10f272d3b 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -35,8 +35,8 @@ config ROCKCHIP_VOP2
 
 config ROCKCHIP_ANALOGIX_DP
 	bool "Rockchip specific extensions for Analogix DP driver"
-	depends on DRM_DISPLAY_HELPER
 	depends on ROCKCHIP_VOP
+	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
@@ -45,8 +45,8 @@ config ROCKCHIP_ANALOGIX_DP
 
 config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
-	depends on DRM_DISPLAY_HELPER
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
+	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 44381ee6ea9e36f7..782f51d3044af1fc 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -4,10 +4,10 @@ config DRM_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
-	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 98772a6b5bf0df54..91dcf8d174d6c6e1 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -2,15 +2,15 @@
 config DRM_VC4
 	tristate "Broadcom VC4 Graphics"
 	depends on ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST
-	depends on COMMON_CLK
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on PM
 	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
 	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
 	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
+	depends on DRM
 	depends on SND && SND_SOC
+	depends on COMMON_CLK
+	depends on PM
 	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index be29e5cd5215e842..1a556d087e63c30f 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,11 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 	tristate "Intel Xe Graphics"
-	depends on (m || (y && KUNIT=y))
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on MMU
-	depends on PCI
+	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
@@ -20,6 +16,7 @@ config DRM_XE
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_MIPI_DSI
 	select RELAY
 	select IRQ_WORK
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 7a14a8c2e7be9e59..68ee897de9d75884 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -1,15 +1,13 @@
 config DRM_ZYNQMP_DPSUB
 	tristate "ZynqMP DisplayPort Controller Driver"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
-	depends on COMMON_CLK
+	depends on COMMON_CLK && DRM && OF
 	depends on DMADEVICES
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on OF
 	depends on PHY_XILINX_ZYNQMP
 	depends on XILINX_ZYNQMP_DPDMA
 	select DMA_ENGINE
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select GENERIC_PHY
-- 
2.34.1

