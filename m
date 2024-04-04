Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAC9898810
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 14:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ED511A2A3;
	Thu,  4 Apr 2024 12:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M1wILHmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D932211A2A3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 12:41:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AD8B1CE2A56;
 Thu,  4 Apr 2024 12:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4576C433C7;
 Thu,  4 Apr 2024 12:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712234468;
 bh=1+ARrgqOwE2kiq3eGjR0xYk+TKFwqS1s+JPGIlCRzrg=;
 h=From:To:Cc:Subject:Date:From;
 b=M1wILHmzWdiOAp7d8xIOgHHXhrz/7TiyaIV1N2+o2verXTbHYiqK0wiSsSsod5n86
 YbzkiBrkwthA4pFginyMapp29V66ueImtirbBSyRioo09xy5hhd7gYbfsy25QqkVSt
 uJODYi4DD/IJ1X0yu7ZUKpcc8qPAIjnyRgJxkD9LmBecKcvVN1Hnbao5N096v1ikp5
 llsQNqn9J+qKXXmzj+55bcTNNXm6Kg9wv5/mBPX/7bEy9vwng9+/gxQLNZzKJLUyFE
 0uGjsV5Ci0rgCkwpXuFYzqAgepspQCK/1lkFCHdbZvU7BSUcJD8CC2cTSM6XuF5vI6
 9RNZ4CHYRj8lA==
From: Arnd Bergmann <arnd@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH] drm: fix DRM_DISPLAY_DP_HELPER dependencies
Date: Thu,  4 Apr 2024 14:40:51 +0200
Message-Id: <20240404124101.2988099-1-arnd@kernel.org>
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

Both the exynos and rockchip drivers ran into link failures after
a Kconfig cleanup:

aarch64-linux-ld: drivers/gpu/drm/exynos/exynos_dp.o: in function `exynos_dp_resume':
exynos_dp.c:(.text+0xc0): undefined reference to `analogix_dp_resume'
aarch64-linux-ld: drivers/gpu/drm/exynos/exynos_dp.o: in function `exynos_dp_suspend':
exynos_dp.c:(.text+0xf4): undefined reference to `analogix_dp_suspend'

x86_64-linux-ld: drivers/gpu/drm/rockchip/cdn-dp-core.o: in function `cdn_dp_connector_mode_valid':
cdn-dp-core.c:(.text+0x13a): undefined reference to `drm_dp_bw_code_to_link_rate'
x86_64-linux-ld: cdn-dp-core.c:(.text+0x148): undefined reference to `drm_dp_bw_code_to_link_rate'
x86_64-linux-ld: drivers/gpu/drm/rockchip/cdn-dp-core.o: in function `cdn_dp_check_link_status':
cdn-dp-core.c:(.text+0x1396): undefined reference to `drm_dp_channel_eq_ok'

In both cases, the problem is that ROCKCHIP_CDN_DP and DRM_EXYNOS_DP
are 'bool' symbols that depend on the the 'tristate' DRM_DISPLAY_HELPER
symbol, but end up not working when the SoC specific part is built-in
but the helper is in a loadable module.

Use the same trick that DRM_ROCKCHIP already uses for the EXTCON
dependency and disallow DP support when it would not work.

Fixes: 0323287de87d ("drm: Switch DRM_DISPLAY_DP_HELPER to depends on")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/exynos/Kconfig   | 2 +-
 drivers/gpu/drm/rockchip/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 6a26a0b8eff2..58cd77220741 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -68,7 +68,7 @@ config DRM_EXYNOS_DP
 	bool "Exynos specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HELPER
+	depends on DRM_DISPLAY_HELPER=y || (DRM_DISPLAY_HELPER=m && DRM_EXYNOS=m)
 	select DRM_ANALOGIX_DP
 	default DRM_EXYNOS
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 4b49a14758fe..4b4ad75032fd 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -46,7 +46,7 @@ config ROCKCHIP_ANALOGIX_DP
 config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HELPER
+	depends on DRM_DISPLAY_HELPER=y || (DRM_DISPLAY_HELPER=m && DRM_ROCKCHIP=m)
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
 	help
 	  This selects support for Rockchip SoC specific extensions
-- 
2.39.2

