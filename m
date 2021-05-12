Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A837C62A
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 17:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526E76EB9E;
	Wed, 12 May 2021 15:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07996EB9E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 15:50:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E740661DC4;
 Wed, 12 May 2021 15:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620834624;
 bh=t4YX8/qN2UX/zrjPPDRhrGURw2PpQ8cYVyrbNy9/jHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n0ItPV/o8En+dI46NdaCMzYRktCl3N256N7BxE7h/pyBZ3yV4NoT3AFvZEDncvORt
 G0q1FyJpwCKYt2e7jYNA28BL6e+PtwnhjubwrsVylwgw5MZK8NPVuq8x53pI+tow51
 9TZ3b/c0MBPhqvPYoD3Jibq66z9eXDyzL4lkhVaM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.12 019/677] drm: bridge: fix LONTIUM use of mipi_dsi_()
 functions
Date: Wed, 12 May 2021 16:41:05 +0200
Message-Id: <20210512144837.863754336@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512144837.204217980@linuxfoundation.org>
References: <20210512144837.204217980@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 stable@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Adren Grassein <adrien.grassein@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

commit ad085b3a712a89e4a48472121b231add7a8362e4 upstream.

The Lontium DRM bridge drivers use mipi_dsi_() function interfaces so
they need to select DRM_MIPI_DSI to prevent build errors.

ERROR: modpost: "mipi_dsi_attach" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "mipi_dsi_device_register_full" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "of_find_mipi_dsi_host_by_node" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "mipi_dsi_device_unregister" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "mipi_dsi_attach" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
ERROR: modpost: "mipi_dsi_device_register_full" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
ERROR: modpost: "of_find_mipi_dsi_host_by_node" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
ERROR: modpost: "mipi_dsi_device_unregister" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Adren Grassein <adrien.grassein@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Adrien Grassein <adrien.grassein@gmail.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210415183639.1487-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/bridge/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -67,6 +67,7 @@ config DRM_LONTIUM_LT9611UXC
 	depends on OF
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
 	select REGMAP_I2C
 	help
 	  Driver for Lontium LT9611UXC DSI to HDMI bridge
@@ -151,6 +152,7 @@ config DRM_SII902X
 	tristate "Silicon Image sii902x RGB/HDMI bridge"
 	depends on OF
 	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
 	select REGMAP_I2C
 	select I2C_MUX
 	select SND_SOC_HDMI_CODEC if SND_SOC
@@ -200,6 +202,7 @@ config DRM_TOSHIBA_TC358767
 	tristate "Toshiba TC358767 eDP bridge"
 	depends on OF
 	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
 	select REGMAP_I2C
 	select DRM_PANEL
 	help


