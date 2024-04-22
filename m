Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E18ACAA3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9B6112985;
	Mon, 22 Apr 2024 10:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47848112987
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:30:48 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gauss.telenet-ops.be (Postfix) with ESMTPS id 4VNM392ckjz4x21m
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:30:45 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by laurent.telenet-ops.be with bizsmtp
 id EAWj2C0080SSLxL01AWjqq; Mon, 22 Apr 2024 12:30:45 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqw1-001cwD-BD;
 Mon, 22 Apr 2024 12:30:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqwd-005i3x-Bi;
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
Subject: [PATCH 07/11] Revert "drm: Switch DRM_DISPLAY_DP_HELPER to depends on"
Date: Mon, 22 Apr 2024 12:30:35 +0200
Message-Id: <89ac456805746b6d0c888f10c5120b11aacd3319.1713780345.git.geert+renesas@glider.be>
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

This reverts commit 0323287de87d7e6e9c22c57d7440aa353a2298d0, as helper
code should always be selected by the driver that needs it, for the
convenience of the final user configuring a kernel.

The user who configures a kernel should not need to know which helpers
are needed for the driver he is interested in.  Making a driver depend
on helper code means that the user needs to know which helpers to enable
first, which is very user-unfriendly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/Kconfig                 |  2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig      |  2 +-
 drivers/gpu/drm/bridge/Kconfig          | 10 +++++-----
 drivers/gpu/drm/bridge/analogix/Kconfig |  6 +++---
 drivers/gpu/drm/bridge/cadence/Kconfig  |  2 +-
 drivers/gpu/drm/display/Kconfig         |  1 -
 drivers/gpu/drm/exynos/Kconfig          |  2 +-
 drivers/gpu/drm/i915/Kconfig            |  2 +-
 drivers/gpu/drm/mediatek/Kconfig        |  2 +-
 drivers/gpu/drm/msm/Kconfig             |  2 +-
 drivers/gpu/drm/nouveau/Kconfig         |  2 +-
 drivers/gpu/drm/panel/Kconfig           |  8 ++++----
 drivers/gpu/drm/radeon/Kconfig          |  2 +-
 drivers/gpu/drm/rockchip/Kconfig        |  4 ++--
 drivers/gpu/drm/tegra/Kconfig           |  2 +-
 drivers/gpu/drm/xe/Kconfig              |  2 +-
 drivers/gpu/drm/xlnx/Kconfig            |  2 +-
 17 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 959b19a0410188d9..33792ca3eeb7ae8d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -75,11 +75,11 @@ config DRM_KUNIT_TEST_HELPERS
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
 	depends on DRM
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on KUNIT
 	depends on MMU
 	select DRM_BUDDY
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_GEM_SHMEM_HELPER
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index ba09121e7debb247..cf931b94a1889746 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -3,12 +3,12 @@
 config DRM_AMDGPU
 	tristate "AMD GPU"
 	depends on DRM
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
 	depends on !UML
 	select FW_LOADER
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index ad38cd201b006251..6015e2e4c2f620cf 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -93,9 +93,9 @@ config DRM_FSL_LDB
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on DRM_DISPLAY_DP_AUX_BUS
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select EXTCON
@@ -226,9 +226,9 @@ config DRM_PARADE_PS8622
 config DRM_PARADE_PS8640
 	tristate "Parade PS8640 MIPI DSI to eDP Converter"
 	depends on DRM_DISPLAY_DP_AUX_BUS
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
@@ -312,9 +312,9 @@ config DRM_TOSHIBA_TC358764
 
 config DRM_TOSHIBA_TC358767
 	tristate "Toshiba TC358767 eDP bridge"
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
@@ -335,9 +335,9 @@ config DRM_TOSHIBA_TC358768
 
 config DRM_TOSHIBA_TC358775
 	tristate "Toshiba TC358775 DSI/LVDS bridge"
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
@@ -381,9 +381,9 @@ config DRM_TI_SN65DSI83
 config DRM_TI_SN65DSI86
 	tristate "TI SN65DSI86 DSI to eDP bridge"
 	depends on DRM_DISPLAY_DP_AUX_BUS
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 9659df6718de6db4..ec98c94535736c0a 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_ANALOGIX_ANX6345
 	tristate "Analogix ANX6345 bridge"
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_ANALOGIX_DP
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
@@ -15,9 +15,9 @@ config DRM_ANALOGIX_ANX6345
 
 config DRM_ANALOGIX_ANX78XX
 	tristate "Analogix ANX78XX bridge"
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
@@ -34,9 +34,9 @@ config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_AUX_BUS
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_MIPI_DSI
 	help
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index 3480fd4d0a5f76e4..20143afded40e437 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -23,9 +23,9 @@ endif
 
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 9801f47a3704530d..0cd4396914224226 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -39,7 +39,6 @@ config DRM_DISPLAY_DP_AUX_CHARDEV
 config DRM_DISPLAY_DP_HELPER
 	bool "DRM DisplayPort Helpers"
 	depends on DRM_DISPLAY_HELPER
-	default y
 	help
 	  DRM display helpers for DisplayPort.
 
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 6a26a0b8eff2c021..4b0183bf221c8bb2 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -67,9 +67,9 @@ config DRM_EXYNOS_DSI
 config DRM_EXYNOS_DP
 	bool "Exynos specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
+	select DRM_DISPLAY_DP_HELPER
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index dbde4e29d93a79dc..43183a68a09557b7 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -2,7 +2,6 @@
 config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on X86 && PCI
 	depends on !PREEMPT_RT
@@ -12,6 +11,7 @@ config DRM_I915
 	# the shmem_readpage() which depends upon tmpfs
 	select SHMEM
 	select TMPFS
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 6caab8d4d4e0f5f8..2add54486ac4ab11 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -23,10 +23,10 @@ config DRM_MEDIATEK
 config DRM_MEDIATEK_DP
 	tristate "DRM DPTX Support for MediaTek SoCs"
 	depends on DRM_DISPLAY_DP_AUX_BUS
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on DRM_MEDIATEK
 	select PHY_MTK_DP
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  DRM/KMS Display Port driver for MediaTek SoCs.
 
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index f7708590583e7377..28a898722ace789b 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -6,7 +6,6 @@ config DRM_MSM
 	depends on COMMON_CLK
 	depends on DRM
 	depends on DRM_DISPLAY_DP_AUX_BUS
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on IOMMU_SUPPORT
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
@@ -17,6 +16,7 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 7cc305b2826d6abc..5ac852b816db262b 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -2,12 +2,12 @@
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
 	depends on DRM
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on PCI
 	depends on MMU
 	select IOMMU_API
 	select FW_LOADER
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_TTM
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ab67789e59a2e7a6..ed7949bebad812c9 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -545,10 +545,10 @@ config DRM_PANEL_RAYDIUM_RM68200
 config DRM_PANEL_RAYDIUM_RM692E5
 	tristate "Raydium RM692E5-based DSI panel"
 	depends on BACKLIGHT_CLASS_DEVICE
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on DRM_MIPI_DSI
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  Say Y here if you want to enable support for Raydium RM692E5-based
 	  display panels, such as the one found in the Fairphone 5 smartphone.
@@ -572,10 +572,10 @@ config DRM_PANEL_SAMSUNG_ATNA33XC20
 	tristate "Samsung ATNA33XC20 eDP panel"
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on DRM_DISPLAY_DP_AUX_BUS
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	depends on PM
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  DRM panel driver for the Samsung ATNA33XC20 panel. This panel can't
 	  be handled by the DRM_PANEL_SIMPLE driver because its power
@@ -812,11 +812,11 @@ config DRM_PANEL_EDP
 	tristate "support for simple Embedded DisplayPort panels"
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on DRM_DISPLAY_DP_AUX_BUS
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	depends on PM
 	select VIDEOMODE_HELPERS
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	help
 	  DRM panel driver for dumb eDP panels that need at most a regulator and
@@ -891,10 +891,10 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 config DRM_PANEL_VISIONOX_R66451
 	tristate "Visionox R66451"
 	depends on BACKLIGHT_CLASS_DEVICE
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on DRM_MIPI_DSI
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox
 	  R66451 1080x2340 AMOLED DSI panel.
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index 18c867219a706a17..07d330450f05f899 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -4,11 +4,11 @@ config DRM_RADEON
 	tristate "ATI Radeon"
 	depends on AGP || !AGP
 	depends on DRM
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on PCI
 	depends on MMU
 	select FW_LOADER
+	select DRM_DISPLAY_DP_HELPER
         select DRM_KMS_HELPER
 	select DRM_SUBALLOC_HELPER
         select DRM_TTM
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 4b49a14758fe0412..b72c0bbf346da5fa 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -35,9 +35,9 @@ config ROCKCHIP_VOP2
 
 config ROCKCHIP_ANALOGIX_DP
 	bool "Rockchip specific extensions for Analogix DP driver"
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on ROCKCHIP_VOP
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Analogix Core DP driver. If you want to enable DP
@@ -45,9 +45,9 @@ config ROCKCHIP_ANALOGIX_DP
 
 config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the cdn DP driver. If you want to enable Dp on
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index bb6e35261f1144b1..e0385d175ec6d266 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -5,9 +5,9 @@ config DRM_TEGRA
 	depends on COMMON_CLK
 	depends on DRM
 	depends on DRM_DISPLAY_DP_AUX_BUS
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 02da2faf5ae33bdb..be29e5cd5215e842 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -3,7 +3,6 @@ config DRM_XE
 	tristate "Intel Xe Graphics"
 	depends on (m || (y && KUNIT=y))
 	depends on DRM
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
@@ -18,6 +17,7 @@ config DRM_XE
 	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST != n
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 41d753b14ccd9574..7a14a8c2e7be9e59 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -4,12 +4,12 @@ config DRM_ZYNQMP_DPSUB
 	depends on COMMON_CLK
 	depends on DMADEVICES
 	depends on DRM
-	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	depends on PHY_XILINX_ZYNQMP
 	depends on XILINX_ZYNQMP_DPDMA
 	select DMA_ENGINE
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select GENERIC_PHY
-- 
2.34.1

