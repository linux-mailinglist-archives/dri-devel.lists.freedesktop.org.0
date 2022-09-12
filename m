Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65835B5702
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 11:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D716A10E32B;
	Mon, 12 Sep 2022 09:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678BA10E32B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 09:15:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oXfX7-0002BK-BY; Mon, 12 Sep 2022 11:15:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oXfX7-000GxH-3n; Mon, 12 Sep 2022 11:15:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oXfX4-000Lai-NC; Mon, 12 Sep 2022 11:15:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
Date: Mon, 12 Sep 2022 11:15:05 +0200
Message-Id: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4944;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=j5JW+lxROfKB8+sCuEs4tpyGDprVgABTFHFqCy/1dAQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjHviV+rc3xvRsOSbznXYoRiyhHcMD3kHViqVTzr+e
 rVVGIq6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYx74lQAKCRDB/BR4rcrsCQM7CA
 CbkRLi0JvstApueqW6hfTaJEbfNDgTgiqFMD//4/p3aD3Epe7y28VhcZFKa/h0p1rPdNGCX/S9skvk
 AA5dXboTsQdkeg36el2IwKfeGrXOWCDxcKDCn3QP31SEdlvERtfn2ASWjM221K5N5F6BPfc95zELOS
 8We2daTMr6/Ltyhb5wRItgiXbpWK6VxSlqapaG7JvrFMG+NFcjVWJuMgb+3n0h2yP23lPpnOLzM8mT
 vxXpsDTGBVx7101GwhJmnVTgTUzJCrxaJADcxEtbdUR/8rXcJgyy/CnQnYh1YTyBUrht068wd+y4Bt
 QwQfzJ2AegMOCIWkDxeoyKohfDmJTU
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on a drm driver that doesn't need the i2c algobit stuff I
noticed that DRM selects this code even tough only 8 drivers actually use
it. While also only some drivers use i2c, keep the select for I2C for the
next cleanup patch. Still prepare this already by also selecting I2C for
the individual drivers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since v1
(20210514100142.1182997-1-u.kleine-koenig@pengutronix.de) from
2021-05-14:

 - rebased to next-20220909
   was something around v5.13-rc2 before, required to fix context
   changes in the nouveau Kconfig file. git am -3 handled it just fine.

I reverified that no new drivers were added that need a corresponding
select.

Best regards
Uwe

 drivers/gpu/drm/Kconfig                 | 5 ++++-
 drivers/gpu/drm/ast/Kconfig             | 2 ++
 drivers/gpu/drm/gma500/Kconfig          | 2 ++
 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
 drivers/gpu/drm/i915/Kconfig            | 2 ++
 drivers/gpu/drm/mgag200/Kconfig         | 2 ++
 drivers/gpu/drm/nouveau/Kconfig         | 2 ++
 7 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 198ba846d34b..593d7335b10a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -13,7 +13,6 @@ menuconfig DRM
 	select HDMI
 	select FB_CMDLINE
 	select I2C
-	select I2C_ALGOBIT
 	select DMA_SHARED_BUFFER
 	select SYNC_FILE
 # gallium uses SYS_kcmp for os_same_file_description() to de-duplicate
@@ -231,6 +230,8 @@ config DRM_RADEON
         select DRM_KMS_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
+	select I2C
+	select I2C_ALGOBIT
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
@@ -262,6 +263,8 @@ config DRM_AMDGPU
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
index 073adfe438dd..90b9e6cce49c 100644
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
-- 
2.37.2

