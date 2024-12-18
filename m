Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF639F608D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 09:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A923410EB03;
	Wed, 18 Dec 2024 08:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S+krT84w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4E710EB03
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 08:58:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 92CA4A41F29;
 Wed, 18 Dec 2024 08:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACC1C4CECE;
 Wed, 18 Dec 2024 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734512323;
 bh=M2Wyl4Lv1wHFs941v1P1F99J3xEnjWFBD0Qgq765OIM=;
 h=From:To:Cc:Subject:Date:From;
 b=S+krT84wnor5H/vWle8Z95MXfl65nY3TVBPY607j/TfWotnt7RRwKTyIjeLsKLPmK
 UW83mVu5r9tmTbrjy+7aWbqqdbQY1sg8OOzzUqwH0ZhRjRyGde5v1CNCVRp4rlLzbe
 1/X/SlXMvaJ71lttwKL0YlXC4H9wIEr+imrKm+xD1Rvy7bJKyAGcvMP0vO/HdqRaU9
 aF0VM/weLRcvsakdPPLJ7t7bsx3pC0uk5oRyilWnqMfOHwStnkRFjZhB4t7iZcxgdP
 ysxxbfYpGGPDy9wwBvkE9S/tUnVW5Uqvf0K7jh1ucVASrQCxY+WqyDV9tInYWdg1oW
 /EYuh7zsQNLMw==
From: Arnd Bergmann <arnd@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>, Chen-Yu Tsai <wenst@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: stop selecting foreign drivers
Date: Wed, 18 Dec 2024 09:58:31 +0100
Message-Id: <20241218085837.2670434-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

The PHY portion of the mediatek hdmi driver was originally part of
the driver it self and later split out into drivers/phy, which a
'select' to keep the prior behavior.

However, this leads to build failures when the PHY driver cannot
be built:

WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
  Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK [=y] && OF [=y] && REGULATOR [=n]
  Selected by [m]:
  - DRM_MEDIATEK_HDMI [=m] && HAS_IOMEM [=y] && DRM [=m] && DRM_MEDIATEK [=m]
ERROR: modpost: "devm_regulator_register" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!
ERROR: modpost: "rdev_get_drvdata" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!

The best option here is to just not select the phy driver and leave that
up to the defconfig. Do the same for the other PHY and memory drivers
selected here as well for consistency.

Fixes: a481bf2f0ca4 ("drm/mediatek: Separate mtk_hdmi_phy to an independent module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/mediatek/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 1c2f56b75716..1d4f20a4f265 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -15,9 +15,6 @@ config DRM_MEDIATEK
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_MIPI_DSI
 	select DRM_PANEL
-	select MEMORY
-	select MTK_SMI
-	select PHY_MTK_MIPI_DSI
 	select VIDEOMODE_HELPERS
 	help
 	  Choose this option if you have a Mediatek SoCs.
@@ -28,7 +25,6 @@ config DRM_MEDIATEK
 config DRM_MEDIATEK_DP
 	tristate "DRM DPTX Support for MediaTek SoCs"
 	depends on DRM_MEDIATEK
-	select PHY_MTK_DP
 	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
@@ -39,6 +35,5 @@ config DRM_MEDIATEK_HDMI
 	tristate "DRM HDMI Support for Mediatek SoCs"
 	depends on DRM_MEDIATEK
 	select SND_SOC_HDMI_CODEC if SND_SOC
-	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
-- 
2.39.5

