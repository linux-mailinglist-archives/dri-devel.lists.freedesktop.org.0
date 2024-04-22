Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5218ACAAB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB70112989;
	Mon, 22 Apr 2024 10:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5956511298A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:30:48 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4VNM394dh2z4x1PH
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:30:45 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by xavier.telenet-ops.be with bizsmtp
 id EAWj2C00J0SSLxL01AWjBK; Mon, 22 Apr 2024 12:30:45 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqw1-001cw2-7u;
 Mon, 22 Apr 2024 12:30:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqwd-005i3h-8F;
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
Subject: [PATCH 04/11] Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies"
Date: Mon, 22 Apr 2024 12:30:32 +0200
Message-Id: <df2876c72e82cbecfe8406fa058e8d3e895e4b93.1713780345.git.geert+renesas@glider.be>
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

This reverts commit d1ef8fc18be6adbbffdee06fbb5b33699e2852be, as the
commit it fixes will be reverted, too.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/exynos/Kconfig   | 2 +-
 drivers/gpu/drm/rockchip/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 58cd772207413e94..6a26a0b8eff2c021 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -68,7 +68,7 @@ config DRM_EXYNOS_DP
 	bool "Exynos specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HELPER=y || (DRM_DISPLAY_HELPER=m && DRM_EXYNOS=m)
+	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
 	default DRM_EXYNOS
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 4b4ad75032fda17e..4b49a14758fe0412 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -46,7 +46,7 @@ config ROCKCHIP_ANALOGIX_DP
 config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HELPER=y || (DRM_DISPLAY_HELPER=m && DRM_ROCKCHIP=m)
+	depends on DRM_DISPLAY_HELPER
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
 	help
 	  This selects support for Rockchip SoC specific extensions
-- 
2.34.1

